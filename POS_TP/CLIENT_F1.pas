unit CLIENT_F1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,DB,ADODB, System.UITypes;

  {
type
PCLI_select_list_element=^TCLI_select_list_element;
TCLI_select_list_element= record
 ID_CLIENTS, ID_KATEGOR:longint;
 CLIENT, KATEGOR:string[255];

end;
  }
type
  TF_client_1 = class(TForm)
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
    BBGrCliSel: TBitBtn;
    BBAllGrCliSel: TBitBtn;
    LGrup: TLabel;
    BBSetting: TBitBtn;
    CheckBox2: TCheckBox;
    BBSelectAll: TBitBtn;
    BitBtn3: TBitBtn;
    QCli: TADOQuery;
    DS_QCli: TDataSource;
    QCliID_CLIENTS: TIntegerField;
    QCliCLIENT: TWideStringField;
    QCliINN: TWideStringField;
    QCliTEL: TWideStringField;
    QCliEMAIL: TWideStringField;
    QCliADRES: TWideStringField;
    QCliAUX_INFO: TWideStringField;
    QCliID_KATEGOR: TIntegerField;
    QCliKATEGOR: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BBRefreshClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BBGrCliSelClick(Sender: TObject);
    procedure BBAllGrCliSelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBSettingClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    CarentFieldSeach:string;
  public
    { Public declarations }
    carrentID_CLIENT:longint;
    viewGrup:longInt;
    procedure ReopenQ(v_idCli,IDG:longInt);
    procedure FoundClient(v_ID_CLIENTS:longint);
    procedure MouseWheel(Sender: TObject; Shift: TShiftState;
                   WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

  end;


  

var

  ID_client_select_1:longint;
  client_select_1:string;
  INN_client_select_1:string;
  TEL_client_select_1:string;

  F_client_1: TF_client_1;
  Cli_select_list:TList;  // список выбранных контрагентов

  function  F_clientDlg_1(id_kategor:longint; kategor:string):integer;

implementation
 uses UDataModule1,kateg_cli_f,users_f, myfuncs;
{$R *.dfm}


function  F_clientDlg_1(id_kategor:longint; kategor:string):integer;
begin
 F_client_1:=TF_client_1.Create(Application);
 with F_client_1 do
 begin
  try
    viewGrup:=id_kategor;
    LGrup.Caption:=kategor;
    if viewGrup =-1 then
      LGrup.Caption:='Все группы';
    result:=ShowModal;
  finally
   Free;
  end;
 end;
end;


procedure TF_client_1.MouseWheel(Sender: TObject; Shift: TShiftState;
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


procedure TF_client_1.ReopenQ(v_idCli,IDG:longInt);
begin
 with QCli do
 begin
  DisableControls;
  if not Active then Active:=True;
  carrentID_CLIENT:=FieldByName('ID_CLIENTS').AsInteger;
  Close;
  Parameters.ParamByName('ID_KATEGOR').Value:=IDG;
  Open;
  if v_idCli <>-1 then
  Locate('ID_CLIENTS',v_idCli,[loCaseInsensitive]);
  EnableControls;
 end;
end;

procedure TF_client_1.FormCreate(Sender: TObject);
begin
 LGrup.Caption:='Все группы';
 viewGrup:=-1;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CheckBox1.Checked:=False;
 CheckBox2.Checked:=False;
 DBGrid1.DataSource.DataSet.Filtered:=False;
 DBGrid1.DataSource.DataSet.Filter :='';
 CarentFieldSeach:='CLIENT';
 TADODataSet(QCli).IndexFieldNames:=CarentFieldSeach;

end;

procedure TF_client_1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
// p_Cli_sel:PCLI_select_list_element;
// TempBookmark: TBookMark;
begin
 if CanClose then
 begin
 {
    if Cli_select_list<>nil then
    begin
       for i := 0 to (Cli_select_list.Count - 1) do
       begin
         p_Cli_sel:= Cli_select_list.Items[i];
         Dispose(p_Cli_sel);
       end;
       Cli_select_list.Free;
       Cli_select_list:=nil;
    end;  // if Cli_select_list<>nil then
 }
  if modalResult=mrOk then
  begin
   ID_client_select_1:=QCli.FieldByName('ID_CLIENTS').Asinteger;
   client_select_1:=QCli.FieldByName('CLIENT').AsString;
   INN_client_select_1:=QCli.FieldByName('INN').AsString;
   TEL_client_select_1:=QCli.FieldByName('TEL').AsString;
   {
    if DBGrid1.SelectedRows.Count <> 0 then
    begin
      Cli_select_list:= TList.Create;
      TempBookmark := DBGrid1.Datasource.Dataset.GetBookmark;
      for i := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
         if DBGrid1.SelectedRows.IndexOf(DBGrid1.SelectedRows.Items[i]) > -1 then
         begin
          DBGrid1.Datasource.Dataset.Bookmark := DBGrid1.SelectedRows.Items[i];
          New(p_Cli_sel);
          p_Cli_sel^.ID_CLIENTS :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_CLIENTS').AsInteger;
          p_Cli_sel^.ID_KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_KATEGOR').AsInteger;

          p_Cli_sel^.CLIENT :=
             DBGrid1.Datasource.Dataset.FieldByName('CLIENT').AsString;
          p_Cli_sel^.KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('KATEGOR').AsString;
          Cli_select_list.Add(p_Cli_sel);
         end;   //  if DBGrid1.SelectedRows.IndexOf(DBGrid1.SelectedRows.Items[i]) > -1 then
       end;  //  for i := 0 to DBGrid1.SelectedRows.Count - 1 do
    end  // if DBGrid1.SelectedRows.Count <> 0 then
    else
    begin
          New(p_Cli_sel);
          p_Cli_sel^.ID_CLIENTS :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_CLIENTS').AsInteger;
          p_Cli_sel^.ID_KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_KATEGOR').AsInteger;

          p_Cli_sel^.CLIENT :=
             DBGrid1.Datasource.Dataset.FieldByName('CLIENT').AsString;
          p_Cli_sel^.KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('KATEGOR').AsString;

          Cli_select_list.Add(p_Cli_sel);
    end;  // else if DBGrid1.SelectedRows.Count <> 0 then
    }

  end
  else
  begin
   ID_client_select_1:=Unknown_code;
   client_select_1:=Unknown_str;
   INN_client_select_1:=Unknown_str;
   TEL_client_select_1:=Unknown_str;

  end;

  QCli.Close;
 end;
end;

procedure TF_client_1.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 QCli.DisableControls;
 with QCli do
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

 QCli.EnableControls;
end;

procedure TF_client_1.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 QCli.DisableControls;
 with QCli do
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

 QCli.EnableControls;

end;

procedure TF_client_1.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  QCli.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_client_1.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_client_1.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(QCli).IndexFieldNames:=CarentFieldSeach;
end;


procedure TF_client_1.FoundClient(v_ID_CLIENTS:longint);
var idG_from, idG_to:integer;
begin
with QCli do
begin
 DisableControls;
 ReOpenQ(v_ID_CLIENTS,viewGrup);
 EnableControls;
end;
end;

procedure TF_client_1.BBRefreshClick(Sender: TObject);
begin
with QCli do
begin
 Disablecontrols;
 FoundClient(FieldByName('ID_CLIENTS').AsInteger);
 Enablecontrols;
end;

end;

procedure TF_client_1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TF_client_1.FormShow(Sender: TObject);
begin
 ReOpenQ(-1,viewGrup);
// установка порядка и ширины DbGrid1 из секции section_Ini Ini файла
ReadColumnPosFromIni(DbGrid1, 'clients1');
Edit1.SetFocus;
end;

procedure TF_client_1.BBGrCliSelClick(Sender: TObject);

begin
 if F_kateg_cliDlg= mrOk then
 begin
  LGrup.Caption:='Группа '+kateg_cli_select;
  viewGrup:=ID_kateg_cli_select;
  ReOpenQ(-1,viewGrup);
 end;
end;

procedure TF_client_1.BBAllGrCliSelClick(Sender: TObject);
begin
 LGrup.Caption:='Все группы';
 ID_kateg_cli_select:=-1;
 viewGrup:=-1;
 ReOpenQ(-1,viewGrup);
end;

procedure TF_client_1.DBGrid1DblClick(Sender: TObject);
begin
//  modalResult:=mrOk;
end;

procedure TF_client_1.BBSettingClick(Sender: TObject);
begin
  SaveColumnPosToIni(DbGrid1, 'clients1');
end;

procedure TF_client_1.CheckBox2Click(Sender: TObject);

begin
  DBGrid1.SelectedRows.Clear;
  if CheckBox2.Checked then
  begin
   if not CheckBox1.Checked then
   begin
     if MessageDlg('Установить фильтр по текущему значению выделенной колонки?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Edit1.text:=QCli.FieldByName(CarentFieldSeach).AsString;
    end;
   end;
   DBGrid1.DataSource.DataSet.Filtered:=True;
   DBGrid1.DataSource.DataSet.Filter := '('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+Edit1.text+'%') + ')';
  end
  else
  begin
    DBGrid1.DataSource.DataSet.Filtered:=False;
    DBGrid1.DataSource.DataSet.Filter :='';
  end;
end;

procedure TF_client_1.BBSelectAllClick(Sender: TObject);
begin
if DBGrid1.DataSource.DataSet.Active then  GridSelectAll(DBGrid1);
end;




procedure TF_client_1.BitBtn3Click(Sender: TObject);
begin
DBGrid1.SelectedRows.Clear;
end;

end.
