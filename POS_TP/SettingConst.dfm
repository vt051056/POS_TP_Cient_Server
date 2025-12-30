object FSettingConst: TFSettingConst
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 541
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 900
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 296
      Top = 11
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 900
    Height = 500
    Align = alClient
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 898
      Height = 468
      Align = alClient
      TabOrder = 0
      object Notebook1: TNotebook
        Left = 1
        Top = 1
        Width = 896
        Height = 466
        Align = alClient
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'CONST_VALUES'
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 896
            Height = 466
            Align = alClient
            TabOrder = 0
            object Panel3: TPanel
              Left = 571
              Top = 1
              Width = 324
              Height = 464
              Align = alClient
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 1
                Top = 73
                Width = 322
                Height = 390
                Align = alClient
                DataSource = DS_Q_PrinterSetup
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
              object Panel5: TPanel
                Left = 1
                Top = 1
                Width = 322
                Height = 72
                Align = alTop
                TabOrder = 1
                object Label1: TLabel
                  Left = 17
                  Top = 36
                  Width = 128
                  Height = 13
                  Caption = #1048#1084#1077#1085#1072' '#1085#1077#1092#1080#1089#1082' '#1087#1088#1080#1085#1090#1077#1088#1086#1074
                end
                object Label2: TLabel
                  Left = 17
                  Top = 54
                  Width = 88
                  Height = 13
                  Caption = 'XP-58 '#1080#1083#1080' POS-58'
                end
                object BBDeletePrinter: TBitBtn
                  Left = 256
                  Top = 5
                  Width = 27
                  Height = 25
                  Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1085#1090#1077#1088
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
                  TabOrder = 0
                  OnClick = BBDeletePrinterClick
                end
                object BBAddPrinter: TBitBtn
                  Left = 221
                  Top = 5
                  Width = 27
                  Height = 25
                  Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1085#1090#1077#1088' (Alt - '#1076#1086#1073#1072#1074#1080#1090#1100' '#1092#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088')'
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
                  TabOrder = 1
                  OnClick = BBAddPrinterClick
                  OnMouseDown = BBAddPrinterMouseDown
                end
                object DBNavigator2: TDBNavigator
                  Left = 6
                  Top = 5
                  Width = 210
                  Height = 25
                  DataSource = DS_Q_PrinterSetup
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
                  TabOrder = 2
                end
              end
            end
            object Panel4: TPanel
              Left = 1
              Top = 1
              Width = 570
              Height = 464
              Align = alLeft
              TabOrder = 1
              object DBGrid1: TDBGrid
                Left = 1
                Top = 26
                Width = 568
                Height = 437
                Align = alClient
                DataSource = DS_CONST_VALUES
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
              object DBNavigator1: TDBNavigator
                Left = 1
                Top = 1
                Width = 568
                Height = 25
                DataSource = DS_CONST_VALUES
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
                Align = alTop
                TabOrder = 1
              end
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'SET_INTERFACE'
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 896
            Height = 466
            Align = alClient
            TabOrder = 0
            object Panel10: TPanel
              Left = 1
              Top = 1
              Width = 894
              Height = 96
              Align = alTop
              TabOrder = 0
              object Label4: TLabel
                Left = 592
                Top = 3
                Width = 220
                Height = 13
                Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
              end
              object DBNavigator3: TDBNavigator
                Left = 31
                Top = 13
                Width = 231
                Height = 25
                DataSource = DS_Set_Interface
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
                TabOrder = 0
              end
              object GroupBox1: TGroupBox
                Left = 280
                Top = 3
                Width = 290
                Height = 52
                Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' '#1085#1072' '#1073#1072#1079#1077' '#1091#1084#1086#1083#1095#1072#1085#1080#1103
                TabOrder = 1
                object Label3: TLabel
                  Left = 91
                  Top = 22
                  Width = 77
                  Height = 13
                  Caption = #8470' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072
                end
                object E_ID_INTERFACE: TEdit
                  Left = 174
                  Top = 18
                  Width = 56
                  Height = 21
                  TabOrder = 0
                  Text = '1'
                end
                object BitBtn2: TBitBtn
                  Left = 10
                  Top = 19
                  Width = 75
                  Height = 25
                  Caption = #1057#1086#1079#1076#1072#1090#1100
                  TabOrder = 1
                  OnClick = BitBtn2Click
                end
              end
              object DBGrid4: TDBGrid
                Left = 592
                Top = 18
                Width = 147
                Height = 74
                DataSource = DS_Q_Interface_list
                Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleHotTrack]
                ReadOnly = True
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
            end
            object DBGrid3: TDBGrid
              Left = 1
              Top = 97
              Width = 894
              Height = 368
              Align = alClient
              DataSource = DS_Set_Interface
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'SET_RRO'
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 896
            Height = 466
            Align = alClient
            TabOrder = 0
            object Panel12: TPanel
              Left = 1
              Top = 1
              Width = 430
              Height = 464
              Align = alLeft
              TabOrder = 0
              object Panel13: TPanel
                Left = 1
                Top = 1
                Width = 428
                Height = 66
                Align = alTop
                TabOrder = 0
                object Label5: TLabel
                  Left = 15
                  Top = 8
                  Width = 211
                  Height = 13
                  Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1085#1099#1077' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081
                end
                object DBNavigator4: TDBNavigator
                  Left = 15
                  Top = 27
                  Width = 152
                  Height = 25
                  DataSource = DS_QFOP
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                  TabOrder = 0
                end
                object BBLoadCertif_kass: TBitBtn
                  Left = 192
                  Top = 27
                  Width = 217
                  Height = 25
                  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1086#1074' '#1080' '#1082#1072#1089#1089
                  TabOrder = 1
                  OnClick = BBLoadCertif_kassClick
                end
              end
              object DBGrid5: TDBGrid
                Left = 1
                Top = 67
                Width = 428
                Height = 396
                Align = alClient
                DataSource = DS_QFOP
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
            end
            object Panel14: TPanel
              Left = 431
              Top = 1
              Width = 464
              Height = 464
              Align = alClient
              TabOrder = 1
              object Panel15: TPanel
                Left = 1
                Top = 1
                Width = 462
                Height = 312
                Align = alTop
                TabOrder = 0
                object Label6: TLabel
                  Left = 16
                  Top = 284
                  Width = 101
                  Height = 13
                  Caption = #1050#1072#1089#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081
                end
                object Label7: TLabel
                  Left = 16
                  Top = 237
                  Width = 86
                  Height = 13
                  Caption = 'URL '#1056#1056#1054' '#1089#1077#1088#1074#1077#1088#1072
                end
                object Panel_Alco_Kassa: TPanel
                  Left = 4
                  Top = 120
                  Width = 444
                  Height = 111
                  TabOrder = 4
                  Visible = False
                  object BBSetRROWorkPlace_Alcogol: TBitBtn
                    Left = 8
                    Top = 6
                    Width = 265
                    Height = 25
                    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1089#1089#1091' '#1072#1083#1082#1086#1075#1086#1083#1103' '#1085#1072' '#1088#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086
                    TabOrder = 0
                    OnClick = BBSetRROWorkPlace_AlcogolClick
                  end
                  object GroupBox3: TGroupBox
                    Left = 8
                    Top = 35
                    Width = 425
                    Height = 64
                    Caption = #1047#1072#1082#1088#1077#1087#1083#1077#1085#1085#1072#1103' '#1082#1072#1089#1089#1072' '#1072#1083#1082#1086#1075#1086#1083#1103' '#1079#1072' '#1101#1090#1080#1084' '#1088#1072#1073#1086#1095#1080#1084' '#1084#1077#1089#1090#1086#1084
                    TabOrder = 1
                    object L_CLI_Place_Alcogol: TLabel
                      Left = 16
                      Top = 24
                      Width = 58
                      Height = 13
                      Caption = 'L_CLI_Place'
                    end
                    object L_Kassa_Place_Alcogol: TLabel
                      Left = 16
                      Top = 43
                      Width = 70
                      Height = 13
                      Caption = 'L_Kassa_Place'
                    end
                  end
                end
                object DBNavigator5: TDBNavigator
                  Left = 144
                  Top = 279
                  Width = 112
                  Height = 25
                  DataSource = DS_Q_RRO_KASSA_TS
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                  TabOrder = 0
                end
                object BBSetRROWorkPlace: TBitBtn
                  Left = 16
                  Top = 13
                  Width = 201
                  Height = 25
                  Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1089#1089#1091' '#1085#1072' '#1088#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086
                  TabOrder = 1
                  OnClick = BBSetRROWorkPlaceClick
                end
                object GroupBox2: TGroupBox
                  Left = 16
                  Top = 53
                  Width = 425
                  Height = 103
                  Caption = #1047#1072#1082#1088#1077#1087#1083#1077#1085#1085#1072#1103' '#1082#1072#1089#1089#1072' '#1079#1072' '#1101#1090#1080#1084' '#1088#1072#1073#1086#1095#1080#1084' '#1084#1077#1089#1090#1086#1084
                  TabOrder = 2
                  object L_CLI_Place: TLabel
                    Left = 16
                    Top = 24
                    Width = 58
                    Height = 13
                    Caption = 'L_CLI_Place'
                  end
                  object L_Kassa_Place: TLabel
                    Left = 16
                    Top = 43
                    Width = 70
                    Height = 13
                    Caption = 'L_Kassa_Place'
                  end
                  object L_Use_Certificate: TLabel
                    Left = 16
                    Top = 64
                    Width = 85
                    Height = 13
                    Caption = 'L_Use_Certificate'
                  end
                  object L_DATE_END_CERTIFICATE: TLabel
                    Left = 16
                    Top = 83
                    Width = 135
                    Height = 13
                    Caption = 'L_DATE_END_CERTIFICATE'
                  end
                end
                object E_URL_RRO_Server: TEdit
                  Left = 16
                  Top = 255
                  Width = 425
                  Height = 21
                  TabOrder = 3
                  Text = 'E_URL_RRO_Server'
                end
                object CB_IS_EXIST_ALCO_KASSA: TCheckBox
                  Left = 263
                  Top = 39
                  Width = 162
                  Height = 17
                  Caption = #1045#1089#1090#1100' '#1072#1083#1082#1086#1075#1086#1083#1100#1085#1072#1103' '#1082#1072#1089#1089#1072
                  TabOrder = 5
                  Visible = False
                  OnClick = CB_IS_EXIST_ALCO_KASSAClick
                end
                object BBSaveSet: TBitBtn
                  Left = 280
                  Top = 279
                  Width = 161
                  Height = 25
                  Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1072#1089#1089
                  TabOrder = 6
                  OnClick = BBSaveSetClick
                end
                object RG_USE_CERTIFIKATE: TRadioGroup
                  Left = 240
                  Top = 2
                  Width = 201
                  Height = 33
                  Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090':'
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
                    #1050#1072#1089#1089#1099)
                  TabOrder = 7
                end
              end
              object DBGrid6: TDBGrid
                Left = 1
                Top = 313
                Width = 462
                Height = 150
                Align = alClient
                DataSource = DS_Q_RRO_KASSA_TS
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
            end
          end
        end
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 469
      Width = 898
      Height = 30
      Align = alBottom
      TabOrder = 1
      object TabSet1: TTabSet
        Left = 1
        Top = 1
        Width = 896
        Height = 25
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Tabs.Strings = (
          #1050#1086#1085#1089#1090#1072#1085#1090#1099
          #1048#1085#1090#1077#1088#1092#1077#1081#1089
          #1056#1056#1054' '#1085#1072#1089#1090#1088#1086#1081#1082#1080)
        TabIndex = 0
        OnChange = TabSet1Change
      end
    end
  end
  object ADS_CONST_VALUES: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select [ID_CONST], [CONST_NAME], [CONST_VALUE], [COMMENT] from [' +
      'dbo].[CONST_VALUES] order by [ID_CONST]'
    Parameters = <>
    Left = 256
    Top = 104
    object ADS_CONST_VALUESCONST_NAME: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
      DisplayWidth = 30
      FieldName = 'CONST_NAME'
      Size = 50
    end
    object ADS_CONST_VALUESCONST_VALUE: TWideStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
      DisplayWidth = 30
      FieldName = 'CONST_VALUE'
      Size = 255
    end
    object ADS_CONST_VALUESCOMMENT: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
      DisplayWidth = 50
      FieldName = 'COMMENT'
      Size = 255
    end
    object ADS_CONST_VALUESID_CONST: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_CONST'
      ReadOnly = True
    end
  end
  object DS_CONST_VALUES: TDataSource
    DataSet = ADS_CONST_VALUES
    Left = 368
    Top = 104
  end
  object PrintDialog1: TPrintDialog
    Left = 488
  end
  object ADOCommandInsert_Printer_Setup: TADOCommand
    CommandText = 
      'insert into [dbo].[PRINTER_SETUP]([PRINTER_NAME], [PRINTER_INDEX' +
      '])'#13#10'values (:PRINTER_NAME, :PRINTER_INDEX)'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'PRINTER_NAME'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'PRINTER_INDEX'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 8
  end
  object Q_PrinterSetup: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select [ID], [PRINTER_NAME], [PRINTER_INDEX], [IS_FISCAL] from [' +
        'dbo].[PRINTER_SETUP]')
    Left = 484
    Top = 194
    object Q_PrinterSetupID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object Q_PrinterSetupPRINTER_NAME: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1087#1088#1080#1085#1090#1077#1088#1072
      DisplayWidth = 20
      FieldName = 'PRINTER_NAME'
      Size = 100
    end
    object Q_PrinterSetupPRINTER_INDEX: TIntegerField
      DisplayLabel = #1048#1085#1076#1077#1082#1089' '#1087#1088#1080#1085#1090#1077#1088#1072
      FieldName = 'PRINTER_INDEX'
    end
    object Q_PrinterSetupIS_FISCAL: TIntegerField
      FieldName = 'IS_FISCAL'
      Visible = False
      MaxValue = 1
    end
    object Q_PrinterSetupis_fiscal_str: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'is_fiscal_str'
      LookupDataSet = QPRINTER_TYPES
      LookupKeyFields = 'ID'
      LookupResultField = 'TYPE_PRINTER'
      KeyFields = 'IS_FISCAL'
      Lookup = True
    end
  end
  object DS_Q_PrinterSetup: TDataSource
    DataSet = Q_PrinterSetup
    Left = 732
    Top = 186
  end
  object QPRINTER_TYPES: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select [ID], [TYPE_PRINTER] from [dbo].PRINTER_TYPES')
    Left = 580
    Top = 226
  end
  object DSQPRINTER_TYPES: TDataSource
    DataSet = QPRINTER_TYPES
    Left = 620
    Top = 226
  end
  object ADOCommandDelete_Printer_Setup: TADOCommand
    CommandText = 'delete [dbo].[PRINTER_SETUP] where ID=:ID'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 8
  end
  object ADOCommandInsert_SET_INERFACE: TADOCommand
    CommandText = 
      'declare @ID_INTERFACE int'#13#10'set @ID_INTERFACE=:ID_INTERFACE'#13#10'dele' +
      'te [dbo].[SET_INTERFACE] where [ID_INTERFACE]=@ID_INTERFACE'#13#10'ins' +
      'ert into [dbo].[SET_INTERFACE] ( [NAME_ACTION], [CAPTION], [VISI' +
      'BLE],  [ID_INTERFACE])'#13#10'values(:NAME_ACTION, :CAPTION, :VISIBLE,' +
      '  @ID_INTERFACE)'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_INTERFACE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NAME_ACTION'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'CAPTION'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'VISIBLE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 264
  end
  object ADS_Set_Interface: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT  [ID_SET_INTERFACE]'#13#10'      ,[NAME_ACTION]'#13#10'      ,[CAPTIO' +
      'N]'#13#10'      ,[VISIBLE]'#13#10'      ,[ID_INTERFACE]'#13#10'  FROM [SET_INTERFA' +
      'CE]'#13#10'  where [ID_INTERFACE]=:ID_INTERFACE'
    Parameters = <
      item
        Name = 'ID_INTERFACE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 192
    object ADS_Set_InterfaceID_SET_INTERFACE: TAutoIncField
      FieldName = 'ID_SET_INTERFACE'
      ReadOnly = True
    end
    object ADS_Set_InterfaceNAME_ACTION: TWideStringField
      DisplayWidth = 30
      FieldName = 'NAME_ACTION'
      Size = 255
    end
    object ADS_Set_InterfaceCAPTION: TWideStringField
      DisplayWidth = 50
      FieldName = 'CAPTION'
      Size = 255
    end
    object ADS_Set_InterfaceVISIBLE: TIntegerField
      FieldName = 'VISIBLE'
    end
    object ADS_Set_InterfaceID_INTERFACE: TIntegerField
      FieldName = 'ID_INTERFACE'
    end
  end
  object DS_Set_Interface: TDataSource
    DataSet = ADS_Set_Interface
    Left = 330
    Top = 187
  end
  object Q_Interface_list: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_Interface_listAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select ID_INTERFACE from [dbo].[SET_INTERFACE]'
      'group by ID_INTERFACE'
      '')
    Left = 548
    Top = 290
  end
  object DS_Q_Interface_list: TDataSource
    DataSet = Q_Interface_list
    Left = 628
    Top = 290
  end
  object Q_RRO_CERTIFIC: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'USE_CERTIFIKATE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ' --use NMK_TP'
      'declare @ID_ int, @USE_CERTIFIKATE int'
      'set @USE_CERTIFIKATE=:USE_CERTIFIKATE'
      'set @ID_=:ID_'
      'if @USE_CERTIFIKATE=0'
      'begin'
      #9'SELECT RC.[ID_CLI]'
      #9#9'  ,RC.[CERTIFICATE]'
      #9#9'  ,RC.[PRIVATE_KEY]'
      #9#9'  ,RC.[PASSW]'
      #9#9'  ,RC.[DATE_END_CERTIFICATE]'
      #9#9'  ,CL.CLIENT'
      #9'  FROM [dbo].[RRO_CERTIFIC] RC'
      #9'  inner join CLIENTS CL on CL.ID_CLIENTS=RC.[ID_CLI]'
      #9'  where RC.[ID_CLI]=@ID_'
      'end'
      'else'
      'begin'
      #9'SELECT RK.[ID_CLI]'
      #9#9'  ,RK.[CERTIFICATE]'
      #9#9'  ,RK.[PRIVATE_KEY]'
      #9#9'  ,RK.[PASSW]'
      #9#9'  ,RK.[DATE_END_CERTIFICATE]'
      #9#9'  ,CL.CLIENT'
      #9'  FROM [dbo].[RRO_KASSA_TS] RK'
      #9'  inner join CLIENTS CL on CL.ID_CLIENTS=RK.[ID_CLI]'
      #9'  where RK.[ID_RRO_KASSA]=@ID_'
      'end')
    Left = 124
    Top = 354
  end
  object Q_RRO_KASSA_TS: TADOQuery
    Connection = DM1.ADOConnection1
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
      'SELECT  RK.[ID_RRO_KASSA]'
      '      ,RK.[ID_TT]'
      '      ,RK.[ID_CLI]'
      '      ,RK.[ID_NUM_FISCAL_KASSA]'
      '      ,RK.[NAME_KASSA]'
      #9'  ,RK.[PASSW]'
      #9'  ,RK.[DATE_END_CERTIFICATE]'
      #9'  ,CL.CLIENT'
      '  FROM [dbo].[RRO_KASSA_TS] RK'
      ' inner join CLIENTS CL on CL.ID_CLIENTS=RK.[ID_CLI]'
      ' where  RK.[ID_CLI]=:ID_CLI'
      '')
    Left = 188
    Top = 402
    object Q_RRO_KASSA_TSNAME_KASSA: TWideStringField
      DisplayLabel = #1050#1072#1089#1089#1072
      FieldName = 'NAME_KASSA'
      Size = 50
    end
    object Q_RRO_KASSA_TSID_NUM_FISCAL_KASSA: TLargeintField
      DisplayLabel = #1060#1080#1089#1082' '#8470' '#1082#1072#1089#1089#1099
      FieldName = 'ID_NUM_FISCAL_KASSA'
    end
    object Q_RRO_KASSA_TSPASSW: TWideStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100' '#1085#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1082#1072#1089#1089#1099
      DisplayWidth = 10
      FieldName = 'PASSW'
      Size = 50
    end
    object Q_RRO_KASSA_TSDATE_END_CERTIFICATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '#1082#1072#1089#1089#1099
      FieldName = 'DATE_END_CERTIFICATE'
    end
    object Q_RRO_KASSA_TSCLIENT: TWideStringField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 50
      FieldName = 'CLIENT'
      Size = 255
    end
    object Q_RRO_KASSA_TSID_RRO_KASSA: TAutoIncField
      FieldName = 'ID_RRO_KASSA'
      ReadOnly = True
      Visible = False
    end
    object Q_RRO_KASSA_TSID_TT: TIntegerField
      FieldName = 'ID_TT'
      Visible = False
    end
    object Q_RRO_KASSA_TSID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Visible = False
    end
  end
  object DS_Q_RRO_KASSA_TS: TDataSource
    DataSet = Q_RRO_KASSA_TS
    Left = 276
    Top = 402
  end
  object QFOP: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = QFOPAfterScroll
    Parameters = <
      item
        Name = 'ID_TT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--  use NMK_TP'
      'declare @ID_TT int'
      'set @ID_TT=:ID_TT'
      
        'SELECT RK.[ID_TT], RC.[ID_CLI], CL.CLIENT, RC.[PASSW], RC.[DATE_' +
        'END_CERTIFICATE]'
      '  FROM [RRO_CERTIFIC] RC'
      '  inner join [RRO_KASSA_TS] RK on RK.ID_CLI=RC.[ID_CLI]'
      '  inner join CLIENTS CL on CL.ID_CLIENTS=RC.[ID_CLI]'
      'where RK.[ID_TT]=@ID_TT'
      
        'GROUP BY  RK.[ID_TT],RC.[ID_CLI], CL.CLIENT, RC.[PASSW], RC.[DAT' +
        'E_END_CERTIFICATE]'
      'ORDER BY  CL.CLIENT'
      '')
    Left = 52
    Top = 194
    object QFOPCLIENT: TWideStringField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 30
      FieldName = 'CLIENT'
      Size = 255
    end
    object QFOPID_TT: TIntegerField
      DisplayLabel = 'ID '#1090#1086#1088#1075'.'#1090#1086#1095#1082#1080
      FieldName = 'ID_TT'
    end
    object QFOPID_CLI: TIntegerField
      DisplayLabel = 'ID '#1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      FieldName = 'ID_CLI'
    end
    object QFOPPASSW: TWideStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100' '#1082' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1091
      DisplayWidth = 10
      FieldName = 'PASSW'
      Size = 50
    end
    object QFOPDATE_END_CERTIFICATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
      FieldName = 'DATE_END_CERTIFICATE'
    end
  end
  object DS_QFOP: TDataSource
    DataSet = QFOP
    Left = 140
    Top = 194
  end
end
