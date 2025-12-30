unit UDocList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, IniFiles, DB, System.UITypes,
  Data.Win.ADODB;

type
  TFDocList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BBClose: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    D_To: TDateTimePicker;
    D_From: TDateTimePicker;
    BBRefresh: TBitBtn;
    BBSetting: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    CB_AllType: TCheckBox;
    Label2: TLabel;
    ShapePRRO: TShape;
    BBDocReport: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBSettingClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBRefreshClick(Sender: TObject);
    procedure D_FromChange(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBDocReportClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    id_doclisttype:longint;

    ID_NAKLCAP:longint;
    CarentFieldSeach:string;
    iniFile:TIniFile;


    procedure ReopenQ;
    procedure FoundNakl(v_ID_NAKLCAP:longint);


  end;

var
  FDocList: TFDocList;
  function FDocList_dlg(v_id_doclisttype:integer; var vID_DOC_PROTOTYPE:longInt):integer;

implementation
uses UDataModule1, UMainForm, myfuncs, Reason_del, users_f, USaleDoc, DocReport;
{$R *.dfm}


function FDocList_dlg(v_id_doclisttype:integer; var vID_DOC_PROTOTYPE:longInt):integer;
begin
 FDocList:=TFDocList.Create(Application);
 with FDocList do
 begin
  try
    id_doclisttype:=v_id_doclisttype;
    DM1.QDocType_info.Close;
    DM1.QDocType_info.Parameters.ParamByName('ID_DT').Value:=id_doclisttype;
    DM1.QDocType_info.Open;
    Caption:=DM1.QDocType_info.FieldByName('NAMEDOC').AsString;
    DM1.QDocType_info.Close;

    result:=ShowModal;
    if result=mrOk then
     vID_DOC_PROTOTYPE:=ID_NAKLCAP
    else vID_DOC_PROTOTYPE:= -1;

  finally
   FreeAndNil(FDocList);
  end;
 end;
end;



procedure TFDocList.ReopenQ;
begin
  DM1.QDocList.Close;
  DM1.QDocList.Parameters.ParamByName('IDDT').Value :=id_doclisttype;
  DM1.QDocList.Parameters.ParamByName('DFROM').Value :=D_from.Date;
  DM1.QDocList.Parameters.ParamByName('DTO').Value :=D_To.Date;
  DM1.QDocList.Open;
  (*
  if id_doclisttype=200 then   // продажи
  begin
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
    begin
      DM1.QDocList.Filtered:=True;
      DM1.QDocList.Filter:= '(IS_REGISTER_RRO=1)';
      ShapePRRO.Brush.Color:=clRed;
    end
    else
    begin
      DM1.QDocList.Filtered:=False;
      DM1.QDocList.Filter:= '';
      ShapePRRO.Brush.Color:=clGreen;
    end;
    end;
   *)
end;

procedure TFDocList.FoundNakl(v_ID_NAKLCAP:longint);
begin
with DM1.QDocList do
begin
 DisableControls;
 ReopenQ;
 locate('ID_NAKLCAP', v_ID_NAKLCAP, [loCaseInsensitive]);
 EnableControls;
end;
end;



procedure TFDocList.BBDocReportClick(Sender: TObject);
begin
  ID_NAKLCAP:=DM1.QDocList.FieldByName('ID_NAKLCAP').AsInteger;
  F_DocReportDlg(ID_NAKLCAP);
  FoundNakl(ID_NAKLCAP);

end;

procedure TFDocList.BBRefreshClick(Sender: TObject);
begin
  ID_NAKLCAP:=DM1.QDocList.FieldByName('ID_NAKLCAP').AsInteger;
  FoundNakl(ID_NAKLCAP);
end;

procedure TFDocList.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.QDocList.DisableControls;
 with DM1.QDocList do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.QDocList.EnableControls;

end;

procedure TFDocList.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.QDocList.DisableControls;
 with DM1.QDocList do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.QDocList.EnableControls;

end;


procedure TFDocList.BBSettingClick(Sender: TObject);
begin
    // сохранить настройки колонок DbGrid1 в секцию  'nakllist_f'  Ini файла
 SaveColumnPosToIni(DbGrid1, 'nakllist_f');
end;

procedure TFDocList.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TFDocList.CheckBox2Click(Sender: TObject);
var s:string;
ft:TFieldType;
begin
 DBGrid1.DataSource.DataSet.Filtered:=CheckBox2.Checked;
 s:= Trim(Edit1.Text);
 if CheckBox2.Checked then
 begin
  if s<>'' then
  begin
   ft:=DBGrid1.DataSource.DataSet.FieldByName(CarentFieldSeach).DataType;
   if ft=ftWideString then
   begin
     s:='('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+s+'%') + ')';
   end
   else
   begin
     s:=CarentFieldSeach+s;
   end;


    DBGrid1.DataSource.DataSet.Filter := s;



  end // if s<>'' then
  else CheckBox2.Checked:=False;
 end
 else DBGrid1.DataSource.DataSet.Filter :='';

end;

procedure TFDocList.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 end;

end;

procedure TFDocList.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.FieldName='is_final_doc' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('IS_FINAL').AsInteger=0 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TFDocList.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(DM1.QDocList).IndexFieldNames:=CarentFieldSeach;
end;

procedure TFDocList.D_FromChange(Sender: TObject);
begin
 F_main.D_from.DateTime:=D_From.DateTime;
 F_main.D_to.DateTime:=D_To.DateTime;
 ReopenQ;
end;

procedure TFDocList.Edit1Change(Sender: TObject);
begin
try
 if ((not CheckBox1.Checked) and (not CheckBox2.Checked)) then
  DM1.QDocList.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey, loCaseInsensitive]);
except
 ;
end;
end;

procedure TFDocList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if modalResult=mrOk then
  begin
    if DM1.QDocList.RecordCount>0 then
        ID_NAKLCAP:=DM1.QDocList.FieldByName('ID_NAKLCAP').AsInteger
    else  ID_NAKLCAP:=-1;
  end
  else ID_NAKLCAP:=-1;

end;

procedure TFDocList.FormCreate(Sender: TObject);
begin
  D_From.Date:=F_main.D_Work.Date;
  D_To.Date:=F_main.D_Work.Date;
  ID_NAKLCAP:=-1;
  BBSearchUp.Enabled:= CheckBox1.Checked;
  BBSearchDown.Enabled := BBSearchUp.Enabled;



end;

procedure TFDocList.FormShow(Sender: TObject);
begin
  if id_doclisttype=200 then   // продажи
  begin
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
    begin
      ShapePRRO.Brush.Color:=clRed;
    end
    else
    begin
      ShapePRRO.Brush.Color:=clGreen;
    end;
  end;
  ReopenQ;
  CarentFieldSeach:='D';
  TADODataSet(DM1.QDocList).IndexFieldNames:=CarentFieldSeach;

  ReadColumnPosFromIni(DbGrid1, 'SaleDocList');
  Edit1.SetFocus;
end;

end.
