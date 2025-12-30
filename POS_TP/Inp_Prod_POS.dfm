object F_Inp_Prod_POS: TF_Inp_Prod_POS
  Left = 330
  Top = 125
  Caption = #1047#1072#1087#1091#1089#1082' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1074' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
  ClientHeight = 471
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 155
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 166
      Top = 93
      Width = 129
      Height = 13
      Caption = #1047#1072#1087#1091#1089#1082#1072#1077#1084#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object DBText1: TDBText
      Left = 206
      Top = 25
      Width = 467
      Height = 17
      DataField = 'NAME'
      DataSource = DS_Q_PRODUCT_POS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 206
      Top = 6
      Width = 124
      Height = 13
      Caption = #1047#1072#1087#1091#1089#1082#1072#1077#1084#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
    end
    object DBText2: TDBText
      Left = 305
      Top = 117
      Width = 25
      Height = 17
      DataField = 'EDIZM'
      DataSource = DS_Q_PRODUCT_POS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox3: TGroupBox
      Left = 10
      Top = 3
      Width = 190
      Height = 85
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1072#1087#1091#1089#1082#1072
      TabOrder = 0
      object Label5: TLabel
        Left = 4
        Top = 19
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object Label2: TLabel
        Left = 4
        Top = 53
        Width = 33
        Height = 13
        Caption = #1042#1088#1077#1084#1103
      end
      object DTPProvodDay: TDateTimePicker
        Left = 42
        Top = 15
        Width = 145
        Height = 28
        Date = 38143.000011574070000000
        Time = 38143.000011574070000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DTPProvodDayChange
        OnExit = DTPProvodDayExit
      end
      object DTPProvodTime: TDateTimePicker
        Left = 42
        Top = 51
        Width = 145
        Height = 28
        Date = 38748.208333333340000000
        Time = 38748.208333333340000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 1
        OnChange = DTPProvodTimeChange
        OnExit = DTPProvodTimeExit
      end
    end
    object BitBtn1: TBitBtn
      Left = 350
      Top = 94
      Width = 75
      Height = 55
      Caption = #1043#1086#1090#1086#1074#1086
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 558
      Top = 93
      Width = 75
      Height = 55
      Caption = #1057#1073#1088#1086#1089
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 206
      Top = 43
      Width = 248
      Height = 44
      DataSource = DS_Q_PRODUCT_POS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 166
      Top = 108
      Width = 133
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'Edit1'
    end
    object BitBtn3: TBitBtn
      Left = 480
      Top = 43
      Width = 153
      Height = 44
      Caption = #1079#1072#1087#1091#1089#1082'='#1087#1088#1086#1076#1072#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 93
      Width = 143
      Height = 56
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 6
      object Edit2: TEdit
        Left = 8
        Top = 15
        Width = 129
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Edit2Change
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 155
    Width = 778
    Height = 316
    Align = alClient
    TabOrder = 1
    ExplicitTop = 146
    ExplicitWidth = 445
    ExplicitHeight = 325
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 776
      Height = 314
      Align = alClient
      DataSource = DS_Q_PRODUCT_POS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = DBGrid1DrawDataCell
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
  end
  object Q_PRODUCT_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D_From'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_To'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      'declare @D_From datetime, @D_To datetime'
      '--set @D_From='#39'01.07.2021'#39
      '--set @D_To='#39'01.07.2021 23:59:59'#39
      'set @D_From=:D_From'
      'set @D_To=:D_To'
      ''
      'select P.[ID_PROD], P.[ID_TOV],  G.GRUPTOV, T.NAME,  T.EDIZM, ('
      'select isnull(SUM(NT.[NUMB]),0.0) from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200'
      'and NT.ID_TOV=P.[ID_TOV]'
      ') as N_PRODANO'
      'from [dbo].[PRODUCT_POS] P'
      'inner join TOV T on T.ID_TOV=P.ID_TOV'
      'inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      'order by G.GRUPTOV, T.NAME')
    Left = 376
    Top = 208
    object Q_PRODUCT_POSID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074
      FieldName = 'ID_TOV'
    end
    object Q_PRODUCT_POSNAME: TWideStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 255
    end
    object Q_PRODUCT_POSEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object Q_PRODUCT_POSN_PRODANO: TFloatField
      DisplayLabel = #1055#1088#1086#1076#1072#1085#1086
      FieldName = 'N_PRODANO'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object Q_PRODUCT_POSID_PROD: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1088#1086#1076
      FieldName = 'ID_PROD'
    end
    object Q_PRODUCT_POSGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
  end
  object DS_Q_PRODUCT_POS: TDataSource
    DataSet = Q_PRODUCT_POS
    Left = 216
    Top = 200
  end
end
