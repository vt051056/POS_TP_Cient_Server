unit SettingConst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Printers,
  Vcl.Tabs, System.IniFiles;

type
  TFSettingConst = class(TForm)
    ADS_CONST_VALUES: TADODataSet;
    DS_CONST_VALUES: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    ADS_CONST_VALUESID_CONST: TAutoIncField;
    ADS_CONST_VALUESCONST_NAME: TWideStringField;
    ADS_CONST_VALUESCONST_VALUE: TWideStringField;
    PrintDialog1: TPrintDialog;
    ADOCommandInsert_Printer_Setup: TADOCommand;
    Q_PrinterSetup: TADOQuery;
    Q_PrinterSetupID: TAutoIncField;
    Q_PrinterSetupPRINTER_NAME: TWideStringField;
    Q_PrinterSetupPRINTER_INDEX: TIntegerField;
    DS_Q_PrinterSetup: TDataSource;
    Q_PrinterSetupIS_FISCAL: TIntegerField;
    QPRINTER_TYPES: TADOQuery;
    DSQPRINTER_TYPES: TDataSource;
    Q_PrinterSetupis_fiscal_str: TStringField;
    ADOCommandDelete_Printer_Setup: TADOCommand;
    Panel6: TPanel;
    Panel7: TPanel;
    Notebook1: TNotebook;
    Panel8: TPanel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BBDeletePrinter: TBitBtn;
    BBAddPrinter: TBitBtn;
    DBNavigator2: TDBNavigator;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    TabSet1: TTabSet;
    Panel9: TPanel;
    Panel10: TPanel;
    ADOCommandInsert_SET_INERFACE: TADOCommand;
    ADS_Set_Interface: TADODataSet;
    DS_Set_Interface: TDataSource;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    ADS_Set_InterfaceID_SET_INTERFACE: TAutoIncField;
    ADS_Set_InterfaceNAME_ACTION: TWideStringField;
    ADS_Set_InterfaceCAPTION: TWideStringField;
    ADS_Set_InterfaceVISIBLE: TIntegerField;
    ADS_Set_InterfaceID_INTERFACE: TIntegerField;
    ADS_CONST_VALUESCOMMENT: TWideStringField;
    GroupBox1: TGroupBox;
    E_ID_INTERFACE: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Q_Interface_list: TADOQuery;
    DS_Q_Interface_list: TDataSource;
    DBGrid4: TDBGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Q_RRO_CERTIFIC: TADOQuery;
    Q_RRO_KASSA_TS: TADOQuery;
    DS_Q_RRO_KASSA_TS: TDataSource;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBNavigator5: TDBNavigator;
    BBLoadCertif_kass: TBitBtn;
    DBNavigator1: TDBNavigator;
    Q_RRO_KASSA_TSID_RRO_KASSA: TAutoIncField;
    Q_RRO_KASSA_TSID_TT: TIntegerField;
    Q_RRO_KASSA_TSID_CLI: TIntegerField;
    Q_RRO_KASSA_TSID_NUM_FISCAL_KASSA: TLargeintField;
    Q_RRO_KASSA_TSNAME_KASSA: TWideStringField;
    Q_RRO_KASSA_TSCLIENT: TWideStringField;
    Label5: TLabel;
    Label6: TLabel;
    BBSetRROWorkPlace: TBitBtn;
    GroupBox2: TGroupBox;
    L_CLI_Place: TLabel;
    L_Kassa_Place: TLabel;
    Label7: TLabel;
    E_URL_RRO_Server: TEdit;
    Panel_Alco_Kassa: TPanel;
    BBSetRROWorkPlace_Alcogol: TBitBtn;
    GroupBox3: TGroupBox;
    L_CLI_Place_Alcogol: TLabel;
    L_Kassa_Place_Alcogol: TLabel;
    CB_IS_EXIST_ALCO_KASSA: TCheckBox;
    BBSaveSet: TBitBtn;
    QFOP: TADOQuery;
    DS_QFOP: TDataSource;
    QFOPID_TT: TIntegerField;
    QFOPID_CLI: TIntegerField;
    QFOPCLIENT: TWideStringField;
    QFOPPASSW: TWideStringField;
    QFOPDATE_END_CERTIFICATE: TDateTimeField;
    Q_RRO_KASSA_TSPASSW: TWideStringField;
    Q_RRO_KASSA_TSDATE_END_CERTIFICATE: TDateTimeField;
    RG_USE_CERTIFIKATE: TRadioGroup;
    L_Use_Certificate: TLabel;
    L_DATE_END_CERTIFICATE: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBAddPrinterClick(Sender: TObject);
    procedure BBDeletePrinterClick(Sender: TObject);
    procedure BBAddPrinterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Q_Interface_listAfterScroll(DataSet: TDataSet);
    procedure BBLoadCertif_kassClick(Sender: TObject);
    procedure BBSetRROWorkPlaceClick(Sender: TObject);
    procedure BBSetRROWorkPlace_AlcogolClick(Sender: TObject);
    procedure CB_IS_EXIST_ALCO_KASSAClick(Sender: TObject);
    procedure BBSaveSetClick(Sender: TObject);
    procedure QFOPAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CTRLBoolean:integer;
    iniFile:TIniFile;
    name_ini_File : string;
    procedure ReOpenPrinterSetup(vPrinterIndex:integer);
    procedure Reopen_Set_Interface(ID_INTERFACE:integer);
  end;

var
  FSettingConst: TFSettingConst;

procedure FSettingConst_dlg;

implementation
uses UDataModule1, UMainForm, Login_Form, myfuncs;

{$R *.dfm}

procedure FSettingConst_dlg;
begin
 FSettingConst:=TFSettingConst.Create(Application);
 with FSettingConst do
 begin
  try
    ShowModal;
  finally
   FreeAndNil(FSettingConst);
  end;
 end;
end;

procedure TFSettingConst.BBAddPrinterClick(Sender: TObject);
var i:integer;
begin
if CTRLBoolean =0 then
begin
  if PrintDialog1.Execute then
  begin
    try
      ADOCommandInsert_Printer_Setup.Parameters.ParamByName('PRINTER_INDEX').Value:=Printer.PrinterIndex;
      ADOCommandInsert_Printer_Setup.Parameters.ParamByName('PRINTER_NAME').Value:=Printer.Printers[Printer.PrinterIndex];
      ADOCommandInsert_Printer_Setup.Execute;
      ReOpenPrinterSetup(Printer.PrinterIndex);
    except
      MessageDlg('Такой принтер уже есть!', mtError, [mbOk], 0);
    end;
  end;
end
else
begin
  ADOCommandInsert_Printer_Setup.Parameters.ParamByName('PRINTER_INDEX').Value:=-1;
  ADOCommandInsert_Printer_Setup.Parameters.ParamByName('PRINTER_NAME').Value:='Фискальный регистратор';
  ADOCommandInsert_Printer_Setup.Execute;
  ReOpenPrinterSetup(Printer.PrinterIndex);
end;


end;

procedure TFSettingConst.BBAddPrinterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CTRLBoolean:=0;
 if ssAlt in Shift then
      CTRLBoolean:=1;
 if ssShift in Shift then
      CTRLBoolean:=2;
 if  ssCtrl in Shift then
      CTRLBoolean:=3;
 if  ssRight in Shift then
      CTRLBoolean:=4;
end;

procedure TFSettingConst.BBDeletePrinterClick(Sender: TObject);
begin
 ADOCommandDelete_Printer_Setup.Parameters.ParamByName('ID').Value:=Q_PrinterSetup.FieldByName('ID').AsInteger;
 ADOCommandDelete_Printer_Setup.Execute;
 ReOpenPrinterSetup(Printer.PrinterIndex);
end;

procedure TFSettingConst.BBLoadCertif_kassClick(Sender: TObject);
 var Save_Cursor:TCursor;
begin
 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
  F_main.ActionConnectRemoteDBExecute(Sender);

  if   F_main.is_connect_server then
  begin
    try
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;

    QFOP.Close;
   // получение сертификатов, ключей, паролей ФОП, работающей с тт  ID_TRADE_POINT
    if F_main.LoadRRO_CERTIFIC then F_main.UpdateRRO_CERTIFIC;
   // получение инфо о кассах работающих в тт  ID_TRADE_POINT
    if F_main.LoadRRO_KASSA_TS then F_main.UpdateRRO_KASSA_TS;
    QFOP.Parameters.ParamByName('ID_TT').Value:=F_Main.ID_TRADE_POINT;
    QFOP.Open;
    finally
      Screen.Cursor := Save_Cursor;
      MessageDlg('Загрузка сертфикатов и касс выполнена!', mtInformation, [mbOk], 0);

    end;
  end;

  if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
    F_main.ActionDisconnectRemoteDBExecute(Sender);
end;

procedure TFSettingConst.BBSaveSetClick(Sender: TObject);
begin
  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  IniFile.WriteInteger('workplace', 'ID_CLI_FISCAL',F_Main.ID_CLI_FISCAL);
  IniFile.WriteInteger('workplace', 'ID_RRO_KASSA_FISCAL',F_Main.ID_RRO_KASSA_FISCAL);
  IniFile.WriteString('workplace', 'NAME_KASSA_FISCAL',F_Main.NAME_KASSA_FISCAL);
  IniFile.WriteString('workplace', 'CLI_FISCAL',F_Main.CLI_FISCAL);
  IniFile.WriteString('workplace', 'URL_RRO_Server',E_URL_RRO_Server.Text);
  IniFile.WriteInteger('workplace', 'IS_EXIST_ALCO_KASSA',F_Main.IS_EXIST_ALCO_KASSA);
  IniFile.WriteInteger('workplace', 'USE_CERTIFIKATE',F_Main.USE_CERTIFIKATE);

  if F_Main.IS_EXIST_ALCO_KASSA=1 then
  begin
    IniFile.WriteInteger('workplace', 'ID_CLI_FISCAL_ALCOGOL',F_Main.ID_CLI_FISCAL_ALCOGOL);
    IniFile.WriteInteger('workplace', 'ID_RRO_KASSA_FISCAL_ALCOGOL',F_Main.ID_RRO_KASSA_FISCAL_ALCOGOL);
    IniFile.WriteString('workplace', 'NAME_KASSA_FISCAL_ALCOGOL',F_Main.NAME_KASSA_FISCAL_ALCOGOL);
    IniFile.WriteString('workplace', 'CLI_FISCAL_ALCOGOL',F_Main.CLI_FISCAL_ALCOGOL);

  end
  else
  begin
      // нет Алкогольной кассы
    IniFile.WriteInteger('workplace', 'ID_CLI_FISCAL_ALCOGOL',-1);
    IniFile.WriteInteger('workplace', 'ID_RRO_KASSA_FISCAL_ALCOGOL',-1);
    IniFile.WriteString('workplace', 'NAME_KASSA_FISCAL_ALCOGOL','');
    IniFile.WriteString('workplace', 'CLI_FISCAL_ALCOGOL','');



    F_Main.Certificate_ALCOGOL:=''; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
    F_Main.PrivateKey_ALCOGOL:='';  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
    F_Main.PasswordKey_ALCOGOL:=''; // пароль к ключу
    F_Main.ID_NUM_FISCAL_KASSA_ALCOGOL:=-1; // Фискальний номер РРО
  end;

  FreeAndNil(IniFile);

end;

procedure TFSettingConst.BBSetRROWorkPlaceClick(Sender: TObject);
begin
  Q_RRO_CERTIFIC.Close;
  if RG_USE_CERTIFIKATE.ItemIndex=0 then
    Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=QFOP.FieldByName('ID_CLI').AsInteger
  else  Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=Q_RRO_KASSA_TS.FieldByName('ID_RRO_KASSA').AsInteger;
  Q_RRO_CERTIFIC.Parameters.ParamByName('USE_CERTIFIKATE').Value:=RG_USE_CERTIFIKATE.ItemIndex;
  Q_RRO_CERTIFIC.Open;
  F_Main.ID_CLI_FISCAL:=Q_RRO_KASSA_TS.FieldByName('ID_CLI').AsInteger; // Предприятие от имени которого передаются фискальные данные (ФОП)
  F_Main.CLI_FISCAL:= Q_RRO_CERTIFIC.FieldByName('CLIENT').AsString;
  F_Main.ID_RRO_KASSA_FISCAL:=Q_RRO_KASSA_TS.FieldByName('ID_RRO_KASSA').AsInteger; // id РРО кассы из таблицы RRO_KASSA_TS
  F_Main.ID_NUM_FISCAL_KASSA:=Q_RRO_KASSA_TS.FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt; // Фискальний номер РРО
  F_Main.NAME_KASSA_FISCAL:=Q_RRO_KASSA_TS.FieldByName('NAME_KASSA').AsString;    // Имя кассы РРО
  F_Main.Certificate:=Q_RRO_CERTIFIC.FieldByName('CERTIFICATE').AsString;   // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
  F_Main.PrivateKey:=Q_RRO_CERTIFIC.FieldByName('PRIVATE_KEY').AsString; // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
  F_Main.PasswordKey:=Q_RRO_CERTIFIC.FieldByName('PASSW').AsString;  // пароль к ключу
  F_Main.USE_CERTIFIKATE:=RG_USE_CERTIFIKATE.ItemIndex;
  F_Main.DATE_END_CERTIFICATE:= Q_RRO_CERTIFIC.FieldByName('DATE_END_CERTIFICATE').AsDateTime;

  if CB_IS_EXIST_ALCO_KASSA.Checked then  F_Main.IS_EXIST_ALCO_KASSA:=1
  else F_Main.IS_EXIST_ALCO_KASSA:=0;


  L_CLI_Place.Caption:=F_Main.CLI_FISCAL;
  L_Kassa_Place.Caption:=F_Main.NAME_KASSA_FISCAL;
  if F_Main.USE_CERTIFIKATE=0 then L_Use_Certificate.Caption:='Сертификат предприятия'
  else L_Use_Certificate.Caption:='Сертификат кассы';
  L_DATE_END_CERTIFICATE.Caption:='Действует до '+DateToStr(F_Main.DATE_END_CERTIFICATE);

  Q_RRO_CERTIFIC.Close;

end;

procedure TFSettingConst.BBSetRROWorkPlace_AlcogolClick(Sender: TObject);
begin
  Q_RRO_CERTIFIC.Close;
  if RG_USE_CERTIFIKATE.ItemIndex=0 then
    Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=QFOP.FieldByName('ID_CLI').AsInteger
  else  Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=Q_RRO_KASSA_TS.FieldByName('ID_RRO_KASSA').AsInteger;
  Q_RRO_CERTIFIC.Parameters.ParamByName('USE_CERTIFIKATE').Value:=RG_USE_CERTIFIKATE.ItemIndex;
  Q_RRO_CERTIFIC.Open;
  F_Main.ID_CLI_FISCAL_ALCOGOL:=Q_RRO_KASSA_TS.FieldByName('ID_CLI').AsInteger; // Предприятие от имени которого передаются фискальные данные (ФОП)
  F_Main.CLI_FISCAL_ALCOGOL:= Q_RRO_CERTIFIC.FieldByName('CLIENT').AsString;
  F_Main.ID_RRO_KASSA_FISCAL_ALCOGOL:=Q_RRO_KASSA_TS.FieldByName('ID_RRO_KASSA').AsInteger; // id РРО кассы из таблицы RRO_KASSA_TS
  F_Main.ID_NUM_FISCAL_KASSA_ALCOGOL:=Q_RRO_KASSA_TS.FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt; // Фискальний номер РРО
  F_Main.NAME_KASSA_FISCAL_ALCOGOL:=Q_RRO_KASSA_TS.FieldByName('NAME_KASSA').AsString;    // Имя кассы РРО
  F_Main.Certificate_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('CERTIFICATE').AsString;   // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
  F_Main.PrivateKey_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('PRIVATE_KEY').AsString; // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
  F_Main.PasswordKey_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('PASSW').AsString;  // пароль к ключу

  L_CLI_Place_ALCOGOL.Caption:=F_Main.CLI_FISCAL_ALCOGOL;
  L_Kassa_Place_ALCOGOL.Caption:=F_Main.NAME_KASSA_FISCAL_ALCOGOL;
  Q_RRO_CERTIFIC.Close;
end;

procedure TFSettingConst.Reopen_Set_Interface(ID_INTERFACE:integer);
begin
 with ADS_Set_Interface do
 begin
   Close;
   Parameters.ParamByName('ID_INTERFACE').Value:=ID_INTERFACE;
   Open;
   First;
 end;
end;

procedure TFSettingConst.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Notebook1.PageIndex:= NewTab;
end;

procedure TFSettingConst.BitBtn2Click(Sender: TObject);
var i, ID_INTERFACE:integer;

begin
  try
    ID_INTERFACE:=StrToInt(E_ID_INTERFACE.Text)
  except
    MessageDlg( '№ интерфейса - не число!', mtError, [mbOk], 0);
    E_ID_INTERFACE.SetFocus;
    exit;
  end;

  if ID_INTERFACE=0 then
  begin
    MessageDlg( '№ интерфейса должен быть > 0 ( 0 - интерфейс по умолчанию)!', mtError, [mbOk], 0);
    E_ID_INTERFACE.SetFocus;
    exit;
  end;

  Reopen_Set_Interface(ID_INTERFACE);

  if ADS_Set_Interface.RecordCount>0 then
   begin
    if MessageDlg('Интерфейс №'+IntToStr(ID_INTERFACE)+' уже есть. Хотите его заменить значениями по умолчанию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Q_Interface_list.Locate('ID_INTERFACE',ID_INTERFACE, [loCaseInsensitive]);
      exit;
    end;
  end;

  for i:=0 to F_Main.ActionList1.ActionCount-1 do
  begin
   with ADOCommandInsert_SET_INERFACE do
   begin
    Parameters.ParamByName('NAME_ACTION').Value:=F_Main.ActionList1.Actions[i].Name;
    Parameters.ParamByName('CAPTION').Value:=F_Main.ActionList1.Actions[i].Caption;
    if F_Main.ActionList1.Actions[i].Visible then
      Parameters.ParamByName('VISIBLE').Value:=1
    else
      Parameters.ParamByName('VISIBLE').Value:=0;
    Parameters.ParamByName('ID_INTERFACE').Value:=ID_INTERFACE;
    Execute;
   end; // with ADOCommandInsert_SET_INERFACE do
  end; // for i:=0 to F_Main.ActionList1.ActionCount-1 do
  Reopen_Set_Interface(ID_INTERFACE);
end;

procedure TFSettingConst.CB_IS_EXIST_ALCO_KASSAClick(Sender: TObject);
begin
  if CB_IS_EXIST_ALCO_KASSA.Checked then  F_Main.IS_EXIST_ALCO_KASSA:=1
  else F_Main.IS_EXIST_ALCO_KASSA:=0;
  Panel_Alco_Kassa.Visible:= CB_IS_EXIST_ALCO_KASSA.Checked;

end;

procedure TFSettingConst.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with ADS_CONST_VALUES do
  begin
    if state in [dsEdit, dsInsert] then
    begin
      if MessageDlg('Данные не сохранены! Сохранить?', mtWarning,
      [mbNo, mbYes], 0)= mrYes then Post;
      CanClose:=(MessageDlg('Закрыть окно?', mtWarning,
      [mbNo, mbYes], 0)= mrYes)

    end; //  if state in [dsEdit, dsInsert] then
  end; // with ADS_CONST_VALUES do

  Q_Interface_list.Close;
  ADS_Set_Interface.Close;
  if F_main<>nil then
  begin
    F_main.FormCreate(Sender);
    F_main.FormShow(Sender);
  end;

end;

procedure TFSettingConst.FormCreate(Sender: TObject);
begin
  TabSet1.TabIndex:=0;
  Notebook1.PageIndex:= TabSet1.TabIndex;

  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);

  F_Main.ID_CLI_FISCAL:=IniFile.ReadInteger('workplace', 'ID_CLI_FISCAL',F_Main.ID_CLI_FISCAL);
  F_Main.ID_RRO_KASSA_FISCAL:= IniFile.ReadInteger('workplace', 'ID_RRO_KASSA_FISCAL',F_Main.ID_RRO_KASSA_FISCAL);
  F_Main.NAME_KASSA_FISCAL:= IniFile.ReadString('workplace', 'NAME_KASSA_FISCAL',F_Main.NAME_KASSA_FISCAL);
  F_Main.CLI_FISCAL:= IniFile.ReadString('workplace', 'CLI_FISCAL',F_Main.CLI_FISCAL);
  F_Main.USE_CERTIFIKATE:= IniFile.ReadInteger('workplace', 'USE_CERTIFIKATE',F_Main.USE_CERTIFIKATE);
  RG_USE_CERTIFIKATE.ItemIndex:=F_Main.USE_CERTIFIKATE;

  F_Main.URL_RRO_Server:=IniFile.ReadString('workplace', 'URL_RRO_Server',F_Main.URL_RRO_Server);
  F_Main.IS_EXIST_ALCO_KASSA:= IniFile.ReadInteger('workplace', 'IS_EXIST_ALCO_KASSA',F_Main.IS_EXIST_ALCO_KASSA);

  L_CLI_Place.Caption:=F_Main.CLI_FISCAL;
  L_Kassa_Place.Caption:=F_Main.NAME_KASSA_FISCAL;
  E_URL_RRO_Server.Text:=F_Main.URL_RRO_Server;
  if F_Main.USE_CERTIFIKATE=0 then L_Use_Certificate.Caption:='Сертификат предприятия'
  else L_Use_Certificate.Caption:='Сертификат кассы';



 if F_Main.IS_EXIST_ALCO_KASSA=1 then
 begin
    // Алкогольная касса
   F_Main.ID_CLI_FISCAL_ALCOGOL:=IniFile.ReadInteger('workplace', 'ID_CLI_FISCAL_ALCOGOL',F_Main.ID_CLI_FISCAL_ALCOGOL);
   F_Main.ID_RRO_KASSA_FISCAL_ALCOGOL:= IniFile.ReadInteger('workplace', 'ID_RRO_KASSA_FISCAL_ALCOGOL',F_Main.ID_RRO_KASSA_FISCAL_ALCOGOL);
   F_Main.NAME_KASSA_FISCAL_ALCOGOL:= IniFile.ReadString('workplace', 'NAME_KASSA_FISCAL_ALCOGOL',F_Main.NAME_KASSA_FISCAL_ALCOGOL);
   F_Main.CLI_FISCAL_ALCOGOL:= IniFile.ReadString('workplace', 'CLI_FISCAL_ALCOGOL',F_Main.CLI_FISCAL_ALCOGOL);

   L_CLI_Place_ALCOGOL.Caption:=F_Main.CLI_FISCAL_ALCOGOL;
   L_Kassa_Place_ALCOGOL.Caption:=F_Main.NAME_KASSA_FISCAL_ALCOGOL;

 end;



 CB_IS_EXIST_ALCO_KASSA.Checked:=(F_Main.IS_EXIST_ALCO_KASSA=1);
 Panel_Alco_Kassa.Visible:= CB_IS_EXIST_ALCO_KASSA.Checked;

 FreeAndNil(IniFile);
end;

procedure TFSettingConst.FormShow(Sender: TObject);
begin
 with ADS_CONST_VALUES do
 begin
   Open;
 end;
 Q_PrinterSetup.Close;
 Q_PrinterSetup.Open;
 Q_Interface_list.Close;
 Q_Interface_list.Open;
 Q_Interface_list.First;
 Reopen_Set_Interface(Q_Interface_list.FieldByName('ID_INTERFACE').AsInteger);
 QFOP.Close;
 QFOP.Parameters.ParamByName('ID_TT').Value:=F_Main.ID_TRADE_POINT;
 QFOP.Open;
 QFOP.Locate('ID_CLI', F_Main.ID_CLI_FISCAL, [loCaseInsensitive]);
 Q_RRO_KASSA_TS.Close;
 Q_RRO_KASSA_TS.Parameters.ParamByName('ID_CLI').Value:=QFOP.FieldByName('ID_CLI').AsInteger;
 Q_RRO_KASSA_TS.Open;

 Q_RRO_KASSA_TS.Locate('ID_RRO_KASSA', F_Main.ID_RRO_KASSA_FISCAL, [loCaseInsensitive]);

 if F_Main.USE_CERTIFIKATE=0 then L_DATE_END_CERTIFICATE.Caption:=
    'Действует до '+DateToStr(QFOP.FieldByName('DATE_END_CERTIFICATE').AsDateTime)
  else L_DATE_END_CERTIFICATE.Caption:=
    'Действует до '+DateToStr(Q_RRO_KASSA_TS.FieldByName('DATE_END_CERTIFICATE').AsDateTime);

end;

procedure TFSettingConst.QFOPAfterScroll(DataSet: TDataSet);
begin
Q_RRO_KASSA_TS.Close;
Q_RRO_KASSA_TS.Parameters.ParamByName('ID_CLI').Value:=QFOP.FieldByName('ID_CLI').AsInteger;
Q_RRO_KASSA_TS.Open;

end;

procedure TFSettingConst.Q_Interface_listAfterScroll(DataSet: TDataSet);
begin
 Reopen_Set_Interface(Q_Interface_list.FieldByName('ID_INTERFACE').AsInteger);
end;

procedure TFSettingConst.ReOpenPrinterSetup(vPrinterIndex:integer);
begin
  with Q_PrinterSetup do
  begin
    Close;
    Open;
    Locate('PRINTER_INDEX', vPrinterIndex, [loCaseInsensitive]);
  end;
end;

end.
