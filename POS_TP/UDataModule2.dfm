object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 678
  Width = 892
  object CDS_Doc_Type: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Doc_Type'
    RemoteServer = DSProviderConnection1
    Left = 24
    Top = 200
    object CDS_Doc_TypeID_DOC_TYPE: TAutoIncField
      FieldName = 'ID_DOC_TYPE'
      ReadOnly = True
      Visible = False
    end
    object CDS_Doc_TypeNAMEDOC: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 50
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object CDS_Doc_TypeNEXT_NO: TIntegerField
      DisplayLabel = #1057#1083#1077#1076'.'#8470
      FieldName = 'NEXT_NO'
    end
    object CDS_Doc_TypeID_SCH_D: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1044
      FieldName = 'ID_SCH_D'
      FixedChar = True
      Size = 10
    end
    object CDS_Doc_TypeCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_D'
      Size = 255
    end
    object CDS_Doc_TypeID_SCH_K: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1050
      FieldName = 'ID_SCH_K'
      FixedChar = True
      Size = 10
    end
    object CDS_Doc_TypeCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_K'
      Size = 255
    end
    object CDS_Doc_TypeID_CLI_D: TIntegerField
      FieldName = 'ID_CLI_D'
      Visible = False
    end
    object CDS_Doc_TypeID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object CDS_Doc_TypeID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
      Visible = False
    end
    object CDS_Doc_TypeCHAR_DOC: TWideStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1082
      DisplayWidth = 20
      FieldName = 'CHAR_DOC'
      Size = 50
    end
    object CDS_Doc_TypeNDS_PER: TFloatField
      DisplayLabel = '%'#1053#1044#1057
      FieldName = 'NDS_PER'
    end
    object CDS_Doc_TypeID_PROV_CASE: TIntegerField
      DisplayLabel = #1042#1072#1088'.'#1087#1088#1086#1074
      FieldName = 'ID_PROV_CASE'
    end
    object CDS_Doc_TypeID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object CDS_Doc_TypeGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088'.'#1090#1086#1074#1072#1088#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object CDS_Doc_TypeID_KATEG_CLI: TIntegerField
      FieldName = 'ID_KATEG_CLI'
      Visible = False
    end
    object CDS_Doc_TypeKATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075'.'#1076#1077#1073#1080#1090#1086#1088#1072
      DisplayWidth = 20
      FieldName = 'KATEGOR'
      Size = 50
    end
    object CDS_Doc_TypeID_KATEG_CLI_K: TIntegerField
      FieldName = 'ID_KATEG_CLI_K'
      Visible = False
    end
    object CDS_Doc_TypeKATEGOR_K: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075'.'#1082#1088#1077#1076#1080#1090#1086#1088#1072
      DisplayWidth = 20
      FieldName = 'KATEGOR_K'
      Size = 50
    end
    object CDS_Doc_TypeSALES_CATEGOR: TIntegerField
      DisplayLabel = #1050#1072#1090#1077#1075'.'#1094#1077#1085
      FieldName = 'SALES_CATEGOR'
    end
    object CDS_Doc_TypeWITH_NDS: TIntegerField
      FieldName = 'WITH_NDS'
      Visible = False
    end
    object CDS_Doc_TypeTIME_DEFAULT: TDateTimeField
      FieldName = 'TIME_DEFAULT'
      Visible = False
    end
    object CDS_Doc_TypeFORM_PRN: TIntegerField
      FieldName = 'FORM_PRN'
      Visible = False
    end
    object CDS_Doc_TypeID_SUPPL: TIntegerField
      FieldName = 'ID_SUPPL'
      Visible = False
    end
    object CDS_Doc_TypeSUPPL: TWideStringField
      FieldName = 'SUPPL'
      Visible = False
      Size = 255
    end
    object CDS_Doc_TypeID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
      Visible = False
    end
    object CDS_Doc_TypeLINK_CHAR_DOC: TWideStringField
      FieldName = 'LINK_CHAR_DOC'
      Visible = False
      Size = 50
    end
    object CDS_Doc_TypeID_LINK_CH_DOC: TIntegerField
      FieldName = 'ID_LINK_CH_DOC'
      Visible = False
    end
  end
  object DS_Doc_Type: TDataSource
    DataSet = CDS_Doc_Type
    Left = 64
    Top = 200
  end
  object DSClientCallbackChannelManager1: TDSClientCallbackChannelManager
    DSHostname = '192.168.0.32'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'DelphiLabsChannel'
    ManagerId = '509546.648679.424787'
    Left = 464
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=17.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=127.0.0.1'
      'Port=215'
      'Filters={"ZLibCompression":{"CompressMoreThan":"1024"}}')
    Left = 48
    Top = 8
    UniqueId = '{4210320D-C592-48D0-8870-515CB38A6AA8}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 200
    Top = 8
  end
  object CDS_NaklCap: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_NaklCap'
    RemoteServer = DSProviderConnection1
    Left = 152
    Top = 200
    object CDS_NaklCapD: TDateTimeField
      FieldName = 'D'
    end
    object CDS_NaklCapNN: TWideStringField
      FieldName = 'NN'
      Size = 50
    end
    object CDS_NaklCapCHEREZ: TWideStringField
      DisplayLabel = #1063#1077#1088#1077#1079
      FieldName = 'CHEREZ'
      Size = 50
    end
    object CDS_NaklCapDOVER: TWideStringField
      FieldName = 'DOVER'
      Size = 50
    end
    object CDS_NaklCapOSNOV: TWideStringField
      FieldName = 'OSNOV'
      Size = 50
    end
    object CDS_NaklCapUDOST: TWideStringField
      FieldName = 'UDOST'
      Size = 50
    end
    object CDS_NaklCapFORMOPL: TWideStringField
      FieldName = 'FORMOPL'
      Size = 50
    end
    object CDS_NaklCapTRANSP: TFloatField
      FieldName = 'TRANSP'
    end
    object CDS_NaklCapTARA: TFloatField
      FieldName = 'TARA'
    end
    object CDS_NaklCapPLUS: TFloatField
      FieldName = 'PLUS'
    end
    object CDS_NaklCapMINUS: TFloatField
      FieldName = 'MINUS'
    end
    object CDS_NaklCapZATRNAME: TWideStringField
      FieldName = 'ZATRNAME'
      Size = 255
    end
    object CDS_NaklCapZATR: TFloatField
      FieldName = 'ZATR'
    end
    object CDS_NaklCapPRICE_KATEG: TIntegerField
      FieldName = 'PRICE_KATEG'
    end
    object CDS_NaklCapID_NAKLCAP: TAutoIncField
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
    end
    object CDS_NaklCapTOT_SUM: TFloatField
      FieldName = 'TOT_SUM'
    end
    object CDS_NaklCapTOT_NUM: TFloatField
      FieldName = 'TOT_NUM'
    end
    object CDS_NaklCapSCH_D: TStringField
      FieldName = 'SCH_D'
      FixedChar = True
      Size = 10
    end
    object CDS_NaklCapSCH_K: TStringField
      FieldName = 'SCH_K'
      FixedChar = True
      Size = 10
    end
    object CDS_NaklCapCLIENT: TWideStringField
      FieldName = 'CLIENT'
      Size = 255
    end
    object CDS_NaklCapSUPPL: TWideStringField
      FieldName = 'SUPPL'
      Size = 255
    end
    object CDS_NaklCapNUM_TARA: TFloatField
      FieldName = 'NUM_TARA'
    end
    object CDS_NaklCapD_CREATE: TDateTimeField
      FieldName = 'D_CREATE'
    end
    object CDS_NaklCapD_DELETE: TDateTimeField
      FieldName = 'D_DELETE'
    end
    object CDS_NaklCapCOMMENT_DEL: TWideStringField
      FieldName = 'COMMENT_DEL'
      Size = 50
    end
    object CDS_NaklCapUSER_CR: TWideStringField
      FieldName = 'USER_CR'
      Size = 50
    end
    object CDS_NaklCapUSER_DEL: TWideStringField
      FieldName = 'USER_DEL'
      Size = 50
    end
    object CDS_NaklCapNAMETARA: TWideStringField
      FieldName = 'NAMETARA'
      Size = 255
    end
    object CDS_NaklCapID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object CDS_NaklCapID_GR_PROV: TIntegerField
      FieldName = 'ID_GR_PROV'
    end
    object CDS_NaklCapCLI_K: TWideStringField
      FieldName = 'CLI_K'
      Size = 255
    end
    object CDS_NaklCapNDS: TFloatField
      FieldName = 'NDS'
    end
    object CDS_NaklCapSTAVKA_NDS: TFloatField
      FieldName = 'STAVKA_NDS'
    end
    object CDS_NaklCapNAMEDOC: TWideStringField
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object CDS_NaklCapCHAR_DOC: TWideStringField
      FieldName = 'CHAR_DOC'
      Size = 50
    end
    object CDS_NaklCapID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
    end
    object CDS_NaklCapID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
    end
    object CDS_NaklCapID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
    end
    object CDS_NaklCapIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
    end
    object CDS_NaklCapCLOSE_SUM: TFloatField
      FieldName = 'CLOSE_SUM'
    end
    object CDS_NaklCapID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
    end
    object CDS_NaklCapDOC_LINK: TWideStringField
      FieldName = 'DOC_LINK'
      Size = 50
    end
    object CDS_NaklCapD_LINK: TDateTimeField
      FieldName = 'D_LINK'
    end
    object CDS_NaklCapNN_LINK: TWideStringField
      FieldName = 'NN_LINK'
      Size = 50
    end
    object CDS_NaklCapPER_NACENKA: TFloatField
      FieldName = 'PER_NACENKA'
    end
    object CDS_NaklCapFIX_PROV: TIntegerField
      FieldName = 'FIX_PROV'
    end
    object CDS_NaklCapNALOG_NAKL: TIntegerField
      FieldName = 'NALOG_NAKL'
    end
    object CDS_NaklCapINN_K: TWideStringField
      FieldName = 'INN_K'
    end
    object CDS_NaklCapINN_D: TWideStringField
      FieldName = 'INN_D'
    end
    object CDS_NaklCapID_CLIENT: TIntegerField
      FieldName = 'ID_CLIENT'
    end
  end
  object DS_NaklCap: TDataSource
    DataSet = CDS_NaklCap
    Left = 192
    Top = 200
  end
  object CDSQ_NaklCapInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_NaklCapInfo'
    RemoteServer = DSProviderConnection1
    Left = 24
    Top = 264
  end
  object CDSQ_ControlLinkDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_ControlLinkDoc'
    RemoteServer = DSProviderConnection1
    Left = 80
    Top = 264
  end
  object CDS_Price: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Price'
    RemoteServer = DSProviderConnection1
    Left = 136
    Top = 264
  end
  object DS_Price: TDataSource
    DataSet = CDS_Price
    Left = 168
    Top = 264
  end
  object CDS_AvtoNariad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderAvtoNariad'
    RemoteServer = DSProviderConnection1
    Left = 352
    Top = 200
    object CDS_AvtoNariadID_AVTO_NARIAD: TAutoIncField
      FieldName = 'ID_AVTO_NARIAD'
      ReadOnly = True
    end
    object CDS_AvtoNariadD: TDateTimeField
      FieldName = 'D'
    end
    object CDS_AvtoNariadNN: TWideStringField
      FieldName = 'NN'
      Size = 50
    end
    object CDS_AvtoNariadPROBEG1: TFloatField
      FieldName = 'PROBEG1'
    end
    object CDS_AvtoNariadPROBEG2: TFloatField
      FieldName = 'PROBEG2'
    end
    object CDS_AvtoNariadMOTOCHAS1: TFloatField
      FieldName = 'MOTOCHAS1'
    end
    object CDS_AvtoNariadMOTOCHAS2: TFloatField
      FieldName = 'MOTOCHAS2'
    end
    object CDS_AvtoNariadNORMA_PROBEG_TMP: TFloatField
      FieldName = 'NORMA_PROBEG_TMP'
    end
    object CDS_AvtoNariadNORMA_MOTOCHAS_TMP: TFloatField
      FieldName = 'NORMA_MOTOCHAS_TMP'
    end
    object CDS_AvtoNariadN_TOPLIVA: TFloatField
      FieldName = 'N_TOPLIVA'
    end
    object CDS_AvtoNariadCOMMENT_RABOT: TWideStringField
      FieldName = 'COMMENT_RABOT'
      Size = 255
    end
    object CDS_AvtoNariadIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
    end
    object CDS_AvtoNariadID_USER: TIntegerField
      FieldName = 'ID_USER'
    end
    object CDS_AvtoNariadID_USER_DEL: TIntegerField
      FieldName = 'ID_USER_DEL'
    end
    object CDS_AvtoNariadD_CREATE: TDateTimeField
      FieldName = 'D_CREATE'
    end
    object CDS_AvtoNariadD_DELETE: TDateTimeField
      FieldName = 'D_DELETE'
    end
    object CDS_AvtoNariadCOMMENT_DEL: TWideStringField
      FieldName = 'COMMENT_DEL'
      Size = 50
    end
    object CDS_AvtoNariadID_GRPROV: TIntegerField
      FieldName = 'ID_GRPROV'
    end
    object CDS_AvtoNariadSCH_D: TWideStringField
      FieldName = 'SCH_D'
      Size = 10
    end
    object CDS_AvtoNariadID_CLI_D: TIntegerField
      FieldName = 'ID_CLI_D'
    end
    object CDS_AvtoNariadSCH_K: TWideStringField
      FieldName = 'SCH_K'
      Size = 10
    end
    object CDS_AvtoNariadID_CLI_AVTO: TIntegerField
      FieldName = 'ID_CLI_AVTO'
    end
    object CDS_AvtoNariadCL_D: TWideStringField
      FieldName = 'CL_D'
      Size = 255
    end
    object CDS_AvtoNariadCL_K: TWideStringField
      FieldName = 'CL_K'
      Size = 255
    end
    object CDS_AvtoNariadUSER_CR: TWideStringField
      FieldName = 'USER_CR'
      Size = 50
    end
    object CDS_AvtoNariadUSER_DEL: TWideStringField
      FieldName = 'USER_DEL'
      Size = 50
    end
    object CDS_AvtoNariadINN_K: TWideStringField
      FieldName = 'INN_K'
    end
    object CDS_AvtoNariadINN_D: TWideStringField
      FieldName = 'INN_D'
    end
    object CDS_AvtoNariadID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
    end
  end
  object CDS_AvtoNariadEdit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderAvtoNariadEdit'
    RemoteServer = DSProviderConnection1
    Left = 256
    Top = 200
  end
  object DS_AvtoNariadEdit: TDataSource
    DataSet = CDS_AvtoNariadEdit
    Left = 296
    Top = 200
  end
  object DS_Sch: TDataSource
    DataSet = CDS_Sch
    Left = 416
    Top = 264
  end
  object CDS_Sch: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderSch'
    RemoteServer = DSProviderConnection1
    AfterPost = CDS_SchAfterPost
    Left = 376
    Top = 264
    object CDS_SchID_SCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'ID_SCH'
      FixedChar = True
      Size = 10
    end
    object CDS_SchSCH_NAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SCH_NAME'
      Size = 50
    end
    object CDS_SchID_SCH_TYPE: TIntegerField
      FieldName = 'ID_SCH_TYPE'
      Visible = False
    end
    object CDS_SchID_UCHET: TIntegerField
      FieldName = 'ID_UCHET'
      Visible = False
    end
    object CDS_SchIN_BALANS: TIntegerField
      DisplayLabel = #1041#1072#1083#1072#1085#1089#1086#1074#1099#1081' -1; '#1042#1085#1077#1073#1072#1083#1072#1085#1089#1086#1074#1099#1081' - 0'
      FieldName = 'IN_BALANS'
    end
    object CDS_SchUCHET: TStringField
      DisplayLabel = #1059#1095#1077#1090
      FieldName = 'UCHET'
      ReadOnly = True
    end
    object CDS_SchSCH_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1089#1095#1077#1090#1072
      FieldName = 'SCH_TYPE'
      ReadOnly = True
      Size = 30
    end
  end
  object CDS_SCHTYPE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderSCHTYPE'
    RemoteServer = DSProviderConnection1
    AfterPost = CDS_SCHTYPEAfterPost
    Left = 296
    Top = 264
    object CDS_SCHTYPEID_SCH_TYPE: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SCH_TYPE'
    end
    object CDS_SCHTYPESCH_TYPE: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1089#1095#1077#1090#1072
      FieldName = 'SCH_TYPE'
      Size = 50
    end
  end
  object DS_SCHTYPE: TDataSource
    DataSet = CDS_SCHTYPE
    Left = 336
    Top = 264
  end
  object CDS_UCH: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderUCH'
    RemoteServer = DSProviderConnection1
    AfterPost = CDS_UCHAfterPost
    Left = 216
    Top = 264
    object CDS_UCHID_UCHET: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_UCHET'
    end
    object CDS_UCHUCHET: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1091#1095#1077#1090#1072
      FieldName = 'UCHET'
      Size = 50
    end
  end
  object DS_UCH: TDataSource
    DataSet = CDS_UCH
    Left = 248
    Top = 264
  end
  object CDS_Users: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_USERS'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'LOGIN'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
      end
      item
        Name = 'BIRTHDAY'
        DataType = ftDateTime
      end
      item
        Name = 'IS_DELETE'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'isdelete'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProviderUsers'
    RemoteServer = DSProviderConnection1
    StoreDefs = True
    AfterPost = CDS_UsersAfterPost
    Left = 440
    Top = 208
    object CDS_UsersID_USERS: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_USERS'
      ReadOnly = True
    end
    object CDS_UsersNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'NAME'
      Size = 50
    end
    object CDS_UsersLOGIN: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'LOGIN'
      Size = 50
    end
    object CDS_UsersSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
    end
    object CDS_UsersBIRTHDAY: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHDAY'
    end
    object CDS_UsersIS_DELETE: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1091#1076#1072#1083#1077#1085
      FieldName = 'IS_DELETE'
      ReadOnly = True
    end
  end
  object DS_Users: TDataSource
    DataSet = CDS_Users
    Left = 488
    Top = 208
  end
  object CDS_Clients: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderClients'
    RemoteServer = DSProviderConnection1
    Left = 24
    Top = 328
  end
  object DS_Clients: TDataSource
    DataSet = CDS_Clients
    Left = 64
    Top = 328
  end
  object CDS_Kateg_Cli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderClients'
    RemoteServer = DSProviderConnection1
    Left = 128
    Top = 328
  end
  object DS_Kateg_Cli: TDataSource
    DataSet = CDS_Kateg_Cli
    Left = 200
    Top = 328
  end
  object DS_PricePOS: TDataSource
    DataSet = CDS_PricePOS
    Left = 400
    Top = 336
  end
  object CDS_PricePOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_PricePOS'
    RemoteServer = DSProviderConnection1
    Left = 320
    Top = 336
  end
  object DS_RepOtgruzTov1: TDataSource
    DataSet = CDS_RepOtgruzTov1
    Left = 160
    Top = 368
  end
  object CDS_RepOtgruzTov1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderRepOtgruzTov1'
    RemoteServer = DSProviderConnection1
    Left = 120
    Top = 368
  end
  object CDS_Kateg_Cli_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QKateg_Cli_Import'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 72
  end
  object DS_Kateg_Cli_Import: TDataSource
    DataSet = CDS_Kateg_Cli_Import
    Left = 80
    Top = 72
  end
  object CDS_Clients_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QClients_Import'
    RemoteServer = DSProviderConnection1
    Left = 184
    Top = 72
  end
  object DS_Clients_Import: TDataSource
    DataSet = CDS_Clients_Import
    Left = 232
    Top = 72
  end
  object CDS_Bonuses_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QBonuses_Import'
    RemoteServer = DSProviderConnection1
    Left = 304
    Top = 72
  end
  object DS_Bonuses_Import: TDataSource
    DataSet = CDS_Bonuses_Import
    Left = 352
    Top = 72
  end
  object CDS_NaklCap_Export: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_ADS_NaklCap_Export'
    RemoteServer = DSProviderConnection1
    Left = 512
    Top = 80
  end
  object DS_NaklCap_Export: TDataSource
    DataSet = CDS_NaklCap_Export
    Left = 560
    Top = 80
  end
  object CDS_NaklTov_Export: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_ADS_NaklTov_Export'
    RemoteServer = DSProviderConnection1
    Left = 632
    Top = 80
  end
  object DS_NaklTov_Export: TDataSource
    DataSet = CDS_NaklTov_Export
    Left = 680
    Top = 80
  end
  object CDS_Naveski_Export: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderADS_Naveski_Export'
    RemoteServer = DSProviderConnection1
    Left = 760
    Top = 80
  end
  object DS_Naveski_Export: TDataSource
    DataSet = CDS_Naveski_Export
    Left = 808
    Top = 80
  end
  object CDS_GrTov_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QGrTov_Import'
    RemoteServer = DSProviderConnection1
    Left = 24
    Top = 128
  end
  object DS_GrTov_Import: TDataSource
    DataSet = CDS_GrTov_Import
    Left = 72
    Top = 128
  end
  object CDS_Tov_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QTov_Import'
    RemoteServer = DSProviderConnection1
    Left = 168
    Top = 128
  end
  object DS_Tov_Import: TDataSource
    DataSet = CDS_Tov_Import
    Left = 208
    Top = 128
  end
  object CDS_PRICE_DATE_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QPRICE_DATE_Import'
    RemoteServer = DSProviderConnection1
    Left = 296
    Top = 136
  end
  object DS_PRICE_DATE_Import: TDataSource
    DataSet = CDS_PRICE_DATE_Import
    Left = 336
    Top = 136
  end
  object CDS_UserPrice_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QUserPrice_Import'
    RemoteServer = DSProviderConnection1
    Left = 432
    Top = 136
  end
  object DS_UserPrice_Import: TDataSource
    DataSet = CDS_UserPrice_Import
    Left = 472
    Top = 136
  end
  object CDS_NaklCap_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QNaklCap_Import'
    RemoteServer = DSProviderConnection1
    Left = 576
    Top = 136
  end
  object DS_NaklCap_Import: TDataSource
    DataSet = CDS_NaklCap_Import
    Left = 616
    Top = 136
  end
  object CDS_NaklTov_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QNaklTov_Import'
    RemoteServer = DSProviderConnection1
    Left = 688
    Top = 136
  end
  object DS_NaklTov_Import: TDataSource
    DataSet = CDS_NaklTov_Import
    Left = 728
    Top = 136
  end
  object CDS_Naveski_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QNaveski_Import'
    RemoteServer = DSProviderConnection1
    Left = 784
    Top = 136
  end
  object DS_Naveski_Import: TDataSource
    DataSet = CDS_Naveski_Import
    Left = 824
    Top = 136
  end
  object DS_Skidka_Import: TDataSource
    DataSet = CDS_Skidka_Import
    Left = 448
    Top = 72
  end
  object CDS_Skidka_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QSkidka_POS_Import'
    RemoteServer = DSProviderConnection1
    Left = 400
    Top = 72
  end
  object CDS_NewPriceTov_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QNewPriceTov'
    RemoteServer = DSProviderConnection1
    Left = 608
    Top = 208
  end
  object DS_NewPriceTov_Import: TDataSource
    DataSet = CDS_NewPriceTov_Import
    Left = 648
    Top = 208
  end
  object CDS_CLIENTS_NEW_POS_Export: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_ADS_CLIENTS_NEW_POS_Export'
    RemoteServer = DSProviderConnection1
    Left = 552
    Top = 288
  end
  object DS_CLIENTS_NEW_POS_Export: TDataSource
    DataSet = CDS_CLIENTS_NEW_POS_Export
    Left = 600
    Top = 288
  end
  object CDS_Advert: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_Advert'
    RemoteServer = DSProviderConnection1
    Left = 728
    Top = 208
  end
  object DS_Advert: TDataSource
    DataSet = CDS_Advert
    Left = 768
    Top = 208
  end
  object DS_USER_TRADEPOINT: TDataSource
    DataSet = CDS_USER_TRADEPOINT
    Left = 608
    Top = 352
  end
  object CDS_USER_TRADEPOINT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_UserTradePoint'
    RemoteServer = DSProviderConnection1
    Left = 560
    Top = 352
  end
  object CDS_SHTRIH_CODE_TOV_NEW_POS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_ADS_SHTRIH_CODE_TOV_NEW_POS'
    RemoteServer = DSProviderConnection1
    Left = 736
    Top = 288
  end
  object DS_SHTRIH_CODE_TOV_NEW_POS: TDataSource
    DataSet = CDS_SHTRIH_CODE_TOV_NEW_POS
    Left = 784
    Top = 288
  end
  object CDS_KIO_OPERATIONS_GRUP_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_KIO_OPERATIONS_GRUP_Import'
    RemoteServer = DSProviderConnection1
    Left = 728
    Top = 360
  end
  object DS_KIO_OPERATIONS_GRUP_Import: TDataSource
    DataSet = CDS_KIO_OPERATIONS_GRUP_Import
    Left = 792
    Top = 352
  end
  object CDS_QPRODUCT_POS_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QPRODUCT_POS_Import'
    RemoteServer = DSProviderConnection1
    Left = 568
    Top = 432
  end
  object DS_QPRODUCT_POS_Import: TDataSource
    DataSet = CDS_QPRODUCT_POS_Import
    Left = 608
    Top = 432
  end
  object CDS_QNORM_ASSEMB_POS_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QNORM_ASSEMB_POS_Import'
    RemoteServer = DSProviderConnection1
    Left = 696
    Top = 432
  end
  object DS_QNORM_ASSEMB_POS_Import: TDataSource
    DataSet = CDS_QNORM_ASSEMB_POS_Import
    Left = 736
    Top = 432
  end
  object CDS_Q_KUPON_CARD_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_KUPON_CARD_Import'
    RemoteServer = DSProviderConnection1
    Left = 152
    Top = 432
  end
  object DS_Q_KUPON_CARD_Import: TDataSource
    DataSet = CDS_Q_KUPON_CARD_Import
    Left = 200
    Top = 432
  end
  object CDS_SVERKA_DOC_POS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_SVERKA_DOC_POS_Export'
    RemoteServer = DSProviderConnection1
    Left = 352
    Top = 424
  end
  object DS_SVERKA_DOC_POS: TDataSource
    DataSet = CDS_SVERKA_DOC_POS
    Left = 400
    Top = 424
  end
  object CDS_Q_RRO_CERTIFIC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_RRO_CERTIFIC'
    RemoteServer = DSProviderConnection1
    Left = 728
    Top = 248
  end
  object DS_Q_RRO_CERTIFIC: TDataSource
    DataSet = CDS_Q_RRO_CERTIFIC
    Left = 768
    Top = 248
  end
  object CDS_Q_RRO_KASSA_TS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Q_RRO_KASSA_TS'
    RemoteServer = DSProviderConnection1
    Left = 800
    Top = 248
  end
  object DS_Q_RRO_KASSA_TS: TDataSource
    DataSet = CDS_Q_RRO_KASSA_TS
    Left = 840
    Top = 248
  end
  object DS_BARCODES_Import: TDataSource
    DataSet = CDS_BARCODES_Import
    Left = 208
    Top = 168
  end
  object CDS_BARCODES_Import: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_QBARCODES_Import'
    RemoteServer = DSProviderConnection1
    Left = 168
    Top = 168
  end
  object CDS_CONST_VALUES_TP_EXPORT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_ADS_CONST_VALUES_TP_EXPORT'
    RemoteServer = DSProviderConnection1
    Left = 360
    Top = 496
  end
  object DS_CONST_VALUES_TP_EXPORT: TDataSource
    DataSet = CDS_CONST_VALUES_TP_EXPORT
    Left = 408
    Top = 496
  end
end
