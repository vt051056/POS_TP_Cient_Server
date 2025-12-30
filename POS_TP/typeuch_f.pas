unit typeuch_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,System.UITypes,
  Data.DB;

type
  TF_TypeUch = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBSetEdit: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBSetEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  ID_UCH_select:longint;
  uch_select:string;
  
  F_TypeUch: TF_TypeUch;
  function  F_TypeUchDlg:integer;
  
implementation
 uses UDataModule1, users_f, myfuncs;
{$R *.dfm}


function  F_TypeUchDlg:integer;
begin
 F_TypeUch:=TF_TypeUch.Create(Application);
 with F_TypeUch do
 begin
  try
   result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_TypeUch.FormCreate(Sender: TObject);
begin
 DM1.ADODSUCH.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;
end;

procedure TF_TypeUch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   ID_UCH_select:=DM1.ADODSUCH.FieldByName('ID_UCHET').Asinteger;
   uch_select:=DM1.ADODSUCH.FieldByName('UCHET').AsString;
  end
  else
  begin
   ID_UCH_select:=Unknown_code;
   uch_select:=Unknown_str;
  end;
  DM1.ADODSUCH.Active:=False;
 end;
end;

procedure TF_TypeUch.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSUCH.DataSet.DisableControls;
 with DM1.DSUCH.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('UCHET').Asstring)) <>0 then
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

 DM1.DSUCH.DataSet.EnableControls;
end;

procedure TF_TypeUch.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSUCH.DataSet.DisableControls;
 with DM1.DSUCH.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('UCHET').Asstring)) <>0 then
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

 DM1.DSUCH.DataSet.EnableControls;

end;

procedure TF_TypeUch.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSUCH.DataSet).Locate('UCHET',Edit1.Text,[loPartialKey]);
end;

procedure TF_TypeUch.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_TypeUch.BBRefreshClick(Sender: TObject);
var carrent_ID_Uch:longint;
begin
 with DM1.ADODSUCH do
begin
 Disablecontrols;
 carrent_ID_Uch:=FieldByName('ID_UCHET').AsInteger;
 Close;
 Open;
 locate('ID_UCHET', carrent_ID_Uch, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_TypeUch.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_TypeUch.CBSetEditClick(Sender: TObject);
begin

   if CBSetEdit.Checked then
   begin
   DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbEdit,nbPost,nbCancel];
   DBGrid1.ReadOnly:=False;
   end
   else
   begin
   DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
   DBGrid1.ReadOnly:=True;
   end;

end;

end.
