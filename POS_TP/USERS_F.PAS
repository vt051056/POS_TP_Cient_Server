unit users_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, System.UITypes,
  Data.DB;

type
  TF_users = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    CB_Deleted: TCheckBox;
    BBDelete: TBitBtn;
    BBRestore: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CB_DeletedClick(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure BBRestoreClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    CarentFieldSeach:string;
  public
    { Public declarations }

    procedure OpenFound(id_found:integer);
  end;

var

  ID_user_select, status_user:longint;
  user_select:string;
  user_birthday:Tdatetime;
  
  F_users: TF_users;
  function  F_usersDlg:integer;
  
implementation
 uses UDataModule1;
{$R *.dfm}


function  F_usersDlg:integer;
begin
 F_users:=TF_users.Create(Application);
 with F_users do
 begin
  try
   result:=ShowModal;
  finally
   Free;
   F_users:=nil;
  end;
 end;
end;

procedure TF_users.FormCreate(Sender: TObject);
begin
 DM1.ADODSUsers.Parameters.ParamByName('isdelete').Value:=0;
 DM1.ADODSUsers.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CB_Deleted.Checked:=False;
 BBRestore.Enabled:=CB_Deleted.Checked;

end;

procedure TF_users.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  DM1.ADODSUsers.Active:=False;
 end;
end;

procedure TF_users.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSUSERS.DataSet.DisableControls;
 with DM1.DSUSERS.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName( CarentFieldSeach).Asstring)) <>0 then
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

 DM1.DSUSERS.DataSet.EnableControls;
end;

procedure TF_users.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSUSERS.DataSet.DisableControls;
 with DM1.DSUSERS.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName( CarentFieldSeach).Asstring)) <>0 then
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

 DM1.DSUSERS.DataSet.EnableControls;

end;

procedure TF_users.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSUSERS.DataSet).Locate( CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_users.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_users.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
 column.Font.Color:= clBLUE;

end
else
 begin
  column.Font.Color:= clBlack;
 end;
end;

procedure TF_users.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 DM1.ADODSUSERS.IndexFieldNames:=CarentFieldSeach;
 GroupBox1.Caption:='Поиск ' +Column.Title.Caption;
end;

procedure TF_users.BBRefreshClick(Sender: TObject);
var carrent_ID_USERS:longint;
begin
with DM1.ADODSUSERS do
begin
 carrent_ID_USERS:=FieldByName('ID_USERS').AsInteger;
 OpenFound(carrent_ID_USERS);
end;
end;

procedure TF_users.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
CarentFieldSeach:='NAME';
DM1.ADODSUSERS.IndexFieldNames:=CarentFieldSeach;
GroupBox1.Caption:='Поиск Имя';
end;

procedure TF_users.CB_DeletedClick(Sender: TObject);
begin
with DM1.ADODSUSERS do
begin
 Disablecontrols;
 Close;
 if CB_Deleted.Checked then
  Parameters.ParamByName('isdelete').Value:=1
 else
  Parameters.ParamByName('isdelete').Value:=0;
  
  BBRestore.Enabled:=CB_Deleted.Checked;
 Open;
 Enablecontrols;
end;
end;

procedure TF_users.OpenFound(id_found:integer);
begin
with DM1.ADODSUSERS do
begin
 Disablecontrols;
 Close;
 if CB_Deleted.Checked then
  Parameters.ParamByName('isdelete').Value:=1
 else
  Parameters.ParamByName('isdelete').Value:=0;
 Open;
 locate('ID_USERS', id_found, [loCaseInsensitive]);
 Enablecontrols;
end;

end;

procedure TF_users.BBDeleteClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
  if MessageDlg('Вы уверенны в удалении записи?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
with DM1.ADODSUSERS do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_USERS').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_USERS').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_USERS').AsInteger;
 locate('ID_USERS', carrent_ID, [loCaseInsensitive]);
 if FieldByName('IS_DELETE').AsInteger=0 then
 begin
    Edit;
    FieldByName('IS_DELETE').AsInteger:=1;
    Post;
    if pred_ID=carrent_ID then // удаляем 1-ю
    OpenFound(next_ID)
    else
    if next_ID=carrent_ID then // удаляем последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);

 end
 else
 begin
  if MessageDlg('Будет безвозвратно удалена запись. '+
   'Это может привести к нарушению целосности БД. '+
   'Вы уверенны в удалении записи?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Delete;
    if pred_ID=carrent_ID then // удаляем 1-ю
    OpenFound(next_ID)
    else
    if next_ID=carrent_ID then // удаляем последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);
  end;
 end;

 

 Enablecontrols;
end;
end;

end;

procedure TF_users.BBRestoreClick(Sender: TObject);
 var pred_ID, next_ID,carrent_ID:longint;
begin
with DM1.ADODSUSERS do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_USERS').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_USERS').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_USERS').AsInteger;

 locate('ID_USERS', carrent_ID, [loCaseInsensitive]);
 Edit;
 FieldByName('IS_DELETE').AsInteger:=0;
 Post;

 if pred_ID=carrent_ID then // перенесли 1-ю
    OpenFound(next_ID)
 else
    if next_ID=carrent_ID then // перенесли последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);

 Enablecontrols;
end;

end;

end.
