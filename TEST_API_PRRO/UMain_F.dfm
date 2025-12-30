object F_Main: TF_Main
  Left = 0
  Top = 0
  Caption = 'F_Main'
  ClientHeight = 464
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 232
    Top = 8
    Width = 241
    Height = 201
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object BBOpenShift: TBitBtn
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'BBOpenShift'
    TabOrder = 1
    OnClick = BBOpenShiftClick
  end
  object BBCloseShift: TBitBtn
    Left = 8
    Top = 48
    Width = 97
    Height = 25
    Caption = 'BBCloseShift'
    TabOrder = 2
    OnClick = BBCloseShiftClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 88
    Width = 97
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BBValidCard: TBitBtn
    Left = 56
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Validation Card'
    TabOrder = 4
    OnClick = BBValidCardClick
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    RedirectMaximum = 150
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
    Left = 245
    Top = 99
  end
  object Q_RRO_CERTIFIC: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT RC.[ID_CLI]'
      '      ,RC.[CERTIFICATE]'
      '      ,RC.[PRIVATE_KEY]'
      '      ,RC.[PASSW]'
      #9'  ,CL.INN'
      ''
      '  FROM [dbo].[RRO_CERTIFIC] RC'
      '  inner join CLIENTS CL on CL.ID_CLIENTS=RC.ID_CLI'
      '  where RC.[ID_CLI]=:ID_CLI'
      ''
      '')
    Left = 373
    Top = 83
  end
  object ADOConnection1: TADOConnection
    CommandTimeout = 300
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_TP;Data Source=C-17\MSSQLSRV17;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=C-17;Use Encryption for Data=False;Tag with colu' +
      'mn collation when possible=False'
    ConnectionTimeout = 3600
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 216
    Top = 24
  end
  object Q_RRO_KASSA_TS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_RRO_KASSA'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  RK.[ID_RRO_KASSA]'
      '      ,RK.[ID_TT]'
      '      ,RK.[ID_CLI]'
      '      ,RK.[ID_NUM_FISCAL_KASSA]'
      '      ,RK.[NAME_KASSA]'
      '  FROM [dbo].[RRO_KASSA_TS] RK'
      ' where  RK.[ID_RRO_KASSA]=:ID_RRO_KASSA'
      '')
    Left = 365
    Top = 155
  end
  object QNC: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from NAKLCAP where ID_NAKLCAP=:ID_NAKLCAP'
      ' ')
    Left = 86
    Top = 128
    object QNCID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object QNCID_USER: TIntegerField
      FieldName = 'ID_USER'
      ReadOnly = True
      Visible = False
    end
    object QNCID_TOV: TIntegerField
      FieldName = 'ID_TOV'
      ReadOnly = True
      Visible = False
    end
    object QNCNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUMB'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QNCEXCISE_BAR_CODE: TWideStringField
      DisplayLabel = #1064#1090#1088'-'#1082#1086#1076' '#1072#1082#1094#1080#1079#1085#1086#1081' '#1084#1072#1088#1082#1080
      DisplayWidth = 10
      FieldName = 'EXCISE_BAR_CODE'
      Size = 30
    end
    object QNCD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
      ReadOnly = True
    end
  end
  object QNT: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from NAKLTOV where ID_NAKLCAP=:ID_NAKLCAP')
    Left = 142
    Top = 128
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_USER'
      ReadOnly = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_TOV'
      ReadOnly = True
      Visible = False
    end
    object FloatField1: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUMB'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1064#1090#1088'-'#1082#1086#1076' '#1072#1082#1094#1080#1079#1085#1086#1081' '#1084#1072#1088#1082#1080
      DisplayWidth = 10
      FieldName = 'EXCISE_BAR_CODE'
      Size = 30
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
      ReadOnly = True
    end
  end
end
