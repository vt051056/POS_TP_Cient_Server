object F_Main: TF_Main
  Left = 0
  Top = 0
  Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099' '#1080' '#1082#1072#1089#1089#1099' '#1056#1056#1054
  ClientHeight = 478
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel17: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 478
    Align = alLeft
    TabOrder = 0
    object Panel18: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 41
      Align = alTop
      TabOrder = 0
      object BBAddCLI: TBitBtn
        Left = 208
        Top = 10
        Width = 25
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1086#1073#1098#1077#1082#1090#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1086#1074#1072#1085#1080#1103
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BBAddCLIClick
      end
      object BBDelCLI: TBitBtn
        Left = 281
        Top = 10
        Width = 25
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1086#1073#1098#1077#1082#1090#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1086#1074#1072#1085#1080#1103
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBDelCLIClick
      end
      object DBNavigator7: TDBNavigator
        Left = 16
        Top = 8
        Width = 176
        Height = 25
        DataSource = DS_Q_RRO_CERTIFIC
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 2
      end
      object BBEditCert_ObjHoz: TBitBtn
        Left = 239
        Top = 10
        Width = 27
        Height = 25
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1086#1073#1098#1077#1082#1090#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1086#1074#1072#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BBEditCert_ObjHozClick
      end
    end
    object DBGrid7: TDBGrid
      Left = 1
      Top = 42
      Width = 359
      Height = 435
      Align = alClient
      DataSource = DS_Q_RRO_CERTIFIC
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel1: TPanel
    Left = 708
    Top = 0
    Width = 181
    Height = 478
    Caption = 'Panel1'
    TabOrder = 1
    object BGetPrivateKey: TButton
      Left = 68
      Top = 47
      Width = 113
      Height = 25
      Caption = 'BGetPrivateKey'
      TabOrder = 0
      Visible = False
      OnClick = BGetPrivateKeyClick
    end
    object Button4: TButton
      Left = 106
      Top = 344
      Width = 75
      Height = 25
      Caption = 'ServerState'
      TabOrder = 1
      Visible = False
      OnClick = Button4Click
    end
    object BCloseShift: TButton
      Left = 76
      Top = 288
      Width = 105
      Height = 25
      Caption = 'BCloseShift'
      TabOrder = 2
      Visible = False
      OnClick = BCloseShiftClick
    end
    object BOpenShift: TButton
      Left = 68
      Top = 222
      Width = 113
      Height = 25
      Caption = 'BOpenShift'
      TabOrder = 3
      Visible = False
      OnClick = BOpenShiftClick
    end
    object BTransactionsRegistrarState: TButton
      Left = 28
      Top = 191
      Width = 153
      Height = 25
      Caption = 'BTransactionsRegistrarState'
      TabOrder = 4
      Visible = False
      OnClick = BTransactionsRegistrarStateClick
    end
    object BSetupRegistrar: TButton
      Left = 68
      Top = 160
      Width = 113
      Height = 25
      Caption = 'BSetupRegistrar'
      TabOrder = 5
      Visible = False
      OnClick = BSetupRegistrarClick
    end
    object BSetup: TButton
      Left = 68
      Top = 120
      Width = 113
      Height = 25
      Caption = 'BSetup'
      TabOrder = 6
      Visible = False
      OnClick = BSetupClick
    end
    object BGetObjects: TButton
      Left = 68
      Top = 78
      Width = 113
      Height = 25
      Caption = 'BGetObjects'
      TabOrder = 7
      Visible = False
      OnClick = BGetObjectsClick
    end
    object BGetCertificate: TButton
      Left = 68
      Top = 16
      Width = 113
      Height = 25
      Caption = 'BGetCertificate'
      TabOrder = 8
      Visible = False
      OnClick = BGetCertificateClick
    end
  end
  object Panel2: TPanel
    Left = 361
    Top = 0
    Width = 528
    Height = 478
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 526
      Height = 41
      Align = alTop
      TabOrder = 0
      object BBAddTT: TBitBtn
        Left = 208
        Top = 6
        Width = 25
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1089#1089#1091' '#1080' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1082#1072#1089#1089#1099
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BBAddTTClick
      end
      object BBDelTT: TBitBtn
        Left = 287
        Top = 6
        Width = 25
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1089#1089#1091' '#1080' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1082#1072#1089#1089#1099
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBDelTTClick
      end
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 8
        Width = 176
        Height = 25
        DataSource = DS_Q_RRO_KASSA_TS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 2
      end
      object BBEditCertKass: TBitBtn
        Left = 239
        Top = 6
        Width = 27
        Height = 25
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1089#1089#1091' '#1080' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1082#1072#1089#1089#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BBEditCertKassClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 42
      Width = 526
      Height = 435
      Align = alClient
      DataSource = DS_Q_RRO_KASSA_TS
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Memo1: TMemo
      Left = 182
      Top = 360
      Width = 283
      Height = 105
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
      Visible = False
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 736
    Top = 80
  end
  object ADOConnection1: TADOConnection
    CommandTimeout = 3600
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_EP;Data Source=C-17\MSSQLSRV17;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=DEVMAIN;Use Encryption for Data=False;Tag with c' +
      'olumn collation when possible=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 44
    Top = 98
  end
  object Q_RRO_CERTIFIC: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_RRO_CERTIFICAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select [ID_CLI]'
      '    ,[CERTIFICATE]'
      '    ,[PRIVATE_KEY]'
      '    ,[PASSW]'
      #9',[PATH_TO_CERTIFICATE], [PATH_TO_PRIVATE_KEY],'
      'isnull(DATE_END_CERTIFICATE,0) as DATE_END_CERTIFICATE,'
      #9'CL.CLIENT'
      'FROM [dbo].[RRO_CERTIFIC] R'
      'inner join CLIENTS CL on CL.ID_CLIENTS=R.ID_CLI')
    Left = 141
    Top = 58
    object Q_RRO_CERTIFICCLIENT: TWideStringField
      DisplayLabel = #1054#1073#1098#1077#1082#1090' '#1093#1086#1079#1103#1081#1089#1090#1074#1086#1074#1072#1085#1080#1103
      DisplayWidth = 50
      FieldName = 'CLIENT'
      Size = 255
    end
    object Q_RRO_CERTIFICPASSW: TWideStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      DisplayWidth = 30
      FieldName = 'PASSW'
      Size = 50
    end
    object Q_RRO_CERTIFICPATH_TO_CERTIFICATE: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
      DisplayWidth = 50
      FieldName = 'PATH_TO_CERTIFICATE'
      Size = 255
    end
    object Q_RRO_CERTIFICPATH_TO_PRIVATE_KEY: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1082#1083#1102#1095#1072
      DisplayWidth = 50
      FieldName = 'PATH_TO_PRIVATE_KEY'
      Size = 255
    end
    object Q_RRO_CERTIFICDATE_END_CERTIFICATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'DATE_END_CERTIFICATE'
    end
    object Q_RRO_CERTIFICCERTIFICATE: TMemoField
      DisplayLabel = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
      FieldName = 'CERTIFICATE'
      BlobType = ftMemo
    end
    object Q_RRO_CERTIFICPRIVATE_KEY: TMemoField
      DisplayLabel = #1050#1083#1102#1095
      FieldName = 'PRIVATE_KEY'
      BlobType = ftMemo
    end
    object Q_RRO_CERTIFICID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Visible = False
    end
  end
  object DS_Q_RRO_CERTIFIC: TDataSource
    DataSet = Q_RRO_CERTIFIC
    Left = 248
    Top = 59
  end
  object ADOCommandDeleteRRO_KASSA_TS: TADOCommand
    CommandText = 
      'declare @ID_RRO_KASSA int'#13#10'set @ID_RRO_KASSA=:ID_RRO_KASSA'#13#10'dele' +
      'te[dbo].[RRO_KASSA_TS] where ID_RRO_KASSA=@ID_RRO_KASSA'
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_RRO_KASSA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 544
    Top = 235
  end
  object Q_RRO_KASSA_TS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CLI'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_CLI int'
      'set @ID_CLI=:ID_CLI'
      'SELECT  [ID_RRO_KASSA]'
      '      ,[ID_TT]'
      '      ,[ID_CLI]'
      '      ,[ID_NUM_FISCAL_KASSA]'
      '      ,[NAME_KASSA]'
      #9'  ,[CERTIFICATE]'
      #9'  ,[PRIVATE_KEY]'
      #9'  ,[PASSW]'
      #9'  ,[PATH_TO_CERTIFICATE], [PATH_TO_PRIVATE_KEY],'
      '    isnull(DATE_END_CERTIFICATE,0) as DATE_END_CERTIFICATE,'
      #9'  CL.CLIENT as TT, CL.ADRES'
      '  FROM [dbo].[RRO_KASSA_TS] RK'
      '  inner join CLIENTS CL on CL.ID_CLIENTS=RK.ID_TT'
      '  where RK.ID_CLI=@ID_CLI')
    Left = 421
    Top = 82
    object Q_RRO_KASSA_TSTT: TWideStringField
      DisplayLabel = #1058#1086#1088#1075#1086#1074#1072#1103' '#1090#1086#1095#1082#1072
      DisplayWidth = 50
      FieldName = 'TT'
      Size = 255
    end
    object Q_RRO_KASSA_TSNAME_KASSA: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1082#1072#1089#1089#1099
      DisplayWidth = 10
      FieldName = 'NAME_KASSA'
      Size = 50
    end
    object Q_RRO_KASSA_TSADRES: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'ADRES'
      Size = 255
    end
    object Q_RRO_KASSA_TSID_NUM_FISCAL_KASSA: TLargeintField
      DisplayLabel = #1060#1080#1089#1082' '#8470' '#1082#1072#1089#1089#1099
      FieldName = 'ID_NUM_FISCAL_KASSA'
    end
    object Q_RRO_KASSA_TSPASSW: TWideStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'PASSW'
      Size = 50
    end
    object Q_RRO_KASSA_TSPATH_TO_CERTIFICATE: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '
      DisplayWidth = 50
      FieldName = 'PATH_TO_CERTIFICATE'
      Size = 255
    end
    object Q_RRO_KASSA_TSPATH_TO_PRIVATE_KEY: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1082#1083#1102#1095#1072
      DisplayWidth = 50
      FieldName = 'PATH_TO_PRIVATE_KEY'
      Size = 255
    end
    object Q_RRO_KASSA_TSDATE_END_CERTIFICATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'DATE_END_CERTIFICATE'
    end
    object Q_RRO_KASSA_TSCERTIFICATE: TMemoField
      DisplayLabel = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
      FieldName = 'CERTIFICATE'
      BlobType = ftMemo
    end
    object Q_RRO_KASSA_TSPRIVATE_KEY: TMemoField
      DisplayLabel = #1050#1083#1102#1095
      FieldName = 'PRIVATE_KEY'
      BlobType = ftMemo
    end
    object Q_RRO_KASSA_TSID_RRO_KASSA: TIntegerField
      FieldName = 'ID_RRO_KASSA'
    end
    object Q_RRO_KASSA_TSID_TT: TIntegerField
      FieldName = 'ID_TT'
    end
    object Q_RRO_KASSA_TSID_CLI: TIntegerField
      FieldName = 'ID_CLI'
    end
  end
  object SP_ADD_RRO_KASSA_TS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ADD_RRO_KASSA_TS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NAME_KASSA'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_NUM_FISCAL_KASSA'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PASSW'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@PATH_TO_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@PATH_TO_PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@DATE_END_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 409
    Top = 168
  end
  object DS_Q_RRO_KASSA_TS: TDataSource
    DataSet = Q_RRO_KASSA_TS
    Left = 536
    Top = 91
  end
  object SP_DELETE_RRO_CERTIFIC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_RRO_CERTIFIC;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 65
    Top = 232
  end
  object SP_EDIT_RRO_KASSA_TS: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'EDIT_RRO_KASSA_TS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_RRO_KASSA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NAME_KASSA'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_NUM_FISCAL_KASSA'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PASSW'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@PATH_TO_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@PATH_TO_PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@DATE_END_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 544
    Top = 168
  end
  object SP_ADD_RRO_OBJ_HOZ: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ADD_RRO_OBJ_HOZ;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PASSW'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@PATH_TO_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@PATH_TO_PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@DATE_END_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 65
    Top = 160
  end
  object SP_EDIT_RRO_OBJ_HOZ: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'EDIT_RRO_OBJ_HOZ;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@PASSW'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@PATH_TO_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@PATH_TO_PRIVATE_KEY'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@DATE_END_CERTIFICATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 160
  end
end
