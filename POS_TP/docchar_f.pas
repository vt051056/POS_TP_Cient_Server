unit docchar_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,ADODB;

type
  TF_docchar = class(TForm)
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
    BBRefresh: TBitBtn;
    CBSetEdit: TCheckBox;
    BBDelete: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure CBSetEditClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    CarentColumn:Tcolumn;
    CarentFieldSeach:string;
    procedure FoundRec(v_ID_REC:longint);
  end;

var

  ID_CHAR_DOC_select:longint;
  CHAR_DOC_select:string;
  
  F_docchar: TF_docchar;
  function  F_DOC_CHARDlg:integer;
  
implementation
 uses UDataModule1,DB, Users_f, myfuncs;
{$R *.dfm}


function  F_DOC_CHARDlg:integer;
begin
 F_docchar:=TF_docchar.Create(Application);
 with F_docchar do
 begin
  try
   result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_docchar.FormCreate(Sender: TObject);
begin
 DM1.ADODSDOC_CHAR.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CarentColumn:=nil;
 CBSetEdit.Enabled:=True;
 CBSetEdit.Checked:=false;


if CBSetEdit.Checked then
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
  end
  else
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  end;
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=CBSetEdit.Checked;


end;

procedure TF_docchar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSDOC_CHAR.State in [dsInsert,DsEdit] then DM1.ADODSDOC_CHAR.Post;
   ID_CHAR_DOC_select:=DM1.ADODSDOC_CHAR.FieldByName('ID_CHAR_DOC').Asinteger;
   CHAR_DOC_select:=DM1.ADODSDOC_CHAR.FieldByName('CHAR_DOC').AsString;
  end
  else
  begin
   if DM1.ADODSDOC_CHAR.State in [dsInsert,DsEdit] then DM1.ADODSDOC_CHAR.Cancel;
   ID_CHAR_DOC_select:=Unknown_code;
   CHAR_DOC_select:=Unknown_str;
  end;

  DM1.ADODSDOC_CHAR.Active:=False;
 end;
end;

procedure TF_docchar.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSDOC_CHAR.DataSet.DisableControls;
 with DM1.DSDOC_CHAR.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('CHAR_DOC').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.DSDOC_CHAR.DataSet.EnableControls;
end;

procedure TF_docchar.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSDOC_CHAR.DataSet.DisableControls;
 with DM1.DSDOC_CHAR.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('CHAR_DOC').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.DSDOC_CHAR.DataSet.EnableControls;

end;

procedure TF_docchar.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSDOC_CHAR.DataSet).Locate('CHAR_DOC',Edit1.Text,[loPartialKey]);
end;

procedure TF_docchar.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_docchar.BBRefreshClick(Sender: TObject);
var carrent_ID_CHAR_DOC:longint;
begin
 with DM1.DSDOC_CHAR.DataSet do
begin
 carrent_ID_CHAR_DOC:=FieldByName('ID_CHAR_DOC').AsInteger;
 FoundRec(carrent_ID_CHAR_DOC);
end;
end;

procedure TF_docchar.FoundRec(v_ID_REC:longint);
begin
with DM1.DSDOC_CHAR.DataSet do
begin
 Disablecontrols;
 Close;
 Open;
 locate('ID_CHAR_DOC', v_ID_REC, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_docchar.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_docchar.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TF_docchar.DBGrid1TitleClick(Column: TColumn);
begin
// CarentFieldSeach:=Column.FieldName;
// TADODataSet(DM1.DSNAKLCAP.DataSet).IndexFieldNames:=CarentFieldSeach;
end;

procedure TF_docchar.BBDeleteClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
with DM1.ADODSDOC_CHAR do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_CHAR_DOC').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_CHAR_DOC').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_CHAR_DOC').AsInteger;
 DM1.SP_DELETE_DOCCHAR.Parameters.ParamValues['@ID_CHAR_DOC']:=carrent_ID;
 DM1.SP_DELETE_DOCCHAR.ExecProc;
 if DM1.SP_DELETE_DOCCHAR.Parameters.ParamValues['@ER']=0
 then
  begin
   if pred_ID=carrent_ID then // удаляем 1-ю
    FoundRec(next_ID)
   else
    if next_ID=carrent_ID then // удаляем последнюю
     FoundRec(pred_ID)
    else FoundRec(pred_ID);

  end
 else MessageDlg('Ошибка при удалении документа!', mtError,
      [mbOk], 0);

 Enablecontrols;
end;


end;

procedure TF_docchar.CBSetEditClick(Sender: TObject);
begin
 if CBSetEdit.Checked then
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
  end
  else
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  end;
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=CBSetEdit.Checked;


end;

end.
