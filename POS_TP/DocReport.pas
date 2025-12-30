unit DocReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask;

type
  TF_DocReport = class(TForm)
    QDocRepotr: TADOQuery;
    DSQDocRepotr: TDataSource;
    QDocRepotrS_INV: TFloatField;
    QDocRepotrN_INV: TFloatField;
    QDocRepotrS_KOLBASA: TFloatField;
    QDocRepotrSN_KOLBASA: TFloatField;
    QDocRepotrS_MYASO: TFloatField;
    QDocRepotrSN_MYASO: TFloatField;
    QDocRepotrS_TNP: TFloatField;
    QDocRepotrSN_TNP: TFloatField;
    Q_Detail_Tov: TADOQuery;
    DS_Q_Detail_Tov: TDataSource;
    Q_Detail_TovGRUPTOV: TWideStringField;
    Q_Detail_TovTOV_NAME: TWideStringField;
    Q_Detail_TovEDIZM: TWideStringField;
    Q_Detail_TovNUMB: TFloatField;
    Q_Detail_TovPRICE: TFloatField;
    Q_Detail_TovSU: TFloatField;
    Panel2: TPanel;
    Panel3: TPanel;
    RG_Sverka: TRadioGroup;
    GroupBox5: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Q_Detail_TovID_TOV: TIntegerField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    QDocRepotrDD: TDateTimeField;
    QDocRepotrNN: TWideStringField;
    QDocRepotrSS: TFloatField;
    QDocRepotrCOMMENT: TWideStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    QDocRepotrNAME_DOC: TWideStringField;
    QDocRepotrID_CHAR_DOC: TIntegerField;
    QDocRepotrIS_FINAL: TIntegerField;
    BBClose: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    L_not_final: TLabel;
    GroupBox3: TGroupBox;
    DBText9: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    DBText10: TDBText;
    GroupBox4: TGroupBox;
    DBText12: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    DBText13: TDBText;
    GroupBox2: TGroupBox;
    DBText6: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText7: TDBText;
    GroupBox1: TGroupBox;
    DBTextS_2KAT: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn2: TBitBtn;
    BB_Final: TBitBtn;
    procedure BBCloseClick(Sender: TObject);
    procedure RG_SverkaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_NAKLCAP:longint;
    CarentFieldSeach:string;
  end;

var
  F_DocReport: TF_DocReport;
  function  F_DocReportDlg(vID_NAKLCAP:longint):integer;

implementation

{$R *.dfm}



uses  UMainForm, UDataModule1, USERS_F, Print_Functions, myfuncs;

function  F_DocReportDlg(vID_NAKLCAP:longint):integer;
//var Save_Cursor:TCursor;
begin
//  Save_Cursor:=Screen.Cursor;
//  Screen.Cursor := crSQLWait;
 F_DocReport:=TF_DocReport.Create(Application);
 with F_DocReport do
 begin
  ID_NAKLCAP:=vID_NAKLCAP;
  try

    with QDocRepotr do
    begin
      DisableControls;
      Close;
      Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
      Open;
      EnableControls;

    end;
    with Q_Detail_Tov do
    begin
      DisableControls;
      Close;
      Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
      Open;
      EnableControls;

    end;

   // Screen.Cursor := Save_Cursor;
   result:=ShowModal;
  finally
   QDocRepotr.Close;
   Q_Detail_Tov.Close;
   FreeAndNil(F_DocReport);
  end;
 end;
end;


procedure TF_DocReport.BBCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TF_DocReport.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 Q_Detail_Tov.DisableControls;
 with Q_Detail_Tov do
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
   MessageDlg('«апись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 Q_Detail_Tov.EnableControls;

end;


procedure TF_DocReport.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 Q_Detail_Tov.DisableControls;
 with Q_Detail_Tov do
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
   MessageDlg('«апись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 Q_Detail_Tov.EnableControls;

end;

procedure TF_DocReport.BitBtn2Click(Sender: TObject);
begin
  Print_Cash_ReceiptWithRegisterRRO( ID_NAKLCAP, true, 0, '' ); // здесь вывод на печать чека
end;

procedure TF_DocReport.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_DocReport.CheckBox2Click(Sender: TObject);
var s, s_from, s_to:string;
ft:TFieldType;
begin
 DBGrid1.DataSource.DataSet.Filtered:=CheckBox2.Checked;
 s:= Trim(Edit1.Text);
 if CheckBox2.Checked then
 begin
  if s<>'' then
  begin
   ft:=DBGrid1.DataSource.DataSet.FieldByName(CarentFieldSeach).DataType;
   if (ft=ftWideString) then
   begin
     s:='('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+s+'%') + ')';
   end
   else
   begin
    if ft=ftFloat then
    begin
      s:=StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      s_from:=FloatToStr(StrToFloat(s)-eps);
      s_to:=FloatToStr(StrToFloat(s)+eps);
      s_from:=StringReplace(s_from, ',', '.', [rfReplaceAll, rfIgnoreCase]);
      s_to:=StringReplace(s_to, ',', '.', [rfReplaceAll, rfIgnoreCase]);
      s:= '('+CarentFieldSeach+'>='+s_from+') and ('+CarentFieldSeach+'<='+s_to+')';
    end
    else
    begin
      s:= '('+CarentFieldSeach+'='''+s+''')';
    //  s:= '('+CarentFieldSeach+'='+s+')';
    end;


   end;


    DBGrid1.DataSource.DataSet.Filter := s;



  end // if s<>'' then
  else CheckBox2.Checked:=False;
 end
 else DBGrid1.DataSource.DataSet.Filter :='';

end;

procedure TF_DocReport.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TF_DocReport.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TAdoDataSet(Q_Detail_Tov).IndexFieldNames:=CarentFieldSeach;
end;

procedure TF_DocReport.Edit1Change(Sender: TObject);
begin
 try
   if ((not CheckBox1.Checked) and (not CheckBox2.Checked)) then
    Q_Detail_Tov.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey, loCaseInsensitive]);
  except
   ;
  end;
end;

procedure TF_DocReport.FormCreate(Sender: TObject);
begin
  RG_Sverka.ItemIndex:=DM1.ADS_SaleDocList.FieldByName('IS_SVERENO').AsInteger;
end;

procedure TF_DocReport.FormShow(Sender: TObject);
begin
  with QDocRepotr do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    Open;
    EnableControls;

  end;
  with Q_Detail_Tov do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    Open;
    EnableControls;

  end;

  if QDocRepotr.FieldByName('ID_CHAR_DOC').AsInteger=0 then
  begin
    Panel1.Visible:=False;
    Panel4.Visible:=False;
    DBGrid1.Visible:=False;
    DBNavigator1.Visible:=False;
    GroupBox5.Visible:=False;
    F_DocReport.Height:=250;
  end;

  Caption:=Caption+' '+QDocRepotr.FieldByName('NAME_DOC').AsString;

    BB_Final.Visible:= (QDocRepotr.FieldByName('IS_FINAL').AsInteger=0);
    L_not_final.Visible:=BB_Final.Visible;




end;

procedure TF_DocReport.RG_SverkaClick(Sender: TObject);
begin
  with DM1.ADS_SaleDocList do
  begin
    Edit;
    FieldByName('IS_SVERENO').AsInteger:=RG_Sverka.ItemIndex;
    Post;
  end;


end;

end.
