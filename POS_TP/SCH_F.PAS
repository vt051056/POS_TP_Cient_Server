unit sch_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,DB,ADODB,System.UITypes;

type
  TF_sch = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBDelete: TBitBtn;
    BBRefresh: TBitBtn;
    CBSetEdit: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBSetEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    CarentFieldSeach:string;
    CarentColumn:Tcolumn;
  public
    { Public declarations }
     viewGrup:longInt;
    procedure ReOpenQ(v_idSch:string);
    procedure FoundTov(v_ID_Sch:string);
    function SchNotAllow(vsch:string):boolean;
   
  end;

var

  ID_sch_select:string;
  sch_select,UCHET_sch_select:string;
  ID_UCHET_sch_select:longint;

  F_sch: TF_sch;
  function  F_SchDlg:integer;
  
implementation
 uses UDataModule1,schtype_f,typeuch_f,users_f, myfuncs;
{$R *.dfm}


function  F_SchDlg:integer;
begin
 F_sch:=TF_sch.Create(Application);
 with F_sch do
 begin
  try
    result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_sch.ReOpenQ(v_idSch:string);
begin
 DM1.ADODSSch.DisableControls;
   DM1.ADODSSch.Active:=False;
  DM1.ADODSSch.Active:=True;
  if v_idSch<>'' then
  TADOdataSet(DM1.DSSch.DataSet).Locate('ID_SCH',v_idSch,[loCaseInsensitive]);
  DM1.ADODSSch.EnableControls;
end;

procedure TF_sch.FormCreate(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CarentColumn:=nil;
 CarentFieldSeach:='ID_SCH';
 TADODataSet(DM1.DSSch.DataSet).IndexFieldNames:=CarentFieldSeach;
 ReOpenQ('');




 CBSetEdit.Enabled:=True;
 BBDelete.Enabled:=False;

   DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
   DBGrid1.ReadOnly:=True;
   CBSetEdit.Enabled:=True;
   CBSetEdit.Checked:=False;


end;

function TF_sch.SchNotAllow(vsch:string):boolean;
begin

 DM1.Q_USERSCHPERM.Close;
 DM1.Q_USERSCHPERM.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
 DM1.Q_USERSCHPERM.Parameters.ParamByName('SCH').Value:=vsch;
 DM1.Q_USERSCHPERM.Open;
 result:=(DM1.Q_USERSCHPERM.RecordCount>0);

end;

procedure TF_sch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var vsch:string;
begin
 vsch:=Trim(DM1.ADODSSch.FieldByName('ID_SCH').Asstring);
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSSch.State in [dsInsert,DsEdit] then  DM1.ADODSSch.Post;
 //   if (Trim(DM1.ADODSSch.FieldByName('ID_SCH').Asstring)='661') and (status_user=1)

   if SchNotAllow(vsch)
   then
   begin
    MessageDlg('Выбор счета '+vsch+' не возможен!', mtInformation,
      [mbOk], 0);
    ID_sch_select:=Unknown_str;
    sch_select:=Unknown_str;
    ID_UCHET_sch_select:=Unknown_Code;
    UCHET_sch_select:=Unknown_str;
    modalResult:=mrCancel;
   end
   else
   begin
   ID_sch_select:=DM1.ADODSSch.FieldByName('ID_SCH').Asstring;
   sch_select:=DM1.ADODSSch.FieldByName('SCH_NAME').AsString;
   ID_UCHET_sch_select:=DM1.ADODSSch.FieldByName('ID_UCHET').AsInteger;
   UCHET_sch_select:=DM1.ADODSSch.FieldByName('UCHET').AsString;
   end;
  end
  else
  begin
   if DM1.ADODSSch.State in [dsInsert,DsEdit] then  DM1.ADODSSch.Cancel;
   ID_sch_select:=Unknown_str;
   sch_select:=Unknown_str;
   ID_UCHET_sch_select:=Unknown_Code;
   UCHET_sch_select:=Unknown_str;
  end;

  DM1.ADODSSch.Active:=False;
 end;
end;

procedure TF_sch.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSSch.DataSet.DisableControls;
 with DM1.DSSch.DataSet do
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

 DM1.DSSch.DataSet.EnableControls;
end;

procedure TF_sch.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSSch.DataSet.DisableControls;
 with DM1.DSSch.DataSet do
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

 DM1.DSSch.DataSet.EnableControls;

end;

procedure TF_sch.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TADOdataSet(DM1.DSSch.DataSet).Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_sch.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_sch.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(DM1.DSSch.DataSet).IndexFieldNames:=CarentFieldSeach;
end;


procedure TF_sch.DBGrid1EditButtonClick(Sender: TObject);
begin
if CBSetEdit.Checked then
begin
  with TADOdataSet(DM1.DSSch.DataSet) do
  begin
   if State in [dsInsert,dsEdit] then Post;
   BBRefreshClick(Sender);
  end;
 if CarentColumn.FieldName='SCH_TYPE' then
 begin
 if F_SchTypeDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSSch.DataSet) do
  begin
   Edit;
   FieldByName('ID_SCH_TYPE').asInteger:=ID_tsch_select;
   Post;
   ReOpenQ(FieldByName('ID_SCH').asString);
  end;
 end;
 end;

 if CarentColumn.FieldName='UCHET' then
 begin
 if F_TypeUchDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSSch.DataSet) do
  begin
   Edit;
   FieldByName('ID_UCHET').asInteger:=ID_UCH_select;
   Post;
   ReOpenQ(FieldByName('ID_SCH').asString);
  end;
 end;
 end;

 end;
end;

procedure TF_sch.FoundTov(v_ID_Sch:string);
begin
with DM1.ADODSSch do
begin
 DisableControls;
 ReOpenQ(v_ID_Sch);
 EnableControls;
end;
end;


procedure TF_sch.BBDeleteClick(Sender: TObject);
var pred_ID_sch, next_ID_sch,carrent_ID_sch:string;
begin
with DM1.ADODSSch do
begin
 Disablecontrols;
 carrent_ID_sch:=FieldByName('ID_SCH').AsString;
 prior;
 pred_ID_sch:=FieldByName('ID_SCH').AsString;
 if carrent_ID_sch=pred_ID_sch then Next
 else begin Next; Next; end;
 next_ID_sch:=FieldByName('ID_SCH').AsString;
 DM1.SP_DELETE_SCH.Parameters.ParamValues['@ID_SCH']:=carrent_ID_sch;
 DM1.SP_DELETE_SCH.ExecProc;
 if DM1.SP_DELETE_SCH.Parameters.ParamValues['@ER']=0
 then
  begin
   if pred_ID_sch=carrent_ID_sch then // удаляем 1-ю
    FoundTov(next_ID_sch)
   else
    if next_ID_sch=carrent_ID_sch then // удаляем последнюю
     FoundTov(pred_ID_sch)
    else FoundTov(pred_ID_sch);

  end
 else MessageDlg('Ошибка при удалении счета!', mtError,
      [mbOk], 0);

 Enablecontrols;
end;


end;

procedure TF_sch.BBRefreshClick(Sender: TObject);
begin
with DM1.ADODSSch do
begin
 Disablecontrols;
 FoundTov(FieldByName('ID_SCH').AsString);
 Enablecontrols;
end;

end;

procedure TF_sch.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
///column.Title.Font.Color:= clBLUE;
 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 // column.Title.Font.Color:= clBlack;
 end;
end;

procedure TF_sch.CBSetEditClick(Sender: TObject);
begin
 if CBSetEdit.Checked then
 begin

   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
  DBGrid1.ReadOnly:=False;
  BBDelete.Enabled:=True;

 end
 else
 begin

   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;
  BBDelete.Enabled:=False;

 end;

end;

procedure TF_sch.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_sch.DBGrid1CellClick(Column: TColumn);
begin
 CarentColumn:=Column;
end;

end.
