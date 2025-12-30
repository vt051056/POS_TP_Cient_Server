unit kateg_cli_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, Data.DB,
  Data.Win.ADODB;

type
  TF_kateg_cli = class(TForm)
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
    QKateg_Cli: TADOQuery;
    DS_QKateg_Cli: TDataSource;
    QKateg_CliID_KATEGOR: TIntegerField;
    QKateg_CliKATEGOR: TWideStringField;
    QKateg_CliIS_DELETE: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenFound(id_found:integer);
     procedure MouseWheel(Sender: TObject; Shift: TShiftState;
                   WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  end;

var

  ID_kateg_cli_select:longint;
  kateg_cli_select:string;
  ID_kateg_cli_K_select:longint;
  kateg_cli_K_select:string;
  ID_kateg_cli_D_select:longint;
  kateg_cli_D_select:string;
  F_kateg_cli: TF_kateg_cli;
  function  F_kateg_cliDlg:integer;
  
implementation
 uses UDataModule1, users_f, myfuncs;
{$R *.dfm}


function  F_kateg_cliDlg:integer;
begin
 F_kateg_cli:=TF_kateg_cli.Create(Application);
 with F_kateg_cli do
 begin
  try
   result:=ShowModal;
  finally
   Free;
   F_kateg_cli:= nil;
  end;
 end;
end;


procedure TF_kateg_cli.OpenFound(id_found:integer);
begin
with QKateg_Cli do
begin
 Disablecontrols;
 Close;
 Open;
 locate('ID_KATEGOR', id_found, [loCaseInsensitive]);
 Enablecontrols;
end;

end;

procedure TF_kateg_cli.FormCreate(Sender: TObject);
begin
 QKateg_Cli.Open;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 DBGrid1.ReadOnly:=True;
end;

procedure TF_kateg_cli.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin

   ID_kateg_cli_select:=QKateg_Cli.FieldByName('ID_KATEGOR').Asinteger;
   kateg_cli_select:=QKateg_Cli.FieldByName('KATEGOR').AsString;
  end
  else
  begin

   ID_kateg_cli_select:=Unknown_code;
   kateg_cli_select:=Unknown_str;
  end;

  QKateg_Cli.Close;
 end;
end;

procedure TF_kateg_cli.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 QKateg_Cli.DisableControls;
 with QKateg_Cli do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('KATEGOR').Asstring)) <>0 then
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

 QKateg_Cli.EnableControls;
end;

procedure TF_kateg_cli.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 QKateg_Cli.DisableControls;
 with QKateg_Cli do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('KATEGOR').Asstring)) <>0 then
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

 QKateg_Cli.EnableControls;

end;

procedure TF_kateg_cli.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  QKateg_Cli.Locate('KATEGOR',Edit1.Text,[loPartialKey]);
end;

procedure TF_kateg_cli.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_kateg_cli.BBRefreshClick(Sender: TObject);
var carrent_ID_KATEGER:longint;
begin
 with QKateg_Cli do
begin
 Disablecontrols;
 carrent_ID_KATEGER:=FieldByName('ID_KATEGOR').AsInteger;
 Close;
 Open;
 locate('ID_KATEGOR', carrent_ID_KATEGER, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_kateg_cli.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
OpenFound(ID_kateg_cli_select);
end;

procedure TF_kateg_cli.MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta>0 then
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Bof
      then TDBGrid(Sender).DataSource.DataSet.Prior;
  end
  else
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Eof
      then TDBGrid(Sender).DataSource.DataSet.Next;
  end;
 
  Handled := True;
end;





end.
