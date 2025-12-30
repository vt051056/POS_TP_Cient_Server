unit USaleDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uRS232, System.Actions,
  Vcl.ActnList, Vcl.ImgList, Data.DB, Vcl.Touch.Keyboard, Vcl.Touch.GestureMgr,
  Vcl.Mask, APScale_TLB, Data.Win.ADODB, uPosAPI, QuickRpt, QRQRBarcode;


type
  TF_SaleDoc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel_Price: TPanel;
    Panel_Oplata: TPanel;
    Timer1: TTimer;
    E_OPL_NAL: TEdit;
    E_TOT_SUM: TEdit;
    E_SDACHA: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ActionListSaleDoc: TActionList;
    Action_Print_Cash_Receipt: TAction;
    Action_Pay: TAction;
    Action_New_Doc: TAction;
    Action_Close: TAction;
    Action_BonusCard: TAction;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    Action_Naveski_Add: TAction;
    Action_Naveski_Delete: TAction;
    StatusBar1: TStatusBar;
    Action_Weight_on_off: TAction;
    Label5: TLabel;
    E_OPL_BONUS: TEdit;
    BB_OPL_BONUS: TBitBtn;
    Action_Opl_Bonus: TAction;
    BB_Pay_Bank_Not_Fiscal: TBitBtn;
    Action_Opl_Bank_Card: TAction;
    Bevel1: TBevel;
    Label8: TLabel;
    E_TOT_MONEY: TEdit;
    PrintDialog1: TPrintDialog;
    Label_already_paid_credit_card: TLabel;
    Panel9: TPanel;
    BBClean: TBitBtn;
    BBReset: TBitBtn;
    PanelSearch: TPanel;
    Label7: TLabel;
    LGrup: TLabel;
    DBText1: TDBText;
    EWeight: TEdit;
    GroupBox9: TGroupBox;
    BBNaveskiDelete: TBitBtn;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BBWeight_on_off: TBitBtn;
    BBAllGrTovSel: TBitBtn;
    BBGrTovSel: TBitBtn;
    Panel11: TPanel;
    BBPay: TBitBtn;
    BBPrint_Cash_Receipt: TBitBtn;
    Panel10: TPanel;
    Label10: TLabel;
    Label1: TLabel;
    DT_Date_doc: TDateTimePicker;
    DT_Time_doc: TDateTimePicker;
    EN: TEdit;
    BBBonusCard: TBitBtn;
    BBClose: TBitBtn;
    Panel8: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator3: TDBNavigator;
    BB_naveski_add: TBitBtn;
    Panel7: TPanel;
    Label_Client: TLabel;
    DBNavigator2: TDBNavigator;
    GroupBox2: TGroupBox;
    Edit_Sum_Bonus_Ball: TEdit;
    GroupBox3: TGroupBox;
    Edit_BonusCard: TEdit;
    GestureManager1: TGestureManager;
    RadioGroup1: TRadioGroup;
    DBText2: TDBText;
    Label6: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    Panel12: TPanel;
    TouchKeyboard1: TTouchKeyboard;
    PanelBankTerm: TPanel;
    GroupBoxCLI_SELECT: TGroupBox;
    ECLI_ContrAgent: TEdit;
    BBSel_CLI_ContrAgent: TBitBtn;
    QDocPrototypeCaption: TADOQuery;
    QDocPrototype_Tov: TADOQuery;
    SP_SET_PRICE_FROM_PROTOTYPE: TADOStoredProc;
    DBEditPRICE_TMP: TDBEdit;
    BBCennik: TBitBtn;
    RG_Price_View: TRadioGroup;
    QSkidkaNow: TADOQuery;
    QSkidkaDocEdit: TADOQuery;
    Panel15: TPanel;
    Panel14: TPanel;
    L_Itog: TLabel;
    L_Skidka: TLabel;
    L_klobasa: TLabel;
    L_myaso: TLabel;
    L_tnp: TLabel;
    BB_SkidkaShow: TBitBtn;
    BB_RegistrBonusCard: TBitBtn;
    Panel_Reg_BonusCard: TPanel;
    L_ShtrihCode: TLabel;
    E_INN: TEdit;
    Label13: TLabel;
    E_Cli: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    E_Tel: TEdit;
    Label16: TLabel;
    DTP_Birthday: TDateTimePicker;
    Label17: TLabel;
    E_Email: TEdit;
    BB_CancelBonusCard_Info: TBitBtn;
    BitBtn2: TBitBtn;
    QBonus_Cli: TADOQuery;
    QBonusPercent: TADOQuery;
    CB_SHTRIH_TOV: TCheckBox;
    GroupBox4: TGroupBox;
    ADS_SHTRIH_CODE_TOV_NEW: TADODataSet;
    ADS_SHTRIH_CODE_TOV_NEWGRUPTOV: TWideStringField;
    ADS_SHTRIH_CODE_TOV_NEWNAME: TWideStringField;
    ADS_SHTRIH_CODE_TOV_NEWEDIZM: TWideStringField;
    DS_SHTRIH_CODE_TOV_NEW: TDataSource;
    ADS_SHTRIH_CODE_TOV_NEWID_TOV: TIntegerField;
    SP_SHTRIH_CODE_TOV_ADD: TADOStoredProc;
    QGetGRTOV: TADOQuery;
    GroupBoxNacenka: TGroupBox;
    E_PerNacenki: TEdit;
    BitBtn3: TBitBtn;
    CB_PerNacenki: TCheckBox;
    ActionNacenka: TAction;
    Q_PrinterSetup: TADOQuery;
    SP_CALC_DOC_FISCAL_TYPE_RESULT: TADOStoredProc;
    Label18: TLabel;
    E_TOT_NOT_FISCAL_SUM: TEdit;
    Label20: TLabel;
    E_D_RoundNotFiscal: TEdit;
    Action_OplBank_Card_Fiscal: TAction;
    ADOCommandInsertNOT_SAVED_DOC: TADOCommand;
    ADOCommandDeleteNOT_SAVED_DOC: TADOCommand;
    ADS_NOT_SAVED_DOC: TADODataSet;
    Panel16: TPanel;
    BB_NUM_LK: TBitBtn;
    Panel18: TPanel;
    Memo1: TMemo;
    E_SDACHA_TO_BONUS_CARD: TEdit;
    Label24: TLabel;
    SP_CONTROL_ONE_FISCAL_GROUP: TADOStoredProc;
    Q_COUNT_CHECK_NAL_BEZNAL: TADOQuery;
    Q_IS_NAL: TADOQuery;
    CBOrderAssortiment: TCheckBox;
    BBRecept_To_Resistr: TBitBtn;
    QRealizDay: TADOQuery;
    Bevel2: TBevel;
    Label_Opl_Bank: TLabel;
    BB_InpOplBank: TBitBtn;
    QSkidkaNowID_SKIDKA: TIntegerField;
    QSkidkaNowPER_SKIDKA_KOLBASA: TFloatField;
    QSkidkaNowPER_SKIDKA_MYASO: TFloatField;
    QSkidkaNowPER_SKIDKA_TNP: TFloatField;
    QSkidkaNowCOMMENT: TWideStringField;
    QSkidkaNowD_FROM: TDateTimeField;
    QSkidkaNowD_TO: TDateTimeField;
    QSkidkaNowMIN_KOLBASA: TFloatField;
    QSkidkaNowMIN_MYASO: TFloatField;
    QSkidkaNowMIN_TNP: TFloatField;
    QSkidkaNowIS_NAMED: TIntegerField;
    ADOCommandEditLocalBonus: TADOCommand;
    SP_SEARCH_TOV_FROM_BARCODE: TADOStoredProc;
    CB_Search_BarCode: TCheckBox;
    BB_NewBarCode: TBitBtn;
    ADS_SHTRIH_CODE_TOV_NEWBARCODE: TWideStringField;
    ADS_SHTRIH_CODE_TOV_NEWSYMBOLS_WEIGHT_OF_BARCODE: TIntegerField;
    ADS_SHTRIH_CODE_TOV_NEWWEIGHT_MULTIPLIER: TFloatField;
    Q_IS_BONUS: TADOQuery;
    CB_AllPriceList: TCheckBox;
    BB_WithoutOplaty: TBitBtn;
    ADOCommandDeleteNotFinalDoc: TADOCommand;
    ADOCommandFinalDoc: TADOCommand;
    procedure BBResetClick(Sender: TObject);
    procedure BBCleanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBGrTovSelClick(Sender: TObject);
    procedure BBAllGrTovSelClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);


    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure E_OPL_NALChange(Sender: TObject);
    procedure Action_Print_Cash_ReceiptExecute(Sender: TObject);
    procedure Action_PayExecute(Sender: TObject);
    procedure Action_New_DocExecute(Sender: TObject);
    procedure Action_CloseExecute(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure Action_BonusCardExecute(Sender: TObject);
    procedure Action_Naveski_AddExecute(Sender: TObject);
    procedure Action_Naveski_DeleteExecute(Sender: TObject);
    procedure Action_Weight_on_offExecute(Sender: TObject);
    procedure Action_Opl_BonusExecute(Sender: TObject);
    procedure Action_Opl_Bank_CardExecute(Sender: TObject);
    procedure E_OPL_BONUSChange(Sender: TObject);
    procedure Action_grid_downExecute(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure EWeightChange(Sender: TObject);
    procedure Edit_BonusCardKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_OPL_NALKeyPress(Sender: TObject; var Key: Char);
    procedure EWeightKeyPress(Sender: TObject; var Key: Char);

    procedure RadioGroup1Click(Sender: TObject);
    procedure BB_NUM_LKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSel_CLI_ContrAgentClick(Sender: TObject);
    procedure DBEditPRICE_TMPExit(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BBCennikClick(Sender: TObject);
    procedure DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RG_Price_ViewClick(Sender: TObject);
    procedure BB_SkidkaShowClick(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure BB_RegistrBonusCardClick(Sender: TObject);
    procedure BB_SaveBonusCard_InfoClick(Sender: TObject);
    procedure E_TelClick(Sender: TObject);
    procedure BB_CancelBonusCard_InfoClick(Sender: TObject);
    procedure E_CliClick(Sender: TObject);
    procedure E_INNClick(Sender: TObject);
    procedure DTP_BirthdayClick(Sender: TObject);
    procedure E_EmailClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure EWeightClick(Sender: TObject);
    procedure E_OPL_BONUSClick(Sender: TObject);
    procedure E_OPL_NALClick(Sender: TObject);
    procedure CB_SHTRIH_TOVClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ActionNacenkaExecute(Sender: TObject);
    procedure DT_Date_docExit(Sender: TObject);
    procedure ENExit(Sender: TObject);
    procedure E_SDACHA_TO_BONUS_CARDChange(Sender: TObject);
    procedure CBOrderAssortimentClick(Sender: TObject);
    procedure BBRecept_To_ResistrClick(Sender: TObject);
    procedure E_OPL_BONUSExit(Sender: TObject);
    procedure Timer_BankGoTimer(Sender: TObject);
    procedure BB_InpOplBankClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CB_Search_BarCodeClick(Sender: TObject);
    procedure BB_NewBarCodeClick(Sender: TObject);
    procedure CB_AllPriceListClick(Sender: TObject);
    procedure BB_WithoutOplatyClick(Sender: TObject);

  private
    { Private declarations }
     CarentFieldSeach:string;

  public
    { Public declarations }
    ID_DOC_TYPE:integer;
    ID_NAKLCAP:longint;

    ID_CLIENT:longint;
    CLI_D:string;
    ID_KATEGOR_CLI_D:LongInt;
    ID_KATEGOR_CLI_K:LongInt;
    KATEGOR_D:string;
    KATEGOR_K:string;
    ID_CLI_K:longint;
    CLI_K:string;
    SCH_D,SCH_K:string;
    PRICE_KATEG:integer;
    TIME_DEFAULT:TDateTime;
    ID_VENDOR:longint;

    BIRTHDAY_CLI:TDateTime;
    IS_PENSIONER:integer;  // признак зарегистрированного пенсионера (первые 4 знака штрихкода карточк 2021 - пенсионер иначе нет)
    is_carte_Kharkov:boolean; // признак карты харьковчанина
    Сarte_Kharkov:string;  // № карты харьковчанина
  //  ID_GRTOV_from, ID_GRTOV_to:longint;

    TOT_SUM, TOT_NUM:extended;   // общее сумма, кол-во
    TOT_SUM_FISCAL,  TOT_SUM_NOT_FISCAL:extended; // итоговые суммы оплаты по фискальнам  и нефискальным чекам
    ROUND_TOT_SUM_FISCAL, ROUND_TOT_SUM_NOT_FISCAL :extended;   // итоговые округленные суммы оплаты по фискальнам  и нефискальным чекам
    D_ROUND_TOT_SUM_FISCAL, D_ROUND_TOT_SUM_NOT_FISCAL :extended;  // соответствующие округленич


    TOT_COUNT_SEL_TOV:integer;   // общее кол-во наименований
    SUM_OPL_NAL:extended;         // сумма покупателя наличными
    SUM_SDACHA: extended;        // сумма сдачи
    SUM_SDACHA_TO_BONUS_CARD : extended; // сумма части сдачи зачисляемой на накоительный счет бонусной карты
    SUM_OPL_NAL_FISCAL:extended;         // сумма покупателя наличными
    SUM_SDACHA_FISCAL: extended;        // сумма сдачи

    SUM_BONUS_BALL:extended;    // накапливаемая (текущего периода) сумма бонусных баллов
    SUM_BALL_NEW :extended;    // накопленная сумма баллов включая текущую покупку
    SUM_BALL_CALC :extended;    //  начисленные баллы за текущую покупку
    SUM_BALL_CALC_KOLBASA :extended;    //  начисленные баллы за текущую покупку с колбасы
    SUM_BALL_CALC_MYASO :extended;    //  начисленные баллы за текущую покупку с мяса
    SUM_BALL_CALC_TNP :extended;    //  начисленные баллы за текущую покупку с ТНП
    SUM_OPL_BONUS:extended;     // сумма оплаты бонусами
    SUM_OPL_CARD:extended;     // сумма оплаты банковской картой
    SUM_OPL_CARD_FISCAL:extended;     // сумма оплаты банковской картой

    TOT_MONEY:extended;     // сумма оплаты нефискал c учетом бонусов и округлений
    TOT_MONEY_FISCAL:extended;     // сумма оплаты фискал c учетом бонусов

    SKIDKA:extended;         // сумма скидки по документу общая
    SKIDKA_KOLBASA, SKIDKA_MYASO, SKIDKA_TNP:extended;
    PER_SKIDKA_KOLBASA:extended;    // % скидки
    PER_SKIDKA_MYASO:extended;
    PER_SKIDKA_TNP:extended;
    ID_SKIDKA:integer;
    IS_NAMED_SKIDKA:integer;
    Skidka_Name:string; // название скидки
    Skidka_DFROM:TDateTime; // дата время начала скидки
    Skidka_DTO:TDateTime; // дата время конца скидки
    MIN_KOLBASA, MIN_MYASO, MIN_TNP:extended; // минимальные суммы с которых начинают действовать скидки
    N_KOLBASA, S_KOLBASA, N_MYASO, S_MYASO, N_TNP, S_TNP,
    N_KOLBASA_NOT_ACTION, S_KOLBASA_NOT_ACTION,
    N_MYASO_NOT_ACTION, S_MYASO_NOT_ACTION, N_TNP_NOT_ACTION, S_TNP_NOT_ACTION:extended;


    PER_SKIDKA_NAMED_KOLBASA:extended;    // % скидки зарегистрированного покупателя
    PER_SKIDKA_NAMED_MYASO:extended;
    PER_SKIDKA_NAMED_TNP:extended;
    ID_SKIDKA_NAMED:integer;
    Skidka_Name_NAMED:string; // название скидки  зарегистрированного покупателя
    MIN_NAMED_KOLBASA, MIN_NAMED_MYASO, MIN_NAMED_TNP:extended;
    Skidka_NAMED_DFROM:TDateTime; // дата время начала скидки зарегистрированного покупателя
    Skidka_NAMED_DTO:TDateTime; // дата время конца скидки  зарегистрированного покупателя

    is_Oplata_Go:boolean; // признак процесса принятия оплаты

    is_Registered_Client:boolean; // признак, что колиент зарегистрирован и нужно накапливать бонусы
    is_Opl_Bonus:boolean; // признак оплаты бонусами

    Weight:extended;  // текущий вес на весах
    price_tmp:extended; // цена уценки с весов
  //  Last_Weight:extended; // текущий вес на весах
    status_Weight:string;    // состояние весов
    ConditionWeight:string;
  //  RS2321:TRS232;
    ID_TOV_Search:longint;
    TouchKeyboard_Layout:string;
    IsOnWeight :boolean;
    vAPScale:TAPScale;

    ID_DOC_PROTOTYPE:longInt;   // документ прототип с которого берется информация
    IS_DOC_SAVED:boolean; // признак сохранения документа
    IS_DOC_SAVE_FINAL:boolean; // признак окончительного сохранения документа

    PanelSearch_Visible_State:boolean;
    Panel_Oplata_Visible_State:boolean;
    BBPay_State:boolean;
    BBPrint_Cash_Receipt_State:boolean;
    BBBonusCard_State:boolean;
    EditElementInFocus:  TObject;    // элемент ввода текста который в фокусе
    EmergencyMode :boolean;
 {   Fiscal_Printer_Name:string;
    Not_Fiscal_Printer_Name:string;
    Fiscal_Printer_Index:integer;
    Not_Fiscal_Printer_Index:integer;
   }

    IS_BANK_TRANSACTION_NOT_FISCAL:boolean;
    IS_BANK_TRANSACTION_FISCAL:boolean;
    CODE_TRANSACTION_NOT_FISCAL:string;
    CODE_TRANSACTION_FISCAL:string;
    CARD_NN_NOT_FISCAL:string;
    CARD_NN_FISCAL:string;
    CARD_PAY_SYSTEM:string;
    SDK_DOLG:extended; // долг покупателя
    IS_ALCOGOL_CHECK:integer; // 0 - чек не содержит алкоголя; 1 - содержит алкоголь
                              // используется для выбора ФОП (хозяйствующего объекта)
                              // от имени которого передаются в налоговую фискальные чеки

    IS_CAN_REGISTRED_RRO_PROTOTYPE:Integer;
    IS_REGISTER_RRO_PROTOTYPE:Integer;
    ID_CLI_RRO_PROTOTYPE:Integer;
    CHECK_NUMLOCAL_PROTOTYPE:String;
    CHECK_NUMFISCAL_PROTOTYPE:String; // фискальный номер оригинального чека, с которого делается возврат
    ORDERDATETIME_PROTOTYPE:String;
    QRCODE_REG_PROTOTYPE:String;

    time_start_wait_BankGoProgress:TDateTime;

    max_duration_wait_sec:integer;

    procedure ReOpenPrice;
    procedure CalcCarentResult;
    function SaveDoc(IS_FINAL:integer):boolean;
    procedure CleanNumbSelect;
    procedure Sum_naveski;

    function ADD_naveski(v:extended):integer;
    procedure SetDocInfo;
    function GetWeight(var status:string; var price:extended):extended;
  //  function Valid_Oplata():boolean;
    procedure SetCaptionNakl;
    procedure Weight_on_off_visualization;
  //  procedure Print_Cash_Receipt(Tag:integer; v_ID_NAKLCAP:integer);
  //  procedure Print_Cash_Receipt_Vozvrat(Tag:integer);
    procedure FindBonusCard;
    procedure OnWeightClick;
    procedure SetControlElements;
 //   procedure CennikPrint(productName, groupName: string; price: extended; id: integer);

    procedure RefreshSkidka;
  //  procedure SkidkaBirthday;
    procedure GetBonusCli(INN:string; v_ID_CLI:longint; var vSUM_BALL, vSDK:extended);

    function LoadBonusCli(INN:string; var vSUM_BALL:extended; var vSDK:extended):boolean;
    procedure SetBonusCli(vINN:string; vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS, vSUM_SDACHA_TO_BONUS_CARD:extended);
    function UpLoadBonusCli(vINN:string; vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS,vSUM_SDACHA_TO_BONUS_CARD:extended):boolean;
    function ValidInfoCLI:boolean;

    procedure Local_Calc_Bonus(vSUM_OPL_BONUS:extended);    // Локальный расчет бонусов
   { procedure Print_Cash_Receipt_XP_58;
    procedure Print_Cash_Receipt_POS_58;
    procedure Print_Cash_Receipt_Vozvrat_XP_58(Tag:integer);
    procedure Print_Cash_Receipt_Vozvrat_POS_58(Tag:integer);
    }
    procedure Control_Print_Cash_Receipt_Enabled;
    function Bank_Terminal_Go(is_fiscal:boolean; SUM_TO_PAY:extended; PORT:string;
                              var vPaySystem, card_nn, trans_code:string):boolean;
    function Bank_Terminal_Ingenico_Go(is_fiscal:boolean; SUM_TO_PAY:extended;
                              var vPaySystem, card_nn, trans_code:string):boolean;
    function Pay_Ingenico(SUM_TO_PAY:extended; var vPaySystem, card_nn, trans_code:string):boolean;
    function Refund_Ingenico(SUM_TO_Refund:extended; vTransactionID:string; var vPaySystem, card_nn, trans_code:string):boolean;

    procedure PrintResponse(handle: POS_HANDLE);
    // регистрация акцизных марок товара
    function EXCISE_Mark_registration(v:extended; var EXCISE_BAR_CODE:string):boolean;

  //  function RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
//NumFiscal,  NumLocal, OrderDateTime :string; is_prodaga:boolean; ORDERRETNUM:string ):boolean;
     // внести данные о регистрации документа в налоговой
    procedure Set_RRO_DATE_TO_NAKLCAP(IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
        CHECK_NUMLOCAL, CHECK_NUMFISCAL, ORDERDATETIME, QRCODE_REG:string; ID_NAKLCAP_PROTOTYPE:longInt);

    function Need_Register_RRO:boolean;
    function Need_Register_Vozvr_RRO:boolean;
    // получить jpeg образ QR кода в строковом виде
    function GetQRCodeImgStr(QRText :string):string;
    procedure BBRecept_To_Resistr_visualization;
    procedure GetRealizDay;
    procedure SetRecept_To_Registr;
    procedure New_Doc(Sender: TObject; is_CleanNumbSelect:boolean);
    procedure Opl_Bank_Card(vIS_BANK_TRANSACTION_NOT_FISCAL:boolean;
    vCARD_NN_NOT_FISCAL, vCODE_TRANSACTION_NOT_FISCAL:string; isManualInput_Transaktion:boolean);
    function ValidBarcodeOrTelefon(var v_is_carte_Kharkov:boolean):boolean;

  end;

var
  F_SaleDoc: TF_SaleDoc;

 // const c_minBonusBall=0;  // min сумма накопленных бонусных баллов, которые можно использовать для оплаты

function  F_SaleDocDlg(v_id_doc_type:integer; var v_ID_NAKLCAP:longint; vID_DOC_PROTOTYPE:longInt):integer;


implementation
uses UDataModule1, myfuncs,CLIENT_F1,
users_f, grtov_f, UMainForm, Reason_del, System.UITypes, Printers,
 Login_form, ClientClassesUnit1, System.JSON, UDataModule2, reg_server, USaleDocList,Print_Functions,
 Inp_EXCISE_BAR_CODE, DelphiZXingQRCode,Jpeg, System.DateUtils, Math, U_InpBank_Transaction_info,
 ShellAPI, F_new_shtrih_code,
 IngenicoBPOSDeviceUnit, IngenicoOperation;
{$R *.dfm}


function  F_SaleDocDlg(v_id_doc_type:integer; var v_ID_NAKLCAP:longint; vID_DOC_PROTOTYPE:longInt):integer;
var isExestFiscalPrinter:boolean;
begin
 F_SaleDoc:=TF_SaleDoc.Create(Application);
 with F_SaleDoc do
 begin
  try
   ID_DOC_TYPE:=v_id_doc_type;
   ID_NAKLCAP:=v_ID_NAKLCAP;
   ID_DOC_PROTOTYPE:=vID_DOC_PROTOTYPE;
   SetDocInfo;
   EmergencyMode:=False;


   BBPrint_Cash_Receipt.Visible:=True;
   BBRecept_To_Resistr.Visible:=(F_main.RRO_ENABLED=1) and (F_main.MANUAL_CONTROL_RRO=1);

  {
    Fiscal_Printer_Name:='';
    Fiscal_Printer_Index:=-1;
    Not_Fiscal_Printer_Name:='';
    Not_Fiscal_Printer_Index:=-1;
   with Q_PrinterSetup do
   begin
     Close;
     Open;
     First;
     while not EOF do
     begin
       if FieldByName('IS_FISCAL').AsInteger=1 then
       begin
        BBPrint_Fiscal_Cash_Receipt.Visible:=True;
        Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;

       end
       else
       begin
        BBPrint_Cash_Receipt.Visible:=True;
        Not_Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Not_Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;
       end;
      Next;
     end;
     Close;
   end;
  }
   result:=ShowModal;

  finally
    if result=mrOk then v_ID_NAKLCAP:=ID_NAKLCAP
    else v_ID_NAKLCAP:=-1;

   FreeAndNil(F_SaleDoc);
  end;
 end;
end;



procedure TF_SaleDoc.SetDocInfo;
begin
  DM1.QDocType_info.Close;
  DM1.QDocType_info.Parameters.ParamByName('ID_DT').Value:=ID_DOC_TYPE;
  DM1.QDocType_info.Open;
  Caption:=DM1.QDocType_info.FieldByName('NAMEDOC').AsString;
//  ID_CLIENT:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
//  CLI_D:=DM1.QDocType_info.FieldByName('CLI_D').AsString;
  ID_KATEGOR_CLI_D:=DM1.QDocType_info.FieldByName('ID_KATEG_CLI').AsInteger;
  KATEGOR_D:=DM1.QDocType_info.FieldByName('KATEGOR').AsString;
//  ID_CLI_K:=F_main.ID_TRADE_POINT; // DM1.QDocType_info.FieldByName('ID_CLI_K').AsInteger;
//  CLI_K:=F_main.NAME_TRADE_POINT;
  ID_KATEGOR_CLI_K:=DM1.QDocType_info.FieldByName('ID_KATEG_CLI_K').AsInteger;
  KATEGOR_K:=DM1.QDocType_info.FieldByName('KATEGOR_K').AsString;
  SCH_D:= DM1.QDocType_info.FieldByName('ID_SCH_D').AsString;
  SCH_K:=DM1.QDocType_info.FieldByName('ID_SCH_K').AsString;
  PRICE_KATEG:=DM1.QDocType_info.FieldByName('SALES_CATEGOR').AsInteger;
  TIME_DEFAULT:=DM1.QDocType_info.FieldByName('TIME_DEFAULT').AsFloat;

  DT_Date_doc.DateTime:=F_main.D_Work.DateTime;
  DT_Time_doc.Time:=DM1.QDocType_info.FieldByName('TIME_DEFAULT').AsFloat;
  DT_Date_doc.Time:= DT_Time_doc.Time;

  
 

  case ID_DOC_TYPE of
    200:
      begin
        BBPay.Caption:='Добав.товар'; // продажа
        BBPrint_Cash_Receipt.Caption:='Чек';

        BBRecept_To_Resistr.Visible:=(F_main.RRO_ENABLED=1) and (F_main.MANUAL_CONTROL_RRO=1);
        BBRecept_To_Resistr_visualization;

        BBBonusCard.Visible:=True;
        Label2.Caption:='Сумма по чеку';
        Label5.Visible:=True;
        E_OPL_BONUS.Visible:=True;
        BB_OPL_BONUS.Visible:=True;

        Label8.Visible:=True;

        Label8.Caption:='К оплате с учетом бонусов';


        E_TOT_MONEY.Visible:=True;
        BB_Pay_Bank_Not_Fiscal.Caption:='Оплата банк картой';
        BB_Pay_Bank_Not_Fiscal.Visible:=True;

        Label3.Caption:='Получено наличными';

        ID_CLIENT:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
        CLI_D:=DM1.QDocType_info.FieldByName('CLI_D').AsString;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=false;
        ID_VENDOR:=-1;
        Label11.Caption:='Цена уценки';
      end;

    204:
      begin
        BBPay.Caption:='Вернуться к товарам'; // возвраты
        BBPrint_Cash_Receipt.Caption:='Сохранить';

        BBRecept_To_Resistr.Visible:=(F_main.RRO_ENABLED=1) and (F_main.MANUAL_CONTROL_RRO=1);
        BBRecept_To_Resistr_visualization;


        BBBonusCard.Visible:=False;
        Label2.Caption:='Сумма к возврату по чеку';
        Label5.Visible:=False;
        E_OPL_BONUS.Visible:=False;
        BB_OPL_BONUS.Visible:=False;
        Label8.Visible:=True;

        Label8.Caption:='К возврату';

        E_TOT_MONEY.Visible:=True;
        BB_Pay_Bank_Not_Fiscal.Caption:='Возврат на банк карту';
        BB_Pay_Bank_Not_Fiscal.Visible:=True;

        Label3.Caption:='Возвращено наличыми';

        ID_CLI_K:=DM1.QDocType_info.FieldByName('ID_CLI_K').AsInteger;
        CLI_K:=DM1.QDocType_info.FieldByName('CLI_K').AsString;
        ID_CLIENT:=F_main.ID_TRADE_POINT;
        CLI_D:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_K, CLI_K]);
        GroupBoxCLI_SELECT.Visible:=false;
        ID_VENDOR:=-1;
        Label11.Caption:='Цена по чеку';
       end;

    206:      //инвентаризация  товаров
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        Panel10.Visible:=True;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        ID_CLIENT:=F_main.ID_TRADE_POINT;
        CLI_D:=F_main.NAME_TRADE_POINT;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=false;
        ID_VENDOR:=-1;
        Label11.Caption:='Временная цена';
        Label11.Visible:=False;
        DBEditPRICE_TMP.Visible:=False;
      end;

      242:      //инвентаризация  возвратной тары
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        Panel10.Visible:=True;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        ID_CLIENT:=F_main.ID_TRADE_POINT;
        CLI_D:=F_main.NAME_TRADE_POINT;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=false;
        ID_VENDOR:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
        Label11.Caption:='Временная цена';
        Label11.Visible:=False;
        DBEditPRICE_TMP.Visible:=False;
      end;

      163, 219, 126, 198, 209, 216, 237, 238, 228, 230, 270, 271:
      // заказы тнп, прихоные накладные ТНП, заказы колбасы, мяса, прихол колбася, приход мяса
      // заказы на овощи, приход овощей
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        BB_SkidkaShow.Visible:=False;
        if ID_DOC_TYPE=271 then
        begin
          GroupBoxNacenka.Visible:=True;
          BBCennik.Visible:=False;
          GroupBox4.Visible:=False;
          BB_RegistrBonusCard.Visible:=False;
          CB_SHTRIH_TOV.Visible:=False;
        end;

        Panel10.Visible:=True;
        ID_CLI_K:=DM1.QDocType_info.FieldByName('ID_CLI_K').AsInteger;
        CLI_K:=DM1.QDocType_info.FieldByName('CLI_K').AsString;
        ECLI_ContrAgent.Text:=CLI_K;
        ID_CLIENT:=F_main.ID_TRADE_POINT;
        CLI_D:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_K, CLI_K]);
        GroupBoxCLI_SELECT.Visible:=True;
        ID_VENDOR:=ID_CLI_K;
        Label11.Caption:='Временная цена';
       end;

      220, 211, 217, 223, 225, 232, 234, 305:
      // POS_Возврат ТНП поставщику  , колбасы, мяса, веревки, обрези

      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        Panel10.Visible:=True;
        ID_CLIENT:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
        CLI_D:=DM1.QDocType_info.FieldByName('CLI_D').AsString;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=True;
        ID_VENDOR:=ID_CLIENT;
        Label11.Caption:='Временная цена';
       end;
     276:
      // передача с тт на тт

      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        Panel10.Visible:=True;
        ID_CLIENT:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
        CLI_D:=DM1.QDocType_info.FieldByName('CLI_D').AsString;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=True;
        ID_VENDOR:=-1;
        Label11.Caption:='Временная цена';
       end;



       272:      // списание овощей
       begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBRecept_To_Resistr.Visible:=False;
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_TOT_SUM.Text:='0';
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        E_TOT_NOT_FISCAL_SUM.Text:='0';

        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        Panel10.Visible:=True;
        ID_CLIENT:=DM1.QDocType_info.FieldByName('ID_CLI_D').AsInteger;
        CLI_D:=DM1.QDocType_info.FieldByName('CLI_D').AsString;
        ID_CLI_K:=F_main.ID_TRADE_POINT;
        CLI_K:=F_main.NAME_TRADE_POINT;
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_D, CLI_D]);
        GroupBoxCLI_SELECT.Visible:=True;
        ID_VENDOR:=ID_CLIENT;

        Label11.Caption:='Временная цена';
        Label11.Visible:=False;
        DBEditPRICE_TMP.Visible:=False;
        GroupBoxCLI_SELECT.Visible:=False;
       end;





  end;
  DM1.QDocType_info.Close;

end;


procedure TF_SaleDoc.RadioGroup1Click(Sender: TObject);
begin
 case RadioGroup1.ItemIndex of
  0:
    begin
      CB_Search_BarCode.Checked:=False;
      CarentFieldSeach:='ID_TOV';
      BBAllGrTovSelClick(Sender);
      CheckBox1.Checked:=False;
      CheckBox1.Enabled:=False;
      CheckBox2.Checked:=False;
      CheckBox2.Enabled:=False;

      DM1.ADODSPriceID_TOV.Index:=0;

      DM1.ADODSPriceCODE.Index:=1;
      DM1.ADODSPriceNAME.Index:=2;
      TouchKeyboard_Layout:='NumPad';
    end;

  1:
    begin
      CB_Search_BarCode.Checked:=False;
      CarentFieldSeach:='NAME';
      CheckBox1.Enabled:=True;
      CheckBox2.Enabled:=True;

      DM1.ADODSPriceNAME.Index:=0;

       DM1.ADODSPriceID_TOV.Index:=1;
      DM1.ADODSPriceCODE.Index:=2;
      TouchKeyboard_Layout:='Standard';
    end;
 end;
 TouchKeyboard1.Layout:=TouchKeyboard_Layout;
 dm1.ADODSPrice.IndexFieldNames:=CarentFieldSeach;
 Edit1.SetFocus;
end;

procedure TF_SaleDoc.ReOpenPrice;
begin

// ID_GRTOV_from:=0;
// ID_GRTOV_to:=MaxInt;

 // if ID_DOC_TYPE in [198,217, 216] then ID_grtov_select:=38;// мясо

 case ID_DOC_TYPE of
   198,217, 216: ID_grtov_select:=38;// мясо
   223: ID_grtov_select:=37;// веревки - отходы
   225: ID_grtov_select:=2;// обрези - материалы -промпереработка
   237, 228, 232: ID_grtov_select:=39;// тара пакеты
   242: ID_grtov_select:=16;// возвратная тара ящики
   270,271,272  : ID_grtov_select:=43;// овощи
 //  238: ID_grtov_select:=33;// тара   соусы
 end;

 with QGetGRTOV do
 begin
   Close;
   Parameters.ParamByName('ID_GRTOV').Value:=ID_grtov_select;
   Open;
   grtov_select:=FieldByName('GRUPTOV').AsString;
   LGrup.Caption:=grtov_select;
   Close;
 end;


 DM1.ADODSPrice.DisableControls;
 DM1.ADODSPrice.Active:=False;
 // DM1.ADODSPrice.Parameters.ParamByName('D_DOC').Value:=DT_Date_doc.Date;
 DM1.ADODSPrice.Parameters.ParamByName('IDU').Value:=ID_user_select;
// DM1.ADODSPrice.Parameters.ParamByName('IDG_FROM').Value:=ID_GRTOV_from;
// DM1.ADODSPrice.Parameters.ParamByName('IDG_TO').Value:=ID_GRTOV_To;
 DM1.ADODSPrice.Parameters.ParamByName('IDG').Value:=ID_grtov_select;
 DM1.ADODSPrice.Parameters.ParamByName('ID_VENDOR').Value:=ID_VENDOR;
 DM1.ADODSPrice.Parameters.ParamByName('v_IS_EXISTS_OSTATOK').Value:=RG_Price_View.ItemIndex;

 DM1.ADODSPrice.Active:=True;

 with DM1.QNAVESKI_TMP do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('IDUSER').Value:=DM1.ADODSPrice.fieldByName('ID_USERS').AsInteger;
  Parameters.ParamByName('IDTOV').Value:=DM1.ADODSPrice.fieldByName('ID_TOV').AsInteger;
  Open;
  EnableControls;
 end;

 if ID_grtov_select<>-1 then
 begin
  LGrup.Caption:=grtov_select;
 // dm1.ADODSPrice.Filtered:=True;
 // dm1.ADODSPrice.Filter:='ID_GRTOV='+IntToStr(ID_grtov_select);
 end
 else
 begin
    LGrup.Caption:='Все группы';
  //  dm1.ADODSPrice.Filtered:=False;
 end;

 DM1.ADODSPrice.EnableControls;
end;



procedure TF_SaleDoc.RG_Price_ViewClick(Sender: TObject);
begin
  ReOpenPrice;
  Edit1Change(Sender);
end;

procedure TF_SaleDoc.BBAllGrTovSelClick(Sender: TObject);
begin
 LGrup.Caption:='Все группы';
 ID_grtov_select:=-1;
// ID_GRTOV_from:=0;
// ID_GRTOV_to:=MaxInt;
 ReOpenPrice;
// dm1.ADODSPrice.Filtered:=False;
 CalcCarentResult;

 if not is_Oplata_Go then Edit1.SetFocus;
end;





(*


procedure TF_SaleDoc.CennikPrint(productName, groupName: string; price: extended; id: integer);
var  prc, str1, str2, str3, str4, pId  :string;
ix, iy:integer;
  begin

     prc := Format('%.2f',[price]);
     str1 := Copy(productName, 0, 18);
     str2 := Copy(productName, 19, 18);
     str3 := Copy(productName, 36, 18);
     str4 := Copy(productName, 54);
     pId := 'Код '+IntToStr(id);

        Printer.BeginDoc;
        //productName
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(0, 0,'-----------------------------------------------');

        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(0, 37, str1);
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.TextOut(0, 75, str2);
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.TextOut(0, 115, str3);
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.TextOut(0, 155, str4);

        //price
        Printer.Canvas.Font.Size := 35;   //-
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(20, 190, prc);

        //Pricetag front-side productId
        Printer.Canvas.Font.Size := 8;   //-
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(-1, 300, pId + ' ' + groupName );

        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(0,327,'-----------------------------------------------');
        Printer.EndDoc;

        Printer.BeginDoc;
        GetPrinterInfo;
        pId := IntToStr(id);
        Printer.Canvas.Font.Size := 20;
        Printer.Canvas.Font.Style := [fsBold];

        ix:= PrinterCoordX(2);
        iy:= PrinterCoordY(50);
        Printer.Canvas.TextOut(ix, iy, 'Код');
        ix:= PrinterCoordX(2);
        iy:= PrinterCoordY(100);
        Printer.Canvas.TextOut(ix, iy, pId);
         ix:= PrinterCoordX(2);
        iy:= PrinterCoordY(150);
        Printer.Canvas.Font.Size := 13;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(ix, iy,'-----------------------------------------------');
        Printer.EndDoc;


  end;
  *)

procedure TF_SaleDoc.BBCennikClick(Sender: TObject);
begin
  with DM1.ADODSPrice do
  begin
   // F_main.
    CennikPrint(FieldByName('NAME').AsString+'('+FieldByName('EDIZM').AsString+')',
    FieldByName('GRUPTOV').AsString, FieldByName('PRICE_UCH').AsFloat,
    FieldByName('ID_TOV').AsInteger, FieldByName('CODE').AsString);
  end;
end;

procedure TF_SaleDoc.BBCleanClick(Sender: TObject);
begin
if MessageDlg('Вам действительно необходимо обнулить наборку?', mtWarning,
      [mbNo, mbYes], 0)= mrYes then
begin
 CleanNumbSelect;
end;
end;

procedure TF_SaleDoc.BBGrTovSelClick(Sender: TObject);
begin
if F_grtovDlg= mrOk then
 begin
  LGrup.Caption:=grtov_select;
 // ID_GRTOV_from:=ID_grtov_select;
 // ID_GRTOV_to:=ID_grtov_select;
  ReOpenPrice;
 // dm1.ADODSPrice.Filtered:=True;
 // dm1.ADODSPrice.Filter:='ID_GRTOV='+IntToStr(ID_grtov_select);
  CalcCarentResult;
  Edit1.SetFocus;
 end;
end;


procedure TF_SaleDoc.BBRecept_To_Resistr_visualization;
var Bmp   : Vcl.Graphics.TBitmap;
begin
//  BBRecept_To_Resistr.Glyph.Assign(nil);
  Bmp:=TBitmap.Create;
  try
    Bmp.Width:=BBRecept_To_Resistr.Width;
    Bmp.Height:=BBRecept_To_Resistr.Height;
    Bmp.Canvas.Font.Assign(BBRecept_To_Resistr.Font);
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
    begin
      BBRecept_To_Resistr.Caption:='';//'Рег';
      Bmp.Canvas.Brush.Color:=clRed;
     // BBRecept_To_Resistr.Glyph.LoadFromResourceName(hInstance, 'red_button_16');
    end
    else
    begin
      BBRecept_To_Resistr.Caption:='';//'Не рег';
      Bmp.Canvas.Brush.Color:=clGreen;
    //  BBRecept_To_Resistr.Glyph.LoadFromResourceName(hInstance, 'blue_button_16');
    end;
     
     //по периметру квадрат другого цвета
      Bmp.Canvas.Pen.Color:=clBlack;
      Bmp.Canvas.Pen.Style:=psSolid;
     // Bmp.Canvas.Pen.Width:=1;
      Bmp.Canvas.Rectangle(1,1,Bmp.Width-1, Bmp.Height-1);
      Bmp.Canvas.Brush.Style:=bsSolid;
     Bmp.Canvas.FillRect(Rect(2,2,Bmp.Width-2,Bmp.Height-2));
      //выводим текст в середине
    {Bmp.Canvas.TextOut(
                       (Bmp.Width-Bmp.Canvas.TextWidth(BBRecept_To_Resistr.Caption)) div 2,
                                          (Bmp.Height-Bmp.Canvas.TextHeight(BBRecept_To_Resistr.Caption)) div 2,
                                                              BBRecept_To_Resistr.Caption);}


     BBRecept_To_Resistr.Glyph.Assign(Bmp);
  finally
    Bmp.Free;
  end;

end;

procedure TF_SaleDoc.GetRealizDay;
var D_FROM,D_TO :TDateTime;

begin
  D_FROM:=StartOfTheDay(F_Main.D_Work.Date);
  D_TO:=EndOfTheDay(F_Main.D_Work.Date);
  with QRealizDay do
  begin
    Parameters.ParamByName('D').Value:=F_Main.D_Work.Date;
    Open;
    F_Main.Now_SUM_KAS_RRO:=FieldByName('SUM_KAS_RRO').AsFloat;
    F_Main.Now_SUM_KAS:=FieldByName('SUM_KAS').AsFloat;

    // Р - сумма зарегистрированных продаж РРО в день; М - ограничение макс суммы РРО; Н - незарегистрир; В - сумма всех прлаж
    if (F_main.SHOW_FISCAL_REP=1) then
    StatusBar1.Panels[1].Text:=Format('Р-%8.2f/М-%8.2f/Н-%8.2f/В-%8.2f/КР-%8.2f/К-%8.2f',[
    FieldByName('S_REAL_RRO').AsFloat, F_Main.MAX_REAL_RRO, FieldByName('S_REAL').AsFloat ,
    FieldByName('S_REAL_ALL').AsFloat,FieldByName('SUM_KAS_RRO').AsFloat,
    FieldByName('SUM_KAS').AsFloat]);

  {  if (F_main.SHOW_FISCAL_REP=1) then
     StatusBar1.Panels[1].Text:=Format('H-%8.2f/М-%8.2f',[
     FieldByName('SUM_NAL_RRO').AsFloat, F_Main.MAX_REAL_RRO]); }

    Close;

  end;
end;


procedure TF_SaleDoc.SetRecept_To_Registr;
begin
    F_main.IS_RECEPT_TO_REGISTR_RRO:=not F_main.IS_RECEPT_TO_REGISTR_RRO;
    F_main.BitBtn26.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
    F_main.BitBtn27.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
  //  F_main.BBKassaIn.Visible:= F_main.IS_RECEPT_TO_REGISTR_RRO;
  //  F_main.BBKassaOut.Visible:= F_main.IS_RECEPT_TO_REGISTR_RRO;
 //   F_main.BBInkassacia.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
 //   F_main.BBZatraty.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
    BBRecept_To_Resistr_visualization;


end;

procedure TF_SaleDoc.BBRecept_To_ResistrClick(Sender: TObject);
begin
  SetRecept_To_Registr;
  F_main.Last_IS_RECEPT_TO_REGISTR_RRO:=F_main.IS_RECEPT_TO_REGISTR_RRO;

end;

procedure TF_SaleDoc.BBResetClick(Sender: TObject);
begin
{// if MessageDlg('Вам действительно необходимо обновить прайс? При этом обнулится наборка.', mtWarning,
//      [mbNo, mbYes], 0)= mrYes then
// begin
  dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@ID_USER']:=id_user_select;
  dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@D_WORK']:=DT_Date_doc.DateTime; // F_Main.D_Work.Date;
  dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@IN_TRANSACTION']:=1;  // открыть транзакцию
  dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@ID_CLIENT']:=id_cli_k;
  dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;

  dm1.SP_SET_USER_PRICELIST.ExecProc;
  if dm1.SP_SET_USER_PRICELIST.Parameters.ParamValues['@ER']=0
  then
  begin
   ReOpenPrice;

  end
  else MessageDlg('Ошибка при обновлении прайс-листа!', mtError,
      [mbOk], 0);
// end;
}

 ReOpenPrice;

end;

{
function TF_SaleDoc.Valid_Oplata():boolean;
var Sum_Opl,  Sum_Opl_Fiscal:extended;
begin
  result:=True;
  if ID_DOC_TYPE<>200 then Exit;   // проверять только на продаже

  try
    SUM_OPL_NAL:=StrToFloat(E_OPL_NAL.Text);         // сумма покупателя нефискалиными наличными
 except
    MessageDlg('Получено нефискалиными наличными не число!', mtError,[mbOk], 0);
    E_OPL_NAL.SetFocus;
    result:=False;
    exit;
  end;

   try
    SUM_OPL_NAL_FISCAL:=StrToFloat(E_OPL_NAL_FISCAL.Text);         // сумма покупателя фискалиными наличными
 except
    MessageDlg('Получено фискалиными наличными не число!', mtError,[mbOk], 0);
    E_OPL_NAL.SetFocus;
    result:=False;
    exit;
  end;

  try
    SUM_OPL_BONUS:=StrToFloat(E_OPL_BONUS.Text);       // сумма оплаты бонусами
  except
    MessageDlg('Получено бонусами не число!', mtError,[mbOk], 0);
    E_OPL_BONUS.SetFocus;
    result:=False;
    exit;
  end;

  //  SUM_OPL_CARD:=0.0;    // пока нет реализ оплаты банковской картой

    Sum_Opl:=SUM_OPL_NAL+SUM_OPL_BONUS+SUM_OPL_CARD;
    if (Sum_Opl>eps) and ((Sum_Opl>=TOT_MONEY) or (abs(Sum_Opl-TOT_MONEY)<eps)) then
    begin
            // сумма сдачи
     SUM_SDACHA := Sum_Opl-TOT_MONEY;
    end
    else
    begin
      MessageDlg('Получено денег нефискалиных меньше чем сумма к нефискальной оплате!', mtError,[mbOk], 0);
      E_OPL_NAL.SetFocus;
      result:=False;
      exit;
    end;

    Sum_Opl_Fiscal:=SUM_OPL_NAL_FISCAL+SUM_OPL_CARD_FISCAL;
    if (Sum_Opl_Fiscal>eps) and ((Sum_Opl_Fiscal>=TOT_MONEY_FISCAL) or (abs(Sum_Opl_Fiscal-TOT_MONEY_FISCAL)<eps)) then
    begin
            // сумма сдачи
     SUM_SDACHA_FISCAL := Sum_Opl_Fiscal-TOT_MONEY_FISCAL;
    end
    else
    begin
      MessageDlg('Получено денег фискалиных меньше чем сумма к фискальной оплате!', mtError,[mbOk], 0);
      E_OPL_NAL.SetFocus;
      result:=False;
      exit;
    end;



end;

}

procedure TF_SaleDoc.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSPrice.DataSet.DisableControls;
 if (RadioGroup1.ItemIndex in [0,1]) then
  begin
  if not dm1.ADODSPrice.Locate(CarentFieldSeach, Edit1.Text,[loPartialKey]) then
   MessageDlg('Товар не найден!', mtError,[mbOk], 0);

  end
  else
  begin

  with DM1.DSPrice.DataSet do
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
  end;

 DM1.DSPrice.DataSet.EnableControls;
end;

procedure TF_SaleDoc.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSPrice.DataSet.DisableControls;
 with DM1.DSPrice.DataSet do
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

 DM1.DSPrice.DataSet.EnableControls;

end;

procedure TF_SaleDoc.BBSel_CLI_ContrAgentClick(Sender: TObject);
begin
  if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
  begin
    case ID_DOC_TYPE of
      163, 219, 270,271:      // заказы ТНП, приход ТНП, заказы овощей, приход овощей
      begin
       ID_CLI_K:= ID_client_select_1;
       CLI_K:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_K;
       ID_VENDOR:=ID_CLI_K;
       if ID_CLI_K=29546 then  // Борки мясо
       begin
        ID_VENDOR:=-1;
        ID_grtov_select:=38;// мясо
       end;

      // if CB_AllPriceList.Checked then ID_VENDOR:=-1
      // else ID_VENDOR:=ID_CLI_K;
       ReOpenPrice;
      end;
       126:      // заказы колбасы
      begin
       ID_CLI_K:= ID_client_select_1;
       CLI_K:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_K;
       ID_VENDOR:=-1;//ID_CLI_K;
       ReOpenPrice;
      end;

       198, 216:      // заказы  мяса , приход мяса
      begin
       ID_CLI_K:= ID_client_select_1;
       CLI_K:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_K;
       ID_VENDOR:=-1;

       ID_grtov_select:=38;
       ReOpenPrice;
      end;

      237:      // заказы платн тары с НМК
      begin
       ID_CLI_K:= ID_client_select_1;
       CLI_K:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_K;
       ID_VENDOR:=-1;//ID_CLI_K;
       ID_grtov_select:=39;
       ReOpenPrice;
      end;

      238:      // заказы  товаров с НМК
      begin
       ID_CLI_K:= ID_client_select_1;
       CLI_K:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_K;
       ID_VENDOR:=-1;//ID_CLI_K;
      // ID_grtov_select:=33;
       ReOpenPrice;
      end;
      305:
      // Заказы наВозврат ТНП поставщику
      begin
       ID_CLIENT:= ID_client_select_1;
       CLI_D:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_D;
       ID_VENDOR:=ID_CLIENT;
       ReOpenPrice;
      end;

      220, 211, 217, 223, 225, 232, 234,
      272:
      // POS_Возврат ТНП поставщику, колбасы, мяса , веревки, обрези, возврат овощей
      begin
       ID_CLIENT:= ID_client_select_1;
       CLI_D:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_D;
       ID_VENDOR:=ID_CLIENT;
       ReOpenPrice;
      end;
      276:
      //  передача с тт на тт
      begin
       ID_CLIENT:= ID_client_select_1;
       CLI_D:=client_select_1;
       ECLI_ContrAgent.Text:=CLI_D;
       ID_VENDOR:=-1;
       ReOpenPrice;
      end;
    end;

    with ADS_NOT_SAVED_DOC do
    begin
     Close;
     Parameters.ParamByName('ID_USER').Value:= id_user_select;
     Open;
     if RecordCount>0 then
     begin
       Edit;
       FieldByName('ID_DOC_TYPE').AsInteger:=ID_DOC_TYPE;
       FieldByName('ID_CLI_D').AsInteger:=ID_CLIENT;
       FieldByName('ID_CLI_K').AsInteger:=ID_CLI_K;
       FieldByName('NN').AsString:=EN.Text;
       FieldByName('D').AsFloat:=DT_Date_doc.Datetime;
       Post;
       Close;
     end
     else
     begin
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
      ADOCommandInsertNOT_SAVED_DOC.Execute;
     end;
    end;

  end;
end;

procedure TF_SaleDoc.BB_CancelBonusCard_InfoClick(Sender: TObject);
begin
      Panel_Reg_BonusCard.Visible:=False;
      PanelSearch.Visible:=PanelSearch_Visible_State;
      Panel_Oplata.Visible:=Panel_Oplata_Visible_State;
      BBPay.Enabled:=BBPay_State;
      BBPrint_Cash_Receipt.Enabled:=BBPrint_Cash_Receipt_State;

      BBBonusCard.Enabled:=BBBonusCard_State;
      BB_RegistrBonusCard.Enabled:=True;
      if PanelSearch.Visible then
      begin
        Edit1.SetFocus;
        EditElementInFocus:=Edit1;
      end;
      if Panel_Oplata.Visible then
      begin
        E_OPL_NAL.SetFocus;
        EditElementInFocus:=E_OPL_NAL;
      end;


end;



procedure TF_SaleDoc.BB_NUM_LKClick(Sender: TObject);
begin

  if TouchKeyboard_Layout='NumPad' then
  begin
    TouchKeyboard_Layout:='Standard';
    BB_NUM_LK.Caption:='1234...';
  end
  else
  begin
    TouchKeyboard_Layout:='NumPad';
    BB_NUM_LK.Caption:='АБВГ...';
  end;
  TouchKeyboard1.Layout:=TouchKeyboard_Layout;

  if EditElementInFocus<>nil then
  begin
    if EditElementInFocus.ClassType=TEdit then
    begin
      TEdit(EditElementInFocus).SetFocus;
    end;
    if EditElementInFocus.ClassType=TDateTimePicker then
    begin
      TDateTimePicker(EditElementInFocus).SetFocus;
    end;
  end;

end;

procedure TF_SaleDoc.BB_RegistrBonusCardClick(Sender: TObject);
begin
  // ClientInfo_DLG('');
 PanelSearch_Visible_State:=PanelSearch.Visible;
 Panel_Oplata_Visible_State:=Panel_Oplata.Visible;
 BBPay_State:=BBPay.Enabled;
 BBPrint_Cash_Receipt_State:=BBPrint_Cash_Receipt.Enabled;
 BBBonusCard_State:=BBBonusCard.Enabled;

 BBPay.Enabled:=False;
 BBPrint_Cash_Receipt.Enabled:=false;

 BBBonusCard.Enabled:=False;

 PanelSearch.Visible:= False;
 Panel_Oplata.Visible:=False;

 E_INN.Text:=Trim(Edit_BonusCard.Text);

 DTP_Birthday.Date:=Date();
 E_Cli.Text:='';
 E_Tel.Text:='';
 E_Email.Text:='';
 Panel_Reg_BonusCard.Visible:=True;
 BB_RegistrBonusCard.Enabled:=False;

  E_INN.SetFocus;
  EditElementInFocus:=E_INN;

end;

procedure TF_SaleDoc.BB_SkidkaShowClick(Sender: TObject);
begin
  RefreshSkidka;
  CalcCarentResult;

end;


procedure TF_SaleDoc.BB_WithoutOplatyClick(Sender: TObject);
begin
          D_ROUND_TOT_SUM_NOT_FISCAL:=0;
          E_D_RoundNotFiscal.Text:='0';
          TOT_SUM_NOT_FISCAL:=0;
          E_TOT_NOT_FISCAL_SUM.Text:='0';
          TOT_SUM:=0;
          E_TOT_SUM.Text:='0';
          SUM_OPL_BONUS:=0.0;
          E_OPL_BONUS.Text:='0';
          SUM_SDACHA := 0.0;
          E_SDACHA.Text:='';
          SUM_SDACHA_TO_BONUS_CARD := 0.0;
          E_SDACHA_TO_BONUS_CARD.Text:='';
          SUM_SDACHA_FISCAL := 0.0;

          E_OPL_NAL.Text :='';
          SUM_OPL_NAL:=0.0;

          SUM_OPL_NAL_Fiscal:=0.0;

          // если предыдущая оплата была безнал и последняя ручная установка IS_RECEPT_TO_REGISTR_RRO = false
          // то устанавливаем после безнал оплаты последнюю установку IS_RECEPT_TO_REGISTR_RRO
          if not F_Main.Last_IS_RECEPT_TO_REGISTR_RRO  and F_Main.Last_IS_BEZNAL_OPL then
          begin
            F_main.IS_RECEPT_TO_REGISTR_RRO:=F_Main.Last_IS_RECEPT_TO_REGISTR_RRO;
            F_main.BitBtn26.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
            F_main.BitBtn27.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;

          end;

          F_main.Last_IS_BEZNAL_OPL:=False;


          Action_New_DocExecute(Sender);
end;

procedure TF_SaleDoc.BB_InpOplBankClick(Sender: TObject);
begin
  Label_Opl_Bank.Caption:='Ручной ввод данных обоплате банковской картой';
  Opl_Bank_Card(False,'','', True);
  Label_Opl_Bank.Caption:='';
end;

function TF_SaleDoc.ValidInfoCLI:boolean;
begin
  result:=true;

  if Trim(E_INN.Text)='' then
  begin
     MessageDlg('Не введен штрихкод бонусной карты!', mtError, [mbOk], 0);
     E_INN.SetFocus;
     result:=False;
     exit;
  end;


  if Trim(E_Cli.Text)='' then
  begin
     MessageDlg('Не заполнено ФИО покупателя!', mtError, [mbOk], 0);
     E_Cli.SetFocus;
     result:=False;
     exit;
  end;

  // if Trim(E_Tel.Text)='' then
  if not ValidateTel(E_Tel.Text) then
  begin
     MessageDlg('Не заполнен телефон покупателя!', mtError, [mbOk], 0);
     E_Tel.SetFocus;
     result:=False;
     exit;
  end;

  if Trim(E_Email.Text)<>'' then
  begin
    if not ValidateEmail(E_Email.Text) then
    begin
       MessageDlg('Неправильно введен Email!', mtError, [mbOk], 0);
       E_Email.SetFocus;
       result:=False;
       exit;
    end;
  end;





end;

procedure TF_SaleDoc.BB_SaveBonusCard_InfoClick(Sender: TObject);
begin
if ValidInfoCLI then
begin
 // сохранить введенную информацию
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@ID_TRADE_POINT']:=F_main.ID_TRADE_POINT;
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@INN']:=Trim(E_INN.Text);
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@CLIENT']:=Trim(E_Cli.Text);
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@TEL']:=Trim(E_Tel.Text);
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@EMAIL']:=Trim(E_Email.Text);
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@BIRTHDAY']:=DTP_Birthday.DateTime;
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@ID_USER']:=id_user_select;
    dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.ExecProc;
    if dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@ER']<>0  then
    begin
       MessageDlg(dm1.SP_REGISTER_CLI_FOR_BONUS_CARD.Parameters.ParamValues['@ER_COMMENT'],
       mtError,[mbOk], 0);

    end
    else
    begin
      MessageDlg('Бонусная карта зарегистрирована!', mtInformation,[mbOk], 0);

    end;

    Panel_Reg_BonusCard.Visible:=False;
    PanelSearch.Visible:=PanelSearch_Visible_State;
    Panel_Oplata.Visible:=Panel_Oplata_Visible_State;

    BBPay.Enabled:=BBPay_State;
    BBPrint_Cash_Receipt.Enabled:=BBPrint_Cash_Receipt_State;

    BBBonusCard.Enabled:=BBBonusCard_State;

    BB_RegistrBonusCard.Enabled:=True;

     if PanelSearch.Visible then
      begin
        Edit1.SetFocus;
        EditElementInFocus:=Edit1;
      end;
      if Panel_Oplata.Visible then
      begin
        E_OPL_NAL.SetFocus;
        EditElementInFocus:=E_OPL_NAL;
      end;


end;
end;

procedure TF_SaleDoc.CleanNumbSelect;
begin

SetDocInfo; // установки шапки по умолчанию для каждого нового документа


TOT_SUM:=0.0;
TOT_NUM:=0.0;   // общее сумма, кол-во
TOT_COUNT_SEL_TOV:=0;   // общее кол-во наименований
SUM_OPL_NAL:=0.0;         // сумма покупателя наличными
SUM_SDACHA:=0.0;
SUM_SDACHA_TO_BONUS_CARD:=0.0;
SUM_BONUS_BALL:=0.0;
SUM_BALL_NEW:=0.0;
SUM_BALL_CALC:=0.0;
SUM_BALL_CALC_KOLBASA:=0.0;
SUM_BALL_CALC_MYASO:=0.0;
SUM_BALL_CALC_TNP:=0.0;

SUM_OPL_BONUS:=0.0;
SUM_OPL_CARD:=0.0;
SUM_OPL_CARD_FISCAL:=0.0;

TOT_SUM_NOT_FISCAL:=0.0;
TOT_SUM_FISCAL:=0.0;


E_TOT_SUM.Text:=Format('%.2f',[TOT_SUM]);
E_OPL_NAL.Text:=Format('%.2f',[SUM_OPL_NAL]);
E_SDACHA.Text:=Format('%.2f',[SUM_SDACHA]);
E_SDACHA_TO_BONUS_CARD.Text:=Format('%.2f',[SUM_SDACHA_TO_BONUS_CARD]);
// E_OPL_BONUS.Text:=Format('%.2f',[Int(SUM_OPL_BONUS)]);
E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);

E_TOT_NOT_FISCAL_SUM.Text:=Format('%.2f',[TOT_SUM_NOT_FISCAL]);




    dm1.SP_CLEAR_PRICE_SELECT.Parameters.ParamValues['@ID_USER']:=id_user_select;
    dm1.SP_CLEAR_PRICE_SELECT.ExecProc;
    if dm1.SP_CLEAR_PRICE_SELECT.Parameters.ParamValues['@ER']<>0
    then
     MessageDlg('Ошибка при обнулении прайс-листа!', mtError,
      [mbOk], 0);




//ReOpenPrice;
//CalcCarentResult;
end;



 (*


procedure TF_SaleDoc.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
if Field.FieldName='NUMB' then
begin
 if DBGrid1.DataSource.DataSet.FieldByName('NUMB').AsFloat>=eps then
 begin
    DBGrid1.Canvas.Font.Color := clGreen;
    DBGrid1.Canvas.Font.Style:=[fsBold];
 end;
end;

if Field.FieldName='PRICE_TMP' then
begin
 if DBGrid1.DataSource.DataSet.FieldByName('PRICE_TMP').AsFloat>=eps then
 begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.Font.Style:=[fsBold];
 end;
end;

DBGrid1.DefaultDrawDataCell(Rect,field, State);

end;

procedure TF_SaleDoc.DBGrid1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
   var  RowCount,i :integer;
begin
 RowCount:=TMyDBGrid(Sender).VisibleRowCount;
  if EventInfo.GestureID=3 then // движение пальца вниз - прокрутка DBGridа вверх по направлению к началу списка
  begin
    if (TDBGrid(Sender).DataSource.DataSet.RecNo<(RowCount-1)) then
    for i := 1 to RowCount-TDBGrid(Sender).DataSource.DataSet.RecNo do
      if not TDBGrid(Sender).DataSource.DataSet.Eof then TDBGrid(Sender).DataSource.DataSet.Next;

     for i := 1 to RowCount-1 do
      if not TDBGrid(Sender).DataSource.DataSet.Eof then TDBGrid(Sender).DataSource.DataSet.Next;

         {
         MessageDlg('N='+IntToStr((TMyDBGrid(Sender)).VisibleRowCount), mtInformation,[mbOk], 0);
          MessageDlg('H='+IntToStr((TMyDBGrid(Sender)).RowHeights[1]), mtInformation,[mbOk], 0);
          MessageDlg('Y='+IntToStr(EventInfo.Location.Y), mtInformation,[mbOk], 0);
          MessageDlg('T='+IntToStr(EventInfo.TapLocation.y), mtInformation,[mbOk], 0);
          }
         // (TDBGrid(Sender) as TCustomGrid).VisibleRowCount;
         //TDBGrid(Sender).DataSource.DataSet.Prior;

    Handled := True;
  end;
   if EventInfo.GestureID=4 then // движение пальца вверх - прокрутка DBGridа вниз по направлению к концу списка
   begin

    for i := 1 to RowCount-1 do
    if not TDBGrid(Sender).DataSource.DataSet.Bof then TDBGrid(Sender).DataSource.DataSet.Prior;
    Handled := True;
  end;
end;

*)




procedure TF_SaleDoc.DBEditPRICE_TMPExit(Sender: TObject);
begin
 if dm1.ADODSPrice.State in [dsEdit] then  dm1.ADODSPrice.Post;
end;

procedure TF_SaleDoc.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin

if (DBgrid1.SelectedRows.CurrentRowSelected) or (gdSelected in State) then
  begin
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.Brush.Color :=   $f8efd5;// Photoshop  d5eff8
  end;


 if Field.FieldName='NUMB' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('NUMB').AsFloat>=Eps then
      DBGrid1.Canvas.Font.Color := clBLUE;
  end;

  if Field.FieldName='PRICE_TMP' then
  begin
    // if DBGrid1.DataSource.DataSet.FieldByName('PRICE_TMP').AsFloat>=Eps then
    if SimpleRoundTo(DBGrid1.DataSource.DataSet.FieldByName('PRICE_TMP').AsFloat,-2)>=0.01 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;

   if Field.FieldName='NUMB_PROTOTYPE' then
  begin
    // if DBGrid1.DataSource.DataSet.FieldByName('PRICE_TMP').AsFloat>=Eps then
    if SimpleRoundTo(DBGrid1.DataSource.DataSet.FieldByName('NUMB_PROTOTYPE').AsFloat,-3)>=0.001 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_SaleDoc.DBGrid3CellClick(Column: TColumn);
begin

  if dm1.ADODSPrice.Active then
  dm1.ADODSPrice.Locate('ID_TOV',
  DBGrid3.DataSource.DataSet.FieldByName('ID_TOV').asInteger,[loCaseInsensitive]);

end;

procedure TF_SaleDoc.DBGrid3DblClick(Sender: TObject);
begin
  if dm1.ADODSPrice.Active then
   dm1.ADODSPrice.Locate('ID_TOV',
   DBGrid3.DataSource.DataSet.FieldByName('ID_TOV').asInteger,[loCaseInsensitive]);
end;

procedure TF_SaleDoc.DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
if (DBgrid3.SelectedRows.CurrentRowSelected) or (gdSelected in State) then
  begin
    DBGrid3.Canvas.Font.Color := clBlack;
    DBGrid3.Canvas.Brush.Color :=   $f8efd5;// Photoshop  d5eff8
  end;

  DBGrid3.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_SaleDoc.DTP_BirthdayClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.DT_Date_docExit(Sender: TObject);
begin

 {with ADS_NOT_SAVED_DOC do
 begin
   Close;
   Parameters.ParamByName('ID_USER').Value:= id_user_select;
   Open;
   Edit;
   FieldByName('D').AsFloat:=DT_Date_doc.DateTime;
   Post;
   Close;
 end;}

    with ADS_NOT_SAVED_DOC do
    begin
     Close;
     Parameters.ParamByName('ID_USER').Value:= id_user_select;
     Open;
     if RecordCount>0 then
     begin
       Edit;
       FieldByName('ID_DOC_TYPE').AsInteger:=ID_DOC_TYPE;
       FieldByName('ID_CLI_D').AsInteger:=ID_CLIENT;
       FieldByName('ID_CLI_K').AsInteger:=ID_CLI_K;
       FieldByName('NN').AsString:=EN.Text;
       FieldByName('D').AsFloat:=DT_Date_doc.Datetime;
       Post;
       Close;
     end
     else
     begin
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
      ADOCommandInsertNOT_SAVED_DOC.Execute;
     end;
    end;


end;

procedure TF_SaleDoc.Edit1Change(Sender: TObject);
var CODETOV:longint;
NUMB:extended;
begin
  if Trim(Edit1.Text)<>'' then
  begin
    //  поиск по любому полю кроме штрихкода
    if not CB_Search_BarCode.Checked then dm1.ADODSPrice.Locate(CarentFieldSeach, Edit1.Text,[loPartialKey]);

  end;

end;


procedure TF_SaleDoc.Edit1Click(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;



procedure TF_SaleDoc.Edit1Exit(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
  begin
   if RadioGroup1.ItemIndex in [0] then
    begin
      if Trim(Edit1.Text)<>Trim(dm1.ADODSPrice.FieldByName(CarentFieldSeach).AsString) then
      begin
        MessageDlg('Товар с кодом '+Edit1.Text+' не найден', mtError,[mbOk], 0);
        StatusBar1.Panels[0].text:='Товар с кодом '+Edit1.Text+' не найден';
      end;
    end;


  end;

end;

procedure TF_SaleDoc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var CODETOV:longint;
  NUMB:extended;
  bar_code:String;
begin
  if Key = VK_RETURN then
  begin
    if Trim(Edit1.Text)<>'' then
    begin
      if CB_Search_BarCode.Checked then   //  поиск по штрихкоду
      begin
        bar_code:= Trim(Edit1.text);
        // Поиск товара и определение количества закодорованного в штрихкоде
        with SP_SEARCH_TOV_FROM_BARCODE do
        begin
          Parameters.ParamValues['@BARCODE']:=bar_code;
          ExecProc;
          if Parameters.ParamValues['@ER']=0 then
          begin
            CODETOV:=Parameters.ParamValues['@ID_TOV'];
            if CODETOV=-1 then
            begin
              MessageDlg('Товар со штрихкодом '+bar_code+' не найден', mtError,[mbOk], 0);
              exit;
            end;
            Edit1.Text := IntToStr(CODETOV);
            dm1.ADODSPrice.Locate(CarentFieldSeach, Edit1.Text,[loPartialKey]);
            NUMB:=Parameters.ParamValues['@NUMB'];
            if NUMB>Eps then // в штрихкоде есть количество товара
            begin
              EWeight.Text:=FloatToStr(NUMB);
            end;
          end
          else MessageDlg('Ошибка поиска штрихкода '+bar_code, mtError,[mbOk], 0);
        end;
      end;

    end;
  end;
end;

function TF_SaleDoc.ValidBarcodeOrTelefon(var v_is_carte_Kharkov:boolean):boolean;
var sbc, pref:string;
lc:integer;
r:boolean;

begin
  sbc:=Trim(Edit_BonusCard.Text);
//  1234567890123
//  2019000141338 штрихкод карты
//  0996644042    телефон
//  XC00523444   карта харьковчанина
  v_is_carte_Kharkov:=False;
  lc:=Length(sbc);
  if IsDigit(sbc) then
  begin
    if lc=13 then  // проверка контрольной суммы штрихкода EAN13
    begin
     r:=Valid_EAN13(sbc);
    end
    else
    begin
      r:=(lc=10);   // телефон

    end;
  end
  else
  begin
     // карта харьковчанина
    pref:=AnsiUpperCase(Copy(sbc,1,2));
    r:=(lc=10) and ((pref ='XC') or (pref ='ХС') or (pref ='ЧС'));   // латиница или кориллица
    v_is_carte_Kharkov:=r;
  end;

  result:=r;
end;

procedure TF_SaleDoc.Edit_BonusCardKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var v_is_carte_Kharkov, r:boolean;
begin
  if Key=vk_return then
  begin
    Сarte_Kharkov:='';
    is_carte_Kharkov:=False;
    r:= ValidBarcodeOrTelefon(v_is_carte_Kharkov);
    if r then
    begin
      if not v_is_carte_Kharkov then FindBonusCard
      else
      begin
        is_Registered_Client:=false;
        IS_PENSIONER:=0;
        is_carte_Kharkov:=True; // карта харьковчанина
        Сarte_Kharkov:=Trim(Edit_BonusCard.Text);  // карта харьковчанина
        Label_Client.Caption:=Format('Категория - %s; Клиент - %s', ['Карта харьковчанина', Сarte_Kharkov ]);
        BB_SkidkaShowClick(Sender);

        if not F_main.IS_RECEPT_TO_REGISTR_RRO then SetRecept_To_Registr;   //продажу по карте харьковчанина всегда регистрировать ПРРО

      end;
      end
    else  MessageDlg('Ошибка в штрихкоде карты или телефоне!', mtError, [mbOk], 0);
  end;

end;


procedure TF_SaleDoc.ENExit(Sender: TObject);
begin
{ with ADS_NOT_SAVED_DOC do
 begin
   Close;
   Parameters.ParamByName('ID_USER').Value:= id_user_select;
   Open;
   Edit;
   FieldByName('NN').Asstring:=EN.Text;
   Post;
   Close;
 end; }

    with ADS_NOT_SAVED_DOC do
    begin
     Close;
     Parameters.ParamByName('ID_USER').Value:= id_user_select;
     Open;
     if RecordCount>0 then
     begin
       Edit;
       FieldByName('ID_DOC_TYPE').AsInteger:=ID_DOC_TYPE;
       FieldByName('ID_CLI_D').AsInteger:=ID_CLIENT;
       FieldByName('ID_CLI_K').AsInteger:=ID_CLI_K;
       FieldByName('NN').AsString:=EN.Text;
       FieldByName('D').AsFloat:=DT_Date_doc.Datetime;
       Post;
       Close;
     end
     else
     begin
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
      ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
      ADOCommandInsertNOT_SAVED_DOC.Execute;
     end;
    end;



end;

function TF_SaleDoc.LoadBonusCli(INN:string; var vSUM_BALL:extended; var vSDK:extended):boolean;
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
      result_q:=server.get_BonusCli_proc(INN);
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

        if MemberName='SUM_BALL' then
          vSUM_BALL:=StrToFloat(JPair.JsonValue.Value);

         if MemberName='SDK' then
          vSDK:=StrToFloat(JPair.JsonValue.Value);
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
        MessageDlg(comment+E.Message, mtError, [mbOk], 0);
        raise Exception.Create(comment+E.Message);
      end;

   end;

   FreeAndNil(server);
end;  // function TF_main.LoadBonusCli:boolean;


// загрузка инфо о бонусной карте INN клиента
procedure TF_SaleDoc.GetBonusCli(INN:string; v_ID_CLI:longint; var vSUM_BALL, vSDK:extended);
var Save_Cursor:TCursor;
begin
 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
   F_main.RemoteDBConnect;// F_main.ActionConnectRemoteDBExecute(Self);

  if   F_main.is_connect_server then
  begin
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;
        //загрузка инфо о бонусной карте INN клиента
      if LoadBonusCli(INN, vSUM_BALL,vSDK) then
      begin
        MessageDlg('Загрузка бонусов выполнена!', mtInformation, [mbOk], 0);
      end
      else
      begin
        vSUM_BALL:=0.0;
      end;

      Screen.Cursor := Save_Cursor;
      StatusBar1.Panels[0].Text:='';

      if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
       F_main.ActionDisconnectRemoteDBExecute(Self);
  end
  else // нет соединения с сервером - получить локальные данные о бонусах
  begin
   with QBonus_Cli do
   begin
     Close;
     Parameters.ParamByName('ID_CLI').Value:=v_ID_CLI;
     Open;
     vSUM_BALL:=FieldByName('SUM_BALL').AsFloat;
     Close;
   end;

  end;


end;    // procedure TF_SaleDoc.GetBonusCli(INN:string; var vSUM_BALL, vSUM_BALL_FOR_PAY:extended);




function TF_SaleDoc.UpLoadBonusCli(vINN:string; vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS, vSUM_SDACHA_TO_BONUS_CARD:extended):boolean;
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
  SUM_BALL_NEW:=0.0;
  SUM_BALL_CALC:=0.0;
  SUM_BALL_CALC_KOLBASA:=0.0;
  SUM_BALL_CALC_MYASO:=0.0;
  SUM_BALL_CALC_TNP:=0.0;
  try
    server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);
    result_q:=server.save_Bonus_Bales_proc(vINN, vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS,vSUM_SDACHA_TO_BONUS_CARD);
   except
   exit;
  end;

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
          if MemberName='SUM_BALL_NEW' then
            SUM_BALL_NEW:=StrToFloat(JPair.JsonValue.Value);
          if MemberName='SUM_BALL_CALC' then
            SUM_BALL_CALC:=StrToFloat(JPair.JsonValue.Value);
         end;
        if status_oper<>0 then
        begin
          StatusBar1.Panels[0].Text:=comment;
        end
        else
        begin
          StatusBar1.Panels[0].Text:=comment;
          result:=true;

            // локальная корректировка бонусов
          with ADOCommandEditLocalBonus do
          begin
            Parameters.ParamByName('ID_CLI').Value:=ID_CLIENT;
            Parameters.ParamByName('SUM_BALL').Value:= SUM_BALL_NEW;
            Execute;
          end;

        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function TF_main.UpLoadBonusCli:boolean;






// выгрузка инфо о бонусной карте vINN клиента
procedure TF_SaleDoc.SetBonusCli(vINN:string; vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS, vSUM_SDACHA_TO_BONUS_CARD:extended);
var Save_Cursor:TCursor;
begin

 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
    F_main.RemoteDBConnect; // F_main.ActionConnectRemoteDBExecute(Self);
  if   F_main.is_connect_server then
  begin
    try
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;

        //Выгрузка инфо о бонусной карте INN клиента
      if not UpLoadBonusCli(vINN, vS_KOLBASA_NOT_ACTION, vS_MYASO_NOT_ACTION, vS_TNP_NOT_ACTION, vSUM_OPL_BONUS, vSUM_SDACHA_TO_BONUS_CARD) then
      begin
        MessageDlg('Ошибка при выгрузке бонусов!', mtError, [mbOk], 0);
        Screen.Cursor := Save_Cursor;
            // Локальный расчет бонусов
        Local_Calc_Bonus( vSUM_OPL_BONUS);
         if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
          F_main.ActionDisconnectRemoteDBExecute(Self);
        Exit;
      end;

      Screen.Cursor := Save_Cursor;
      MessageDlg('Выгрузка бонусов выполнена!', mtInformation, [mbOk], 0);
      StatusBar1.Panels[0].Text:='';
    except
      MessageDlg('Ошибка при выгрузке бонусов!', mtError, [mbOk], 0);

    end;

    try
      if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
       F_main.ActionDisconnectRemoteDBExecute(Self);
    except
      MessageDlg('Ошибка отключения от удаленной БД!', mtError, [mbOk], 0);
    end;
  end
  else  // нет интернет связи с НМК -- расчет ведем локально
  begin
    // Локальный расчет бонусов
    Local_Calc_Bonus( vSUM_OPL_BONUS);
  end;



end;    // procedure TF_SaleDoc.SetBonusCli(INN:string; var vSUM_BALL, vSUM_BALL_FOR_PAY:extended);


// Локальный расчет бонусов
procedure TF_SaleDoc.Local_Calc_Bonus(vSUM_OPL_BONUS:extended);
var  PER_BONUS_KOLBASA, PER_BONUS_MYASO, PER_BONUS_TNP: extended;
begin
  // определение инфо о % бонусов
  With QBonusPercent do
  begin
    Close;
    Parameters.ParamByName('D').Value:=Now();
    Parameters.ParamByName('IS_PENSIONER').Value:=IS_PENSIONER;
    Open;
    PER_BONUS_KOLBASA:=0.0;    // % скидки
    PER_BONUS_MYASO:=0.0;
    PER_BONUS_TNP:=0.0;

    if RecordCount<>0 then
    begin
      First;

      PER_BONUS_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;    // % скидки
      PER_BONUS_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
      PER_BONUS_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;

    end;
    //----------------------
    if IS_NAMED_SKIDKA in [0, 3] then // для акционных дней по торг сети бонусы на любые карты не начислять
    begin
      if PER_SKIDKA_KOLBASA<>0 then  PER_BONUS_KOLBASA:=0;
      if PER_SKIDKA_MYASO<>0 then  PER_BONUS_MYASO:=0;
      if PER_SKIDKA_TNP<>0 then  PER_BONUS_TNP:=0;
    end;
    //---------------------------
    SUM_BALL_CALC_KOLBASA:=S_KOLBASA_NOT_ACTION*PER_BONUS_KOLBASA/100;
    SUM_BALL_CALC_MYASO:=S_MYASO_NOT_ACTION*PER_BONUS_MYASO/100;
    SUM_BALL_CALC_TNP:=S_TNP_NOT_ACTION*PER_BONUS_TNP/100;
   // SUM_BALL_CALC:=vTOT_SUM*PER_BONUS_KOLBASA/100;
    SUM_BALL_CALC:=SUM_BALL_CALC_KOLBASA + SUM_BALL_CALC_MYASO + SUM_BALL_CALC_TNP;

    SUM_BALL_NEW:=SUM_BONUS_BALL-vSUM_OPL_BONUS+SUM_BALL_CALC+SUM_SDACHA_TO_BONUS_CARD;



    Close;
  end; // With QBonusPercent do

  // локальная корректировка бонусов
  with ADOCommandEditLocalBonus do
  begin
    Parameters.ParamByName('ID_CLI').Value:=ID_CLIENT;
    Parameters.ParamByName('SUM_BALL').Value:= SUM_BALL_NEW;
    Execute;
  end;




end;



procedure TF_SaleDoc.FindBonusCard;
var v_ID_CLI: longint;
v_INN:string;
begin
  is_Registered_Client:=false;
  IS_PENSIONER:=0;
 // штрихкод бонусной карты введен
 // проверка регистрации этой карты
  v_INN:=Trim(Edit_BonusCard.Text);
 if v_INN<>'' then
 begin
  dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@INN']:=v_INN;
  dm1.SP_GET_CLIENT_FOR_INN.ExecProc;
  if dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ER']=0  then
  begin
    v_ID_CLI:= dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ID_CLI'];

    if v_ID_CLI<>Unknown_code then
    begin
      // бонусная карта v_INN зарегистрирована за клиентом v_ID_CLI
      is_Registered_Client:=true;
      ID_CLIENT:=v_ID_CLI;
      CLI_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@CLI'];
      ID_KATEGOR_CLI_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ID_KATEGOR'];
      KATEGOR_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@KATEGOR'];
      BIRTHDAY_CLI:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@BIRTHDAY'];
      IS_PENSIONER:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@IS_PENSIONER'];

      GetBonusCli(v_INN, v_ID_CLI, SUM_BONUS_BALL, SDK_DOLG);


      BB_SkidkaShowClick(Self);

     // RefreshSkidka;
     // CalcCarentResult;
     // SkidkaBirthday;

      case ID_DOC_TYPE of
      200:   // продажа
      begin

        ID_CLIENT:=v_ID_CLI;
        CLI_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@CLI'];
        ID_KATEGOR_CLI_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ID_KATEGOR'];
        KATEGOR_D:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@KATEGOR'];
        E_SDACHA_TO_BONUS_CARD.Visible:=True;
        Label24.Visible:=E_SDACHA_TO_BONUS_CARD.Visible;
      end;
      204:  // возврат
      begin
        ID_CLI_K:=v_ID_CLI;
        CLI_K:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@CLI'];
        ID_KATEGOR_CLI_K:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ID_KATEGOR'];
        KATEGOR_K:=dm1.SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@KATEGOR'];
      end;
      end;


      Label_Client.Caption:=Format('Категория - %s; Клиент - %s; Долг - %.2f', [KATEGOR_D, CLI_D, SDK_DOLG ]);


     {  with ADS_NOT_SAVED_DOC do
       begin
         Close;
         Parameters.ParamByName('ID_USER').Value:= id_user_select;
         Open;
         first;
         Edit;
         FieldByName('ID_CLI_D').AsInteger:=ID_CLIENT;
         FieldByName('ID_CLI_K').AsInteger:=ID_CLI_K;
         Post;

         Close;
       end;  }

      with ADS_NOT_SAVED_DOC do
      begin
       Close;
       Parameters.ParamByName('ID_USER').Value:= id_user_select;
       Open;
       if RecordCount>0 then
       begin
         Edit;
         FieldByName('ID_DOC_TYPE').AsInteger:=ID_DOC_TYPE;
         FieldByName('ID_CLI_D').AsInteger:=ID_CLIENT;
         FieldByName('ID_CLI_K').AsInteger:=ID_CLI_K;
         FieldByName('NN').AsString:=EN.Text;
         FieldByName('D').AsFloat:=DT_Date_doc.Datetime;
         Post;
         Close;
       end
       else
       begin
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
        ADOCommandInsertNOT_SAVED_DOC.Execute;
       end;
      end;






    end
    else   // if v_ID_CLI<>Unknown_code then
    begin
      E_SDACHA_TO_BONUS_CARD.Visible:=False;
      Label24.Visible:=E_SDACHA_TO_BONUS_CARD.Visible;
      // бонусная карта v_INN не зарегистрирована в системе
      if MessageDlg('Эта бонусная карта не зарегистрирована в системе. '+
      'Вы хотите зарегистрировать ее за новым клиентом?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       // регистрация новой бонусной карты;
        SUM_BONUS_BALL:=0.0;
        SUM_BALL_NEW:=0.0;
        SUM_BALL_CALC:=0.0;
        BB_RegistrBonusCardClick(Self);


      end
      else
       Edit_BonusCard.Text:='';


    end;    // else if v_ID_CLI<>Unknown_code then

  end
  else  MessageDlg('Ошибка при запросе наличия регистрации бонусной карты!', mtError,[mbOk], 0);
  Edit_Sum_Bonus_Ball.Text:=Format('%.2f',[SUM_BONUS_BALL]);

 end;
end;





procedure TF_SaleDoc.EWeightChange(Sender: TObject);
var v:extended;
begin

if Trim(EWeight.text)='' then
begin
  exit;
end;

try
    v := strToFloat(Trim(EWeight.text));
  except
    MessageDlg('Навеска не число!', mtError,  [mbOk], 0);
    EWeight.SetFocus;
  end;
end;



procedure TF_SaleDoc.EWeightClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.EWeightKeyPress(Sender: TObject; var Key: Char);
begin
  if Key='.' then Key:=',';
  if Not (Key in ['0'..'9', #8,',',#45])then Key:=#0;
end;

procedure TF_SaleDoc.E_CliClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.E_EmailClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.E_INNClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.E_OPL_BONUSChange(Sender: TObject);
begin
if SUM_BONUS_BALL>=0.01 then
begin

 try
  SUM_OPL_BONUS:=StrToFloat(Trim(E_OPL_BONUS.Text));
  SUM_OPL_BONUS:=Float_cat_to(SUM_OPL_BONUS, 0.1);

  if (SUM_OPL_BONUS-SUM_BONUS_BALL)>Eps then
  begin
    MessageDlg('Оплата бонусами более накопления!', mtError,[mbOk], 0);
    if SUM_BONUS_BALL>TOT_SUM_NOT_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL then  SUM_OPL_BONUS:=TOT_SUM_NOT_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL
    else SUM_OPL_BONUS:=SUM_BONUS_BALL;
    E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);
    E_OPL_BONUS.Setfocus;
  end
  else
  begin
    if (SUM_OPL_BONUS-TOT_SUM_NOT_FISCAL-D_ROUND_TOT_SUM_NOT_FISCAL)>Eps then
    begin
      MessageDlg('Оплата бонусами более суммы чека!', mtError,[mbOk], 0);
      SUM_OPL_BONUS:=TOT_SUM_NOT_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL;
      E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);
      E_OPL_BONUS.Setfocus;
    end;
  end;


  TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;

  E_TOT_MONEY.Text:=Format('%.2f',[TOT_MONEY]);
  E_OPL_NALChange(Sender);
 except
    MessageDlg('Оплата бонусами не число!', mtError,[mbOk], 0);
  end;
end; //if SUM_BONUS_BALL>=0.01 then

end;

procedure TF_SaleDoc.E_OPL_BONUSClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.E_OPL_BONUSExit(Sender: TObject);
begin
 E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);
end;

procedure TF_SaleDoc.Control_Print_Cash_Receipt_Enabled;
var S_OPL1,S_OPL2:extended;
begin
  S_OPL1 :=TOT_MONEY-SUM_OPL_NAL-SUM_OPL_CARD;
  S_OPL2:=TOT_MONEY_FISCAL-SUM_OPL_NAL_FISCAL-SUM_OPL_CARD_FISCAL;
   BBPrint_Cash_Receipt.Enabled:=  (TOT_SUM>eps) and
  (S_OPL1<=eps)
  and
  (S_OPL2<=eps);


   // проверка хватит ли остатка в кассе для сдачи SUM_SDACHA при фискальной продаже
   if F_main.IS_RECEPT_TO_REGISTR_RRO then
   begin
      if (F_main.CONTROL_SDACHA_RRO=1) then
      begin
          if not IS_BANK_TRANSACTION_NOT_FISCAL then
          begin
            case ID_DOC_TYPE of
              200:   // продажа
              begin
                if ((SUM_SDACHA-F_Main.Now_SUM_KAS_RRO)>Eps) then
                begin
                  BBPrint_Cash_Receipt.Enabled:= False;
                  MessageDlg(Format('Сдачи %.2f больше остатка в кассе РРО %.2f !',[SUM_SDACHA,F_Main.Now_SUM_KAS_RRO]), mtError,[mbOk], 0);
                  exit;
                end;
              end;
              204:  //возврат товара покупателю
               begin
                  if ((TOT_MONEY-F_Main.Now_SUM_KAS_RRO)>Eps) then
                  begin
                    BBPrint_Cash_Receipt.Enabled:= False;
                    MessageDlg(Format('Возврат %.2f больше остатка в кассе РРО %.2f !',[TOT_MONEY,F_Main.Now_SUM_KAS_RRO]), mtError,[mbOk], 0);
                    exit;
                  end;
                end;
            end;
         end;

      end;
   end
   else
   begin
     if F_main.CONTROL_SDACHA=1 then
     begin
        if not IS_BANK_TRANSACTION_NOT_FISCAL then
        begin
          case ID_DOC_TYPE of
            200:   // продажа
            begin
              if ((SUM_SDACHA-F_Main.Now_SUM_KAS)>Eps) then
              begin
                BBPrint_Cash_Receipt.Enabled:= False;
                MessageDlg(Format('Сдачи %.2f больше остатка в кассе %.2f !',[SUM_SDACHA, F_Main.Now_SUM_KAS]), mtError,[mbOk], 0);
                exit;
              end;
            end;
            204:  //возврат товара покупателю
             begin
              if ((TOT_MONEY-F_Main.Now_SUM_KAS)>Eps) then
              begin
                BBPrint_Cash_Receipt.Enabled:= False;
                MessageDlg(Format('Возврат %.2f больше остатка в кассе %.2f !',[TOT_MONEY, F_Main.Now_SUM_KAS]), mtError,[mbOk], 0);
                exit;
              end;
            end;
          end;
        end;


     end;
   end;
  // разрешить печать чека для зарегистрированного покупателя при продаже в долг
  if (F_main.IS_USE_DOLG_POKUPAT=1) and (is_Registered_Client)  then   BBPrint_Cash_Receipt.Enabled:=True;



end;

procedure TF_SaleDoc.E_OPL_NALChange(Sender: TObject);
begin
if Trim(E_OPL_NAL.Text)='' then
begin
  E_OPL_NAL.Text :='';
  SUM_OPL_NAL:=0.0;
  SUM_SDACHA:= 0.0;
  E_SDACHA.Text:='';
  SUM_SDACHA_TO_BONUS_CARD:= 0.0;
  E_SDACHA_TO_BONUS_CARD.Text:='';
  // контроль возможности печати чека
  Control_Print_Cash_Receipt_Enabled;
  exit;
end;

try
  SUM_OPL_NAL:=StrToFloat(Trim(E_OPL_NAL.Text));
  if ID_DOC_TYPE=200 then
  begin
    if SUM_OPL_NAL>100000.0 then
    begin
      MessageDlg(Format('Сумма наличными %.2f превосходит предельное 100000!',[SUM_OPL_NAL]), mtError,[mbOk], 0);
      E_OPL_NAL.SetFocus;
      SUM_OPL_NAL:=0;
      E_OPL_NAL.Text:='';
      exit;
    end;
  end;


  SUM_SDACHA := SUM_OPL_NAL+SUM_OPL_CARD-TOT_MONEY-SUM_SDACHA_TO_BONUS_CARD;
  E_SDACHA.Text:=Format('%.2f',[SUM_SDACHA]);
  // контроль возможности печати чека
  Control_Print_Cash_Receipt_Enabled;


except
  MessageDlg('Получено наличными не число!', mtError,[mbOk], 0);
  E_OPL_NAL.SetFocus;
end;

end;

procedure TF_SaleDoc.E_OPL_NALClick(Sender: TObject);
begin
  EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.E_OPL_NALKeyPress(Sender: TObject; var Key: Char);
begin
  if Key='.' then Key:=',';
  if Not (Key in ['0'..'9', #8,',',#45])then Key:=#0;
end;

procedure TF_SaleDoc.E_SDACHA_TO_BONUS_CARDChange(Sender: TObject);
begin
try
  if Trim(E_SDACHA_TO_BONUS_CARD.Text)='' then SUM_SDACHA_TO_BONUS_CARD:=0.0
  else SUM_SDACHA_TO_BONUS_CARD:= StrToFloat(Trim(E_SDACHA_TO_BONUS_CARD.Text));
  SUM_SDACHA := SUM_OPL_NAL+SUM_OPL_CARD-TOT_MONEY-SUM_SDACHA_TO_BONUS_CARD;
  E_SDACHA.Text:=Format('%.2f',[SUM_SDACHA]);

except
  MessageDlg('Сдача на карту не число!', mtError,[mbOk], 0);
  E_SDACHA_TO_BONUS_CARD.SetFocus;
end;

end;

procedure TF_SaleDoc.E_TelClick(Sender: TObject);
begin
TEdit(Sender).SelectAll;
EditElementInFocus:=Sender;
end;

procedure TF_SaleDoc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Result_exit:integer;
begin
  Result_exit:= modalResult;
  if not IS_DOC_SAVED then
  begin
     if ID_DOC_TYPE in [206, 242] then   // инвентаризации
     begin
      Result_exit:=
      MessageDlg(' Документ не сохранен! Продолжить изменение документа и дальнейшее сохранение его?',
        mtConfirmation, [mbNo, mbYes ], 0);
     end
     else
     begin
       if TOT_SUM>Eps then
       begin
        Result_exit:=
          MessageDlg(' Документ не сохранен! Продолжить изменение документа и дальнейшее сохранение его?',
          mtConfirmation, [mbNo, mbYes ], 0);
       end
       else
       begin
        Result_exit:=mrNo;
       end;

     end;




    if (Result_exit = mrYes) or (Result_exit = mrCancel) then
    begin
      CanClose:=False;
      Exit;
    end;


  end;

  if (not IS_DOC_SAVE_FINAL) and (ID_NAKLCAP<>-1) and (ID_DOC_TYPE in [200, 204])  then  // есть сохраненный не доведенный до финала документ
  begin
    // удалить этот ID_NAKLCAP нефинализированный документ
    ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
    ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    ADOCommandDeleteNotFinalDoc.Execute;
  end;
  if not (ID_DOC_TYPE in [200, 204]) then
  begin
    //  этот ID_NAKLCAP финализировать
    ADOCommandFinalDoc.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
    ADOCommandFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    ADOCommandFinalDoc.Execute;
  end;




  // удалить инфо о несохраненним документе
  ADOCommandDeleteNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
  ADOCommandDeleteNOT_SAVED_DOC.Execute;

  if DM1.ADODSPrice.Active then
  begin
    DM1.ADODSPrice.Filter :='';
    DM1.ADODSPrice.Close;
  end;
  if DM1.QPriceTovSelect.Active then DM1.QPriceTovSelect.Close;
  if QDocPrototypeCaption.Active then QDocPrototypeCaption.Close;
  if QDocPrototype_Tov.Active then QDocPrototype_Tov.Close;

  if vAPScale<>nil then
  begin
    vAPScale.DisConnect1;
    FreeAndNil(vAPScale);
  end;




end;

procedure TF_SaleDoc.FormCreate(Sender: TObject);
begin
  // vAPScale:=TAPScale.Create(self);
  vAPScale:= nil;
  IsOnWeight:=False;
  EWeight.ReadOnly:=IsOnWeight;
  Timer1.Enabled:=IsOnWeight;
  Weight_on_off_visualization;

  ID_grtov_select:=-1;
  BBSearchUp.Enabled:= CheckBox1.Checked;
  BBSearchDown.Enabled := BBSearchUp.Enabled;


  BBPay.Enabled:=false;
  is_Oplata_Go:=False;
  is_Registered_Client:=False;
  is_Opl_Bonus:=False;
  Panel_Price.Visible:=not is_Oplata_Go;
  Panel_Price.Align:=alClient;
  Panel_Oplata.Visible:=is_Oplata_Go;
  Panel_Oplata.Align:=alClient;



  Edit_BonusCard.Text:='';
  Edit_BonusCard.Enabled:=False;
  Edit_Sum_Bonus_Ball.Text:='0.00';

  E_INN.Text:=Trim(Edit_BonusCard.Text);
  DTP_Birthday.Date:=Date();
  E_Cli.Text:='';
  E_Tel.Text:='';
  E_Email.Text:='';
  Panel_Reg_BonusCard.Visible:=False;
  Panel_Reg_BonusCard.Align:=alClient;

  PanelBankTerm.Height:=41;
  BB_NUM_LK.Caption:='АБВГ...';

  ID_SKIDKA:=-1;
  IS_NAMED_SKIDKA:=-1;
  SKIDKA:=0.0;         // сумма скидки по документу
  PER_SKIDKA_KOLBASA:=0.0;    // % скидки
  PER_SKIDKA_MYASO:=0.0;
  PER_SKIDKA_TNP:=0.0;
  Skidka_Name:=''; // название скидки
  Skidka_DFROM:=0.0; // дата время начала скидки
  Skidka_DTO:=0.0; // дата время конца скидки
  BBPrint_Cash_Receipt.Enabled:=False;
  BBRecept_To_Resistr.Visible:=False;

  IS_DOC_SAVED:=False;
  IS_DOC_SAVE_FINAL:=False;

  EditElementInFocus:=nil;
  Label_Opl_Bank.Caption:='';

  Сarte_Kharkov:='';
  is_carte_Kharkov:=False;

   // Отложенная оплата не разрешена 0; разрешена 1
  BB_WithoutOplaty.Visible:= (F_main.DEFERRED_PAYMENT=1);


 {
  if ID_DOC_TYPE in [163, 219] then   // заказы , приход ТНП
  begin
    BBPay.Visible:=False;
    BBBonusCard.Visible:=False;
    BBPrint_Cash_Receipt.Caption:='Сохранить';
    GroupBoxCLI_SELECT.Visible:=True;
  end;
  }

end;

procedure TF_SaleDoc.SetCaptionNakl;
var
INN_CLI_D, INN_CLI_K:string;

begin
  with  dm1.QNaklCapInfo  do
  begin
    Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    dm1.QNaklCapInfo.Open;
    DT_Date_doc.DateTime:=FieldByName('D').AsFloat;
    EN.Text:=FieldByName('NN').AsString;
    ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
    ID_CLIENT:=FieldByName('ID_CLIENT').AsInteger;
    CLI_D:=FieldByName('CLIENT').AsString; 
    ID_CLI_K:=FieldByName('ID_CLI_K').AsInteger;
    CLI_K:=FieldByName('CLI_K').AsString;
    INN_CLI_D:=FieldByName('INN_D').AsString;
    INN_CLI_K:=FieldByName('INN_K').AsString;
    case ID_DOC_TYPE of
    220, 211, 217, 223, 225, 232, 234,272:
      begin
        ECLI_ContrAgent.Text:=CLI_D;
        ID_VENDOR:=ID_CLIENT;
      end;
    276:
      begin
        ECLI_ContrAgent.Text:=CLI_D;
        ID_VENDOR:=-1;
      end;
    else
      begin
        ECLI_ContrAgent.Text:=CLI_K;
        ID_VENDOR:=ID_CLI_K;
      end;
    end;



    PRICE_KATEG:=FieldByName('PRICE_KATEG').AsInteger;
    SCH_D:=FieldByName('SCH_D').AsString;
    SCH_K:=FieldByName('SCH_K').AsString;
    Label_Client.Caption:=Format('Категория - %s; Клиент - %s',
      [FieldByName('KATEGOR').AsString,FieldByName('CLIENT').AsString]);

    ID_KATEGOR_CLI_D:=FieldByName('ID_KATEGOR').AsInteger;
    KATEGOR_D:=FieldByName('KATEGOR').AsString;
    ID_KATEGOR_CLI_K:=FieldByName('ID_KATEGOR_K').AsInteger;
    KATEGOR_K:=FieldByName('KATEGOR_K').AsString;

  //  SUM_OPL_BONUS:=Int(FieldByName('SUM_OPL_BONUS').AsFloat);
    SUM_OPL_BONUS:=FieldByName('SUM_OPL_BONUS').AsFloat;
    E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);

    SUM_OPL_CARD:=FieldByName('SUM_OPL_CARD').AsFloat;

    CARD_NN_FISCAL:=FieldByName('CARD_NN_FISCAL').AsString;
    CODE_TRANSACTION_FISCAL:=FieldByName('TRANS_CODE_FISCAL').AsString;
    CARD_NN_NOT_FISCAL:=FieldByName('CARD_NN_NOT_FISCAL').AsString;
    CODE_TRANSACTION_NOT_FISCAL:=FieldByName('TRANS_CODE_NOT_FISCAL').AsString;



    SetControlElements;

  end;


  dm1.QNaklCapInfo.Close;

  case ID_DOC_TYPE of
    200:   // продажа
      begin

        if  Trim(INN_CLI_D)<>'' then
        begin
      //    GetBonusCli(INN_CLI_D, SUM_BONUS_BALL);
          Edit_BonusCard.Enabled:=True;
          Edit_BonusCard.Text:=INN_CLI_D;
          Edit_Sum_Bonus_Ball.Text:=Format('%.2f',[SUM_BONUS_BALL]);

        end;
      end;
    204: //возврат от покупателя
    else
      begin
        ;
      end;
    end;




 



end;

procedure TF_SaleDoc.RefreshSkidka;
begin
 // определение текущей скидки
  With QSkidkaNow do
  begin
    Close;
    Parameters.ParamByName('INN').Value:=Trim(Edit_BonusCard.Text);
    if is_carte_Kharkov then Parameters.ParamByName('is_carte_Kharkov').Value:=1
    else Parameters.ParamByName('is_carte_Kharkov').Value:=0;
    Parameters.ParamByName('D').Value:=F_main.D_Work.DateTime;
    Open;

    First;
    SKIDKA:=0.0;         // сумма скидки по документу общая
    SKIDKA_KOLBASA:=0.0;
    SKIDKA_MYASO:=0.0;
    SKIDKA_TNP:=0.0;

    if RecordCount=0 then
    begin
      ID_SKIDKA:=-1;
      IS_NAMED_SKIDKA:=-1;
      PER_SKIDKA_KOLBASA:=0;    // % скидки
    PER_SKIDKA_MYASO:=0;
    PER_SKIDKA_TNP:=0;
    Skidka_Name:='Нет скидок'; // название скидки
    Skidka_DFROM:=0; // дата время начала скидки
    Skidka_DTO:=0; // дата время конца скидки
    MIN_KOLBASA:=0;    // % скидки
    MIN_MYASO:=0;
    MIN_TNP:=0;
    end
    else
    begin

   {
    [ID_SKIDKA],
[PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],
 [COMMENT], [D_FROM], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN_TNP]
   }
      ID_SKIDKA:=FieldByName('ID_SKIDKA').AsInteger;
      IS_NAMED_SKIDKA:=FieldByName('IS_NAMED').AsInteger;
      PER_SKIDKA_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;    // % скидки
      PER_SKIDKA_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
      PER_SKIDKA_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;
      Skidka_Name:=FieldByName('COMMENT').AsString; // название скидки
      Skidka_DFROM:=FieldByName('D_FROM').AsFloat; // дата время начала скидки
      Skidka_DTO:=FieldByName('D_TO').AsFloat; // дата время конца скидки
      MIN_KOLBASA:=FieldByName('MIN_KOLBASA').AsFloat;    // % скидки
      MIN_MYASO:=FieldByName('MIN_MYASO').AsFloat;
      MIN_TNP:=FieldByName('MIN_TNP').AsFloat;
    end;
    Close;
  end; // With QSkidkaNow do


  if ID_SKIDKA<>-1 then
  begin

    Panel6.Height:=170;
    L_Skidka.Visible:=True;
    L_klobasa.Visible:=True;
    L_TNP.Visible:=True;
  end
  else
  begin
    Panel6.Height:=120;
    L_Skidka.Visible:=False;
    L_klobasa.Visible:=False;
    L_TNP.Visible:=False;
  end;


end;

{
procedure TF_SaleDoc.SkidkaBirthday;
var CliYear, CliMonth, CliDay, NowYear, NowMonth, NowDay:word;
begin
 // определение текущей скидки для зарегистрированного покупателя
  With QSkidkaNamedNow do
  begin
    Close;
    Parameters.ParamByName('D').Value:=Now();
    Open;

    SKIDKA:=0.0;         // сумма скидки по документу общая
    SKIDKA_KOLBASA:=0.0;
    SKIDKA_MYASO:=0.0;
    SKIDKA_TNP:=0.0;

    if RecordCount<>0 then
    begin
      First;
      ID_SKIDKA_NAMED:=FieldByName('ID_SKIDKA').AsInteger;
      PER_SKIDKA_NAMED_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;    // % скидки
      PER_SKIDKA_NAMED_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
      PER_SKIDKA_NAMED_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;
      Skidka_Name_NAMED:=FieldByName('COMMENT').AsString; // название скидки
      MIN_NAMED_KOLBASA:=FieldByName('MIN_KOLBASA').AsFloat;    // % скидки
      MIN_NAMED_MYASO:=FieldByName('MIN_MYASO').AsFloat;
      MIN_NAMED_TNP:=FieldByName('MIN_TNP').AsFloat;
      Skidka_NAMED_DFROM:=FieldByName('D_FROM').AsFloat; // дата время начала скидки
      Skidka_NAMED_DTO:=FieldByName('D_TO').AsFloat; // дата время конца скидки
    end;

    DecodeDate(BIRTHDAY_CLI, CliYear, CliMonth, CliDay);
    DecodeDate(Now(), NowYear, NowMonth, NowDay);
    if (CliMonth=NowMonth) and (CliDay=NowDay) then
    begin
      ID_SKIDKA:=ID_SKIDKA_NAMED;
      PER_SKIDKA_KOLBASA:=PER_SKIDKA_NAMED_KOLBASA;    // % скидки
      PER_SKIDKA_MYASO:=PER_SKIDKA_NAMED_MYASO;
      PER_SKIDKA_TNP:=PER_SKIDKA_NAMED_TNP;
      Skidka_Name:=Skidka_Name_NAMED; // название скидки
      Skidka_DFROM:=Skidka_NAMED_DFROM; // дата время начала скидки
      Skidka_DTO:=Skidka_NAMED_DTO; // дата время конца скидки
      MIN_KOLBASA:=MIN_NAMED_KOLBASA;    // % скидки
      MIN_MYASO:=MIN_NAMED_MYASO;
      MIN_TNP:=MIN_NAMED_TNP;


    end;     //  if (CliMonth=NowMonth) and (CliDay=NowDay) then

    Close;
  end; // With QSkidkaNamedNow do




end;

}

procedure TF_SaleDoc.FormShow(Sender: TObject);
var S_reason_delete_edit :string;

begin

 E_OPL_NAL.Enabled:=True;


 LGrup.Caption:='Все группы';
 ID_grtov_select:=-1;
 //ID_GRTOV_from:=0;
 //ID_GRTOV_to:=MaxInt;

 Edit_BonusCard.Text:='';

 RadioGroup1.ItemIndex:=0;

 case RadioGroup1.ItemIndex of
  0:
    begin
      CarentFieldSeach:='ID_TOV';
      BBAllGrTovSelClick(Sender);
      CheckBox1.Checked:=False;
      CheckBox1.Enabled:=False;
      CheckBox2.Checked:=False;
      CheckBox2.Enabled:=False;
    //  BBSearchDown.Enabled := true;
      DM1.ADODSPriceID_TOV.Index:=0;
      DM1.ADODSPriceCODE.Index:=1;
      DM1.ADODSPriceNAME.Index:=2;
      DM1.ADODSPriceEDIZM.Index:=3;
      DM1.ADODSPricePRICE_UCH.Index:=4;
      DM1.ADODSPricePRICE_TMP.Index:=5;
      DM1.ADODSPriceNUMB.Index:=6;
      DM1.ADODSPriceGRUPTOV.Index:=7;

      TouchKeyboard_Layout:='NumPad';
    end;
  1:
    begin
      CarentFieldSeach:='CODE';
      BBAllGrTovSelClick(Sender);
      CheckBox1.Checked:=False;
      CheckBox1.Enabled:=False;
      CheckBox2.Checked:=False;
      CheckBox2.Enabled:=False;
     // BBSearchDown.Enabled := true;
      DM1.ADODSPriceCODE.Index:=0;
      DM1.ADODSPriceID_TOV.Index:=1;
      DM1.ADODSPriceNAME.Index:=2;
      DM1.ADODSPriceEDIZM.Index:=3;
      DM1.ADODSPricePRICE_UCH.Index:=4;
      DM1.ADODSPricePRICE_TMP.Index:=5;
      DM1.ADODSPriceNUMB.Index:=6;
      DM1.ADODSPriceGRUPTOV.Index:=7;

      TouchKeyboard_Layout:='NumPad';
    end;
  2:
    begin
      CarentFieldSeach:='NAME';
      CheckBox1.Enabled:=True;
      CheckBox2.Enabled:=True;
    //  BBSearchDown.Enabled := false;
      DM1.ADODSPriceNAME.Index:=0;
      DM1.ADODSPriceID_TOV.Index:=1;
      DM1.ADODSPriceCODE.Index:=2;
      DM1.ADODSPriceEDIZM.Index:=3;
      DM1.ADODSPricePRICE_UCH.Index:=4;
      DM1.ADODSPricePRICE_TMP.Index:=5;
      DM1.ADODSPriceNUMB.Index:=6;
      DM1.ADODSPriceGRUPTOV.Index:=7;
  
      TouchKeyboard_Layout:='Standard';
    end;
 end;

 TouchKeyboard1.Layout:=TouchKeyboard_Layout;




 dm1.ADODSPrice.IndexFieldNames:=CarentFieldSeach;
 Edit1.SetFocus;

 DM1.ADODSPriceOSTAT.Visible:=(F_main.SHOW_OSTATKI=1);

 if ID_NAKLCAP=Unknown_code then // на старте новый документ
 begin
 //  BBResetClick(Sender);   // обновление прайслиста

  // определение текущей скидки
  //is_Registered_Client:=False;
 // RefreshSkidka;
  Action_New_DocExecute(Sender);
 end
 else // редактируется уже сохраненный документ
 begin
//  if GetReasonStr(S_reason_delete_edit)=mrOk then
// begin
    S_reason_delete_edit :='';
    dm1.SP_COPY_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
    dm1.SP_COPY_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
    dm1.SP_COPY_NAKL.Parameters.ParamValues['@COMMENT_DEL']:=S_reason_delete_edit;
    dm1.SP_COPY_NAKL.ExecProc;
    if dm1.SP_COPY_NAKL.Parameters.ParamValues['@ER']=0  then
    begin
      ID_NAKLCAP:=dm1.SP_COPY_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
      dm1.SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
      dm1.SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
      dm1.SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@IN_TRANSACTION']:=1;
      dm1.SP_SET_PRICE_FROM_NAKL.ExecProc;
      if dm1.SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ER']=0  then
      begin
       SetCaptionNakl;

       DM1.ADOCommandOstatkiCalc.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
       DM1.ADOCommandOstatkiCalc.Parameters.ParamByName('D').Value:=DT_Date_doc.DateTime;
       DM1.ADOCommandOstatkiCalc.Execute;

       if ID_CLI_K=29546 then  // Борки мясо
       begin
        ID_VENDOR:=-1;
        ID_grtov_select:=38;// мясо
       end;

       ReOpenPrice;
       // скидка по редактируемому документу
       with QSkidkaDocEdit do
       begin
        Close;
        Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
        Open;
        First;
        {
        [SKIDKA_KOLBASA], [SKIDKA_MYASO], [SKIDKA_TNP],
[PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],
[SKIDKA_COMMENT], [MIN_KOLBASA], [MIN_MYASO], [MIN_TNP]
}
        SKIDKA_KOLBASA:=FieldByName('SKIDKA_KOLBASA').AsFloat;
        SKIDKA_MYASO:=FieldByName('SKIDKA_MYASO').AsFloat;
        SKIDKA_TNP:=FieldByName('SKIDKA_TNP').AsFloat;
        SKIDKA:=SKIDKA_KOLBASA+SKIDKA_MYASO+SKIDKA_TNP;         // сумма скидки по документу общая
        PER_SKIDKA_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;    // % скидки
        PER_SKIDKA_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
        PER_SKIDKA_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;
        Skidka_Name:=FieldByName('SKIDKA_COMMENT').AsString; // название скидки
        Skidka_DFROM:=0.0; // дата время начала скидки
        Skidka_DTO:=0.0; // дата время конца скидки
        Close;

         if abs(SKIDKA)>=Eps then
          begin

            Panel6.Height:=170;
            L_Skidka.Visible:=True;
            L_klobasa.Visible:=True;
            L_TNP.Visible:=True;
          end
          else
          begin
            Panel6.Height:=120;
            L_Skidka.Visible:=False;
            L_klobasa.Visible:=False;
            L_TNP.Visible:=False;
          end;

       end;


       CalcCarentResult;
       // позиционирование прайса на первом из выбранных
       if dm1.ADODSPrice.Active then
          dm1.ADODSPrice.Locate('ID_TOV',
          dm1.QPriceTovSelect.FieldByName('ID_TOV').asInteger,[loCaseInsensitive]);

              // создать инфо о несохраненном документе
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
        ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
        ADOCommandInsertNOT_SAVED_DOC.Execute;

      end
      else MessageDlg(
       'Ошибка при редактировании накладной! Оригинал редактируемого документа находится в удаленных.',
       mtError, [mbOk], 0);
      // Close;        не работает в FormShow
    end // if dm1.SP_COPY_NAKL.Parameters.ParamValues['@ER']=0  then
    else
    begin
      MessageDlg(
       'Ошибка при копировании оригинала редактируемого документа.',
       mtError, [mbOk], 0);
     //  Close;     не работает в FormShow
    end;

 end; // else if ID_NAKLCAP=Unknown_code then
end;  // procedure TF_SaleDoc.FormShow(Sender: TObject);

procedure TF_SaleDoc.Action_grid_downExecute(Sender: TObject);
begin
  TDBGrid(Sender).DataSource.DataSet.MoveBy(20);
end;

procedure TF_SaleDoc.ActionNacenkaExecute(Sender: TObject);
var Nacen, a, b, c, d:extended;
begin
// наценить приход овощей

try
  a:=StrToFloat(E_PerNacenki.Text);

except
      MessageDlg('Насенка не чило!', mtError,  [mbOk], 0);
      E_PerNacenki.SetFocus;
end;




with DM1.ADODSPrice do
begin
  DisableControls;
  First;
  while not EOF do
  begin

      if CB_PerNacenki.Checked then
        Nacen:=FieldByName('PRICE_VENDOR').AsFloat*a/100.0
      else Nacen:=a;

      b:= FieldByName('PRICE_VENDOR').AsFloat+Nacen;
      c:=Int(b);
      d:=Frac(b);
      if d>0.5 then d:=1.0
      else
       begin
        if d<0.01 then d:=0
        else d:=0.5;
       end;
       b:=c+d;
      Edit;
      FieldByName('PRICE_TMP').AsFloat:=b;

    Post;

    Next;
  end;  // while not EOF do
  First;
  EnableControls;
end; // with DM1.ADSPrice do
end;

procedure TF_SaleDoc.Action_BonusCardExecute(Sender: TObject);
begin
// ввод штрих-кода бонусной карты
Edit_BonusCard.Enabled:=True;
Edit_BonusCard.SetFocus;
end;

procedure TF_SaleDoc.Action_CloseExecute(Sender: TObject);
begin
 Close;
end;



procedure TF_SaleDoc.Action_Naveski_AddExecute(Sender: TObject);
var v:extended;
begin
//    // данные идут с весов


 if IsOnWeight then
 begin
  if (Weight>eps) and (status_Weight = 'S') then  // показания весов стабилизировались
  begin
   // v := strToFloat(EWeight.text);
 //   p := strToFloat(E_PRICE_TMP.text);
  //  ADD_naveski(v); //добавить навеску

  //  if abs(price_tmp)>eps then
  //    if MessageDlg('Вы действительно хотите продать товар с измененной ценой?)',
  //     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    if ADD_naveski(Weight)=1  then //добавить навеску
    begin
    MessageBeep(MB_ICONASTERISK);
    Edit1.Text:='';
    CheckBox1.Checked:=False;
    Edit1.SetFocus;
      if CheckBox2.Checked then
      begin
        CheckBox2.Checked:=False;
        DM1.QPriceTovSelect.Locate('ID_TOV',ID_TOV_Search,[loCaseInsensitive]);
        DBGrid3DblClick(Sender);
      end;
    end
    else
    begin
      MessageDlg('Ошибка при вводе навески!', mtError,  [mbOk], 0);
      Edit1.SetFocus;
    end;

  end;
 end
 else  //  if CBOnWeight.Checked then
 begin  // данные вводятся вручную
    try
      if Trim(EWeight.text)='' then  v :=0.0
      else    v := strToFloat(Trim(EWeight.text));
    except
      MessageDlg('Навеска не число!', mtError,  [mbOk], 0);
      EWeight.SetFocus;
      exit;
    end;


   // if Trim(E_PRICE_TMP.text)='' then  p :=0.0
   // else   p := strToFloat(E_PRICE_TMP.text);
  //  if abs(p)>eps then
   //   if MessageDlg('Вы действительно хотите продать товар с измененной ценой?)',
  //     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
    if v>eps then
    begin


      if ADD_naveski(v)=1 then    //добавить навеску
      begin

        MessageBeep(MB_ICONASTERISK);
       // EWeight.text:=FloatToStr(0);
        EWeight.text:='';
        Edit1.Text:='';
        CheckBox1.Checked:=False;
        Edit1.SetFocus;
        if CheckBox2.Checked then
        begin
          CheckBox2.Checked:=False;
          DM1.QPriceTovSelect.Locate('ID_TOV',ID_TOV_Search,[loCaseInsensitive]);
          DBGrid3DblClick(Sender);
        end;
        end
        else
        begin
          MessageDlg('Ошибка при вводе навески!', mtError,  [mbOk], 0);
          Edit1.SetFocus;
        end;
        

    end;
  
 end; //  else  if CBOnWeight.Checked then

end;

procedure TF_SaleDoc.Action_Naveski_DeleteExecute(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin

with DM1.QNAVESKI_TMP do
begin
 if recordcount>0 then
 begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID').AsInteger;
 prior;
 pred_ID:=FieldByName('ID').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID').AsInteger;
 dm1.SP_NAVESKI_DEL.Parameters.ParamValues['@ID']:=carrent_ID;
 dm1.SP_NAVESKI_DEL.ExecProc;
 if dm1.SP_NAVESKI_DEL.Parameters.ParamValues['@ER']=0
 then
  begin
   Close;
   Parameters.ParamByName('IDUSER').Value:=dm1.ADODSPrice.fieldByName('ID_USERS').AsInteger;
   Parameters.ParamByName('IDTOV').Value:=dm1.ADODSPrice.fieldByName('ID_TOV').AsInteger;
   Open;
   if pred_ID=carrent_ID then // удаляем 1-ю
    Locate('ID',next_ID,[loCaseInsensitive])
   else
    if next_ID=carrent_ID then // удаляем последнюю
     Locate('ID',pred_ID,[loCaseInsensitive])
    else  Locate('ID',pred_ID,[loCaseInsensitive]);

  end
 else MessageDlg('Ошибка при удалении навески!', mtError,
      [mbOk], 0);

 Enablecontrols;

 Sum_naveski;
 end;
 end;

end;

procedure TF_SaleDoc.SetControlElements;
begin
  case ID_DOC_TYPE of
    200:
      begin
        BBPay.Caption:='Принять оплату'; // продажа
        BBPrint_Cash_Receipt.Caption:='Чек';
        BBBonusCard.Visible:=True;
        Label2.Caption:='Сумма по чеку';
        Label5.Visible:=True;
        E_OPL_BONUS.Visible:=True;
        BB_OPL_BONUS.Visible:=True;
        Label8.Visible:=True;

        Label8.Caption:='К оплате с учетом бонусов';


        E_TOT_MONEY.Visible:=True;
        BB_Pay_Bank_Not_Fiscal.Caption:='Оплата банк картой';
        BB_Pay_Bank_Not_Fiscal.Visible:=True;

        Label3.Caption:='Получено наличными';

        ID_VENDOR:=-1;
        Label_Client.Visible:=True;

        CB_SHTRIH_TOV.Visible:=True;
        BB_RegistrBonusCard.Visible:=True;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_UCH.Index:=4;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.ADODSPricePRICE_TMP.Index:=5;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.ADODSPriceNUMB.Index:=6;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во';
        DM1.ADODSPriceOSTAT.Index:=7;
       // DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceOSTAT.Visible:=(F_main.SHOW_OSTATKI=1);
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_VENDOR.Visible:=False;
        DM1.ADODSPricePRICE_VENDOR.Index:=10;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=True;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;




        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=False;


      end;

    204:
      begin
        BBPay.Caption:='Вернуть денеги'; // возвраты
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Label2.Caption:='Сумма к возврату по чеку';
        Label5.Visible:=False;
        E_OPL_BONUS.Visible:=False;
        BB_OPL_BONUS.Visible:=False;
        Label8.Visible:=True;

        Label8.Caption:='К возврату';

        E_TOT_MONEY.Visible:=True;
        BB_Pay_Bank_Not_Fiscal.Caption:='Возврат на банк карту';
        BB_Pay_Bank_Not_Fiscal.Visible:=True;

        Label3.Caption:='Возвращено наличными';

        ID_VENDOR:=-1;
        Label_Client.Visible:=True;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_UCH.Index:=4;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во к возврату';
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена по чеку';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=7;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=True;
        DM1.ADODSPriceNUMB_PROTOTYPE.DisplayLabel:='Кол-во по чеку';
        DM1.ADODSPriceOSTAT.Index:=8;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceOSTAT.DisplayLabel:='Кол-во остатка';
        DM1.ADODSPriceVENDOR.Index:=9;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=10;

        DM1.ADODSPricePRICE_VENDOR.Visible:=False;
        DM1.ADODSPricePRICE_VENDOR.Index:=11;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во к возврату';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=False;

      end;

      206, 242:      //инвентаризация   товаров, возвратной тары
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        CB_SHTRIH_TOV.Visible:=True;
        BB_RegistrBonusCard.Visible:=False;
        if ID_DOC_TYPE=242 then   // инвент возвратной тары
        begin
          ID_VENDOR:= 2729; //нмк(колбаса)
        end
        else ID_VENDOR:=-1;
        Label_Client.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_UCH.Index:=4;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена учетная';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во';
        DM1.ADODSPricePRICE_TMP.Visible:=False;
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPriceOSTAT.Index:=7;
       // DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceOSTAT.Visible:=(F_main.SHOW_OSTATKI=1);
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_VENDOR.Visible:=False;
        DM1.ADODSPricePRICE_VENDOR.Index:=10;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена учетная';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=False;


       end;
        163, 126, 198, 237, 238, 270, 305:      // заказы ТНП, колбасы, мяса, овощей, заказы на возврат ТНП
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        ID_VENDOR:=ID_CLI_K;
        Label_Client.Visible:=False;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_VENDOR.Index:=4;
        DM1.ADODSPricePRICE_VENDOR.Visible:=True;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во заказа';
        DM1.ADODSPricePRICE_TMP.Visible:=True;
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена временная';
        DM1.ADODSPriceOSTAT.Index:=7;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_UCH.Index:=10;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';

        DM1.QPriceTovSelectPRICE_VENDOR.Index:=4;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=True;
        DM1.QPriceTovSelectss_vendor.Index:=5;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=True;
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectGRUPTOV.Visible:=True;

        DM1.QPriceTovSelectprice_select.Index:=7;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена выбора';
        DM1.QPriceTovSelectprice_select.Visible:=False;
        DM1.QPriceTovSelectss.Index:=8;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма выбора';
        DM1.QPriceTovSelectss.Visible:=False;
       
        DM1.QPriceTovSelectOSTAT.Index:=9;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=10;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=11;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=12;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=True;
        DM1.QPriceTovSelectss_vendor.Index:=13;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=True;


       end;

      219,209, 216, 228, 230, 271:      // приход ТНП, прих колбасы, мяса овощей
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        ID_VENDOR:=ID_CLI_K;
        Label_Client.Visible:=False;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_VENDOR.Index:=4;
        DM1.ADODSPricePRICE_VENDOR.Visible:=True;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во прихода';
        DM1.ADODSPricePRICE_TMP.Visible:=True;
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена временная';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=7;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=True;
        DM1.ADODSPriceNUMB_PROTOTYPE.DisplayLabel:='Кол-во заказа';
        DM1.ADODSPriceOSTAT.Index:=8;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceVENDOR.Index:=9;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=10;

        DM1.ADODSPricePRICE_UCH.Index:=11;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;

        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';
        DM1.QPriceTovSelectprice_select.Index:=6;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена прихода';
        DM1.QPriceTovSelectprice_select.Visible:=True;
        DM1.QPriceTovSelectss.Index:=7;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма прихода';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=8;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=9;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=10;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=4;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=True;
        DM1.QPriceTovSelectss_vendor.Index:=5;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=True;

      end;

      220, 211, 217, 223,  225, 232, 234:
      // POS_Возврат ТНП поставщику , веревки, обрези

      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        ID_VENDOR:=ID_CLIENT;
        Label_Client.Visible:=False;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_VENDOR.Index:=4;
        DM1.ADODSPricePRICE_VENDOR.Visible:=True;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во возврата';
        DM1.ADODSPricePRICE_TMP.Visible:=True;
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена временная';
        DM1.ADODSPriceOSTAT.Index:=7;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_UCH.Index:=10;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена продажи';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=False;
      end;

      276:
      // POS_Возврат ТНП поставщику , веревки, обрези

      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        ID_VENDOR:=-1;
        Label_Client.Visible:=False;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_VENDOR.Index:=4;
        DM1.ADODSPricePRICE_VENDOR.Visible:=True;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во передачи';
        DM1.ADODSPricePRICE_TMP.Visible:=True;
        DM1.ADODSPricePRICE_TMP.Index:=6;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена временная';
        DM1.ADODSPriceOSTAT.Index:=7;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_UCH.Index:=10;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена учетная';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во передачи';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена передачи';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена учетная';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма передачи';
        DM1.QPriceTovSelectss_vendor.Visible:=False;
      end;


      272:
      // списание овощей
      begin
        BBPay.Visible:=False;
        BBPrint_Cash_Receipt.Caption:='Сохранить';
        BBBonusCard.Visible:=False;
        Panel_Oplata.Visible:=False;
        E_OPL_NAL.Text:=E_TOT_SUM.Text;
        GroupBox2.Visible:=False;
        GroupBox3.Visible:=False;
        GroupBoxCLI_SELECT.Visible:=False;
        ID_VENDOR:=ID_CLIENT;
        Label_Client.Visible:=False;
        CB_SHTRIH_TOV.Visible:=False;
        BB_RegistrBonusCard.Visible:=False;

        DM1.ADODSPriceID_TOV.Index:=0;
        DM1.ADODSPriceCODE.Index:=1;
        DM1.ADODSPriceNAME.Index:=2;
        DM1.ADODSPriceEDIZM.Index:=3;
        DM1.ADODSPricePRICE_VENDOR.Index:=4;
        DM1.ADODSPricePRICE_VENDOR.Visible:=True;
        DM1.ADODSPricePRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.ADODSPriceNUMB.Index:=5;
        DM1.ADODSPriceNUMB.DisplayLabel:='Кол-во списания';
        DM1.ADODSPricePRICE_UCH.Visible:=True;
        DM1.ADODSPricePRICE_UCH.Index:=6;
        DM1.ADODSPricePRICE_UCH.DisplayLabel:='Цена списания';
        DM1.ADODSPriceOSTAT.Index:=7;
        DM1.ADODSPriceOSTAT.Visible:=True;
        DM1.ADODSPriceVENDOR.Index:=8;
        DM1.ADODSPriceVENDOR.DisplayLabel:='Поставщик';
        DM1.ADODSPriceGRUPTOV.Index:=9;

        DM1.ADODSPricePRICE_TMP.Index:=10;
        DM1.ADODSPricePRICE_TMP.DisplayLabel:='Цена временная';
        DM1.ADODSPriceNUMB_PROTOTYPE.Index:=11;
        DM1.ADODSPriceNUMB_PROTOTYPE.Visible:=False;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Index:=12;
        DM1.ADODSPriceIS_EXISTS_OSTATOK.Visible:=True;


        DM1.QPriceTovSelectrn.Index:=0;
        DM1.QPriceTovSelectrn.DisplayLabel:='№';
        DM1.QPriceTovSelectNAME.Index:=1;
        DM1.QPriceTovSelectEDIZM.Index:=2;
        DM1.QPriceTovSelectNUMB.Index:=3;
        DM1.QPriceTovSelectNUMB.DisplayLabel:='Кол-во';
        DM1.QPriceTovSelectprice_select.Index:=4;
        DM1.QPriceTovSelectprice_select.DisplayLabel:='Цена списания';
        DM1.QPriceTovSelectss.Index:=5;
        DM1.QPriceTovSelectss.DisplayLabel:='Сумма списания';
        DM1.QPriceTovSelectGRUPTOV.Index:=6;
        DM1.QPriceTovSelectGRUPTOV.DisplayLabel:='Группа';
        DM1.QPriceTovSelectOSTAT.Index:=7;
        DM1.QPriceTovSelectOSTAT.Visible:=False;
        DM1.QPriceTovSelectPRICE_UCH.Index:=8;
        DM1.QPriceTovSelectPRICE_UCH.DisplayLabel:='Цена учетная';
        DM1.QPriceTovSelectPRICE_UCH.Visible:=False;
        DM1.QPriceTovSelectPRICE_TMP.Index:=9;
        DM1.QPriceTovSelectPRICE_TMP.DisplayLabel:='Цена уценки';
        DM1.QPriceTovSelectPRICE_TMP.Visible:=False;
        DM1.QPriceTovSelectPRICE_VENDOR.Index:=10;
        DM1.QPriceTovSelectPRICE_VENDOR.DisplayLabel:='Цена поставщика';
        DM1.QPriceTovSelectPRICE_VENDOR.Visible:=False;
        DM1.QPriceTovSelectss_vendor.Index:=11;
        DM1.QPriceTovSelectss_vendor.DisplayLabel:='Сумма поставщика';
        DM1.QPriceTovSelectss_vendor.Visible:=False;
      end;




  end;
end;

procedure TF_SaleDoc.New_Doc(Sender: TObject; is_CleanNumbSelect:boolean);
var n:integer;
begin
  StatusBar1.Panels[0].Text:='';
  StatusBar1.Panels[1].Text:='';
  StatusBar1.Panels[2].Text:='';
  Edit_BonusCard.Text:='';
  Edit_BonusCard.Enabled:=False;


  E_SDACHA_TO_BONUS_CARD.Visible:=False;
  Label24.Visible:=E_SDACHA_TO_BONUS_CARD.Visible;

  Edit_Sum_Bonus_Ball.Text:='0.00';
  IS_PENSIONER:=0;
  E_OPL_NAL.Enabled:=True;

  Edit1.Text:='';
  IS_DOC_SAVED:=False;
  IS_DOC_SAVE_FINAL:=False;
  Memo1.Clear;
  PanelBankTerm.Height:=41;
    // удалить инфо о несохраненним документе
  ADOCommandDeleteNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
  ADOCommandDeleteNOT_SAVED_DOC.Execute;

  if F_main.get_nums_doc(ID_DOC_TYPE,n)=0 then
  begin
    EN.Text:=IntToStr(n);
    ID_NAKLCAP:=Unknown_code;

    if is_CleanNumbSelect then CleanNumbSelect;  // обнуление выбранного кол-во в прайслисте

    // список набранных товаров
    with dm1.QPriceTovSelect do
    begin
      Close;
      DbGrid3.DataSource:=DM1.DS_QPriceTovSelect;
      Parameters.ParamValues['IDU'] :=ID_user_select;
      Open;
      First;
    end;


    DM1.ADOCommandOstatkiCalc.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
    DM1.ADOCommandOstatkiCalc.Parameters.ParamByName('D').Value:=DT_Date_doc.DateTime;
    DM1.ADOCommandOstatkiCalc.Execute;

    is_Oplata_Go:=False;

    SetControlElements;

    CODE_TRANSACTION_NOT_FISCAL:='';
    CODE_TRANSACTION_FISCAL:='';
    CARD_NN_NOT_FISCAL:='';
    CARD_NN_FISCAL:='';

    case ID_DOC_TYPE of
      204:    // Возврат от покупателя
      begin
        Label8.Visible:=True;

        Label8.Caption:='К возврату';


        BB_Pay_Bank_Not_Fiscal.Caption:='Возврат на банк карту';
        BB_Pay_Bank_Not_Fiscal.Enabled:=True;


        if ID_DOC_PROTOTYPE<>-1 then
        begin

          with QDocPrototypeCaption do     // прототип - продажа
          begin
            Close;
            Parameters.ParamByName('ID_NAKLCAP').Value:= ID_DOC_PROTOTYPE;
            Open;
            ID_CLI_K:=FieldByName('ID_CLI_D').AsInteger;
            CLI_K:=FieldByName('CLI_D').AsString;
            ID_KATEGOR_CLI_K:=FieldByName('ID_KATEGOR_D').AsInteger;
            KATEGOR_K:=FieldByName('KATEGOR_D').AsString;
            CODE_TRANSACTION_NOT_FISCAL:=Trim(FieldByName('TRANS_CODE_NOT_FISCAL').AsString);
            CODE_TRANSACTION_FISCAL:=Trim(FieldByName('TRANS_CODE_FISCAL').AsString);
            IS_CAN_REGISTRED_RRO_PROTOTYPE:=FieldByName('IS_CAN_REGISTRED_RRO').AsInteger;
            IS_REGISTER_RRO_PROTOTYPE:=FieldByName('IS_REGISTER_RRO').AsInteger;
            ID_CLI_RRO_PROTOTYPE:=FieldByName('ID_CLI_RRO').AsInteger;
            CHECK_NUMLOCAL_PROTOTYPE:=Trim(FieldByName('CHECK_NUMLOCAL').AsString);
            CHECK_NUMFISCAL_PROTOTYPE:=Trim(FieldByName('CHECK_NUMFISCAL').AsString);
            ORDERDATETIME_PROTOTYPE:=Trim(FieldByName('ORDERDATETIME').AsString);
            QRCODE_REG_PROTOTYPE:=FieldByName('QRCODE_REG').AsString;

            Close;
          end; // with QDocPrototypeCaption do

          if IS_REGISTER_RRO_PROTOTYPE =1 then   // прототип продажи зарегистрирован
          begin
          // нужно регистрировать и возврат
            F_main.IS_RECEPT_TO_REGISTR_RRO:=True;
            BBRecept_To_Resistr_visualization;
            BBRecept_To_Resistr.Enabled:=False;
          end
          else
          begin
            F_main.IS_RECEPT_TO_REGISTR_RRO:=False;
            BBRecept_To_Resistr_visualization;
            BBRecept_To_Resistr.Enabled:=False;
          end;

          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ID_USER']:=ID_user_select;
          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ID_NAKLCAP']:=ID_DOC_PROTOTYPE;
          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@IN_TRANSACTION']:=1;  // открыть транзакцию
          SP_SET_PRICE_FROM_PROTOTYPE.ExecProc;
          if SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ER']<>0 then
          begin
            MessageDlg('Ошибка заполнения прайслиста с документа прототипа!', mtError,[mbOk], 0);
          end;

        end; // if ID_DOC_PROTOTYPE<>-1 then
        GetRealizDay;
      end;


      219, 271:    //  приход ТНП   овощей
      begin
        if ID_DOC_PROTOTYPE<>-1 then
        begin

          with QDocPrototypeCaption do     // прототип - заказ
          begin
            Close;
            Parameters.ParamByName('ID_NAKLCAP').Value:= ID_DOC_PROTOTYPE;
            Open;
            ID_CLI_K:=FieldByName('ID_CLI_K').AsInteger;
            CLI_K:=FieldByName('CLI_K').AsString;
            ID_KATEGOR_CLI_K:=FieldByName('ID_KATEGOR_K').AsInteger;
            KATEGOR_K:=FieldByName('KATEGOR_K').AsString;

            ID_VENDOR:=ID_CLI_K;
            if ID_CLI_K=29546 then  // Борки мясо
             begin
              ID_VENDOR:=-1;
              ID_grtov_select:=38;// мясо
             end;
            ECLI_ContrAgent.Text:=CLI_K;
            ID_CLIENT:=F_main.ID_TRADE_POINT;
            CLI_D:=F_main.NAME_TRADE_POINT;
            Label_Client.Caption:=Format('Категория - %s; Клиент - %s', [KATEGOR_K, CLI_K]);
            GroupBoxCLI_SELECT.Visible:=True;
            Label11.Caption:='Временная цена';

            Close;
          end; // with QDocPrototypeCaption do

          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ID_USER']:=ID_user_select;
          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ID_NAKLCAP']:=ID_DOC_PROTOTYPE;
          SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@IN_TRANSACTION']:=1;  // открыть транзакцию
          SP_SET_PRICE_FROM_PROTOTYPE.ExecProc;
          if SP_SET_PRICE_FROM_PROTOTYPE.Parameters.ParamValues['@ER']<>0 then
          begin
            MessageDlg('Ошибка заполнения прайслиста с документа прототипа!', mtError,[mbOk], 0);
          end;

        end; // if ID_DOC_PROTOTYPE<>-1 then
      end;

      163:   // POS_заказТНП
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=ID_CLI_K;

          if ID_CLI_K=29546 then  // Борки мясо
          begin
            ID_VENDOR:=-1;
            ID_grtov_select:=38;// мясо
          end;

        end;
      end;

      270:   // POS_заказ овощей
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=-1; //ID_CLI_K;
          ID_grtov_select:=43;
        end;
      end;

      126:   // заказ колбасы
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=-1; //ID_CLI_K;

        end;
      end;

      198:   // заказ мяса
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=-1; //ID_CLI_K;
          ID_grtov_select:=38;

        end;
      end;

      220, 211, 305:   // POS_Возврат ТНП поставщику, колбасы , заказы на возврат ТНП
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=ID_CLIENT;

          if ID_CLIENT=29546 then  // Борки мясо
          begin
            ID_VENDOR:=-1;
            ID_grtov_select:=38;// мясо
          end;

        end;
      end;
      276:   // передача с тт на тт
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=-1;

        end;
      end;
      217:   // POS_Возврат  мяса
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=ID_CLIENT;
           ID_grtov_select:=38;
        end;
      end;


      223:   // списание веревок
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=-1;
          ID_grtov_select:=37;

        end;
      end;

     225:   //  обрезей
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=-1;
          ID_grtov_select:=2;

        end;
      end;

      237:   // заказы  тары отгружаемых с НМК
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=-1; //ID_CLI_K;
          ID_grtov_select:=39; // тара пакеты
        end;
      end;
      238:   // заказы  товаров отгружаемых с НМК
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
        begin
          ID_CLI_K:= ID_client_select_1;
          CLI_K:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_K;
          ID_VENDOR:=-1; //ID_CLI_K;
         // ID_grtov_select:=33; // ТНП специи, соусы
        end;
      end;

      232:   // POS_Возврат тары платн
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=ID_CLIENT;
          ID_grtov_select:=39; // тара пакеты
        end;
      end;
      234:   // POS_Возврат товаров
      begin
        if F_clientDlg_1(ID_KATEGOR_CLI_D,KATEGOR_D)=mrOk then
        begin
          ID_CLIENT:= ID_client_select_1;
          CLI_D:=client_select_1;
          ECLI_ContrAgent.Text:=CLI_D;
          ID_VENDOR:=ID_CLIENT;
         //  ID_grtov_select:=33;
        end;
      end;
      200:  // продажа
      begin
        BB_Pay_Bank_Not_Fiscal.Caption:='Оплата банк картой';
        BB_Pay_Bank_Not_Fiscal.Enabled:=True;
        GetRealizDay;
       // DT_Date_doc.Enabled:=False;
      end;

    end; //  case ID_DOC_TYPE of


    D_ROUND_TOT_SUM_NOT_FISCAL:=0;
    E_D_RoundNotFiscal.Text:='0';
    TOT_SUM_NOT_FISCAL:=0;
    E_TOT_NOT_FISCAL_SUM.Text:='0';
    TOT_SUM:=0;
    E_TOT_SUM.Text:='0';


    Panel_Price.Visible:= not is_Oplata_Go;
    PanelSearch.Visible:= not is_Oplata_Go;
    Panel_Oplata.Visible:=is_Oplata_Go;

    is_Registered_Client:=False;
    is_carte_Kharkov:=False;
    BB_SkidkaShowClick(Sender);

    is_Opl_Bonus:=false;
    SUM_OPL_BONUS:=0.0;
    BB_OPL_BONUS.Caption:='Платить бонусами';
    E_OPL_BONUS.Text:='0';




    SUM_SDACHA := 0.0;
    E_SDACHA.Text:='';
    SUM_SDACHA_TO_BONUS_CARD := 0.0;
    E_SDACHA_TO_BONUS_CARD.Text:='';

    SUM_SDACHA_FISCAL := 0.0;

    E_OPL_NAL.Text :='';
    SUM_OPL_NAL:=0.0;

    SUM_OPL_NAL_Fiscal:=0.0;



    BBPay.Enabled:=True;
    BBPrint_Cash_Receipt.Enabled:=False;


    if is_Oplata_Go then Edit1.SetFocus;

    BBBonusCard.Enabled:=not is_Oplata_Go;
    if not is_Oplata_Go then CheckBox1.Checked:=False;
    if not is_Oplata_Go then CheckBox2.Checked:=False;
    if (not is_Oplata_Go) then   // Борки мясо
    begin
         BBAllGrTovSel.Click;
    end
    else
    begin
      ReOpenPrice;
      CalcCarentResult;
    end;


    // создать инфо о несохраненном документе
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_DOC_TYPE').Value:= ID_DOC_TYPE;
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_D').Value:= ID_CLIENT;
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K;
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('NN').Value:= EN.Text;
    ADOCommandInsertNOT_SAVED_DOC.Parameters.ParamByName('D').Value:= DT_Date_doc.Datetime;
    ADOCommandInsertNOT_SAVED_DOC.Execute;

 end
 else MessageDlg('Ошибка при получении номера документа!', mtError,
      [mbOk], 0);

 Invalidate;
end;


procedure TF_SaleDoc.Action_New_DocExecute(Sender: TObject);
begin
  New_Doc(Sender, true);
end;



procedure TF_SaleDoc.PrintResponse(handle: POS_HANDLE);
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

function TF_SaleDoc.Pay_Ingenico(SUM_TO_PAY:extended; var vPaySystem, card_nn, trans_code:string):boolean;
var vIngenicoBPOSDevice:TIngenicoBPOSDevice;
  vIngenicoOperation:TIngenicoOperation;
begin
  result:=False;
  vIngenicoOperation := TIngenicoOperation.Create;
  with vIngenicoOperation do
  begin
    Recno:=1;
    Operation:=iotPay;
    TerminalID:='';
    Amount:=SUM_TO_PAY;
    ResponseCode:='';
    PAN:='';
    AutorizationCode:='';
    CardName:='';
    BankID:=0;
    TransactionID:='';
    Slip_Text:='';
    EmitentBankFlag:=false;
    PIN:='';
    SignVerif:=0;


    UseRemoteDevice:= false;
    LogLevel:=1;
    end;
  vIngenicoBPOSDevice := TIngenicoBPOSDevice.Create(self);

    try
      vIngenicoBPOSDevice.StartPayment(vIngenicoOperation);
      vPaySystem:= vIngenicoOperation.CardName;
      card_nn:=vIngenicoOperation.PAN;
      trans_code:= vIngenicoOperation.TransactionID;
      result:= not vIngenicoBPOSDevice.State.Error;
     // result:= vIngenicoBPOSDevice.State.Error;

    finally
      vIngenicoBPOSDevice.Free;
    end;


 

end;


function TF_SaleDoc.Refund_Ingenico(SUM_TO_Refund:extended; vTransactionID:string; var vPaySystem, card_nn, trans_code:string):boolean;
var vIngenicoBPOSDevice:TIngenicoBPOSDevice;
  vIngenicoOperation:TIngenicoOperation;
begin
  result:=False;
  vIngenicoOperation := TIngenicoOperation.Create;
  with vIngenicoOperation do
  begin
    Recno:=1;
    Operation:= iotRefund;
    TerminalID:='';
    Amount:=SUM_TO_Refund;
    ResponseCode:='';
    PAN:='';
    AutorizationCode:='';
    CardName:='';
    BankID:=0;
    TransactionID:=vTransactionID;
    Slip_Text:='';
    EmitentBankFlag:=false;
    PIN:='';
    SignVerif:=0;


    UseRemoteDevice:= false;
    LogLevel:=1;
    end;
  vIngenicoBPOSDevice := TIngenicoBPOSDevice.Create(self);
  try
    vIngenicoBPOSDevice.StartRefund(vIngenicoOperation);
    vPaySystem:= vIngenicoOperation.CardName;
    card_nn:=vIngenicoOperation.PAN;
    trans_code:= vIngenicoOperation.TransactionID;
    result:=not vIngenicoBPOSDevice.State.Error;
  finally
    vIngenicoBPOSDevice.Free;
  end;

end;

function TF_SaleDoc.Bank_Terminal_Ingenico_Go(is_fiscal:boolean; SUM_TO_PAY:extended;
var vPaySystem, card_nn, trans_code:string):boolean;
var tc:string;
begin
  try
    result := true;
    if ID_DOC_TYPE=200 then   // продажа
    begin
      if not Pay_Ingenico(SUM_TO_PAY,vPaySystem, card_nn, trans_code) then
      begin
        MessageDlg('Не могу передать терминалу команду оплаты!', mtError, [mbOk], 0);
        result:=False;
        Exit;
      end;

    end;

    if ID_DOC_TYPE=204 then   // возврат
    begin
      tc:='';
      if not is_fiscal then
      begin
        tc:= Trim(CODE_TRANSACTION_NOT_FISCAL);
        if tc='' then
        begin
          IS_BANK_TRANSACTION_NOT_FISCAL:=(FInpBank_Transaction_infoDlg(CARD_PAY_SYSTEM,
                CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL)=mrOk);
          if IS_BANK_TRANSACTION_NOT_FISCAL then  tc:=CODE_TRANSACTION_NOT_FISCAL;

        end;
      end
      else
      begin
       tc:= Trim(CODE_TRANSACTION_FISCAL);    // код оригин транзакции
        if tc='' then
        begin
          IS_BANK_TRANSACTION_FISCAL:=(FInpBank_Transaction_infoDlg(CARD_PAY_SYSTEM,
                CARD_NN_FISCAL, CODE_TRANSACTION_FISCAL)=mrOk);
          if IS_BANK_TRANSACTION_FISCAL then  tc:=CODE_TRANSACTION_FISCAL;

        end;

      end;

      if not Refund_Ingenico(SUM_TO_PAY, tc, vPaySystem, card_nn, trans_code) then
      begin
        MessageDlg('Не могу передать терминалу команду возврата!', mtError, [mbOk], 0);
        result:=False;
        Exit;
      end;

    end;
  except
    on E: Exception do
    begin
      MessageDlg('Системная ошибка при работе с терминалом! '+E.Message, mtError, [mbOk], 0);
      result:=False;
      Exit;
    end;

  end;

end;


function TF_SaleDoc.Bank_Terminal_Go(is_fiscal:boolean; SUM_TO_PAY:extended; PORT:string;
var vPaySystem, card_nn, trans_code:string):boolean;
var
  handle: POS_HANDLE;
  loop: ByteBool;
  resp: integer;
  timeout: integer;
  val: array[0..10240] of char;

  s_opl, s1,s2:string;
  r:integer;
  v_result:boolean;
  Writer :TStreamWriter;
  trans_id:string;
  Handle_Progress:THandle;
  is_repeat_open:boolean;

  function wait_responce:boolean;
  var  duration_wait_sec:integer;
    i: Integer;
  begin
    result:=False;

    loop := true;
    time_start_wait_BankGoProgress:=Now;
    while (loop) do begin

      resp := pos_receive(handle, timeout);

     //   Writer.WriteLine(resp);
      duration_wait_sec:= Trunc((Now - time_start_wait_BankGoProgress)*SecsPerDay);
      if duration_wait_sec>max_duration_wait_sec then
      begin
        Memo1.Lines.Add('Время ожидания ответа от терминала истекло!');
        loop := false;
        Break;
      end;

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
            // получить идентификатор транзакции
            if pos_get(handle, POS_TRANS_CODE,  @val[0], sizeof(val)) then
            begin
              s2:=StrOemToAnsi(String(val));
              trans_code:=s2;
              Memo1.Lines.Add(Format('%s = %s', ['Идентификатор транзакции', s2]));

              // получить номер карты
              if pos_get(handle, POS_CARD_PAN,  @val[0], sizeof(val)) then
              begin
                s2:=StrOemToAnsi(String(val));
                card_nn:=s2;
                Memo1.Lines.Add(Format('%s = %s', ['№ карты', s2]));
                 // получить платежную систему
                  if pos_get(handle, POS_CARD_PAYMENT_SYS,  @val[0], sizeof(val)) then
                  begin
                    s2:=StrOemToAnsi(String(val));
                    vPaySystem:=s2;
                    Memo1.Lines.Add(Format('%s = %s', ['Платежная система ', s2]));
                    result:=True;
                  end
                  else
                  begin
                    Memo1.Lines.Add('Не могу получить платежную систему');
                  end;

              end
              else
              begin
                Memo1.Lines.Add('Не могу получить № карты');
              end;


            end
            else
            begin
              Memo1.Lines.Add('Не могу получить Идентификатор транзакции');
            end;

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
            // получить идентификатор транзакции
            if pos_get(handle, POS_TRANS_ID,  @val[0], sizeof(val)) then
            begin
              s2:=StrOemToAnsi(String(val));
              trans_id:=s2;
              Memo1.Lines.Add(Format('%s = %s', ['Локальный идентификатор транзакции', s2]));
              Memo1.Lines.Add(Format('Ожидайте до %d мин  %d сек',
              [Round(F_Main.TIMEOUT_BANK_TERM/60000),
               Round((F_Main.TIMEOUT_BANK_TERM/60000-Round(F_Main.TIMEOUT_BANK_TERM/60000))*60)
              ]));

            end;

          end;  // RESP_IDENTIFIER:

        RESP_ERROR:
          begin
            Memo1.Lines.Add('Ответ терминала RESP_ERROR');
            PrintResponse(handle);
            loop := false;
          end;  //  RESP_ERROR:

       { RESP_INPUT:
          begin
            Memo1.Lines.Add('Ответ терминала RESP_INPUT');
            PrintResponse(handle);
            loop := false;
          end;  //  RESP_INPUT:

        RESP_KEEPALIVE:
          begin
            Memo1.Lines.Add('Ответ терминала RESP_KEEPALIVE');
            PrintResponse(handle);
            loop := false;
          end;  //  RESP_KEEPALIVE:

        RESP_WRONG_MAC:
          begin
            Memo1.Lines.Add('Ответ терминала RESP_WRONG_MAC');
            PrintResponse(handle);
            loop := false;
          end;  //  RESP_WRONG_MAC:
          }
        else
        begin
          Memo1.Lines.Add(Format('Ответ терминала UNKNOWN= %s', [IntToStr(resp)]));
          loop := pos_send(handle, ACTION_BREAK);
        end;

      end;  //  case (resp) of
    end; // while (loop) do begin

  end;     // function wait_responce;

begin
// v_result:=True;   // убрать после отладки
// exit;           //   убрать после отладки

//  PanelBankTerm.Height:=150;
  v_result:=False;
  card_nn:='';
  trans_code:='';

  Memo1.Clear;
  handle := POS_NONE;
  // запустить внешнее приложение PosBamk_Progress
//  ShellExecute(Handle_Progress, 'open', PWideChar(ExtractFilePath(ParamStr(0)) + 'PosBamk_Progress.exe'), nil, nil, SW_SHOW);

//  SetWindowPos(Handle_Progress, HWND_TOP, Round(Screen.Width/2), Round(Screen.Height/2), 0, 0, SWP_NOSIZE);

 {
  if not pos_open(handle, PAnsiChar(AnsiString(PORT))) then
  begin
    MessageDlg(Format('Не могу открыть порт терминала %s !',[PORT]), mtError, [mbOk], 0);
    result:=v_result;

   // KillAnother('Ход операции'); // завершить внешнее приложение PosBamk_Progress
    Exit;
  end;
  }

  is_repeat_open:=True;
  while is_repeat_open do
  begin
    pos_Close(handle);
    If not pos_open(handle, PAnsiChar(AnsiString(PORT))) then
    begin
      if MessageDlg(Format('Не могу открыть порт терминала %s! Повторить попытку?',[PORT]),
      mtError, [mbYes, mbNo], 0)= mrNo then
      begin
        is_repeat_open:=False;
        result:=False;
        Exit;
      end;
    end
    else is_repeat_open:=False;
  end;


  s_opl:=IntToStr(Round(SUM_TO_PAY*100)); // пересчет в копейки
  pos_set(handle, POS_AMOUNT, PAnsiChar(AnsiString(s_opl))); // сумма к оплате в копейках
  pos_set(handle, POS_CURRENCY, PAnsiChar('980')); // UAH валюта

  // хост ФОП Лавреновой Т О из настроек терминала
 // pos_set(handle, POS_PROFILE, PAnsiChar('P0001027.P0001027.V211101220111.15.5.50.5.8,12.9'));

  if ID_DOC_TYPE=200 then   // продажа
  begin
    if not pos_send(handle, ACTION_PAYMENT) then
    begin
      MessageDlg('Не могу передать терминалу команду оплаты!', mtError, [mbOk], 0);
      result:=v_result;
      Exit;
    end;
  end;

  if ID_DOC_TYPE=204 then   // возврат
  begin
   if not is_fiscal then
   begin
    if Trim(CODE_TRANSACTION_NOT_FISCAL)<>'' then
      pos_set(handle, POS_TRANS_CODE, PAnsiChar(CODE_TRANSACTION_NOT_FISCAL)); // код оригин транзакции
   end
   else
   begin
    if Trim(CODE_TRANSACTION_FISCAL)<>'' then
      pos_set(handle, POS_TRANS_CODE, PAnsiChar(CODE_TRANSACTION_FISCAL)); // код оригин транзакции
   end;

    if not pos_send(handle, ACTION_RETURN) then
    begin
      MessageDlg('Не могу передать терминалу команду возврата!', mtError, [mbOk], 0);
      result:=v_result;
      Exit;
    end;
  end;


 // Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\BANK_TERM.dat', false,  TEncoding.ANSI);

  max_duration_wait_sec:=60; // максимальное время ожидания отклика от банковского терминала в секундах
  timeout := F_Main.TIMEOUT_BANK_TERM; { 1 min -60000 }


  time_start_wait_BankGoProgress:=Now;


  v_result:=wait_responce; // ожидание ответа терминала



  if  not v_result then
  begin
    is_repeat_open:=True;
    while is_repeat_open do
    begin
      pos_Close(handle);
      If not pos_open(handle, PAnsiChar(AnsiString(PORT))) then
      begin
        if MessageDlg(Format('Не могу открыть порт терминала %s! Повторить попытку?',[PORT]),
        mtError, [mbYes, mbNo], 0)= mrNo then
        begin
          is_repeat_open:=False;
          result:=False;
          Exit;
        end;
      end
      else is_repeat_open:=False;

    end;

    pos_set(handle, POS_TRANS_ID, PAnsiChar(AnsiString(trans_id)));
    if not pos_send(handle, ACTION_STATUS) then
    begin
      MessageDlg('Не могу передать терминалу команду ACTION_STATUS!', mtError, [mbOk], 0);
      result:=v_result;
      Exit;
    end;
     v_result:=wait_responce; // ожидание ответа терминала

  end;

  {
  while not v_result do
  begin
    r:=FInpBank_Transaction_infoDlg(vPaySystem, card_nn, trans_code);
    if r=mrCancel then
    begin
      v_result:=False;
      break;
    end;
    if r=mrRetry then
    begin
      v_result:=wait_responce; // ожидание ответа терминала
    end;
    if r=mrOk then
    begin
      v_result:=True;
      break;
    end;


  end;  }

  //  Writer.Free();
  pos_Close(handle);

 
  result:=v_result;

end;

procedure TF_SaleDoc.Opl_Bank_Card(vIS_BANK_TRANSACTION_NOT_FISCAL:boolean;
vCARD_NN_NOT_FISCAL, vCODE_TRANSACTION_NOT_FISCAL:string; isManualInput_Transaktion:boolean);
begin
 // оплата банковской картой
  if TOT_MONEY>eps then
  begin
   PanelBankTerm.Height:=152;
   self.Repaint;
   SUM_OPL_NAL:=0.0;
   E_OPL_NAL.Text:='';

   IS_BANK_TRANSACTION_NOT_FISCAL:=False;
   IS_BANK_TRANSACTION_FISCAL:=False;


     // итоговые округленные суммы корректируем без округления оплаты по фискальнам  и нефискальным чекам
   ROUND_TOT_SUM_FISCAL:=TOT_SUM_FISCAL;
   Sum_Round(0.01, ROUND_TOT_SUM_FISCAL);

   ROUND_TOT_SUM_NOT_FISCAL :=TOT_SUM_NOT_FISCAL;
   Sum_Round(0.01, ROUND_TOT_SUM_NOT_FISCAL);
   D_ROUND_TOT_SUM_FISCAL:=ROUND_TOT_SUM_FISCAL-TOT_SUM_FISCAL;
   D_ROUND_TOT_SUM_NOT_FISCAL:= ROUND_TOT_SUM_NOT_FISCAL-TOT_SUM_NOT_FISCAL;

   E_D_RoundNotFiscal.Text:=Format('%.2f',[D_ROUND_TOT_SUM_NOT_FISCAL]);
   TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;
   SUM_OPL_NAL:=0.0;
   E_OPL_NAL.Text:='';
   E_SDACHA.Text:='';
   E_SDACHA_TO_BONUS_CARD.Text:='';
   SUM_SDACHA_TO_BONUS_CARD:=0;
   SUM_SDACHA:=0;




   try

     if vIS_BANK_TRANSACTION_NOT_FISCAL then
     begin
      IS_BANK_TRANSACTION_NOT_FISCAL:=True;
      CARD_NN_NOT_FISCAL := vCARD_NN_NOT_FISCAL;
      CODE_TRANSACTION_NOT_FISCAL := vCODE_TRANSACTION_NOT_FISCAL;
     end
     else
     begin
      if IS_ALCOGOL_CHECK=0 then
      begin
        if isManualInput_Transaktion then
        begin
         IS_BANK_TRANSACTION_NOT_FISCAL:=(FInpBank_Transaction_infoDlg(CARD_PAY_SYSTEM,
              CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL)=mrOk)
        end
        else
        begin
          if F_Main.BANK_TERMINAL=0 then
            IS_BANK_TRANSACTION_NOT_FISCAL:=Bank_Terminal_Go(False, TOT_MONEY,F_Main.COM_PORT_BANK_TERM_NOT_FISCAL,
              CARD_PAY_SYSTEM, CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL)
          else   IS_BANK_TRANSACTION_NOT_FISCAL:=Bank_Terminal_Ingenico_Go(False, TOT_MONEY,
              CARD_PAY_SYSTEM, CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL)

        end;
      end
      else
      begin
        if isManualInput_Transaktion then
        begin
         IS_BANK_TRANSACTION_FISCAL:=(FInpBank_Transaction_infoDlg(CARD_PAY_SYSTEM,
              CARD_NN_FISCAL, CODE_TRANSACTION_FISCAL)=mrOk)
        end
        else
        begin
          if F_Main.BANK_TERMINAL=0 then
            IS_BANK_TRANSACTION_FISCAL:=Bank_Terminal_Go(False, TOT_MONEY,F_Main.COM_PORT_BANK_TERM_FISCAL,
            CARD_PAY_SYSTEM, CARD_NN_FISCAL, CODE_TRANSACTION_FISCAL)
          else IS_BANK_TRANSACTION_FISCAL:=Bank_Terminal_Ingenico_Go(False, TOT_MONEY,
            CARD_PAY_SYSTEM, CARD_NN_FISCAL, CODE_TRANSACTION_FISCAL)
        end;
      end;
     end;


    //  IS_BANK_TRANSACTION_NOT_FISCAL:=Bank_Terminal_Go(False, TOT_MONEY,F_Main.COM_PORT_BANK_TERM_NOT_FISCAL,
   //   CARD_NN_NOT_FISCAL, CODE_TRANSACTION_NOT_FISCAL);

      if IS_BANK_TRANSACTION_NOT_FISCAL or IS_BANK_TRANSACTION_FISCAL then
      begin
        if not F_main.IS_RECEPT_TO_REGISTR_RRO then SetRecept_To_Registr;   // безнал всегда регистрировать ПРРО
        F_Main.Last_IS_BEZNAL_OPL:=True;
        BB_Pay_Bank_Not_Fiscal.Caption:='Оплачена картой сумма';
        BB_Pay_Bank_Not_Fiscal.Enabled:=False;
        SUM_OPL_CARD:=TOT_MONEY;
        E_OPL_NAL.Text :='';
        E_OPL_NAL.Enabled:=False;
        SUM_OPL_NAL:=0.0;
        SUM_SDACHA := 0.0;
        E_SDACHA.Text:='';

        SUM_SDACHA_TO_BONUS_CARD := 0.0;
        E_SDACHA_TO_BONUS_CARD.Text:='';

        BBPay.Enabled:=False;

         // контроль возможности печати чека
        Control_Print_Cash_Receipt_Enabled;
        // регистрация и печать
        if BBPrint_Cash_Receipt.Enabled then  Action_Print_Cash_ReceiptExecute(Self);

      end
      else
      begin
       PanelBankTerm.Height:=41;
        self.Repaint;
        MessageDlg('Оплата банк-картой не прошла!', mtError,[mbOk], 0);
        SUM_OPL_CARD:= 0.0;
        E_OPL_NAL.Enabled:=True;
        E_OPL_NAL.SetFocus;

           // восстанавливаем округление итоговых сумм оплаты по фискальнам  и нефискальным чекам
        ROUND_TOT_SUM_FISCAL:=TOT_SUM_FISCAL;
        Sum_Round(0.1, ROUND_TOT_SUM_FISCAL);

        ROUND_TOT_SUM_NOT_FISCAL :=TOT_SUM_NOT_FISCAL;
        Sum_Round(0.1, ROUND_TOT_SUM_NOT_FISCAL);
        D_ROUND_TOT_SUM_FISCAL:=ROUND_TOT_SUM_FISCAL-TOT_SUM_FISCAL;
        D_ROUND_TOT_SUM_NOT_FISCAL:= ROUND_TOT_SUM_NOT_FISCAL-TOT_SUM_NOT_FISCAL;

        E_D_RoundNotFiscal.Text:=Format('%.2f',[D_ROUND_TOT_SUM_NOT_FISCAL]);
        TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;
        SUM_OPL_NAL:=0.0;
        E_OPL_NAL.Text:='';
        E_SDACHA.Text:='';
        E_SDACHA_TO_BONUS_CARD.Text:='';
        SUM_SDACHA_TO_BONUS_CARD:=0;
        SUM_SDACHA:=0;

        exit;
      end;
    except
      PanelBankTerm.Height:=41;
      self.Repaint;
      MessageDlg('Оплата банк-картой не прошла!', mtError,[mbOk], 0);
      SUM_OPL_CARD:= 0.0;
      E_OPL_NAL.Enabled:=True;
      E_OPL_NAL.SetFocus;
             // восстанавливаем округление итоговых сумм оплаты по фискальнам  и нефискальным чекам
      ROUND_TOT_SUM_FISCAL:=TOT_SUM_FISCAL;
      Sum_Round(0.1, ROUND_TOT_SUM_FISCAL);

      ROUND_TOT_SUM_NOT_FISCAL :=TOT_SUM_NOT_FISCAL;
      Sum_Round(0.1, ROUND_TOT_SUM_NOT_FISCAL);
      D_ROUND_TOT_SUM_FISCAL:=ROUND_TOT_SUM_FISCAL-TOT_SUM_FISCAL;
      D_ROUND_TOT_SUM_NOT_FISCAL:= ROUND_TOT_SUM_NOT_FISCAL-TOT_SUM_NOT_FISCAL;

      E_D_RoundNotFiscal.Text:=Format('%.2f',[D_ROUND_TOT_SUM_NOT_FISCAL]);
      TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;
      SUM_OPL_NAL:=0.0;
      E_OPL_NAL.Text:='';
      E_SDACHA.Text:='';
      E_SDACHA_TO_BONUS_CARD.Text:='';
      SUM_SDACHA_TO_BONUS_CARD:=0;
      SUM_SDACHA:=0;

      exit;
   end;
 end
 else   MessageDlg('Сумма =0', mtError,[mbOk], 0);

  if SUM_OPL_CARD>=eps then
    Label_already_paid_credit_card.Caption:=Format('Уже оплачено банковской картой %.2f',[SUM_OPL_CARD])
  else Label_already_paid_credit_card.Caption:='';
  E_OPL_NALChange(Self);

end;


procedure TF_SaleDoc.Action_Opl_Bank_CardExecute(Sender: TObject);
begin
 Label_Opl_Bank.Caption:=Format('Ожидайте до %d мин  %d сек',
              [Round(F_Main.TIMEOUT_BANK_TERM/60000),
               Round((F_Main.TIMEOUT_BANK_TERM/60000-Round(F_Main.TIMEOUT_BANK_TERM/60000))*60)
              ]);

  Opl_Bank_Card(False,'','', False);
  Label_Opl_Bank.Caption:='';

end;


procedure TF_SaleDoc.Action_Opl_BonusExecute(Sender: TObject);
begin
  // оплата бонусами SUM_BONUS_BALL_FOR_PAY
  is_Opl_Bonus:=not is_Opl_Bonus;

  if is_Opl_Bonus then
  begin
    if SUM_BONUS_BALL>TOT_SUM_NOT_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL then  SUM_OPL_BONUS:=TOT_SUM_NOT_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL
    else SUM_OPL_BONUS:=SUM_BONUS_BALL;
    SUM_OPL_BONUS:=Float_cat_to(SUM_OPL_BONUS, 0.1);
    BB_OPL_BONUS.Caption:='Не платить бонус'
  end
  else
  begin
    SUM_OPL_BONUS:=0.0;
    BB_OPL_BONUS.Caption:='Платить бонусами'
  end;



  E_OPL_BONUS.ReadOnly:=not is_Opl_Bonus;
  E_OPL_BONUS.Text:=Format('%.2f',[SUM_OPL_BONUS]);


  TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;

  E_TOT_MONEY.Text:=Format('%.2f',[TOT_MONEY]);

end;

procedure TF_SaleDoc.Action_PayExecute(Sender: TObject);
var s1_displ,s2_displ,status_RRO :string;
begin
  if not SaveDoc(0) then   Exit;

  if F_Main.RRO_ENABLED=1 then
  begin
    F_main.IS_RECEPT_TO_REGISTR_RRO:=  Need_Register_RRO; // проверка необходимости регистрации чека РРО
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
      status_RRO:='Y'
    else status_RRO:='N';
      // Р - сумма зарегистрированных продаж РРО в день; М - ограничение макс суммы РРО; Н - незарегистрир; В - сумма всех прлаж
      StatusBar1.Panels[2].Text:=Format('C-%s',[status_RRO]);
  end;

  is_Oplata_Go:=Not is_Oplata_Go;
  // Panel_Price.Visible:= not is_Oplata_Go;
  PanelSearch.Visible:= not is_Oplata_Go;

  if is_Oplata_Go then
  begin
    if ExistFiscalPrinter then  // есть фискальный регистратор
    begin
      // определить фискальную и не фискальную сумму к оплате по фискальным товарам и нефискальным товарам
      SP_CALC_DOC_FISCAL_TYPE_RESULT.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      SP_CALC_DOC_FISCAL_TYPE_RESULT.Parameters.ParamValues['@IDU']:=ID_user_select;
      SP_CALC_DOC_FISCAL_TYPE_RESULT.ExecProc;
      if SP_CALC_DOC_FISCAL_TYPE_RESULT.Parameters.ParamValues['@ER']<>0 then
      begin
      MessageDlg('Ошибка при расчете фискальных итогов документа!', mtError, [mbOk], 0);
      TOT_SUM_FISCAL:=0;
      TOT_SUM_NOT_FISCAL:=0;
      end
      else
      begin
      TOT_SUM_FISCAL:=SP_CALC_DOC_FISCAL_TYPE_RESULT.Parameters.ParamValues['@TOT_SUM_FISCAL'];
      //  скидка учитывается только на нефиск. суммах
      TOT_SUM_NOT_FISCAL:= SP_CALC_DOC_FISCAL_TYPE_RESULT.Parameters.ParamValues['@TOT_SUM_NOT_FISCAL']-
        SKIDKA;

      end;

    end   // if ExistFiscalPrinter then
    else
    begin
    // нет фискальных регистраторов
      TOT_SUM_FISCAL:=0;
      TOT_SUM_NOT_FISCAL:=TOT_SUM;

    end;   // else if ExistFiscalPrinter then

   E_TOT_NOT_FISCAL_SUM.Text:=Format('%.2f',[TOT_SUM_NOT_FISCAL]);




    // итоговые округленные суммы оплаты по фискальнам  и нефискальным чекам

   ROUND_TOT_SUM_FISCAL:=TOT_SUM_FISCAL;
   Sum_Round(0.1, ROUND_TOT_SUM_FISCAL);

   ROUND_TOT_SUM_NOT_FISCAL :=TOT_SUM_NOT_FISCAL;
   Sum_Round(0.1, ROUND_TOT_SUM_NOT_FISCAL);
   D_ROUND_TOT_SUM_FISCAL:=ROUND_TOT_SUM_FISCAL-TOT_SUM_FISCAL;
   D_ROUND_TOT_SUM_NOT_FISCAL:= ROUND_TOT_SUM_NOT_FISCAL-TOT_SUM_NOT_FISCAL;

   E_D_RoundNotFiscal.Text:=Format('%.2f',[D_ROUND_TOT_SUM_NOT_FISCAL]);


   // вывод на дисплей покупателя
   if TOT_SUM_NOT_FISCAL<Eps then
   begin
      s1_displ:=Format('До сплати %.2f',[TOT_SUM_FISCAL ]);
      s2_displ:='';
   end;
   if TOT_SUM_FISCAL<Eps then
   begin
      s1_displ:=Format('До сплати %.2f',[TOT_SUM_NOT_FISCAL ]);
      s2_displ:='';
   end;

   if (TOT_SUM_FISCAL>Eps) and (TOT_SUM_NOT_FISCAL>Eps) then
   begin
     s1_displ:=Format('До сплати %.2f +',[TOT_SUM_NOT_FISCAL ]);
     s2_displ:=Format('%.2f=%.2f',[TOT_SUM_FISCAL, TOT_SUM_NOT_FISCAL+TOT_SUM_FISCAL]);
   end;


   PrintToBuyerDisplay(s1_displ, s2_displ );

  end;  // if is_Oplata_Go then


  Panel_Oplata.Visible:=is_Oplata_Go;

  BBBonusCard.Enabled:=not is_Oplata_Go;
  if is_Oplata_Go then
  begin
   // BB_OPL_BONUS.Enabled:=(SUM_BONUS_BALL>=c_minBonusBall);
    BB_OPL_BONUS.Enabled:=(SUM_BONUS_BALL>Eps);
    E_OPL_BONUS.Enabled:=(SUM_BONUS_BALL>Eps);

    case ID_DOC_TYPE of
    200: 
      begin
        BBPay.Caption:='Добавить в покупки'; // продажа
      end;
    204:
      begin
        BBPay.Caption:='Вернуться к товарам'; // возвраты
      end;

   end;


   // TOT_MONEY:=TOT_SUM_NOT_FISCAL-Int(SUM_OPL_BONUS)+D_ROUND_TOT_SUM_NOT_FISCAL;
    TOT_MONEY:=TOT_SUM_NOT_FISCAL-SUM_OPL_BONUS+D_ROUND_TOT_SUM_NOT_FISCAL;

    E_TOT_MONEY.Text:=Format('%.2f',[TOT_MONEY]);
    TOT_MONEY_FISCAL:=TOT_SUM_FISCAL+D_ROUND_TOT_SUM_FISCAL;


    if SUM_OPL_CARD>=eps then
      Label_already_paid_credit_card.Caption:=Format('Уже оплачено банковской картой %.2f',[SUM_OPL_CARD])
    else Label_already_paid_credit_card.Caption:='';
    E_OPL_NALChange(Sender);

 

  end
  else
  begin

   case ID_DOC_TYPE of
    200: BBPay.Caption:='Принять оплату'; // продажа
    204: BBPay.Caption:='Вернуть денеги'; // возвраты
   end;
   
   SUM_OPL_NAL:=0.0;
   E_OPL_NAL.Text:=''; // Format('%.2f',[SUM_OPL_NAL]);
   E_SDACHA.Text:='';
   E_SDACHA_TO_BONUS_CARD.Text:='';
   SUM_SDACHA_TO_BONUS_CARD:=0;
   SUM_SDACHA:=0;

   SUM_OPL_NAL_FISCAL:=0.0;


   E_OPL_NALChange(Sender);
  end;
  if  is_Oplata_Go then
  begin
   

    if TOT_MONEY>Eps then
    begin
    E_OPL_NAL.Enabled:=True;
    E_OPL_NAL.SetFocus;
    EditElementInFocus:=E_OPL_NAL;
    end
    else
    begin
      E_OPL_NAL.Enabled:=False;
    end;

  end
  else
  begin
    Edit1.SetFocus;
    EditElementInFocus:=Edit1;
  end;
end;

(*
function TF_SaleDoc.RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
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
      JSONNestedObject.AddPair('REMAINS', TJSONNumber.Create(SUM_SDACHI)); //Решта (не зазначається, якщо решта відсутня) (15.2 цифри)-->
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

*)


 // внести данные о регистрации документа в налоговой
procedure TF_SaleDoc.Set_RRO_DATE_TO_NAKLCAP(IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
 CHECK_NUMLOCAL, CHECK_NUMFISCAL, ORDERDATETIME, QRCODE_REG:string; ID_NAKLCAP_PROTOTYPE:longInt);
begin

DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP_PROTOTYPE']:=ID_NAKLCAP_PROTOTYPE;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=IS_CAN_REGISTRED_RRO;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_REGISTER_RRO']:=IS_REGISTER_RRO;

if IS_ALCOGOL_CHECK=0 then
begin
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_CLI_RRO']:= F_main.ID_CLI_FISCAL;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NUM_FISCAL_KASSA']:= F_main.ID_NUM_FISCAL_KASSA;
end
else
begin
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_CLI_RRO']:= F_main.ID_CLI_FISCAL_ALCOGOL;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NUM_FISCAL_KASSA']:= F_main.ID_NUM_FISCAL_KASSA_ALCOGOL;
end;

DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMLOCAL']:=CHECK_NUMLOCAL;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMFISCAL']:=CHECK_NUMFISCAL;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ORDERDATETIME']:=ORDERDATETIME;
DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@QRCODE_REG']:=QRCODE_REG;


DM1.SP_SET_RRO_DATA_TO_NAKLCAP.ExecProc;
if DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ER']<>0  then
begin
 MessageDlg('Ошибка при сохранении регистрации РРО!', mtError,  [mbOk], 0);
end;

end;





function TF_SaleDoc.Need_Register_RRO:boolean;
var is_nal, is_bonus, COUNT_NAL_CHECK_DAY_PROD, COUNT_BEZNAL_CHECK_DAY_PROD:integer;
SUM_NAL_CHECK_DAY_PROD, SUM_NAL_CHECK_DAY_PROD_REGISTR, SUM_BEZNAL_CHECK_DAY_PROD:extended;
begin

  if IS_ALCOGOL_CHECK=1 then  // алкогольные чеки всегда регистрировать
  begin
   result:=True;
   exit;
  end;

  if F_main.MANUAL_CONTROL_RRO=1 then // 0 автоматическое 1 - ручное управление ПРРО
  begin
   result:=F_main.IS_RECEPT_TO_REGISTR_RRO; //признак необходимости регистрировать чек ПРРО
   exit;
  end;



  result:=False;
  with Q_COUNT_CHECK_NAL_BEZNAL do
  begin
      Close;
      if IS_ALCOGOL_CHECK=0 then Parameters.ParamByName('ID_CLI_RRO').Value:= F_Main.ID_CLI_FISCAL
      else Parameters.ParamByName('ID_CLI_RRO').Value:= F_Main.ID_CLI_FISCAL_ALCOGOL;
      Open;
      First;
      COUNT_NAL_CHECK_DAY_PROD:=FieldByName('COUNT_NAL_CHECK_DAY_PROD').AsInteger;  // кол-во чеков продажи за наличку текущего дня
      COUNT_BEZNAL_CHECK_DAY_PROD:=FieldByName('COUNT_BEZNAL_CHECK_DAY_PROD').AsInteger;  // кол-во чеков продажи по безналу  текущего дня
      SUM_NAL_CHECK_DAY_PROD:=FieldByName('SUM_NAL_CHECK_DAY_PROD').AsFloat;  // Сумма продажи за наличку текущего дня
      SUM_NAL_CHECK_DAY_PROD_REGISTR:=FieldByName('SUM_NAL_CHECK_DAY_PROD_REGISTR').AsFloat;  // Сумма зарегистрированных продажи за наличку текущего дня
      SUM_BEZNAL_CHECK_DAY_PROD:=FieldByName('SUM_BEZNAL_CHECK_DAY_PROD').AsFloat;  // Сумма продажи по безналу  текущего дня


      Close;
  end;



   with Q_IS_NAL do
   begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
     Open;
     is_nal:=FieldByName('IS_NAL').AsInteger;
     Close;
   end;
   with Q_IS_BONUS do
   begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
     Open;
     is_bonus:=FieldByName('IS_BONUS').AsInteger;
     Close;
   end;
   if is_nal=1 then  // оплата в чеке наличкой
   begin

 {   if COUNT_NAL_CHECK_DAY_PROD=1 then // первую всегда регистрировать
    begin
      result:=True;
      Exit;
    end;  }

     if is_bonus=1 then // часть оплаты наличкой, часть опл бонусами - не регистрировать
     begin
      result:= False;
      exit;
     end;

     result:=((COUNT_NAL_CHECK_DAY_PROD Mod F_Main.EACH_NAL_REGISTER_RRO)=0); // каждый EACH_NAL_REGISTER_RRO тый нужно регистрировать
     result:= (SUM_NAL_CHECK_DAY_PROD_REGISTR+TOT_SUM<=F_Main.MAX_REAL_RRO) and result;  // проверка на ограничение зарегистрированных наличных оплат
   end
   else
   begin
  {  if COUNT_BEZNAL_CHECK_DAY_PROD=1 then // первую всегда регистрировать
    begin
      result:=True;
      Exit;
    end; }
     result:=((COUNT_BEZNAL_CHECK_DAY_PROD Mod F_Main.EACH_BEZNAL_REGISTER_RRO)=0);   // каждый EACH_BEZNAL_REGISTER_RRO нужно регистрировать
   end;



end;



function TF_SaleDoc.Need_Register_Vozvr_RRO:boolean;
begin
 // result:=((IS_CAN_REGISTRED_RRO_PROTOTYPE=1) and (IS_REGISTER_RRO_PROTOTYPE=1));
    result:=False;
end;

    // получить jpeg образ QR кода в строковом виде
function TF_SaleDoc.GetQRCodeImgStr(QRText :string):string;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  QRCodeBitmap: TBitmap;
  JPEG :TJPEGImage;
  jpeg_stream: TMemoryStream;
  s:string;
begin
  result:='';
  QRCodeBitmap := TBitmap.Create;
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := QRText;
    QRCode.Encoding := TQRCodeEncoding(0); //Auto
    QRCode.QuietZone := 4;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;


  JPEG := TJPEGImage.create;
  JPEG.Assign(QRCodeBitmap);
  jpeg_stream:= TMemoryStream.Create;
  JPEG.SaveToStream(jpeg_stream);

  SetString(s, PAnsiChar(jpeg_stream.Memory), jpeg_stream.Size);
  result:=s;
  JPEG.Free;
  QRCodeBitmap.Free;
  jpeg_stream.Free;

end;


procedure TF_SaleDoc.Action_Print_Cash_ReceiptExecute(Sender: TObject);
var vSUM_BALL:extended;
v_INN:string;
 QRCode, NumFiscal,  NumLocal, OrderDateTime, QRText :string;
 IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
begin
//  if Valid_Oplata() then
//  begin
    v_INN:=Trim(Edit_BonusCard.Text);
    // накапливать бонусы для зарегистрированной бонусной карты
    if is_Registered_Client then
    begin
      // начисление баллов и выгрузка инфо о бонусной карте INN клиента
      SetBonusCli(v_INN, S_KOLBASA_NOT_ACTION, S_MYASO_NOT_ACTION, S_TNP_NOT_ACTION, SUM_OPL_BONUS, SUM_SDACHA_TO_BONUS_CARD);
    end;

    if SaveDoc(1) then
    begin

      case ID_DOC_TYPE of
      200:      // продажа
        begin
          PrintToBuyerDisplay('Дякую! Хай завжди', 'буде смачно!' );
          IS_CAN_REGISTRED_RRO:=0;
          IS_REGISTER_RRO:=0;

          QRCode:= '';
          NumFiscal:='';
          NumLocal:= '';
          OrderDateTime:='';

          if F_Main.RRO_ENABLED=1 then
          begin
          //  F_main.IS_RECEPT_TO_REGISTR_RRO:=  Need_Register_RRO; // проверка необходимости регистрации чека РРО

            if F_main.IS_RECEPT_TO_REGISTR_RRO then  //признак необходимости регистрировать чек ПРРО
            begin
              IS_CAN_REGISTRED_RRO:=1;
              IS_REGISTER_RRO:=1;
              if not F_Main.RegisterCheck_RRO(IS_ALCOGOL_CHECK, ID_NAKLCAP,  QRCode,
                NumFiscal,  NumLocal, OrderDateTime , true, '') then
              begin
                IS_REGISTER_RRO:=0;
                MessageDlg('Ошибка при регистрации РРО!', mtError,  [mbOk], 0);
                 // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
                // QRCode - url на web инфо о накладной продажи или возврата
                QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
                NumLocal:=IntToStr(ID_NAKLCAP);
                NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
                OrderDateTime:=DateToISO8601(Date(),True);
                // получить jpeg образ QR кода в строковом виде
                QRCode:=GetQRCodeImgStr(QRText);
              end;
            end
            else
            begin
              // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
              // QRCode - url на web инфо о накладной продажи или возврата
              IS_CAN_REGISTRED_RRO:=0;
              IS_REGISTER_RRO:=0;
              QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
              NumLocal:=IntToStr(ID_NAKLCAP);
              NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
              OrderDateTime:=DateToISO8601(Date(),True);
              // получить jpeg образ QR кода в строковом виде
              QRCode:=GetQRCodeImgStr(QRText);
            end;


          end // if RRO_ENABLED=1 then
          else
          begin
           // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
              // QRCode - url на web инфо о накладной продажи или возврата
              IS_CAN_REGISTRED_RRO:=0;
              IS_REGISTER_RRO:=0;
              QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
              NumLocal:=IntToStr(ID_NAKLCAP);
              NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
              OrderDateTime:=DateToISO8601(Date(),True);
              // получить jpeg образ QR кода в строковом виде
              QRCode:=GetQRCodeImgStr(QRText);
          end;
          // внести данные о регистрации документа в налоговой или у нас на сервере
          // было раньше -- если не регистрировался текущий чек, то данные регистрации берем из предыдущего зарегистрированного
          Set_RRO_DATE_TO_NAKLCAP(IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO,
                NumLocal, NumFiscal, OrderDateTime, QRCode,-1);


          Print_Cash_ReceiptWithRegisterRRO( ID_NAKLCAP, true, IS_ALCOGOL_CHECK, '' ); // здесь вывод на печать чека

          D_ROUND_TOT_SUM_NOT_FISCAL:=0;
          E_D_RoundNotFiscal.Text:='0';
          TOT_SUM_NOT_FISCAL:=0;
          E_TOT_NOT_FISCAL_SUM.Text:='0';
          TOT_SUM:=0;
          E_TOT_SUM.Text:='0';
          SUM_OPL_BONUS:=0.0;
          E_OPL_BONUS.Text:='0';
          SUM_SDACHA := 0.0;
          E_SDACHA.Text:='';
          SUM_SDACHA_TO_BONUS_CARD := 0.0;
          E_SDACHA_TO_BONUS_CARD.Text:='';
          SUM_SDACHA_FISCAL := 0.0;

          E_OPL_NAL.Text :='';
          SUM_OPL_NAL:=0.0;

          SUM_OPL_NAL_Fiscal:=0.0;

          // если предыдущая оплата была безнал и последняя ручная установка IS_RECEPT_TO_REGISTR_RRO = false
          // то устанавливаем после безнал оплаты последнюю установку IS_RECEPT_TO_REGISTR_RRO
          if not F_Main.Last_IS_RECEPT_TO_REGISTR_RRO  and F_Main.Last_IS_BEZNAL_OPL then
          begin
            F_main.IS_RECEPT_TO_REGISTR_RRO:=F_Main.Last_IS_RECEPT_TO_REGISTR_RRO;
            F_main.BitBtn26.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
            F_main.BitBtn27.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;

          end;

          F_main.Last_IS_BEZNAL_OPL:=False;


          Action_New_DocExecute(Sender);
        end;

      204:    // возврат
        begin

          IS_CAN_REGISTRED_RRO:=0;
          IS_REGISTER_RRO:=0;

          QRCode:= '';
          NumFiscal:='';
          NumLocal:= '';
          OrderDateTime:='';
          if F_Main.RRO_ENABLED=1 then
          begin

            if Need_Register_Vozvr_RRO  then  // проверка необходимости регистрации возвратного чека РРО
            begin
              IS_CAN_REGISTRED_RRO:=1;
              IS_REGISTER_RRO:=1;
              if not F_Main.RegisterCheck_RRO(IS_ALCOGOL_CHECK, ID_NAKLCAP,  QRCode,
                NumFiscal,  NumLocal, OrderDateTime , false, CHECK_NUMFISCAL_PROTOTYPE) then
              begin
                IS_REGISTER_RRO:=0;
                MessageDlg('Ошибка при регистрации возврата РРО!', mtError,  [mbOk], 0);
                // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
                // QRCode - url на web инфо о накладной продажи или возврата
                QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
                NumLocal:=IntToStr(ID_NAKLCAP);
                NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
                OrderDateTime:=DateToISO8601(Date(),True);
                // получить jpeg образ QR кода в строковом виде
                QRCode:=GetQRCodeImgStr(QRText);
              end;
            end
            else
              begin
                // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
                // QRCode - url на web инфо о накладной продажи или возврата
                IS_CAN_REGISTRED_RRO:=0;
                IS_REGISTER_RRO:=0;
                QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
                NumLocal:=IntToStr(ID_NAKLCAP);
                NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
                OrderDateTime:=DateToISO8601(Date(),True);
                // получить jpeg образ QR кода в строковом виде
                QRCode:=GetQRCodeImgStr(QRText);
              end;
          end // if RRO_ENABLED=1 then
          else
          begin
           // сгенерировать свой QRCode, NumFiscal,  NumLocal, OrderDateTime
              // QRCode - url на web инфо о накладной продажи или возврата
              IS_CAN_REGISTRED_RRO:=0;
              IS_REGISTER_RRO:=0;
              QRText:=F_main.QRTEXT_UNREGISTER_RRO; // https://novmk.com/NumFiscal=25256&NumLocal=5485686
              NumLocal:=IntToStr(ID_NAKLCAP);
              NumFiscal:=IntToStr(F_main.ID_TRADE_POINT);
              OrderDateTime:=DateToISO8601(Date(),True);
              // получить jpeg образ QR кода в строковом виде
              QRCode:=GetQRCodeImgStr(QRText);
          end;
          // внести данные о регистрации документа в налоговой
          // если не регистрировался текущий чек, то данные регистрации берем из предыдущего зарегистрированного
          Set_RRO_DATE_TO_NAKLCAP(IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO,
              NumLocal, NumFiscal, OrderDateTime, QRCode,ID_DOC_PROTOTYPE);

            // фискальный номен оригиналиного чека, с которого делается возврат
           Print_Cash_ReceiptWithRegisterRRO( ID_NAKLCAP, false, IS_ALCOGOL_CHECK, CHECK_NUMFISCAL_PROTOTYPE ); // здесь вывод на печать чека

          Close;
        end;
        // POS_инвентаризация товаров, возврат тары, POS_заказТНП, POS_приходТНП ,POS_Возврат ТНП поставщику, заказ колбасы, мяса
      206, 242, 163, 219, 220, 126, 198,  211, 217, 223, 225, 209, 216,
      237, 238, 228, 230, 232, 234,270,271,272, 276, 305:   // POS_заказТНП , колбасы, мяса,  возвраты ТНП поставщику,
        begin                                   //  возвраты колбасы, возвраты мяса. веревки, обрези, прих колбасы, заказы на возврат ТНП
          Close;
        end;

      end;
    end; //  if SaveDoc() then

//  end;
end;

procedure TF_SaleDoc.Weight_on_off_visualization;
begin
{ }
BBWeight_on_off.Glyph.Assign(nil);
EWeight.ReadOnly:=IsOnWeight;// CBOnWeight.Checked;
// if CBOnWeight.Checked then
 if IsOnWeight then
begin
  BBWeight_on_off.Glyph.LoadFromResourceName(hInstance, 'weight_on_80');
end
else
 begin
  BBWeight_on_off.Glyph.LoadFromResourceName(hInstance, 'weight_off_80');
  BB_naveski_add.Enabled:=True;

 end;
 { }
end;


procedure TF_SaleDoc.Action_Weight_on_offExecute(Sender: TObject);
begin

  // включение - выключение весов
  // CBOnWeight.Checked:= not CBOnWeight.Checked;
    IsOnWeight:=not IsOnWeight;
    OnWeightClick;
    Weight_on_off_visualization;

     // Блокировка ввода веса вручную 0-нет 1-да
   if F_main.BLOCKING_MANUAL_WEIGHT_ENTRY=1 then
   begin
      if LowerCase(Trim(dm1.ADODSPrice.FieldByName('EDIZM').AsString))='кг' then
      begin
        EWeight.ReadOnly:=True;

      end
      else
      begin
        EWeight.ReadOnly:=False;
      end;
   end
   else EWeight.ReadOnly:=False;


end;

// регистрация акцизных марок товара
function TF_SaleDoc.EXCISE_Mark_registration(v:extended; var EXCISE_BAR_CODE:string):boolean;
var n, nn:integer;
begin
  EXCISE_BAR_CODE:='';
 result:=true;
 if DM1.ADODSPrice.FieldByName('IS_EXCISE').AsInteger=1 then
 begin // товар имеет акцизную марку
  nn:=Round(v);
  if abs(nn-1)>Eps then
  begin
    MessageDlg('Акцизный товар вводится в чек по одному с дальнейшим вводом штрихкода его акцизной марки!', mtError,  [mbOk], 0);
    result:=false;

    Exit;
  end;


  n:=Round(DM1.ADODSPrice.FieldByName('NUMB').AsFloat)+nn;
  if n>6 then
  begin
    MessageDlg('В одном чеке акцизного товара каждого наименования не должно быть более шести!', mtError,  [mbOk], 0);
    result:=false;
    Exit;
  end
  else
  begin
  // ввод штрихкода акцизной марки
   if F_Inp_EXCISE_BAR_CODE_Dlg(EXCISE_BAR_CODE)=mrOk then
   begin
    if EXCISE_BAR_CODE<>'' then result:= True
    else result:= False;

   end
   else   result:= False;

  end;

 end;



end;


function TF_SaleDoc.ADD_naveski(v:extended):integer;
 var    id_new:longint;
        id_tov_tmp:longint;
        s_code, EXCISE_BAR_CODE:string;
        is_ok_control_fiscal_group:integer;
begin
Result:=1;
v:=SimpleRoundTo(v,-3);
if DM1.ADODSPrice.RecordCount=0 then
begin
  Result:=0;
  MessageDlg('Нет товаров для навески!', mtError,  [mbOk], 0);
  Exit;
end;

ID_TOV_Search:= DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger;
// проверка на единую фискальную группу товаров в документе чека
//  в одном чеке не должно быть алкоголя с другими продуктами

SP_CONTROL_ONE_FISCAL_GROUP.Parameters.ParamValues['@ID_USER']:=
 DM1.ADODSPrice.FieldByName('ID_USERS').AsInteger;
SP_CONTROL_ONE_FISCAL_GROUP.Parameters.ParamValues['@ID_TOV']:=
 DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger;
SP_CONTROL_ONE_FISCAL_GROUP.ExecProc;
if SP_CONTROL_ONE_FISCAL_GROUP.Parameters.ParamValues['@ER']=0  then
begin
 is_ok_control_fiscal_group:=SP_CONTROL_ONE_FISCAL_GROUP.Parameters.ParamValues['@IS_OK'];
 if is_ok_control_fiscal_group=0 then
 begin
  Result:=0;
  MessageDlg('Фискальная группа добавляемого товара не соответствует ф.г чека!'+
  'В одном чеке д.б. товары единой ф.г!', mtError,  [mbOk], 0);
  Exit;
 end;

 IS_ALCOGOL_CHECK:=SP_CONTROL_ONE_FISCAL_GROUP.Parameters.ParamValues['@IS_ALCOGOL'];
end
else
begin
  Result:=0;
  MessageDlg('Ошибка при проверке на единую фискальную группу!', mtError,  [mbOk], 0);
  Exit;
end;

if (RadioGroup1.ItemIndex=0) then
begin
  try
    s_code:=Trim(Edit1.Text);
    if s_code<>'' then  id_tov_tmp:= StrToInt(Trim(Edit1.Text))
    else id_tov_tmp:=ID_TOV_Search;


    if (ID_TOV_Search<>id_tov_tmp) then
     begin
      Result:=0;
      MessageDlg('Товар с таким кодом не найден!', mtError,  [mbOk], 0);
      Exit;
    end;


  except
    Result:=0;
    MessageDlg('Kод товара не число!', mtError,  [mbOk], 0);
    Exit;

  end; //   try

end; // if (RadioGroup1.ItemIndex=0) then


EXCISE_BAR_CODE:='';
if not EXCISE_Mark_registration(v, EXCISE_BAR_CODE) then
begin
  Result:=0;
  EWeight.Text:='';
  MessageDlg('Ошибка при добавлении акцизной марки!', mtError,  [mbOk], 0);
  exit;
end;

dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@ID_USER']:=
 DM1.ADODSPrice.FieldByName('ID_USERS').AsInteger;
dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@ID_TOV']:=
 DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger;
dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@NUMB']:=v;
dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@EXCISE_BAR_CODE']:=EXCISE_BAR_CODE;
dm1.SP_NAVESKI_ADD.ExecProc;
if dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@ER']=0  then
begin
 id_new:=dm1.SP_NAVESKI_ADD.Parameters.ParamValues['@ID_NEW'];
 with dm1.QNAVESKI_TMP do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('IDUSER').Value:=dm1.ADODSPrice.fieldByName('ID_USERS').AsInteger;
  Parameters.ParamByName('IDTOV').Value:=dm1.ADODSPrice.fieldByName('ID_TOV').AsInteger;
  Open;
  Locate('ID',id_new,[loCaseInsensitive]);
  EnableControls;
 end;
 Sum_naveski;
 DM1.QPriceTovSelect.Locate('ID_TOV', ID_TOV_Search,[loCaseInsensitive] );
 PrintToBuyerDisplay(Format('%.3f*%.2f', [DM1.QPriceTovSelect.FieldByName('NUMB').Asfloat,
          DM1.QPriceTovSelect.FieldByName('price_select').Asfloat]),
 Format('Сумма %.2f ', [DM1.QPriceTovSelect.FieldByName('ss').Asfloat]) );
end
else
begin
  Result:=0;
  MessageDlg('Ошибка при добавлении навески!', mtError,  [mbOk], 0);
end;
 {
with DM1.ADODSPrice do
begin
 if p>eps then
 begin
   Edit;
   FieldByName('PRICE_TMP').AsFloat:=0.0;
   Post;
 end;

end;
}

end;




procedure TF_SaleDoc.CalcCarentResult;
 var
 v,nu,Pr:extended;
begin
// список набранных товаров
with dm1.QPriceTovSelect do
begin
  DisableControls;
  Close;
  Parameters.ParamValues['IDU'] :=ID_user_select;
  Open;
  EnableControls;
end;

with dm1.QPriceUser do
begin
  Close;
  Parameters.ParamValues['IDU'] :=ID_user_select;
  Open;
  First;
  while not Eof do
  begin
    Pr:=0.0;

    case ID_DOC_TYPE of
      200, 204, 206, 242:  // продажа, возврат покупателю, инвентаризация товар, инв возвр тары
      begin
        if FieldByName('PRICE_TMP').AsFloat>=Eps then
        begin
         Pr:=FieldByName('PRICE_TMP').AsFloat;
        end
       else  Pr:=FieldByName('PRICE_UCH').AsFloat;
      end;
      163, 219, 220, 126, 198, 211, 217, 209, 216, 223, 225,
      237, 238, 228, 230, 232, 234, 270,271, 305:    // заказы ТНП, приход ТНП, POS_Возврат ТНП поставщику, заказ колбасы, мяса
      // возвраты ТНП, колбасы, мяса, приход колбася, приход мяса, веревки, обрези
      // Заказы на платную тару, Заказы на товары отгружаемые с НМК
      // заказы на возврат ТНП
     begin
       if FieldByName('PRICE_TMP').AsFloat>=Eps then
       begin
         Pr:=FieldByName('PRICE_TMP').AsFloat;
        end
       else  Pr:=FieldByName('PRICE_VENDOR').AsFloat;
      end;

       276:  // передача с тт на тт
      begin
         Pr:=FieldByName('PRICE_UCH').AsFloat;
      end;

      272:  // все по овощам
      begin
       if FieldByName('PRICE_UCH').AsFloat>=Eps then
       begin
         Pr:=FieldByName('PRICE_UCH').AsFloat;
        end
       else  Pr:=FieldByName('PRICE_VENDOR').AsFloat;
      end;

   end;
   if Pr<eps then
     MessageDlg('Цена не задана у '+FieldByName('NAME').AsString, mtError,  [mbOk], 0);

  Next;
 end; {while not Eof do}
end; {with QPriceUser do}



 TOT_COUNT_SEL_TOV:=0;
 TOT_NUM:=0.0;
 TOT_SUM:=0.0;
 N_KOLBASA:=0.0;
 S_KOLBASA:=0.0;

 N_MYASO:=0.0;
 S_MYASO:=0.0;

 N_TNP:=0.0;
 S_TNP:=0.0;

 SKIDKA:=0.0;
 SKIDKA_KOLBASA:=0.0;
 SKIDKA_MYASO:=0.0;
 SKIDKA_TNP:=0.0;

 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@IDU']:=ID_user_select;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@PER_SKIDKA_KOLBASA']:=PER_SKIDKA_KOLBASA;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@PER_SKIDKA_MYASO']:=PER_SKIDKA_MYASO;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@PER_SKIDKA_TNP']:=PER_SKIDKA_TNP;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@MIN_KOLBASA']:=MIN_KOLBASA;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@MIN_MYASO']:=MIN_MYASO;
 dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@MIN_TNP']:=MIN_TNP;

 dm1.SP_CALC_DOC_RESULT.ExecProc;
 if dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@ER']<>0 then
 begin
  MessageDlg('Ошибка при расчете итогов документа!', mtError, [mbOk], 0);
 end
 else
 begin
  N_KOLBASA:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_KOLBASA'];
  S_KOLBASA:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_KOLBASA'];

  N_MYASO:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_MYASO'];
  S_MYASO:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_MYASO'];

  N_TNP:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_TNP'];
  S_TNP:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_TNP'];

  N_KOLBASA_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_KOLBASA_NOT_ACTION'];
  S_KOLBASA_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_KOLBASA_NOT_ACTION'];

  N_MYASO_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_MYASO_NOT_ACTION'];
  S_MYASO_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_MYASO_NOT_ACTION'];

  N_TNP_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@N_TNP_NOT_ACTION'];
  S_TNP_NOT_ACTION:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@S_TNP_NOT_ACTION'];

  SKIDKA:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@SKIDKA'];
  SKIDKA_KOLBASA:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@SKIDKA_KOLBASA'];
  SKIDKA_MYASO:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@SKIDKA_MYASO'];
  SKIDKA_TNP:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@SKIDKA_TNP'];
  TOT_COUNT_SEL_TOV:=dm1.SP_CALC_DOC_RESULT.Parameters.ParamValues['@COUNT_SEL_TOV'];

 end;

 TOT_NUM:=N_KOLBASA+N_MYASO+N_TNP;
 TOT_SUM:=S_KOLBASA+S_MYASO+S_TNP-SKIDKA;
 // TOT_SUM_NOT_FISCAL:=TOT_SUM;
//  TOT_SUM_FISCAL:=0.0;

(*
with dm1.QPriceUser do
begin
Close;
Parameters.ParamValues['IDU'] :=ID_user_select;
Open;

 TOT_NUM:=0.0;
 TOT_SUM:=0.0;
 TOT_COUNT_SEL_TOV:=dm1.QPriceUser.RecordCount;
 First;
 while not Eof do
 begin
 // if  FieldByName('NUMB').AsFloat>eps then
//  begin
  nu:=FieldByName('NUMB').AsFloat;
  nu:=Sum_Round_after_point(0.001,nu);
  TOT_NUM:=TOT_NUM+nu;
  Pr:=0.0;

  case ID_DOC_TYPE of
    200, 204, 206:  // продажа, возврат покупателю, инвентаризация
    begin
      if FieldByName('PRICE_TMP').AsFloat>=Eps then
      begin
        Pr:=FieldByName('PRICE_TMP').AsFloat;
      end
      else  Pr:=FieldByName('PRICE_UCH').AsFloat;
    end;
    163, 219, 220, 126, 198, 211, 217, 209, 216:    // заказы ТНП, приход ТНП, POS_Возврат ТНП поставщику, заказ колбасы, мяса
    begin                                      // возвраты ТНП, колбасы, мяса, приход колбася, приход мяса
      if FieldByName('PRICE_TMP').AsFloat>=Eps then
      begin
        Pr:=FieldByName('PRICE_TMP').AsFloat;
      end
      else  Pr:=FieldByName('PRICE_VENDOR').AsFloat;
    end;

  end;



   {цена с НДС}
  // округляем до 2х знаков после запятой каждую цену
    Pr:=Sum_Round_after_point(0.01,Pr);
    if Pr<eps then
     MessageDlg('Цена не задана у '+FieldByName('NAME').AsString, mtError,  [mbOk], 0);
   v:= (nu*Pr);
   v:= Sum_Round_after_point(0.01,v);
   TOT_SUM:=TOT_SUM+v;  {сумма накладной с НДС}


//  end; // if  FieldByName('NUMB').AsFloat>eps then
  Next;
 end; {while not Eof do}

end; {with QPriceUser do}
 TOT_NUM:=Sum_Round_after_point(0.001,TOT_NUM);
 TOT_SUM:=Sum_Round_after_point(0.01,TOT_SUM);

 {
 SKIDKA:=0.0;         // сумма скидки по документу
    Skidka_Per:=FieldByName('PER_SKIDKA').AsFloat;    // % скидки
    Skidka_Type:=FieldByName('ID_OPER').AsInteger; // признак скидки (0- на все; 1- колбаса; 2- мясо; 3- ТНП)
    Skidka_Name:=FieldByName('COMMENT').AsString; // название скидки
    Skidka_DFROM:=FieldByName('D_FROM').AsFloat; // дата время начала скидки
    Skidka_DTO:=FieldByName('D_TO').AsFloat; // дата время конца скидки
 }

 *)

 L_klobasa.Caption:= Format('Колбаса кол-во %.2f на сумму %.2f;'+
 ' Скидка %.2f%% c min %.2f - %.2f; Cумма с учетом скидки %.2f',
 [N_KOLBASA, S_KOLBASA, PER_SKIDKA_KOLBASA, MIN_KOLBASA, SKIDKA_KOLBASA, S_KOLBASA-SKIDKA_KOLBASA ]);

  L_myaso.Caption:= Format('Мясо кол-во %.2f на сумму %.2f;'+
 ' Скидка %.2f%% c min %.2f - %.2f; Cумма с учетом скидки %.2f',
 [N_MYASO, S_MYASO, PER_SKIDKA_MYASO, MIN_MYASO, SKIDKA_MYASO, S_MYASO-SKIDKA_MYASO ]);

  L_tnp.Caption:= Format('ТНП кол-во %.2f на сумму %.2f;'+
 ' Скидка %.2f%% c min %.2f - %.2f; Cумма с учетом скидки %.2f',
 [N_TNP, S_TNP, PER_SKIDKA_TNP, MIN_TNP, SKIDKA_TNP, S_TNP-SKIDKA_TNP ]);

 L_Skidka.Caption:=Format('Скидка %s с %s по %s',
 [Skidka_Name, DateTimeToStr(Skidka_DFROM), DateTimeToStr(Skidka_DTO)]);
 L_Itog.Caption:=Format('Итого наименований %d на сумму %.2f; Скидка %.2f; К оплате %.2f',
 [TOT_COUNT_SEL_TOV, TOT_SUM+SKIDKA, SKIDKA, TOT_SUM]);

 E_TOT_SUM.Text:=Format('%.2f',[TOT_SUM]);
 if abs(SUM_OPL_NAL)<=eps then  E_OPL_NAL.Text:=''
 else  E_OPL_NAL.Text:=Format('%.2f',[SUM_OPL_NAL]);

  E_SDACHA.Text:=Format('%.2f',[SUM_SDACHA]);
  E_SDACHA_TO_BONUS_CARD.Text:=Format('%.2f',[SUM_SDACHA_TO_BONUS_CARD]);

  if (ID_DOC_TYPE in [206, 242, 163, 219, 220, 126, 198, 211, 217, 223, 225, 209, 216, 237, 238,
  228, 230, 232, 234])
  or (ID_DOC_TYPE=270) or (ID_DOC_TYPE=271)  or (ID_DOC_TYPE=272)  or (ID_DOC_TYPE=276) or (ID_DOC_TYPE=305)
   then
  //инвентаризация, заказы, приход ТНП, POS_Возврат ТНП поставщику, веревки, обрези, прих колбасы
  // Заказы на плат. тару, товары отгружаемые с НМК
  // заказы на возврат ТНП
  begin
    if ID_DOC_TYPE=276 then    SUM_OPL_NAL:=0
    else   SUM_OPL_NAL:= TOT_SUM;
   E_OPL_NAL.Text:=Format('%.2f',[SUM_OPL_NAL]);
   BBPay.Enabled:=(TOT_SUM>eps);
   BBPrint_Cash_Receipt.Enabled:= (TOT_SUM>eps);

  end
  else
  begin

    BBPay.Enabled:=(TOT_SUM>eps);
  //  BBPrint_Cash_Receipt.Enabled:= (SUM_OPL_NAL>eps) and
  //    ((SUM_OPL_NAL>=TOT_SUM) or (abs(SUM_OPL_NAL-TOT_SUM)<eps));

    BBPrint_Cash_Receipt.Enabled:= (TOT_SUM>eps) and  is_Oplata_Go and
  ((abs(SUM_OPL_NAL+SUM_OPL_CARD-TOT_MONEY)<=eps)
    or ((SUM_OPL_NAL+SUM_OPL_CARD-TOT_MONEY>0.0)))
  and
  ((abs(SUM_OPL_NAL_FISCAL+SUM_OPL_CARD_FISCAL-TOT_MONEY_FISCAL)<=eps)
    or ((SUM_OPL_NAL_FISCAL+SUM_OPL_CARD_FISCAL-TOT_MONEY_FISCAL>0.0)));


  end;

end;

procedure TF_SaleDoc.CBOrderAssortimentClick(Sender: TObject);
begin
// показывать товар из заказа
DBGrid1.DataSource.DataSet.Filtered:=CBOrderAssortiment.Checked;
 if CBOrderAssortiment.Checked then
 begin
   DBGrid1.DataSource.DataSet.Filter := 'NUMB_PROTOTYPE>0.0';

 end
 else DBGrid1.DataSource.DataSet.Filter :='';
 Edit1.SetFocus;
end;

procedure TF_SaleDoc.CB_AllPriceListClick(Sender: TObject);
begin
  case ID_DOC_TYPE of
    163, 219:      // заказы ТНП, приход ТНП
    begin
      if CB_AllPriceList.Checked then ID_VENDOR:=-1
      else ID_VENDOR:=ID_CLI_K;
    end;

    220, 305:
    // Возврат ТНП, Заказы наВозврат ТНП поставщику
    begin
      if CB_AllPriceList.Checked then ID_VENDOR:=-1
      else ID_VENDOR:=ID_CLIENT;
    end;

  end;


  ReOpenPrice;


end;

procedure TF_SaleDoc.CB_Search_BarCodeClick(Sender: TObject);
begin
 if CB_Search_BarCode.Checked then RadioGroup1.ItemIndex:=0;

end;

procedure TF_SaleDoc.BB_NewBarCodeClick(Sender: TObject);
var v_sc:string;
var vSYMBOLS_WEIGHT_OF_BARCODE:integer; var vWEIGHT_MULTIPLIER:extended;

begin
  vSYMBOLS_WEIGHT_OF_BARCODE:=0;
  vWEIGHT_MULTIPLIER :=1;
  if F_NewStrihCodeDlg(DM1.ADODSPrice.FieldByName('NAME').AsString,
                        DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger,
                        v_sc, vSYMBOLS_WEIGHT_OF_BARCODE,
                        vWEIGHT_MULTIPLIER)=mrOk then
  begin
    SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@ID_TOV']:=DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger;
    SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@CODE']:=v_sc;
    SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@SYMBOLS_WEIGHT_OF_BARCODE']:=vSYMBOLS_WEIGHT_OF_BARCODE;
    SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@WEIGHT_MULTIPLIER']:=vWEIGHT_MULTIPLIER;
    SP_SHTRIH_CODE_TOV_ADD.ExecProc;
    if SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@ER']<>0  then
    begin
      MessageDlg('Ошибка изменения штрихкода! '+ SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@ER_COMMENT'], mtError, [mbOk], 0);
    end
    else
    begin
      DM1.ADODSPriceCODE.ReadOnly:=false;
      DM1.ADODSPrice.Edit;
      DM1.ADODSPriceCODE.Value:=SP_SHTRIH_CODE_TOV_ADD.Parameters.ParamValues['@BARCODE'];
      DM1.ADODSPrice.Post;

      ADS_SHTRIH_CODE_TOV_NEW.Close;
      ADS_SHTRIH_CODE_TOV_NEW.Open;
      ADS_SHTRIH_CODE_TOV_NEW.Locate('ID_TOV', DM1.ADODSPrice.FieldByName('ID_TOV').AsInteger,[loCaseInsensitive]);

    end;




  end;

end;

procedure TF_SaleDoc.CB_SHTRIH_TOVClick(Sender: TObject);
begin
if ID_DOC_TYPE=200 then
begin
  GroupBox3.Visible:=  not CB_SHTRIH_TOV.Checked;
  GroupBox2.Visible:=  not CB_SHTRIH_TOV.Checked;
  BB_RegistrBonusCard.Visible:=  not CB_SHTRIH_TOV.Checked;
end;
  GroupBox4.Visible:=  CB_SHTRIH_TOV.Checked;
  BB_NewBarCode.Enabled:= CB_SHTRIH_TOV.Checked;


  if CB_SHTRIH_TOV.Checked then
  begin
    with ADS_SHTRIH_CODE_TOV_NEW do
    begin
      Open;
      {
      if ADS_SHTRIH_CODE_TOV_NEW.RecordCount>0 then
      begin
        if MessageDlg('У вас остались непереданные штрихкоды товаров. Удалить их?', mtWarning,
          [mbNo, mbYes], 0)= mrYes then
        begin
          Close;
          F_main.Command_Del_SHTRIH_CODE_TOV_NEW.Execute;
          Open;
        end;
      end; // if ADS_SHTRIH_CODE_TOV_NEW.RecordCount>0 then
      }

    end;

    DBGrid3.DataSource:=DS_SHTRIH_CODE_TOV_NEW;

  end
  else
  begin
    DBGrid3.DataSource:=DM1.DS_QPriceTovSelect;
  end;


end;

{
procedure TF_SaleDoc.OnWeightClick;
begin

RS2321.Disconnect;
RS2321.Active:=IsOnWeight;

Timer1.Enabled:=IsOnWeight;
if not IsOnWeight then
begin
  ConditionWeight:='Весы не отвечают!';
  StatusBar1.Panels[0].Text:=ConditionWeight;

  EWeight.Text:='0';
end;
EWeight.ReadOnly:=IsOnWeight;
end;
 }

procedure TF_SaleDoc.OnWeightClick;
begin

if IsOnWeight then
begin
  if vAPScale<>nil then FreeAndNil(vAPScale);
  vAPScale:=TAPScale.Create(self);
  vAPScale.Connect1(F_main.COM_PORT);
end
else
begin
  if vAPScale<>nil then
  begin
    vAPScale.DisConnect1;
    FreeAndNil(vAPScale);
  end;
end;

Timer1.Enabled:=IsOnWeight;
if not IsOnWeight then
begin
  ConditionWeight:='Весы не отвечают!';
  StatusBar1.Panels[0].Text:=ConditionWeight;

  EWeight.Text:='0';
end;
EWeight.ReadOnly:=IsOnWeight;
//E_PRICE_TMP.ReadOnly:=IsOnWeight;

end;

procedure TF_SaleDoc.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;








procedure TF_SaleDoc.CheckBox2Click(Sender: TObject);
begin
 DBGrid1.DataSource.DataSet.Filtered:=CheckBox2.Checked;
 if CheckBox2.Checked then
 begin
  if Trim(Edit1.Text)<>'' then
  begin
      DBGrid1.DataSource.DataSet.Filter := '(NAME LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')';
   end // if Trim(Edit1.Text)<>'' then
  else CheckBox2.Checked:=False;
 end
 else DBGrid1.DataSource.DataSet.Filter :='';
 Edit1.SetFocus;
end;

function TF_SaleDoc.SaveDoc(IS_FINAL:integer):boolean;
begin
Result:=false;
IS_DOC_SAVE_FINAL:=False;
if ID_CLIENT=-1 then
begin
  MessageDlg('Не указан дебитор!', mtError,
      [mbOk], 0);
  IS_DOC_SAVED:=False;
  exit;
end;

if ID_CLI_K=-1 then
begin
  MessageDlg('Не указан кредитор!', mtError,
      [mbOk], 0);
  IS_DOC_SAVED:=False;
  exit;
end;



CalcCarentResult;
if TOT_SUM>eps then
begin
 if (DM1.ADODSPrice.State in [dsInsert,DsEdit]) then DM1.ADODSPrice.Post;

 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;

 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@D']:=DT_Date_doc.DateTime;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NN']:=EN.Text;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLIENT']:=ID_CLIENT;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CHEREZ']:='';
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@DOVER']:='';
 if is_carte_Kharkov then
 begin
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='Карта харьковчанина';
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:=Сarte_Kharkov;
 end
 else
 begin
   dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='';
   dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:='';
 end;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@FORMOPL']:='';
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANSP']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TARA']:=0.0;

 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PLUS']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MINUS']:=SKIDKA;


 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATRNAME']:='';
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATR']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PRICE_KATEG']:=PRICE_KATEG;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_PRICE_WITHOUT_NDS']:=1;


 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_SUPPLYER']:=Unknown_code;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_SUM']:=TOT_SUM;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_NUM']:=TOT_NUM;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_TARA']:=Unknown_code;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_K']:=ID_CLI_K;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_D']:=SCH_D;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_K']:=SCH_K;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NDS']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@STAVKA_NDS']:=0.0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_DELETE']:=0;
 if ID_DOC_TYPE=204 then  // возврат то покупателя
 // -- для дальнейшей связи продажи с возвратами при проводках возвратов
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=ID_DOC_PROTOTYPE
 else
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=Unknown_code;


 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_NACENKA']:=0;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USLUGI']:=Unknown_code;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_BONUS']:=SUM_OPL_BONUS;
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_CARD']:=SUM_OPL_CARD+SUM_OPL_CARD_FISCAL;

 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_POLUCH']:=SUM_OPL_NAL+SUM_OPL_NAL_FISCAL; // сумма покупателя наличными
 dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI']:=SUM_SDACHA+SUM_SDACHA_FISCAL;



  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_KOLBASA']:=SKIDKA_KOLBASA;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_MYASO']:=SKIDKA_MYASO;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_TNP']:=SKIDKA_TNP;

  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_KOLBASA']:=PER_SKIDKA_KOLBASA;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_MYASO']:=PER_SKIDKA_MYASO;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_TNP']:=PER_SKIDKA_TNP;

  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_KOLBASA']:=MIN_KOLBASA;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_MYASO']:=MIN_MYASO;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_TNP']:=MIN_TNP;

  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_COMMENT']:=Skidka_Name;

  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_OLD']:=SUM_BONUS_BALL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_CALC']:=SUM_BALL_CALC;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_NEW']:=SUM_BALL_NEW;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ROUND_SUM']:=D_ROUND_TOT_SUM_FISCAL+D_ROUND_TOT_SUM_NOT_FISCAL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_NOT_FISCAL']:= CARD_NN_NOT_FISCAL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_NOT_FISCAL']:= CODE_TRANSACTION_NOT_FISCAL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_FISCAL']:= CARD_PAY_SYSTEM+'/'+CARD_NN_FISCAL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_FISCAL']:= CODE_TRANSACTION_FISCAL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI_TO_CARD']:= SUM_SDACHA_TO_BONUS_CARD;
  if IS_ALCOGOL_CHECK=0 then  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_RRO']:= F_Main.ID_CLI_FISCAL
  else   dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_RRO']:= F_Main.ID_CLI_FISCAL_ALCOGOL;
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_FINAL']:= IS_FINAL;

 dm1.SP_SAVE_NAKL.ExecProc;
 if dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER']<>0 then
 begin
  MessageDlg('Ошибка при сохранении нового документа!'+
  dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER_COMMENT'], mtError,
      [mbOk], 0);
  IS_DOC_SAVED:=False;
  IS_DOC_SAVE_FINAL:=False;
  Result:=false;
 end
 else
 begin
  ID_NAKLCAP:=dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
  IS_DOC_SAVED:=True;
  IS_DOC_SAVE_FINAL:=(IS_FINAL=1);
  Result:=true;
  if EmergencyMode then
  begin
     FSaleDocList.BBClose.Click;
     F_main.BBClose.Click;
  end;

 end;


end;  // if TOT_SUM>eps then



end;  // function TF_SaleDoc.SaveDoc:boolean;



procedure TF_SaleDoc.Sum_naveski;
var id:longint;
sum_ves:extended;
old_status:boolean;
begin
with DM1.QNAVESKI_TMP do
  begin
   DisableControls;
   id:=FieldByName('ID').AsInteger;
   sum_ves:=0;
   First;
   while not Eof do
   begin
    sum_ves:=sum_ves+FieldByName('NUMB').AsFloat;
    next;
   end;
   old_status:=DM1.ADODSPriceNUMB.ReadOnly;

   DM1.ADODSPriceNUMB.ReadOnly:=False;
   DM1.QPriceTovSelectNUMB.ReadOnly:=DM1.ADODSPriceNUMB.ReadOnly;
   DM1.ADODSPrice.Edit;
   DM1.ADODSPrice.FieldByName('NUMB').AsFloat:=sum_ves;
   DM1.ADODSPrice.Post;
   Locate('ID',id,[loCaseInsensitive]);
   DM1.ADODSPriceNUMB.ReadOnly:=old_status;
   DM1.QPriceTovSelectNUMB.ReadOnly:=DM1.ADODSPriceNUMB.ReadOnly;
   EnableControls;
  end;

end;





procedure TF_SaleDoc.Timer1Timer(Sender: TObject);
begin
try
// if CBOnWeight.Checked then
if IsOnWeight then

begin
Timer1.Enabled:=False;

Weight:=GetWeight(status_Weight, price_tmp);
{
with dm1.ADODSPrice do
begin
 if not (State in [dsEdit]) then  Edit;
 FieldByName('PRICE_TMP').AsFloat:= price_tmp;
end;
}
Timer1.Enabled:=True;
ConditionWeight:='Весы на связи!';
StatusBar1.Panels[0].Text:=ConditionWeight;
end
else
begin

Timer1.Enabled:=False;
ConditionWeight:='Весы не отвечают!';
StatusBar1.Panels[0].Text:=ConditionWeight;
// CBOnWeight.Checked:=False;
IsOnWeight:=False;
Weight_on_off_visualization;
end;

except
 Timer1.Enabled:=False;
 // CBOnWeight.Checked:=False;
 IsOnWeight:=False;
 Weight_on_off_visualization;

 ConditionWeight:='Нет связи с весами!';
 StatusBar1.Panels[0].Text:=ConditionWeight;
 OnWeightClick;

 exit;
end;

EWeight.Text:=Format('%.3f',[Weight]);
// E_PRICE_TMP.Text:=Format('%.2f',[price_tmp]);
// status='S'  вес стабилизирован
BB_naveski_add.Enabled:=((status_Weight='S') and (Weight>eps));
StatusBar1.Panels[0].Text:=ConditionWeight;






end;



procedure TF_SaleDoc.Timer_BankGoTimer(Sender: TObject);
begin
end;

(*
function TF_SaleDoc.GetWeight(var status:string):extended;
  // status = S - стабилизированный вес   U - нет
  const enq=$05;
        ace=$06;
        nak=$15;
        sdh=$01;
        stk=$02;
        etk=$03;
        etd=$04;
        dc1=$11;
        dc2=$12;
        dc3=$13;
        dc4=$14;
var Str1,Str,w,cel,dro:string;
    nCount:word;
    j_point,i,ndro:integer;
    vcel,vdro,v:extended;

   sign:string; // знак веса ' ' - + '-' --
begin
result:=0;
SetLength(Str1,1);
Str1[1]:=chr(enq);
if RS2321.SendString(Str1) then
begin
 if RS2321.ReadString(Str,1) then
 begin
   if length(Str)>0 then
   if Str[1]=chr(ace) then
   begin
    Str1[1]:=chr(dc1);
    if RS2321.SendString(Str1) then
    begin
     Str:='';
     if RS2321.ReadString(Str,15) then
     if Str<>'' then
     begin
      status:=copy(str,3,1);
      sign:=copy(str,4,1);
      if sign='-' then i:=-1
      else i:=1;
      w:=trim(copy(str,5,6));
      j_point:=pos('.',w);
      if j_point<>0 then
      begin
       delete(w,j_point,1);
       insert(',',w,j_point);
      end;
      try
       v:=strtofloat(w)*i;
      except
       v:=0;
      end;
      result:=v;
     end; // if Srt<>'' then
    end;
   end
   else  //if Str[1]=chr(ace) then
   begin

   {
    MessageDlg('Ошибка при передаче данных c весов 1!', mtError,
      [mbOk], 0);
      }
   end;  // else  if Str[1]=chr(ace) then

 end
 else  //  if RS2321.ReadString(Str,1) then
 begin

 {
 MessageDlg('Ошибка при передаче данных c весов 3!', mtError,
    [mbOk], 0);
  }

 end;   //  else if RS2321.ReadDataString(Str,nCount) then
end
else
begin
 Timer1.Enabled:=false;
 IsOnWeight:=False;
// CBOnWeight.Checked:=false;
 Weight_on_off_visualization;

 MessageDlg('Ошибка при передаче данных на весы 4!', mtError,
      [mbOk], 0);


end;


end;

 *)

function TF_SaleDoc.GetWeight(var status:string; var price:extended):extended;
  // status = S - стабилизированный вес   U - нет    E ошибка
  var s, sp,  w:string;
  j_point:integer;

begin
  result:=0;
  price:=0.0;
  s:=vAPScale.Data;
  status:=s[8];
  w:=Trim(copy(s,1,6));
  j_point:=pos('.',w);
  if j_point<>0 then
  begin
    delete(w,j_point,1);
    insert(',',w,j_point);
  end;
  sp:=Trim(copy(s,20,8));
  j_point:=pos('.',sp);
  if j_point<>0 then
  begin
    delete(sp,j_point,1);
    insert(',',sp,j_point);
  end;
  try
   price:=strtofloat(sp);
  except
    price:=0.0;
  end;

 try
  result:=strtofloat(w);
 except
  result:=0;
   price:=0.0;
  status:='E';
 end;



end;




end.
