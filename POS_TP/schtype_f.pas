unit schtype_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,System.UITypes,
  Data.DB;

type
  TF_SchType = class(TForm)
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

  ID_tsch_select:longint;
  tsch_select:string;

  F_SchType: TF_SchType;
  function  F_SchTypeDlg:integer;

implementation
 uses UDataModule1, myfuncs, users_f;
{$R *.dfm}


function  F_SchTypeDlg:integer;
begin
 F_SchType:=TF_SchType.Create(Application);
 with F_SchType do
 begin
  try
   result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_SchType.FormCreate(Sender: TObject);
begin
 DM1.ADODSSCHTYPE.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;
 
end;

procedure TF_SchType.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSSCHTYPE.State in [dsInsert,DsEdit] then DM1.ADODSSCHTYPE.Post;
   ID_tsch_select:=DM1.ADODSSCHTYPE.FieldByName('ID_SCH_TYPE').Asinteger;
   tsch_select:=DM1.ADODSSCHTYPE.FieldByName('SCH_TYPE').AsString;
  end
  else
  begin
   if DM1.ADODSSCHTYPE.State in [dsInsert,DsEdit] then DM1.ADODSSCHTYPE.Cancel;
   ID_tsch_select:=Unknown_code;
   tsch_select:=Unknown_str;
  end;
  DM1.ADODSSCHTYPE.Active:=False;
 end;
end;

procedure TF_SchType.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSSCHTYPE.DataSet.DisableControls;
 with DM1.DSSCHTYPE.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('SCH_TYPE').Asstring)) <>0 then
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

 DM1.DSSCHTYPE.DataSet.EnableControls;
end;

procedure TF_SchType.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSSCHTYPE.DataSet.DisableControls;
 with DM1.DSSCHTYPE.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('SCH_TYPE').Asstring)) <>0 then
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

 DM1.DSSCHTYPE.DataSet.EnableControls;

end;

procedure TF_SchType.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSSCHTYPE.DataSet).Locate('SCH_TYPE',Edit1.Text,[loPartialKey]);
end;

procedure TF_SchType.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_SchType.BBRefreshClick(Sender: TObject);
var carrent_ID_SCH_TYPE:longint;
begin
 with DM1.ADODSSCHTYPE do
begin
 Disablecontrols;
 carrent_ID_SCH_TYPE:=FieldByName('ID_SCH_TYPE').AsInteger;
 Close;
 Open;
 locate('ID_SCH_TYPE', carrent_ID_SCH_TYPE, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_SchType.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_SchType.CBSetEditClick(Sender: TObject);
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
