object F_main: TF_main
  Left = 55
  Top = 62
  Caption = 'POS '#1053#1052#1050
  ClientHeight = 542
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 523
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 303
      Top = 1
      Width = 588
      Height = 521
      Align = alClient
      TabOrder = 1
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 586
        Height = 519
        Align = alClient
        TabOrder = 0
        object Notebook1: TNotebook
          Left = 1
          Top = 1
          Width = 584
          Height = 496
          Align = alClient
          PageIndex = 1
          TabOrder = 0
          object TPage
            Left = 0
            Top = 0
            Caption = 'OperVendor'
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 584
              Height = 496
              Align = alClient
              TabOrder = 0
              object GB_Oper_Vendor: TGroupBox
                Left = 1
                Top = 1
                Width = 582
                Height = 494
                Align = alClient
                Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084#1080
                TabOrder = 0
                object BitBtn6: TBitBtn
                  Left = 150
                  Top = 95
                  Width = 136
                  Height = 34
                  Action = ActionPrihodTNP
                  Caption = #1055#1088#1080#1093#1086#1076' '#1058#1053#1055
                  TabOrder = 0
                end
                object BitBtn5: TBitBtn
                  Left = 8
                  Top = 95
                  Width = 136
                  Height = 34
                  Action = ActionOrdersTNP
                  Caption = #1047#1072#1082#1072#1079#1099' '#1058#1053#1055
                  TabOrder = 1
                end
                object BitBtn7: TBitBtn
                  Left = 292
                  Top = 95
                  Width = 136
                  Height = 34
                  Action = ActionVozvratTNP
                  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1058#1053#1055
                  TabOrder = 2
                end
                object BitBtn9: TBitBtn
                  Left = 8
                  Top = 22
                  Width = 136
                  Height = 34
                  Action = ActionOrdersKolbasa
                  Caption = #1047#1072#1082#1072#1079#1099' '#1082#1086#1083#1073#1072#1089#1099
                  TabOrder = 3
                end
                object BitBtn10: TBitBtn
                  Left = 8
                  Top = 58
                  Width = 136
                  Height = 34
                  Action = ActionOrdersMyaso
                  Caption = #1047#1072#1082#1072#1079#1099' '#1084#1103#1089#1072
                  TabOrder = 4
                end
                object BitBtn11: TBitBtn
                  Left = 292
                  Top = 58
                  Width = 136
                  Height = 34
                  Action = ActionVozvratMyaso
                  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
                  TabOrder = 5
                end
                object BitBtn12: TBitBtn
                  Left = 292
                  Top = 22
                  Width = 136
                  Height = 34
                  Action = ActionVozvratKolbasa
                  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
                  TabOrder = 6
                end
                object BitBtn13: TBitBtn
                  Left = 434
                  Top = 58
                  Width = 136
                  Height = 34
                  Action = ActionVerevki
                  Caption = #1042#1077#1088#1077#1074#1082#1080
                  TabOrder = 7
                end
                object BitBtn14: TBitBtn
                  Left = 435
                  Top = 22
                  Width = 136
                  Height = 34
                  Action = ActionObrezi
                  Caption = #1054#1073#1088#1077#1079#1080
                  TabOrder = 8
                end
                object BitBtn17: TBitBtn
                  Left = 150
                  Top = 22
                  Width = 136
                  Height = 34
                  Action = ActionPrihodKolbasa
                  Caption = #1055#1088#1080#1093#1086#1076' '#1082#1086#1083#1073#1072#1089#1099
                  TabOrder = 9
                end
                object BitBtn18: TBitBtn
                  Left = 150
                  Top = 58
                  Width = 136
                  Height = 34
                  Action = ActionPrihidMyaso
                  Caption = #1055#1088#1080#1093#1086#1076' '#1084#1103#1089#1072
                  TabOrder = 10
                end
                object BitBtn19: TBitBtn
                  Left = 8
                  Top = 132
                  Width = 136
                  Height = 34
                  Action = ActionOrdersTara
                  Caption = #1047#1072#1082#1072#1079#1099' '#1090#1072#1088#1099' '#1087#1083
                  TabOrder = 11
                end
                object BitBtn20: TBitBtn
                  Left = 150
                  Top = 132
                  Width = 136
                  Height = 34
                  Action = ActionPrihodTara
                  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1088#1099' '#1087#1083
                  TabOrder = 12
                end
                object BitBtn21: TBitBtn
                  Left = 292
                  Top = 132
                  Width = 136
                  Height = 34
                  Action = ActionVozvratTara
                  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1072#1088#1099' '#1087#1083
                  TabOrder = 13
                end
                object BitBtn22: TBitBtn
                  Left = 8
                  Top = 169
                  Width = 136
                  Height = 34
                  Action = ActionOrdersTov
                  Caption = #1047#1072#1082#1072#1079#1099' '#1090#1086#1074#1072#1088#1086#1074
                  TabOrder = 14
                end
                object BitBtn23: TBitBtn
                  Left = 150
                  Top = 169
                  Width = 136
                  Height = 34
                  Action = ActionPrihodTov
                  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1086#1074
                  TabOrder = 15
                end
                object BitBtn24: TBitBtn
                  Left = 292
                  Top = 169
                  Width = 136
                  Height = 34
                  Action = ActionVozvratTov
                  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074
                  TabOrder = 16
                end
                object BitBtn28: TBitBtn
                  Left = 8
                  Top = 206
                  Width = 136
                  Height = 34
                  Action = ActionOrdersOvochi
                  Caption = #1047#1072#1082#1072#1079#1099' '#1086#1074#1086#1097#1077#1081
                  TabOrder = 17
                end
                object BitBtn29: TBitBtn
                  Left = 150
                  Top = 206
                  Width = 136
                  Height = 34
                  Action = ActionPrihodOvochi
                  Caption = #1055#1088#1080#1093#1086#1076' '#1086#1074#1086#1097#1077#1081
                  TabOrder = 18
                end
                object BitBtn30: TBitBtn
                  Left = 292
                  Top = 206
                  Width = 136
                  Height = 34
                  Action = ActionSpisanieOvochi
                  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081
                  TabOrder = 19
                end
                object BitBtn31: TBitBtn
                  Left = 434
                  Top = 95
                  Width = 136
                  Height = 34
                  Action = ActionPrvo
                  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
                  TabOrder = 20
                end
                object BitBtn34: TBitBtn
                  Left = 434
                  Top = 132
                  Width = 136
                  Height = 34
                  Action = ActionPeredachaTtToTt
                  Caption = #1056#1072#1089#1093#1086#1076' '#1085#1072' '#1090#1090
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 21
                end
                object BitBtn35: TBitBtn
                  Left = 434
                  Top = 169
                  Width = 136
                  Height = 34
                  Action = ActionPrihodTtToTt
                  Caption = #1055#1088#1080#1093#1086#1076' '#1089' '#1090#1090
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 22
                end
                object BitBtn1: TBitBtn
                  Left = 8
                  Top = 243
                  Width = 136
                  Height = 34
                  Action = ActionOrdersVozvratTNP
                  Caption = #1047#1072#1082#1072#1079' '#1074#1086#1079#1074' '#1058#1053#1055
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 23
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'OperKassa'
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 584
              Height = 496
              Align = alClient
              TabOrder = 0
              object GB_Oper_Kassa: TGroupBox
                Left = 1
                Top = 1
                Width = 582
                Height = 494
                Align = alClient
                Caption = #1050#1072#1089#1089#1086#1074#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
                TabOrder = 0
                object BBInkassacia: TBitBtn
                  Left = 147
                  Top = 392
                  Width = 129
                  Height = 33
                  Action = ActionInkassa
                  Caption = #1048#1085#1082#1072#1089#1089#1072#1094#1080#1103
                  TabOrder = 0
                end
                object BBZatraty: TBitBtn
                  Left = 3
                  Top = 392
                  Width = 138
                  Height = 33
                  Action = ActionZatraty
                  Caption = #1047#1072#1090#1088#1072#1090#1099
                  TabOrder = 1
                end
                object Panel_RRO: TPanel
                  Left = 2
                  Top = 21
                  Width = 578
                  Height = 356
                  Align = alTop
                  TabOrder = 2
                  object GB_Alco_Kassa: TGroupBox
                    Left = 280
                    Top = 1
                    Width = 297
                    Height = 354
                    Align = alRight
                    Caption = #1040#1083#1082#1086#1075#1086#1083#1100#1085#1072#1103' '#1082#1072#1089#1089#1072
                    TabOrder = 0
                    object L_NAME_KASSA_FISCAL_ALCOGOL: TLabel
                      Left = 15
                      Top = 37
                      Width = 201
                      Height = 16
                      Caption = 'L_NAME_KASSA_FISCAL_ALCOGOL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_CLI_FISCAL_ALCOGOL: TLabel
                      Left = 15
                      Top = 21
                      Width = 140
                      Height = 16
                      Caption = 'L_CLI_FISCAL_ALCOGOL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_shift_Opened_ALCOGOL: TLabel
                      Left = 15
                      Top = 58
                      Width = 88
                      Height = 16
                      Caption = 'L_shift_Opened'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_shift_user_ALCOGOL: TLabel
                      Left = 15
                      Top = 73
                      Width = 69
                      Height = 16
                      Caption = 'L_shift_user'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_DurationSmena_ALCOGOL: TLabel
                      Left = 16
                      Top = 90
                      Width = 162
                      Height = 16
                      Caption = 'L_DurationSmena_ALCOGOL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object BB_Shift_Begin_ALCOGOL: TBitBtn
                      Left = 6
                      Top = 112
                      Width = 135
                      Height = 34
                      Action = ActionStartSmeny_Alcogol
                      Caption = #1053#1072#1095#1072#1090#1100' '#1089#1084#1077#1085#1091' '#1040
                      TabOrder = 0
                    end
                    object BitBtn36: TBitBtn
                      Left = 46
                      Top = 198
                      Width = 163
                      Height = 34
                      Action = ActionStopSmeny_Alcogol
                      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1089#1084#1077#1085#1091' '#1040
                      TabOrder = 1
                    end
                    object BB_LastShiftTotals_Alcogol: TBitBtn
                      Left = 6
                      Top = 158
                      Width = 131
                      Height = 34
                      Action = ActionLastShiftTotals_Alcogol
                      Caption = #1048#1090#1086#1075#1080' '#1089#1084#1077#1085#1099' '#1040
                      TabOrder = 2
                    end
                    object BBKassaIn_Alcogol: TBitBtn
                      Left = 144
                      Top = 112
                      Width = 137
                      Height = 33
                      Action = ActionKassaIn_Alcogol
                      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1040
                      TabOrder = 3
                    end
                    object BitBtn2: TBitBtn
                      Left = 143
                      Top = 158
                      Width = 138
                      Height = 34
                      Action = ActionKassaOut_Alcogol
                      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1040
                      TabOrder = 4
                    end
                  end
                  object GB_Main_Kassa: TGroupBox
                    Left = 1
                    Top = 1
                    Width = 279
                    Height = 354
                    Align = alClient
                    Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1082#1072#1089#1089#1072
                    TabOrder = 1
                    object L_CLI_FISCAL: TLabel
                      Left = 7
                      Top = 20
                      Width = 79
                      Height = 16
                      Caption = 'L_CLI_FISCAL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_NAME_KASSA_FISCAL: TLabel
                      Left = 7
                      Top = 36
                      Width = 140
                      Height = 16
                      Caption = 'L_NAME_KASSA_FISCAL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_shift_Opened: TLabel
                      Left = 7
                      Top = 58
                      Width = 88
                      Height = 16
                      Caption = 'L_shift_Opened'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_shift_user: TLabel
                      Left = 7
                      Top = 73
                      Width = 69
                      Height = 16
                      Caption = 'L_shift_user'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object L_DurationSmena: TLabel
                      Left = 7
                      Top = 90
                      Width = 101
                      Height = 16
                      Caption = 'L_DurationSmena'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object BB_Shift_Begin: TBitBtn
                      Left = 3
                      Top = 112
                      Width = 135
                      Height = 34
                      Action = ActionStartSmeny
                      Caption = #1053#1072#1095#1072#1090#1100' '#1089#1084#1077#1085#1091
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object BB_Close_smena: TBitBtn
                      Left = 3
                      Top = 198
                      Width = 169
                      Height = 34
                      Action = ActionStopSmeny
                      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1089#1084#1077#1085#1091
                      TabOrder = 1
                    end
                    object BB_LastShiftTotals: TBitBtn
                      Left = 3
                      Top = 158
                      Width = 135
                      Height = 34
                      Action = ActionLastShiftTotals
                      Caption = #1048#1090#1086#1075#1080' '#1089#1084#1077#1085#1099
                      TabOrder = 2
                    end
                    object BBKassaIn: TBitBtn
                      Left = 144
                      Top = 112
                      Width = 129
                      Height = 34
                      Action = ActionKassaIn
                      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075
                      TabOrder = 3
                    end
                    object BBKassaOut: TBitBtn
                      Left = 144
                      Top = 158
                      Width = 129
                      Height = 34
                      Action = ActionKassaOut
                      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075
                      TabOrder = 4
                    end
                    object GroupBox8: TGroupBox
                      Left = 3
                      Top = 238
                      Width = 270
                      Height = 113
                      Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1090#1077#1088#1084#1080#1085#1072#1083#1099
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 5
                      object BBCloseDay_NotFiscal: TBitBtn
                        Left = 3
                        Top = 22
                        Width = 264
                        Height = 32
                        Hint = #1054#1087#1077#1088#1072#1094#1080#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1076#1085#1103' '#1076#1083#1103' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1075#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '
                        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100' '#1073#1072#1085#1082' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -16
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        OnClick = BBCloseDay_NotFiscalClick
                      end
                      object Memo1: TMemo
                        Left = 3
                        Top = 64
                        Width = 264
                        Height = 46
                        TabOrder = 1
                      end
                    end
                  end
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Reports'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 584
              Height = 496
              Align = alClient
              TabOrder = 0
              object GroupBox4: TGroupBox
                Left = 1
                Top = 1
                Width = 582
                Height = 494
                Align = alClient
                Caption = #1054#1090#1095#1077#1090#1099
                TabOrder = 0
                object BitBtn26: TBitBtn
                  Left = 6
                  Top = 25
                  Width = 127
                  Height = 47
                  Action = ActionTovReportProdaga
                  Caption = #1055#1088#1086#1076#1072#1078#1080
                  TabOrder = 0
                end
                object BitBtn27: TBitBtn
                  Left = 3
                  Top = 78
                  Width = 127
                  Height = 47
                  Action = ActionTovReportOborot
                  Caption = #1054#1073#1086#1088#1086#1090
                  TabOrder = 1
                end
                object BitBtn4: TBitBtn
                  Left = 136
                  Top = 26
                  Width = 138
                  Height = 46
                  Action = ActionKassaReport
                  Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
                  TabOrder = 2
                  Visible = False
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'NewPrice'
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 584
              Height = 496
              Align = alClient
              TabOrder = 0
              object GroupBox3: TGroupBox
                Left = 1
                Top = 1
                Width = 582
                Height = 494
                Align = alClient
                Caption = #1053#1086#1074#1099#1077' '#1094#1077#1085#1099' '#1085#1072' '#1090#1086#1074#1072#1088#1099
                TabOrder = 0
                object Panel1: TPanel
                  Left = 2
                  Top = 21
                  Width = 578
                  Height = 41
                  Align = alTop
                  TabOrder = 0
                  object DBNavigator1: TDBNavigator
                    Left = 8
                    Top = 10
                    Width = 136
                    Height = 25
                    DataSource = DS_QNEW_PRICE_POS
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                    TabOrder = 0
                  end
                  object BB_PrintCennik: TBitBtn
                    Left = 150
                    Top = 10
                    Width = 147
                    Height = 25
                    Hint = #1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1072' '#1090#1086#1074#1072#1088#1072' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1086#1082#1080' ( Alt - '#1074#1089#1077#1093' '#1085#1086#1074#1099#1093')'
                    Caption = #1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1086#1074
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = BB_PrintCennikClick
                    OnMouseDown = BB_PrintCennikMouseDown
                  end
                  object CB_IS_EXISTS: TCheckBox
                    Left = 303
                    Top = 18
                    Width = 97
                    Height = 17
                    Caption = #1074' '#1085#1072#1083#1080#1095#1080#1080
                    TabOrder = 2
                    OnClick = CB_IS_EXISTSClick
                  end
                end
                object DBGrid1: TDBGrid
                  Left = 2
                  Top = 62
                  Width = 578
                  Height = 430
                  Align = alClient
                  DataSource = DS_QNEW_PRICE_POS
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -16
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
            end
          end
        end
        object TabSet1: TTabSet
          Left = 1
          Top = 497
          Width = 584
          Height = 21
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Tabs.Strings = (
            #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084#1080
            #1050#1072#1089#1089#1086#1074#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
            #1054#1090#1095#1077#1090#1099
            #1053#1086#1074#1099#1077' '#1094#1077#1085#1099)
          TabIndex = 0
          OnChange = TabSet1Change
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 302
      Height = 521
      Align = alLeft
      TabOrder = 0
      object ShapePRRO: TShape
        Left = 259
        Top = 64
        Width = 26
        Height = 24
        Brush.Color = clRed
      end
      object GB_Oper_Client: TGroupBox
        Left = 8
        Top = 304
        Width = 289
        Height = 108
        Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#1084#1080
        TabOrder = 0
        object BB_Return_Tov: TBitBtn
          Left = 150
          Top = 24
          Width = 136
          Height = 34
          Action = ActionVozvr
          Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074
          TabOrder = 0
        end
        object BB_Sale: TBitBtn
          Left = 8
          Top = 24
          Width = 136
          Height = 34
          Action = ActionSale
          Caption = #1055#1088#1086#1076#1072#1078#1072
          TabOrder = 1
        end
        object BitBtn33: TBitBtn
          Left = 8
          Top = 64
          Width = 136
          Height = 34
          Action = ActionVozvrDolg
          Caption = #1042#1086#1079#1074#1088#1072#1090' '#1076#1086#1083#1075#1086#1074
          TabOrder = 2
        end
      end
      object GB_Oper_Invent: TGroupBox
        Left = 8
        Top = 416
        Width = 289
        Height = 106
        Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
        TabOrder = 1
        object BitBtn3: TBitBtn
          Left = 3
          Top = 21
          Width = 150
          Height = 36
          Action = ActionInventTS
          Caption = #1048#1085#1074#1077#1085#1090'. '#1090#1086#1074#1072#1088#1086#1074
          TabOrder = 0
        end
        object BitBtn8: TBitBtn
          Left = 159
          Top = 21
          Width = 127
          Height = 36
          Action = ActionInventKassa
          Caption = #1048#1085#1074#1077#1085#1090'. '#1082#1072#1089#1089#1099
          TabOrder = 1
        end
        object BitBtn25: TBitBtn
          Left = 3
          Top = 63
          Width = 150
          Height = 36
          Action = ActionInventVozvrTara
          Caption = #1048#1085#1074'. '#1074#1086#1079#1074#1088'. '#1090#1072#1088#1099
          TabOrder = 2
        end
        object BBClose: TBitBtn
          Left = 159
          Top = 63
          Width = 127
          Height = 36
          Action = ActionExit
          Caption = #1042#1099#1093#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Kind = bkClose
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
        end
      end
      object GB_Oper_Data: TGroupBox
        Left = 8
        Top = 192
        Width = 289
        Height = 106
        Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        TabOrder = 2
        object BBUpLoadData: TBitBtn
          Left = 6
          Top = 64
          Width = 280
          Height = 34
          Action = ActionUpLoadData
          Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1072' '#1089#1077#1088#1074#1077#1088
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnMouseDown = BB_PrintCennikMouseDown
        end
        object BBLoadSpravochniki: TBitBtn
          Left = 6
          Top = 24
          Width = 280
          Height = 34
          Action = ActionLoadSpravochniki
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' '#1089' '#1089#1077#1088#1074#1077#1088#1072
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 103
        Width = 277
        Height = 89
        Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 26
          Width = 7
          Height = 19
          Caption = #1089
        end
        object Label4: TLabel
          Left = 6
          Top = 57
          Width = 18
          Height = 19
          Caption = #1087#1086
        end
        object D_From: TDateTimePicker
          Left = 33
          Top = 23
          Width = 119
          Height = 27
          Date = 38613.000000000000000000
          Time = 38613.000000000000000000
          TabOrder = 0
        end
        object D_To: TDateTimePicker
          Left = 33
          Top = 54
          Width = 119
          Height = 27
          Date = 38613.999988425930000000
          Time = 38613.999988425930000000
          TabOrder = 1
        end
        object T_From: TDateTimePicker
          Left = 158
          Top = 23
          Width = 107
          Height = 27
          Date = 38774.000000000000000000
          Time = 38774.000000000000000000
          Kind = dtkTime
          TabOrder = 2
        end
        object T_To: TDateTimePicker
          Left = 158
          Top = 54
          Width = 107
          Height = 27
          Date = 38774.999988425930000000
          Time = 38774.999988425930000000
          Kind = dtkTime
          TabOrder = 3
        end
      end
      object BitBtn32: TBitBtn
        Left = 167
        Top = 24
        Width = 132
        Height = 34
        Action = ActionControl_NOT_SAVED_DOC
        Caption = #1042#1086#1089#1089#1090#1072#1085' '#1076#1086#1082#1091#1084
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 150
        Height = 89
        Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1076#1072#1090#1072
        TabOrder = 5
        object D_Work: TDateTimePicker
          Left = 10
          Top = 20
          Width = 127
          Height = 27
          Date = 38613.999988425930000000
          Time = 38613.999988425930000000
          TabOrder = 0
          OnChange = D_WorkChange
          OnExit = D_WorkExit
        end
        object T_Work: TDateTimePicker
          Left = 10
          Top = 53
          Width = 127
          Height = 27
          Date = 38774.999988425930000000
          Time = 38774.999988425930000000
          Kind = dtkTime
          TabOrder = 1
          OnChange = T_WorkChange
          OnExit = T_WorkExit
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 523
    Width = 892
    Height = 19
    Panels = <
      item
        Width = 600
      end>
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 16
    object Files: TMenuItem
      Caption = #1060#1072#1081#1083#1099
      object N_Exit: TMenuItem
        Action = ActionExit
      end
      object N1: TMenuItem
        Action = ActionUsersConnectControl
        Visible = False
      end
      object ActionConnectRemoteDB1: TMenuItem
        Action = ActionConnectRemoteDB
      end
      object N4: TMenuItem
        Action = ActionDisconnectRemoteDB
      end
      object N8: TMenuItem
        Action = ActionLoadSpravochniki
      end
      object N5: TMenuItem
        Action = ActionUpLoadData
      end
      object N10: TMenuItem
        Action = ActionSettingConst
      end
      object N19: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1085#1072' '#1089#1077#1088#1074#1077#1088
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1089' '#1089#1077#1088#1074#1077#1088#1072
        OnClick = N20Click
      end
    end
    object Catalogs: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object Users: TMenuItem
        Action = ActionUsers
        Visible = False
      end
      object PlanSCH: TMenuItem
        Caption = #1055#1083#1072#1085' '#1089#1095#1077#1090#1086#1074
        Visible = False
      end
      object N9: TMenuItem
        Action = ActionKateg_Cli
      end
      object N7: TMenuItem
        Action = ActionClients
      end
    end
    object N2: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object N3: TMenuItem
        Action = ActionSale
      end
      object Action11: TMenuItem
        Action = ActionVozvr
      end
      object N6: TMenuItem
        Action = ActionInventTS
      end
      object N11: TMenuItem
        Action = ActionInventKassa
      end
      object N12: TMenuItem
        Action = ActionPrvo
      end
      object N13: TMenuItem
        Action = ActionControl_NOT_SAVED_DOC
      end
    end
    object N14: TMenuItem
      Caption = #1059#1090#1080#1083#1080#1090#1099
      object N18: TMenuItem
        Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1077' '#1089#1084#1077#1085#1099' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        OnClick = N18Click
      end
      object PRRO_ON_OFF: TMenuItem
        Caption = #1055#1056#1056#1054' - '#1088#1077#1078#1080#1084' '#1074#1082#1083
        OnClick = PRRO_ON_OFFClick
      end
      object N15: TMenuItem
        Action = Action_NULL_CHECK
      end
      object N_CleanUp: TMenuItem
        Action = ActionCleanUp
      end
      object N_CleanUp_ALCOGOL: TMenuItem
        Action = ActionCleanUp_Alcogol
      end
      object N_TransactionsRegistrarState: TMenuItem
        Action = ActionTransactionsRegistrarState
      end
      object N_TransactionsRegistrarState_Alcogol: TMenuItem
        Action = ActionTransactionsRegistrarState_Alcogol
      end
      object N16: TMenuItem
        Action = ActionDateOperEnableDisable
      end
      object N17: TMenuItem
        Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1089#1084#1077#1085#1099' '#1055#1056#1056#1054
        OnClick = N17Click
      end
      object N_OpenShift: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
        OnClick = N_OpenShiftClick
      end
      object LOAD_SPRAV_ON_OFF: TMenuItem
        Caption = #1047#1072#1082#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' - '#1074#1082#1083
        OnClick = LOAD_SPRAV_ON_OFFClick
      end
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 64
    object ActionExit: TAction
      Category = 'Files'
      Caption = #1042#1099#1093#1086#1076
      OnExecute = ActionExitExecute
    end
    object ActionUsersConnectControl: TAction
      Category = 'Files'
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      OnExecute = ActionUsersConnectControlExecute
    end
    object ActionConnectRemoteDB: TAction
      Category = 'Files'
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1091#1076#1072#1083#1077#1085#1085#1086#1081' '#1041#1044
      OnExecute = ActionConnectRemoteDBExecute
    end
    object ActionSale: TAction
      Category = 'Documents'
      Caption = #1055#1088#1086#1076#1072#1078#1072
      OnExecute = ActionSaleExecute
    end
    object ActionDisconnectRemoteDB: TAction
      Category = 'Files'
      Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1086#1090' '#1091#1076#1072#1083#1077#1085#1085#1086#1081' '#1041#1044
      OnExecute = ActionDisconnectRemoteDBExecute
    end
    object ActionLoadSpravochniki: TAction
      Category = 'Files'
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' '#1089' '#1089#1077#1088#1074#1077#1088#1072
      OnExecute = ActionLoadSpravochnikiExecute
    end
    object ActionUpLoadData: TAction
      Category = 'Files'
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1072' '#1089#1077#1088#1074#1077#1088
      Hint = 
        #1055#1077#1088#1077#1076#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1072' '#1089#1077#1088#1074#1077#1088' (ALT - '#1089' '#1091#1076#1072#1083#1077#1085#1080#1077#1084' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077' '#1088#1072#1085#1077#1077' '#1087#1077 +
        #1088#1077#1076#1072#1085#1085#1099#1093' '#1079#1072' '#1088#1072#1089#1095#1077#1090#1085#1091#1102' '#1076#1072#1090#1091')'
      OnExecute = ActionUpLoadDataExecute
    end
    object ActionUsers: TAction
      Category = 'Catalogs'
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      OnExecute = ActionUsersExecute
    end
    object ActionVozvr: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074
      OnExecute = ActionVozvrExecute
    end
    object ActionInventTS: TAction
      Category = 'Documents'
      Caption = #1048#1085#1074#1077#1085#1090'. '#1090#1086#1074#1072#1088#1086#1074
      OnExecute = ActionInventTSExecute
    end
    object ActionKassaReport: TAction
      Category = 'Report'
      Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
      OnExecute = ActionKassaReportExecute
    end
    object ActionOrdersTNP: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1058#1053#1055
      OnExecute = ActionOrdersTNPExecute
    end
    object ActionPrihodTNP: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1058#1053#1055
      OnExecute = ActionPrihodTNPExecute
    end
    object ActionClients: TAction
      Category = 'Catalogs'
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      OnExecute = ActionClientsExecute
    end
    object ActionKateg_Cli: TAction
      Category = 'Catalogs'
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      OnExecute = ActionKateg_CliExecute
    end
    object ActionVozvratTNP: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1058#1053#1055
      OnExecute = ActionVozvratTNPExecute
    end
    object ActionSettingConst: TAction
      Category = 'Files'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099
      OnExecute = ActionSettingConstExecute
    end
    object ActionInventKassa: TAction
      Category = 'Documents'
      Caption = #1048#1085#1074#1077#1085#1090'. '#1082#1072#1089#1089#1099
      OnExecute = ActionInventKassaExecute
    end
    object ActionOrdersKolbasa: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1082#1086#1083#1073#1072#1089#1099
      OnExecute = ActionOrdersKolbasaExecute
    end
    object ActionOrdersMyaso: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1084#1103#1089#1072
      OnExecute = ActionOrdersMyasoExecute
    end
    object ActionVozvratKolbasa: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
      OnExecute = ActionVozvratKolbasaExecute
    end
    object ActionVozvratMyaso: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
      OnExecute = ActionVozvratMyasoExecute
    end
    object ActionVerevki: TAction
      Category = 'Documents'
      Caption = #1042#1077#1088#1077#1074#1082#1080
      OnExecute = ActionVerevkiExecute
    end
    object ActionObrezi: TAction
      Category = 'Documents'
      Caption = #1054#1073#1088#1077#1079#1080
      OnExecute = ActionObreziExecute
    end
    object ActionZatraty: TAction
      Category = 'Documents'
      Caption = #1047#1072#1090#1088#1072#1090#1099
      OnExecute = ActionZatratyExecute
    end
    object ActionInkassa: TAction
      Category = 'Documents'
      Caption = #1048#1085#1082#1072#1089#1089#1072#1094#1080#1103
      OnExecute = ActionInkassaExecute
    end
    object ActionPrihodKolbasa: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1082#1086#1083#1073#1072#1089#1099
      OnExecute = ActionPrihodKolbasaExecute
    end
    object ActionPrihidMyaso: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1084#1103#1089#1072
      OnExecute = ActionPrihidMyasoExecute
    end
    object ActionOrdersTov: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1090#1086#1074#1072#1088#1086#1074
      Hint = #1047#1072#1082#1099#1079#1099' '#1090#1086#1074#1072#1088#1086#1074' '#1086#1090#1075#1091#1078#1072#1077#1084#1099#1093' '#1089' '#1053#1052#1050
      OnExecute = ActionOrdersTovExecute
    end
    object ActionOrdersTara: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1090#1072#1088#1099' '#1087#1083
      Hint = #1047#1072#1082#1072#1079#1099' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' ('#1087#1072#1082#1077#1090#1099'...)'
      OnExecute = ActionOrdersTaraExecute
    end
    object ActionPrihodTov: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1086#1074
      Hint = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1086#1074' '#1086#1090#1075#1088#1091#1078#1072#1077#1084#1099#1093' '#1089' '#1053#1052#1050
      OnExecute = ActionPrihodTovExecute
    end
    object ActionPrihodTara: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1088#1099' '#1087#1083
      Hint = #1055#1088#1080#1093#1086#1076' '#1090#1072#1088#1099' '#1087#1083#1072#1090#1085#1086#1081' '#1086#1090#1075#1088#1091#1078#1072#1077#1084#1099#1093' '#1089' '#1053#1052#1050
      OnExecute = ActionPrihodTaraExecute
    end
    object ActionVozvratTov: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074' '#1086#1090#1075#1088#1091#1078#1072#1077#1084#1099#1093' '#1089' '#1053#1052#1050
      OnExecute = ActionVozvratTovExecute
    end
    object ActionVozvratTara: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1072#1088#1099' '#1087#1083
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1090#1072#1088#1099' '#1086#1090#1075#1088#1091#1078#1072#1077#1084#1099#1093' '#1089' '#1053#1052#1050
      OnExecute = ActionVozvratTaraExecute
    end
    object ActionInventVozvrTara: TAction
      Category = 'Documents'
      Caption = #1048#1085#1074'. '#1074#1086#1079#1074#1088'. '#1090#1072#1088#1099
      OnExecute = ActionInventVozvrTaraExecute
    end
    object Action1: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1074#1077#1076#1077#1085#1080#1077' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1055#1056#1056#1054' '#1082' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1085#1072' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1084' '#1089#1077#1088#1074#1077#1088#1077
      OnExecute = ActionCleanUpExecute
    end
    object ActionTovReportProdaga: TAction
      Category = 'Report'
      Caption = #1055#1088#1086#1076#1072#1078#1080
      OnExecute = ActionTovReportProdagaExecute
    end
    object ActionTovReportOborot: TAction
      Category = 'Report'
      Caption = #1054#1073#1086#1088#1086#1090
      OnExecute = ActionTovReportOborotExecute
    end
    object ActionOrdersOvochi: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079#1099' '#1086#1074#1086#1097#1077#1081
      OnExecute = ActionOrdersOvochiExecute
    end
    object ActionPrihodOvochi: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1086#1074#1086#1097#1077#1081
      OnExecute = ActionPrihodOvochiExecute
    end
    object ActionSpisanieOvochi: TAction
      Category = 'Documents'
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081
      OnExecute = ActionSpisanieOvochiExecute
    end
    object ActionPrvo: TAction
      Category = 'Documents'
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      OnExecute = ActionPrvoExecute
    end
    object ActionControl_NOT_SAVED_DOC: TAction
      Category = 'Files'
      Caption = #1042#1086#1089#1089#1090#1072#1085' '#1076#1086#1082#1091#1084
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1080' '#1080#1093' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
      OnExecute = ActionControl_NOT_SAVED_DOCExecute
    end
    object Action_NULL_CHECK: TAction
      Category = 'Utility'
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1095#1077#1082#1072
      OnExecute = Action_NULL_CHECKExecute
    end
    object ActionVozvrDolg: TAction
      Category = 'Documents'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1076#1086#1083#1075#1086#1074
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1076#1086#1083#1075#1086#1074' '#1086#1090' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
      OnExecute = ActionVozvrDolgExecute
    end
    object ActionPeredachaTtToTt: TAction
      Category = 'Documents'
      Caption = #1056#1072#1089#1093#1086#1076' '#1085#1072' '#1090#1090
      Hint = #1055#1077#1088#1077#1076#1072#1095#1072' '#1090#1086#1074#1072#1088#1072' '#1089' '#1090#1086#1088#1075#1086#1074#1086#1081' '#1090#1086#1095#1082#1080' '#1085#1072' '#1090#1086#1088#1075#1086#1074#1091#1102' '#1090#1086#1095#1082#1091
      OnExecute = ActionPeredachaTtToTtExecute
    end
    object ActionPrihodTtToTt: TAction
      Category = 'Documents'
      Caption = #1055#1088#1080#1093#1086#1076' '#1089' '#1090#1090
      Hint = #1055#1088#1080#1093#1086#1076' '#1087#1077#1088#1077#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072' '#1089' '#1076#1088#1091#1075#1086#1081' '#1090#1086#1088#1075'. '#1090#1086#1095#1082#1080
      OnExecute = ActionPrihodTtToTtExecute
    end
    object ActionStartSmeny: TAction
      Category = 'Documents'
      Caption = #1053#1072#1095#1072#1090#1100' '#1089#1084#1077#1085#1091
      OnExecute = ActionStartSmenyExecute
    end
    object ActionStopSmeny: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1089#1084#1077#1085#1091
      OnExecute = ActionStopSmenyExecute
    end
    object ActionStartSmeny_Alcogol: TAction
      Category = 'Documents'
      Caption = #1053#1072#1095#1072#1090#1100' '#1089#1084#1077#1085#1091' '#1040
      OnExecute = ActionStartSmeny_AlcogolExecute
    end
    object ActionStopSmeny_Alcogol: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1089#1084#1077#1085#1091' '#1040
      OnExecute = ActionStopSmeny_AlcogolExecute
    end
    object ActionCleanUp: TAction
      Category = 'Utility'
      Caption = #1055#1088#1080#1074#1077#1076#1077#1085#1080#1077' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1055#1056#1056#1054' '#1082' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1085#1072' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1084' '#1089#1077#1088#1074#1077#1088#1077
      OnExecute = ActionCleanUpExecute
    end
    object ActionCleanUp_Alcogol: TAction
      Category = 'Utility'
      Caption = 
        #1055#1088#1080#1074#1077#1076#1077#1085#1080#1077' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1072#1083#1082#1086' '#1055#1056#1056#1054' '#1082' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1085#1072' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1084' '#1089#1077#1088#1074#1077#1088 +
        #1077
      OnExecute = ActionCleanUp_AlcogolExecute
    end
    object ActionTransactionsRegistrarState: TAction
      Category = 'Utility'
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1055#1056#1056#1054
      OnExecute = ActionTransactionsRegistrarStateExecute
    end
    object ActionTransactionsRegistrarState_Alcogol: TAction
      Category = 'Utility'
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1072#1083#1082#1086' '#1055#1056#1056#1054' '
      OnExecute = ActionTransactionsRegistrarState_AlcogolExecute
    end
    object ActionLastShiftTotals: TAction
      Category = 'Utility'
      Caption = #1048#1090#1086#1075#1080' '#1089#1084#1077#1085#1099
      OnExecute = ActionLastShiftTotalsExecute
    end
    object ActionLastShiftTotals_Alcogol: TAction
      Category = 'Utility'
      Caption = #1048#1090#1086#1075#1080' '#1089#1084#1077#1085#1099' '#1040
      OnExecute = ActionLastShiftTotals_AlcogolExecute
    end
    object ActionKassaIn: TAction
      Category = 'Utility'
      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075
      OnExecute = ActionKassaInExecute
    end
    object ActionKassaIn_Alcogol: TAction
      Category = 'Utility'
      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1040
      OnExecute = ActionKassaIn_AlcogolExecute
    end
    object ActionKassaOut: TAction
      Category = 'Utility'
      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075
      OnExecute = ActionKassaOutExecute
    end
    object ActionKassaOut_Alcogol: TAction
      Category = 'Utility'
      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1040
      OnExecute = ActionKassaOut_AlcogolExecute
    end
    object ActionDateOperEnableDisable: TAction
      Category = 'Utility'
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100'-'#1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1089#1095#1077#1090#1085#1086#1081' '#1076#1072#1090#1099
      OnExecute = ActionDateOperEnableDisableExecute
    end
    object ActionOrdersVozvratTNP: TAction
      Category = 'Documents'
      Caption = #1047#1072#1082#1072#1079' '#1074#1086#1079#1074' '#1058#1053#1055
      OnExecute = ActionOrdersVozvratTNPExecute
    end
  end
  object Q_ConstValues: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'CONST_NAME'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'select TOP 1 [CONST_VALUE] from [dbo].[CONST_VALUES] where [CONS' +
        'T_NAME]=:CONST_NAME')
    Left = 520
    Top = 32
  end
  object QNEW_PRICE_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IS_EXISTS'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_USER int, @IS_EXISTS int;'
      'set @ID_USER=:ID_USER'
      'set @IS_EXISTS=:IS_EXISTS'
      ''
      'declare @IS_EXISTS_FROM int'
      'declare @IS_EXISTS_TO int'
      'if @IS_EXISTS=0'
      'begin'
      #9'set  @IS_EXISTS_FROM=0'
      #9'set  @IS_EXISTS_TO=1'
      'end'
      'else '
      'begin'
      #9'set  @IS_EXISTS_FROM=1'
      #9'set  @IS_EXISTS_TO=1'
      'end;'
      ''
      
        'select T.NAME, T.EDIZM, NP.[PRICE2], GT.GRUPTOV,  NP.[ID_TOV], T' +
        '.[CODE] from [dbo].[NEW_PRICE_POS] NP'
      'inner join [dbo].[TOV] T on T.ID_TOV=NP.ID_TOV'
      'inner join [dbo].[GRTOV] GT on GT.ID_GRTOV=T.ID_GRTOV'
      'where'
      
        'exists(select * from dbo.PRICE PR where PR.ID_USERS=@ID_USER and' +
        ' PR.ID_TOV= NP.ID_TOV'
      
        ' and PR.[IS_EXISTS_OSTATOK]>=@IS_EXISTS_FROM and PR.[IS_EXISTS_O' +
        'STATOK]<=@IS_EXISTS_TO)')
    Left = 520
    Top = 408
    object QNEW_PRICE_POSNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 255
    end
    object QNEW_PRICE_POSEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QNEW_PRICE_POSPRICE2: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE2'
      DisplayFormat = '0.00'
    end
    object QNEW_PRICE_POSGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QNEW_PRICE_POSID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TOV'
    end
    object QNEW_PRICE_POSCODE: TWideStringField
      DisplayLabel = #1064#1090#1088#1080#1093#1082#1086#1076
      FieldName = 'CODE'
    end
  end
  object DS_QNEW_PRICE_POS: TDataSource
    DataSet = QNEW_PRICE_POS
    Left = 607
    Top = 433
  end
  object QUsersTP: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select [ID_USERS] from [dbo].[USERS]')
    Left = 824
    Top = 336
  end
  object Q_Advert: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'TYPE_MSG'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TYPE_MSG int'
      'set @TYPE_MSG=:TYPE_MSG'
      'SELECT [ID_ADVERT]'
      '      ,[TYPE_MSG]'
      '      ,[ID_CLI]'
      '      ,[MSG]'
      '  FROM [ADVERT_MSG] where TYPE_MSG=@TYPE_MSG'
      '')
    Left = 768
    Top = 384
  end
  object Q_SHTRIH_CODE_TOV_NEW_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  [ID_TOV]'
      '      ,[BARCODE]'
      '      ,[SYMBOLS_WEIGHT_OF_BARCODE]'
      '      ,[WEIGHT_MULTIPLIER]'
      ''
      '  FROM [SHTRIH_CODE_TOV_NEW_POS]'
      ''
      '')
    Left = 736
    Top = 272
  end
  object Command_Del_SHTRIH_CODE_TOV_NEW: TADOCommand
    CommandText = 'delete [dbo].[SHTRIH_CODE_TOV_NEW_POS]'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 771
    Top = 202
  end
  object ADOCommandDeleteOld_Doc: TADOCommand
    CommandText = 
      'declare @D_FROM datetime, @D_NOW datetime'#13#10'set @D_NOW=GETDATE()'#13 +
      #10'set @D_FROM= DATEADD(day, -60, @D_NOW);'#13#10#13#10'delete NAVESKI from ' +
      '[dbo].[NAVESKI] NA'#13#10'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLC' +
      'AP=NA.ID_NAKLCAP'#13#10'where NC.D<=@D_FROM'#13#10#13#10'delete NAKLTOV from [db' +
      'o].[NAKLTOV] NT'#13#10'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=' +
      'NT.ID_NAKLCAP'#13#10'where NC.D<=@D_FROM'#13#10#13#10'delete NAKLCAP from [dbo].' +
      '[NAKLCAP] NC'#13#10'where NC.D<=@D_FROM'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 195
    Top = 378
  end
  object QTradepointInfo: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select CL.CLIENT as NAME_TRADE_POINT, CL.ADRES as ADRES_TRADEPOI' +
        'NT, CL.ID_PARENT, CLP.CLIENT as PARENT_NAME  from CLIENTS CL'
      'left outer join CLIENTS CLP on CLP.ID_CLIENTS=CL.ID_PARENT'
      'where CL.ID_CLIENTS= :ID_TRADE_POINT'
      ''
      '')
    Left = 224
    Top = 112
  end
  object Q_SVERKA_DOC_For_Export: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select [ID_LINK_DOC_2], [IS_SVERENO]  from [dbo].[NAKLCAP] NC'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=:d_from'
      'and NC.[D]<=:d_to'
      'and NC.[IS_EXPORT]=1'
      'and NC.[ID_DOC_TYPE] in (209, 216, 219, 228, 230)')
    Left = 416
    Top = 352
  end
  object Q_TramsmissionDoc: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '-- '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      
        'select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSIO' +
        'N_RECEPTION] in (0, 2)')
    Left = 488
    Top = 160
  end
  object Q_Reception: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '-- '#1087#1088#1080#1085#1080#1084#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1089' '#1089#1077#1088#1074#1077#1088#1072' '#1053#1052#1050
      
        'select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSIO' +
        'N_RECEPTION] in (1,2)')
    Left = 416
    Top = 208
  end
  object ADOCommandUnSetExportDoc: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'update NC set  NC.[IS_EXPORT]=0 '#13#10' from [dbo].[NAK' +
      'LCAP] NC'#13#10' inner join [dbo].[DOC_TYPE] DT on DT.ID_DOC_TYPE=NC.[' +
      'ID_DOC_TYPE]'#13#10'where NC.IS_DELETE=0'#13#10' and NC.[D]>=:d_from'#13#10'and NC' +
      '.[D]<=:d_to'#13#10'and NC.[IS_EXPORT]=0'#13#10'and DT.[IS_TRANSMISSION_RECEP' +
      'TION]<>1 -- '#1090#1086#1083#1100#1082#1086' '#1087#1077#1088#1077#1076#1072#1102#1090#1089#1103' '#1080#1083#1080' '#1087#1077#1088#1077#1076#1072#1102#1090#1089#1103' '#1080' '#1087#1088#1080#1085#1080#1084#1072#1102#1090#1089#1103' '
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 315
    Top = 402
  end
  object Q_Set_Interface: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_INTERFACE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from [dbo].[SET_INTERFACE] where [ID_INTERFACE]=:ID_INT' +
        'ERFACE')
    Left = 608
    Top = 40
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
      #9'SELECT RC.[ID_CLI] as ID_CLI'
      #9#9'  ,RC.[CERTIFICATE] as [CERTIFICATE]'
      #9#9'  ,RC.[PRIVATE_KEY] as PRIVATE_KEY'
      #9#9'  ,RC.[PASSW] as PASSW'
      #9#9'  ,RC.[DATE_END_CERTIFICATE] as DATE_END_CERTIFICATE'
      #9#9'  ,CL.CLIENT as CLIENT'
      #9#9'  ,CL.INN as INN'
      #9'  FROM [dbo].[RRO_CERTIFIC] RC'
      #9'  inner join CLIENTS CL on CL.ID_CLIENTS=RC.[ID_CLI]'
      #9'  where RC.[ID_CLI]=@ID_'
      'end'
      'else'
      'begin'
      #9'SELECT RK.[ID_CLI] as ID_CLI'
      #9#9'  ,RK.[CERTIFICATE] as [CERTIFICATE]'
      #9#9'  ,RK.[PRIVATE_KEY] as PRIVATE_KEY'
      #9#9'  ,RK.[PASSW] as PASSW'
      #9#9'  ,RK.[DATE_END_CERTIFICATE] as DATE_END_CERTIFICATE'
      #9#9'  ,CL.CLIENT as CLIENT'
      #9#9'  ,CL.INN as INN'
      #9'  FROM [dbo].[RRO_KASSA_TS] RK'
      #9'  inner join CLIENTS CL on CL.ID_CLIENTS=RK.[ID_CLI]'
      #9'  where RK.[ID_RRO_KASSA]=@ID_'
      'end'
      ''
      ''
      '')
    Left = 564
    Top = 210
  end
  object Q_RRO_KASSA_TS: TADOQuery
    Connection = DM1.ADOConnection1
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
    Left = 556
    Top = 274
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
    Left = 664
    Top = 328
  end
  object Table_D_START_SMEN: TADOTable
    Connection = DM1.ADOConnection1
    TableName = 'D_START_SMEN'
    Left = 493
    Top = 90
  end
  object Q_CONTROL_REG_RRO: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      'declare @D_FROM datetime, @D_TO datetime '
      'set @D_FROM=:D_FROM'
      'set @D_TO=:D_TO'
      
        'select count(*) as count_not_reg_rro from NAKLCAP where ID_DOC_T' +
        'YPE=200 and IS_DELETE=0 and D>=@D_FROM and D<=@D_TO '
      'and [IS_CAN_REGISTRED_RRO]=1 and [IS_REGISTER_RRO]=0')
    Left = 552
    Top = 328
  end
  object QInventExists: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      'declare @D_FROM datetime, @D_TO datetime'
      'set @D_FROM=:D_FROM'
      'set @D_TO=:D_TO'
      
        'select ID_NAKLCAP, TOT_SUM, TOT_NUM from NAKLCAP where ID_DOC_TY' +
        'PE=206 and IS_DELETE=0 and IS_SVERENO=0 and D>=@D_FROM and D<=@D' +
        '_TO'
      ''
      ''
      '')
    Left = 232
    Top = 296
  end
  object Q_All_ConstValues: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[CONST_VALUES]')
    Left = 768
    Top = 24
  end
  object ADOCommandInsert_CONST_VALUES: TADOCommand
    CommandText = 
      '  insert into [CONST_VALUES] ([ID_CONST]'#13#10'      ,[CONST_NAME]'#13#10' ' +
      '     ,[CONST_VALUE]'#13#10#9'  ,[COMMENT])'#13#10#9'  values (:ID_CONST'#13#10'     ' +
      ' ,:CONST_NAME'#13#10'      ,:CONST_VALUE'#13#10#9'  ,:COMMENT)'
    Connection = DM1.ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_CONST'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CONST_NAME'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CONST_VALUE'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 792
    Top = 83
  end
  object ADOCommandDelete_CONST_VALUES: TADOCommand
    CommandText = 'delete from [dbo].[CONST_VALUES]'
    Connection = DM1.ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 688
    Top = 83
  end
  object Q_Not_Sent_Docs: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_Not_Sent_DocsAfterScroll
    Parameters = <
      item
        Name = 'd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      'declare @d datetime'
      '--set @d='#39'09.12.2025'#39
      'set @d=:d'
      
        '-- '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1089#1077#1088#1074#1077#1088' NMK - IS_TRANSMISSION_RECEPT' +
        'ION=0 '#1080#1083#1080' 2'
      
        'select cast(floor(cast( NC.[D] as float)) as datetime) as D_DOC,' +
        ' count(*) as COUNT_DOC, NC.[ID_DOC_TYPE], DT.NAMEDOC from [dbo].' +
        '[NAKLCAP] NC'
      'inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NC.[ID_DOC_TYPE]'
      'where NC.IS_DELETE=0'
      'and NC.[D]<=@d'
      'and NC.[IS_EXPORT]=0'
      'and NC.[IS_FINAL]=1'
      'and not (NC.[ID_DOC_TYPE] in'
      
        '(select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSI' +
        'ON_RECEPTION] in (1,3)))'
      
        'group by cast(floor(cast( NC.[D] as float)) as datetime), NC.[ID' +
        '_DOC_TYPE], DT.NAMEDOC'
      
        'order by DT.NAMEDOC, cast(floor(cast( NC.[D] as float)) as datet' +
        'ime), NC.[ID_DOC_TYPE]')
    Left = 352
    Top = 64
    object Q_Not_Sent_DocsD_DOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D_DOC'
      ReadOnly = True
    end
    object Q_Not_Sent_DocsNAMEDOC: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'NAMEDOC'
      ReadOnly = True
      Size = 50
    end
    object Q_Not_Sent_DocsCOUNT_DOC: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'COUNT_DOC'
      ReadOnly = True
    end
    object Q_Not_Sent_DocsID_DOC_TYPE: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'ID_DOC_TYPE'
      ReadOnly = True
    end
  end
  object DS_Q_Not_Sent_Docs: TDataSource
    DataSet = Q_Not_Sent_Docs
    Left = 394
    Top = 60
  end
  object Q_NotFinalDoc: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '--use NMK_TP'
      
        'select DT.NAMEDOC, NC.D, NC.NN, NC.TOT_SUM, NC.ID_NAKLCAP, NC.ID' +
        '_DOC_TYPE  from NAKLCAP NC'
      'inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE '
      'where IS_FINAL=0 and IS_DELETE=0'
      '')
    Left = 248
    Top = 184
    object Q_NotFinalDocNAMEDOC: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object Q_NotFinalDocD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'D'
    end
    object Q_NotFinalDocNN: TWideStringField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'NN'
      Size = 50
    end
    object Q_NotFinalDocTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
      DisplayFormat = '0.00'
    end
    object Q_NotFinalDocID_NAKLCAP: TAutoIncField
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
      Visible = False
    end
    object Q_NotFinalDocID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
      Visible = False
    end
  end
  object DS_Q_NotFinalDoc: TDataSource
    DataSet = Q_NotFinalDoc
    Left = 289
    Top = 185
  end
  object ADOCommandDeleteNotFinalDoc: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_NAKLCAP int, @ID_USER int'#13#10'set @ID_NAK' +
      'LCAP=:ID_NAKLCAP'#13#10'set @ID_USER=:ID_USER'#13#10'if @ID_NAKLCAP=-1'#13#10'begi' +
      'n'#13#10#9'update NAKLCAP set IS_DELETE=1, [D_DELETE]=GETDATE(), [COMME' +
      'NT_DEL]='#39#1059#1076#1072#1083#1077#1085#1080#1077' '#1085#1077#1079#1072#1082#1086#1085#1095#1077#1085#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39', [ID_USER_DEL]=@ID_U' +
      'SER'#13#10#9'from NAKLCAP '#13#10'end'#13#10'else'#13#10'begin'#13#10#9'update NAKLCAP set IS_DE' +
      'LETE=1, [D_DELETE]=GETDATE(), [COMMENT_DEL]='#39#1059#1076#1072#1083#1077#1085#1080#1077' '#1085#1077#1079#1072#1082#1086#1085#1095#1077#1085 +
      #1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39', [ID_USER_DEL]=@ID_USER'#13#10#9'from NAKLCAP where ID_' +
      'NAKLCAP=@ID_NAKLCAP'#13#10'end'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 187
    Top = 186
  end
end
