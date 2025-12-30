object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DS_Doc_Type: TDataSource
    DataSet = CDS_Doc_Type
    Left = 192
    Top = 64
  end
  object CDS_Doc_Type: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Doc_Type'
    RemoteServer = DSProviderConnection1
    Left = 80
    Top = 64
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
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 96
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
      'HostName=localhost'
      'port=211'
      'Filters={"ZLibCompression":{"CompressMoreThan":"1024"}}')
    Connected = True
    Left = 48
    Top = 8
    UniqueId = '{4210320D-C592-48D0-8870-515CB38A6AA8}'
  end
end
