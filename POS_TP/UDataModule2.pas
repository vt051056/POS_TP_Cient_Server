unit UDataModule2;

interface

uses
  System.SysUtils, System.Classes,
  Datasnap.DSCommon, Datasnap.DSProxy, Datasnap.DBClient, Data.DB, IPPeerClient,
  Data.SqlExpr, Datasnap.DSConnect, Data.DBXDataSnap, Data.DBXCommon;




type
  TDataModule2 = class(TDataModule)
    CDS_Doc_Type: TClientDataSet;
    DS_Doc_Type: TDataSource;
    DSClientCallbackChannelManager1: TDSClientCallbackChannelManager;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    CDS_Doc_TypeID_DOC_TYPE: TAutoIncField;
    CDS_Doc_TypeNAMEDOC: TWideStringField;
    CDS_Doc_TypeNEXT_NO: TIntegerField;
    CDS_Doc_TypeID_SCH_D: TStringField;
    CDS_Doc_TypeID_SCH_K: TStringField;
    CDS_Doc_TypeID_CLI_D: TIntegerField;
    CDS_Doc_TypeID_CLI_K: TIntegerField;
    CDS_Doc_TypeCLI_D: TWideStringField;
    CDS_Doc_TypeCLI_K: TWideStringField;
    CDS_Doc_TypeID_CHAR_DOC: TIntegerField;
    CDS_Doc_TypeCHAR_DOC: TWideStringField;
    CDS_Doc_TypeNDS_PER: TFloatField;
    CDS_Doc_TypeID_PROV_CASE: TIntegerField;
    CDS_Doc_TypeID_GRTOV: TIntegerField;
    CDS_Doc_TypeGRUPTOV: TWideStringField;
    CDS_Doc_TypeID_KATEG_CLI: TIntegerField;
    CDS_Doc_TypeKATEGOR: TWideStringField;
    CDS_Doc_TypeID_KATEG_CLI_K: TIntegerField;
    CDS_Doc_TypeKATEGOR_K: TWideStringField;
    CDS_Doc_TypeSALES_CATEGOR: TIntegerField;
    CDS_Doc_TypeWITH_NDS: TIntegerField;
    CDS_Doc_TypeTIME_DEFAULT: TDateTimeField;
    CDS_Doc_TypeFORM_PRN: TIntegerField;
    CDS_Doc_TypeID_SUPPL: TIntegerField;
    CDS_Doc_TypeSUPPL: TWideStringField;
    CDS_Doc_TypeID_LINK_DOC: TIntegerField;
    CDS_Doc_TypeLINK_CHAR_DOC: TWideStringField;
    CDS_Doc_TypeID_LINK_CH_DOC: TIntegerField;
    CDS_NaklCap: TClientDataSet;
    DS_NaklCap: TDataSource;
    CDSQ_NaklCapInfo: TClientDataSet;
    CDSQ_ControlLinkDoc: TClientDataSet;
    CDS_Price: TClientDataSet;
    DS_Price: TDataSource;
    CDS_AvtoNariad: TClientDataSet;
    CDS_NaklCapD: TDateTimeField;
    CDS_NaklCapNN: TWideStringField;
    CDS_NaklCapCHEREZ: TWideStringField;
    CDS_NaklCapDOVER: TWideStringField;
    CDS_NaklCapOSNOV: TWideStringField;
    CDS_NaklCapUDOST: TWideStringField;
    CDS_NaklCapFORMOPL: TWideStringField;
    CDS_NaklCapTRANSP: TFloatField;
    CDS_NaklCapTARA: TFloatField;
    CDS_NaklCapPLUS: TFloatField;
    CDS_NaklCapMINUS: TFloatField;
    CDS_NaklCapZATRNAME: TWideStringField;
    CDS_NaklCapZATR: TFloatField;
    CDS_NaklCapPRICE_KATEG: TIntegerField;
    CDS_NaklCapID_NAKLCAP: TAutoIncField;
    CDS_NaklCapTOT_SUM: TFloatField;
    CDS_NaklCapTOT_NUM: TFloatField;
    CDS_NaklCapSCH_D: TStringField;
    CDS_NaklCapSCH_K: TStringField;
    CDS_NaklCapCLIENT: TWideStringField;
    CDS_NaklCapSUPPL: TWideStringField;
    CDS_NaklCapNUM_TARA: TFloatField;
    CDS_NaklCapD_CREATE: TDateTimeField;
    CDS_NaklCapD_DELETE: TDateTimeField;
    CDS_NaklCapCOMMENT_DEL: TWideStringField;
    CDS_NaklCapUSER_CR: TWideStringField;
    CDS_NaklCapUSER_DEL: TWideStringField;
    CDS_NaklCapNAMETARA: TWideStringField;
    CDS_NaklCapID_TARA: TIntegerField;
    CDS_NaklCapID_GR_PROV: TIntegerField;
    CDS_NaklCapCLI_K: TWideStringField;
    CDS_NaklCapNDS: TFloatField;
    CDS_NaklCapSTAVKA_NDS: TFloatField;
    CDS_NaklCapNAMEDOC: TWideStringField;
    CDS_NaklCapCHAR_DOC: TWideStringField;
    CDS_NaklCapID_DOC_TYPE: TIntegerField;
    CDS_NaklCapID_CHAR_DOC: TIntegerField;
    CDS_NaklCapID_CLI_K: TIntegerField;
    CDS_NaklCapIS_DELETE: TIntegerField;
    CDS_NaklCapCLOSE_SUM: TFloatField;
    CDS_NaklCapID_LINK_DOC: TIntegerField;
    CDS_NaklCapDOC_LINK: TWideStringField;
    CDS_NaklCapD_LINK: TDateTimeField;
    CDS_NaklCapNN_LINK: TWideStringField;
    CDS_NaklCapPER_NACENKA: TFloatField;
    CDS_NaklCapFIX_PROV: TIntegerField;
    CDS_NaklCapNALOG_NAKL: TIntegerField;
    CDS_NaklCapINN_K: TWideStringField;
    CDS_NaklCapINN_D: TWideStringField;
    CDS_NaklCapID_CLIENT: TIntegerField;
    CDS_AvtoNariadEdit: TClientDataSet;
    DS_AvtoNariadEdit: TDataSource;
    CDS_AvtoNariadID_AVTO_NARIAD: TAutoIncField;
    CDS_AvtoNariadD: TDateTimeField;
    CDS_AvtoNariadNN: TWideStringField;
    CDS_AvtoNariadPROBEG1: TFloatField;
    CDS_AvtoNariadPROBEG2: TFloatField;
    CDS_AvtoNariadMOTOCHAS1: TFloatField;
    CDS_AvtoNariadMOTOCHAS2: TFloatField;
    CDS_AvtoNariadNORMA_PROBEG_TMP: TFloatField;
    CDS_AvtoNariadNORMA_MOTOCHAS_TMP: TFloatField;
    CDS_AvtoNariadN_TOPLIVA: TFloatField;
    CDS_AvtoNariadCOMMENT_RABOT: TWideStringField;
    CDS_AvtoNariadIS_DELETE: TIntegerField;
    CDS_AvtoNariadID_USER: TIntegerField;
    CDS_AvtoNariadID_USER_DEL: TIntegerField;
    CDS_AvtoNariadD_CREATE: TDateTimeField;
    CDS_AvtoNariadD_DELETE: TDateTimeField;
    CDS_AvtoNariadCOMMENT_DEL: TWideStringField;
    CDS_AvtoNariadID_GRPROV: TIntegerField;
    CDS_AvtoNariadSCH_D: TWideStringField;
    CDS_AvtoNariadID_CLI_D: TIntegerField;
    CDS_AvtoNariadSCH_K: TWideStringField;
    CDS_AvtoNariadID_CLI_AVTO: TIntegerField;
    CDS_AvtoNariadCL_D: TWideStringField;
    CDS_AvtoNariadCL_K: TWideStringField;
    CDS_AvtoNariadUSER_CR: TWideStringField;
    CDS_AvtoNariadUSER_DEL: TWideStringField;
    CDS_AvtoNariadINN_K: TWideStringField;
    CDS_AvtoNariadINN_D: TWideStringField;
    CDS_AvtoNariadID_DOC_TYPE: TIntegerField;
    DS_Sch: TDataSource;
    CDS_Sch: TClientDataSet;
    CDS_SCHTYPE: TClientDataSet;
    DS_SCHTYPE: TDataSource;
    CDS_UCH: TClientDataSet;
    DS_UCH: TDataSource;
    CDS_Users: TClientDataSet;
    DS_Users: TDataSource;
    CDS_UsersID_USERS: TAutoIncField;
    CDS_UsersNAME: TWideStringField;
    CDS_UsersLOGIN: TWideStringField;
    CDS_UsersSTATUS: TIntegerField;
    CDS_UsersBIRTHDAY: TDateTimeField;
    CDS_UsersIS_DELETE: TIntegerField;
    CDS_Clients: TClientDataSet;
    DS_Clients: TDataSource;
    CDS_Kateg_Cli: TClientDataSet;
    DS_Kateg_Cli: TDataSource;
    DS_PricePOS: TDataSource;
    CDS_PricePOS: TClientDataSet;
    CDS_SCHTYPEID_SCH_TYPE: TIntegerField;
    CDS_SCHTYPESCH_TYPE: TWideStringField;
    CDS_UCHID_UCHET: TIntegerField;
    CDS_UCHUCHET: TWideStringField;
    CDS_SchID_SCH: TStringField;
    CDS_SchSCH_NAME: TWideStringField;
    CDS_SchID_SCH_TYPE: TIntegerField;
    CDS_SchID_UCHET: TIntegerField;
    CDS_SchIN_BALANS: TIntegerField;
    CDS_SchUCHET: TStringField;
    CDS_SchSCH_TYPE: TStringField;
    DS_RepOtgruzTov1: TDataSource;
    CDS_RepOtgruzTov1: TClientDataSet;
    CDS_Kateg_Cli_Import: TClientDataSet;
    DS_Kateg_Cli_Import: TDataSource;
    CDS_Clients_Import: TClientDataSet;
    DS_Clients_Import: TDataSource;
    CDS_Bonuses_Import: TClientDataSet;
    DS_Bonuses_Import: TDataSource;
    CDS_NaklCap_Export: TClientDataSet;
    DS_NaklCap_Export: TDataSource;
    CDS_NaklTov_Export: TClientDataSet;
    DS_NaklTov_Export: TDataSource;
    CDS_Naveski_Export: TClientDataSet;
    DS_Naveski_Export: TDataSource;
    CDS_GrTov_Import: TClientDataSet;
    DS_GrTov_Import: TDataSource;
    CDS_Tov_Import: TClientDataSet;
    DS_Tov_Import: TDataSource;
    CDS_PRICE_DATE_Import: TClientDataSet;
    DS_PRICE_DATE_Import: TDataSource;
    CDS_UserPrice_Import: TClientDataSet;
    DS_UserPrice_Import: TDataSource;
    CDS_NaklCap_Import: TClientDataSet;
    DS_NaklCap_Import: TDataSource;
    CDS_NaklTov_Import: TClientDataSet;
    DS_NaklTov_Import: TDataSource;
    CDS_Naveski_Import: TClientDataSet;
    DS_Naveski_Import: TDataSource;
    DS_Skidka_Import: TDataSource;
    CDS_Skidka_Import: TClientDataSet;
    CDS_NewPriceTov_Import: TClientDataSet;
    DS_NewPriceTov_Import: TDataSource;
    CDS_CLIENTS_NEW_POS_Export: TClientDataSet;
    DS_CLIENTS_NEW_POS_Export: TDataSource;
    CDS_Advert: TClientDataSet;
    DS_Advert: TDataSource;
    DS_USER_TRADEPOINT: TDataSource;
    CDS_USER_TRADEPOINT: TClientDataSet;
    CDS_SHTRIH_CODE_TOV_NEW_POS: TClientDataSet;
    DS_SHTRIH_CODE_TOV_NEW_POS: TDataSource;
    CDS_KIO_OPERATIONS_GRUP_Import: TClientDataSet;
    DS_KIO_OPERATIONS_GRUP_Import: TDataSource;
    CDS_QPRODUCT_POS_Import: TClientDataSet;
    DS_QPRODUCT_POS_Import: TDataSource;
    CDS_QNORM_ASSEMB_POS_Import: TClientDataSet;
    DS_QNORM_ASSEMB_POS_Import: TDataSource;
    CDS_Q_KUPON_CARD_Import: TClientDataSet;
    DS_Q_KUPON_CARD_Import: TDataSource;
    CDS_SVERKA_DOC_POS: TClientDataSet;
    DS_SVERKA_DOC_POS: TDataSource;
    CDS_Q_RRO_CERTIFIC: TClientDataSet;
    DS_Q_RRO_CERTIFIC: TDataSource;
    CDS_Q_RRO_KASSA_TS: TClientDataSet;
    DS_Q_RRO_KASSA_TS: TDataSource;
    DS_BARCODES_Import: TDataSource;
    CDS_BARCODES_Import: TClientDataSet;
    CDS_CONST_VALUES_TP_EXPORT: TClientDataSet;
    DS_CONST_VALUES_TP_EXPORT: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDS_UsersAfterPost(DataSet: TDataSet);
    procedure CDS_SCHTYPEAfterPost(DataSet: TDataSet);
    procedure CDS_UCHAfterPost(DataSet: TDataSet);
    procedure CDS_SchAfterPost(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  DataModule2: TDataModule2;

const   Unknown_str='Не определен';
        Unknown_code=-1;
        eps=0.000000001;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UMainForm;

procedure TDataModule2.CDS_SchAfterPost(DataSet: TDataSet);
begin
 CDS_Sch.ApplyUpdates(-1);
end;

procedure TDataModule2.CDS_SCHTYPEAfterPost(DataSet: TDataSet);
begin
  CDS_SCHTYPE.ApplyUpdates(-1);
end;

procedure TDataModule2.CDS_UCHAfterPost(DataSet: TDataSet);
begin
   CDS_UCH.ApplyUpdates(-1);
end;

procedure TDataModule2.CDS_UsersAfterPost(DataSet: TDataSet);
begin
 CDS_Users.ApplyUpdates(-1);
end;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
 SQLConnection1.Connected:=False;
end;

end.
