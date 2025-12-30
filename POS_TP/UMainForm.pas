unit UMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, System.IniFiles, Data.Win.ADODB, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.UITypes, Vcl.Tabs,IdSSLOpenSSL,
  uPosAPI;



  type TPAYFORMS = record
    PAYFORMCD:integer;
    PAYFORMNM:string;
    SUM:extended;
  end;

  type TTAXES = record
    TYPE_TAX:integer;
    NAME:string;
    LETTER:string;
    PRC:extended;
    SIGN:boolean;
    TURNOVER:extended;
    TURNOVERDISCOUNT:extended;
    SOURCESUM:extended;
    SUM:extended;
  end;

  type TZREPREALIZ = record
    SUM:extended;
    RNDSUM:extended;
    NORNDSUM:extended;
    ORDERSCNT:integer;
    PAYFORMS: array of TPAYFORMS;
    TAXES: array of TTAXES
  end;

  type TZREPRETURN  = record
    SUM:extended;
    ORDERSCNT:integer;
    PAYFORMS: array of TPAYFORMS;
    TAXES: array of TTAXES
  end;
  type TZREPBODY  = record
    SERVICEINPUT:extended;
    SERVICEOUTPUT:extended;
  end;

  type TZ_REP = record
   ZREPREALIZ:TZREPREALIZ;
   ZREPRETURN:TZREPRETURN;
   ZREPBODY:TZREPBODY;

  end;

   // инфо о смене
  type TShiftItem = record
    ShiftId: Int64; // 21256700,
    OpenShiftFiscalNum: string; //  914814220
    CloseShiftFiscalNum: string; // 915098051
    Opened: TDateTime; //"2023-04-13T10:58:15.601988"
    OpenName:string; // "Тестовий платник 4 (Тест)"
    OpenSubjectKeyId:string; // "9453d76f39229104e9a64da46752040e0081a64ff6c755fdc986cf4dd418dfba"
    Closed:TDateTime; // "2023-04-13T12:14:47"
    CloseName:string; // "Тестовий платник 4 (Тест)"
    CloseSubjectKeyId:string; // "9453d76f39229104e9a64da46752040e0081a64ff6c755fdc986cf4dd418dfba"
    ZRepFiscalNum:string; // "915098023"
  end;

  type TShifts = array of TShiftItem;




  type TDocumentItem = record
    NumFiscal: string; // Фіскальний номер документа
    NumLocal: int64;  // Локальний номер документа
    DocDateTime:TDateTime; // Дата і час операції, зафіксованої документом
    DocClass:string;  // Клас документа (“Check”, “ZRep”)
    CheckDocType:string; // Тип чека (“SaleGoods”, …)
    CheckDocSubType:string; // Розширений тип чека (“CheckGoods”, …)
    Revoked:boolean; // Ознака відкликаного документа
    Storned:boolean; // Ознака сторнованого документа
  end;

  type TDocuments = array of TDocumentItem;

type
  TF_main = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActionExit: TAction;
    Files: TMenuItem;
    N_Exit: TMenuItem;
    ActionUsersConnectControl: TAction;
    N1: TMenuItem;
    ActionSale: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionConnectRemoteDB: TAction;
    ActionConnectRemoteDB1: TMenuItem;
    ActionUsers: TAction;
    Catalogs: TMenuItem;
    PlanSCH: TMenuItem;
    Users: TMenuItem;
    ActionDisconnectRemoteDB: TAction;
    N4: TMenuItem;
    StatusBar1: TStatusBar;
    ActionLoadSpravochniki: TAction;
    N8: TMenuItem;
    ActionUpLoadData: TAction;
    N5: TMenuItem;
    ActionVozvr: TAction;
    Action11: TMenuItem;
    ActionInventTS: TAction;
    N6: TMenuItem;
    ActionKassaReport: TAction;
    ActionOrdersTNP: TAction;
    ActionPrihodTNP: TAction;
    ActionClients: TAction;
    N7: TMenuItem;
    ActionKateg_Cli: TAction;
    N9: TMenuItem;
    ActionVozvratTNP: TAction;
    ActionSettingConst: TAction;
    N10: TMenuItem;
    Q_ConstValues: TADOQuery;
    ActionInventKassa: TAction;
    N11: TMenuItem;
    ActionOrdersKolbasa: TAction;
    ActionOrdersMyaso: TAction;
    ActionVozvratKolbasa: TAction;
    ActionVozvratMyaso: TAction;
    ActionVerevki: TAction;
    ActionObrezi: TAction;
    ActionZatraty: TAction;
    ActionInkassa: TAction;
    ActionPrihodKolbasa: TAction;
    ActionPrihidMyaso: TAction;
    ActionOrdersTov: TAction;
    ActionOrdersTara: TAction;
    ActionPrihodTov: TAction;
    ActionPrihodTara: TAction;
    ActionVozvratTov: TAction;
    ActionVozvratTara: TAction;
    QNEW_PRICE_POS: TADOQuery;
    DS_QNEW_PRICE_POS: TDataSource;
    QNEW_PRICE_POSNAME: TWideStringField;
    QNEW_PRICE_POSGRUPTOV: TWideStringField;
    QNEW_PRICE_POSPRICE2: TFloatField;
    QNEW_PRICE_POSID_TOV: TIntegerField;
    QNEW_PRICE_POSEDIZM: TWideStringField;
    QUsersTP: TADOQuery;
    QNEW_PRICE_POSCODE: TWideStringField;
    Q_Advert: TADOQuery;
    Q_SHTRIH_CODE_TOV_NEW_POS: TADOQuery;
    Command_Del_SHTRIH_CODE_TOV_NEW: TADOCommand;
    ActionInventVozvrTara: TAction;
    ActionTovReportProdaga: TAction;
    ADOCommandDeleteOld_Doc: TADOCommand;
    ActionTovReportOborot: TAction;
    ActionOrdersOvochi: TAction;
    ActionPrihodOvochi: TAction;
    ActionSpisanieOvochi: TAction;
    ActionPrvo: TAction;
    N12: TMenuItem;
    ActionControl_NOT_SAVED_DOC: TAction;
    N13: TMenuItem;
    Action_NULL_CHECK: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    QTradepointInfo: TADOQuery;
    ActionVozvrDolg: TAction;
    Q_SVERKA_DOC_For_Export: TADOQuery;
    ActionPeredachaTtToTt: TAction;
    ActionPrihodTtToTt: TAction;
    Q_TramsmissionDoc: TADOQuery;
    Q_Reception: TADOQuery;
    ADOCommandUnSetExportDoc: TADOCommand;
    Q_Set_Interface: TADOQuery;
    Panel2: TPanel;
    ActionStartSmeny: TAction;
    ActionStopSmeny: TAction;
    Q_RRO_CERTIFIC: TADOQuery;
    Q_RRO_KASSA_TS: TADOQuery;
    IdHTTP1: TIdHTTP;
    Panel3: TPanel;
    GB_Oper_Client: TGroupBox;
    BB_Return_Tov: TBitBtn;
    BB_Sale: TBitBtn;
    BitBtn33: TBitBtn;
    GB_Oper_Invent: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn25: TBitBtn;
    GB_Oper_Data: TGroupBox;
    BBUpLoadData: TBitBtn;
    BBLoadSpravochniki: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    D_From: TDateTimePicker;
    D_To: TDateTimePicker;
    T_From: TDateTimePicker;
    T_To: TDateTimePicker;
    BitBtn32: TBitBtn;
    GroupBox2: TGroupBox;
    D_Work: TDateTimePicker;
    T_Work: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    Notebook1: TNotebook;
    TabSet1: TTabSet;
    Panel6: TPanel;
    GB_Oper_Vendor: TGroupBox;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    Panel7: TPanel;
    GroupBox4: TGroupBox;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    Panel8: TPanel;
    GB_Oper_Kassa: TGroupBox;
    BBInkassacia: TBitBtn;
    BBZatraty: TBitBtn;
    Panel_RRO: TPanel;
    GB_Alco_Kassa: TGroupBox;
    GB_Main_Kassa: TGroupBox;
    L_CLI_FISCAL: TLabel;
    L_NAME_KASSA_FISCAL: TLabel;
    BB_Shift_Begin: TBitBtn;
    L_NAME_KASSA_FISCAL_ALCOGOL: TLabel;
    L_CLI_FISCAL_ALCOGOL: TLabel;
    L_shift_Opened: TLabel;
    L_shift_user: TLabel;
    L_shift_Opened_ALCOGOL: TLabel;
    L_shift_user_ALCOGOL: TLabel;
    BB_Shift_Begin_ALCOGOL: TBitBtn;
    ActionStartSmeny_Alcogol: TAction;
    BB_Close_smena: TBitBtn;
    BitBtn36: TBitBtn;
    ActionStopSmeny_Alcogol: TAction;
    N_CleanUp: TMenuItem;
    ActionCleanUp: TAction;
    Action1: TAction;
    ActionCleanUp_Alcogol: TAction;
    N_CleanUp_ALCOGOL: TMenuItem;
    ActionTransactionsRegistrarState: TAction;
    ActionTransactionsRegistrarState_Alcogol: TAction;
    N_TransactionsRegistrarState: TMenuItem;
    N_TransactionsRegistrarState_Alcogol: TMenuItem;
    BB_LastShiftTotals: TBitBtn;
    ActionLastShiftTotals: TAction;
    ActionLastShiftTotals_Alcogol: TAction;
    BB_LastShiftTotals_Alcogol: TBitBtn;
    ActionKassaIn: TAction;
    ActionKassaIn_Alcogol: TAction;
    BBKassaIn: TBitBtn;
    BBKassaIn_Alcogol: TBitBtn;
    ActionKassaOut: TAction;
    ActionKassaOut_Alcogol: TAction;
    BBKassaOut: TBitBtn;
    BitBtn2: TBitBtn;
    ActionDateOperEnableDisable: TAction;
    N16: TMenuItem;
    Panel11: TPanel;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BB_PrintCennik: TBitBtn;
    CB_IS_EXISTS: TCheckBox;
    DBGrid1: TDBGrid;
    BBClose: TBitBtn;
    PRRO_ON_OFF: TMenuItem;
    ShapePRRO: TShape;
    N17: TMenuItem;
    BitBtn4: TBitBtn;
    Table_D_START_SMEN: TADOTable;
    L_DurationSmena_ALCOGOL: TLabel;
    L_DurationSmena: TLabel;
    GroupBox8: TGroupBox;
    BBCloseDay_NotFiscal: TBitBtn;
    Memo1: TMemo;
    N_OpenShift: TMenuItem;
    N18: TMenuItem;
    BitBtn1: TBitBtn;
    ActionOrdersVozvratTNP: TAction;
    LOAD_SPRAV_ON_OFF: TMenuItem;
    Q_CONTROL_REG_RRO: TADOQuery;
    QInventExists: TADOQuery;
    Q_All_ConstValues: TADOQuery;
    N19: TMenuItem;
    N20: TMenuItem;
    ADOCommandInsert_CONST_VALUES: TADOCommand;
    ADOCommandDelete_CONST_VALUES: TADOCommand;
    Q_Not_Sent_Docs: TADOQuery;
    Q_Not_Sent_DocsD_DOC: TDateTimeField;
    Q_Not_Sent_DocsCOUNT_DOC: TIntegerField;
    DS_Q_Not_Sent_Docs: TDataSource;
    Q_NotFinalDoc: TADOQuery;
    DS_Q_NotFinalDoc: TDataSource;
    Q_NotFinalDocNAMEDOC: TWideStringField;
    Q_NotFinalDocD: TDateTimeField;
    Q_NotFinalDocNN: TWideStringField;
    Q_NotFinalDocTOT_SUM: TFloatField;
    ADOCommandDeleteNotFinalDoc: TADOCommand;
    Q_NotFinalDocID_NAKLCAP: TAutoIncField;
    Q_NotFinalDocID_DOC_TYPE: TIntegerField;
    Q_Not_Sent_DocsID_DOC_TYPE: TIntegerField;
    Q_Not_Sent_DocsNAMEDOC: TWideStringField;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionUsersConnectControlExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionSaleExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure D_WorkChange(Sender: TObject);
    procedure D_WorkExit(Sender: TObject);
    procedure T_WorkChange(Sender: TObject);
    procedure T_WorkExit(Sender: TObject);
    procedure ActionConnectRemoteDBExecute(Sender: TObject);
    procedure ActionUsersExecute(Sender: TObject);
    procedure ActionDisconnectRemoteDBExecute(Sender: TObject);
    procedure ActionLoadSpravochnikiExecute(Sender: TObject);
    procedure ActionUpLoadDataExecute(Sender: TObject);
    procedure ActionVozvrExecute(Sender: TObject);
    procedure ActionInventTSExecute(Sender: TObject);
    procedure ActionKassaReportExecute(Sender: TObject);
    procedure ActionOrdersTNPExecute(Sender: TObject);
    procedure ActionPrihodTNPExecute(Sender: TObject);
    procedure ActionClientsExecute(Sender: TObject);
    procedure ActionKateg_CliExecute(Sender: TObject);
    procedure ActionSettingConstExecute(Sender: TObject);
    procedure ActionInventKassaExecute(Sender: TObject);
    procedure ActionVozvratTNPExecute(Sender: TObject);
    procedure ActionOrdersKolbasaExecute(Sender: TObject);
    procedure ActionOrdersMyasoExecute(Sender: TObject);
    procedure ActionVozvratKolbasaExecute(Sender: TObject);
    procedure ActionVozvratMyasoExecute(Sender: TObject);
    procedure ActionObreziExecute(Sender: TObject);
    procedure ActionVerevkiExecute(Sender: TObject);
    procedure ActionInkassaExecute(Sender: TObject);
    procedure ActionZatratyExecute(Sender: TObject);
    procedure ActionPrihodKolbasaExecute(Sender: TObject);
    procedure ActionPrihidMyasoExecute(Sender: TObject);
    procedure ActionOrdersTovExecute(Sender: TObject);
    procedure ActionOrdersTaraExecute(Sender: TObject);
    procedure ActionPrihodTovExecute(Sender: TObject);
    procedure ActionPrihodTaraExecute(Sender: TObject);
    procedure ActionVozvratTovExecute(Sender: TObject);
    procedure ActionVozvratTaraExecute(Sender: TObject);
    procedure BB_PrintCennikClick(Sender: TObject);
    procedure CB_IS_EXISTSClick(Sender: TObject);
    procedure ActionInventVozvrTaraExecute(Sender: TObject);
    procedure ActionTovReportProdagaExecute(Sender: TObject);
    procedure ActionTovReportOborotExecute(Sender: TObject);
    procedure ActionOrdersOvochiExecute(Sender: TObject);
    procedure ActionPrihodOvochiExecute(Sender: TObject);
    procedure ActionSpisanieOvochiExecute(Sender: TObject);
    procedure BB_PrintCennikMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionPrvoExecute(Sender: TObject);
    procedure ActionControl_NOT_SAVED_DOCExecute(Sender: TObject);
    procedure Action_NULL_CHECKExecute(Sender: TObject);
    procedure ActionVozvrDolgExecute(Sender: TObject);
    procedure ActionPeredachaTtToTtExecute(Sender: TObject);
    procedure ActionPrihodTtToTtExecute(Sender: TObject);
    procedure ActionStartSmenyExecute(Sender: TObject);
    procedure ActionStopSmenyExecute(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ActionStartSmeny_AlcogolExecute(Sender: TObject);
    procedure ActionStopSmeny_AlcogolExecute(Sender: TObject);
    procedure ActionCleanUpExecute(Sender: TObject);
    procedure ActionCleanUp_AlcogolExecute(Sender: TObject);
    procedure ActionTransactionsRegistrarStateExecute(Sender: TObject);
    procedure ActionTransactionsRegistrarState_AlcogolExecute(Sender: TObject);
    procedure ActionLastShiftTotalsExecute(Sender: TObject);
    procedure ActionLastShiftTotals_AlcogolExecute(Sender: TObject);
    procedure ActionKassaInExecute(Sender: TObject);
    procedure ActionKassaIn_AlcogolExecute(Sender: TObject);
    procedure ActionKassaOutExecute(Sender: TObject);
    procedure ActionKassaOut_AlcogolExecute(Sender: TObject);
    procedure ActionDateOperEnableDisableExecute(Sender: TObject);
    procedure PRRO_ON_OFFClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BBCloseDay_NotFiscalClick(Sender: TObject);
    procedure N_OpenShiftClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure ActionOrdersVozvratTNPExecute(Sender: TObject);
    procedure LOAD_SPRAV_ON_OFFClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure Q_Not_Sent_DocsAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    iniFile:TIniFile;
    name_ini_File : string;
    ID_TRADE_POINT:longint;
    NAME_TRADE_POINT:string;
    COM_PORT:string;        // порты принтеров чеков
    COM_PORT_FISCAL:string;
    PASSW_FISCAL:string;
    GRUP_FISCAL:string;  // налоговая группа

    COM_PORT_BANK_TERM_NOT_FISCAL:string;   // порты банковских терминалов
    COM_PORT_BANK_TERM_FISCAL:string;

    CHECK_TITLE_FIRM_NAME:string;
    CHECK_HOT_LINE_FIRM_TEL:string;
    CHECK_FOOTER_SLOGAN :string;
    CHECK_FOOTER_TXT :string;
    EACH_NAL_REGISTER_RRO:integer;   // регистрировать РРО каждый  EACH_NAL_REGISTER_RRO нальный чек
    EACH_BEZNAL_REGISTER_RRO:integer; // регистрировать РРО каждый  EACH_BEZNAL_REGISTER_RRO безнальный чек
    WRITE_DEBUG_INFO_RRO:integer; // выводить или нет отладочную информацию по РРО
    RRO_ENABLED:integer; //  0- не использовать ПРРО; 1- использовать ПРРО
    MANUAL_CONTROL_RRO:integer; // 0 автоматическое 1 - ручное управление ПРРО
    IS_RECEPT_TO_REGISTR_RRO:boolean; //признак необходимости регистрировать чек ПРРО
    QRTEXT_UNREGISTER_RRO:string;  //QR текст не зарегистрированного чека (url сайта с информацией о чеке)
    MAX_REAL_RRO:Extended; // Максимальная сумма реализации для регистрации РРО
    Now_SUM_KAS_RRO,Now_SUM_KAS:Extended; // текущие суммы в кассах
    CONTROL_SDACHA_RRO,CONTROL_SDACHA:integer; // Контроль сдачи и остатков по кассе РРО
    EDIT_DOC_ENABLE:integer; // разрешить редакрировать документы продажи
    TIMEOUT_BANK_TERM:integer; // время ожидания отклика банк терминала
    SHOW_OSTATKI:integer; //  Показывать остатки товаров в продаже и инвентаризации 0-нет 1-да
    SHOW_FISCAL_REP:integer; // Показывать фискальные отчеты 0-нет 1-да
    BLOCKING_MANUAL_WEIGHT_ENTRY:integer; // Блокировка ввода веса вручную 0-нет 1-да
    DEFERRED_PAYMENT:integer; // Отложенная оплата не разрешена 0; разрешена 1
    BANK_TERMINAL:integer; // Тип банк.терминала 0-Verifone; 1-Ingenico


    is_connect_server:boolean;
    CTRLBoolean:integer;

    IS_USE_DOLG_POKUPAT:integer; // возможность продажи в долг зарегистрированным покупателям
    ID_INTERFACE:integer; // вариант интерфейса приложения

    ID_CLI_FISCAL:longint; // Предприятие от имени которого передаются фискальные данные (ФОП)
    CLI_FISCAL:string;
    INN_CLI_FISCAL:string;  // ИНН предприятия от имени которого передаются фискальные данные (ФОП)
    ID_RRO_KASSA_FISCAL :longint; // id РРО кассы из таблицы RRO_KASSA_TS
    ID_NUM_FISCAL_KASSA: int64; // Фискальний номер РРО
    NAME_KASSA_FISCAL:string;    // Имя кассы РРО
    Certificate: string;   // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
    PrivateKey: string;   // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
    PasswordKey: string;  // пароль к ключу
    DATE_END_CERTIFICATE:TDateTime; //дата действия сертификата
    USE_CERTIFIKATE:integer; // использовать сертификат предприятия (0); кассы (1)


    // тоже для алкоголя
    ID_CLI_FISCAL_ALCOGOL:longint; // Предприятие от имени которого передаются фискальные данные (ФОП)
    CLI_FISCAL_ALCOGOL:string;
    INN_CLI_FISCAL_ALCOGOL:string;  // ИНН предприятия от имени которого передаются фискальные данные (ФОП)
    ID_RRO_KASSA_FISCAL_ALCOGOL :longint; // id РРО кассы из таблицы RRO_KASSA_TS
    ID_NUM_FISCAL_KASSA_ALCOGOL: int64; // Фискальний номер РРО
    NAME_KASSA_FISCAL_ALCOGOL:string;    // Имя кассы РРО
    Certificate_ALCOGOL: string;   // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
    PrivateKey_ALCOGOL: string;   // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
    PasswordKey_ALCOGOL: string;  // пароль к ключу
    DATE_END_CERTIFICATE_ALCOGOL:TDateTime; //дата действия сертификата
    USE_CERTIFIKATE_ALCOGOL:integer; // использовать сертификат предприятия (0); кассы (1)

    IS_EXIST_ALCO_KASSA:integer; // 0- нет алкогольной кассы на этом раб.месте; 1- есть

    URL_RRO_Server: string;  // URL РРО сервера fsapi

    IS_shift_Opened:integer; // признак откратия рабочей смены кассы
    IS_shift_Opened_ALCOGOL:integer; // признак откратия рабочей смены алкогольной кассы
    DataTimeShift_Opened, DataTimeShift_Opened_ALCOGOL :TDateTime;


    shift_user,shift_user_ALCOGOL:string; // имя  открывшего смену
    OpenShiftFiscalNum:string;  // Фискальный номер документа Відкриття зміни
    ShiftId:int64; //  Ідентифікатор зміни
    OpenShiftFiscalNum_ALCOGOL:string;  // Фискальный номер документа Відкриття зміни
    ShiftId_ALCOGOL:int64; //  Ідентифікатор зміни

    ZRepNumFiscal, ZRepNumFiscal_ALCOGOL:string; // фискальные номера Z-отчетов
    ostat_kassy, ostat_kassy_RRO, ostat_kassy_ALCOGOL :extended;  // остатки касс расчитываются X-отчетом LastShiftTotals

    IS_KASSA_OFFLINE:boolean;         // состояние кассы
    IS_KASSA_OFFLINE_ALCOGOL:boolean;
    Last_IS_RECEPT_TO_REGISTR_RRO:boolean;
    Last_IS_BEZNAL_OPL:boolean;

    IS_LOAD_SPRAV:boolean;


    function get_nums_doc(ID_DOC_TYPE: integer; var n:integer):integer;
    function LoginQuery(vLogin,vPassw:string; var v_comment: string): Boolean;

    function LoadKateg_Cli:boolean;
    procedure UpdateKategCliList;
    function LoadClients:boolean;
    procedure UpdateClientsList;
    function LoadBonuses:boolean;
    procedure UpdateBonusesList;
    function LoadGrTov:boolean;
    procedure UpdateGrTovList;
    function LoadTov:boolean;
    procedure UpdateTovList;
    function LoadBARCODES:boolean;
    procedure UpdateBARCODESList;
 //   function LoadPRICE_DATE:boolean;
//    procedure UpdatePRICE_DATEList;
    function LoadUserPRICE:boolean;
    procedure UpdateUserPRICE;
    function LoadCapDocum(ID_DOC_TYPE:longint):boolean;
    function LoadTovDocum(ID_DOC_TYPE:longint):boolean;
    function LoadNaveskiDocum(ID_DOC_TYPE:longint):boolean;
    function LoadDocum(ID_DOC_TYPE:longint):boolean;
    procedure UpdateDocum(ID_DOC_TYPE:longint);
    function LoadSkidka:boolean;
    procedure UpdateSkidka;
    function LoadNEW_PRICE_POS:boolean;
    procedure UpdateNEW_PRICE_POS;
    function LoadAdvert:boolean;
    procedure UpdateAdvert;
    function LoadUserTradePoint:boolean;
    procedure UpdateUserTradePoint;
    // получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
    function LoadKIO_OPERATIONS_GRUP:boolean;
    procedure UpdateKIO_OPERATIONS_GRUP;

    // получение таблицы продукции собственного пр-ва
    function LoadPRODUCT_POS:boolean;
    procedure UpdatePRODUCT_POS;
    // получение таблицы норм продукции собственного пр-ва
    function LoadNORM_ASSEMB_POS:boolean;
    procedure UpdateNORM_ASSEMB_POS;

    function Load_NaklCap_ForExport:boolean;
    function Load_NaklTov_ForExport:boolean;
    function LoadTablesForExport:boolean;
    function Load_Naveski_ForExport:boolean;
    function Load_CLIENTS_NEW_POS_ForExport:boolean;
    function Load_SHTRIH_CODE_TOV_NEW_POS_ForExport:boolean;
    // загрузка вспомогательной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT для экспрота данных в основную БД
    function Load_SVERKA_DOC_POS_ForExport:boolean;
    function LoadKUPON_CARD:boolean;

    // загрузка  таблицы CONST_VALUES_TP для экспрота-импорта данных в-из основную БД
    function Load_CONST_VALUES_TP_ForExport:boolean;
    // выгрузка данных CONST_VALUES о настройках торговой точки в основную БД
    function UpLoad_CONST_VALUES_Export():boolean;

    procedure UpdateKUPON_CARD;

    // получение сертификатов, ключей, паролей ФОП, работающей с тт  ID_TRADE_POINT
    function LoadRRO_CERTIFIC:boolean;
    procedure UpdateRRO_CERTIFIC;
    // получение инфо о кассах работающих в тт  ID_TRADE_POINT
    function LoadRRO_KASSA_TS:boolean;
    procedure UpdateRRO_KASSA_TS;

     // импорт признака сверки в учетную БД
    function Import_SVERKA_Doc_POS:boolean;

    function UpLoadDocForExport(d1,d2:TDateTime; is_filter:boolean):boolean;
    function Import_Doc_POS:boolean;
    function DELETE_TMP_DOC_POS:boolean;
 //   procedure CennikPrint(productName, groupName: string; price: extended; id: integer;
 //   shtrihcode  :string);
    procedure RemoteDBConnect;
    function DeleteTramsmissionDoc(d1,d2:TDateTime):boolean;
    function DeleteTramsmissionDoc_Do(ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime; var ER_COMMENT:string):boolean;

    function Transfer_Data_To_Fiskal_Server(JsonToSend: TStringStream; var sResponse:string; var is_repeat:boolean):boolean;
    function SetupRRO(is_ALCOGOL:boolean):boolean;
    function SetupRegistrar(is_ALCOGOL:boolean):boolean;
    function ObjectsRRO():boolean;  // Запрос доступных объектов ПРРО
    function TransactionsRegistrarState(is_ALCOGOL:boolean):boolean;
    function OpenShift(is_ALCOGOL:boolean):boolean;
    function CloseShift(is_ALCOGOL:boolean):boolean;
    function Cleanup(is_ALCOGOL:boolean):boolean;
    function LastShiftTotals(is_ALCOGOL,with_print:boolean):boolean;
    // внесение денег в кассу
    function RegisterKassa_In_Out_RRO(is_ALCOGOL, IS_IN: boolean; vID_NAKLCAP:longint; SumInOut:extended;
        var NumFiscal,  NumLocal, OrderDateTime :string ):boolean;
    // запрос Z-отчета по кассе с сервера
    function GetZRep(is_ALCOGOL:boolean):boolean;
    // перечень документов смены
    function GetDocumentsShift(is_ALCOGOL:boolean; ID_smeny:int64; var doc_list:TDocuments):boolean;
     // перечень смен за период
    function Shifts(is_ALCOGOL:boolean; vD_From, vD_To:TDateTime; var vShifts : TShifts):boolean;
    // запрос чека с фискального с сервера
    function GetCheck(is_ALCOGOL:boolean; is_print:boolean; vNumFiscal:string; var DataCheck :widestring):boolean;
    // регистрация чека в налоговой
    function RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
NumFiscal,  NumLocal, OrderDateTime :string; is_prodaga:boolean; ORDERRETNUM:string ):boolean;

    procedure KillTheApp;
    procedure AppExcept(Sender: TObject; E: Exception);
    procedure ControlDurationSmena(var DurationSmena, DurationSmena_ALCOGOL:extended; var IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL:integer);
    function Bank_Terminal_CloseDay(PORT:string):boolean;
    procedure PrintResponse(handle: POS_HANDLE);
    function CONTROL_REG_RRO:integer; //контроль не переданных документов для регистрации в налоговой
    procedure SetGlobalValues;
    function ControlFilterUpload(vD:TDatetime; vID_DOC_TYPE:Integer):boolean;
    procedure GetMinMaxDate(var d_min,d_max:TDateTime);
  end;

var
  F_main: TF_main;


implementation
uses USERS_WORK, UDataModule1, users_f, Login_form, // ClientModuleUnit1,
 USaleDocList, myfuncs, ClientClassesUnit1, System.JSON, UDataModule2,
DateUtils, KassaREport, CLIENT_F1, kateg_cli_f, SettingConst, Printers, //Codage_CB,
TovReport, reg_server, Print_Functions, Assemb_POS, URestore_doc, U_F_in_out_Kassa,
KassaReport_RRO, CShPorts_TLB, Smeny_Docs, USaleDoc, Invent_Confirm_Dlg, U_Not_Sent_Doc, Not_Final_Doc_Show;
{$R *.dfm}


procedure TF_main.KillTheApp;
begin
   Application.Terminate;
   Application.ProcessMessages;
   ExitProcess(0);
end;

procedure TF_main.AppExcept(Sender: TObject; E: Exception);
var BonusCard:string;
E_OPL_NAL_Text, E_SDACHA_TO_BONUS_CARD_Text, E_OPL_BONUS_Text,
E_D_RoundNotFiscal_Text, E_SDACHA_Text,
CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL:string;
ROUND_TOT_SUM_NOT_FISCAL, D_ROUND_TOT_SUM_NOT_FISCAL,
TOT_MONEY:extended;
IS_BANK_TRANSACTION_NOT_FISCAL:boolean;

begin
 
  if E.Message='[DBNETLIB][ConnectionWrite (send()).]Общая ошибка сети. Обратитесь к документации по сети' then
  begin
    ShowMessage('Плохой интернет! Будет выполнено переключение в локальный режим!');
    DM1.ADOConnection1.Connected:=False;
    DM1.ADOConnection1.ConnectionString:=Connect_info;
    DM1.ADOConnection1.Connected:=True;
    Q_Advert.Close;
    Q_Advert.Parameters.ParamByName('TYPE_MSG').Value:=5; // для покупателя
    Q_Advert.Open;

    QNEW_PRICE_POS.Close;
    QNEW_PRICE_POS.Parameters.ParamByName('ID_USER').Value:= id_user_select;
    if CB_IS_EXISTS.Checked then
     QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=1
    else  QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=0;
    QNEW_PRICE_POS.Open;

    with QTradepointInfo do
    begin
      Close;
      Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      Open;
      First;
    end;

    if FSaleDocList<>nil then
      FSaleDocList.FormShow(Sender);

    if F_SaleDoc<>nil then
    begin
      if F_SaleDoc.Edit_BonusCard.Text<>'' then  BonusCard:=F_SaleDoc.Edit_BonusCard.Text;
      E_OPL_NAL_Text:=F_SaleDoc.E_OPL_NAL.Text;
      E_SDACHA_TO_BONUS_CARD_Text:=F_SaleDoc.E_SDACHA_TO_BONUS_CARD.Text;
      E_SDACHA_Text:=F_SaleDoc.E_SDACHA.Text;
      E_OPL_BONUS_Text:=F_SaleDoc.E_OPL_BONUS.Text;
      ROUND_TOT_SUM_NOT_FISCAL:=F_SaleDoc.ROUND_TOT_SUM_NOT_FISCAL;
      D_ROUND_TOT_SUM_NOT_FISCAL:=F_SaleDoc.D_ROUND_TOT_SUM_NOT_FISCAL;
      E_D_RoundNotFiscal_Text:=F_SaleDoc.E_D_RoundNotFiscal.Text;
      TOT_MONEY:=F_SaleDoc.TOT_MONEY;
      IS_BANK_TRANSACTION_NOT_FISCAL:=F_SaleDoc.IS_BANK_TRANSACTION_NOT_FISCAL;
      CARD_NN_NOT_FISCAL:=F_SaleDoc.CARD_NN_NOT_FISCAL;
      CODE_TRANSACTION_NOT_FISCAL:=F_SaleDoc.CODE_TRANSACTION_NOT_FISCAL;

      F_SaleDoc.New_Doc(Self, False);
      F_SaleDoc.Edit_BonusCard.Text:=BonusCard;

      F_SaleDoc.FindBonusCard;
      if F_SaleDoc.Panel_Oplata.Visible then
      begin

      F_SaleDoc.Action_PayExecute(Self);

      F_SaleDoc.E_OPL_NAL.Text:=E_OPL_NAL_Text;
      F_SaleDoc.E_SDACHA.Text:=E_SDACHA_Text;
      F_SaleDoc.E_OPL_NALChange(Self);

      F_SaleDoc.E_SDACHA_TO_BONUS_CARD.Text := E_SDACHA_TO_BONUS_CARD_Text;
      F_SaleDoc.E_SDACHA_TO_BONUS_CARDChange(Self);

      F_SaleDoc.E_OPL_BONUS.Text:=E_OPL_BONUS_Text;
      F_SaleDoc.E_OPL_BONUSChange(Self);

      F_SaleDoc.TOT_MONEY:=TOT_MONEY;
      if IS_BANK_TRANSACTION_NOT_FISCAL then
       F_SaleDoc.Opl_Bank_Card(IS_BANK_TRANSACTION_NOT_FISCAL, CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL, False);
      end;
       MessageDlg('Локальный режим включен. Продолжайте работу!', mtInformation,
            [mbOk], 0);
    end;

    if F_KassaReport_RRO<>nil then
    begin
      Screen.Cursor :=0;
      F_KassaReport_RRO.FormShow(Sender);
    end;


  end
  else
  begin
    if E.ClassName=  'EJSONException' then
    begin
     ShowMessage('EJSONException');
    end
    else
    begin

      ShowMessage(E.Message+'--'+'Запусти программу заново и восстанови документ!');
      KillTheApp;
    end;
  end;
end;


function TF_main.LoginQuery(vLogin,vPassw:string; var v_comment: string): Boolean;
var
server:TServerMethods1Client;
result_login: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
begin
  result:=false;
   try

    server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
    result_login:=server.login_proc(vLogin,vPassw);

      {проходим по каждой паре}
      for i := 0 to result_login.Count-1 do
        begin
          JPair:=result_login.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='user' then
            user_remoute_DB:=JPair.JsonValue.Value;
          if MemberName='id_user' then
                 id_user_remoute_DB:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
                 comment:=JPair.JsonValue.Value;
          v_comment:=comment;
         end;
         result:=true;
   except
      user_remoute_DB:=Unknown_str;
      id_user_remoute_DB:=Unknown_code;
      comment:='Ошибка разбора JSON';
      v_comment:=comment;
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);

end;


procedure TF_main.N17Click(Sender: TObject);
var doc_list:TDocuments;
begin
    // Перечень документов смены ПРРО
  GetDocumentsShift(False, ShiftId, doc_list);
end;

procedure TF_main.N18Click(Sender: TObject);
begin
 // перечень смен за период
 F_Smeny_Docs_Dlg();
end;

procedure TF_main.N19Click(Sender: TObject);
begin
  if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
    ActionConnectRemoteDBExecute(Sender);
  if   is_connect_server then
  begin
   // выгрузка настроек на сервер
     if UpLoad_CONST_VALUES_Export() then
       MessageDlg('Выгрузка настроек на сервер успешна!', mtInformation, [mbOk], 0)
     else
       MessageDlg('Ошибка. Выгрузка настроек на сервер не выполнена!', mtError, [mbOk], 0);


    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      ActionDisconnectRemoteDBExecute(Sender);
  end;

end;

procedure TF_main.N20Click(Sender: TObject);
begin
// загрузка настроек с сервера
 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
    ActionConnectRemoteDBExecute(Sender);
  if   is_connect_server then
  begin
   // загрузка настроек с сервера
     if Load_CONST_VALUES_TP_ForExport() then
     begin
     // удалить старое содержание таблицы  CONST_VALUES
      ADOCommandDelete_CONST_VALUES.Execute;
      // вставить новое, прочитанное с сервера
      with DataModule2.CDS_CONST_VALUES_TP_EXPORT do
      begin
        First;
        while not EOF do
        begin
          ADOCommandInsert_CONST_VALUES.Parameters.ParamByName('ID_CONST').Value:=
            FieldByName('ID_CONST').AsInteger;
          ADOCommandInsert_CONST_VALUES.Parameters.ParamByName('CONST_NAME').Value:=
            FieldByName('CONST_NAME').AsString;
          ADOCommandInsert_CONST_VALUES.Parameters.ParamByName('CONST_VALUE').Value:=
            FieldByName('CONST_VALUE').AsString;
          ADOCommandInsert_CONST_VALUES.Parameters.ParamByName('COMMENT').Value:=
            FieldByName('COMMENT').AsString;

          ADOCommandInsert_CONST_VALUES.Execute;
          Next;
        end;

      end;

       FormCreate(Sender);  // пересоздать гл.окно после обновления настроек
       MessageDlg('Загрузка настроек с сервера успешна!', mtInformation, [mbOk], 0);
     end
     else
       MessageDlg('Ошибка. Загрузка настроек с сервера не выполнена!', mtError, [mbOk], 0);

    if DataModule2.CDS_CONST_VALUES_TP_EXPORT.Active then
    DataModule2.CDS_CONST_VALUES_TP_EXPORT.Close;

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      ActionDisconnectRemoteDBExecute(Sender);
  end;

end;

procedure TF_main.LOAD_SPRAV_ON_OFFClick(Sender: TObject);
begin
// вкл-выкл возможности загрузки справочников
//(если несколько рабочих мест работают с одной и той-же локад БД на торговой точке)
  IS_LOAD_SPRAV:= not IS_LOAD_SPRAV;

  if IS_LOAD_SPRAV then
   LOAD_SPRAV_ON_OFF.Caption:='Загрузка-выгрузка справочников - вкл'
  else LOAD_SPRAV_ON_OFF.Caption:='Загрузка-выгрузка справочников - выкл';
  BBLoadSpravochniki.Enabled:= IS_LOAD_SPRAV;
  BBUpLoadData.Enabled:= IS_LOAD_SPRAV;
  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  IniFile.WriteBool('workplace', 'IS_LOAD_SPRAV',IS_LOAD_SPRAV);
  FreeAndNil(IniFile);

end;

procedure TF_main.N_OpenShiftClick(Sender: TObject);
begin
  OpenShift(false);  // открытие смены
end;

procedure TF_main.ActionCleanUpExecute(Sender: TObject);
begin
 Cleanup(False);
end;

procedure TF_main.ActionCleanUp_AlcogolExecute(Sender: TObject);
begin
 Cleanup(True);
end;

procedure TF_main.ActionClientsExecute(Sender: TObject);
begin
  F_clientDlg_1(-1,'');
end;




procedure TF_main.RemoteDBConnect;
var v_user, v_passw, v_host, v_port, v_comment:string;
begin

  is_connect_server:=False;
  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  v_user:=IniFile.ReadString('login', 'log','Логин');
  v_passw:=IniFile.ReadString('login', 'passw','Пароль');
  v_host:=IniFile.ReadString('login', 'host','127.0.0.1');
  v_port:=IniFile.ReadString('login', 'port','211');
  FreeAndNil(IniFile);

     user_remoute_DB:=v_user;

     Host_server:=Trim(v_host); // IP удаленного сервера приложений
     Port_server:=Trim(v_port); // порт
     try
       DataModule2.SQLConnection1.Connected:=False;
       with DataModule2.SQLConnection1 do
       begin
        Params.Values['HostName']:= Host_server;
        Params.Values['Port']:= Port_server;
        end;
       DataModule2.SQLConnection1.Connected:=True;

       DataModule2.DSClientCallbackChannelManager1.DSHostname:=Host_server;
       DataModule2.DSClientCallbackChannelManager1.DSPort:=Port_server;
       if LoginQuery(v_user, v_passw, v_comment) then
       begin
        if  id_user_remoute_DB=Unknown_code then
        begin
          MessageDlg('Не зарегистрирован пользователь '+v_user+' или неверный пароль', mtInformation,
            [mbOk], 0);
        end
        else
        begin
          StatusBar1.Panels[0].Text:='Подключено к удаленной БД. Пользователь '+ user_remoute_DB;
          is_connect_server:=True;
        end;
       end
       else MessageDlg('Ошибка соединения с удаленной БД '+v_comment, mtInformation,
        [mbOk], 0);
     except
       MessageDlg('Ошибка соединения с удаленным сервером ', mtError,
        [mbOk], 0);

     end;

end;


procedure TF_main.ActionConnectRemoteDBExecute(Sender: TObject);
var v_user, v_passw, v_host, v_port, v_comment:string;
begin
  is_connect_server:=False;
  if F_LoginDLG(v_user, v_passw, v_host, v_port)=mrOk then
  begin
     user_remoute_DB:=v_user;

     Host_server:=Trim(v_host); // IP удаленного сервера приложений
     Port_server:=Trim(v_port); // порт
     try
      DataModule2.SQLConnection1.Connected:=False;
       with DataModule2.SQLConnection1 do
       begin
        Params.Values['HostName']:= Host_server;
        Params.Values['Port']:= Port_server;

        end;

       DataModule2.SQLConnection1.Connected:=True;

       DataModule2.DSClientCallbackChannelManager1.DSHostname:=Host_server;
       DataModule2.DSClientCallbackChannelManager1.DSPort:=Port_server;
       if LoginQuery(v_user, v_passw, v_comment) then
       begin
        if  id_user_remoute_DB=Unknown_code then
        begin
          MessageDlg('Не зарегистрирован пользователь '+v_user+' или неверный пароль', mtInformation,
            [mbOk], 0);
        end
        else
        begin
          StatusBar1.Panels[0].Text:='Подключено к удаленной БД. Пользователь '+ user_remoute_DB;
          is_connect_server:=True;
        end;
       end
       else MessageDlg('Ошибка соединения с удаленной БД '+v_comment, mtInformation,
        [mbOk], 0);
     except
       MessageDlg('Ошибка соединения с удаленным сервером ', mtError,
        [mbOk], 0);

     end;


  end;


end;

procedure TF_main.ActionControl_NOT_SAVED_DOCExecute(Sender: TObject);
begin
// проверка и восстановление несохраненных документов
  F_Restore_Doc_dlg;
end;

procedure TF_main.ActionDateOperEnableDisableExecute(Sender: TObject);
begin
  GroupBox1.Enabled:= not GroupBox1.Enabled;
  GroupBox2.Enabled:= not GroupBox2.Enabled;
end;

procedure TF_main.ActionDisconnectRemoteDBExecute(Sender: TObject);
var
server:TServerMethods1Client;
result_disconnect: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
begin
  try
    server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
     result_disconnect:=server.UnLogin_proc;


        {проходим по каждой паре}
          for i := 0 to result_disconnect.Count-1 do
          begin
            JPair:=result_disconnect.Pairs[i];//получили пару по её индексу
            MemberName:=JPair.JsonString.Value;//определили имя
            {ищем в какое свойство записывать значение}
            if MemberName='user' then
              user_remoute_DB:=JPair.JsonValue.Value;
            if MemberName='id_user' then
              id_user_remoute_DB:=StrToInt(JPair.JsonValue.Value);
            if MemberName='comment' then
              comment:=JPair.JsonValue.Value;

           end;
          StatusBar1.Panels[0].Text:='';


  except
    user_remoute_DB:=Unknown_str;
    id_user_remoute_DB:=Unknown_code;
    raise Exception.Create('Нет доступа к серверу приложений');
  end;
  is_connect_server:=False;
  FreeAndNil(server);

end;

procedure TF_main.ActionExitExecute(Sender: TObject);
begin
   Close;
end;



procedure TF_main.ActionInkassaExecute(Sender: TObject);
begin
  FSaleDocList_dlg(221,-1); // инкассация кассы - передача на НМК
end;

procedure TF_main.ActionInventKassaExecute(Sender: TObject);
begin
  FSaleDocList_dlg(224,-1); // инвентаризация кассы
end;

procedure TF_main.ActionInventTSExecute(Sender: TObject);
begin
   FSaleDocList_dlg(206,-1); // инвентаризация
end;

procedure TF_main.ActionInventVozvrTaraExecute(Sender: TObject);
begin
  FSaleDocList_dlg(242,-1); // инвентаризация возвратной тары
end;

procedure TF_main.ActionKassaInExecute(Sender: TObject);
var sumInOut:extended;
NumFiscal,  NumLocal, OrderDateTime :string;
begin
  // внесение кассы всегда фискальное
  F_main.IS_RECEPT_TO_REGISTR_RRO:=True;
  FSaleDocList_dlg (289,-1);// Внесение денег в кассу
{
  sumInOut:=0;
  if F_In_Out_KassaDlg( 0,True, sumInOut)=mrOk then
  begin
    if RegisterKassa_In_Out_RRO(False, True, sumInOut, NumFiscal,  NumLocal, OrderDateTime) then
      Print_Kassa_In_Out_RRO(0, true, sumInOut, NumFiscal,  NumLocal, OrderDateTime);
  end;
  }
end;

procedure TF_main.ActionKassaIn_AlcogolExecute(Sender: TObject);
var sumInOut:extended;
NumFiscal,  NumLocal, OrderDateTime :string;
vID_NAKLCAP:longint;
begin
  sumInOut:=0;
  if F_In_Out_KassaDlg(1,True, sumInOut)=mrOk then
  begin
    if RegisterKassa_In_Out_RRO(True, True, vID_NAKLCAP, sumInOut, NumFiscal,  NumLocal, OrderDateTime) then
      Print_Kassa_In_Out_RRO(1, true, sumInOut, NumFiscal,  NumLocal, OrderDateTime);
  end;
end;

procedure TF_main.ActionKassaOutExecute(Sender: TObject);
var sumInOut:extended;
NumFiscal,  NumLocal, OrderDateTime :string;
begin
  // изъятие кассы всегда фискальное
  F_main.IS_RECEPT_TO_REGISTR_RRO:=True;

  FSaleDocList_dlg (290,-1);// Изъятие денег из кассы

{
  if MessageDlg('Расчитать кассовые итоги смены?', mtWarning,
        [mbNo, mbYes], 0)= mrYes then  LastShiftTotals(False,False);
  sumInOut:=ostat_kassy;
  if F_In_Out_KassaDlg(0,False, sumInOut)=mrOk then
  begin
    if RegisterKassa_In_Out_RRO(False, False, sumInOut, NumFiscal,  NumLocal, OrderDateTime) then
      Print_Kassa_In_Out_RRO(0, False, sumInOut, NumFiscal,  NumLocal, OrderDateTime);
  end;
  }
end;

procedure TF_main.ActionKassaOut_AlcogolExecute(Sender: TObject);
var sumInOut:extended;
NumFiscal,  NumLocal, OrderDateTime :string;
vID_NAKLCAP:longint;
begin
  if MessageDlg('Расчитать кассовые итоги смены?', mtWarning,
        [mbNo, mbYes], 0)= mrYes then  LastShiftTotals(True,False);
  sumInOut:=ostat_kassy_ALCOGOL;
  if F_In_Out_KassaDlg(1, False, sumInOut)=mrOk then
  begin
    if RegisterKassa_In_Out_RRO(True, False, vID_NAKLCAP, sumInOut, NumFiscal,  NumLocal, OrderDateTime) then
      Print_Kassa_In_Out_RRO(1, False, sumInOut, NumFiscal,  NumLocal, OrderDateTime);
  end;
end;

procedure TF_main.ActionKassaReportExecute(Sender: TObject);
var Z_REP:TZ_REP;
begin
  F_KassaReportDlg(Z_REP);
end;

procedure TF_main.ActionKateg_CliExecute(Sender: TObject);
begin
   F_kateg_cliDlg;
end;

function TF_main.LoadKateg_Cli:boolean;
 var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_Kateg_Cli_proc;

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
         // DataModule2.CDS_Kateg_Cli_Import.Close;
        //  DataModule2.CDS_Kateg_Cli_Import.Open;
          result:=true;
        end;
   except

      on E : Exception do
      begin
        comment:='Ошибка при загрузке категорий клиентов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadKateg_Cli:boolean;

procedure TF_main.UpdateKategCliList;
begin
    // сохранить предыдущее состояние справочника
  DM1.ADOCommandSavePredKateg_Cli.Execute;

  try
    // заполнить список категорий клиентов данными полученными с сервера
    with DataModule2.CDS_Kateg_Cli_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertKaterCli.Parameters.ParamByName('ID_KATEGOR').Value:=
          FieldByName('ID_KATEGOR').AsInteger;
        DM1.ADOCommandInsertKaterCli.Parameters.ParamByName('KATEGOR').Value:=
          FieldByName('KATEGOR').AsString;
        DM1.ADOCommandInsertKaterCli.Parameters.ParamByName('IS_DELETE').Value:=
          FieldByName('IS_DELETE').AsInteger;
        DM1.ADOCommandInsertKaterCli.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Kateg_Cli_Import do

  except
  on E : Exception do
  begin
    // восстановить предыдущие данные
   DM1.ADOCommandRestorePredKateg_Cli.Execute;
   raise Exception.Create('Ошибка в обновлении категорий клиентов '+ E.Message);
  end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredKateg_Cli.Execute;

end; // procedure TF_main.UpdateKategCliList;



function TF_main.LoadClients:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_Clients_proc;

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
         // DataModule2.CDS_Clients_Import.Close;
         // DataModule2.CDS_Clients_Import.Open;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке клиентов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadClients:boolean;


procedure TF_main.UpdateClientsList;
begin
    // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredCli.Execute;

  // заполнить список клиентов данными полученными с сервера
  try
    with DataModule2.CDS_Clients_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertCli.Parameters.ParamByName('ID_CLIENTS').Value:=
          FieldByName('ID_CLIENTS').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('CLIENT').Value:=
          FieldByName('CLIENT').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('RS').Value:=
          FieldByName('RS').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('MFO').Value:=
          FieldByName('MFO').AsString;
         DM1.ADOCommandInsertCli.Parameters.ParamByName('OKPO').Value:=
          FieldByName('OKPO').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('INN').Value:=
          FieldByName('INN').AsString;
         DM1.ADOCommandInsertCli.Parameters.ParamByName('RNN').Value:=
          FieldByName('RNN').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('TEL').Value:=
          FieldByName('TEL').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('DIRECTOR').Value:=
          FieldByName('DIRECTOR').AsString;
         DM1.ADOCommandInsertCli.Parameters.ParamByName('BUHGALTER').Value:=
          FieldByName('BUHGALTER').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('ADRES').Value:=
          FieldByName('ADRES').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('BANK').Value:=
          FieldByName('BANK').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('ID_KATEGOR').Value:=
          FieldByName('ID_KATEGOR').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('AUX_INFO').Value:=
          FieldByName('AUX_INFO').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('PER_MINUS').Value:=
          FieldByName('PER_MINUS').AsFloat;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('PRICE_TIME').Value:=
          FieldByName('PRICE_TIME').AsFloat;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('DOGOVOR').Value:=
          FieldByName('DOGOVOR').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('N_DOGOVOR').Value:=
          FieldByName('N_DOGOVOR').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('D_DOGOVOR').Value:=
          FieldByName('D_DOGOVOR').AsFloat;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('ID_PARENT').Value:=
          FieldByName('ID_PARENT').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('SALES_CATEGOR').Value:=
          FieldByName('SALES_CATEGOR').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('IS_DELETE').Value:=
          FieldByName('IS_DELETE').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('N_NAKL_DOLG').Value:=
          FieldByName('N_NAKL_DOLG').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('D_OTSROCHKI_DOLGA').Value:=
          FieldByName('D_OTSROCHKI_DOLGA').AsFloat;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('IS_CONTROL_DOLG').Value:=
          FieldByName('IS_CONTROL_DOLG').AsInteger;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('EMAIL').Value:=
          FieldByName('EMAIL').AsString;
        DM1.ADOCommandInsertCli.Parameters.ParamByName('BIRTHDAY').Value:=
          FieldByName('BIRTHDAY').AsFloat;
        DM1.ADOCommandInsertCli.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Clients_Import do
  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredCli.Execute;
     raise Exception.Create('Ошибка в обновлении клиентов '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredCli.Execute;

end; // procedure TF_main.UpdateClientsList;



function TF_main.LoadBonuses:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_Bonuses_proc;

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
  except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке бонусов ';
        raise Exception.Create(comment+E.Message);
      end;

  end;

   FreeAndNil(server);
end;  // function TF_main.LoadBonuses:boolean;


procedure TF_main.UpdateBonusesList;
begin
    // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredBonuses.Execute;

  try
  // заполнить список бонусов данными полученными с сервера
    with DataModule2.CDS_Bonuses_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertBonuses.Parameters.ParamByName('ID_BONUS').Value:=
          FieldByName('ID_BONUS').AsInteger;
        DM1.ADOCommandInsertBonuses.Parameters.ParamByName('ID_CLI').Value:=
          FieldByName('ID_CLI').AsInteger;
        DM1.ADOCommandInsertBonuses.Parameters.ParamByName('SUM_BALL').Value:=
          FieldByName('SUM_BALL').AsFloat;

        DM1.ADOCommandInsertBonuses.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Bonuses_Import do
  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredBonuses.Execute;
     raise Exception.Create('Ошибка в обновлении бонусов '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredBonuses.Execute;
end; // procedure TF_main.UpdateBonusesList;



function TF_main.LoadGrTov:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_GrTov_proc;

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке групп товаров ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadGrTov:boolean;


procedure TF_main.UpdateGrTovList;
begin
     // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredGrTov.Execute;

  try
     // заполнить список групп товаров данными полученными с сервера
    with DataModule2.CDS_GrTov_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertGrTov.Parameters.ParamByName('ID_GRTOV').Value:=
          FieldByName('ID_GRTOV').AsInteger;
        DM1.ADOCommandInsertGrTov.Parameters.ParamByName('GRUPTOV').Value:=
          FieldByName('GRUPTOV').AsString;
        DM1.ADOCommandInsertGrTov.Parameters.ParamByName('SEQUENTIAL').Value:=
          FieldByName('SEQUENTIAL').AsInteger;
        DM1.ADOCommandInsertGrTov.Parameters.ParamByName('IS_DELETE').Value:=
          FieldByName('IS_DELETE').Asinteger;
        DM1.ADOCommandInsertGrTov.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_GrTov_Import do

  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredGrTov.Execute;
     raise Exception.Create('Ошибка в обновлении групп товаров '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredGrTov.Execute;
end; // procedure TF_main.UpdateGrTovList;

function TF_main.LoadTov:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_Tov_proc;

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке товаров ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadTov:boolean;


procedure TF_main.UpdateTovList;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredTov.Execute;

  try
    // заполнить список товаров данными полученными с сервера
    with DataModule2.CDS_Tov_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertTov.Parameters.ParamByName('ID_TOV').Value:=
          FieldByName('ID_TOV').AsInteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('NAME').Value:=
          FieldByName('NAME').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('EDIZM').Value:=
          FieldByName('EDIZM').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('GOST').Value:=
          FieldByName('GOST').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('SROKREAL').Value:=
          FieldByName('SROKREAL').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('CODE').Value:=
          FieldByName('CODE').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('ID_GRTOV').Value:=
          FieldByName('ID_GRTOV').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('ID_VID').Value:=
          FieldByName('ID_VID').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('FLAG_SOCIAL').Value:=
          FieldByName('FLAG_SOCIAL').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('MAX_PRICE').Value:=
          FieldByName('MAX_PRICE').AsFloat;
         DM1.ADOCommandInsertTov.Parameters.ParamByName('IS_USE').Value:=
          FieldByName('IS_USE').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('COMPARE_PRICE').Value:=
          FieldByName('COMPARE_PRICE').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('PART').Value:=
          FieldByName('PART').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('AVAILABILITY').Value:=
          FieldByName('AVAILABILITY').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('NOVELTY').Value:=
          FieldByName('NOVELTY').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('RECOMMENDED').Value:=
          FieldByName('RECOMMENDED').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('ID_KATEGOR_CLI').Value:=
          FieldByName('ID_KATEGOR_CLI').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('BASETOV').Value:=
          FieldByName('BASETOV').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('IS_DELETE').Value:=
          FieldByName('IS_DELETE').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('UKTZED').Value:=
          FieldByName('UKTZED').AsString;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('IS_FISCAL').Value:=
          FieldByName('IS_FISCAL').Asinteger;
        DM1.ADOCommandInsertTov.Parameters.ParamByName('IS_EXCISE').Value:=
          FieldByName('IS_EXCISE').Asinteger;
        DM1.ADOCommandInsertTov.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Tov_Import do

  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredTov.Execute;
     raise Exception.Create('Ошибка в обновлении товаров '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredTov.Execute;
end; // procedure TF_main.UpdateTovList;


function TF_main.LoadKUPON_CARD:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_KUPON_CARD_proc;
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке купонных карт ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadKUPON_CARD:boolean;


procedure TF_main.UpdateKUPON_CARD;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredKUPON_CARD.Execute;
  try
  // заполнить список купонных карт данными полученными с сервера
    with DataModule2.CDS_Q_KUPON_CARD_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsertKUPON_CARD.Parameters.ParamByName('ID_KUPON').Value:=
          FieldByName('ID_KUPON').AsString;
        DM1.ADOCommandInsertKUPON_CARD.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_KUPON_CARD_Import do

  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredKUPON_CARD.Execute;
     raise Exception.Create('Ошибка в обновлении купонных карт '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredKUPON_CARD.Execute;
end; // procedure TF_main.UpdateKUPON_CARD;




function TF_main.LoadBARCODES:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_BarCodes_proc;
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке штрихкодов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadBARCODES:boolean;


procedure TF_main.UpdateBARCODESList;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredBarcodes.Execute;

  try
  // заполнить список товаров данными полученными с сервера
    with DataModule2.CDS_BARCODES_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
        DM1.ADOCommandInsert_BARCODES.Parameters.ParamByName('ID_BARCODE').Value:=
          FieldByName('ID_BARCODE').AsInteger;
        DM1.ADOCommandInsert_BARCODES.Parameters.ParamByName('ID_TOV').Value:=
          FieldByName('ID_TOV').AsInteger;
        DM1.ADOCommandInsert_BARCODES.Parameters.ParamByName('BARCODE').Value:=
          FieldByName('BARCODE').AsString;
        DM1.ADOCommandInsert_BARCODES.Parameters.ParamByName('SYMBOLS_WEIGHT_OF_BARCODE').Value:=
          FieldByName('SYMBOLS_WEIGHT_OF_BARCODE').AsInteger;
        DM1.ADOCommandInsert_BARCODES.Parameters.ParamByName('WEIGHT_MULTIPLIER').Value:=
          FieldByName('WEIGHT_MULTIPLIER').AsFloat;

        DM1.ADOCommandInsert_BARCODES.Execute;
        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_BARCODES_Import do
  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredBarcodes.Execute;
     raise Exception.Create('Ошибка в обновлении штрихкодов '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredBarcodes.Execute;
end; // procedure TF_main.UpdateBARCODESList;



function TF_main.LoadUserPRICE:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  try
    result_q:=server.get_USER_PRICE_proc(ID_TRADE_POINT);

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке прайс-листа ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadUserPRICE:boolean;


procedure TF_main.UpdateUserPRICE;
begin
    // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredPrice.Execute;

  try

    QUsersTP.Close;
    QUsersTP.Open;
    QUsersTP.First;
    while not QUsersTP.EOF do
    begin
      // заполнить список цен данными полученными с сервера
      with DataModule2.CDS_UserPrice_Import do
      begin
        Close;
        Open;
        First;
        while not EOF  do
        begin

            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('ID_TOV').Value:=
              FieldByName('ID_TOV').AsInteger;
           // DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('ID_USERS').Value:=ID_user_select;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('ID_USERS').Value:=
              QUsersTP.FieldByName('ID_USERS').AsInteger;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('ID_VENDOR').Value:=
              FieldByName('ID_VENDOR').AsInteger;



            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('NUMB').Value:=0.0;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('PRICE_TMP').Value:=0.0;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('OSTAT').Value:=0.0;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('PRICE_UCH').Value:=
            FieldByName('PRICE_UCH').AsFloat;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('PRICE_VENDOR').Value:=
            FieldByName('PRICE_VENDOR').AsFloat;
            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('IS_ACTION').Value:=
            FieldByName('IS_ACTION').AsInteger;

            DM1.ADOCommandInsert_UserPRICE.Parameters.ParamByName('COMMENT').Value:='';
            DM1.ADOCommandInsert_UserPRICE.Execute;

          Next;
        end; // while not EOF  do
        Close;
      end;  //  with DataModule2.CDS_UserPrice_Import do
      QUsersTP.Next;
    end;  //   while not QUsersTP.EOF do
    QUsersTP.Close;

  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredPrice.Execute;
     raise Exception.Create('Ошибка в обновлении прайс-листа '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredPrice.Execute;

end; // procedure TF_main.UpdateUserPRICE;



(*

function TF_main.LoadPRICE_DATE:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_PRICE_DATE_proc;
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadPRICE_DATE:boolean;


procedure TF_main.UpdatePRICE_DATEList;
begin
  // удалить старый список цен
  DM1.ADOCommandDelete_PRICE_DATE.Execute;
  // заполнить список цен данными полученными с сервера
  with DataModule2.CDS_PRICE_DATE_Import do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('ID_PRICE_DATE').Value:=
        FieldByName('ID_PRICE_DATE').AsInteger;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('ID_TOV').Value:=
        FieldByName('ID_TOV').AsInteger;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('D_START').Value:=
        FieldByName('D_START').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('PRICE1').Value:=
        FieldByName('PRICE1').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('PRICE2').Value:=
        FieldByName('PRICE2').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('PRICE3').Value:=
        FieldByName('PRICE3').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('PRICE4').Value:=
        FieldByName('PRICE4').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('D_EDIT_NEW').Value:=
        FieldByName('D_EDIT_NEW').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('ID_USER').Value:=
        FieldByName('ID_USER').AsInteger;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('IS_DELETE').Value:=
        FieldByName('IS_DELETE').AsInteger;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('D_DELETE').Value:=
        FieldByName('D_DELETE').AsFloat;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('ID_USER_DELETE').Value:=
        FieldByName('ID_USER_DELETE').AsInteger;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('COMMENT_DEL').Value:=
        FieldByName('COMMENT_DEL').AsString;
      DM1.ADOCommandInsertPRICE_DATE.Parameters.ParamByName('ID_CLI').Value:=
        FieldByName('ID_CLI').AsInteger;

      DM1.ADOCommandInsertPRICE_DATE.Execute;
      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_PRICE_DATE_Import do
end; // procedure TF_main.UpdatePRICE_DATEList;


 *)



function TF_main.LoadCapDocum(ID_DOC_TYPE:longint):boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_QNaklCap_Import_proc(ID_TRADE_POINT, ID_DOC_TYPE, D_Work.DateTime);


      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке шапок документов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadCapDocum(ID_DOC_TYPE:longint):boolean;


function TF_main.LoadTovDocum(ID_DOC_TYPE:longint):boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_QNaklTov_Import_proc(ID_TRADE_POINT, ID_DOC_TYPE, D_Work.DateTime);


      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке товаров документов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadTovDocum(ID_DOC_TYPE:longint):boolean;


function TF_main.LoadNaveskiDocum(ID_DOC_TYPE:longint):boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   try
    result_q:=server.get_QNaveski_Import_proc(ID_TRADE_POINT, ID_DOC_TYPE, D_Work.DateTime);


      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке навесок документов ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadNaveskiDocum(ID_DOC_TYPE:longint):boolean;






function TF_main.LoadDocum(ID_DOC_TYPE:longint):boolean;
var r1, r2, r3:boolean;

begin
  r1:=false;
  r2:=false;
  r3:=false;
  r1:=LoadCapDocum(ID_DOC_TYPE);
  if r1 then
  begin
    r2:=LoadTovDocum(ID_DOC_TYPE);
    if r2 then
    begin
      r3:=LoadNaveskiDocum(ID_DOC_TYPE);
    end;
  end;

  result:=r1 and r2 and r3;
end;  // function TF_main.LoadDocum(ID_DOC_TYPE:longint):boolean;


procedure TF_main.UpdateDocum(ID_DOC_TYPE:longint);
var D_from, D_to :TDatetime;
begin
  D_from:=DateOf(D_Work.DateTime);
  D_To:=EndOfTheDay(D_from);
  // удалить временные табл документов
  DM1.ADOCommandDelete_Docum_TMP.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
  DM1.ADOCommandDelete_Docum_TMP.Execute;

  try
     // заполнить  временные данные в таблице NAKLCAP_IMPORT_TMP шапки документов данными полученными с сервера
    with DataModule2.CDS_NaklCap_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin

          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_NAKLCAP').Value:=
            FieldByName('ID_NAKLCAP').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('D').Value:=
            FieldByName('D').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('NN').Value:=
            FieldByName('NN').AsString;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_DOC_TYPE').Value:=
            FieldByName('ID_DOC_TYPE').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_CLIENT').Value:=
            FieldByName('ID_CLIENT').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('PRICE_KATEG').Value:=
            FieldByName('PRICE_KATEG').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('TOT_SUM').Value:=
            FieldByName('TOT_SUM').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('TOT_NUM').Value:=
            FieldByName('TOT_NUM').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('NUM_TARA').Value:=
            FieldByName('NUM_TARA').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_TARA').Value:=
            FieldByName('ID_TARA').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('ID_CLI_K').Value:=
            FieldByName('ID_CLI_K').AsInteger;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('SCH_D').Value:=
            FieldByName('SCH_D').AsString;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('SCH_K').Value:=
            FieldByName('SCH_K').AsString;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('NDS').Value:=
            FieldByName('NDS').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('STAVKA_NDS').Value:=
            FieldByName('STAVKA_NDS').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Parameters.ParamByName('IS_SVERENO').Value:=
            FieldByName('IS_SVERENO').AsFloat;
          DM1.ADOCommandInsert_DocumCap.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_NaklCap_Import do

   // заполнить  временные данные в таблице NAKLTOV_IMPORT_TMP товаров документов данными полученными с сервера
    with DataModule2.CDS_NaklTov_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin

          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('ID_NAKLCAP').Value:=
            FieldByName('ID_NAKLCAP').AsInteger;
          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('ID_TOV').Value:=
            FieldByName('ID_TOV').AsInteger;
          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('PRICE').Value:=
            FieldByName('PRICE').AsFloat;
          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('NUMB').Value:=
            FieldByName('NUMB').AsFloat;
          DM1.ADOCommandInsert_DocumTov.Parameters.ParamByName('COMMENT').Value:=
            FieldByName('COMMENT').AsString;
          DM1.ADOCommandInsert_DocumTov.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_NaklTov_Import do


     // заполнить  временные данные в таблице NAVESKI_IMPORT_TMP навески товаров документов данными полученными с сервера
    with DataModule2.CDS_Naveski_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin

          DM1.ADOCommandInsert_DocumNaveski.Parameters.ParamByName('ID_NAKLCAP').Value:=
            FieldByName('ID_NAKLCAP').AsInteger;
          DM1.ADOCommandInsert_DocumNaveski.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
          DM1.ADOCommandInsert_DocumNaveski.Parameters.ParamByName('ID_TOV').Value:=
            FieldByName('ID_TOV').AsInteger;
          DM1.ADOCommandInsert_DocumNaveski.Parameters.ParamByName('NUMB').Value:=
            FieldByName('NUMB').AsFloat;
          DM1.ADOCommandInsert_DocumNaveski.Parameters.ParamByName('D').Value:=
            FieldByName('D').AsFloat;
          DM1.ADOCommandInsert_DocumNaveski.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Naveski_Import do

  except
    on E : Exception do
      begin
        // удалить временные табл документов
        DM1.ADOCommandDelete_Docum_TMP.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
        DM1.ADOCommandDelete_Docum_TMP.Execute;
        raise Exception.Create('Ошибка в обновлении документов '+ E.Message);
      end;
  end;



  // сохранить данные из табл NAKLCAP_IMPORT_TMP, NAVESKI_IMPORT_TMP и NAKLTOV_IMPORT_TMP в соответствующие документы
  dm1.SP_COPY_IMPORT_DOC.Parameters.ParamValues['@ID_USER']:=ID_user_select;
  dm1.SP_COPY_IMPORT_DOC.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
  dm1.SP_COPY_IMPORT_DOC.Parameters.ParamValues['@D_FROM']:=D_from;
  dm1.SP_COPY_IMPORT_DOC.Parameters.ParamValues['@D_TO']:=D_to;
  dm1.SP_COPY_IMPORT_DOC.ExecProc;
  if dm1.SP_COPY_IMPORT_DOC.Parameters.ParamValues['@ER']<>0
  then
  begin
    MessageDlg('Ошибка при сохранении импорта документов!', mtError,
      [mbOk], 0);
        // удалить временные табл документов
    DM1.ADOCommandDelete_Docum_TMP.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
    DM1.ADOCommandDelete_Docum_TMP.Execute;
    raise Exception.Create('Ошибка при сохранении импорта документов!');
  end;



end; // TF_main.UpdateDocum(ID_DOC_TYPE:longint);



function TF_main.LoadSkidka:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_Skidka_Import_proc(D_Work.DateTime);

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
  except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке скидок ';
        raise Exception.Create(comment+E.Message);
      end;

  end;

  FreeAndNil(server);
end;  // function TF_main.LoadSkidka:boolean;


procedure TF_main.UpdateSkidka;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
  DM1.ADOCommandSavePredSkidka.Execute;

  try

  // заполнить список скидок данными полученными с сервера
    with DataModule2.CDS_Skidka_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
          // :ID_SKIDKA, :PER_SKIDKA_KOLBASA,  :PER_SKIDKA_MYASO,  :PER_SKIDKA_TNP,
          //:COMMENT, :D_FROM, :D_TO, :MIN_KOLBASA, :MIN_MYASO, :MIN_TNP

          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('ID_SKIDKA').Value:=
            FieldByName('ID_SKIDKA').AsInteger;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('PER_SKIDKA_KOLBASA').Value:=
            FieldByName('PER_SKIDKA_KOLBASA').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('PER_SKIDKA_MYASO').Value:=
            FieldByName('PER_SKIDKA_MYASO').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('PER_SKIDKA_TNP').Value:=
            FieldByName('PER_SKIDKA_TNP').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('COMMENT').Value:=
            FieldByName('COMMENT').AsString;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('D_FROM').Value:=
            FieldByName('D_FROM').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('D_TO').Value:=
            FieldByName('D_TO').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('MIN_KOLBASA').Value:=
            FieldByName('MIN_KOLBASA').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('MIN_MYASO').Value:=
            FieldByName('MIN_MYASO').AsFloat;
          DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('MIN_TNP').Value:=
            FieldByName('MIN_TNP').AsFloat;
           DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('IS_NAMED').Value:=
            FieldByName('IS_NAMED').AsFloat;
           DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('DAY_TIME_FROM').Value:=
            FieldByName('DAY_TIME_FROM').AsFloat;
           DM1.ADOCommandInsert_Skidka.Parameters.ParamByName('DAY_TIME_TO').Value:=
            FieldByName('DAY_TIME_TO').AsFloat;
          DM1.ADOCommandInsert_Skidka.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Skidka_Import do

  except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredSkidka.Execute;
     raise Exception.Create('Ошибка в обновлении скидок '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
  DM1.ADOCommandDelete_PredSkidka.Execute;


end; // procedure TF_main.UpdateSkidka;


  // получение изменившихся на указанную дату цен
function TF_main.LoadNEW_PRICE_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  try
    result_q:=server.get_QNewPriceTov_proc(D_Work.DateTime, ID_TRADE_POINT);
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке новых цен ';
        raise Exception.Create(comment+E.Message);
      end;


   end;

   FreeAndNil(server);
end;  // function TF_main.LoadNEW_PRICE_POS:boolean;


procedure TF_main.UpdateNEW_PRICE_POS;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
 DM1.ADOCommandSavePredNewPriceTov.Execute;

 try
    // заполнить данные о изменившихся на указанную дату цен полученными с сервера
    with DataModule2.CDS_NewPriceTov_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
          DM1.ADOCommandInsertNEW_PRICE_POS.Parameters.ParamByName('ID_TOV').Value:=
            FieldByName('ID_TOV').AsInteger;
          DM1.ADOCommandInsertNEW_PRICE_POS.Parameters.ParamByName('PRICE2').Value:=
            FieldByName('PRICE2').AsFloat;
          DM1.ADOCommandInsertNEW_PRICE_POS.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_NewPriceTov_Import do

    QNEW_PRICE_POS.Close;
    QNEW_PRICE_POS.Parameters.ParamByName('ID_USER').Value:= id_user_select;
    if CB_IS_EXISTS.Checked then
       QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=1
    else  QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=0;
    QNEW_PRICE_POS.Open;

 except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredNewPriceTov.Execute;
     raise Exception.Create('Ошибка в обновлении новых цен '+ E.Message);
    end;
  end;

  // удалить предыдущее состояние справочника
  DM1.ADOCommand_Delete_PredNewPriceTov.Execute;

end; // procedure TF_main.UpdateNEW_PRICE_POS;



 // получение обьявлений для ТС и покупателя
function TF_main.LoadAdvert:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_QAdvert_proc(ID_TRADE_POINT);
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке объявлений ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadAdvert:boolean;


procedure TF_main.UpdateAdvert;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
 DM1.ADOCommandSavePredAdvertMsg.Execute;

 try
    // заполнить данные о изменившихся на указанную дату цен полученными с сервера
    with DataModule2.CDS_Advert do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
          DM1.ADOCommandInsertAdvert.Parameters.ParamByName('ID_ADVERT').Value:=
            FieldByName('ID_ADVERT').AsInteger;
          DM1.ADOCommandInsertAdvert.Parameters.ParamByName('TYPE_MSG').Value:=
            FieldByName('TYPE_MSG').AsInteger;
          DM1.ADOCommandInsertAdvert.Parameters.ParamByName('ID_CLI').Value:=
            FieldByName('ID_CLI').AsInteger;
          DM1.ADOCommandInsertAdvert.Parameters.ParamByName('MSG').Value:=
            FieldByName('MSG').AsString;
          DM1.ADOCommandInsertAdvert.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_Advert do

    Q_Advert.Close;
    Q_Advert.Parameters.ParamByName('TYPE_MSG').Value:=5; // для покупателя
    Q_Advert.Open;
 except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredAdvertMsg.Execute;
     raise Exception.Create('Ошибка в обновлении объявлений '+ E.Message);
    end;
 end;

  // удалить предыдущее состояние справочника
  DM1.ADOCommand_Delete_PredAdvertMsg.Execute;

end; // procedure TF_main.UpdateAdvert;


// получение сертификатов, ключей, паролей ФОП, работающей с тт  ID_TRADE_POINT
function TF_main.LoadRRO_CERTIFIC:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  result_q:=server.get_RRO_CERTIFIC_proc(ID_TRADE_POINT);

   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadRRO_CERTIFIC:boolean;

procedure TF_main.UpdateRRO_CERTIFIC;
begin
  // удалить старые данные
  DM1.ADOCommandDELETE_RRO_CERTIFIC.Execute;


  // заполнить данные  полученными с сервера
  with DataModule2.CDS_Q_RRO_CERTIFIC do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin
        DM1.ADOCommandInsertRRO_Certific.Parameters.ParamByName('ID_CLI').Value:=
          FieldByName('ID_CLI').AsInteger;
        DM1.ADOCommandInsertRRO_Certific.Parameters.ParamByName('CERTIF').Value:=
          FieldByName('CERTIFICATE').AsString;
        DM1.ADOCommandInsertRRO_Certific.Parameters.ParamByName('PRIVATE_KEY').Value:=
          FieldByName('PRIVATE_KEY').AsString;
        DM1.ADOCommandInsertRRO_Certific.Parameters.ParamByName('PASSW').Value:=
          FieldByName('PASSW').AsString;
        DM1.ADOCommandInsertRRO_Certific.Parameters.ParamByName('DATE_END_CERTIFICATE').Value:=
          FieldByName('DATE_END_CERTIFICATE').AsDateTime;

        DM1.ADOCommandInsertRRO_Certific.Execute;

      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_Q_RRO_CERTIFIC do



end; // procedure TF_main.UpdateRRO_CERTIFIC;



// получение инфо о кассах работающих в тт  ID_TRADE_POINT
function TF_main.LoadRRO_KASSA_TS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  result_q:=server.get_RRO_KASSA_TS_proc(ID_TRADE_POINT);

   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadRRO_KASSA_TS:boolean;

procedure TF_main.UpdateRRO_KASSA_TS;
begin
  // удалить старые данные
  DM1.ADOCommandDELETE_RRO_KASSA_TS.Execute;


  // заполнить данные  полученными с сервера
  with DataModule2.CDS_Q_RRO_KASSA_TS do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('ID_RRO_KASSA').Value:=
          FieldByName('ID_RRO_KASSA').AsInteger;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('ID_CLI').Value:=
          FieldByName('ID_CLI').AsInteger;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('ID_TT').Value:=
          FieldByName('ID_TT').AsInteger;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('ID_NUM_FISCAL_KASSA').Value:=
          FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('NAME_KASSA').Value:=
          FieldByName('NAME_KASSA').AsString;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('CERTIF').Value:=
          FieldByName('CERTIFICATE').AsString;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('PRIVATE_KEY').Value:=
          FieldByName('PRIVATE_KEY').AsString;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('PASSW').Value:=
          FieldByName('PASSW').AsString;
        DM1.ADOCommandInsertRRO_KASSA_TS.Parameters.ParamByName('DATE_END_CERTIFICATE').Value:=
          FieldByName('DATE_END_CERTIFICATE').AsDateTime;

        DM1.ADOCommandInsertRRO_KASSA_TS.Execute;

      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_Q_RRO_KASSA_TS do



end; // procedure TF_main.UpdateRRO_KASSA_TS;






// получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
function TF_main.LoadKIO_OPERATIONS_GRUP:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  try
    result_q:=server.get_Q_KIO_OPERATIONS_GRUP_Import_proc();
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке групп товаров по видам операций ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadKIO_OPERATIONS_GRUP:boolean;



procedure TF_main.UpdateKIO_OPERATIONS_GRUP;
begin
// сохранить предыдущее состояние справочника с удалением оригинала
 DM1.ADOCommandSavePredKioOperGroup.Execute;

 try
  // заполнить данные  с сервера
    with DataModule2.CDS_KIO_OPERATIONS_GRUP_Import do
    begin
      Close;
      Open;
      First;
      while not EOF  do
      begin
          DM1.ADOCommandInsertKIO_OPERATIONS_GRUP.Parameters.ParamByName('ID_VID_OPERATION').Value:=
            FieldByName('ID_VID_OPERATION').AsInteger;
          DM1.ADOCommandInsertKIO_OPERATIONS_GRUP.Parameters.ParamByName('ID_GRTOV').Value:=
            FieldByName('ID_GRTOV').AsInteger;

          DM1.ADOCommandInsertKIO_OPERATIONS_GRUP.Execute;

        Next;
      end; // while not EOF  do
      Close;
    end;  //  with DataModule2.CDS_KIO_OPERATIONS_GRUP_Import do

 except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredKioOperGroup.Execute;
     raise Exception.Create('Ошибка в загрузке групп товаров по видам операций '+ E.Message);
    end;
 end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredKioOperGroup.Execute;


end; // procedure TF_main.UpdateKIO_OPERATIONS_GRUP;



// получение таблицы продукции собственного пр-ва
function TF_main.LoadPRODUCT_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  try
    result_q:=server.get_QPRODUCT_POS_Import_proc();
       {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке продукции собственного пр-ва ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadQPRODUCT_POS:boolean;



procedure TF_main.UpdatePRODUCT_POS;
begin

// сохранить предыдущее состояние справочника с удалением оригинала
 DM1.ADOCommandSavePredPRODUCT_POS.Execute;

 try

  // заполнить данные  с сервера
  with DataModule2.CDS_QPRODUCT_POS_Import do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin

        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('ID_PROD').Value:=
          FieldByName('ID_PROD').AsInteger;
        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('ID_TOV').Value:=
          FieldByName('ID_TOV').AsInteger;

        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_SYR_MINUS').Value:=
          FieldByName('N_SYR_MINUS').AsFloat;
        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_SYR_PLUS').Value:=
          FieldByName('N_SYR_PLUS').AsFloat;

        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_GOT_MINUS').Value:=
          FieldByName('N_GOT_MINUS').AsFloat;
        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_GOT_PLUS').Value:=
          FieldByName('N_GOT_PLUS').AsFloat;

        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_SUH_MINUS').Value:=
          FieldByName('N_SUH_MINUS').AsFloat;
        DM1.ADOCommand_Insert_PRODUCT_POS.Parameters.ParamByName('N_SUH_PLUS').Value:=
          FieldByName('N_SUH_PLUS').AsFloat;


        DM1.ADOCommand_Insert_PRODUCT_POS.Execute;

      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_QPRODUCT_POS_Import do

 except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredPRODUCT_POS.Execute;
     raise Exception.Create('Ошибка в загрузке продукции собственного пр-ва '+ E.Message);
    end;
 end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredPRODUCT_POS.Execute;

end; // procedure TF_main.UpdateQPRODUCT_POS;




// получение таблицы норм продукции собственного пр-ва
function TF_main.LoadNORM_ASSEMB_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

  try
    result_q:=server.get_QNORM_ASSEMB_POS_Import_proc();
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
      begin
        comment:='Ошибка при загрузке норм продукции собственного пр-ва ';
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadNORM_ASSEMB_POS:boolean;



procedure TF_main.UpdateNORM_ASSEMB_POS;
begin
  // сохранить предыдущее состояние справочника с удалением оригинала
 DM1.ADOCommandSavePredNORM_ASSEMB_POS.Execute;

 try
   // заполнить данные  с сервера
  with DataModule2.CDS_QNORM_ASSEMB_POS_Import do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin
         DM1.ADOCommand_Insert_NORM_ASSEMB_POS.Parameters.ParamByName('ID_NORM').Value:=
          FieldByName('ID_NORM').AsInteger;
        DM1.ADOCommand_Insert_NORM_ASSEMB_POS.Parameters.ParamByName('ID_PROD').Value:=
          FieldByName('ID_PROD').AsInteger;
        DM1.ADOCommand_Insert_NORM_ASSEMB_POS.Parameters.ParamByName('ID_TOV').Value:=
          FieldByName('ID_TOV').AsInteger;
        DM1.ADOCommand_Insert_NORM_ASSEMB_POS.Parameters.ParamByName('NORMA').Value:=
          FieldByName('NORMA').AsFloat;

        DM1.ADOCommand_Insert_NORM_ASSEMB_POS.Execute;

      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_QNORM_ASSEMB_POS_Import do

except
    on E : Exception do
    begin
      // восстановить предыдущие данные
     DM1.ADOCommandRestorePredNORM_ASSEMB_POS.Execute;
     raise Exception.Create('Ошибка в загрузке норм продукции собственного пр-ва '+ E.Message);
    end;
 end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredNORM_ASSEMB_POS.Execute;

end; // procedure TF_main.UpdateNORM_ASSEMB_POS;








 // получение пользователей для ТС
function TF_main.LoadUserTradePoint:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
  try
    result_q:=server.get_Q_UserTradePoint_proc(ID_TRADE_POINT);

      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
    on E : Exception do
    begin
      comment:='Ошибка при загрузке пользователей ';
      raise Exception.Create(comment+E.Message);
    end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadUserTradePoint:boolean;


procedure TF_main.UpdateUserTradePoint;
begin
  // сохранить предыдущее состояние справочника
  DM1.ADOCommandSavePredUsers.Parameters.ParamByName('ID_USER_SELECT').Value:=ID_USER_SELECT;
  DM1.ADOCommandSavePredUsers.Execute;

 try
  // заполнить данные о изменившихся
  with DataModule2.CDS_USER_TRADEPOINT do
  begin
    Close;
    Open;
    First;
    while not EOF  do
    begin
      if FieldByName('ID_USER').AsInteger<>ID_USER_SELECT then
      begin
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('ID_USERS').Value:=
          FieldByName('ID_USER').AsInteger;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('U_NAME').Value:=
          FieldByName('U_NAME').AsString;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('LOGIN').Value:=
          FieldByName('LOGIN').AsString;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('STATUS').Value:=
          FieldByName('STATUS').AsInteger;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('BIRTHDAY').Value:=
          FieldByName('BIRTHDAY').AsFloat;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('PASSW').Value:=
          FieldByName('PASSW').AsString;
        DM1.ADOCommand_Insert_UserTradePoint.Parameters.ParamByName('IS_DELETE').Value:=
          FieldByName('IS_DELETE').AsInteger;
        DM1.ADOCommand_Insert_UserTradePoint.Execute;
      end;

      Next;
    end; // while not EOF  do
    Close;
  end;  //  with DataModule2.CDS_USER_TRADEPOINT do

 except
  on E : Exception do
  begin
    // восстановить предыдущие данные
   DM1.ADOCommandRestorePredUsers.Execute;
   raise Exception.Create('Ошибка в обновлении пользователей '+ E.Message);
  end;
 end;

  // удалить предыдущее состояние справочника
 DM1.ADOCommand_Delete_PredUserTradePoint.Execute;

end; // procedure TF_main.UpdateUserTradePoint;

 //контроль не переданных документов для регистрации в налоговой
function TF_main.CONTROL_REG_RRO:integer;
var n_not_reg_rro:integer;
begin
  result:=0;
  with Q_CONTROL_REG_RRO do
  begin
    Close;
    Parameters.ParamByName('D_FROM').Value:=D_FROM.DateTime;
    Parameters.ParamByName('D_TO').Value:=D_TO.DateTime;
    Open;
    n_not_reg_rro:=FieldByName('count_not_reg_rro').AsInteger;
    Close;
  end;
  result:=n_not_reg_rro;

end;


// загрузка справочников
procedure TF_main.ActionLastShiftTotalsExecute(Sender: TObject);
var n_not_reg_rro:integer;
begin
 // LastShiftTotals(False,True);
  n_not_reg_rro:=CONTROL_REG_RRO;
  if n_not_reg_rro>0 then
  begin
    MessageDlg(Format('Есть %d незарегистрированных РРО документов!', [n_not_reg_rro]), mtError, [mbOk], 0);
  end;




  with Q_NotFinalDoc do
  begin
    Close;
    Open;
    if RecordCount>0 then
    begin
      if MessageDlg(Format('Есть %d незавершенных документов! Показать?', [RecordCount]),
        mtWarning, [mbNo, mbYes], 0)= mrYes then
      begin
        F_Not_Final_Doc_Show_Dlg();

      end;

    end;
  end;


  F_KassaReport_RRO_Dlg();
end;

procedure TF_main.ActionLastShiftTotals_AlcogolExecute(Sender: TObject);
begin
  LastShiftTotals(True,True);
end;

procedure TF_main.ActionLoadSpravochnikiExecute(Sender: TObject);
var Save_Cursor:TCursor;

begin

 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
  ActionConnectRemoteDBExecute(Sender);

  if   is_connect_server then
  begin
    try
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;

       // получить пользователей ТТ
      if LoadUserTradePoint then UpdateUserTradePoint;
      StatusBar1.Panels[0].Text:='5% - Пользователи ТТ загружены';

      Update;
      // Загрузка категорий клиентов
      if LoadKateg_Cli then UpdateKategCliList;
      StatusBar1.Panels[0].Text:='10% - Категории клиентов загружены';

      Update;
      // Загрузка списка клиентов
      if LoadClients then UpdateClientsList;
      StatusBar1.Panels[0].Text:='25% - Клиенты загружены';

      Update;
     // Загрузка бонусов
      if LoadBonuses then UpdateBonusesList;
      StatusBar1.Panels[0].Text:='30% - Бонусы загружены';
      Update;
      //Загрузка групп  товаров
      if LoadGrTov then UpdateGrTovList;
      StatusBar1.Panels[0].Text:='35% - Группы товаров загружены';
      Update;
      //Загрузка товаров
      if LoadTov then UpdateTovList;
      StatusBar1.Panels[0].Text:='45% - Товары загружены';
      Update;
      //Загрузка штрихкодов товаров
      if LoadBARCODES then UpdateBARCODESList;
      StatusBar1.Panels[0].Text:='50% - Штрихкоды загружены';
      Update;

      //Загрузка прайслиста пользователя
      if LoadUserPRICE then UpdateUserPRICE;
      StatusBar1.Panels[0].Text:='60% - Прайс-лист загружен';
      Update;

       // получение изменившихся на указанную дату цен
      if LoadNEW_PRICE_POS then UpdateNEW_PRICE_POS;
      StatusBar1.Panels[0].Text:='65% - Изменения цен загружены';
      Update;

       // получить обьявления
      if LoadAdvert then UpdateAdvert;
      StatusBar1.Panels[0].Text:='70% - Объявления загружены';
      Update;

       // загрузка групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
      if LoadKIO_OPERATIONS_GRUP then UpdateKIO_OPERATIONS_GRUP;
      StatusBar1.Panels[0].Text:='75% - Группы товаров по видам операций загружены';
      Update;

      // получение таблицы продукции собственного пр-ва
      if LoadPRODUCT_POS then UpdatePRODUCT_POS;
      StatusBar1.Panels[0].Text:='80% - Продукция собственного пр-ва загружена';
      Update;

      // получение таблицы норм продукции собственного пр-ва
      if LoadNORM_ASSEMB_POS then UpdateNORM_ASSEMB_POS;
      StatusBar1.Panels[0].Text:='82% - Нормы продукции собственного пр-ва загружена';
      Update;

      // получение таблицы купонных карт
      if LoadKUPON_CARD then UpdateKUPON_CARD;
      StatusBar1.Panels[0].Text:='85% - Купонные карты загружены';
      Update;

      //загрузка скидок актуальных на рабочую дату
      if LoadSkidka then UpdateSkidka;
      StatusBar1.Panels[0].Text:='90% - Скидки загружены';
      Update;

      // синхронизация документов
      with Q_Reception do
      begin
        Open;
        First;
        while not Eof do
        begin
          if LoadDocum(FieldByName('ID_DOC_TYPE').AsInteger) then
                  UpdateDocum(FieldByName('ID_DOC_TYPE').AsInteger);
          Next;
        end;
        Close;
      end; // with Q_Reception do

      StatusBar1.Panels[0].Text:='100% - Синхронизация документов выполнена';
      Update;

      Screen.Cursor := Save_Cursor;
      MessageDlg('Загрузка справочников выполнена!', mtInformation, [mbOk], 0);
      StatusBar1.Panels[0].Text:='';

    except
       on E : Exception do
       begin
        Screen.Cursor := Save_Cursor;
        MessageDlg('Ошибка при загрузке справочников '+E.Message , mtInformation, [mbOk], 0);
        StatusBar1.Panels[0].Text:='';
       end;

    end;

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      ActionDisconnectRemoteDBExecute(Sender);
  end;



end;

procedure TF_main.ActionObreziExecute(Sender: TObject);
begin
 FSaleDocList_dlg(225,-1); // списание Обрези
end;

procedure TF_main.ActionOrdersKolbasaExecute(Sender: TObject);
begin
 FSaleDocList_dlg(126,-1); // заказы колбасы
end;

procedure TF_main.ActionOrdersMyasoExecute(Sender: TObject);
begin
 FSaleDocList_dlg(198,-1); // заказы мяса
end;

procedure TF_main.ActionOrdersOvochiExecute(Sender: TObject);
begin
FSaleDocList_dlg(270,-1); // заказы  овощей
end;

procedure TF_main.ActionOrdersTaraExecute(Sender: TObject);
begin
 FSaleDocList_dlg(237,-1); // заказы  тары отгружаемых с НМК
end;

procedure TF_main.ActionOrdersTNPExecute(Sender: TObject);
begin
 FSaleDocList_dlg(163,-1); // заказы ТНП

end;

procedure TF_main.ActionOrdersTovExecute(Sender: TObject);
begin
 FSaleDocList_dlg(238,-1); // заказы  товаров отгружаемых с НМК
end;

procedure TF_main.ActionOrdersVozvratTNPExecute(Sender: TObject);
begin
  FSaleDocList_dlg(305,-1); // заказы  на возврат ТНП
end;

procedure TF_main.ActionPeredachaTtToTtExecute(Sender: TObject);
begin
// POS Передача (Расход) товаров с тт на тт
 FSaleDocList_dlg(276,-1);
end;

procedure TF_main.ActionPrihidMyasoExecute(Sender: TObject);
begin
// приход мяса
 FSaleDocList_dlg(216,-1);
end;

procedure TF_main.ActionPrihodKolbasaExecute(Sender: TObject);
begin
// приход колбасы
 FSaleDocList_dlg(209,-1);
end;

procedure TF_main.ActionPrihodOvochiExecute(Sender: TObject);
begin
// приход овощей
 FSaleDocList_dlg(271,-1);
end;

procedure TF_main.ActionPrihodTaraExecute(Sender: TObject);
begin
//  Приход тары отгружаемых с НМК
 FSaleDocList_dlg(228,-1);
end;

procedure TF_main.ActionPrihodTNPExecute(Sender: TObject);
begin
// приход ТНП
 FSaleDocList_dlg(219,-1);
end;

procedure TF_main.ActionPrihodTovExecute(Sender: TObject);
begin
//  Приход товаров отгружаемых с НМК
 FSaleDocList_dlg(230,-1);
end;

procedure TF_main.ActionPrihodTtToTtExecute(Sender: TObject);
begin
// a009 POS Авто Передача (Приход) товаров с тт на тт
 FSaleDocList_dlg(277,-1);
end;

procedure TF_main.ActionPrvoExecute(Sender: TObject);
begin
 F_Assemb_POS_Dlg(D_Work.Datetime);
end;

// загрузка вспомогательной таблицы шапок документов для экспрота данных в основную БД
function TF_main.Load_NaklCap_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_NaklCap_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_NaklCap_Export.Close;
          DataModule2.CDS_NaklCap_Export.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);

end;  // function TF_main.Load_NaklCap_ForExport:boolean;


// загрузка вспомогательной таблицы товарной начинки документов для экспрота данных в основную БД
function TF_main.Load_NaklTov_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_NaklTov_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_NaklTov_Export.Close;
          DataModule2.CDS_NaklTov_Export.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Load_NaklTov_ForExport:boolean;


// загрузка вспомогательной таблицы навесок товарной начинки документов для экспрота данных в основную БД
function TF_main.Load_Naveski_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_Naveski_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_Naveski_Export.Close;
          DataModule2.CDS_Naveski_Export.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Load_Naveski_ForExport:boolean;




// загрузка вспомогательной таблицы новых покупателей с бонусными картами для экспрота данных в основную БД
function TF_main.Load_CLIENTS_NEW_POS_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_CLIENTS_NEW_POS_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.Close;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Load_CLIENTS_NEW_POS_ForExport:boolean;


// загрузка вспомогательной таблицы новых штрихкодов для экспрота данных в основную БД
function TF_main.Load_SHTRIH_CODE_TOV_NEW_POS_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_SHTRIH_CODE_TOV_NEW_POS_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.Close;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Load_SHTRIH_CODE_TOV_NEW_POS_ForExport:boolean;



// загрузка вспомогательной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT для экспрота данных в основную БД
function TF_main.Load_SVERKA_DOC_POS_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_SVERKA_DOC_POS_Export_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_SVERKA_DOC_POS.Close;
          DataModule2.CDS_SVERKA_DOC_POS.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Load_SVERKA_DOC_POS_ForExport:boolean;



// загрузка  таблицы CONST_VALUES_TP для экспрота-импорта данных в-из основную БД
function TF_main.Load_CONST_VALUES_TP_ForExport:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.get_CONST_VALUES_TP_EXPORT_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.Close;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.Open;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);

end;  // function TF_main.Load_CONST_VALUES_TP_ForExport:boolean;





// импорт документов из временных таблиц полученных из POS системы клиента в учетную БД
function TF_main.Import_Doc_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.Import_Doc_POS_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.Import_Doc_POS:boolean;



// импорт признака сверки в учетную БД
function TF_main.Import_SVERKA_Doc_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.Import_SVERKA_Doc_POS_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function Import_SVERKA_Doc_POS:boolean;




 // Удаление из вспомогательных таблиц данных о документах из POS системы
function TF_main.DELETE_TMP_DOC_POS:boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;
begin
  Result:=False;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
   result_q:=server.DELETE_TMP_DOC_POS_proc(ID_TRADE_POINT);
   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          Result:=True;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;    // function TF_main.DELETE_TMP_DOC_POS:boolean;






// загрузка вспомогательных таблиц документов для экспрота данных в основную БД
function TF_main.LoadTablesForExport:boolean;
var r1, r2, r3, r4, r5, r6:boolean;
begin
  Result:=False;
 // Удаление из вспомогательных таблиц данных о документах из POS системы
  if DELETE_TMP_DOC_POS then
  begin
    r1:=Load_NaklCap_ForExport;   // шапки
    r2:=Load_NaklTov_ForExport;   // товарная начинка
    r3:=Load_Naveski_ForExport; // навески
    r4:=Load_CLIENTS_NEW_POS_ForExport; // загрузка вспомогательной таблицы новых покупателей с бонусными картами для экспрота данных в основную БД
    r5:=Load_SHTRIH_CODE_TOV_NEW_POS_ForExport; // загрузка вспом табл новых штрихкодов товара
    r6:=Load_SVERKA_DOC_POS_ForExport; // загрузка вспомогательной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT для экспрота данных в основную БД

    Result:=r1 and r2 and r3 and r4 and r5  and r6;
  end;
end;




function TF_main.ControlFilterUpload(vD:TDatetime; vID_DOC_TYPE:Integer):boolean;
var d1, d2:TDatetime;
r:boolean;
begin
  r:=False;
  with Q_Not_Sent_Docs do
  begin
    First;
    while not EOF do
    begin
      d1:=DateOf(FieldByName('D_DOC').AsDateTime);
      d2:=EndOfTheDay(FieldByName('D_DOC').AsDateTime);
      if (vD>=d1) and (vD<=d2) and (FieldByName('ID_DOC_TYPE').AsInteger=vID_DOC_TYPE) then
      begin
        r:=True;
        break;
      end;

      Next;
    end;
  end;
  result:=r;
end;

// выгрузка данных о документах в вспомогательные таблицы для экспрота данных в основную БД
// за текущую дату
function TF_main.UpLoadDocForExport(d1,d2:TDateTime; is_filter:boolean):boolean;
var
Save_Cursor :TCursor;
i_rec, n_rec:integer;
is_upload:boolean;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  result:=false;

  if LoadTablesForExport then
  begin
    try
    // снять отметку о экспорте за текущую дату
    {
    with DM1.ADOCommand_Expotr_null do
    begin
      Parameters.ParamByName('d_from').Value:=d1;
      Parameters.ParamByName('d_to').Value:=d2;
      Execute;
    end;   //    with DM1.ADOCommand_Expotr_null do
    }
    StatusBar1.Panels[0].Text:='';
     // выгрузка шапок
      with DM1.Q_NaklCap_For_Export do
      begin
        Close;
        Parameters.ParamByName('d_from').Value:=d1;
        Parameters.ParamByName('d_to').Value:=d2;
        Open;
        First;
        i_rec:=0;
        n_rec:= DM1.Q_NaklCap_For_Export.RecordCount;
        while not EOF do
        begin
          if is_filter then  is_upload:=ControlFilterUpload(FieldByName('D').AsDateTime, FieldByName('ID_DOC_TYPE').asInteger )
          else is_upload :=True;

          if is_upload then
          begin

            DataModule2.CDS_NaklCap_Export.Insert;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_NAKLCAP').asInteger:=
              FieldByName('ID_NAKLCAP').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('D').asFloat:=
              FieldByName('D').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('NN').asString:=
              FieldByName('NN').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_DOC_TYPE').asInteger:=
              FieldByName('ID_DOC_TYPE').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_CLIENT').asInteger:=
              FieldByName('ID_CLIENT').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('CHEREZ').asString:=
              FieldByName('CHEREZ').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('DOVER').asString:=
              FieldByName('DOVER').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('OSNOV').asString:=
              FieldByName('OSNOV').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('UDOST').asString:=
              FieldByName('UDOST').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('FORMOPL').asString:=
              FieldByName('FORMOPL').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('TRANSP').asFloat:=
              FieldByName('TRANSP').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('TARA').asFloat:=
              FieldByName('TARA').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('PLUS').asFloat:=
              FieldByName('PLUS').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('MINUS').asFloat:=
              FieldByName('MINUS').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('ZATRNAME').asString:=
              FieldByName('ZATRNAME').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('ZATR').asFloat:=
              FieldByName('ZATR').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('PRICE_KATEG').asInteger:=
              FieldByName('PRICE_KATEG').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_USERS').asInteger:=
              FieldByName('ID_USERS').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_SUPPLYER').asInteger:=
              FieldByName('ID_SUPPLYER').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('IS_DELETE').asInteger:=
              FieldByName('IS_DELETE').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('TOT_SUM').asFloat:=
              FieldByName('TOT_SUM').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('TOT_NUM').asFloat:=
              FieldByName('TOT_NUM').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('NUM_TARA').asFloat:=
              FieldByName('NUM_TARA').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('D_CREATE').asFloat:=
              FieldByName('D_CREATE').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('D_DELETE').asFloat:=
              FieldByName('D_DELETE').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('COMMENT_DEL').asString:=
              FieldByName('COMMENT_DEL').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_USER_DEL').asInteger:=
              FieldByName('ID_USER_DEL').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_TARA').asInteger:=
              FieldByName('ID_TARA').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_GR_PROV').asInteger:=
              FieldByName('ID_GR_PROV').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_CLI_K').asInteger:=
              FieldByName('ID_CLI_K').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('SCH_D').asString:=
              FieldByName('SCH_D').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('SCH_K').asString:=
              FieldByName('SCH_K').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('NDS').asFloat:=
              FieldByName('NDS').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('STAVKA_NDS').asFloat:=
              FieldByName('STAVKA_NDS').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_LINK_DOC').asInteger:=
              FieldByName('ID_LINK_DOC').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('CLOSE_SUM').asFloat:=
              FieldByName('CLOSE_SUM').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('PER_NACENKA').asFloat:=
              FieldByName('PER_NACENKA').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('FIX_PROV').asInteger:=
              FieldByName('FIX_PROV').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('NALOG_NAKL').asInteger:=
              FieldByName('NALOG_NAKL').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('SKIDKA_PAKET').asFloat:=
              FieldByName('SKIDKA_PAKET').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_USLUGI').asInteger:=
              FieldByName('ID_USLUGI').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('NUM_TARA_D').asFloat:=
              FieldByName('NUM_TARA_D').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_LINK_DOC_2').asInteger:=
              FieldByName('ID_LINK_DOC_2').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('IS_SLAVE').asInteger:=
              FieldByName('IS_SLAVE').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('SUM_OPL_BONUS').asFloat:=
              FieldByName('SUM_OPL_BONUS').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('SUM_OPL_CARD').asFloat:=
              FieldByName('SUM_OPL_CARD').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('SKIDKA_KOLBASA').asFloat:=
              FieldByName('SKIDKA_KOLBASA').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('SKIDKA_MYASO').asFloat:=
              FieldByName('SKIDKA_MYASO').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('SKIDKA_TNP').asFloat:=
              FieldByName('SKIDKA_TNP').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('ROUND_SUM').asFloat:=
              FieldByName('ROUND_SUM').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('SUM_SDACHI_TO_CARD').asFloat:=
              FieldByName('SUM_SDACHI_TO_CARD').asFloat;
            DataModule2.CDS_NaklCap_Export.FieldByName('IS_SVERENO').asInteger:=
              FieldByName('IS_SVERENO').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('SUM_POLUCH').asFloat:=
              FieldByName('SUM_POLUCH').asFloat;

            DataModule2.CDS_NaklCap_Export.FieldByName('IS_CAN_REGISTRED_RRO').asInteger:=
              FieldByName('IS_CAN_REGISTRED_RRO').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('IS_REGISTER_RRO').asInteger:=
              FieldByName('IS_REGISTER_RRO').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_CLI_RRO').asInteger:=
              FieldByName('ID_CLI_RRO').asInteger;
            DataModule2.CDS_NaklCap_Export.FieldByName('CHECK_NUMFISCAL').asString:=
              FieldByName('CHECK_NUMFISCAL').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('ORDERDATETIME').asString:=
              FieldByName('ORDERDATETIME').asString;
            DataModule2.CDS_NaklCap_Export.FieldByName('ID_NUM_FISCAL_KASSA').asString:=
              FieldByName('ID_NUM_FISCAL_KASSA').asString;



            DataModule2.CDS_NaklCap_Export.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
            DataModule2.CDS_NaklCap_Export.Post;
            if ( DataModule2.CDS_NaklCap_Export.ChangeCount > 0) then
            begin
              DataModule2.CDS_NaklCap_Export.ApplyUpdates(-1);
            end;

            StatusBar1.Panels[0].Text:=Format('Выгрузка шапок документов %8.2f %%',[100*i_rec/n_rec]);
            Update;
          end; // if is_upload then
          Inc(i_rec);
          Next;
        end;

        Close;
      end; // with DM1.Q_NaklCap_For_Export do


     // выгрузка товарной начинки
      with DM1.Q_NaklTov_For_Export do
      begin
        Close;
        Parameters.ParamByName('d_from').Value:=d1;
        Parameters.ParamByName('d_to').Value:=d2;
        Open;
        First;
        i_rec:=0;
        n_rec:= DM1.Q_NaklTov_For_Export.RecordCount;
        while not EOF do
        begin
          if is_filter then  is_upload:=ControlFilterUpload(FieldByName('D').asDateTime, FieldByName('ID_DOC_TYPE').asInteger )
          else is_upload :=True;

          if is_upload then
          begin
            DataModule2.CDS_NaklTov_Export.Insert;
            DataModule2.CDS_NaklTov_Export.FieldByName('ID_NAKLCAP').asInteger:=
              FieldByName('ID_NAKLCAP').asInteger;
            DataModule2.CDS_NaklTov_Export.FieldByName('ID_TOV').asInteger:=
              FieldByName('ID_TOV').asInteger;
            DataModule2.CDS_NaklTov_Export.FieldByName('PRICE').asFloat:=
              FieldByName('PRICE').asFloat;
            DataModule2.CDS_NaklTov_Export.FieldByName('NUMB').asFloat:=
              FieldByName('NUMB').asFloat;
            DataModule2.CDS_NaklTov_Export.FieldByName('COMMENT').asString:=
              FieldByName('COMMENT').asString;
            DataModule2.CDS_NaklTov_Export.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
            DataModule2.CDS_NaklTov_Export.Post;
            if ( DataModule2.CDS_NaklTov_Export.ChangeCount > 0) then
            begin
              DataModule2.CDS_NaklTov_Export.ApplyUpdates(-1);
            end;

            StatusBar1.Panels[0].Text:=Format('Выгрузка товарной части документов %8.2f %%',[100*i_rec/n_rec]);
            Update;
          end;
          Inc(i_rec);
          Next;
        end;

        Close;
      end; // with DM1.Q_NaklTov_For_Export do



     // выгрузка навесок
      with DM1.Q_Naveski_For_Export do
      begin
        Close;
        Parameters.ParamByName('d_from').Value:=d1;
        Parameters.ParamByName('d_to').Value:=d2;
        Open;
        First;
        i_rec:=0;
        n_rec:= DM1.Q_Naveski_For_Export.RecordCount;
        while not EOF do
        begin
          if is_filter then  is_upload:=ControlFilterUpload(FieldByName('DNC').asDateTime, FieldByName('ID_DOC_TYPE').asInteger )
          else is_upload :=True;

          if is_upload then
          begin

            DataModule2.CDS_Naveski_Export.Insert;
            DataModule2.CDS_Naveski_Export.FieldByName('ID_NAKLCAP').asInteger:=
              FieldByName('ID_NAKLCAP').asInteger;
            DataModule2.CDS_Naveski_Export.FieldByName('ID_TOV').asInteger:=
              FieldByName('ID_TOV').asInteger;
            DataModule2.CDS_Naveski_Export.FieldByName('NUMB').asFloat:=
              FieldByName('NUMB').asFloat;
            DataModule2.CDS_Naveski_Export.FieldByName('D').asFloat:=
              FieldByName('D').asFloat;
            DataModule2.CDS_Naveski_Export.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
            DataModule2.CDS_Naveski_Export.Post;
            if ( DataModule2.CDS_Naveski_Export.ChangeCount > 0) then
            begin
              DataModule2.CDS_Naveski_Export.ApplyUpdates(-1);
            end;

            StatusBar1.Panels[0].Text:=Format('Выгрузка навесок документов %8.2f %%',[100*i_rec/n_rec]);
            Update;
          end;
          Inc(i_rec);

          Next;
        end;

        Close;
      end; // with DM1.Q_Naveski_For_Export do


     // выгрузка новых покупателей с бонусными картами
      with DM1.Q_CLIENTS_NEW_POS do
      begin
        Close;
        Open;
        First;
        i_rec:=0;
        n_rec:= DM1.Q_CLIENTS_NEW_POS.RecordCount;
        while not EOF do
        begin
          DataModule2.CDS_CLIENTS_NEW_POS_Export.Insert;
         // select [ID_CLI], [ID_TRADE_POINT], [CLIENT], [INN], [TEL], [EMAIL], [BIRTHDAY] from [dbo].[CLIENTS_NEW_POS]
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('CLIENT').asString:=
            FieldByName('CLIENT').asString;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('INN').asString:=
            FieldByName('INN').asString;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('TEL').asString:=
            FieldByName('TEL').asString;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('EMAIL').asString:=
            FieldByName('EMAIL').asString;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('BIRTHDAY').asFloat:=
            FieldByName('BIRTHDAY').asFloat;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.FieldByName('ID_USER').asInteger:=
            FieldByName('ID_USER').asInteger;
          DataModule2.CDS_CLIENTS_NEW_POS_Export.Post;
          if ( DataModule2.CDS_CLIENTS_NEW_POS_Export.ChangeCount > 0) then
          begin
            DataModule2.CDS_CLIENTS_NEW_POS_Export.ApplyUpdates(-1);
          end;

          StatusBar1.Panels[0].Text:=Format('Выгрузка новых покупателей с бонусными картами %8.2f %%',[100*i_rec/n_rec]);
          Update;
          Inc(i_rec);

          Next;
        end;

        Close;
      end;  // with DM1.Q_CLIENTS_NEW_POS do




     // выгрузка новых штрихкодов товаров
      with Q_SHTRIH_CODE_TOV_NEW_POS do
      begin
        Close;
        Open;
        First;
        i_rec:=0;
        n_rec:= Q_SHTRIH_CODE_TOV_NEW_POS.RecordCount;
        while not EOF do
        begin
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.Insert;

          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.FieldByName('ID_TOV').asInteger:=
            FieldByName('ID_TOV').asInteger;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.FieldByName('BARCODE').asString:=
            FieldByName('BARCODE').asString;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.FieldByName('SYMBOLS_WEIGHT_OF_BARCODE').asInteger:=
            FieldByName('SYMBOLS_WEIGHT_OF_BARCODE').asInteger;
          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.FieldByName('WEIGHT_MULTIPLIER').asFloat:=
            FieldByName('WEIGHT_MULTIPLIER').asFloat;

          DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.Post;
          if ( DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.ChangeCount > 0) then
          begin
            DataModule2.CDS_SHTRIH_CODE_TOV_NEW_POS.ApplyUpdates(-1);
          end;

          StatusBar1.Panels[0].Text:=Format('Выгрузка новых штрихкодов товаров %8.2f %%',[100*i_rec/n_rec]);
          Update;
          Inc(i_rec);

          Next;
        end;

        Close;
      end;  // with Q_SHTRIH_CODE_TOV_NEW_POS do


      // выгрузка признаков сверенности документов
      with Q_SVERKA_DOC_For_Export do
      begin
        Close;
        Parameters.ParamByName('d_from').Value:=d1;
        Parameters.ParamByName('d_to').Value:=d2;
        Open;
        First;
        i_rec:=0;
        n_rec:= Q_SVERKA_DOC_For_Export.RecordCount;
        while not EOF do
        begin
          DataModule2.CDS_SVERKA_DOC_POS.Insert;
          DataModule2.CDS_SVERKA_DOC_POS.FieldByName('ID_NAKLCAP').asInteger:=
            FieldByName('ID_LINK_DOC_2').asInteger;

          DataModule2.CDS_SVERKA_DOC_POS.FieldByName('IS_SVERENO').asInteger:=
            FieldByName('IS_SVERENO').asInteger;

          DataModule2.CDS_SVERKA_DOC_POS.FieldByName('ID_TRADE_POINT').asInteger:=ID_TRADE_POINT;
          DataModule2.CDS_SVERKA_DOC_POS.Post;
          if ( DataModule2.CDS_SVERKA_DOC_POS.ChangeCount > 0) then
          begin
            DataModule2.CDS_SVERKA_DOC_POS.ApplyUpdates(-1);
          end;

          StatusBar1.Panels[0].Text:=Format('Выгрузка признаков сверенности документов %8.2f %%',[100*i_rec/n_rec]);
          Update;
          Inc(i_rec);

          Next;
        end;

        Close;
      end; // with Q_SVERKA_DOC_For_Export do



      StatusBar1.Panels[0].Text:='Выгрузка временных таблиц';
      Update;

      // импорт документов из временных таблиц полученных из POS системы клиента в учетную БД
      if Import_Doc_POS then
      begin
       // установить is_export=1 в NAKLCAP
       // установить отметку о экспорте за текущую дату
        with DM1.ADOCommand_Expotr_set do
        begin
          Parameters.ParamByName('d_from').Value:=d1;
          Parameters.ParamByName('d_to').Value:=d2;
          Execute;
        end;   //    with DM1.ADOCommand_Expotr_set do


        StatusBar1.Panels[0].Text:='Удаление устаревших данных';
        Update;
           // удалить данные о регистрации новых бонусных карт
        DM1.ADOCommandDeleteCLIENTS_NEW_POS.Execute;
            // удалить данные о регистрации новых штрихкодов товаров
        Command_Del_SHTRIH_CODE_TOV_NEW.Execute;
            // удаляем старые документы ранее 60 дня
        ADOCommandDeleteOld_Doc.Execute;

        result:=true;
        Screen.Cursor := Save_Cursor;
        MessageDlg('Данные переданы на сервер успешно!', mtInformation, [mbOk], 0);
        StatusBar1.Panels[0].Text:='';
      end
      else
      begin
        Screen.Cursor := Save_Cursor;
        MessageDlg('Ошибка при передаче данных на сервер!', mtError, [mbOk], 0);
        StatusBar1.Panels[0].Text:='';
      end;
    except
      Screen.Cursor := Save_Cursor;
      MessageDlg('Ошибка при передаче данных на сервер!', mtError, [mbOk], 0);
      StatusBar1.Panels[0].Text:='';
    end;
  end;    // if LoadTablesForExport then

end;


// выгрузка данных CONST_VALUES о настройках торговой точки в основную БД
function TF_main.UpLoad_CONST_VALUES_Export():boolean;
var
Save_Cursor :TCursor;
i_rec, n_rec:integer;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  result:=false;
  if Load_CONST_VALUES_TP_ForExport then
  begin
    try
      DataModule2.CDS_CONST_VALUES_TP_EXPORT.First;
      //удаление старых данных на сервере
      while not DataModule2.CDS_CONST_VALUES_TP_EXPORT.EOF do
      begin
        DataModule2.CDS_CONST_VALUES_TP_EXPORT.Delete;
      end;


      StatusBar1.Panels[0].Text:='';
     // выгрузка новых настроек торг точки на сервер
      with Q_All_ConstValues do
      begin
        Close;
        Open;
        First;
        i_rec:=0;
        n_rec:= Q_All_ConstValues.RecordCount;
        while not EOF do
        begin
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.Insert;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.FieldByName('ID_CONST').asInteger:=
            FieldByName('ID_CONST').asInteger;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.FieldByName('CONST_NAME').asString:=
            FieldByName('CONST_NAME').asString;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.FieldByName('CONST_VALUE').asString:=
            FieldByName('CONST_VALUE').asString;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.FieldByName('COMMENT').asString:=
            FieldByName('COMMENT').asString;

          DataModule2.CDS_CONST_VALUES_TP_EXPORT.FieldByName('ID_TP').asInteger:=ID_TRADE_POINT;
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.Post;


          StatusBar1.Panels[0].Text:=Format('Выгрузка настроек ТТ %8.2f %%',[100*i_rec/n_rec]);
          Update;
          Inc(i_rec);
          Next;
        end;

        if ( DataModule2.CDS_CONST_VALUES_TP_EXPORT.ChangeCount > 0) then
        begin
          DataModule2.CDS_CONST_VALUES_TP_EXPORT.ApplyUpdates(-1);
        end;

        Close;

      end; // with Q_All_ConstValues do

      result:=True;
      Screen.Cursor := Save_Cursor;
      MessageDlg('Данные переданы на сервер успешно!', mtInformation, [mbOk], 0);
      StatusBar1.Panels[0].Text:='';


    except
      Screen.Cursor := Save_Cursor;
      MessageDlg('Ошибка при передаче данных на сервер!', mtError, [mbOk], 0);
      StatusBar1.Panels[0].Text:='';
    end;



  end;    //   if Load_CONST_VALUES_TP_ForExport then

  if DataModule2.CDS_CONST_VALUES_TP_EXPORT.Active then
    DataModule2.CDS_CONST_VALUES_TP_EXPORT.Close;

end;








function TF_main.DeleteTramsmissionDoc_Do(ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime; var ER_COMMENT:string):boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;


begin
  result:=false;
  ER_COMMENT:='';
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

   result_q:=server.DELETE_IMPORT_DOC_POS_proc(ID_TRADE_POINT, ID_DOC_TYPE, D_FROM, D_TO);

   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
          begin
            comment:=JPair.JsonValue.Value;
            ER_COMMENT:=comment;
          end;

         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function TF_main.DeleteTramsmissionDoc_Do:boolean;




function TF_main.DeleteTramsmissionDoc(d1,d2:TDateTime):boolean;
var  ER_COMMENT:string;
// 0-док только передаетса в учетную систему
// 1-только принимается из учет сист
// 2- и передается и принимается;
// 3- не передаются и не принимаются
begin
  result:=False;
  with Q_TramsmissionDoc do
  begin
    Close;
    Open;
    First;
    while not EOF do
    begin
       // запустить серверную процедуру удаления переданных ранее документов с d1 по  d2
       result:=DeleteTramsmissionDoc_Do(FieldByName('ID_DOC_TYPE').AsInteger, d1, d2, ER_COMMENT);
       if not result then
       begin
        MessageDlg(ER_COMMENT, mtError, [mbOk], 0);
        Break;
       end;
       Next;
    end;
    Close;
  end;
end;

 // передача данных на сервер
procedure TF_main.ActionUpLoadDataExecute(Sender: TObject);
var d1,d2:TDateTime;
begin

  d1:=DateOf(D_Work.DateTime);
  d2:=EndOfTheDay(D_Work.DateTime);
//  d1:=DateOf(D_From.DateTime);
//  d2:=EndOfTheDay(D_To.DateTime);

  with QInventExists do
  begin
    Close;
    Parameters.ParamByName('D_FROM').Value:=d1;
    Parameters.ParamByName('D_TO').Value:=d2;
    Open;
    if RecordCount>0 then
    begin  // есть инвентаризация которую нужно подписать продавцами
      if F_Invent_Confirm_Dlg(FieldByName('ID_NAKLCAP').AsInteger, FieldByName('TOT_SUM').AsFloat, FieldByName('TOT_NUM').AsFloat)<>mrOK then
      begin
        MessageDlg('Инвентаризация и передача смены не подтверждена продавцами! Данные не будут отправлены на сервер!',
              mtError, [mbOk], 0);
        Exit;
      end;
    end;

  end;

  if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
    ActionConnectRemoteDBExecute(Sender);
  if   is_connect_server then
  begin

    if CTRLBoolean=1 then  // нажата Alt - передача данных с удалением раннее переданных за текущую дату
    begin
      // удаление на сервере раннее переданных за текущую дату

      if DeleteTramsmissionDoc(d1,d2) then
      begin
         // отметка нулем у всех передаваемых документов за текущую дату признака переданности
        ADOCommandUnSetExportDoc.Parameters.ParamByName('d_from').Value:=d1;
        ADOCommandUnSetExportDoc.Parameters.ParamByName('d_to').Value:=d2;
        ADOCommandUnSetExportDoc.Execute;
      end
      else  MessageDlg('Ошибка при удалении данных на сервере! Будут отправлены только неотправленные ранее данные',
              mtError, [mbOk], 0);

    end;
// выгрузка данных о документах в вспомогательные таблицы для экспрота данных в основную БД
// за текущую дату
    UpLoadDocForExport(d1,d2, false);

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      ActionDisconnectRemoteDBExecute(Sender);
  end;

end;

procedure TF_main.ActionSaleExecute(Sender: TObject);
begin
 // D_Work.Date:=Now(); // продажи всегда текущей датой
  FSaleDocList_dlg(200,-1); // продажа
end;

procedure TF_main.ActionSettingConstExecute(Sender: TObject);
begin
  FSettingConst_dlg;
end;

procedure TF_main.ActionSpisanieOvochiExecute(Sender: TObject);
begin
 FSaleDocList_dlg(272,-1); // списание овощей
end;


function TF_main.SetupRRO(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin

  result:=false;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Setup');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('Certificate', Certificate);
    JsonObject.AddPair('PrivateKey', PrivateKey);
    JsonObject.AddPair('Password', PasswordKey);
  end;
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


  try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  ErrorCode:='';
  if sResponse<>'' then
  begin

    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');


  if not result then   MessageDlg('Ошибка при выполнении команды SetupRRO', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
     Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\SetupRRO.dat', false,  TEncoding.ANSI);
     Writer.Write(sResponse);
     Writer.Free();
  end;

end;

function TF_Main.SetupRegistrar(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin
  result:=False;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'SetupRegistrar');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;


  JsonObject.AddPair('WorkMode', 'Normal');
  JsonObject.AddPair('SendToCabinet',TJSONBool.Create(True));
  Json :=JsonObject.ToJSON ;
  JsonObject.Free;
  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  ErrorCode:='';
  if sResponse<>'' then
  begin

    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');


  if not result then   MessageDlg('Ошибка при выполнении команды SetupRegistrar', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\SetupRegistrar.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;


procedure TF_main.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Notebook1.PageIndex:= NewTab;
end;

function TF_Main.TransactionsRegistrarState(is_ALCOGOL:boolean):boolean;  // Запрос состояния ПРРО
var
  Json, s_ShiftState: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;
  ErrorCode, ErrorMessage:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin
  result:=False;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'TransactionsRegistrarState');



  if is_ALCOGOL then
  begin
//    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
//    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
//    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
 //   JsonObject.AddPair('Certificate', Certificate);
 //   JsonObject.AddPair('PrivateKey', PrivateKey);
 //   JsonObject.AddPair('Password', PasswordKey);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;


  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    ErrorMessage:= JsonObject.Get('ErrorMessage').JsonValue.Value;
    s_ShiftState:= JsonObject.Get('ShiftState').JsonValue.Value;

  //  s_user:= JsonObject.Get('Name').JsonValue.Value;
    if s_ShiftState='1' then
    begin
      if is_ALCOGOL then
      begin
        IS_shift_Opened_ALCOGOL:=1;
        shift_user_ALCOGOL:=JsonObject.Get('Name').JsonValue.Value;
        OpenShiftFiscalNum_ALCOGOL:= JsonObject.Get('OpenShiftFiscalNum').JsonValue.Value;
        ShiftId_ALCOGOL:= JsonObject.Get('ShiftId').JsonValue.Value.ToInt64;

      end
      else
      begin
        IS_shift_Opened:=1;
        shift_user:=JsonObject.Get('Name').JsonValue.Value;
        OpenShiftFiscalNum:= JsonObject.Get('OpenShiftFiscalNum').JsonValue.Value;
        ShiftId:= JsonObject.Get('ShiftId').JsonValue.Value.ToInt64;
      end;
    end
    else
    begin
      if is_ALCOGOL then
      begin
        IS_shift_Opened_ALCOGOL:=0;
        shift_user_ALCOGOL:='';
        OpenShiftFiscalNum_ALCOGOL:= '';
        ShiftId_ALCOGOL:=0;
      end
      else
      begin
        IS_shift_Opened:=0;
        shift_user:='';
        OpenShiftFiscalNum:= '';
        ShiftId:=0;
      end;
    end;

    JsonObject.Free;
  end; //  if sResponse<>'' then

  result:= (ErrorCode='Ok');

  if not result then
  begin
    MessageDlg('Ошибка при выполнении команды TransactionsRegistrarState - '+ErrorCode+' - '+ErrorMessage, mtError, [mbOk], 0);
    if ErrorCode='InconsistentRegistrarState' then
    begin
      if MessageDlg('Локальное состояние ПРРО не соответствует состоянию ПРРО на Фискольном сервере. Выполнить процедеру CleanUp?', mtWarning,
      [mbNo, mbYes], 0)= mrYes then   Cleanup(is_ALCOGOL);
    end;

  end;

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\TransactionsRegistrarState.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;



function TF_Main.ObjectsRRO():boolean;  // Запрос доступных объектов ПРРО
var
  Json, s_ShiftState: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin
  result:=False;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Objects');

 // JsonObject.AddPair('Certificate', Certificate);
 // JsonObject.AddPair('PrivateKey', PrivateKey);
 // JsonObject.AddPair('Password', PasswordKey);




  Json :=JsonObject.ToJSON ;

  JsonObject.Free;


  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
  //  s_ShiftState:= JsonObject.Get('ShiftState').JsonValue.Value;


    JsonObject.Free;
  end; //  if sResponse<>'' then

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\Objects.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  result:= (ErrorCode='Ok');

  if not result then
  begin
    MessageDlg('Ошибка при выполнении команды Objects - '+ErrorCode, mtError, [mbOk], 0);


  end;

 

end;



function TF_Main.OpenShift(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonValue:TJsonValue;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  ErrorCode:string;
  ErrorMessage:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;

begin
  result:=false;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'OpenShift');


   if is_ALCOGOL then
  begin
//    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
//    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
//    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
//    JsonObject.AddPair('Certificate', Certificate);
//    JsonObject.AddPair('PrivateKey', PrivateKey);
//    JsonObject.AddPair('Password', PasswordKey);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;




  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');
    if is_ALCOGOL then IS_KASSA_OFFLINE_ALCOGOL:=JsonValue.GetValue<Boolean>('Offline')
    else IS_KASSA_OFFLINE:=JsonValue.GetValue<Boolean>('Offline');
    ErrorMessage:=JsonValue.GetValue<String>('ErrorMessage');
    JsonValue.Free;
  end;
  result:= (ErrorCode='Ok');

  if not result then
    MessageDlg('Ошибка при выполнении команды OpenShift:'+ErrorCode+':'+ErrorMessage, mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\OpenShift.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  if IS_KASSA_OFFLINE then
          L_shift_Opened.Caption:='Смена открыта offline'
  else  L_shift_Opened.Caption:='Смена открыта online';

end;


// перечень смен за период
function TF_Main.Shifts(is_ALCOGOL:boolean; vD_From, vD_To:TDateTime; var vShifts : TShifts):boolean;
var
  Json: string;
  sResponse: string;
  JsonValue:TJsonValue;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;
  ArrayElement: TJSonValue;
  ShiftItem:TShiftItem;

  ErrorCode:string;
  ErrorMessage:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
  i:integer;
  sd:string;
 // Reader: TStreamReader;
//  Ch: Char;
  function del_microsec(s_date:string):string;
  var p:integer;
  begin
    p:=Pos('.',s_date);
    if p<>0 then Delete(s_date, p, length(s_date)-p+1);
    result:= s_date;
  end;
begin
  result:=false;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Shifts');

   if is_ALCOGOL then
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;
  JsonObject.AddPair('From', DateToISO8601(vD_From,True));
  JsonObject.AddPair('To', DateToISO8601(vD_To,True));

  Json :=JsonObject.ToJSON ;
  JsonObject.Free;
  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;


  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\Shifts.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  {
    sResponse:='';
    Reader := TStreamReader.Create(TFileStream.Create(ExtractFilePath(Application.ExeName)+'\Shifts.dat', fmOpenRead), TEncoding.ANSI);
    while Reader.Peek() >= 0 do
    begin
      Ch := Char(Reader.Read());
      sResponse := sResponse + Ch;
    end;

    Reader.Close();
    Reader.BaseStream.Free;
    Reader.Free();
  }


  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');
    ErrorMessage:=JsonValue.GetValue<String>('ErrorMessage');
    if ErrorCode='Ok' then
    begin
    JsonArray := JsonValue.GetValue<TJSONArray>('Shifts');
    i:=0;
      for ArrayElement in JsonArray do
      begin
              SetLength(vShifts,i+1);
           // инфо о i+1 смене
              ShiftItem.ShiftId:= ArrayElement.GetValue<Integer>('ShiftId');
              ShiftItem.OpenShiftFiscalNum:= ArrayElement.GetValue<String>('OpenShiftFiscalNum');
              ShiftItem.CloseShiftFiscalNum:= ArrayElement.GetValue<String>('CloseShiftFiscalNum');

              sd := ArrayElement.GetValue<String>('Opened');
              sd := del_microsec(sd);
              ShiftItem.Opened:=ISO8601ToDate(sd,True);

             // ShiftItem.Opened:=ISO8601ToDate(ArrayElement.GetValue<String>('Opened'),True);

              ShiftItem.OpenName:= ArrayElement.GetValue<String>('OpenName');
              ShiftItem.OpenSubjectKeyId:= ArrayElement.GetValue<String>('OpenSubjectKeyId');
              sd:=ArrayElement.GetValue<String>('Closed');
              if sd<>'' then
              begin
                sd := ArrayElement.GetValue<String>('Closed');
                sd := del_microsec(sd);
                ShiftItem.Closed:=ISO8601ToDate(sd,True);

               // ShiftItem.Closed:=ISO8601ToDate(ArrayElement.GetValue<String>('Closed'),True);
              end
              else ShiftItem.Closed:=0;
              ShiftItem.CloseName:= ArrayElement.GetValue<String>('CloseName');
              ShiftItem.CloseSubjectKeyId:= ArrayElement.GetValue<String>('CloseSubjectKeyId');
              ShiftItem.ZRepFiscalNum:= ArrayElement.GetValue<String>('ZRepFiscalNum');
              vShifts[i]:=ShiftItem;
              Inc(i);
      end;
    end;

    JsonValue.Free;

  end;
  result:= (ErrorCode='Ok');

  if not result then
    MessageDlg('Ошибка при выполнении команды Shifts:'+ErrorCode+':'+ErrorMessage, mtError, [mbOk], 0);

end;



function TF_Main.GetDocumentsShift(is_ALCOGOL:boolean; ID_smeny:int64; var doc_list:TDocuments):boolean;
var
  Json: string;
  sResponse: string;
  JsonValue:TJsonValue;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;
  ArrayElement: TJSonValue;
  DocumentItem:TDocumentItem;
  ErrorCode, ErrorMessage:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
  i:integer;

begin
  result:=false;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Documents');


   if is_ALCOGOL then
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
    JsonObject.AddPair('ShiftId', TJSONNumber.Create(ID_smeny));
    JsonObject.AddPair('OpenShiftFiscalNum', OpenShiftFiscalNum_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
    JsonObject.AddPair('ShiftId', TJSONNumber.Create(ID_smeny));
    JsonObject.AddPair('OpenShiftFiscalNum', OpenShiftFiscalNum);
  end;




  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';


  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');
    ErrorMessage:=JsonValue.GetValue<String>('ErrorMessage');
    try
    JsonArray := JsonValue.GetValue<TJSONArray>('Documents');
    i:=0;
    for ArrayElement in JsonArray do
    begin
            SetLength(doc_list,i+1);
         // инфо о i+1 документе
             {
               type TDocumentItem = record
              NumFiscal: string; // Фіскальний номер документа
              NumLocal: int64;  // Локальний номер документа
              DocDateTime:string; // Дата і час операції, зафіксованої документом
              DocClass:string;  // Клас документа (“Check”, “ZRep”)
              CheckDocType:string; // Тип чека (“SaleGoods”, …)
              CheckDocSubType:string; // Розширений тип чека (“CheckGoods”, …)
              Revoked:boolean; // Ознака відкликаного документа
              Storned:boolean; // Ознака сторнованого документа
            end;  }
            DocumentItem.NumFiscal:= ArrayElement.GetValue<String>('NumFiscal');
            DocumentItem.NumLocal:= ArrayElement.GetValue<Integer>('NumLocal');
            DocumentItem.DocDateTime:= ISO8601ToDate(ArrayElement.GetValue<String>('DocDateTime'),True);
            DocumentItem.DocClass:= ArrayElement.GetValue<String>('DocClass');
            DocumentItem.CheckDocType:= ArrayElement.GetValue<String>('CheckDocType');
            DocumentItem.CheckDocSubType:= ArrayElement.GetValue<String>('CheckDocSubType');
            DocumentItem.Revoked:= ArrayElement.GetValue<boolean>('Revoked');
            DocumentItem.Storned:= ArrayElement.GetValue<boolean>('Storned');


            doc_list[i]:=DocumentItem;
            Inc(i);
       end;
    except

      MessageDlg('Ошибка при выполнении команды Documents:'+ErrorMessage, mtError, [mbOk], 0);

    end;

    JsonValue.Free;

  end;

  result:= (ErrorCode='Ok');

  if not result then   MessageDlg('Ошибка при выполнении команды Documents', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\Documentst.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;


end;



procedure TF_main.PRRO_ON_OFFClick(Sender: TObject);
begin
 // вкл-выкл режима регистрации и отображения чеков ПРРО
  IS_RECEPT_TO_REGISTR_RRO:= not IS_RECEPT_TO_REGISTR_RRO;
  Last_IS_RECEPT_TO_REGISTR_RRO:=IS_RECEPT_TO_REGISTR_RRO;
  if IS_RECEPT_TO_REGISTR_RRO then
   PRRO_ON_OFF.Caption:='ПРРО - режим вкл'
  else PRRO_ON_OFF.Caption:='ПРРО - режим выкл';
  BitBtn26.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
  BitBtn27.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
 // BBInkassacia.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
//  BBZatraty.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
 // BBKassaIn.Visible:= IS_RECEPT_TO_REGISTR_RRO;
 // BBKassaOut.Visible:= IS_RECEPT_TO_REGISTR_RRO;
 // GroupBox4.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
  if IS_RECEPT_TO_REGISTR_RRO then
    ShapePRRO.Brush.Color:=clRed
  else ShapePRRO.Brush.Color:=clGreen;
end;

procedure TF_main.Q_Not_Sent_DocsAfterScroll(DataSet: TDataSet);
begin
 if F_Not_Sent_Doc<>nil then
 begin
   F_Not_Sent_Doc.E_Filter_str.Text :=
    Q_Not_Sent_Docs.FieldByName(F_Not_Sent_Doc.CarentFieldSeach).AsString;
 end;

end;

function TF_Main.CloseShift(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSonValue: TJSonValue;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;

begin
  result:=False;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'CloseShift');


  if is_ALCOGOL then
  begin
//    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
//    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
//    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
//    JsonObject.AddPair('Certificate', Certificate);
//    JsonObject.AddPair('PrivateKey', PrivateKey);
//    JsonObject.AddPair('Password', PasswordKey);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;



  JsonObject.AddPair('ZRepAuto',TJSONBool.Create(True));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
   JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');

    if ErrorCode='Ok' then
    begin
      if is_ALCOGOL then
      begin
          if not JsonValue.GetValue<TJsonValue>('ZRepAutoInfo.NumFiscal').Null then
          begin
            ZRepNumFiscal_ALCOGOL:=JsonValue.GetValue<String>('ZRepAutoInfo.NumFiscal');
            IS_KASSA_OFFLINE_ALCOGOL:=JsonValue.GetValue<Boolean>('Offline');
            if not IS_KASSA_OFFLINE_ALCOGOL then
              GetZRep(True);   // получить Z -отчет
          end;
      end
      else
      begin
          if not JsonValue.GetValue<TJsonValue>('ZRepAutoInfo.NumFiscal').Null then
          begin
            ZRepNumFiscal:=JsonValue.GetValue<String>('ZRepAutoInfo.NumFiscal');
            IS_KASSA_OFFLINE:=JsonValue.GetValue<Boolean>('Offline');
            if not IS_KASSA_OFFLINE then
              GetZRep(False);  // получить Z -отчет
          end;

      end;
    end;

    JsonValue.Free;
  end;

  result:= (ErrorCode='Ok');

  if not result then   MessageDlg('Ошибка при выполнении команды CloseShift', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\CloseShift.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;


function TF_Main.Cleanup(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin
  result:=False;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Cleanup');
 if is_ALCOGOL then
  begin
    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
    JsonObject.AddPair('Certificate', Certificate);
    JsonObject.AddPair('PrivateKey', PrivateKey);
    JsonObject.AddPair('Password', PasswordKey);
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;


  JsonObject.AddPair('Remove',TJSONBool.Create(False));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');

  if not result then   MessageDlg('Ошибка при выполнении команды Cleanup', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\Cleanup.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;

function TF_Main.LastShiftTotals(is_ALCOGOL,with_print:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;

  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
  i:integer;
  JSonValue: TJSonValue;

  ArrayElement: TJSonValue;
  Z_REP:TZ_REP;
  ZREPREALIZ:TZREPREALIZ;
  ZREPRETURN:TZREPRETURN;
  ZREPBODY:TZREPBODY;
  PAYFORMS:TPAYFORMS;
  TAXES:TTAXES;


begin
  result:=False;
  ostat_kassy_RRO:=0.0;
  ostat_kassy_ALCOGOL:=0.0;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'LastShiftTotals');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;


  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetLastShiftTotalsQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;

   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');
    if ErrorCode='Ok' then
    begin
    // продажи

          JsonValue.TryGetValue('Totals.ZREPREALIZ.SUM', ZREPREALIZ.SUM);
          JsonValue.TryGetValue('Totals.ZREPREALIZ.RNDSUM', ZREPREALIZ.RNDSUM);
          JsonValue.TryGetValue('Totals.ZREPREALIZ.NORNDSUM', ZREPREALIZ.NORNDSUM);
          JsonValue.TryGetValue('Totals.ZREPREALIZ.ORDERSCNT', ZREPREALIZ.ORDERSCNT);


         { ZREPREALIZ.SUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.SUM');
          ZREPREALIZ.RNDSUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.RNDSUM');
          ZREPREALIZ.NORNDSUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.NORNDSUM');
          ZREPREALIZ.ORDERSCNT:=JsonValue.GetValue<Integer>('Totals.ZREPREALIZ.ORDERSCNT');  }


          // оплаты по продажам
          JsonArray:=nil;
          if JsonValue.TryGetValue('Totals.ZREPREALIZ.PAYFORMS',JsonArray) then
          begin
            i:=0;
            for ArrayElement in JsonArray do
            begin
              SetLength(ZREPREALIZ.PAYFORMS,i+1);
              PAYFORMS.PAYFORMCD:= ArrayElement.GetValue<Integer>('PAYFORMCD');
              PAYFORMS.PAYFORMNM:= ArrayElement.GetValue<String>('PAYFORMNM');
              PAYFORMS.SUM:= ArrayElement.GetValue<Extended>('SUM');
              ZREPREALIZ.PAYFORMS[i]:=PAYFORMS;
              if PAYFORMS.PAYFORMCD=0 then
              begin
               if is_ALCOGOL then ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL+PAYFORMS.SUM
               else ostat_kassy_RRO:=ostat_kassy_RRO+PAYFORMS.SUM;
              end;

              Inc(i);
            end;
          end;




          // налоги по продажам
          JsonArray:=nil;
          if JsonValue.TryGetValue('Totals.ZREPREALIZ.TAXES', JsonArray) then
          begin
            i:=0;
            for ArrayElement in JsonArray do
            begin
              SetLength(ZREPREALIZ.TAXES,i+1);
              TAXES.TYPE_TAX:= ArrayElement.GetValue<Integer>('TYPE');
              TAXES.NAME:= ArrayElement.GetValue<String>('NAME');
              TAXES.LETTER:= ArrayElement.GetValue<String>('LETTER');
              TAXES.PRC:= ArrayElement.GetValue<Extended>('PRC');
              TAXES.SIGN:= ArrayElement.GetValue<Boolean>('SIGN');
              TAXES.TURNOVER:= ArrayElement.GetValue<Extended>('TURNOVER');
              TAXES.TURNOVERDISCOUNT:= ArrayElement.GetValue<Extended>('TURNOVERDISCOUNT');
              TAXES.SOURCESUM:= ArrayElement.GetValue<Extended>('SOURCESUM');
              TAXES.SUM:= ArrayElement.GetValue<Extended>('SUM');
              ZREPREALIZ.TAXES[i]:=TAXES;
              Inc(i);
            end;
          end;


         { else
          begin

              SetLength(ZREPREALIZ.TAXES,1);
              TAXES.TYPE_TAX:= -1;
              TAXES.NAME:= '';
              TAXES.LETTER:='';
              TAXES.PRC:= 0.0;
              TAXES.SIGN:= False;
              TAXES.TURNOVER:= 0.0;
              TAXES.TURNOVERDISCOUNT:= 0.0;
              TAXES.SOURCESUM:= 0.0;
              TAXES.SUM:= 0.0;
              ZREPREALIZ.TAXES[0]:=TAXES;
          end; }





            JsonValue.TryGetValue('Totals.ZREPRETURN.SUM', ZREPRETURN.SUM);
            JsonValue.TryGetValue('Totals.ZREPRETURN.ORDERSCNT', ZREPRETURN.ORDERSCNT);

         //   ZREPRETURN.SUM:=JsonValue.GetValue<Extended>('Totals.ZREPRETURN.SUM');
         //   ZREPRETURN.ORDERSCNT:=JsonValue.GetValue<Integer>('Totals.ZREPRETURN.ORDERSCNT');

            // формы оплаты возвратов
          JsonArray:=nil;
          if JsonValue.TryGetValue('Totals.ZREPRETURN.PAYFORMS', JsonArray) then
          begin
            i:=0;
            for ArrayElement in JsonArray do
            begin
              SetLength(ZREPRETURN.PAYFORMS,i+1);
              PAYFORMS.PAYFORMCD:= ArrayElement.GetValue<Integer>('PAYFORMCD');
              PAYFORMS.PAYFORMNM:= ArrayElement.GetValue<String>('PAYFORMNM');
              PAYFORMS.SUM:= ArrayElement.GetValue<Extended>('SUM');
              ZREPRETURN.PAYFORMS[i]:=PAYFORMS;


              if PAYFORMS.PAYFORMCD=0 then
              begin
                if is_ALCOGOL then ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL-PAYFORMS.SUM
                else ostat_kassy_RRO:=ostat_kassy_RRO-PAYFORMS.SUM;
              end;

              Inc(i);
            end;
          end;




             // налоги по возвратам
          JsonArray:=nil;
          if JsonValue.TryGetValue('Totals.ZREPRETURN.TAXES', JsonArray) then
         // JsonArray := JsonValue.GetValue<TJSONArray>('Totals.ZREPRETURN.TAXES');
          begin
            i:=0;
            for ArrayElement in JsonArray do
            begin
              SetLength(ZREPRETURN.TAXES,i+1);
              TAXES.TYPE_TAX:= ArrayElement.GetValue<Integer>('TYPE');
              TAXES.NAME:= ArrayElement.GetValue<String>('NAME');
              TAXES.LETTER:= ArrayElement.GetValue<String>('LETTER');
              TAXES.PRC:= ArrayElement.GetValue<Extended>('PRC');
              TAXES.SIGN:= ArrayElement.GetValue<Boolean>('SIGN');
              TAXES.TURNOVER:= ArrayElement.GetValue<Extended>('TURNOVER');
              TAXES.SUM:= ArrayElement.GetValue<Extended>('SUM');
              ZREPRETURN.TAXES[i]:=TAXES;
              Inc(i);
            end;
          end;







          ZREPBODY.SERVICEINPUT:=0.0;
          ZREPBODY.SERVICEOUTPUT:=0.0;
             // служебное внесение  и изъятие кассы
          JsonValue.TryGetValue('Totals.ZREPBODY.SERVICEINPUT', ZREPBODY.SERVICEINPUT);
          JsonValue.TryGetValue('Totals.ZREPBODY.SERVICEOUTPUT', ZREPBODY.SERVICEOUTPUT);

           { if not JsonValue.GetValue<TJsonValue>('Totals.ZREPBODY.SERVICEINPUT').Null then
            begin
              ZREPBODY.SERVICEINPUT:=JsonValue.GetValue<Extended>('Totals.ZREPBODY.SERVICEINPUT');
            end;
            if not JsonValue.GetValue<TJsonValue>('Totals.ZREPBODY.SERVICEOUTPUT').Null then
            begin
              ZREPBODY.SERVICEOUTPUT:=JsonValue.GetValue<Extended>('Totals.ZREPBODY.SERVICEOUTPUT');
            end;  }

         if is_ALCOGOL then
         begin
          ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL+ZREPBODY.SERVICEINPUT;
          ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL-ZREPBODY.SERVICEOUTPUT;
         end
         else
         begin
          ostat_kassy_RRO:=ostat_kassy_RRO+ZREPBODY.SERVICEINPUT;
          ostat_kassy_RRO:=ostat_kassy_RRO-ZREPBODY.SERVICEOUTPUT;

         end;




        Z_REP.ZREPREALIZ:=ZREPREALIZ;
        Z_REP.ZREPRETURN:=ZREPRETURN;
        Z_REP.ZREPBODY:=ZREPBODY;


        if with_print then
        begin
          // печать X- отчета
          if is_ALCOGOL then Print_LastShiftTotals_RRO(1,Z_REP,ostat_kassy_ALCOGOL)
          else  Print_LastShiftTotals_RRO(0,Z_REP,ostat_kassy_RRO);
        end;


    end;  //  if ErrorCode='Ok' then
    if JsonValue<>nil then JsonValue.Free;

  end; //  if sResponse<>'' then


  result:= (ErrorCode='Ok');

  if not result then   MessageDlg('Ошибка при выполнении команды LastShiftTotals', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\LastShiftTotals.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;
(*
function TF_Main.LastShiftTotals(is_ALCOGOL,with_print:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONArray: TJSONArray;

  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
  i:integer;
  JSonValue: TJSonValue;
  ArrayElement: TJSonValue;
  Z_REP:TZ_REP;
  ZREPREALIZ:TZREPREALIZ;
  ZREPRETURN:TZREPRETURN;
  ZREPBODY:TZREPBODY;
  PAYFORMS:TPAYFORMS;
  TAXES:TTAXES;


begin
  result:=False;
  ostat_kassy_RRO:=0.0;
  ostat_kassy_ALCOGOL:=0.0;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'LastShiftTotals');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
  end
  else
  begin
    JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;


  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetLastShiftTotalsQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;

   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;

  ErrorCode:='';
  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');
    if ErrorCode='Ok' then
    begin
    // продажи
      try
        if not JsonValue.GetValue<TJsonValue>('Totals.ZREPREALIZ').Null then
        begin
          ZREPREALIZ.SUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.SUM');
          ZREPREALIZ.RNDSUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.RNDSUM');
          ZREPREALIZ.NORNDSUM:=JsonValue.GetValue<Extended>('Totals.ZREPREALIZ.NORNDSUM');
          ZREPREALIZ.ORDERSCNT:=JsonValue.GetValue<Integer>('Totals.ZREPREALIZ.ORDERSCNT');

          try
          // оплаты по продажам
            if not JsonValue.GetValue<TJsonValue>('Totals.ZREPREALIZ.PAYFORMS').Null then
            begin
              JsonArray := JsonValue.GetValue<TJSONArray>('Totals.ZREPREALIZ.PAYFORMS');
              i:=0;
              for ArrayElement in JsonArray do
              begin
                SetLength(ZREPREALIZ.PAYFORMS,i+1);
                PAYFORMS.PAYFORMCD:= ArrayElement.GetValue<Integer>('PAYFORMCD');
                PAYFORMS.PAYFORMNM:= ArrayElement.GetValue<String>('PAYFORMNM');
                PAYFORMS.SUM:= ArrayElement.GetValue<Extended>('SUM');
                ZREPREALIZ.PAYFORMS[i]:=PAYFORMS;
                if PAYFORMS.PAYFORMCD=0 then
                begin
                 if is_ALCOGOL then ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL+PAYFORMS.SUM
                 else ostat_kassy_RRO:=ostat_kassy_RRO+PAYFORMS.SUM;
                end;

                Inc(i);
              end;
            end;
          except
           on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
          end;

          try
          // налоги по продажам
            if not JsonValue.GetValue<TJsonValue>('Totals.ZREPREALIZ.TAXES').Null then
           // if JsonValue.TryGetValue('Totals.ZREPREALIZ.TAXES', JsonArray) then
            begin
              JsonArray := JsonValue.GetValue<TJSONArray>('Totals.ZREPREALIZ.TAXES');
              i:=0;
              for ArrayElement in JsonArray do
              begin
                SetLength(ZREPREALIZ.TAXES,i+1);
                TAXES.TYPE_TAX:= ArrayElement.GetValue<Integer>('TYPE');
                TAXES.NAME:= ArrayElement.GetValue<String>('NAME');
                TAXES.LETTER:= ArrayElement.GetValue<String>('LETTER');
                TAXES.PRC:= ArrayElement.GetValue<Extended>('PRC');
                TAXES.SIGN:= ArrayElement.GetValue<Boolean>('SIGN');
                TAXES.TURNOVER:= ArrayElement.GetValue<Extended>('TURNOVER');
                TAXES.TURNOVERDISCOUNT:= ArrayElement.GetValue<Extended>('TURNOVERDISCOUNT');
                TAXES.SOURCESUM:= ArrayElement.GetValue<Extended>('SOURCESUM');
                TAXES.SUM:= ArrayElement.GetValue<Extended>('SUM');
                ZREPREALIZ.TAXES[i]:=TAXES;
                Inc(i);
              end;
            end;
          except
           on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
          end;
         { else
          begin

              SetLength(ZREPREALIZ.TAXES,1);
              TAXES.TYPE_TAX:= -1;
              TAXES.NAME:= '';
              TAXES.LETTER:='';
              TAXES.PRC:= 0.0;
              TAXES.SIGN:= False;
              TAXES.TURNOVER:= 0.0;
              TAXES.TURNOVERDISCOUNT:= 0.0;
              TAXES.SOURCESUM:= 0.0;
              TAXES.SUM:= 0.0;
              ZREPREALIZ.TAXES[0]:=TAXES;
          end; }

        end;


        try
          if not JsonValue.GetValue<TJsonValue>('Totals.ZREPRETURN').Null then
          begin
            ZREPRETURN.SUM:=JsonValue.GetValue<Extended>('Totals.ZREPRETURN.SUM');
            ZREPRETURN.ORDERSCNT:=JsonValue.GetValue<Integer>('Totals.ZREPRETURN.ORDERSCNT');
            try
            // формы оплаты возвратов
              if not JsonValue.GetValue<TJsonValue>('Totals.ZREPRETURN.PAYFORMS').Null then
              begin
                JsonArray := JsonValue.GetValue<TJSONArray>('Totals.ZREPRETURN.PAYFORMS');
                i:=0;
                for ArrayElement in JsonArray do
                begin
                  SetLength(ZREPRETURN.PAYFORMS,i+1);
                  PAYFORMS.PAYFORMCD:= ArrayElement.GetValue<Integer>('PAYFORMCD');
                  PAYFORMS.PAYFORMNM:= ArrayElement.GetValue<String>('PAYFORMNM');
                  PAYFORMS.SUM:= ArrayElement.GetValue<Extended>('SUM');
                  ZREPRETURN.PAYFORMS[i]:=PAYFORMS;


                  if PAYFORMS.PAYFORMCD=0 then
                  begin
                    if is_ALCOGOL then ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL-PAYFORMS.SUM
                    else ostat_kassy_RRO:=ostat_kassy_RRO-PAYFORMS.SUM;
                  end;

                  Inc(i);
                end;
              end;
            except
             on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
            end;

            try
             // налоги по возвратам
              if not JsonValue.GetValue<TJsonValue>('Totals.ZREPRETURN.TAXES').Null then
              begin
                JsonArray := JsonValue.GetValue<TJSONArray>('Totals.ZREPRETURN.TAXES');
                i:=0;
                for ArrayElement in JsonArray do
                begin
                  SetLength(ZREPRETURN.TAXES,i+1);
                  TAXES.TYPE_TAX:= ArrayElement.GetValue<Integer>('TYPE');
                  TAXES.NAME:= ArrayElement.GetValue<String>('NAME');
                  TAXES.LETTER:= ArrayElement.GetValue<String>('LETTER');
                  TAXES.PRC:= ArrayElement.GetValue<Extended>('PRC');
                  TAXES.SIGN:= ArrayElement.GetValue<Boolean>('SIGN');
                  TAXES.TURNOVER:= ArrayElement.GetValue<Extended>('TURNOVER');
                  TAXES.SUM:= ArrayElement.GetValue<Extended>('SUM');
                  ZREPRETURN.TAXES[i]:=TAXES;
                  Inc(i);
                end;
              end;
            except
             on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
            end;
          end;

        except
         on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
        end;

        try
          if not JsonValue.GetValue<TJsonValue>('Totals.ZREPBODY').Null then
          begin
            ZREPBODY.SERVICEINPUT:=0.0;
            ZREPBODY.SERVICEOUTPUT:=0.0;
             // служебное внесение  и изъятие кассы
            if not JsonValue.GetValue<TJsonValue>('Totals.ZREPBODY.SERVICEINPUT').Null then
            begin
              ZREPBODY.SERVICEINPUT:=JsonValue.GetValue<Extended>('Totals.ZREPBODY.SERVICEINPUT');
            end;
            if not JsonValue.GetValue<TJsonValue>('Totals.ZREPBODY.SERVICEOUTPUT').Null then
            begin
              ZREPBODY.SERVICEOUTPUT:=JsonValue.GetValue<Extended>('Totals.ZREPBODY.SERVICEOUTPUT');
            end;

             if is_ALCOGOL then
             begin
              ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL+ZREPBODY.SERVICEINPUT;
              ostat_kassy_ALCOGOL:=ostat_kassy_ALCOGOL-ZREPBODY.SERVICEOUTPUT;
             end
             else
             begin
              ostat_kassy_RRO:=ostat_kassy_RRO+ZREPBODY.SERVICEINPUT;
              ostat_kassy_RRO:=ostat_kassy_RRO-ZREPBODY.SERVICEOUTPUT;

             end;

          end;
        except
         on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
        end;

        Z_REP.ZREPREALIZ:=ZREPREALIZ;
        Z_REP.ZREPRETURN:=ZREPRETURN;
        Z_REP.ZREPBODY:=ZREPBODY;


        if with_print then
        begin
          // печать X- отчета
          if is_ALCOGOL then Print_LastShiftTotals_RRO(1,Z_REP,ostat_kassy_ALCOGOL)
          else  Print_LastShiftTotals_RRO(0,Z_REP,ostat_kassy_RRO);
        end;

      except
       on E: EJSONException do  MessageDlg('Ошибка '+ E.Message, mtError, [mbOk], 0);
      end;
    end;  //  if ErrorCode='Ok' then
    JsonValue.Free;
  end; //  if sResponse<>'' then


  result:= (ErrorCode='Ok');

  if not result then   MessageDlg('Ошибка при выполнении команды LastShiftTotals', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\LastShiftTotals.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

end;

*)

// запрос Z-отчета по кассе с сервера
function TF_main.GetZRep(is_ALCOGOL:boolean ):boolean;
 var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSonValue: TJSonValue;

  Writer: TStreamWriter;


  is_repeat_Transfer, is_Transfered:boolean;
  ResultCode, ResultText, DataZRep64,
  ErrorCode, ErrorMessage :string;
  DataZRep :widestring;
begin

  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'GetZRep');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('RegistrarNumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));
    JsonObject.AddPair('NumFiscal', ZRepNumFiscal_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('RegistrarNumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
    JsonObject.AddPair('NumFiscal', ZRepNumFiscal);
  end;
   JsonObject.AddPair('Type', 'Visualization');

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetZRepQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;



  JsonToSend := TStringStream.Create(Utf8Encode(Json));



   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;


  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetZRep.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;


  DataZRep64:='';
  DataZRep:='';
  ResultCode:= '';
  ResultText:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ResultCode:= JsonObject.Get('ResultCode').JsonValue.Value;
    ResultText:= JsonObject.Get('ResultText').JsonValue.Value;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    ErrorMessage:= JsonObject.Get('ErrorMessage').JsonValue.Value;
    DataZRep64:= JsonObject.Get('Data').JsonValue.Value;
    DataZRep:=DecodeString(DataZRep64);
    if WRITE_DEBUG_INFO_RRO=1 then
    begin
     Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetZRepData.dat', false,  TEncoding.ANSI);
     Writer.Write(DataZRep);
     Writer.Free();
    end;

     if (ErrorCode='Ok') and (F_main.SHOW_FISCAL_REP=1) then
       Print_ZRep_RRO(DataZRep); // печать Z- отчета

    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');
  if not result then   MessageDlg('Ошибка при выполнении команды GetZRep / '+ErrorMessage, mtError, [mbOk], 0);


end;  // function GetZRep



// запрос чека с фискального с сервера
function TF_main.GetCheck(is_ALCOGOL:boolean; is_print:boolean; vNumFiscal:string; var DataCheck :widestring):boolean;
 var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSonValue: TJSonValue;

  Writer: TStreamWriter;


  is_repeat_Transfer, is_Transfered:boolean;
  ResultCode, ResultText, DataCheck64,
  ErrorCode, ErrorMessage :string;
 // DataCheck :widestring;
begin

  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'GetCheck');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('RegistrarNumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL));

  end
  else
  begin
    JsonObject.AddPair('RegistrarNumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));
  end;

  JsonObject.AddPair('NumFiscal', vNumFiscal);
  // JsonObject.AddPair('Type', 'Visualization');
  JsonObject.AddPair('Type', 'OriginalXml');
  JsonObject.AddPair('GetQrCode', TJSONBool.Create(True));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;


  if (WRITE_DEBUG_INFO_RRO=1) and is_print then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetCheckQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;



  JsonToSend := TStringStream.Create(Utf8Encode(Json));



   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;


  if (WRITE_DEBUG_INFO_RRO=1)  and is_print then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetCheck.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;


  DataCheck64:='';
  DataCheck:='';
  ResultCode:= '';
  ResultText:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ResultCode:= JsonObject.Get('ResultCode').JsonValue.Value;
    ResultText:= JsonObject.Get('ResultText').JsonValue.Value;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    ErrorMessage:= JsonObject.Get('ErrorMessage').JsonValue.Value;
    DataCheck64:= JsonObject.Get('Data').JsonValue.Value;
    DataCheck:=DecodeString(DataCheck64);
    if (WRITE_DEBUG_INFO_RRO=1)  and is_print then
    begin
     Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\GetCheckData.dat', false,  TEncoding.ANSI);
     Writer.Write(DataCheck);
     Writer.Free();
    end;

     if (ErrorCode='Ok')  and is_print then
       Print_Check_RRO(DataCheck); // печать чека

    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');
  if not result then   MessageDlg('Ошибка при выполнении команды GetCheck / '+ErrorMessage, mtError, [mbOk], 0);


end;  // function GetCheck




function TF_main.Transfer_Data_To_Fiskal_Server(JsonToSend: TStringStream; var sResponse:string; var is_repeat:boolean):boolean;
var Id_HandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin

  IdHTTP1.ConnectTimeout:= 60000;
  IdHTTP1.ReadTimeout:= 60000;
  IdHTTP1.Disconnect;

  IdHTTP1.Request.ContentType := 'application/json';
  IdHTTP1.Request.CharSet := 'utf-8';

  {это необходимо использовать для SSL}
  Id_HandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP1);
  Id_HandlerSocket.SSLOptions.Mode := sslmClient;
  Id_HandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdHTTP1.IOHandler := Id_HandlerSocket;

  is_repeat:=False;
  result:=True;
  try
    sResponse := IdHTTP1.Post(URL_RRO_Server, JsonToSend);
    IdHTTP1.Disconnect;
  except
    on E: Exception do
    begin
     // ShowMessage('Ошибка: '#13#10 + e.Message);
     // is_repeat:=(MessageDlg('Ошибка отправки данных в налоговую ('+e.Message+'. Повторить?', mtWarning,
     // [mbNo, mbYes], 0)= mrYes);
      is_repeat:=False;
      MessageDlg('Ошибка отправки данных в налоговую'+e.Message+
        '. Нужно отправить позже!', mtError, [mbOk], 0);

      IdHTTP1.Disconnect;
      result:=False;
    end;
  end;
end;



// внесение денег в кассу
function TF_main.RegisterKassa_In_Out_RRO(is_ALCOGOL, IS_IN:boolean; vID_NAKLCAP:longint; SumInOut:extended;
var NumFiscal,  NumLocal, OrderDateTime :string ):boolean;
 var
  Json: string;
  sResponse: string;
  JsonValue:TJsonValue;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONNestedObject: TJSONObject;
  JSONArray: TJSONArray;

  JsonObjectCHECKHEAD: TJSONObject;
  JsonObjectCHECKTOTAL: TJSONObject;

  JSONArrayCHECKPAY: TJSONArray;
  JSONArrayPAYSYS: TJSONArray;
  JSONArrayCHECKTAX: TJSONArray;
  JSONArrayCHECKBODY: TJSONArray;
  JSONArrayEXCISELABELS: TJSONArray;
  JSONArrayCheck: TJSONObject;
  Writer: TStreamWriter;

  code_oper:integer;
  is_repeat_Transfer, is_Transfered:boolean;
  ErrorCode:string;
begin

  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'RegisterCheck');
  if is_ALCOGOL then  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA_ALCOGOL))
  else JsonObject.AddPair('NumFiscal', TJSONNumber.Create(ID_NUM_FISCAL_KASSA));

  /////////////////////
  JsonObjectCHECKHEAD:= TJSONObject.Create;

  JsonObjectCHECKHEAD.AddPair('DOCTYPE', TJSONNumber.Create(0));  // Тип документа (числовий): 0-Чек реалізації товарів/послуг, 1-Чек переказу коштів, 2–Чек операції обміну валюти, 3-Чек видачі готівки, 4-Чек обслуговування у ломбарді, 100-Відкриття зміни, 101-Закриття зміни, 102-Початок офлайн сесії, 103-Завершення офлайн сесії-->
  if IS_IN then code_oper:=2 else code_oper:=4;
  JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(code_oper)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
  if IS_IN then
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Служебное внесение#'+IntToStr(vID_NAKLCAP))
  else JsonObjectCHECKHEAD.AddPair('COMMENT', 'Служебное изъятие#'+IntToStr(vID_NAKLCAP));


 //////////////////////////////////////


  JsonObjectCHECKTOTAL:= TJSONObject.Create;
  JsonObjectCHECKTOTAL.AddPair('SUM', TJSONNumber.Create(SumInOut)); // общая сумма чека  с учетом скидки и округлений
 // JsonObjectCHECKTOTAL.AddPair('RNDSUM', TJSONNumber.Create(0));  // сумма округления
 // JsonObjectCHECKTOTAL.AddPair('NORNDSUM', TJSONNumber.Create(100));  // сумма с учетом скидки без округления
//  JsonObjectCHECKTOTAL.AddPair('NOTAXSUM', TJSONNumber.Create(100)); // Сума чеку без урахування податків/зборів и скидок(15.2 цифри)

 ////////////////////////////////////////

  JSONArrayCheck:=TJSONObject.Create;
  JSONArrayCheck.AddPair(TJSONPair.Create('CHECKHEAD', JsonObjectCHECKHEAD));
  JSONArrayCheck.AddPair(TJSONPair.Create('CHECKTOTAL', JsonObjectCHECKTOTAL));

  JsonObject.AddPair(TJSONPair.Create('Check', JSONArrayCheck));


  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheckQueryIn.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;



  JsonToSend := TStringStream.Create(Utf8Encode(Json));



   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;


  if WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheckIn.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  ErrorCode:='';
  NumFiscal:='';
  NumLocal:= '';
  OrderDateTime:='';
  if sResponse<>'' then
  begin
    JsonValue := TJSonObject.ParseJSONValue(sResponse);
    ErrorCode:=JsonValue.GetValue<String>('ErrorCode');

    NumFiscal:= JsonValue.GetValue<String>('NumFiscal');
    NumLocal:= JsonValue.GetValue<String>('NumLocal');
    OrderDateTime:= JsonValue.GetValue<String>('OrderDateTime');
    if is_ALCOGOL then IS_KASSA_OFFLINE_ALCOGOL:=JsonValue.GetValue<Boolean>('Offline')
    else IS_KASSA_OFFLINE:=JsonValue.GetValue<Boolean>('Offline');

    if is_ALCOGOL then
    begin
      if IS_KASSA_OFFLINE then
          L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
      else  L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';
    end
    else
    begin
      if IS_KASSA_OFFLINE then
          L_shift_Opened.Caption:='Смена открыта offline'
      else  L_shift_Opened.Caption:='Смена открыта online';
    end;

    JsonValue.Free;
  end;

  result:= (ErrorCode='Ok');

end;  // function RegisterKassa_In_Out_RRO


procedure TF_main.ActionStartSmenyExecute(Sender: TObject);
begin
  // начало кассовой смены
//  if not SetupRRO(false) then Exit; // настройка системы РРО
//  if not SetupRegistrar(false) then Exit; // настройка ПРРО кассы
  if not TransactionsRegistrarState(false) then Exit;   //  Запрос состояния ПРРО

  if IS_shift_Opened=0 then
  begin
    if not OpenShift(false) then Exit;  // открытие смены
    if not TransactionsRegistrarState(false) then Exit;    // проверка состояния после открытия
     if IS_shift_Opened=1 then
     begin
        // инфо об открытых сменах
      DataTimeShift_Opened:=Now();
      Table_D_START_SMEN.Open;
      Table_D_START_SMEN.First;
      Table_D_START_SMEN.Edit;
      Table_D_START_SMEN.FieldByName('D_START_SMENY').AsDateTime:=DataTimeShift_Opened;
      Table_D_START_SMEN.FieldByName('IS_STARTED_SMENA').AsInteger:=1;
      Table_D_START_SMEN.Post;
      Table_D_START_SMEN.Close;
      L_DurationSmena.Caption:=Format('Открыта %s',[DateTimeToStr(DataTimeShift_Opened)]);

        if IS_KASSA_OFFLINE then
        L_shift_Opened.Caption:='Смена открыта offline'
        else  L_shift_Opened.Caption:='Смена открыта online';

        L_shift_user.Caption:=shift_user;
        BB_Shift_Begin.Font.Color:=ClGreen;
        BB_Shift_Begin.Enabled:=False;
     end
     else
     begin
        BB_Shift_Begin.Font.Color:=ClRed;
        L_shift_Opened.Caption:='Смена закрыта';
        L_shift_user.Caption:='';
        BB_Shift_Begin.Enabled:=True;
        MessageDlg('Ошибка при открытии смены', mtError, [mbOk], 0);
     end;
  end
  else
  begin
    if IS_KASSA_OFFLINE then
        L_shift_Opened.Caption:='Смена открыта offline'
    else  L_shift_Opened.Caption:='Смена открыта online';
    L_shift_user.Caption:=shift_user;
    BB_Shift_Begin.Font.Color:=ClGreen;
    BB_Shift_Begin.Enabled:=False;

  end;

  BBKassaIn.Enabled:= not BB_Shift_Begin.Enabled;
 // BB_LastShiftTotals.Enabled:= not BB_Shift_Begin.Enabled;
  BBKassaOut.Enabled:= not BB_Shift_Begin.Enabled;
  BB_Close_smena.Enabled:= not BB_Shift_Begin.Enabled;

 if IS_EXIST_ALCO_KASSA=0 then
 begin
   BB_Sale.Enabled:=(IS_shift_Opened=1);
   BB_Return_Tov.Enabled:=BB_Sale.Enabled;
 end
 else
  begin
   BB_Sale.Enabled:=((IS_shift_Opened=1) and (IS_shift_Opened_ALCOGOL=1) );
   BB_Return_Tov.Enabled:=BB_Sale.Enabled;
 end;
end;

procedure TF_main.ActionStartSmeny_AlcogolExecute(Sender: TObject);
begin
  // начало кассовой смены
 // if not SetupRRO(True) then Exit; // настройка системы РРО
 // if not SetupRegistrar(True) then Exit; // настройка ПРРО кассы
  if not TransactionsRegistrarState(True) then Exit;   //  Запрос состояния ПРРО

  if IS_shift_Opened_ALCOGOL=0 then
  begin
    if not OpenShift(True) then Exit;  // открытие смены
    if not TransactionsRegistrarState(True) then Exit;    // проверка состояния после открытия
     if IS_shift_Opened_ALCOGOL=1 then
     begin

        if IS_KASSA_OFFLINE_ALCOGOL then
        L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
        else  L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';

        L_shift_user_ALCOGOL.Caption:=shift_user_ALCOGOL;
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClGreen;
        BB_Shift_Begin_ALCOGOL.Enabled:=False;

     end
     else
     begin
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClRed;
        L_shift_Opened_ALCOGOL.Caption:='Смена закрыта';
        L_shift_user_ALCOGOL.Caption:='';
        BB_Shift_Begin_ALCOGOL.Enabled:=True;
        MessageDlg('Ошибка при открытии смены алко', mtError, [mbOk], 0);
     end;
  end
  else
  begin
    if IS_KASSA_OFFLINE_ALCOGOL then
          L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
    else  L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';

    L_shift_user_ALCOGOL.Caption:=shift_user_ALCOGOL;
    BB_Shift_Begin_ALCOGOL.Font.Color:=ClGreen;
    BB_Shift_Begin_ALCOGOL.Enabled:=False;
  end;

  if IS_EXIST_ALCO_KASSA=0 then
   begin
     BB_Sale.Enabled:=(IS_shift_Opened=1);
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end
   else
    begin
     BB_Sale.Enabled:=((IS_shift_Opened=1) and (IS_shift_Opened_ALCOGOL=1) );
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end;

end;

procedure TF_main.ActionStopSmenyExecute(Sender: TObject);
var n_not_reg_rro:integer;
begin

  n_not_reg_rro:=CONTROL_REG_RRO;
  if n_not_reg_rro>0 then
  begin
    MessageDlg(Format('Есть %d незарегистрированных РРО документов!', [n_not_reg_rro]), mtError, [mbOk], 0);
    Exit;
  end;

  with Q_NotFinalDoc do
  begin
    Close;
    Open;
    if RecordCount>0 then
    begin
      if MessageDlg(Format('Есть %d незавершенных документов! Показать?', [RecordCount]),
        mtWarning, [mbNo, mbYes], 0)= mrYes then
      begin
        F_Not_Final_Doc_Show_Dlg();
        Exit;
      end
      else  Exit;



    end;
  end;

 //if not SetupRRO(False) then Exit; // настройка системы РРО
 //if not SetupRegistrar(False) then Exit; // настройка ПРРО кассы
 if not TransactionsRegistrarState(False) then Exit;   //  Запрос состояния ПРРО


 // закончить кассовую смену
  if IS_shift_Opened=1 then
  begin

    LastShiftTotals(False,False); //Расчитать кассовые итоги смены
    with DM1.QKassaReport_RRO do    // здесь опред остаток нефиск кассы за весь текущий день
    begin
      Close;
      Parameters.ParamByName('ID_USER').Value:=id_user_select;
      Parameters.ParamByName('IS_REGISTER_RRO').Value:=0;
      Parameters.ParamByName('D_From').Value:=StartOfTheDay(F_main.D_Work.DateTime);
      Parameters.ParamByName('D_To').Value:=EndOfTheDay(F_main.D_Work.DateTime);
      Open;
      ostat_kassy:=FieldByName('SUM_KAS').AsFloat;
      Close;
    end;


    if ostat_kassy_RRO+ostat_kassy>Eps then
    begin
      if MessageDlg(Format('Есть неизъятые деньги в кассе - %8.2f и %8.2f грн. Закончить смену без изъятия?',
        [ostat_kassy_RRO, ostat_kassy]), mtWarning, [mbNo, mbYes], 0)<> mrYes then  Exit;
    end;


    if not CloseShift(false) then Exit;
    if not TransactionsRegistrarState(false) then Exit;    // проверка состояния после закрытия
     if IS_shift_Opened=1 then
     begin
        if IS_KASSA_OFFLINE then
        L_shift_Opened.Caption:='Смена открыта offline'
        else  L_shift_Opened.Caption:='Смена открыта online';

        L_shift_user.Caption:=shift_user;
        BB_Shift_Begin.Font.Color:=ClGreen;
        BB_Shift_Begin.Enabled:=False;
        MessageDlg('Ошибка при закрытии смены', mtError, [mbOk], 0);
     end
     else
     begin
        BB_Shift_Begin.Font.Color:=ClRed;
        if IS_KASSA_OFFLINE then
        L_shift_Opened.Caption:='Смена закрыта offline'
        else  L_shift_Opened.Caption:='Смена закрыта online';
        BB_Shift_Begin.Enabled:=True;
        L_shift_user.Caption:='';
               // инфо об открытых сменах
        DataTimeShift_Opened:=Now();
        Table_D_START_SMEN.Open;
        Table_D_START_SMEN.First;
        Table_D_START_SMEN.Edit;
        Table_D_START_SMEN.FieldByName('D_START_SMENY').AsDateTime:=DataTimeShift_Opened;
        Table_D_START_SMEN.FieldByName('IS_STARTED_SMENA').AsInteger:=0;
        Table_D_START_SMEN.Post;
        Table_D_START_SMEN.Close;
        L_DurationSmena.Caption:=Format('Закрыта %s',[DateTimeToStr(DataTimeShift_Opened)]);
     end;
  end
  else
  begin
    if IS_KASSA_OFFLINE then
      L_shift_Opened.Caption:='Смена закрыта offline'
    else  L_shift_Opened.Caption:='Смена закрыта online';
    L_shift_user.Caption:='';
    BB_Shift_Begin.Font.Color:=ClRed;
    BB_Shift_Begin.Enabled:=True;
  end;

  BBKassaIn.Enabled:= not BB_Shift_Begin.Enabled;
 // BB_LastShiftTotals.Enabled:= not BB_Shift_Begin.Enabled;
  BBKassaOut.Enabled:= not BB_Shift_Begin.Enabled;
  BB_Close_smena.Enabled:= not BB_Shift_Begin.Enabled;

  if IS_EXIST_ALCO_KASSA=0 then
   begin
     BB_Sale.Enabled:=(IS_shift_Opened=1);
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end
   else
    begin
     BB_Sale.Enabled:=((IS_shift_Opened=1) and (IS_shift_Opened_ALCOGOL=1) );
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end;

end;

procedure TF_main.ActionStopSmeny_AlcogolExecute(Sender: TObject);
begin

 // if not SetupRRO(True) then Exit; // настройка системы РРО
//  if not SetupRegistrar(True) then Exit; // настройка ПРРО кассы
  if not TransactionsRegistrarState(True) then Exit;   //  Запрос состояния ПРРО


 // закончить кассовую смену
  if IS_shift_Opened_ALCOGOL=1 then
  begin

    LastShiftTotals(True,False); //Расчитать алко кассовые итоги смены
    if ostat_kassy_alcogol>Eps then
    begin
      MessageDlg(Format('Есть неизъятые деньги в  А кассе  - %8.2f грн', [ostat_kassy_alcogol]), mtError, [mbOk], 0);
      Exit;
    end;

    if not CloseShift(True) then Exit;
    if not TransactionsRegistrarState(True) then Exit;    // проверка состояния после открытия
     if IS_shift_Opened_ALCOGOL=1 then
     begin

        if IS_KASSA_OFFLINE_ALCOGOL then
          L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
        else  L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';
        L_shift_user_ALCOGOL.Caption:=shift_user_ALCOGOL;
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClGreen;
        BB_Shift_Begin_ALCOGOL.Enabled:=False;
        MessageDlg('Ошибка при закрытии смены', mtError, [mbOk], 0);
     end
     else
     begin
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClRed;
        if IS_KASSA_OFFLINE_ALCOGOL then
          L_shift_Opened_ALCOGOL.Caption:='Смена закрыта offline'
        else  L_shift_Opened_ALCOGOL.Caption:='Смена закрыта online';
        BB_Shift_Begin_ALCOGOL.Enabled:=True;
        L_shift_user_ALCOGOL.Caption:='';

     end;
  end
  else
  begin
    if IS_KASSA_OFFLINE_ALCOGOL then
          L_shift_Opened_ALCOGOL.Caption:='Смена закрыта offline'
    else  L_shift_Opened_ALCOGOL.Caption:='Смена закрыта online';
    L_shift_user_ALCOGOL.Caption:='';
    BB_Shift_Begin_ALCOGOL.Font.Color:=ClRed;
    BB_Shift_Begin_ALCOGOL.Enabled:=True;
  end;

  if IS_EXIST_ALCO_KASSA=0 then
   begin
     BB_Sale.Enabled:=(IS_shift_Opened=1);
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end
   else
    begin
     BB_Sale.Enabled:=((IS_shift_Opened=1) and (IS_shift_Opened_ALCOGOL=1) );
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
   end;

end;

procedure TF_main.ActionTovReportOborotExecute(Sender: TObject);
begin
  F_TovReportDlg(2);
end;

procedure TF_main.ActionTovReportProdagaExecute(Sender: TObject);
begin
  F_TovReportDlg(1);
end;

procedure TF_main.ActionTransactionsRegistrarStateExecute(Sender: TObject);
begin
 // if not SetupRRO(False) then Exit; // настройка системы РРО
// if not SetupRegistrar(False) then Exit; // настройка ПРРО кассы
  if not TransactionsRegistrarState(False) then Exit;   //  Запрос состояния ПРРО

end;

procedure TF_main.ActionTransactionsRegistrarState_AlcogolExecute(
  Sender: TObject);
begin
 // if not SetupRRO(True) then Exit; // настройка системы РРО
 // if not SetupRegistrar(True) then Exit; // настройка ПРРО кассы
  if not TransactionsRegistrarState(True) then Exit;   //  Запрос состояния ПРРО
end;

procedure TF_main.ActionUsersConnectControlExecute(Sender: TObject);
begin
 F_users_workDlg;
end;

procedure TF_main.ActionUsersExecute(Sender: TObject);
begin
  F_usersDlg;
end;

procedure TF_main.ActionVerevkiExecute(Sender: TObject);
begin
  FSaleDocList_dlg(223,-1); // списание веревок
end;

procedure TF_main.ActionVozvratKolbasaExecute(Sender: TObject);
begin
  FSaleDocList_dlg(211,-1); // возвраты колбасы
end;

procedure TF_main.ActionVozvratMyasoExecute(Sender: TObject);
begin
  FSaleDocList_dlg(217,-1); // возвраты мяса
end;

procedure TF_main.ActionVozvratTaraExecute(Sender: TObject);
begin
  FSaleDocList_dlg(232,-1); // возвраты  тары платной отгружаемых с НМК
end;

procedure TF_main.ActionVozvratTNPExecute(Sender: TObject);
begin
  FSaleDocList_dlg(220,-1); // возвраты ТНП поставщику
end;

procedure TF_main.ActionVozvratTovExecute(Sender: TObject);
begin
  FSaleDocList_dlg(234,-1); // возвраты  товаров отгружаемых с НМК
end;

procedure TF_main.ActionVozvrDolgExecute(Sender: TObject);
begin
 FSaleDocList_dlg (70,-1);//возврат долгов от зарегистрированного покупателя
end;

procedure TF_main.ActionVozvrExecute(Sender: TObject);
begin
  FSaleDocList_dlg(204,-1); // возвраты от покупателя
end;

procedure TF_main.ActionZatratyExecute(Sender: TObject);
begin
  FSaleDocList_dlg (222,-1); // затраты оплаченные с кассы
end;

procedure TF_main.Action_NULL_CHECKExecute(Sender: TObject);
begin
  NULL_CHECK;  // аннулирование чека
end;

procedure TF_main.CB_IS_EXISTSClick(Sender: TObject);
begin
  if CB_IS_EXISTS.Checked then
  CB_IS_EXISTS.Caption:='Все'
  else CB_IS_EXISTS.Caption:='В наличии';
  QNEW_PRICE_POS.Close;
 QNEW_PRICE_POS.Parameters.ParamByName('ID_USER').Value:= id_user_select;
  if CB_IS_EXISTS.Checked then
     QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=1
  else  QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=0;
 QNEW_PRICE_POS.Open;
end;


(*
procedure TF_main.CennikPrint(productName, groupName: string; price: extended; id: integer;
shtrihcode  :string);
var  prc, str1, str2, str3, str4, pId, shtrihcode_PRN :string;
ix, iy:integer;
var Mul :integer;
Dr	: TCBDirection;
Old_Brush_Color :integer;
  begin

     prc := Format('%.2f',[price]);
     str1 := Copy(productName, 0, 20);
     if Trim(str1)='' then str1 := '.';
     str2 := Copy(productName, 21, 20);
     if Trim(str2)='' then str2 := '.';
     str3 := Copy(productName, 41, 38);
     if Trim(str3)='' then str3 := '.';
     str4 := Copy(productName, 87, 38);
     if Trim(str4)='' then str4 := '.';
     pId := 'Код '+IntToStr(id);

        Printer.BeginDoc;
        GetPrinterInfo;
     {
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(0, 0,'-----------------------------------------------');
       }

       ix:= PrinterCoordX(0);
       iy:= PrinterCoordY(0);
        Printer.Canvas.Font.Size := 12;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix, iy, str1);

       iy:= iy+ PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str2);

        Printer.Canvas.Font.Size := 6;
      iy:= iy+ PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str3);

        Printer.Canvas.Font.Size := 6;
      iy:= iy+PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str4);

         ix:= PrinterCoordX(5);
         iy:= iy+ PrinterCoordY(3);
        //price
        Printer.Canvas.Font.Size := 34;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(ix, iy, prc);

        ix:= PrinterCoordX(0);
        iy:= iy+ PrinterCoordY(15);

        //Pricetag front-side productId
        Printer.Canvas.Font.Size := 8;   //-
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix, iy, pId + ' ' + groupName );



        shtrihcode := Trim(shtrihcode);
        {
        if (shtrihcode<>'') and (Length(shtrihcode)=13) then
        begin

        //  GetPrinterInfo;
          Dr:=cbdDroite; // норма слева направо // направление штрих кода cbdHaut, cbdGauche, cbdBas
          Mul:=3;     // масштабирование
          shtrihcode_PRN:= shtrihcode;
          delete(shtrihcode_PRN, length(shtrihcode_PRN), 1);    // без контрольной суммы
          ix:= PrinterCoordX(2);
          iy:= iy+ PrinterCoordY(4);
          Old_Brush_Color:=Printer.Canvas.Brush.Color;
          Printer.Canvas.Brush.Color:=clBlack;
          DessinCodeEAN13(shtrihcode_PRN, Printer.Canvas, Dr,
            ix, iy ,10, Mul, True);
          Printer.Canvas.Brush.Color:= Old_Brush_Color;

         end;
       }
         ix:= PrinterCoordX(0);
         iy:= iy+ PrinterCoordY(7);

        Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix,iy,'-----------------------------------------------');
     //   Printer.EndDoc;

// обратная сторона

          Printer.NewPage;

     
         ix:= 0;
         iy:= 100;

        Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.Font.Color:=clBlack;
     //   Printer.Canvas.TextOut(ix,iy,'.');

         ix:= 0;
         iy:= iy+100;
      //   Printer.Canvas.TextOut(ix,iy,'.');

         ix:= 0;
         iy:= 100;
       //  Printer.Canvas.TextOut(ix,iy,'.');


        pId := IntToStr(id);
        Printer.Canvas.Font.Size := 30;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.Font.Color:=clBlack;

        ix:= 300;
        iy:= 100;   //500

        AngleTextOut(Printer.Canvas, 180, ix, iy, IntToStr(id));


        if (shtrihcode<>'') and (Length(shtrihcode)=13) then
        begin
          Dr:=cbdGauche; // верхногами // направление штрих кода cbdHaut, cbdGauche, cbdBas
          Mul:=3;     // масштабирование
          shtrihcode_PRN:= shtrihcode;
          delete(shtrihcode_PRN, length(shtrihcode_PRN), 1);    // без контрольной суммы
          ix:= 350;
          iy:= iy+ 100;  //  400
          Old_Brush_Color:=Printer.Canvas.Brush.Color;
          Printer.Canvas.Brush.Color:=clBlack;
          DessinCodeEAN13(shtrihcode_PRN, Printer.Canvas, Dr,
            ix, iy ,20, Mul, True);
          Printer.Canvas.Brush.Color:= Old_Brush_Color;

         end;

           ix:= 2;
        iy:= iy+ 100;  // 1000
       Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix,iy,'-----------------------------------------------');
 
        Printer.EndDoc;


  end;

  *)

procedure TF_Main.PrintResponse(handle: POS_HANDLE);
var
par: array[0..20] of char;
val: array[0..10240] of char;
res: ByteBool;
s1,s2:string;
i:integer;

begin
  if (pos_get_first(handle, @par[0], sizeof(par), @val[0], sizeof(val)) = true) then
  begin
    repeat
      s1:='';
      s2:='';
      s1:=StrOemToAnsi(string(par));
      s2:=StrOemToAnsi(String(val));
      Memo1.Lines.Add(Format('%s = %s', [s1, s2]));
      res := pos_get_next(handle, @par[0], sizeof(par), @val[0], sizeof(val));
    until (res = false);
  end;

  Memo1.Lines.Add('');
end;


function TF_Main.Bank_Terminal_CloseDay(PORT:string):boolean;
var
handle: POS_HANDLE;
loop: ByteBool;
resp: integer;
timeout: integer;
val: array[0..10240] of char;

s_opl, s1,s2:string;
r:boolean;

begin
//  PanelBankTerm.Height:=150;
  result:=False;
  Memo1.Clear;
  handle := POS_NONE;
  If not pos_open(handle, PAnsiChar(AnsiString(PORT))) then
  begin
    MessageDlg(Format('Не могу открыть порт терминала %s !',[PORT]), mtError, [mbOk], 0);
    Exit;
  end;


  // хост ФОП Лавреновой Т О из настроек терминала
 //  pos_set(handle, POS_PROFILE, PAnsiChar('P0001027.P0001027.V211101220111.15.5.50.5.8,12.9'));
  // хост ФОП Ермакова  из настроек терминала
  //   pos_set(handle, POS_PROFILE, PAnsiChar('P0011110.P0011110.V211101220111.15.5.50.5.8,12.9'));
  if not pos_send(handle, ACTION_CLOSE_DAY) then
  begin
    MessageDlg('Не могу передать терминалу команду закрытия дня!', mtError, [mbOk], 0);
    Exit;
  end;


  loop := true;
  timeout := 60000; { 1 min }
  while (loop) do begin
    resp := pos_receive(handle, timeout);

    case (resp) of
      RESP_TIMEOUT:
        begin
          Memo1.Lines.Add('Время ожидания истекло!');
          loop := false;
        end; //  RESP_TIMEOUT:
      RESP_BREAK:
        begin
          Memo1.Lines.Add('Сброс');
          loop := false;
        end;   // RESP_BREAK:
      RESP_CONFIRM:
        begin
          Memo1.Lines.Add('Операция успешна!');

          result:=True;
          loop := false;
        end;  //  RESP_CONFIRM:

      RESP_DECLINE:
        begin
          Memo1.Lines.Add('Операция отклонена');
          PrintResponse(handle);
          loop := false;
        end;  //  RESP_DECLINE:
      RESP_MESSAGE:
        begin
          Memo1.Lines.Add('Сообщение');
          PrintResponse(handle);
        end;  // RESP_MESSAGE:
      RESP_IDENTIFIER:
        begin
          Memo1.Lines.Add('Идентификация');
          PrintResponse(handle);
        end;  // RESP_IDENTIFIER:
      else
      begin
        Memo1.Lines.Add(Format('Ответ терминала UNKNOWN= %s', [IntToStr(resp)]));
        loop := pos_send(handle, ACTION_BREAK);
      end;

    end;  //  case (resp) of
  end; // while (loop) do begin

  pos_Close(handle);


end;

procedure TF_main.BBCloseDay_NotFiscalClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;

  if F_Main.BANK_TERMINAL=0 then
  begin
    if Bank_Terminal_CloseDay(F_Main.COM_PORT_BANK_TERM_NOT_FISCAL) then
    begin
     Screen.Cursor := Save_Cursor;
     MessageDlg('Операция закрытия дня выполнена успешно!', mtInformation,[mbOk], 0);
    end
    else
    begin
      Screen.Cursor := Save_Cursor;
      MessageDlg('Операция закрытия дня не выполнена!', mtError,[mbOk], 0);
    end;
  end
  else
  begin
     MessageDlg('Закрытие дня выполните на терминале!', mtError,[mbOk], 0);
  {  if Bank_Terminal_Ingenico_CloseDay() then
    begin
     Screen.Cursor := Save_Cursor;
     MessageDlg('Операция закрытия дня выполнена успешно!', mtInformation,[mbOk], 0);
    end
    else
    begin
      Screen.Cursor := Save_Cursor;
      MessageDlg('Операция закрытия дня не выполнена!', mtError,[mbOk], 0);
    end;   }
  end;



  
end;

procedure TF_main.BB_PrintCennikClick(Sender: TObject);
begin
if CTRLBoolean=1 then  // нажата Alt - печать всех новых ценников
begin

  with QNEW_PRICE_POS do
  begin
    DisableControls;
    First;
    while not eof  do
    begin
      CennikPrint(FieldByName('NAME').AsString+'('+FieldByName('EDIZM').AsString+')',
        FieldByName('GRUPTOV').AsString, FieldByName('PRICE2').AsFloat,
        FieldByName('ID_TOV').AsInteger,  FieldByName('CODE').AsString );
      Next;
    end;
    First;
    EnableControls;
  end;

end // if CTRLBoolean=1 then  // нажата Alt - печать всех новых ценников
else
  with QNEW_PRICE_POS do
  begin
      CennikPrint(FieldByName('NAME').AsString+'('+FieldByName('EDIZM').AsString+')',
        FieldByName('GRUPTOV').AsString, FieldByName('PRICE2').AsFloat,
        FieldByName('ID_TOV').AsInteger,  FieldByName('CODE').AsString );

  end;

end;

procedure TF_main.BB_PrintCennikMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

procedure TF_main.D_WorkChange(Sender: TObject);
begin
D_From.Date:=D_Work.Date;
D_To.Date:=D_Work.Date;
end;

procedure TF_main.D_WorkExit(Sender: TObject);
begin
  D_From.Date:=D_Work.Date;
  D_To.Date:=D_Work.Date;
end;

procedure TF_main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if CanClose then
 begin



  if IS_EXIST_ALCO_KASSA=0 then
  begin
    if (IS_shift_Opened=1) then
    begin
      if MessageDlg('Кассовая смена не закрыта. Хотите завершить выполнении программы без закрытия смены?', mtWarning,
        [mbNo, mbYes], 0)= mrNo then
      begin
        CanClose:=False;
        Exit;
      end;
    end;
  end
  else
  begin // есть основная и алкогольная кассы
    if (IS_shift_Opened_ALCOGOL=1) or  (IS_shift_Opened=1) then
    begin
      if MessageDlg('Кассовая смена не закрыта. Хотите завершить выполнении программы без закрытия смены?', mtWarning,
        [mbNo, mbYes], 0)= mrNo then
      begin
        CanClose:=False;
        Exit;
      end;
    end;
  end;


  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  IniFile.WriteInteger('login', 'ID_TRADE_POINT',ID_TRADE_POINT);
  IniFile.WriteString('login', 'NAME_TRADE_POINT',NAME_TRADE_POINT);
  FreeAndNil(IniFile);

  try

  QNEW_PRICE_POS.Close;
  QTradepointInfo.Close;

  with DM1.Tb_USER_CONNECT do
  begin
  Open;
   while not EOF do
     begin
      if fieldbyname('ID_USER').AsInteger=ID_user_select  then
      begin
        Delete;
        break;
      end;
      next;
     end;
     close;
  end;

  DM1.ADOConnection1.Connected:=False;

   Q_NotFinalDoc.Close;
   Q_Not_Sent_Docs.Close;


  except
    if MessageDlg('Ошибка при закрытии приложения. Повторить?', mtWarning,
      [mbNo, mbYes], 0)= mrYes then
    begin
      DM1.ADOConnection1.Connected:=False;
        DM1.ADOConnection1.ConnectionString:=Connect_info;
      DM1.ADOConnection1.Connected:=True;
      CanClose:=False;
    end;
  end;
 end;
end;

procedure TF_main.SetGlobalValues;
begin
with Q_ConstValues do
  begin
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='ID_TRADE_POINT';
    Open;
    if RecordCount>0 then
      ID_TRADE_POINT:=StrToInt(FieldByName('CONST_VALUE').AsString)
    else  ID_TRADE_POINT:=Unknown_code;
    Close;
   // Parameters.ParamByName('CONST_NAME').Value:='NAME_TRADE_POINT';
   // Open;
   // NAME_TRADE_POINT:=FieldByName('CONST_VALUE').AsString;
  //  Close;
    Parameters.ParamByName('CONST_NAME').Value:='COM_PORT';
    Open;
    COM_PORT:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='COM_PORT_FISCAL';
    Open;
    COM_PORT_FISCAL:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='PASSW_FISCAL';
    Open;
    PASSW_FISCAL:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='GRUP_FISCAL';
    Open;
    GRUP_FISCAL:=FieldByName('CONST_VALUE').AsString;
    Close;
    // порты банковских терминалов
    Parameters.ParamByName('CONST_NAME').Value:='COM_PORT_BANK_TERM_NOT_FISCAL';
    Open;
    COM_PORT_BANK_TERM_NOT_FISCAL:=FieldByName('CONST_VALUE').AsString;
    Close;

    Parameters.ParamByName('CONST_NAME').Value:='COM_PORT_BANK_TERM_FISCAL';
    Open;
    COM_PORT_BANK_TERM_FISCAL:=FieldByName('CONST_VALUE').AsString;
    Close;
    // возможность продажи в долг
    Parameters.ParamByName('CONST_NAME').Value:='IS_USE_DOLG_POKUPAT';
    Open;
    IS_USE_DOLG_POKUPAT:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

     // Вариант интерфейса приложения
    Parameters.ParamByName('CONST_NAME').Value:='ID_INTERFACE';
    Open;
    ID_INTERFACE:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;


    Parameters.ParamByName('CONST_NAME').Value:='CHECK_TITLE_FIRM_NAME';
    Open;
    CHECK_TITLE_FIRM_NAME:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='CHECK_HOT_LINE_FIRM_TEL';
    Open;
    CHECK_HOT_LINE_FIRM_TEL:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='CHECK_FOOTER_SLOGAN';
    Open;
    CHECK_FOOTER_SLOGAN:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='CHECK_FOOTER_TXT';
    Open;
    CHECK_FOOTER_TXT:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='EACH_NAL_REGISTER_RRO';
    Open;
    EACH_NAL_REGISTER_RRO:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='EACH_BEZNAL_REGISTER_RRO';
    Open;
    EACH_BEZNAL_REGISTER_RRO:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    Close;
    Parameters.ParamByName('CONST_NAME').Value:='WRITE_DEBUG_INFO_RRO';
    Open;
    WRITE_DEBUG_INFO_RRO:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    // использовать ПРРО
    Parameters.ParamByName('CONST_NAME').Value:='RRO_ENABLED';
    Open;
    RRO_ENABLED:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;
    // ручное или авто управление ПРРО
    Parameters.ParamByName('CONST_NAME').Value:='MANUAL_CONTROL_RRO';
    Open;
    MANUAL_CONTROL_RRO:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;
    // Таймаут банковского терминала
    Parameters.ParamByName('CONST_NAME').Value:='TIMEOUT_BANK_TERM';
    Open;
    TIMEOUT_BANK_TERM:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;
    // Показывать остатки товаров в продаже и инвентаризации 0-нет 1-да
    Parameters.ParamByName('CONST_NAME').Value:='SHOW_OSTATKI';
    Open;
    SHOW_OSTATKI:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

     // Показывать фискальные отчеты 0-нет 1-да
    Parameters.ParamByName('CONST_NAME').Value:='SHOW_FISCAL_REP';
    Open;
    SHOW_FISCAL_REP:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    //QR текст не зарегистрированного чека (url сайта с информацией о чеке)
    Parameters.ParamByName('CONST_NAME').Value:='QRTEXT_UNREGISTER_RRO';
    Open;
    QRTEXT_UNREGISTER_RRO:=FieldByName('CONST_VALUE').AsString;
    Close;

    //Максимальная сумма реализации для регистрации РРО
    Parameters.ParamByName('CONST_NAME').Value:='MAX_REAL_RRO';
    Open;
    MAX_REAL_RRO:=StrToFloat(FieldByName('CONST_VALUE').AsString);
    Close;

     //Контроль сдачи и остатков по кассе РРО
    Parameters.ParamByName('CONST_NAME').Value:='CONTROL_SDACHA_RRO';
    Open;
    CONTROL_SDACHA_RRO:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    Parameters.ParamByName('CONST_NAME').Value:='CONTROL_SDACHA';
    Open;
    CONTROL_SDACHA:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    Parameters.ParamByName('CONST_NAME').Value:='EDIT_DOC_ENABLE';
    Open;
    EDIT_DOC_ENABLE:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    // Блокировка ввода веса вручную 0-нет 1-да
    Parameters.ParamByName('CONST_NAME').Value:='BLOCKING_MANUAL_WEIGHT_ENTRY';
    Open;
    BLOCKING_MANUAL_WEIGHT_ENTRY:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    // Отложенная оплата не разрешена 0; разрешена 1
    Parameters.ParamByName('CONST_NAME').Value:='DEFERRED_PAYMENT';
    Open;
    DEFERRED_PAYMENT:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

    // Тип банк.терминала 0-Verifone; 1-Ingenico
    Parameters.ParamByName('CONST_NAME').Value:='BANK_TERMINAL';
    Open;
    BANK_TERMINAL:=StrToInt(FieldByName('CONST_VALUE').AsString);
    Close;

  end;

end;

procedure TF_main.FormCreate(Sender: TObject);
var i:integer; n_day_to_DATE_END_CERTIFICATE: integer;
begin
  Application.OnException := AppExcept;
  Height:=600;
  is_connect_server:=False;
  D_Work.DateTime:=Date;
  D_Work.Time:=T_Work.Time;
  D_From.Date:=D_Work.Date;
  D_To.Date:=D_Work.Date;
  user_remoute_DB:=Unknown_str;     // пользователь удаленной БД
  id_user_remoute_DB:=Unknown_code; // для импорта-экспорта данных
  CB_IS_EXISTS.Checked:=False;
  CB_IS_EXISTS.Caption:='В наличии';
  BB_Sale.Enabled:=False;
  BB_Return_Tov.Enabled:=False;



  GroupBox1.Enabled:= False;    // включается в меню утилиты
  GroupBox2.Enabled:= False;
   // задание глоб переменных из табл настроек
  SetGlobalValues;

  IS_RECEPT_TO_REGISTR_RRO:= True;//(MANUAL_CONTROL_RRO=0);

  Last_IS_RECEPT_TO_REGISTR_RRO:=IS_RECEPT_TO_REGISTR_RRO;
  Last_IS_BEZNAL_OPL:=False;
  BitBtn26.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
  BitBtn27.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
//   BBKassaIn.Visible:= IS_RECEPT_TO_REGISTR_RRO;
//  BBKassaOut.Visible:= IS_RECEPT_TO_REGISTR_RRO;
//  BBInkassacia.Visible:= not IS_RECEPT_TO_REGISTR_RRO;
//   BBZatraty.Visible:= not IS_RECEPT_TO_REGISTR_RRO;


  if IS_RECEPT_TO_REGISTR_RRO then
      ShapePRRO.Brush.Color:=clRed
  else ShapePRRO.Brush.Color:=clGreen;



  if ID_INTERFACE<>0 then  // 0 - по умолчанию
  begin
     // изменить интерфейс приложения
    with Q_Set_Interface do
    begin
     Close;
     Parameters.ParamByName('ID_INTERFACE').Value:=ID_INTERFACE;
     Open;
     First;
     while not EOF do
     begin

        for i:=0 to F_Main.ActionList1.ActionCount-1 do
        begin
          if F_Main.ActionList1.Actions[i].Name=FieldByName('NAME_ACTION').AsString then
          begin
            F_Main.ActionList1.Actions[i].Caption:=FieldByName('CAPTION').AsString;
            F_Main.ActionList1.Actions[i].Visible:=(FieldByName('VISIBLE').AsInteger=1);
            break;
          end;
        end; // for i:=0 to F_Main.ActionList1.ActionCount-1 do


       Next;
     end; //   while not EOF do

    end; //  with Q_Set_Interface do
   end;  // if ID_INTERFACE<>0 then



  with QTradepointInfo do
  begin
    Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
    Open;
    First;
    NAME_TRADE_POINT:=FieldByName('NAME_TRADE_POINT').AsString;
  end;

  if ID_TRADE_POINT=Unknown_code then
  MessageDlg(
       'Не инициализирована торговая точка! Укажите в настройках системы.',
       mtError, [mbOk], 0);
 if ParamStr(1)='1' then
 begin
 GB_Oper_Vendor.Visible:=False;
 GB_Oper_Kassa.Visible:=False;
 GB_Oper_Invent.Visible:=False;
 GB_Oper_Client.Visible:=True;
 GB_Oper_Data.Visible:=True;
 end;
 if ParamStr(1)='2' then
 begin
 GB_Oper_Vendor.Visible:=True;
 GB_Oper_Kassa.Visible:=True;
 GB_Oper_Invent.Visible:=True;
 GB_Oper_Client.Visible:=False;
 GB_Oper_Data.Visible:=True;
 end;
 QNEW_PRICE_POS.Close;
 QNEW_PRICE_POS.Parameters.ParamByName('ID_USER').Value:= id_user_select;
  if CB_IS_EXISTS.Checked then
     QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=1
  else  QNEW_PRICE_POS.Parameters.ParamByName('IS_EXISTS').Value:=0;
 QNEW_PRICE_POS.Open;

 TabSet1.TabIndex:=1; // кассовые операции
 Notebook1.PageIndex:= TabSet1.TabIndex;

 if RRO_ENABLED=1 then
 begin

    name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
    IniFile:=TIniFile.Create(name_ini_File);
    URL_RRO_Server:=IniFile.ReadString('workplace', 'URL_RRO_Server',URL_RRO_Server);

    // обычная касса
    ID_CLI_FISCAL:=IniFile.ReadInteger('workplace', 'ID_CLI_FISCAL',ID_CLI_FISCAL);
    ID_RRO_KASSA_FISCAL:= IniFile.ReadInteger('workplace', 'ID_RRO_KASSA_FISCAL',ID_RRO_KASSA_FISCAL);
    NAME_KASSA_FISCAL:= IniFile.ReadString('workplace', 'NAME_KASSA_FISCAL',NAME_KASSA_FISCAL);
    CLI_FISCAL:= IniFile.ReadString('workplace', 'CLI_FISCAL',CLI_FISCAL);
    IS_EXIST_ALCO_KASSA:= IniFile.ReadInteger('workplace', 'IS_EXIST_ALCO_KASSA',IS_EXIST_ALCO_KASSA);
    USE_CERTIFIKATE:= IniFile.ReadInteger('workplace', 'USE_CERTIFIKATE',USE_CERTIFIKATE);


    Caption:='Enterprise/'+work_DB+'/'+NAME_TRADE_POINT+'/ Пользователь '+user_select+
    '/'+CLI_FISCAL+'/'+NAME_KASSA_FISCAL;



    Q_RRO_CERTIFIC.Close;
    if USE_CERTIFIKATE=0 then
      Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=ID_CLI_FISCAL
    else  Q_RRO_CERTIFIC.Parameters.ParamByName('ID_').Value:=ID_RRO_KASSA_FISCAL;
    Q_RRO_CERTIFIC.OPEN;
    Certificate:=Q_RRO_CERTIFIC.FieldByName('CERTIFICATE').AsString; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
    PrivateKey:=Q_RRO_CERTIFIC.FieldByName('PRIVATE_KEY').AsString;  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
    PasswordKey:=Q_RRO_CERTIFIC.FieldByName('PASSW').AsString; // пароль к ключу
    DATE_END_CERTIFICATE:=Q_RRO_CERTIFIC.FieldByName('DATE_END_CERTIFICATE').AsDateTime;
    INN_CLI_FISCAL:=Q_RRO_CERTIFIC.FieldByName('INN').AsString;
    Q_RRO_CERTIFIC.Close;

    n_day_to_DATE_END_CERTIFICATE:=DaysBetween(DATE_END_CERTIFICATE, Date());
  //  if n_day_to_DATE_END_CERTIFICATE<30 then
  //    MessageDlg(Format('До конца действия сертификата %s осталось %d дней!',[DateToStr(DATE_END_CERTIFICATE), n_day_to_DATE_END_CERTIFICATE]), mtError, [mbOk], 0);


    Q_RRO_KASSA_TS.Close;
    Q_RRO_KASSA_TS.Parameters.ParamByName('ID_RRO_KASSA').Value:=ID_RRO_KASSA_FISCAL;
    Q_RRO_KASSA_TS.Open;
    ID_NUM_FISCAL_KASSA:=Q_RRO_KASSA_TS.FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt; // Фискальний номер РРО
    Q_RRO_KASSA_TS.Close;

    L_shift_Opened.Caption:='Смена закрыта';
    L_shift_user.Caption:='';
    IS_shift_Opened:=0;
    BB_Shift_Begin.Font.Color:=ClRed;

    L_shift_Opened_ALCOGOL.Caption:='Смена закрыта';
    L_shift_user_ALCOGOL.Caption:='';
    IS_shift_Opened_ALCOGOL:=0;
    BB_Shift_Begin_ALCOGOL.Font.Color:=ClRed;

    if IS_EXIST_ALCO_KASSA=1 then
    begin
    // Алкогольная касса
      ID_CLI_FISCAL_ALCOGOL:=IniFile.ReadInteger('workplace', 'ID_CLI_FISCAL_ALCOGOL',ID_CLI_FISCAL_ALCOGOL);
      ID_RRO_KASSA_FISCAL_ALCOGOL:= IniFile.ReadInteger('workplace', 'ID_RRO_KASSA_FISCAL_ALCOGOL',ID_RRO_KASSA_FISCAL_ALCOGOL);
      NAME_KASSA_FISCAL_ALCOGOL:= IniFile.ReadString('workplace', 'NAME_KASSA_FISCAL_ALCOGOL',NAME_KASSA_FISCAL_ALCOGOL);
      CLI_FISCAL_ALCOGOL:= IniFile.ReadString('workplace', 'CLI_FISCAL_ALCOGOL',CLI_FISCAL_ALCOGOL);


      Q_RRO_CERTIFIC.Close;
      Q_RRO_CERTIFIC.Parameters.ParamByName('ID_CLI').Value:=ID_CLI_FISCAL_ALCOGOL;
      Q_RRO_CERTIFIC.Open;
      Certificate_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('CERTIFICATE').AsString; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
      PrivateKey_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('PRIVATE_KEY').AsString;  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
      PasswordKey_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('PASSW').AsString; // пароль к ключу
      INN_CLI_FISCAL_ALCOGOL:=Q_RRO_CERTIFIC.FieldByName('INN').AsString;
      Q_RRO_CERTIFIC.Close;

      Q_RRO_KASSA_TS.Close;
      Q_RRO_KASSA_TS.Parameters.ParamByName('ID_RRO_KASSA').Value:=ID_RRO_KASSA_FISCAL_ALCOGOL;
      Q_RRO_KASSA_TS.Open;
      ID_NUM_FISCAL_KASSA_ALCOGOL:=Q_RRO_KASSA_TS.FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt; // Фискальний номер РРО
      Q_RRO_KASSA_TS.Close;
    end
    else
      begin
    // нет Алкогольной кассы
      ID_CLI_FISCAL_ALCOGOL:=-1;
      ID_RRO_KASSA_FISCAL_ALCOGOL:=-1;
      NAME_KASSA_FISCAL_ALCOGOL:='';
      CLI_FISCAL_ALCOGOL:='';

      Certificate_ALCOGOL:=''; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
      PrivateKey_ALCOGOL:='';  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
      PasswordKey_ALCOGOL:=''; // пароль к ключу
      ID_NUM_FISCAL_KASSA_ALCOGOL:=-1; // Фискальний номер РРО

    end;


    FreeAndNil(IniFile);

     Caption:='Enterprise/'+work_DB+'/. '+NAME_TRADE_POINT+'. Пользователь '+user_select;


  //   Caption:='Enterprise/'+work_DB+'/'+NAME_TRADE_POINT+'/ Польз. '+user_select+
  //  '/'+CLI_FISCAL+'/'+NAME_KASSA_FISCAL+
  //  '/Алкоголь-'+CLI_FISCAL_ALCOGOL+'/'+NAME_KASSA_FISCAL_ALCOGOL;

    L_CLI_FISCAL.Caption:=CLI_FISCAL;
    L_NAME_KASSA_FISCAL.Caption:=NAME_KASSA_FISCAL;
    L_CLI_FISCAL_ALCOGOL.Caption:=CLI_FISCAL_ALCOGOL;
    L_NAME_KASSA_FISCAL_ALCOGOL.Caption:=NAME_KASSA_FISCAL_ALCOGOL;
    GB_Alco_Kassa.Visible:=(IS_EXIST_ALCO_KASSA=1);
    Panel_RRO.Visible:=True;

   end   // if RRO_ENABLED=1 then
   else
   begin
      Caption:='Enterprise/'+work_DB+'/'+NAME_TRADE_POINT+'/ Польз. '+user_select;

      ID_CLI_FISCAL:=-1;
      ID_RRO_KASSA_FISCAL:=-1;
      NAME_KASSA_FISCAL:='';
      CLI_FISCAL:='';
      Certificate:=''; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
      PrivateKey:='';  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
      PasswordKey:=''; // пароль к ключу
      ID_NUM_FISCAL_KASSA:=-1; // Фискальний номер РРО

      ID_CLI_FISCAL_ALCOGOL:=-1;
      ID_RRO_KASSA_FISCAL_ALCOGOL:=-1;
      NAME_KASSA_FISCAL_ALCOGOL:='';
      CLI_FISCAL_ALCOGOL:='';
      Certificate_ALCOGOL:=''; // Сертификат Предприятия от имени которого передаются фискальные данные (ФОП)
      PrivateKey_ALCOGOL:='';  // Ключ Предприятия от имени которого передаются фискальные данные (ФОП)
      PasswordKey_ALCOGOL:=''; // пароль к ключу
      ID_NUM_FISCAL_KASSA_ALCOGOL:=-1; // Фискальний номер РРО

     // Panel_RRO.Visible:=False;

      IS_RECEPT_TO_REGISTR_RRO:=False;
      ShapePRRO.Brush.Color:=clGreen;
      PRRO_ON_OFF.Visible:=False;
      GB_Alco_Kassa.Visible:=False;
      BB_Shift_Begin.Visible:=False;
      BBKassaIn.Visible:=False;
      BBKassaOut.Visible:=False;
      BB_Close_smena.Visible:=False;
      BB_LastShiftTotals.Visible:=True;
      L_CLI_FISCAL.Caption:='';
      L_NAME_KASSA_FISCAL.Caption:='';
      L_shift_Opened.Caption:='';
      L_shift_user.Caption:='';
      L_DurationSmena.Caption:='';


      BB_Sale.Enabled:=True;
      BB_Return_Tov.Enabled:=BB_Sale.Enabled;



   end;   // else if RRO_ENABLED=1 then

  //разрешить-запретить изменение расчетной даты D_Work
 N16.Enabled:= (EDIT_DOC_ENABLE=1);

  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  IS_LOAD_SPRAV:= IniFile.ReadBool('workplace', 'IS_LOAD_SPRAV',True);
  if IS_LOAD_SPRAV then
   LOAD_SPRAV_ON_OFF.Caption:='Загрузка-выгрузка справочников - вкл'
  else LOAD_SPRAV_ON_OFF.Caption:='Загрузка-выгрузка справочников - выкл';
  BBLoadSpravochniki.Enabled:= IS_LOAD_SPRAV;
  BBUpLoadData.Enabled:= IS_LOAD_SPRAV;
  FreeAndNil(IniFile);


end;

procedure TF_main.ControlDurationSmena(var DurationSmena, DurationSmena_ALCOGOL:extended; var IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL:integer);
begin
// инфо об открытых сменах
   Table_D_START_SMEN.Open;
   if Table_D_START_SMEN.RecordCount=0 then
   begin
    Table_D_START_SMEN.Insert;
    Table_D_START_SMEN.FieldByName('D_START_SMENY').AsDateTime:=0;
    Table_D_START_SMEN.FieldByName('D_START_SMENY_ALCOGOL').AsDateTime:=0;
    Table_D_START_SMEN.Post;

   end
   else
   begin
    Table_D_START_SMEN.First;
   end;

   DataTimeShift_Opened:=Table_D_START_SMEN.FieldByName('D_START_SMENY').AsDateTime;
   DataTimeShift_Opened_ALCOGOL:=Table_D_START_SMEN.FieldByName('D_START_SMENY_ALCOGOL').AsDateTime;
   IS_STARTED_SMENA:=Table_D_START_SMEN.FieldByName('IS_STARTED_SMENA').AsInteger;
   IS_STARTED_SMENA_ALCOGOL:=Table_D_START_SMEN.FieldByName('IS_STARTED_SMENA_ALCOGOL').AsInteger;
   Table_D_START_SMEN.Close;

 DurationSmena:= Now()-DataTimeShift_Opened;
 DurationSmena := DurationSmena * 24;  // длительность смены в часах

 DurationSmena_ALCOGOL:= Now()-DataTimeShift_Opened_ALCOGOL;
 DurationSmena_ALCOGOL := DurationSmena_ALCOGOL * 24;  // длительность смены в часах

end;

procedure TF_main.GetMinMaxDate(var d_min,d_max:TDateTime);
begin
  d_max:=0.0;
  d_min:=StrToDateTime('31.12.3025');
  with Q_Not_Sent_Docs do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('D_DOC').AsDateTime>d_max then d_max:=FieldByName('D_DOC').AsDateTime;
      if FieldByName('D_DOC').AsDateTime<d_min then d_min:=FieldByName('D_DOC').AsDateTime;
      Next;
    end;
  end;
  d_max:=EndOfTheDay(d_max);
  d_min:=DateOf(d_min);
end;

procedure TF_main.FormShow(Sender: TObject);
var DurationSmena, DurationSmena_ALCOGOL:extended;
var IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL:integer;
d1,d2:TDateTime;
begin
  Caption:='Enterprise/'+work_DB+'/. '+NAME_TRADE_POINT+'. Пользователь '+user_select;
  if RRO_ENABLED=1 then
  begin


    // проверка на состояние ПРРО касс

    if IS_EXIST_ALCO_KASSA=1 then
    begin
      if not SetupRRO(True) then Exit; // настройка системы РРО
      if not ObjectsRRO() then Exit;  // Запрос доступных объектов ПРРО then

      if not SetupRegistrar(True) then Exit; // настройка ПРРО кассы
      if not TransactionsRegistrarState(True) then Exit;

      if IS_shift_Opened_ALCOGOL=1 then
      begin

        if IS_KASSA_OFFLINE_ALCOGOL then
        L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
        else  L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';

        L_shift_user_ALCOGOL.Caption:=shift_user_ALCOGOL;
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClGreen;
        BB_Shift_Begin_ALCOGOL.Enabled:=False;

       ControlDurationSmena(DurationSmena, DurationSmena_ALCOGOL, IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL);
       if (DurationSmena_ALCOGOL>=23.5) and (IS_STARTED_SMENA_ALCOGOL=1) then
          MessageDlg('Длительность смены превышает допустимое значение!', mtError, [mbOk], 0);
       L_DurationSmena_ALCOGOL.Caption:=Format('Открыта %s - %8.2f ч', [DateTimeToStr(DataTimeShift_Opened_ALCOGOL),DurationSmena_ALCOGOL]);
      end
      else
      begin
        BB_Shift_Begin_ALCOGOL.Font.Color:=ClRed;
        L_shift_Opened_ALCOGOL.Caption:='Смена закрыта';
        L_shift_user_ALCOGOL.Caption:='';
        BB_Shift_Begin_ALCOGOL.Enabled:=True;
        L_DurationSmena_ALCOGOL.Caption:='';
      end;

    end;

    BB_Shift_Begin.Enabled:=False;
    BBKassaIn.Enabled:= not BB_Shift_Begin.Enabled;
   // BB_LastShiftTotals.Enabled:= not BB_Shift_Begin.Enabled;
    BBKassaOut.Enabled:= not BB_Shift_Begin.Enabled;
    BB_Close_smena.Enabled:= not BB_Shift_Begin.Enabled;

   if not SetupRRO(false) then Exit; // настройка системы РРО
   if not ObjectsRRO() then Exit;  // Запрос доступных объектов ПРРО then
   if not SetupRegistrar(false) then Exit; // настройка ПРРО кассы
   if not TransactionsRegistrarState(false) then Exit;
    if IS_shift_Opened=1 then
    begin
      if IS_KASSA_OFFLINE then
      L_shift_Opened.Caption:='Смена открыта offline'
      else  L_shift_Opened.Caption:='Смена открыта online';

      L_shift_user.Caption:=shift_user;
      BB_Shift_Begin.Font.Color:=ClGreen;
      if shift_user<>'null' then   BB_Shift_Begin.Enabled:=False;
      ControlDurationSmena(DurationSmena, DurationSmena_ALCOGOL, IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL);
      if (DurationSmena>=23.5) and (IS_STARTED_SMENA=1) then
          MessageDlg('Длительность смены превышает допустимое значение!', mtError, [mbOk], 0);
      L_DurationSmena.Caption:=Format('Открыта %s - %8.2f ч', [DateTimeToStr(DataTimeShift_Opened),DurationSmena]);

    end
    else
    begin
      BB_Shift_Begin.Font.Color:=ClRed;
      L_shift_Opened.Caption:='Смена закрыта';
      L_shift_user.Caption:='';
       BB_Shift_Begin.Enabled:=True;
       L_DurationSmena.Caption:='';
       ControlDurationSmena(DurationSmena, DurationSmena_ALCOGOL, IS_STARTED_SMENA, IS_STARTED_SMENA_ALCOGOL);
       L_DurationSmena.Caption:=Format('Закрыта %s - %8.2f ч', [DateTimeToStr(DataTimeShift_Opened),DurationSmena]);

    end;

    BBKassaIn.Enabled:= not BB_Shift_Begin.Enabled;
   // BB_LastShiftTotals.Enabled:= not BB_Shift_Begin.Enabled;
    BBKassaOut.Enabled:= not BB_Shift_Begin.Enabled;
    BB_Close_smena.Enabled:= not BB_Shift_Begin.Enabled;

    PRRO_ON_OFF.Visible:= (F_main.SHOW_FISCAL_REP=1);

    if IS_EXIST_ALCO_KASSA=0 then
    begin
     BB_Sale.Enabled:=(IS_shift_Opened=1);
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
    end
    else
    begin
     BB_Sale.Enabled:=((IS_shift_Opened=1) and (IS_shift_Opened_ALCOGOL=1) );
     BB_Return_Tov.Enabled:=BB_Sale.Enabled;
    end;


  end
  else   //  if RRO_ENABLED=1 then
  begin
    BB_Sale.Enabled:=True;
    BB_Return_Tov.Enabled:=BB_Sale.Enabled;
    L_DurationSmena.Caption:='';
    L_DurationSmena_ALCOGOL.Caption:='';
  end;

  //  проверка на наличие непереданных на сервер документов
  with Q_Not_Sent_Docs do
  begin
    Close;
    Parameters.ParamByName('d').Value:=D_Work.DateTime-1;
    Open;


    if RecordCount>0 then
    begin

      Last;
      d2:=EndOfTheDay(FieldByName('D_DOC').AsFloat);
      First;
      d1:=DateOf(FieldByName('D_DOC').AsFloat);

      if F_Not_Sent_Doc_dlg()=mrOk then
      begin
        if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
          ActionConnectRemoteDBExecute(Sender);
        if   is_connect_server then
        begin
            // выгрузка данных о документах в вспомогательные таблицы для экспрота данных в основную БД
           // за текущую дату
         GetMinMaxDate(d1,d2);

          UpLoadDocForExport(d1,d2, True);

          if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
            ActionDisconnectRemoteDBExecute(Sender);

        end;
      end;

    end;
  end;


end;




procedure TF_main.T_WorkChange(Sender: TObject);
begin
D_Work.Time:=T_Work.Time;
end;

procedure TF_main.T_WorkExit(Sender: TObject);
begin
D_Work.Time:=T_Work.Time;
end;


// получение нумерации документов
function TF_main.get_nums_doc(ID_DOC_TYPE: integer; var n:integer):integer;
begin
 dm1.SP_GET_NEXT_NUMB_DOC.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
 dm1.SP_GET_NEXT_NUMB_DOC.ExecProc;
 n:=dm1.SP_GET_NEXT_NUMB_DOC.Parameters.ParamValues['@PN'];
 result:=dm1.SP_GET_NEXT_NUMB_DOC.Parameters.ParamValues['@ER'];
end;


function TF_main.RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
NumFiscal,  NumLocal, OrderDateTime :string; is_prodaga:boolean; ORDERRETNUM:string ):boolean;
 var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONNestedObject: TJSONObject;
  JSONArray: TJSONArray;
  JsonValue :TJsonValue;

  JsonObjectCHECKHEAD: TJSONObject;
  JsonObjectCHECKTOTAL: TJSONObject;

  JSONArrayCHECKPAY: TJSONArray;
  JSONArrayPAYSYS: TJSONArray;
  JSONArrayCHECKTAX: TJSONArray;
  JSONArrayCHECKBODY: TJSONArray;
  JSONArrayEXCISELABELS: TJSONArray;
  JSONArrayCheck: TJSONObject;
    Writer: TStreamWriter;
  QRCodeS64:string;
  UNITCD:integer;
  LETTERS:string;
  is_repeat_Transfer, is_Transfered:boolean;
  ErrorCode:string;
  KassaNumFiscal:int64;
begin

 with DM1.QPrintCashCaption do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
     SKIDKA_KOLBASA:=FieldByName('SKIDKA_KOLBASA').AsFloat;
     SKIDKA_MYASO:=FieldByName('SKIDKA_MYASO').AsFloat;
     SKIDKA_TNP:=FieldByName('SKIDKA_TNP').AsFloat;
     PER_SKIDKA_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;
     PER_SKIDKA_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
     PER_SKIDKA_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;
     SKIDKA_COMMENT:=FieldByName('SKIDKA_COMMENT').AsString;
     MIN_KOLBASA:=FieldByName('MIN_KOLBASA').AsFloat;
     MIN_MYASO:=FieldByName('MIN_MYASO').AsFloat;
     MIN_TNP:=FieldByName('MIN_TNP').AsFloat;
     BONUS_NACHISL:=FieldByName('BONUS_NACHISL').AsFloat;
     BONUS_OLD:=FieldByName('BONUS_OLD').AsFloat;

     BONUS_NEW:=FieldByName('BONUS_NEW').AsFloat;
     NN:=FieldByName('NN').AsString;
     D_CREATE:=FieldByName('D_CREATE').AsFloat;
     TOT_SUM:=FieldByName('TOT_SUM').AsFloat;
     ROUND_SUM:=FieldByName('ROUND_SUM').AsFloat;
     SUM_OPL_BONUS:=FieldByName('SUM_OPL_BONUS').AsFloat;
     SUM_OPL_CARD:=FieldByName('SUM_OPL_CARD').AsFloat;
     SUM_POLUCH:=FieldByName('SUM_POLUCH').AsFloat;
     SUM_SDACHI:=FieldByName('SUM_SDACHI').AsFloat;
     SUM_SDACHI_TO_CARD:=FieldByName('SUM_SDACHI_TO_CARD').AsFloat;
     INN_D:=FieldByName('INN_D').AsString;
     INN_K:=FieldByName('INN_K').AsString;
     ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
     CARD_NN_NOT_FISCAL:=FieldByName('CARD_NN_NOT_FISCAL').AsString;
     TRANS_CODE_NOT_FISCAL:=FieldByName('TRANS_CODE_NOT_FISCAL').AsString;
     MINUS:=FieldByName('MINUS').AsFloat;
     ID_CLI_RRO:=FieldByName('ID_CLI_RRO').AsInteger;
     CHECK_NUMLOCAL:=FieldByName('CHECK_NUMLOCAL').AsString;
     CHECK_NUMFISCAL:=FieldByName('CHECK_NUMFISCAL').AsString;
      ORDERDATETIME_REG:=FieldByName('ORDERDATETIME').AsString;
      QRCODE_REG:=FieldByName('QRCODE_REG').AsString;
      CLI_RRO:=FieldByName('CLI_RRO').AsString;
      INN_RRO:=FieldByName('INN_RRO').AsString;

     Close;
  end;

 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'RegisterCheck');
  {
   if vIS_ALCOGOL_CHECK=1 then
  begin
    JsonObject.AddPair('Certificate', F_main.Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', F_main.PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', F_main.PasswordKey_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('Certificate', F_main.Certificate);
    JsonObject.AddPair('PrivateKey', F_main.PrivateKey);
    JsonObject.AddPair('Password', F_main.PasswordKey);
  end;
  }

  if vIS_ALCOGOL_CHECK=0 then
    KassaNumFiscal:=F_Main.ID_NUM_FISCAL_KASSA
  else  KassaNumFiscal:=F_Main.ID_NUM_FISCAL_KASSA_ALCOGOL;

  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(KassaNumFiscal));


  /////////////////////
  JsonObjectCHECKHEAD:= TJSONObject.Create;

  JsonObjectCHECKHEAD.AddPair('DOCTYPE', TJSONNumber.Create(0));  // Тип документа (числовий): 0-Чек реалізації товарів/послуг, 1-Чек переказу коштів, 2–Чек операції обміну валюти, 3-Чек видачі готівки, 4-Чек обслуговування у ломбарді, 100-Відкриття зміни, 101-Закриття зміни, 102-Початок офлайн сесії, 103-Завершення офлайн сесії-->

  if is_prodaga then
  begin
    JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(0)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Продажа#'+IntToStr(v_ID_NAKLCAP));

  end
  else
  begin
    JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(1)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Возврат#'+IntToStr(v_ID_NAKLCAP));
    JsonObjectCHECKHEAD.AddPair('ORDERRETNUM', ORDERRETNUM); // Фіскальний номер чека, для якого здійснюється повернення (зазначається тільки для чеків повернення) (128 символів)
  end;

 //////////////////////////////////////


  JsonObjectCHECKTOTAL:= TJSONObject.Create;
  JsonObjectCHECKTOTAL.AddPair('SUM', TJSONNumber.Create(TOT_SUM+ROUND_SUM{270.00})); // общая сумма чека  с учетом скидки и округлений
  JsonObjectCHECKTOTAL.AddPair('RNDSUM', TJSONNumber.Create(-1*ROUND_SUM{0.08}));  // сумма округления
  JsonObjectCHECKTOTAL.AddPair('NORNDSUM', TJSONNumber.Create(TOT_SUM{270.08}));  // сумма с учетом скидки без округления
  JsonObjectCHECKTOTAL.AddPair('NOTAXSUM', TJSONNumber.Create(TOT_SUM+MINUS{220.08})); // Сума чеку без урахування податків/зборів и скидок(15.2 цифри)
  JsonObjectCHECKTOTAL.AddPair('USAGETYPE', TJSONNumber.Create(2));   //Тип застосування знижки/націнки (числовий): 0–Попередній продаж, 1–Проміжний підсумок, 2–Спеціальна...
  JsonObjectCHECKTOTAL.AddPair('SUBCHECK', TJSONNumber.Create(TOT_SUM+MINUS{220.08}));  // Сума на яку нараховується знижка/націнка (15.2 цифри)-->
  JsonObjectCHECKTOTAL.AddPair('DISCOUNTTYPE', TJSONNumber.Create(0)); // Тип знижки/націнки (числовий): 0–Сумова, 1–Відсоткова
 // JsonObjectCHECKTOTAL.AddPair('DISCOUNTPERCENT', TJSONNumber.Create(10.00));  // Відсоток знижки/націнки, для відсоткових знижок/націнок (не зазначається при фіксованій сумі знижки/націнки) (15.2 цифри)-->
  JsonObjectCHECKTOTAL.AddPair('DISCOUNTSUM', TJSONNumber.Create(MINUS{50.00})); // Загальна сума знижки/націнки (15.2 цифри)-->

 ////////////////////////////////////////

  //Создаем массив оплат
    JSONArrayCHECKPAY:=TJSONArray.Create;
    {-- добавляем в массив первый объект --}


    if abs(SUM_POLUCH-SUM_SDACHI-SUM_SDACHI_TO_CARD) >Eps then  // оплата наличными
    begin   //
    // 1. заносим в массив пустой json-объект
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(0));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','ГОТІВКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_POLUCH-SUM_SDACHI

      ));   // Сума к оплате (15.2 цифри)
      JSONNestedObject.AddPair('PROVIDED', TJSONNumber.Create(SUM_POLUCH

      ));  //  Сума внесених коштів (15.2 цифри)


      // JSONNestedObject.AddPair('REMAINS', TJSONNumber.Create(SUM_SDACHI)); //Решта (не зазначається, якщо решта відсутня) (15.2 цифри)-->

      // сдачу на карту для фискальной регистрации считаем как обычную сдачу из-за ошибки при регистраци
      JSONNestedObject.AddPair('REMAINS', TJSONNumber.Create(SUM_SDACHI+SUM_SDACHI_TO_CARD));


    end;




    if abs(SUM_OPL_BONUS)>Eps then    // безнал оплата дисконтной картой (бонусами)
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(4));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','Д-КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_BONUS));   // Сума к оплате (15.2 цифри)

    end;
     // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (*    сдачу на карту для фискальной регистрации считаем как обычную сдачу из-за ошибки при регистраци
    if abs(SUM_SDACHI_TO_CARD)>Eps then    // Сдача перечисляемая на бонускую карту
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(2));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','РЕШТА-КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(-SUM_SDACHI_TO_CARD));   // Сума к оплате (15.2 цифри)

    end;
     *)

     if abs(SUM_OPL_CARD)>Eps then    // безнал оплата банковской
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(1));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_CARD));   // Сума к оплате (15.2 цифри)

    //Создаем массив платежных систем
      JSONArrayPAYSYS:=TJSONArray.Create;
      JSONArrayPAYSYS.AddElement(TJSONObject.Create);
      JSONNestedObject:=JSONArrayPAYSYS.Items[pred(JSONArrayPAYSYS.Count)] as TJSONObject;
      JSONNestedObject.AddPair('ACQUIRETRANSID',TRANS_CODE_NOT_FISCAL);   // Ідентифікатор транзакції, що надається еквайром та ідентифікує операцію в платіжній системі (128 символів)-->
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_CARD));   // Сума к оплате (15.2 цифри)


    end;
 ////////////////////////////////
//Создаем массив налогов
    JSONArrayCHECKTAX:=TJSONArray.Create;
    {-- добавляем в массив первый объект --}
    //  заносим в массив пустой json-объект
 {   JSONArrayCHECKTAX.AddElement(TJSONObject.Create);
     //получаем ссылку на добавленный объект
         JSONNestedObject:=JSONArrayCHECKTAX.Items[pred(JSONArrayCHECKTAX.Count)] as TJSONObject;
             //заполняем объект данными
                 JSONNestedObject.AddPair('TYPE', TJSONNumber.Create(0)); // тип налога 0-ПДВ; 1- акциз; 2 - ПФ
                     JSONNestedObject.AddPair('NAME','ПДВ');
                         JSONNestedObject.AddPair('LETTER','А');
                             JSONNestedObject.AddPair('PRC', TJSONNumber.Create(20.00));  //Відсоток податку/збору (15.2 цифри)
                                 JSONNestedObject.AddPair('SIGN', TJSONBool.Create(False)); // Ознака податку/збору, не включеного у вартість
                                     JSONNestedObject.AddPair('TURNOVER', TJSONNumber.Create(TOT_SUM ));  //Сума обсягів для розрахування податку/збору (15.2 цифри)

                                         JSONNestedObject.AddPair('SOURCESUM', TJSONNumber.Create(TOT_SUM )); // Вихідна сума для розрахування податку/збору (15.2 цифри)
                                             JSONNestedObject.AddPair('SUM', TJSONNumber.Create(TOT_SUM*0.2));  // Сума податку/збору (15.2 цифри)-->
                                             }
    if vIS_ALCOGOL_CHECK=1 then
    begin

    {-- добавляем в массив второй объект --}
    JSONArrayCHECKTAX.AddElement(TJSONObject.Create);
    //получаем ссылку на добавленный объект
    JSONNestedObject:=JSONArrayCHECKTAX.Items[pred(JSONArrayCHECKTAX.Count)] as TJSONObject;
    //заполняем объект данными
    JSONNestedObject.AddPair('TYPE', TJSONNumber.Create(1));
    JSONNestedObject.AddPair('NAME','Акциз');
    JSONNestedObject.AddPair('LETTER','Г');
    JSONNestedObject.AddPair('PRC', TJSONNumber.Create(5.00));
    JSONNestedObject.AddPair('TURNOVER', TJSONNumber.Create(TOT_SUM));
    JSONNestedObject.AddPair('SOURCESUM', TJSONNumber.Create(TOT_SUM));
    JSONNestedObject.AddPair('SUM', TJSONNumber.Create(TOT_SUM*0.05));
    end;

    //Создаем массив товаров чека
    JSONArrayCHECKBODY:=TJSONArray.Create;

    with DM1.QPrintReceipt do
    begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
      First;
      while not EOF do
      begin
       if FieldByName('IS_EXCISE').AsInteger=1 then
       begin

     // Создаем массив акцизных марок
        JSONArrayEXCISELABELS:=TJSONArray.Create;
        JSONArrayEXCISELABELS.AddElement(TJSONObject.Create);
        JSONNestedObject:=JSONArrayEXCISELABELS.Items[pred(JSONArrayEXCISELABELS.Count)] as TJSONObject;
        //заполняем объект данными
        JSONNestedObject.AddPair('EXCISELABEL', FieldByName('EXCISE_BAR_CODE').AsString);
       end;


        {-- добавляем в массив первый объект --}
        //  заносим в массив пустой json-объект
        JSONArrayCHECKBODY.AddElement(TJSONObject.Create);
        //получаем ссылку на добавленный объект
        JSONNestedObject:=JSONArrayCHECKBODY.Items[pred(JSONArrayCHECKBODY.Count)] as TJSONObject;
        //заполняем объект данными
        JSONNestedObject.AddPair('CODE', IntToStr(FieldByName('ID_TOV').AsInteger));  // Внутрішній код товару (64 символи)
        JSONNestedObject.AddPair('BARCODE',FieldByName('CODE').AsString);  // Штриховий код товару (64 символи)
        JSONNestedObject.AddPair('UKTZED',FieldByName('UKTZED').AsString); // Код товару згідно з УКТЗЕД (15 цифр)
        JSONNestedObject.AddPair('NAME',FieldByName('TOV_NAME').AsString);  // Найменування товару, послуги або операції (текст)

        if Trim(FieldByName('EDIZM').AsString)='кг' then UNITCD:=301
        else UNITCD:=2009;
        JSONNestedObject.AddPair('UNITCD', TJSONNumber.Create(UNITCD)); // Код одиниці виміру згідно класифікатора (5 цифр)

        JSONNestedObject.AddPair('UNITNM',FieldByName('EDIZM').AsString);   // Найменування одиниці виміру (64 символи); 2009 - шт; 0301 - кг
        JSONNestedObject.AddPair('AMOUNT', TJSONNumber.Create(FieldByName('SN').AsFloat)); // Кількість/об’єм товару (15.3 цифри)
        JSONNestedObject.AddPair('PRICE', TJSONNumber.Create(FieldByName('PRICE').AsFloat));   // цена с ндс
        if vIS_ALCOGOL_CHECK=1 then  LETTERS:='Г';
       // else  LETTERS:='А';
        JSONNestedObject.AddPair('LETTERS',LETTERS);                        // перечень литер налогов

        JSONNestedObject.AddPair('COST', TJSONNumber.Create(FieldByName('ST').AsFloat));  // Сума операції (15.2 цифри)
         if FieldByName('IS_EXCISE').AsInteger=1 then
           JSONNestedObject.AddPair(TJSONPair.Create('JSONArrayEXCISELABELS', JSONArrayEXCISELABELS)); // Акцизні марки

       // JSONNestedObject.AddPair('COMMENT','Коментар до товару');

        Next;
      end;



      Close;
    end;



    ////////////////////////////////////////

    JSONArrayCheck:=TJSONObject.Create;
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKHEAD', JsonObjectCHECKHEAD));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKTOTAL', JsonObjectCHECKTOTAL));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKPAY', JSONArrayCHECKPAY));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKTAX', JSONArrayCHECKTAX));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKBODY', JSONArrayCHECKBODY));

  JsonObject.AddPair(TJSONPair.Create('Check', JSONArrayCheck));


  JsonObject.AddPair('GetQrCode', TJSONBool.Create(True));
  JsonObject.AddPair('QrSize', TJSONNumber.Create(256));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  if F_Main.WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheckQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;



  JsonToSend := TStringStream.Create(Utf8Encode(Json));



   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= F_main.Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  if F_Main.WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheck.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  ErrorCode:='';
  QRCodeS64:= '';
  QRCode:= '';
  NumFiscal:='';
  NumLocal:= '';
  OrderDateTime:='';
  if sResponse<>'' then
  begin

   { JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    QRCodeS64:= JsonObject.Get('QrCode').JsonValue.Value;
    QRCode:=DecodeString(QRCodeS64);
    NumFiscal:= JsonObject.Get('NumFiscal').JsonValue.Value;
    NumLocal:= JsonObject.Get('NumLocal').JsonValue.Value;
    OrderDateTime:= JsonObject.Get('OrderDateTime').JsonValue.Value;
    JsonObject.Free;  }

   JsonValue := TJSONObject.ParseJSONValue(sResponse);
    ErrorCode:= JsonValue.GetValue<String>('ErrorCode');
    QRCodeS64:= JsonValue.GetValue<String>('QrCode');
    QRCode:=DecodeString(QRCodeS64);
    NumFiscal:= JsonValue.GetValue<String>('NumFiscal');
    NumLocal:= JsonValue.GetValue<String>('NumLocal');
    OrderDateTime:=JsonValue.GetValue<String>('OrderDateTime');

    if vIS_ALCOGOL_CHECK=1 then F_Main.IS_KASSA_OFFLINE_ALCOGOL:=JsonValue.GetValue<Boolean>('Offline')
    else F_Main.IS_KASSA_OFFLINE:=JsonValue.GetValue<Boolean>('Offline');
    if vIS_ALCOGOL_CHECK=1 then
    begin
      if F_Main.IS_KASSA_OFFLINE then
          F_Main.L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
      else  F_Main.L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';
    end
    else
    begin
      if F_Main.IS_KASSA_OFFLINE then
          F_Main.L_shift_Opened.Caption:='Смена открыта offline'
      else  F_Main.L_shift_Opened.Caption:='Смена открыта online';
    end;
    JsonValue.Free;

  end;


  result:= (ErrorCode='Ok');


 // Writer := TStreamWriter.Create('e:\key1\QRCODE.JPEG', false,  TEncoding.ANSI);
 // Writer.Write(QRCode);
 // Writer.Free();


end;  // function RegisterCheck_RRO




end.
