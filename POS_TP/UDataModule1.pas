unit UDataModule1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.UITypes;

type
  TDM1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODSUsers: TADODataSet;
    ADODSUsersID_USERS: TAutoIncField;
    ADODSUsersNAME: TWideStringField;
    ADODSUsersLOGIN: TWideStringField;
    ADODSUsersSTATUS: TIntegerField;
    ADODSUsersBIRTHDAY: TDateTimeField;
    ADODSUsersIS_DELETE: TIntegerField;
    DSUSERS: TDataSource;
    Tb_USER_CONNECT: TADOTable;
    Q_USER_CONNECT: TADOQuery;
    Q_USER_CONNECTID_USER: TIntegerField;
    Q_USER_CONNECTU_NAME: TWideStringField;
    DS_Q_USER_CONNECT: TDataSource;
    SP_DELETE_USER_CONNECT: TADOStoredProc;
    DS_SaleDocList: TDataSource;
    ADS_SaleDocList: TADODataSet;
    TbClose_Date: TADOTable;
    DSClose_Date: TDataSource;
    SP_DELETE_NAKL: TADOStoredProc;
    SP_FIX_PROV_DOC: TADOStoredProc;
    SP_NON_FIX_PROV_DOC: TADOStoredProc;
    ADODSPrice: TADODataSet;
    DSPrice: TDataSource;
    QNAVESKI_TMP: TADOQuery;
    DSQNAVESKI_TMP: TDataSource;
    SP_SAVE_NAKL: TADOStoredProc;
    ADODSGrTov: TADODataSet;
    ADODSGrTovID_GRTOV: TAutoIncField;
    ADODSGrTovGRUPTOV: TWideStringField;
    ADODSGrTovSEQUENTIAL: TIntegerField;
    ADODSGrTovIS_DELETE: TIntegerField;
    DSGrTov: TDataSource;
    SP_SET_NEXT_NUMB_DOC: TADOStoredProc;
    SP_GET_NEXT_NUMB_DOC: TADOStoredProc;
    SP_SET_USER_PRICELIST: TADOStoredProc;
    SP_CONTROL_PRICE_SELECT: TADOStoredProc;
    SP_CLEAR_PRICE_SELECT: TADOStoredProc;
    SP_SET_PRICE_FROM_NAKL: TADOStoredProc;
    SP_COPY_NAKL: TADOStoredProc;
    QPriceTovSelect: TADOQuery;
    QPriceTovSelectrn: TIntegerField;
    QPriceTovSelectNAME: TWideStringField;
    QPriceTovSelectEDIZM: TWideStringField;
    QPriceTovSelectNUMB: TFloatField;
    QPriceTovSelectprice_select: TFloatField;
    QPriceTovSelectss: TFloatField;
    QPriceTovSelectCODE: TWideStringField;
    QPriceTovSelectGRUPTOV: TWideStringField;
    QPriceTovSelectPRICE_TMP: TFloatField;
    QPriceTovSelectPRICE_UCH: TFloatField;
    QPriceTovSelectID_TOV: TIntegerField;
    DS_QPriceTovSelect: TDataSource;
    QPriceUser: TADOQuery;
    SP_NAVESKI_DEL_IDTOV: TADOStoredProc;
    SP_NAVESKI_DEL: TADOStoredProc;
    SP_NAVESKI_ADD: TADOStoredProc;
    QDocType_info: TADOQuery;
    QPriceSelect: TADOQuery;
    QNAVESKI_TMPID: TAutoIncField;
    QNAVESKI_TMPID_USER: TIntegerField;
    QNAVESKI_TMPID_TOV: TIntegerField;
    QNAVESKI_TMPNUMB: TFloatField;
    QNAVESKI_TMPD: TDateTimeField;
    QNaklCapInfo: TADOQuery;
    SP_GET_CLIENT_FOR_INN: TADOStoredProc;
    SP_REGISTER_CLI_FOR_BONUS_CARD: TADOStoredProc;
    SP_PROV_CAS_DOC: TADOStoredProc;
    SP_DELETE_GRPROV: TADOStoredProc;
    ADODSDocType: TADODataSet;
    ADODSDocTypeID_DOC_TYPE: TAutoIncField;
    ADODSDocTypeNAMEDOC: TWideStringField;
    ADODSDocTypeNEXT_NO: TIntegerField;
    ADODSDocTypeID_SCH_D: TStringField;
    ADODSDocTypeID_SCH_K: TStringField;
    ADODSDocTypeCLI_D: TWideStringField;
    ADODSDocTypeKATEGOR: TWideStringField;
    ADODSDocTypeCLI_K: TWideStringField;
    ADODSDocTypeKATEGOR_K: TWideStringField;
    ADODSDocTypeID_CLI_D: TIntegerField;
    ADODSDocTypeID_CLI_K: TIntegerField;
    ADODSDocTypeGRUPTOV: TWideStringField;
    ADODSDocTypeSALES_CATEGOR: TIntegerField;
    ADODSDocTypeNDS_PER: TFloatField;
    ADODSDocTypeWITH_NDS: TIntegerField;
    ADODSDocTypeCHAR_DOC: TWideStringField;
    ADODSDocTypeID_CHAR_DOC: TIntegerField;
    ADODSDocTypeID_PROV_CASE: TIntegerField;
    ADODSDocTypeID_GRTOV: TIntegerField;
    ADODSDocTypeID_KATEG_CLI: TIntegerField;
    ADODSDocTypeTIME_DEFAULT: TDateTimeField;
    ADODSDocTypeFORM_PRN: TIntegerField;
    ADODSDocTypeID_KATEG_CLI_K: TIntegerField;
    ADODSDocTypeID_SUPPL: TIntegerField;
    ADODSDocTypeSUPPL: TWideStringField;
    ADODSDocTypeID_LINK_DOC: TIntegerField;
    ADODSDocTypeLINK_CHAR_DOC: TWideStringField;
    ADODSDocTypeID_LINK_CH_DOC: TIntegerField;
    ADODSDocTypeLINK_NAMEDOC: TStringField;
    DSDocType: TDataSource;
    ADODSDOC_CHAR: TADODataSet;
    ADODSDOC_CHARID_CHAR_DOC: TIntegerField;
    ADODSDOC_CHARCHAR_DOC: TWideStringField;
    DSDOC_CHAR: TDataSource;
    SP_DELETE_DOCCHAR: TADOStoredProc;
    SP_DELETE_DOCTYPE: TADOStoredProc;
    ADODSUCH: TADODataSet;
    ADODSUCHID_UCHET: TIntegerField;
    ADODSUCHUCHET: TWideStringField;
    DSUCH: TDataSource;
    ADODSSCHTYPE: TADODataSet;
    ADODSSCHTYPEID_SCH_TYPE: TIntegerField;
    ADODSSCHTYPESCH_TYPE: TWideStringField;
    DSSCHTYPE: TDataSource;
    ADODSSCH: TADODataSet;
    ADODSSCHID_SCH: TStringField;
    ADODSSCHSCH_NAME: TWideStringField;
    ADODSSCHID_SCH_TYPE: TIntegerField;
    ADODSSCHID_UCHET: TIntegerField;
    ADODSSCHUCHET: TWideStringField;
    ADODSSCHSCH_TYPE: TWideStringField;
    ADODSSCHIN_BALANS: TIntegerField;
    ADODSSCHIS_VISIBLE: TIntegerField;
    DSSCH: TDataSource;
    Q_USERSCHPERM: TADOQuery;
    SP_DELETE_SCH: TADOStoredProc;
    Q_NaklCap_For_Export: TADOQuery;
    ADOCommand_Expotr_null: TADOCommand;
    ADOCommand_Delete_PredKateg_Cli: TADOCommand;
    ADOCommandInsertKaterCli: TADOCommand;
    ADOCommand_Delete_PredCli: TADOCommand;
    ADOCommandInsertCli: TADOCommand;
    ADOCommand_Delete_PredBonuses: TADOCommand;
    ADOCommandInsertBonuses: TADOCommand;
    ADOCommand_Delete_PredGrTov: TADOCommand;
    ADOCommandInsertGrTov: TADOCommand;
    ADOCommand_Delete_PredTov: TADOCommand;
    ADOCommandInsertTov: TADOCommand;
    ADOCommandDelete_PRICE_DATE: TADOCommand;
    ADOCommandInsertPRICE_DATE: TADOCommand;
    ADODSPriceID_TOV: TIntegerField;
    ADODSPriceID_USERS: TIntegerField;
    ADODSPriceNUMB: TFloatField;
    ADODSPricePRICE_TMP: TFloatField;
    ADODSPricePRICE_UCH: TFloatField;
    ADODSPriceOSTAT: TFloatField;
    ADODSPriceNAME: TWideStringField;
    ADODSPriceEDIZM: TWideStringField;
    ADODSPriceCODE: TWideStringField;
    ADODSPriceID_GRTOV: TIntegerField;
    ADODSPriceGRUPTOV: TWideStringField;
    Q_NaklTov_For_Export: TADOQuery;
    Q_Naveski_For_Export: TADOQuery;
    ADOCommand_Expotr_set: TADOCommand;
    QPrintReceipt: TADOQuery;
    QPrintCashCaption: TADOQuery;
    ADS_SaleDocListD: TDateTimeField;
    ADS_SaleDocListNN: TWideStringField;
    ADS_SaleDocListMINUS: TFloatField;
    ADS_SaleDocListPRICE_KATEG: TIntegerField;
    ADS_SaleDocListID_NAKLCAP: TAutoIncField;
    ADS_SaleDocListTOT_SUM: TFloatField;
    ADS_SaleDocListTOT_NUM: TFloatField;
    ADS_SaleDocListSCH_D: TStringField;
    ADS_SaleDocListSCH_K: TStringField;
    ADS_SaleDocListCLIENT: TWideStringField;
    ADS_SaleDocListD_CREATE: TDateTimeField;
    ADS_SaleDocListD_DELETE: TDateTimeField;
    ADS_SaleDocListCOMMENT_DEL: TWideStringField;
    ADS_SaleDocListUSER_CR: TWideStringField;
    ADS_SaleDocListUSER_DEL: TWideStringField;
    ADS_SaleDocListID_GR_PROV: TIntegerField;
    ADS_SaleDocListCLI_K: TWideStringField;
    ADS_SaleDocListNAMEDOC: TWideStringField;
    ADS_SaleDocListCHAR_DOC: TWideStringField;
    ADS_SaleDocListID_DOC_TYPE: TIntegerField;
    ADS_SaleDocListID_CHAR_DOC: TIntegerField;
    ADS_SaleDocListID_CLI_K: TIntegerField;
    ADS_SaleDocListIS_DELETE: TIntegerField;
    ADS_SaleDocListCLOSE_SUM: TFloatField;
    ADS_SaleDocListFIX_PROV: TIntegerField;
    ADS_SaleDocListINN_K: TWideStringField;
    ADS_SaleDocListINN_D: TWideStringField;
    ADS_SaleDocListID_CLIENT: TIntegerField;
    ADS_SaleDocListSUM_OPL_BONUS: TFloatField;
    ADS_SaleDocListSUM_OPL_CARD: TFloatField;
    ADS_SaleDocListSUM_POLUCH: TFloatField;
    ADS_SaleDocListSUM_SDACHI: TFloatField;
    ADS_SaleDocListIS_EXPORT: TIntegerField;
    SP_COPY_DOC_FOR_VOZVRAT: TADOStoredProc;
    QKassaRepotr: TADOQuery;
    DSQKassaRepotr: TDataSource;
    QKassaRepotrS_REAL: TFloatField;
    QKassaRepotrS_2KAT: TFloatField;
    QKassaRepotrS_REAL_KOLBASA: TFloatField;
    QKassaRepotrS_2KAT_KOLBASA: TFloatField;
    QKassaRepotrS_REAL_MYASO: TFloatField;
    QKassaRepotrS_2KAT_MYASO: TFloatField;
    QKassaRepotrS_REAL_TNP: TFloatField;
    QKassaRepotrS_2KAT_TNP: TFloatField;
    QKassaRepotrSUM_UCEN: TFloatField;
    QKassaRepotrSUM_UCEN_KOLBASA: TFloatField;
    QKassaRepotrSUM_UCEN_MYASO: TFloatField;
    QKassaRepotrSUM_UCEN_TNP: TFloatField;
    QKassaRepotrSUM_OPL_CARD: TFloatField;
    QKassaRepotrSUM_OPL_BONUS: TFloatField;
    QKassaRepotrSUM_NAL: TFloatField;
    QKassaRepotrSN_KOLBASA: TFloatField;
    QKassaRepotrSN_MYASO: TFloatField;
    QKassaRepotrSN_TNP: TFloatField;
    ADOCommandSetNull_PRICE_TMP: TADOCommand;
    QKassaRepotrS_VOZVR: TFloatField;
    QKassaRepotrS_VOZVR_KOLBASA: TFloatField;
    QKassaRepotrSN_VOZVR_KOLBASA: TFloatField;
    QKassaRepotrS_VOZVR_MYASO: TFloatField;
    QKassaRepotrSN_VOZVR_MYASO: TFloatField;
    QKassaRepotrS_VOZVR_TNP: TFloatField;
    QKassaRepotrSN_VOZVR_TNP: TFloatField;
    QKassaRepotrSUM_VOZVR_NAL: TFloatField;
    QKassaRepotrSUM_KAS: TFloatField;
    ADOCommandInsert_UserPRICE: TADOCommand;
    ADODSPriceID_VENDOR: TIntegerField;
    ADODSPriceVENDOR: TWideStringField;
    QDocList: TADOQuery;
    DS_QDocList: TDataSource;
    ADODSPricePRICE_VENDOR: TFloatField;
    QPriceTovSelectPRICE_VENDOR: TFloatField;
    QPriceTovSelectss_vendor: TFloatField;
    QPriceTovSelectOSTAT: TFloatField;
    QDocListD: TDateTimeField;
    QDocListNN: TWideStringField;
    QDocListMINUS: TFloatField;
    QDocListPRICE_KATEG: TIntegerField;
    QDocListID_NAKLCAP: TAutoIncField;
    QDocListTOT_SUM: TFloatField;
    QDocListTOT_NUM: TFloatField;
    QDocListSCH_D: TStringField;
    QDocListSCH_K: TStringField;
    QDocListCLIENT: TWideStringField;
    QDocListD_CREATE: TDateTimeField;
    QDocListUSER_CR: TWideStringField;
    QDocListCLI_K: TWideStringField;
    QDocListNAMEDOC: TWideStringField;
    QDocListCHAR_DOC: TWideStringField;
    QDocListID_DOC_TYPE: TIntegerField;
    QDocListID_CHAR_DOC: TIntegerField;
    QDocListID_CLI_K: TIntegerField;
    QDocListINN_K: TWideStringField;
    QDocListINN_D: TWideStringField;
    QDocListID_CLIENT: TIntegerField;
    ADOCommandOstatkiCalc: TADOCommand;
    ADODSPriceNUMB_PROTOTYPE: TFloatField;
    ADODSPriceIS_EXISTS_OSTATOK: TIntegerField;
    ADOCommandInsert_DocumCap: TADOCommand;
    ADOCommandInsert_DocumTov: TADOCommand;
    ADOCommandInsert_DocumNaveski: TADOCommand;
    SP_COPY_IMPORT_DOC: TADOStoredProc;
    SP_IVNENT_UNION: TADOStoredProc;
    ADOCommandDelete_PredSkidka: TADOCommand;
    ADOCommandInsert_Skidka: TADOCommand;
    ADODSPriceIS_ACTION: TIntegerField;
    SP_CALC_DOC_RESULT: TADOStoredProc;
    ADS_SaleDocListSKIDKA_KOLBASA: TFloatField;
    ADS_SaleDocListSKIDKA_MYASO: TFloatField;
    ADS_SaleDocListSKIDKA_TNP: TFloatField;
    ADS_SaleDocListPER_SKIDKA_KOLBASA: TFloatField;
    ADS_SaleDocListPER_SKIDKA_MYASO: TFloatField;
    ADS_SaleDocListPER_SKIDKA_TNP: TFloatField;
    ADS_SaleDocListSKIDKA_COMMENT: TWideStringField;
    ADS_SaleDocListMIN_KOLBASA: TFloatField;
    ADS_SaleDocListMIN_MYASO: TFloatField;
    ADS_SaleDocListMIN_TNP: TFloatField;
    QPrintReceipt_Kolbasa: TADOQuery;
    QPrintReceipt_Myaso: TADOQuery;
    QPrintReceipt_TNP: TADOQuery;
    ADOCommand_Delete_PredNewPriceTov: TADOCommand;
    ADOCommandInsertNEW_PRICE_POS: TADOCommand;
    QKassaRepotrSKIDKA_KOLBASA: TFloatField;
    QKassaRepotrSKIDKA_MYASO: TFloatField;
    QKassaRepotrSKIDKA_TNP: TFloatField;
    QKassaRepotrSKIDKA: TFloatField;
    Q_CLIENTS_NEW_POS: TADOQuery;
    ADOCommand_Delete_PredAdvertMsg: TADOCommand;
    ADOCommandInsertAdvert: TADOCommand;
    ADOCommand_Delete_PredUserTradePoint: TADOCommand;
    ADOCommand_Insert_UserTradePoint: TADOCommand;
    ADOCommandDeleteCLIENTS_NEW_POS: TADOCommand;
    ADOCommand_Delete_PredPrice: TADOCommand;
    Q_PrinterSetup: TADOQuery;
    ADOCommand_Delete_PredKioOperGroup: TADOCommand;
    ADOCommandInsertKIO_OPERATIONS_GRUP: TADOCommand;
    QKassaRepotrZATRATY: TFloatField;
    ADODSPriceIS_FISCAL: TIntegerField;
    QPriceTovSelectIS_FISCAL: TIntegerField;
    ADOCommand_Delete_PredPRODUCT_POS: TADOCommand;
    ADOCommand_Insert_PRODUCT_POS: TADOCommand;
    ADOCommand_Delete_PredNORM_ASSEMB_POS: TADOCommand;
    ADOCommand_Insert_NORM_ASSEMB_POS: TADOCommand;
    QPrintReceipt_Tov_Fiscal: TADOQuery;
    QPrintReceipt_Tov_NotFiscal: TADOQuery;
    QPrintReceipt_Kolbasa_NotFiscal: TADOQuery;
    QPrintReceipt_Myaso_NotFiscal: TADOQuery;
    QPrintReceipt_TNP_NotFiscal: TADOQuery;
    ADS_SaleDocListROUND_SUM: TFloatField;
    ADOCommand_Delete_PredKUPON_CARD: TADOCommand;
    ADOCommandInsertKUPON_CARD: TADOCommand;
    ADODSPriceIS_EXCISE: TIntegerField;
    QNAVESKI_TMPEXCISE_BAR_CODE: TWideStringField;
    ADS_SaleDocListCARD_NN_NOT_FISCAL: TWideStringField;
    ADS_SaleDocListTRANS_CODE_NOT_FISCAL: TWideStringField;
    ADS_SaleDocListCARD_NN_FISCAL: TWideStringField;
    ADS_SaleDocListTRANS_CODE_FISCAL: TWideStringField;
    Q_EXCISE_BAR_CODE: TADOQuery;
    ADS_SaleDocListIS_SVERENO: TIntegerField;
    ADS_SaleDocListID_LINK_DOC_2: TIntegerField;
    ADS_SaleDocListSUM_SDACHI_TO_CARD: TFloatField;
    ADOCommandDELETE_RRO_CERTIFIC: TADOCommand;
    ADOCommandDELETE_RRO_KASSA_TS: TADOCommand;
    ADOCommandInsertRRO_Certific: TADOCommand;
    ADOCommandInsertRRO_KASSA_TS: TADOCommand;
    ADS_SaleDocListIS_CAN_REGISTRED_RRO: TIntegerField;
    ADS_SaleDocListIS_REGISTER_RRO: TIntegerField;
    ADS_SaleDocListID_CLI_RRO: TIntegerField;
    ADS_SaleDocListCHECK_NUMFISCAL: TWideStringField;
    ADS_SaleDocListORDERDATETIME: TWideStringField;
    ADS_SaleDocListFOP: TWideStringField;
    ADS_SaleDocListID_NUM_FISCAL_KASSA: TWideStringField;
    QKassaRepotrSUM_VOZVR_CARD: TFloatField;
    QKassaRepotrROUND_SUM: TFloatField;
    QKassaRepotrSUM_SDACHI_TO_CARD: TFloatField;
    QKassaRepotrSUM_REAL_TO_PAY: TFloatField;
    QDocListIS_CAN_REGISTRED_RRO: TIntegerField;
    QDocListIS_REGISTER_RRO: TIntegerField;
    QKassaReport_RRO: TADOQuery;
    QKassaReport_RROS_REAL: TFloatField;
    QKassaReport_RROS_2KAT: TFloatField;
    QKassaReport_RROS_REAL_KOLBASA: TFloatField;
    QKassaReport_RROS_2KAT_KOLBASA: TFloatField;
    QKassaReport_RROS_REAL_MYASO: TFloatField;
    QKassaReport_RROS_2KAT_MYASO: TFloatField;
    QKassaReport_RROS_REAL_TNP: TFloatField;
    QKassaReport_RROS_2KAT_TNP: TFloatField;
    QKassaReport_RROSUM_UCEN: TFloatField;
    QKassaReport_RROSUM_UCEN_KOLBASA: TFloatField;
    QKassaReport_RROSUM_UCEN_MYASO: TFloatField;
    QKassaReport_RROSUM_UCEN_TNP: TFloatField;
    QKassaReport_RROSUM_OPL_CARD: TFloatField;
    QKassaReport_RROSUM_OPL_BONUS: TFloatField;
    QKassaReport_RROSUM_NAL: TFloatField;
    QKassaReport_RROSN_KOLBASA: TFloatField;
    QKassaReport_RROSN_MYASO: TFloatField;
    QKassaReport_RROSN_TNP: TFloatField;
    QKassaReport_RROS_VOZVR: TFloatField;
    QKassaReport_RROS_VOZVR_KOLBASA: TFloatField;
    QKassaReport_RROSN_VOZVR_KOLBASA: TFloatField;
    QKassaReport_RROS_VOZVR_MYASO: TFloatField;
    QKassaReport_RROSN_VOZVR_MYASO: TFloatField;
    QKassaReport_RROS_VOZVR_TNP: TFloatField;
    QKassaReport_RROSN_VOZVR_TNP: TFloatField;
    QKassaReport_RROSUM_VOZVR_NAL: TFloatField;
    QKassaReport_RROSKIDKA_KOLBASA: TFloatField;
    QKassaReport_RROSKIDKA_MYASO: TFloatField;
    QKassaReport_RROSKIDKA_TNP: TFloatField;
    QKassaReport_RROSKIDKA: TFloatField;
    QKassaReport_RROZATRATY: TFloatField;
    QKassaReport_RROSUM_VOZVR_CARD: TFloatField;
    QKassaReport_RROROUND_SUM: TFloatField;
    QKassaReport_RROSUM_SDACHI_TO_CARD: TFloatField;
    QKassaReport_RROSUM_REAL_TO_PAY: TFloatField;
    QKassaReport_RROKASSA_INP: TFloatField;
    QKassaReport_RROKASSA_OUT: TFloatField;
    QKassaReport_RROSUM_KAS: TFloatField;
    DSQKassaReport_RRO: TDataSource;
    SP_SET_RRO_DATA_TO_NAKLCAP: TADOStoredProc;
    ADOCommand_Delete_PredBarcodes: TADOCommand;
    ADOCommandInsert_BARCODES: TADOCommand;
    ADOCommandSavePredUsers: TADOCommand;
    ADOCommandRestorePredUsers: TADOCommand;
    ADOCommandSavePredKateg_Cli: TADOCommand;
    ADOCommandRestorePredKateg_Cli: TADOCommand;
    ADOCommandRestorePredCli: TADOCommand;
    ADOCommandSavePredCli: TADOCommand;
    ADOCommandSavePredBonuses: TADOCommand;
    ADOCommandRestorePredBonuses: TADOCommand;
    ADOCommandSavePredGrTov: TADOCommand;
    ADOCommandRestorePredGrTov: TADOCommand;
    ADOCommandSavePredTov: TADOCommand;
    ADOCommandRestorePredTov: TADOCommand;
    ADOCommandSavePredBarcodes: TADOCommand;
    ADOCommandRestorePredBarcodes: TADOCommand;
    ADOCommandSavePredPrice: TADOCommand;
    ADOCommandRestorePredPrice: TADOCommand;
    ADOCommandSavePredNewPriceTov: TADOCommand;
    ADOCommandRestorePredNewPriceTov: TADOCommand;
    ADOCommandSavePredAdvertMsg: TADOCommand;
    ADOCommandRestorePredAdvertMsg: TADOCommand;
    ADOCommandSavePredKioOperGroup: TADOCommand;
    ADOCommandRestorePredKioOperGroup: TADOCommand;
    ADOCommandSavePredPRODUCT_POS: TADOCommand;
    ADOCommandRestorePredPRODUCT_POS: TADOCommand;
    ADOCommandSavePredNORM_ASSEMB_POS: TADOCommand;
    ADOCommandRestorePredNORM_ASSEMB_POS: TADOCommand;
    ADOCommandSavePredKUPON_CARD: TADOCommand;
    ADOCommandRestorePredKUPON_CARD: TADOCommand;
    ADOCommandSavePredSkidka: TADOCommand;
    ADOCommandRestorePredSkidka: TADOCommand;
    ADOCommandDelete_Docum_TMP: TADOCommand;
    ADS_SaleDocListID_USERS: TIntegerField;
    ADS_SaleDocListZATRNAME: TWideStringField;
    QDocListIS_FINAL: TIntegerField;
    QDocListis_final_doc: TStringField;
    ADS_SaleDocListIS_FINAL: TIntegerField;
    ADS_SaleDocListis_final_doc: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADODSPriceAfterScroll(DataSet: TDataSet);
    procedure ADODSPriceAfterPost(DataSet: TDataSet);
    procedure QPriceTovSelectCalcFields(DataSet: TDataSet);
    procedure QDocListCalcFields(DataSet: TDataSet);
    procedure ADS_SaleDocListCalcFields(DataSet: TDataSet);
    procedure ADS_SaleDocListAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    is_connected:boolean;
    function IsClosedPeriod(Date_Control:TDateTime):boolean;
  end;

var
  DM1: TDM1;

implementation

uses reg_server, users_f, Vcl.Dialogs, myfuncs,  Vcl.Controls, USaleDoc, Math, UMainForm,
USaleDocList;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM1.ADODSPriceAfterPost(DataSet: TDataSet);
begin
  if F_SaleDoc<>Nil then
  F_SaleDoc.CalcCarentResult ;
end;

procedure TDM1.ADODSPriceAfterScroll(DataSet: TDataSet);
begin
 with QNAVESKI_TMP do
 begin
  Close;
  Parameters.ParamByName('IDUSER').Value:=ADODSPrice.fieldByName('ID_USERS').AsInteger;
  Parameters.ParamByName('IDTOV').Value:=ADODSPrice.fieldByName('ID_TOV').AsInteger;
  Open;
 end;

 // Блокировка ввода веса вручную 0-нет 1-да
 if F_main.BLOCKING_MANUAL_WEIGHT_ENTRY=1 then
 begin
   if F_SaleDoc<>nil then
   begin
    if LowerCase(Trim(dm1.ADODSPrice.FieldByName('EDIZM').AsString))='кг' then
    begin
      F_SaleDoc.EWeight.ReadOnly:=True;

    end
    else
    begin
      F_SaleDoc.EWeight.ReadOnly:=False;
    end;
   end;
 end
 else F_SaleDoc.EWeight.ReadOnly:=False;


end;

procedure TDM1.ADS_SaleDocListAfterScroll(DataSet: TDataSet);
begin
    // запретить редакрировать документы продажи
  if FSaleDocList<>Nil then
  begin
    if F_Main.EDIT_DOC_ENABLE=0 then
    begin
      if ((ADS_SaleDocList.FieldByName('ID_DOC_TYPE').AsInteger = 200)
        or (ADS_SaleDocList.FieldByName('ID_DOC_TYPE').AsInteger = 204)) then
      begin
        FSaleDocList.BBEditDoc.Visible:=(ADS_SaleDocList.FieldByName('IS_FINAL').AsInteger=0);
        FSaleDocList.BBDelDoc.Visible:=FSaleDocList.BBEditDoc.Visible;
      end;

    end;
  end;
end;

procedure TDM1.ADS_SaleDocListCalcFields(DataSet: TDataSet);
begin
  if ADS_SaleDocList.FieldByName('IS_FINAL').AsInteger=0 then  ADS_SaleDocListis_final_doc.Value:='не законченый'
  else  ADS_SaleDocListis_final_doc.Value:='законченый';
end;

procedure TDM1.DataModuleCreate(Sender: TObject);
var is_work_user:boolean;
begin
  ADOConnection1.Connected:=False;
  ADOConnection1.ConnectionString:=Connect_info;
  try

   ADODSUsers.Parameters.ParamByName('isdelete').Value:=0;
   ADODSUsers.Active:=True;
   if ADODSUsers.Locate('LOGIN',Login,[loPartialKey]) then
   begin
    ID_user_select:=ADODSUsers.FieldByName('ID_USERS').Asinteger;
    user_select:=ADODSUsers.FieldByName('NAME').AsString;
    status_user:=ADODSUsers.FieldByName('STATUS').Asinteger;
    user_birthday:=ADODSUsers.FieldByName('BIRTHDAY').AsFloat;

    with Tb_USER_CONNECT do
    begin
     Open;
     first;
     is_work_user:=False;
     while not EOF do
     begin
      if fieldbyname('ID_USER').AsInteger=ID_user_select  then
      begin
        is_work_user:=true;
        break;
      end;
      next;
     end;
     if is_work_user then
     begin
      MessageDlg('Пользователь БД с логином '+Login+' уже работает!',
     mtError, [mbOk], 0);
     status_user:=2;
      if status_user=2 then
      begin
        if MessageDlg('Войти с систему?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes   then


         is_connected:=True
        else is_connected:=False;
      end
      else   is_connected:=False;
     end
     else
      begin
       is_connected:=True;
       Append;
       fieldbyname('ID_USER').AsInteger:=ID_user_select;
       post;
      end;
     Close;
    end;  // with Tb_USER_CONNECT do

   end
   else
    begin
    ID_user_select:=Unknown_code;
    user_select:=Unknown_str;
    status_user:=Unknown_code;
    user_birthday:=0.0;
     MessageDlg('Пользователь БД с логином '+Login+' не зарегистрирован в приложении!',
     mtError, [mbOk], 0);
     is_connected:=False;
   end;
   ADODSUsers.Active:=False;
  except
     MessageDlg('Соединение с сервером БД отсутствует',
     mtError, [mbOk], 0);
     is_connected:=False;
  end;


end;

function TDM1.IsClosedPeriod(Date_Control:TDateTime):boolean;
begin
 DM1.TbClose_Date.Close;
 DM1.TbClose_Date.Open;
if Date_Control <=
  DM1.TbClose_Date.FieldByName('DATE_CLOSED').AsFloat then
begin
 MessageDlg('Нельзя изменять информацию! Период закрыт '+
  DateTimeToStr(DM1.TbClose_Date.FieldByName('DATE_CLOSED').AsFloat),
 mtInformation,  [mbOk], 0);
 result:=True;
end
else  result:=False;
DM1.TbClose_Date.Close;
end;



procedure TDM1.QDocListCalcFields(DataSet: TDataSet);
begin
  if QDocList.FieldByName('IS_FINAL').AsInteger=0 then  QDocListis_final_doc.Value:='не законченый'
  else  QDocListis_final_doc.Value:='законченый';

end;

procedure TDM1.QPriceTovSelectCalcFields(DataSet: TDataSet);
begin
 if F_SaleDoc<>nil then
 begin
  QPriceSelect.DisableControls;
  if SimpleRoundTo(QPriceTovSelect.FieldbyName('PRICE_TMP').AsFloat)>=0.01 then
   QPriceTovSelectprice_select.Value:=QPriceTovSelect.FieldbyName('PRICE_TMP').AsFloat
  else
    QPriceTovSelectprice_select.Value:=QPriceTovSelect.FieldbyName('PRICE_UCH').AsFloat;


   QPriceTovSelectrn.Value:=QPriceTovSelect.RecNo ;
   QPriceTovSelectss.Value:=QPriceTovSelectprice_select.Value *  QPriceTovSelect.FieldByName('NUMB').AsFloat;
   QPriceTovSelectss_vendor.Value:=QPriceTovSelect.FieldByName('PRICE_VENDOR').AsFloat *  QPriceTovSelect.FieldByName('NUMB').AsFloat;

   QPriceSelect.EnableControls;

 end; //  if F_SaleDoc<>nil then

end;

end.
