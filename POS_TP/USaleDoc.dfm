object F_SaleDoc: TF_SaleDoc
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1076#1072#1078#1072
  ClientHeight = 765
  ClientWidth = 1361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1361
    Height = 765
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 769
      Height = 763
      Align = alClient
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 767
        Height = 353
        Align = alTop
        TabOrder = 0
        object Panel6: TPanel
          Left = 1
          Top = 182
          Width = 765
          Height = 170
          Align = alBottom
          TabOrder = 0
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 763
            Height = 80
            Align = alTop
            TabOrder = 0
            object Label_Client: TLabel
              Left = 9
              Top = 2
              Width = 69
              Height = 16
              Caption = 'Label_Client'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBNavigator2: TDBNavigator
              Left = 5
              Top = 34
              Width = 124
              Height = 34
              DataSource = DM1.DS_QPriceTovSelect
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
            object GroupBox2: TGroupBox
              Left = 450
              Top = 27
              Width = 87
              Height = 49
              Caption = #1041#1086#1085'.'#1073#1072#1083#1083#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object Edit_Sum_Bonus_Ball: TEdit
                Left = 8
                Top = 18
                Width = 73
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = 'Edit_Sum_Bonus_Ball'
              end
            end
            object GroupBox3: TGroupBox
              Left = 292
              Top = 27
              Width = 149
              Height = 49
              Hint = #1064#1090#1088#1080#1093#1082#1086#1076' '#1080#1083#1080' '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
              Caption = #1064#1090#1088#1080#1093#1082#1086#1076' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              object Edit_BonusCard: TEdit
                Left = 3
                Top = 22
                Width = 134
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Text = '012345678901234567890'
                OnKeyDown = Edit_BonusCardKeyDown
              end
            end
            object BBCennik: TBitBtn
              Left = 224
              Top = 34
              Width = 62
              Height = 34
              Caption = #1062#1077#1085#1085#1080#1082
              TabOrder = 3
              OnClick = BBCennikClick
            end
            object BB_SkidkaShow: TBitBtn
              Left = 144
              Top = 34
              Width = 62
              Height = 34
              Caption = #1057#1082#1080#1076#1082#1080
              TabOrder = 4
              OnClick = BB_SkidkaShowClick
            end
            object BB_RegistrBonusCard: TBitBtn
              Left = 574
              Top = 41
              Width = 129
              Height = 34
              Hint = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1081' '#1073#1086#1085#1091#1089#1085#1086#1081' '#1082#1072#1088#1090#1099' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
              Caption = #1053#1086#1074#1072#1103' '#1073#1086#1085' '#1082#1072#1088#1090#1072
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
                77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0BBBBB
                BBB07F333F7F3FF33FF70FFF700B00BB00B07F3F777F77F377370F707F0BB0B0
                0BB07F77337F37F77337007EEE0BB0B0BBB077FFFF7F37F7F3370777770EE000
                EEE07777777F3777F3F7307EEE0E0E00E0E03773FF7F7377F73733707F0EE000
                0EE03337737F377773373333700EEE00EEE03333377F3377FF373333330EEEE0
                0EE03333337F33377F373333330EEEE00EE03333337F333773373333330EEEEE
                EEE03333337FFFFFFFF733333300000000003333337777777777}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BB_RegistrBonusCardClick
            end
            object CB_SHTRIH_TOV: TCheckBox
              Left = 709
              Top = 36
              Width = 51
              Height = 35
              Hint = #1042#1074#1086#1076' '#1096#1090#1088#1080#1093#1082#1086#1076#1072' '#1090#1086#1074#1072#1088#1072
              Caption = #1064#1090#1088#1080#1093#1082#1086#1076
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              WordWrap = True
              OnClick = CB_SHTRIH_TOVClick
            end
            object GroupBox4: TGroupBox
              Left = 543
              Top = 27
              Width = 154
              Height = 47
              Caption = #1042#1074#1086#1076' '#1096#1090#1088#1080#1093#1082#1086#1076#1072' '#1090#1086#1074#1072#1088#1072
              TabOrder = 7
              Visible = False
              object BB_NewBarCode: TBitBtn
                Left = 16
                Top = 19
                Width = 129
                Height = 25
                Caption = #1053#1086#1074#1099#1081' '#1096#1090#1088#1080#1093#1082#1086#1076
                TabOrder = 0
                OnClick = BB_NewBarCodeClick
              end
            end
            object GroupBoxNacenka: TGroupBox
              Left = 447
              Top = 25
              Width = 215
              Height = 50
              Caption = #1053#1072#1094#1077#1085#1082#1072
              TabOrder = 8
              Visible = False
              object E_PerNacenki: TEdit
                Left = 10
                Top = 19
                Width = 55
                Height = 21
                TabOrder = 0
                Text = '0'
              end
              object BitBtn3: TBitBtn
                Left = 137
                Top = 17
                Width = 63
                Height = 25
                Action = ActionNacenka
                Caption = #1053#1072#1094#1077#1085#1080#1090#1100
                TabOrder = 1
              end
              object CB_PerNacenki: TCheckBox
                Left = 79
                Top = 20
                Width = 47
                Height = 20
                Hint = #1042#1074#1086#1076' '#1096#1090#1088#1080#1093#1082#1086#1076#1072' '#1090#1086#1074#1072#1088#1072
                Caption = #1074' %'
                Checked = True
                ParentShowHint = False
                ShowHint = True
                State = cbChecked
                TabOrder = 2
              end
            end
          end
          object Panel15: TPanel
            Left = 1
            Top = 81
            Width = 763
            Height = 88
            Align = alClient
            TabOrder = 1
            object Panel14: TPanel
              Left = 1
              Top = 1
              Width = 761
              Height = 86
              Align = alClient
              TabOrder = 0
              object L_Itog: TLabel
                Left = 6
                Top = 3
                Width = 292
                Height = 19
                Caption = #1048#1090#1086#1075#1086' %D '#1085#1072#1080#1084#1077#1085'. '#1085#1072' '#1089#1091#1084#1084#1091' %8.2f'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object L_Skidka: TLabel
                Left = 6
                Top = 23
                Width = 50
                Height = 16
                Caption = 'L_Skidka'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object L_klobasa: TLabel
                Left = 6
                Top = 38
                Width = 56
                Height = 16
                Caption = 'L_klobasa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object L_myaso: TLabel
                Left = 6
                Top = 53
                Width = 50
                Height = 16
                Caption = 'L_myaso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object L_tnp: TLabel
                Left = 6
                Top = 68
                Width = 31
                Height = 16
                Caption = 'L_tnp'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 765
          Height = 181
          Hint = 
            #1057#1087#1080#1089#1086#1082' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1090#1086#1074#1072#1088#1086#1074'. '#1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082'  '#1087#1086' '#1089#1090#1088#1086#1082#1077' - '#1087#1086#1080#1089#1082' '#1074'  '#1087#1088#1072 +
            #1081#1089'-'#1083#1080#1089#1090#1077
          Align = alClient
          Color = clBtnFace
          DataSource = DM1.DS_QPriceTovSelect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGrid3CellClick
          OnDrawDataCell = DBGrid3DrawDataCell
          OnDblClick = DBGrid3DblClick
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 354
        Width = 767
        Height = 389
        Align = alClient
        TabOrder = 1
        object Panel_Price: TPanel
          Left = 1
          Top = 1
          Width = 765
          Height = 387
          Align = alClient
          TabOrder = 0
          object Panel8: TPanel
            Left = 1
            Top = 354
            Width = 763
            Height = 32
            Align = alBottom
            TabOrder = 0
            object DBNavigator1: TDBNavigator
              Left = 6
              Top = 2
              Width = 200
              Height = 27
              DataSource = DM1.DSPrice
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
          end
          object DBGrid1: TDBGrid
            Left = 1
            Top = 1
            Width = 763
            Height = 353
            Align = alClient
            DataSource = DM1.DSPrice
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawDataCell = DBGrid1DrawDataCell
          end
        end
      end
      object StatusBar1: TStatusBar
        Left = 1
        Top = 743
        Width = 767
        Height = 19
        Panels = <
          item
            Text = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1077#1089#1086#1074
            Width = 200
          end
          item
            Text = #1056'/'#1042
            Width = 500
          end
          item
            Text = 'C'
            Width = 50
          end>
      end
    end
    object Panel3: TPanel
      Left = 770
      Top = 1
      Width = 590
      Height = 763
      Align = alRight
      TabOrder = 1
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 588
        Height = 427
        Align = alTop
        TabOrder = 0
        object BBClean: TBitBtn
          Left = 358
          Top = 156
          Width = 75
          Height = 19
          Caption = #1054#1073#1085#1091#1083#1080#1090#1100
          TabOrder = 0
          Visible = False
          OnClick = BBCleanClick
        end
        object BBReset: TBitBtn
          Left = 439
          Top = 156
          Width = 75
          Height = 19
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 1
          Visible = False
          OnClick = BBResetClick
        end
        object PanelSearch: TPanel
          Left = 1
          Top = 75
          Width = 586
          Height = 351
          Align = alClient
          TabOrder = 2
          object Label7: TLabel
            Left = 4
            Top = 266
            Width = 54
            Height = 16
            Caption = #1043#1088#1091#1087#1087#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LGrup: TLabel
            Left = 4
            Top = 288
            Width = 517
            Height = 18
            AutoSize = False
            Caption = #1043#1088#1091#1087#1087#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 4
            Top = 114
            Width = 540
            Height = 24
            DataField = 'NAME'
            DataSource = DM1.DSPrice
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 8
            Top = 84
            Width = 89
            Height = 24
            DataField = 'PRICE_UCH'
            DataSource = DM1.DSPrice
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 10
            Top = 59
            Width = 36
            Height = 19
            Caption = #1062#1077#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 10
            Top = -1
            Width = 51
            Height = 19
            Caption = #1050#1086#1083'-'#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 149
            Top = 59
            Width = 92
            Height = 19
            Caption = #1062#1077#1085#1072' '#1091#1094#1077#1085#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EWeight: TEdit
            Left = 8
            Top = 18
            Width = 153
            Height = 37
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = EWeightChange
            OnClick = EWeightClick
            OnKeyPress = EWeightKeyPress
          end
          object GroupBox9: TGroupBox
            Left = 267
            Top = 0
            Width = 228
            Height = 111
            Caption = #1053#1072#1074#1077#1089#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object BBNaveskiDelete: TBitBtn
              Left = 144
              Top = 20
              Width = 78
              Height = 45
              Action = Action_Naveski_Delete
              Caption = #1059#1076#1072#1083#1080#1090#1100
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
            end
            object DBGrid2: TDBGrid
              Left = 3
              Top = 16
              Width = 135
              Height = 89
              DataSource = DM1.DSQNAVESKI_TMP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object DBNavigator3: TDBNavigator
              Left = 144
              Top = 74
              Width = 80
              Height = 29
              DataSource = DM1.DSQNAVESKI_TMP
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 2
            end
          end
          object GroupBox1: TGroupBox
            Left = 4
            Top = 135
            Width = 586
            Height = 129
            Caption = #1055#1086#1080#1089#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Edit1: TEdit
              Left = 3
              Top = 27
              Width = 198
              Height = 37
              Hint = #1055#1086#1080#1089#1082' - F1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = Edit1Change
              OnClick = Edit1Click
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
            object BBSearchDown: TBitBtn
              Left = 207
              Top = 24
              Width = 39
              Height = 40
              Hint = #1055#1086#1080#1089#1082' '#1074#1085#1080#1079
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBSearchDownClick
            end
            object BBSearchUp: TBitBtn
              Left = 248
              Top = 24
              Width = 38
              Height = 40
              Hint = #1055#1086#1080#1089#1082' '#1074#1074#1077#1088#1093
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                333333777777777F33333330B00000003333337F7777777F3333333000000000
                333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
                333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
                03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
                03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
                3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
                333333333377F7F33333333333330F03333333333337F7F33333333333330B03
                3333333333373733333333333333303333333333333373333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BBSearchUpClick
            end
            object CheckBox1: TCheckBox
              Left = 306
              Top = 12
              Width = 98
              Height = 25
              Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
              Caption = #1082#1086#1085#1090#1077#1082#1089#1090
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = CheckBox1Click
            end
            object CheckBox2: TCheckBox
              Left = 306
              Top = 34
              Width = 97
              Height = 22
              Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
              Caption = #1092#1080#1083#1100#1090#1088
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = CheckBox2Click
            end
            object BBAllGrTovSel: TBitBtn
              Left = 374
              Top = 80
              Width = 61
              Height = 46
              Hint = #1042#1099#1073#1086#1088' '#1074#1089#1077#1093' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
                000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
                99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
                0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
                FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
                0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
                000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
                00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
                00FF33337FFF7FF77733333300000000033F3333777777777333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BBAllGrTovSelClick
            end
            object BBGrTovSel: TBitBtn
              Left = 307
              Top = 80
              Width = 61
              Height = 46
              Hint = #1042#1099#1073#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
                FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
                990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
                990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
                FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
                00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
                00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
                00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
                03FF33337FFF77777333333300000333333F3333777773333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = BBGrTovSelClick
            end
            object RadioGroup1: TRadioGroup
              Left = 114
              Top = 80
              Width = 186
              Height = 46
              Columns = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemIndex = 0
              Items.Strings = (
                #1050#1086#1076
                #1053#1072#1080#1084#1077#1085)
              ParentFont = False
              TabOrder = 7
              OnClick = RadioGroup1Click
            end
            object RG_Price_View: TRadioGroup
              Left = 448
              Top = 9
              Width = 131
              Height = 67
              Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
              ItemIndex = 0
              Items.Strings = (
                #1055#1086#1083#1085#1099#1081
                #1042' '#1085#1072#1083#1080#1095#1080#1080)
              TabOrder = 8
              OnClick = RG_Price_ViewClick
            end
            object CBOrderAssortiment: TCheckBox
              Left = 306
              Top = 57
              Width = 128
              Height = 20
              Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090' '#1080#1079' '#1087#1088#1086#1090#1086#1090#1080#1087#1072
              Caption = #1080#1079' '#1087#1088#1086#1090#1086#1090#1080#1087#1072
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnClick = CBOrderAssortimentClick
            end
            object BBRecept_To_Resistr: TBitBtn
              Left = 441
              Top = 80
              Width = 81
              Height = 45
              Caption = #1056#1077#1075
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              OnClick = BBRecept_To_ResistrClick
            end
            object CB_Search_BarCode: TCheckBox
              Left = 11
              Top = 98
              Width = 97
              Height = 17
              Caption = #1064#1090#1088#1080#1093#1082#1086#1076
              TabOrder = 11
              OnClick = CB_Search_BarCodeClick
            end
          end
          object BBWeight_on_off: TBitBtn
            Left = 501
            Top = 6
            Width = 75
            Height = 63
            Action = Action_Weight_on_off
            Glyph.Data = {
              364B0000424D364B000000000000360000002800000050000000500000000100
              180000000000004B0000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FFFFF2FFFDF4FFFFFAFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAECEBD9BF
              C4CF8795BB576AAB4458A74352CA9BA4EEFCFAFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
              F4F4EED0D6E3A6B2D06A7DBC1D3BA5000FA40006AE0014B60124B8001BB50019
              CD687AFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFF6FFFFEFFAF8F2FFFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF6F3F4DA9BA7D8687DCE3956C2072AAE000B920000990015AA39
              50C18791E4B4BEF7DBE1F7E3E8C53851AF0000E5A6B2FDFFFFFFFFFFF3FBFAC6
              919BB9495EA92F45B64156C58F9BEDF6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF9FFFFEBE9E9D6B3BAD17888CE2848A200008F000086
              0014801429AD6C78C0A5AAD3D4D3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFD29CA7
              A60000DC8394FDFFFFCABCC0A532449D0000A90012A30522A1000D9600008A4A
              56ECF5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFC8CFCDA76F7ABF2844
              B900199D00008B000C843D4A8C797DBFC2C2DDE9E7FCFFFFFFFFFFFFFFFFFFFF
              FFFEF9FAFDF5F6FFFFFFFFFFFFCB8594A40000E8B0BAEDFFFDA82235A9000099
              2E42C6B8BBEEF0F0CE99A38E000B6D0012D2DBDAFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBFBF8DBCF
              D2D49DA7B95A6CA00925A20000A70010912539815D64ABB1B0F5FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFF9FBFFFFFFE7D5D8B7102B
              C61C36DDE1E1B45165AA0000A45162E2F2F0FCFFFFFFFFFFFFF2F79A0222770B
              1FDDE7E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF9FFFFBBC1C0A98A8FB34F62AA0222AC000B9B0003B00928BB4D62BBA1A6
              D8E8E5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFC6C8C79E2B42A60000D38D9CD08E9DA300009F3749DEEBE9FF
              FFFFFFFDFFFFFFFFE7C8CF980113832335F6FFFCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFBAC8C68780819160699109229D0000B60015A520
              37924956B19096E2DFE0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F8F49F9D9E82192CAB0000C97486
              DBB2BDBE0015991C2AC2C8C8FFFFFFFFFFFFFFFFFFFBF5F7AB3748770000AB9A
              9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECFAF89DAEAB6A333D8B
              0005A00000B10014B63850D8B2B9E4EDEBE8F9F6FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEFDFAA0AA
              A88E535D900013B40007CA6273D6B7BEC01B30AC1731CEC4CAFFFFFFFFFFFFFF
              FFFFFAFDFCCD46649E0000A8717CF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFB6C6C362494E750010AF0004C72846D37B8CDBB5BCF1FAF9FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFEDFBF8A7B6B27D5F65820015AB0000C40A2CC88695C7C3C9B4102A
              A80013C3C2C3F7FFFFFFFFFFFFFFFFFBFFFFAF808CAC0000B7253BF1FAFAFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFD9E4E3888F8E711F2F960000B1000FC25669E9
              E3E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FEFCBEC9C77D666A6F0114980000BD00
              1CDA6B80DBCFD39592969B1122B7000FD396A5F2FFFFFFFFFFFFFFFFFFFFFFB2
              B7B78D091EB00000A5616FFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9999D9C9C
              A6A49996979A9596898E8C676A6ABAB9B9FFFFFFFFFFFFFFFFFF98A8A533282A
              79000ABA000CCB3E57D3B4BAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8EBEAC69BA3AD
              4D5F8500199D0001BF0020CC5B6EEBCAD0FDFFFFA7A6AA94000FAF000AD19AA6
              FFFFFFFFFFFFFFFFFFFFFFFFE3EEEC852437BB0006AC1A38CECCCCFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF686F6E0C0305331A1E440E19390C150A0C0C000000474A
              49FFFFFFFFFFFFB6C8C5221B1D750000C30016CF7A89F4F6F6FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFD3BABFAA364C9E000DA50007BF0427D34B64E5BCC4F7FFFFF4FF
              FFB6ADAF9C091FAC0001A76676FCFFFFFFFFFFFFFFFFFFFFFFFDFFFFAD7782B2
              000BB70014C499A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B9B739242844192189
              1429B3001F5F232E591F292A0000233633BBCCC8697F7B3B1D248E0007C1001A
              D08C9AFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF1F2CB7283B20016A20000A7122FC7
              7384E8C7CCFFFFFFFFFFFFB1BCBA8B5960AD001BAB0002995261E3F3F0FFFFFF
              FFFFFFFFFFFFFFFFFFCEBFC2AB011FBA000A9F4C5EF5FFFEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFEDF0EF4D4B4C3C0009902D40B61A38D80027D00E338E132B2A050A2D0C
              13531621520006980001C20121CC929FFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D3D7
              C04055A90000A00420B87F89DACED1F7FFFFFFFFFFFFFFFFB1B2B2871929A500
              00B10424B57F8BE5F3F0FFFFFFFFFFFFFFFFFFFFFFFFEEF8F7A92F47C0000786
              182CC5D1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
              FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCED6D44E323760091AC0082BCE
              0027C2062ADC012B870A22600A1B7E0012A00006B90010C3354CDDB8C1FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF1D6DABB19359D0000792B35BEC3C2FFFFFFFFFFFFFF
              FFFFE2F3F0A27D85910013B00004B4445AE0DADCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF3FFFDB45D6EC4000A8E0013969999FEFFFFFFFFFFFFFFFFFFFFFFFAEA
              EDF7DBE1F3D6DBEBEAEAFAFFFFFFFFFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFCED7D6654048790D22BB0A2CC90329C60529CE082D7816296D071A730C
              1F823A47BC7C87EFEBEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9FAC8546AB3000A
              9A505DC2D7D4FFFFFFFFFFFFF3FFFF9C999983303EA30008A90008B06674EBF6
              F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECFAF8A86875B400109600026A4D55E3
              FAF6FFFFFFF7FEFDE3B5BED86077D22E4ECA1739B801238E1329BA6C7BF1EBEC
              FFFFFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF8F695656F7D051AAE0F2CCB
              0228C70429C20D2F6923327000107F3744E0F7F3FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF9F5F5C13B54A10003B09199FFFFFFE4F7F4BEB8BA974B5A87
              0000B10005B51431986D76E5F9F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFF
              B16373A500009D000C8D6D75DAFFF8FFFFFFEEBDC6C33851B50013A200098D13
              2A9E3B4EBF5B6DCF4A63BB0014BF3D55F6F3F4FFFFFFFEFEFEFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF6FEFC8A6C725A0415AF0D2BCB0228B91030C20C2F8B152D75000D7545
              4FF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7B7C0B50015
              950419CAA3AABB818D8D000CAF0008BD1836BF6778E0D1D5F4FFFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFEFF3F2C56B7DB80012B03344C5C1C3F2EDEFEE97A7CD
              2E4CB90124A7011FB63D54C9A3AAD3DEDBE8F8F4FDFFFFF0B9C4C70D30BE0C2E
              F3EBEDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FCFA8C686F810018BD0629B5
              1533AA1D38CB0228B8092A6C000B332325D9E1E0FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFDD9BAABF0E29B7001DBB001FC4213DD7909DEC
              EBECF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCD1D09C3244B6000C
              7D0616AB9BA0E38D9DBB0B25AD0012C55167E1AEB7DEDADAF2FDFBFFFFFFFFFF
              FFFFFFFFFFFAFBD86E84B40013D07384FDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFECF5F375585D710112BC0829B81432C1082BB61130A6213B6500083132
              31E6EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F1D1D9EBACB8ECB6C0F1E3E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFE5E9E89F2E43B00008970014760017AB001CAF0010AB384CD5BBC0FC
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFDD8E8E6AC747F98000DA91631F0E0E3
              FEFFFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F14C5452070305AF0A29C6
              0C2EB11735B31433B415336E00106C6B6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D1D5B3364DB4000C940019A91F39
              C71335AE344ACCAEB4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFED2D0D08567
              6C770D208E000CAC4C56E9E1E3FFFFFFFBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF5F9F96D7170590514C00528C10B2EAF1B37C20E30B20829790012663F
              47EBF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFCFB5
              BBBB1F3BB900086D000F84777AF2D5DAF2CFD5EAEFEEFFFFFFFFFFFFFFFFFFFF
              FFFFF1CAD2DEAAB4AC66738D0D248E0014AB1935CE8D99FAFFFFFFFFFFFEFEFE
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFF888C8C591622BC0528B9
              1433B61433B81736992138900016662935DCEBE8FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFF1FFFE9C848BA6001B9900004A010D7E8383F4FFFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFE6DDDFD1798ABE0122AA001C9E1731A34758CEA0
              A9EDEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFA6AEAD343E3BAD0425BB1434C40529C70126C7072BA500118552
              5BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFA48F9486000D7C00
              0151333995A5A2FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F8F6BA8B94B31F38B2
              0013A51A2DD4B3BAD5DDDCEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFC
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFD7C838240171FB90628B5
              1B38BB0F2FC90429AD1330920017905560FBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFCFFFFB0959B9B0119690001615F60E8FBF8FFFFFFFFFFFFF8FFFFEDFDFA
              DAE3E2C0A0A6AD384EB10005B7000894000DB33E55C164769C4F5EB96474BB6C
              7AB762739B3D4E8B4652A48D91EBF0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF8FCFC6F78766B0418D10025B21C38A6273FB91B399420368300164D19
              24CCD9D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E3E18873788E0118640004505555E3FA
              F6FFFFFFCAD4D2ADB0B07E76778258609E263DA7000AB40010C42140C13751BB
              3E56CB2947B20728A71B35B82340C43A54C32946BF314BAA243E860008CA97A1
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949796192E2C7E2839CF
              0229BE0B2DBD0E2FC8052A890011432A2FDBE4E2FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCD9D75B
              2F36890008AB00136F0D2099505DCA7585903E4E58031380000B8D00009D0000
              BB001CC4586CDBB5BCF1EEF0F9FEFDFCFFFFFCF7F8F5F0F2FEFFFFFFFFFFF7FF
              FFF2F4F4FBFFFFD07A8AA700007A1B2CE4F0EEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFAFEFD7E797A3F0F165E3D45BB1937CA0024C50429C7062B84000C6F57
              5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFE4F0EE9048567F0000750005A20E2BAD2640911A30911A
              30911A31A12A41C63D56D75069D3677CE8BFC6FFFFFFFFFFFFFFFFFFFFFFFFFD
              FFFFF3FFFFEEF6F4EED2D8DB94A1B04B5D99304499193290000B8A2332A19698
              F6FAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFE8B888848161D70303CC0
              1333C50328C90328BD092B9701168A3F4DCACBCBC9C2C4C9C3C4CDD2D1CFD8D7
              C2CAC9C1C9C8C6D0CECAD7D4D0DDDBD1DFDDD1DEDCD0DDDBD3E0DED9E6E4E4F1
              EFF7FFFFFBFFFFFAFFFFFAFFFFFCFFFFFFFFFFEDFCF9A8B7B4913A4A9400076B
              2F398FADA8E2EAE9EFF3F2E9F5F2F0FEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F9FFFFF4FFFFEAEEEECECCCC948D8E764851A2293FB00625B000189A000A9126
              3AB76877D08895C09FA5E0E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF9D999A3F1921761E30DF0026CE052BD80026C705298E0A249707
              229A0823A30020A003208A0E257E102577071C79071D7A0C2171122471182973
              1A2B741A2C741A2B792030852B3C9A4051BC6475BF6E7CBB6E7DBA717EB57D87
              A18C907F5A606A051897000895000EA04A5BD6AFB6D9DCDBC5D2D0B5BDBBB9BC
              BCBEBDBDBAB9B9C2C7C6B3B0B0D3BDC0C78B96BE60729D18329000118A000199
              0000B9001BCF4761CB818FC6ACB1DEE9E7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8C8C4800087214258B
              22366E26347A25367224337A031A9F03208C102797001985001466001468071A
              5D000D59000B61000E76001583061D80051C7F041B7F021A7900156D00095E00
              005F00009A0000BC000EB8000DB400069200006E0000860013AC102DBE1334B9
              001DA000059500198600197800027C00008300008800059900188B0005A60016
              A70007AD001ABF2542C23D57D55F75E38798E1C2C8F5FFFFFEFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFBEC7C6301117700006740C1F33202448222A5C2F38410D168C65
              6DCCD6D4BBB6B6A6A8A8A3B3B0B3C2BF9BA9A794A3A09CAAA7AFB2B1C4C1C1C4
              C2C2C4C2C2C2BFC0B5B3B39E9D9D7C7F7F6866669F384BC40024C20429C61A3A
              B2394F836167A79FA1EDC0C9F4BFC9DA8B99CE3D59CB2141C11333D82E4ED236
              53BF324CD74B66D74E67C85066DB8596D9AAB2D7C4C7F1E8EAF5F7F7FDFFFFFF
              FFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6939292746A6C99
              9091A7A6A6AEACACC2BEBEAAB2B1DBE5E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF6F3F3EABCC5ECC6CDEFE6E8F5FFFDFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFCF0F3F2CED5EEC7CFF9E5E9F6F6F6ECF2F1FBFFFFFFFFFFFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF6FDFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object BB_naveski_add: TBitBtn
            Left = 174
            Top = 6
            Width = 88
            Height = 52
            Action = Action_Naveski_Add
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object DBEditPRICE_TMP: TDBEdit
            Left = 149
            Top = 84
            Width = 108
            Height = 27
            DataField = 'PRICE_TMP'
            DataSource = DM1.DSPrice
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnExit = DBEditPRICE_TMPExit
            OnKeyPress = EWeightKeyPress
          end
        end
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 586
          Height = 74
          Align = alTop
          TabOrder = 3
          object BBPay: TBitBtn
            Left = 4
            Top = 3
            Width = 206
            Height = 65
            Action = Action_Pay
            Caption = #1055#1088#1080#1085#1103#1090#1100' '#1086#1087#1083#1072#1090#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object BBPrint_Cash_Receipt: TBitBtn
            Left = 479
            Top = 6
            Width = 98
            Height = 62
            Action = Action_Print_Cash_Receipt
            Caption = #1063#1077#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Panel10: TPanel
            Left = 4
            Top = 7
            Width = 141
            Height = 61
            TabOrder = 2
            Visible = False
            object Label10: TLabel
              Left = 6
              Top = 9
              Width = 29
              Height = 16
              Caption = #1044#1072#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Left = 6
              Top = 36
              Width = 15
              Height = 16
              Caption = #8470
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DT_Date_doc: TDateTimePicker
              Left = 38
              Top = 4
              Width = 96
              Height = 24
              Date = 38575.000000000000000000
              Time = 38575.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = DT_Date_docExit
            end
            object DT_Time_doc: TDateTimePicker
              Left = 51
              Top = 34
              Width = 90
              Height = 21
              Date = 38575.000000000000000000
              Time = 38575.000000000000000000
              Kind = dtkTime
              TabOrder = 1
              Visible = False
            end
            object EN: TEdit
              Left = 38
              Top = 31
              Width = 96
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = ENExit
            end
          end
          object BBBonusCard: TBitBtn
            Left = 213
            Top = 5
            Width = 122
            Height = 63
            Action = Action_BonusCard
            Caption = #1041#1086#1085#1091#1089#1085#1072#1103' '#1082#1072#1088#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object BBClose: TBitBtn
            Left = 387
            Top = 3
            Width = 119
            Height = 45
            Action = Action_Close
            Caption = #1047#1072#1082#1088#1099#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Kind = bkClose
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object GroupBoxCLI_SELECT: TGroupBox
            Left = 151
            Top = 6
            Width = 290
            Height = 62
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object ECLI_ContrAgent: TEdit
              Left = 6
              Top = 17
              Width = 211
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object BBSel_CLI_ContrAgent: TBitBtn
              Left = 237
              Top = 9
              Width = 50
              Height = 50
              Hint = #1042#1099#1073#1086#1088' '#1082#1088#1077#1076#1080#1090#1086#1088#1072' - Ctrl-F2'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
                BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
                BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
                BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
                BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
                EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
                EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
                EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
                EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBSel_CLI_ContrAgentClick
            end
            object CB_AllPriceList: TCheckBox
              Left = 16
              Top = 42
              Width = 193
              Height = 17
              Caption = #1054#1073#1097#1080#1081' '#1089#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
              TabOrder = 2
              OnClick = CB_AllPriceListClick
            end
          end
        end
        object Panel_Oplata: TPanel
          Left = 29
          Top = 126
          Width = 580
          Height = 340
          TabOrder = 4
          object Label2: TLabel
            Left = 17
            Top = 0
            Width = 107
            Height = 19
            Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1095#1077#1082#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 16
            Top = 230
            Width = 160
            Height = 19
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1085#1072#1083#1080#1095#1085#1099#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 242
            Top = 232
            Width = 44
            Height = 19
            Caption = #1057#1076#1072#1095#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 110
            Top = 59
            Width = 128
            Height = 19
            Caption = #1054#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 8
            Top = 89
            Width = 560
            Height = 7
          end
          object Label8: TLabel
            Left = 8
            Top = 120
            Width = 199
            Height = 19
            Caption = #1050' '#1086#1087#1083#1072#1090#1077' '#1089' '#1091#1095#1077#1090#1086#1084' '#1073#1086#1085#1091#1089#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label_already_paid_credit_card: TLabel
            Left = 17
            Top = 303
            Width = 359
            Height = 19
            Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1095#1077#1082#1091' '#1091#1078#1077' '#1086#1087#1083#1072#1095#1077#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 425
            Top = 7
            Width = 66
            Height = 19
            Caption = #1050' '#1086#1087#1083#1072#1090#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label20: TLabel
            Left = 139
            Top = 28
            Width = 87
            Height = 19
            Caption = #1054#1082#1088#1091#1075#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 401
            Top = 230
            Width = 112
            Height = 19
            Caption = #1057#1076#1072#1095#1072' '#1085#1072' '#1082#1072#1088#1090#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Bevel2: TBevel
            Left = 8
            Top = 220
            Width = 560
            Height = 7
          end
          object Label_Opl_Bank: TLabel
            Left = 8
            Top = 196
            Width = 132
            Height = 19
            Caption = 'Label_Opl_Bank'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object E_OPL_NAL: TEdit
            Left = 16
            Top = 255
            Width = 153
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'E_OPL_NAL'
            OnChange = E_OPL_NALChange
            OnClick = E_OPL_NALClick
            OnKeyPress = E_OPL_NALKeyPress
          end
          object E_TOT_SUM: TEdit
            Left = 18
            Top = 24
            Width = 102
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = 'E_TOT_SUM'
          end
          object E_SDACHA: TEdit
            Left = 238
            Top = 255
            Width = 123
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = 'E_SDACHA'
          end
          object E_OPL_BONUS: TEdit
            Left = 244
            Top = 56
            Width = 102
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            Text = 'E_OPL_BONUS'
            OnChange = E_OPL_BONUSChange
            OnClick = E_OPL_BONUSClick
            OnExit = E_OPL_BONUSExit
            OnKeyPress = E_OPL_NALKeyPress
          end
          object BB_OPL_BONUS: TBitBtn
            Left = 352
            Top = 36
            Width = 193
            Height = 47
            Action = Action_Opl_Bonus
            Caption = #1055#1083#1072#1090#1080#1090#1100' '#1073#1086#1085#1091#1089#1072#1084#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object BB_Pay_Bank_Not_Fiscal: TBitBtn
            Left = 352
            Top = 100
            Width = 193
            Height = 44
            Action = Action_Opl_Bank_Card
            Caption = #1054#1087#1083#1072#1090#1072' '#1073#1072#1085#1082' '#1082#1072#1088#1090#1086#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object E_TOT_MONEY: TEdit
            Left = 213
            Top = 111
            Width = 96
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            Text = 'E_TOT_MONEY'
          end
          object E_TOT_NOT_FISCAL_SUM: TEdit
            Left = 409
            Top = 27
            Width = 97
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            Text = 'E_TOT_SUM'
            Visible = False
          end
          object E_D_RoundNotFiscal: TEdit
            Left = 243
            Top = 23
            Width = 103
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            Text = 'E_D_RoundNotFiscal'
          end
          object E_SDACHA_TO_BONUS_CARD: TEdit
            Left = 402
            Top = 255
            Width = 111
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Text = 'E_SDACHA_TO_BONUS_CARD'
            OnChange = E_SDACHA_TO_BONUS_CARDChange
            OnKeyPress = E_OPL_NALKeyPress
          end
          object BB_InpOplBank: TBitBtn
            Left = 352
            Top = 150
            Width = 193
            Height = 44
            Hint = #1056#1091#1095#1085#1086#1081' '#1074#1074#1086#1076' '#1086#1087#1083#1072#1090#1099' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
            Caption = #1056#1091#1095#1085#1086#1081' '#1074#1074#1086#1076' '#1086#1087#1083#1072#1090#1099' '#1073#1072#1085#1082#1086#1084
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnClick = BB_InpOplBankClick
          end
          object BB_WithoutOplaty: TBitBtn
            Left = 400
            Top = 292
            Width = 145
            Height = 45
            Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1086#1087#1083#1072#1090#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            Visible = False
            OnClick = BB_WithoutOplatyClick
          end
        end
        object Panel_Reg_BonusCard: TPanel
          Left = 136
          Top = 411
          Width = 564
          Height = 314
          TabOrder = 5
          object L_ShtrihCode: TLabel
            Left = 8
            Top = 20
            Width = 97
            Height = 25
            Caption = #1064#1090#1088#1080#1093#1082#1086#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 6
            Top = 56
            Width = 180
            Height = 25
            Caption = #1060'.'#1048'.'#1054'. '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 8
            Top = 102
            Width = 85
            Height = 25
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 127
            Top = 102
            Width = 53
            Height = 25
            Caption = '(+38)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 8
            Top = 148
            Width = 151
            Height = 25
            Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 8
            Top = 189
            Width = 60
            Height = 25
            Caption = 'E_Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object E_INN: TEdit
            Left = 192
            Top = 8
            Width = 337
            Height = 33
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'E_INN'
            OnClick = E_INNClick
          end
          object E_Cli: TEdit
            Left = 192
            Top = 53
            Width = 337
            Height = 33
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'E_Cli'
            OnClick = E_CliClick
          end
          object E_Tel: TEdit
            Left = 192
            Top = 99
            Width = 337
            Height = 33
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'E_Tel'
            OnClick = E_TelClick
          end
          object DTP_Birthday: TDateTimePicker
            Left = 192
            Top = 143
            Width = 337
            Height = 33
            Date = 43791.000000000000000000
            Time = 43791.000000000000000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = DTP_BirthdayClick
          end
          object E_Email: TEdit
            Left = 192
            Top = 186
            Width = 337
            Height = 33
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Text = 'E_Email'
            OnClick = E_EmailClick
          end
          object BB_CancelBonusCard_Info: TBitBtn
            Left = 355
            Top = 239
            Width = 150
            Height = 64
            Cancel = True
            Caption = #1057#1073#1088#1086#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033338833333333333333333F333333333333
              0000333911833333983333333388F333333F3333000033391118333911833333
              38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003333
              9118333911183333338F33838F338F33000033333913333391113333338FF833
              38F338F300003333333333333919333333388333338FFF830000333333333333
              3333333333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 5
            OnClick = BB_CancelBonusCard_InfoClick
          end
          object BitBtn2: TBitBtn
            Left = 21
            Top = 243
            Width = 160
            Height = 64
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnClick = BB_SaveBonusCard_InfoClick
          end
        end
      end
      object Panel12: TPanel
        Left = 1
        Top = 428
        Width = 588
        Height = 334
        Align = alClient
        TabOrder = 1
        object TouchKeyboard1: TTouchKeyboard
          Left = 1
          Top = 153
          Width = 586
          Height = 180
          Align = alClient
          Color = clBtnFace
          GradientEnd = clWhite
          GradientStart = clWhite
          Layout = 'Standard'
          ParentColor = False
        end
        object PanelBankTerm: TPanel
          Left = 1
          Top = 1
          Width = 586
          Height = 152
          Align = alTop
          TabOrder = 1
          object Panel16: TPanel
            Left = 1
            Top = 1
            Width = 112
            Height = 150
            Align = alLeft
            TabOrder = 0
            object BB_NUM_LK: TBitBtn
              Left = 4
              Top = 6
              Width = 97
              Height = 29
              Caption = #1050#1083#1072#1074#1080#1072#1090#1091#1088#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = BB_NUM_LKClick
            end
          end
          object Panel18: TPanel
            Left = 113
            Top = 1
            Width = 472
            Height = 150
            Align = alClient
            TabOrder = 1
            object Memo1: TMemo
              Left = 1
              Top = 1
              Width = 470
              Height = 148
              Align = alClient
              Lines.Strings = (
                'Memo1')
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 24
    Top = 456
  end
  object ActionListSaleDoc: TActionList
    Left = 163
    Top = 185
    object Action_Print_Cash_Receipt: TAction
      Category = 'Buttons'
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1072#1089#1089#1086#1074#1086#1075#1086' '#1095#1077#1082#1072
      OnExecute = Action_Print_Cash_ReceiptExecute
    end
    object Action_Pay: TAction
      Category = 'Buttons'
      Caption = #1055#1088#1080#1085#1103#1090#1100' '#1086#1087#1083#1072#1090#1091
      OnExecute = Action_PayExecute
    end
    object Action_New_Doc: TAction
      Category = 'Buttons'
      Caption = #1053#1086#1074#1099#1081' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1100
      OnExecute = Action_New_DocExecute
    end
    object Action_Close: TAction
      Category = 'Buttons'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = Action_CloseExecute
    end
    object Action_BonusCard: TAction
      Category = 'Buttons'
      Caption = #1041#1086#1085#1091#1089#1085#1072#1103' '#1082#1072#1088#1090#1072
      OnExecute = Action_BonusCardExecute
    end
    object Action_Naveski_Add: TAction
      Category = 'Buttons'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1074#1077#1089#1082#1091
      OnExecute = Action_Naveski_AddExecute
    end
    object Action_Naveski_Delete: TAction
      Category = 'Buttons'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1074#1077#1089#1082#1091
      OnExecute = Action_Naveski_DeleteExecute
    end
    object Action_Weight_on_off: TAction
      Category = 'Buttons'
      OnExecute = Action_Weight_on_offExecute
    end
    object Action_Opl_Bonus: TAction
      Category = 'Buttons'
      OnExecute = Action_Opl_BonusExecute
    end
    object Action_Opl_Bank_Card: TAction
      Category = 'Buttons'
      Caption = #1054#1087#1083#1072#1090#1072' '#1073#1072#1085#1082' '#1082#1072#1088#1090#1086#1081' '#1085#1077' '#1092#1080#1089#1082
      OnExecute = Action_Opl_Bank_CardExecute
    end
    object ActionNacenka: TAction
      Category = 'Buttons'
      Caption = #1053#1072#1094#1077#1085#1080#1090#1100
      OnExecute = ActionNacenkaExecute
    end
    object Action_OplBank_Card_Fiscal: TAction
      Category = 'Buttons'
      Caption = #1054#1087#1083#1072#1090#1072' '#1073#1072#1085#1082' '#1082#1072#1088#1090#1086#1081'  '#1092#1080#1089#1082
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 521
    Top = 113
  end
  object GestureManager1: TGestureManager
    Left = 186
    Top = 122
  end
  object QDocPrototypeCaption: TADOQuery
    Connection = DM1.ADOConnection1
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
      '--use NMK_TP'
      
        'select NC.ID_CLIENT ID_CLI_D, CLD.CLIENT CLI_D, CLD.ID_KATEGOR I' +
        'D_KATEGOR_D, KD.KATEGOR KATEGOR_D,'
      ' CLD.INN INN_D,'
      
        'NC.ID_CLI_K ID_CLI_K, CLK.CLIENT CLI_K, CLK.ID_KATEGOR ID_KATEGO' +
        'R_K, KK.KATEGOR KATEGOR_K,'
      ' CLK.INN INN_K,'
      
        ' NC.TRANS_CODE_NOT_FISCAL, NC.TRANS_CODE_FISCAL, NC.[IS_CAN_REGI' +
        'STRED_RRO],'
      
        ' NC.[IS_REGISTER_RRO], NC.[ID_CLI_RRO],  NC.[CHECK_NUMLOCAL],  N' +
        'C.[CHECK_NUMFISCAL],  NC.[ORDERDATETIME],  NC.[QRCODE_REG]'
      ''
      ' from NAKLCAP NC'
      'inner join CLIENTS CLD on CLD.ID_CLIENTS=NC.ID_CLIENT'
      
        'left outer join [dbo].[KATEG_CLI] KD on KD.ID_KATEGOR=CLD.ID_KAT' +
        'EGOR'
      ''
      ''
      'inner join CLIENTS CLK on CLK.ID_CLIENTS=NC.ID_CLI_K'
      
        'left outer join [dbo].[KATEG_CLI] KK on KK.ID_KATEGOR=CLK.ID_KAT' +
        'EGOR'
      ''
      'where NC.[ID_NAKLCAP]= :ID_NAKLCAP'
      '')
    Left = 539
    Top = 377
  end
  object QDocPrototype_Tov: TADOQuery
    Connection = DM1.ADOConnection1
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
      
        'select [ID_TOV], [PRICE], [NUMB] from [dbo].[NAKLTOV] where [ID_' +
        'NAKLCAP]=:ID_NAKLCAP'
      '')
    Left = 539
    Top = 433
  end
  object SP_SET_PRICE_FROM_PROTOTYPE: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'SET_PRICE_FROM_PROTOTYPE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NAKLCAP'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IN_TRANSACTION'
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
    Left = 395
    Top = 401
  end
  object QSkidkaNow: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'INN'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'is_carte_Kharkov'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      
        'declare @ID_CLI int, @ID_CLI_not_reg int, @INN nvarchar(20), @is' +
        '_carte_Kharkov int'
      'declare @D datetime, @D_BIRTHDAY datetime'
      ''
      ' set @INN=:INN'
      ' set @is_carte_Kharkov=:is_carte_Kharkov'
      ''
      '--set @INN='#39'2019000041515'#39
      '--set @INN=null'
      '--set @D=getdate()'
      'set @D=:D'
      ''
      'set @ID_CLI_not_reg=4098'
      'set @ID_CLI=@ID_CLI_not_reg'
      ''
      'set @D_BIRTHDAY=0'
      'set @ID_CLI=@ID_CLI_not_reg'
      ''
      'declare @REC_COUNT int'
      'set @REC_COUNT=0'
      ''
      
        'select @REC_COUNT=COUNT(*) from [dbo].[CLIENTS] CL where CL.[INN' +
        ']=@INN or  CL.TEL=@INN'
      'if @REC_COUNT<>0'
      'begin'
      #9'if @INN<>'#39#39
      #9'begin'
      
        #9#9'select   @ID_CLI=CL.[ID_CLIENTS], @D_BIRTHDAY=ISNULL(CL.[BIRTH' +
        'DAY], 0.0)'
      #9#9'from [dbo].[CLIENTS] CL'
      #9#9'where CL.[INN]=@INN  or  CL.TEL=@INN'
      #9'end;'
      'end;'
      ''
      ''
      ''
      
        ' declare @month_BIRTHDAY int, @day_BIRTHDAY int, @month_now int,' +
        ' @day_now int'
      ''
      ' set @month_now=month(@D)'
      ' set @day_now=day(@D)'
      ' set @month_BIRTHDAY=month(@D_BIRTHDAY)'
      ' set @day_BIRTHDAY=day(@D_BIRTHDAY)'
      ''
      ''
      
        'create table #skid (ID_SKIDKA int, S_PER_SKIDKA float, IS_NAMED ' +
        'int)'
      ''
      'if  @ID_CLI<>@ID_CLI_not_reg'
      'begin'
      '-- '#1076#1083#1103' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1093
      #9'insert into #skid (ID_SKIDKA, S_PER_SKIDKA, IS_NAMED)'
      
        #9'select  [ID_SKIDKA], [PER_SKIDKA_KOLBASA]+[PER_SKIDKA_MYASO]+[P' +
        'ER_SKIDKA_TNP] , [IS_NAMED] from [dbo].[SKIDKA_POS]'
      #9'where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] in (0,3)'
      
        '  and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_FR' +
        'OM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        #9'and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO))>' +
        '=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      ''
      #9'set @REC_COUNT=0'
      
        #9'select @REC_COUNT=COUNT(*) from [dbo].[KUPON_CARD] where [ID_KU' +
        'PON]=@INN'
      #9'if @REC_COUNT>0  -- '#1082#1091#1087#1086#1085#1085#1072#1103' '#1082#1072#1088#1090#1072
      #9'begin'
      #9#9'-- '#1082#1091#1087#1086#1085#1085#1099#1077' '#1089#1082#1080#1076#1082#1080
      #9#9'insert into #skid (ID_SKIDKA, S_PER_SKIDKA, IS_NAMED)'
      
        #9#9'select  [ID_SKIDKA], [PER_SKIDKA_KOLBASA]+[PER_SKIDKA_MYASO]+[' +
        'PER_SKIDKA_TNP] , [IS_NAMED] from [dbo].[SKIDKA_POS]'
      #9#9'where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] in (5)'
      
        #9'  and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_F' +
        'ROM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        #9#9'and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO))' +
        '>=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      #9'end;'
      
        #9'if (@month_now=@month_BIRTHDAY) and (@day_now=@day_BIRTHDAY) --' +
        ' '#1089#1077#1075#1086#1076#1085#1103' '#1076#1077#1085#1100' '#1088#1086#1078#1076' '#1087#1086#1082#1091#1087
      #9'begin'
      #9#9'insert into #skid (ID_SKIDKA, S_PER_SKIDKA, IS_NAMED)'
      
        #9#9'select  [ID_SKIDKA], [PER_SKIDKA_KOLBASA]+[PER_SKIDKA_MYASO]+[' +
        'PER_SKIDKA_TNP] , [IS_NAMED] from [dbo].[SKIDKA_POS]'
      #9#9'where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] in (1)'
      
        '    and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_' +
        'FROM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        #9'  and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO)' +
        ')>=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      #9'end;'
      'end'
      ''
      'else'
      'begin'
      '-- '#1076#1083#1103' '#1085#1077#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1093
      #9'insert into #skid (ID_SKIDKA, S_PER_SKIDKA, IS_NAMED)'
      
        #9'select  [ID_SKIDKA], [PER_SKIDKA_KOLBASA]+[PER_SKIDKA_MYASO]+[P' +
        'ER_SKIDKA_TNP] , [IS_NAMED] from [dbo].[SKIDKA_POS]'
      #9'where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] in (0)'
      
        '  and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_FR' +
        'OM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        #9'and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO))>' +
        '=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      ''
      '  if @is_carte_Kharkov=1'
      '  begin'
      '  -- '#1076#1083#1103' '#1082#1072#1088#1090#1099' '#1093#1072#1088#1100#1082#1086#1074#1095#1072#1085#1080#1085#1072
      '    insert into #skid (ID_SKIDKA, S_PER_SKIDKA, IS_NAMED)'
      
        '    select  [ID_SKIDKA], [PER_SKIDKA_KOLBASA]+[PER_SKIDKA_MYASO]' +
        '+[PER_SKIDKA_TNP] , [IS_NAMED] from [dbo].[SKIDKA_POS]'
      '    where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] in (6)'
      
        '    and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_' +
        'FROM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        '    and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO' +
        '))>=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      '  end;'
      ''
      'end;'
      ''
      ''
      'select   [ID_SKIDKA],'
      '[PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],'
      
        ' [COMMENT], [D_FROM], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN_T' +
        'NP], [IS_NAMED] from [dbo].[SKIDKA_POS]'
      
        #9#9'where [ID_SKIDKA]=(select top 1 ID_SKIDKA from #skid order by ' +
        'S_PER_SKIDKA desc)'
      ''
      '-- use NMK_TP'
      'drop table #skid'
      ''
      ''
      ''
      '')
    Left = 251
    Top = 385
    object QSkidkaNowID_SKIDKA: TIntegerField
      FieldName = 'ID_SKIDKA'
    end
    object QSkidkaNowPER_SKIDKA_KOLBASA: TFloatField
      FieldName = 'PER_SKIDKA_KOLBASA'
    end
    object QSkidkaNowPER_SKIDKA_MYASO: TFloatField
      FieldName = 'PER_SKIDKA_MYASO'
    end
    object QSkidkaNowPER_SKIDKA_TNP: TFloatField
      FieldName = 'PER_SKIDKA_TNP'
    end
    object QSkidkaNowCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      Size = 255
    end
    object QSkidkaNowD_FROM: TDateTimeField
      FieldName = 'D_FROM'
    end
    object QSkidkaNowD_TO: TDateTimeField
      FieldName = 'D_TO'
    end
    object QSkidkaNowMIN_KOLBASA: TFloatField
      FieldName = 'MIN_KOLBASA'
    end
    object QSkidkaNowMIN_MYASO: TFloatField
      FieldName = 'MIN_MYASO'
    end
    object QSkidkaNowMIN_TNP: TFloatField
      FieldName = 'MIN_TNP'
    end
    object QSkidkaNowIS_NAMED: TIntegerField
      FieldName = 'IS_NAMED'
    end
  end
  object QSkidkaDocEdit: TADOQuery
    Connection = DM1.ADOConnection1
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
      'select [SKIDKA_KOLBASA], [SKIDKA_MYASO], [SKIDKA_TNP], '
      '[PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],'
      '[SKIDKA_COMMENT], [MIN_KOLBASA], [MIN_MYASO], [MIN_TNP]'
      'from [dbo].[NAKLCAP] where ID_NAKLCAP=:ID_NAKLCAP'
      ''
      '')
    Left = 251
    Top = 441
  end
  object QBonus_Cli: TADOQuery
    Connection = DM1.ADOConnection1
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
      'declare @ID_CLI int'
      'set @ID_CLI = :ID_CLI'
      'select B.[SUM_BALL] from [dbo].[BONUSES] B'
      'where B.[ID_CLI]= @ID_CLI'
      ''
      '')
    Left = 387
    Top = 505
  end
  object QBonusPercent: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'IS_PENSIONER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @D datetime, @IS_PENSIONER int'
      'set @D=:D'
      'set @IS_PENSIONER=:IS_PENSIONER'
      ''
      'if @IS_PENSIONER=0'
      'begin'
      '  select TOP 1 [ID_SKIDKA],'
      '  [PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],'
      
        '   [COMMENT], [D_FROM], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN' +
        '_TNP], [IS_NAMED] from [dbo].[SKIDKA_POS]'
      '  where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] =2'
      
        '    and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_' +
        'FROM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        '    and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO' +
        '))>=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      'end'
      'else'
      'begin'
      '  select TOP 1 [ID_SKIDKA],'
      '  [PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],'
      
        '   [COMMENT], [D_FROM], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN' +
        '_TNP], [IS_NAMED] from [dbo].[SKIDKA_POS]'
      '  where [D_FROM]<=@D and [D_TO]>=@D and [IS_NAMED] =4'
      
        '    and [DAY_TIME_FROM]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_' +
        'FROM))<=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        '    and [DAY_TIME_TO]-DATEADD(dd, 0, DATEDIFF(dd, 0, DAY_TIME_TO' +
        '))>=@D-DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      'end'
      ''
      ''
      '')
    Left = 227
    Top = 521
  end
  object ADS_SHTRIH_CODE_TOV_NEW: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select GT.GRUPTOV, T.NAME, T.EDIZM, SH.BARCODE, SH.ID_TOV, SH.[S' +
      'YMBOLS_WEIGHT_OF_BARCODE], SH.[WEIGHT_MULTIPLIER] '#13#10'from [dbo].[' +
      'SHTRIH_CODE_TOV_NEW_POS] SH'#13#10'inner join [dbo].[TOV] T on T.ID_TO' +
      'V=SH.ID_TOV'#13#10'inner join [dbo].[GRTOV] GT on GT.ID_GRTOV=T.ID_GRT' +
      'OV'#13#10'order by GT.GRUPTOV, T.NAME'
    Parameters = <>
    Left = 547
    Top = 508
    object ADS_SHTRIH_CODE_TOV_NEWGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 15
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object ADS_SHTRIH_CODE_TOV_NEWNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object ADS_SHTRIH_CODE_TOV_NEWEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      ReadOnly = True
      Size = 5
    end
    object ADS_SHTRIH_CODE_TOV_NEWID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TOV'
    end
    object ADS_SHTRIH_CODE_TOV_NEWBARCODE: TWideStringField
      DisplayLabel = #1064#1090#1088#1080#1093#1082#1086#1076
      DisplayWidth = 20
      FieldName = 'BARCODE'
      Size = 50
    end
    object ADS_SHTRIH_CODE_TOV_NEWSYMBOLS_WEIGHT_OF_BARCODE: TIntegerField
      DisplayLabel = #1050#1086#1083' '#1089#1080#1084#1074#1086#1083#1086#1074' '#1074#1077#1089#1072
      FieldName = 'SYMBOLS_WEIGHT_OF_BARCODE'
    end
    object ADS_SHTRIH_CODE_TOV_NEWWEIGHT_MULTIPLIER: TFloatField
      DisplayLabel = #1052#1085#1086#1078#1080#1090#1077#1083#1100' '#1074#1077#1089#1072
      FieldName = 'WEIGHT_MULTIPLIER'
    end
  end
  object DS_SHTRIH_CODE_TOV_NEW: TDataSource
    DataSet = ADS_SHTRIH_CODE_TOV_NEW
    Left = 627
    Top = 508
  end
  object SP_SHTRIH_CODE_TOV_ADD: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'SHTRIH_CODE_TOV_ADD;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CODE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@SYMBOLS_WEIGHT_OF_BARCODE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@WEIGHT_MULTIPLIER'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@BARCODE'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 50
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 255
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
    Left = 651
    Top = 417
  end
  object QGetGRTOV: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_GRTOV int'
      'set @ID_GRTOV=:ID_GRTOV'
      'select [GRUPTOV] from [dbo].[GRTOV] where [ID_GRTOV]=@ID_GRTOV'
      ''
      '')
    Left = 323
    Top = 569
  end
  object Q_PrinterSetup: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select [ID], [PRINTER_NAME], [PRINTER_INDEX], [IS_FISCAL] from [' +
        'dbo].[PRINTER_SETUP]')
    Left = 596
    Top = 282
  end
  object SP_CALC_DOC_FISCAL_TYPE_RESULT: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'CALC_DOC_FISCAL_TYPE_RESULT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDU'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@TOT_SUM_FISCAL'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@TOT_SUM_NOT_FISCAL'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
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
    Left = 707
    Top = 289
  end
  object ADOCommandInsertNOT_SAVED_DOC: TADOCommand
    CommandText = 
      'insert into [dbo].[NOT_SAVED_DOC]'#13#10'      ([ID_USER]'#13#10'      ,[ID_' +
      'DOC_TYPE]'#13#10'      ,[ID_CLI_D]'#13#10'      ,[ID_CLI_K] '#13#10#9'  ,[NN]'#13#10#9'  ,' +
      '[D])'#13#10'values(:ID_USER'#13#10'      ,:ID_DOC_TYPE'#13#10'      ,:ID_CLI_D'#13#10'  ' +
      '    ,:ID_CLI_K '#13#10#9'  ,:NN'#13#10#9'  ,:D)'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_DOC_TYPE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI_D'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI_K'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'D'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 83
    Top = 538
  end
  object ADOCommandDeleteNOT_SAVED_DOC: TADOCommand
    CommandText = 'delete [dbo].[NOT_SAVED_DOC] where [ID_USER]=:ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 123
    Top = 538
  end
  object ADS_NOT_SAVED_DOC: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select [ID_USER]'#13#10'      ,[ID_DOC_TYPE]'#13#10'      ,[ID_CLI_D]'#13#10'     ' +
      ' ,[ID_CLI_K] '#13#10#9'  ,[NN]'#13#10#9'  ,[D]'#13#10#9'  from  [dbo].[NOT_SAVED_DOC]' +
      ' where [ID_USER]=:ID_USER'
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 99
    Top = 500
  end
  object SP_CONTROL_ONE_FISCAL_GROUP: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'CONTROL_ONE_FISCAL_GROUP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_OK'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_ALCOGOL'
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
    Left = 643
    Top = 193
  end
  object Q_COUNT_CHECK_NAL_BEZNAL: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CLI_RRO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      
        'declare @COUNT_NAL_CHECK_DAY_PROD int,  -- '#1082#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1088#1086#1076#1072#1078#1080' ' +
        #1079#1072' '#1085#1072#1083#1080#1095#1082#1091' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1085#1103
      
        #9'@SUM_NAL_CHECK_DAY_PROD float,  -- '#1057#1091#1084#1084#1072' '#1095#1077#1082#1086#1074' '#1087#1088#1086#1076#1072#1078#1080' '#1079#1072' '#1085#1072#1083#1080#1095 +
        #1082#1091' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1085#1103
      
        '  @SUM_NAL_CHECK_DAY_PROD_REGISTR float,  -- '#1057#1091#1084#1084#1072' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074 +
        #1072#1085#1085#1099#1093' '#1095#1077#1082#1086#1074' '#1087#1088#1086#1076#1072#1078#1080' '#1079#1072' '#1085#1072#1083#1080#1095#1082#1091' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1085#1103
      
        '    @COUNT_BEZNAL_CHECK_DAY_PROD int,  -- '#1082#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074' '#1087#1088#1086#1076#1072#1078#1080' '#1087 +
        #1086' '#1073#1077#1079#1085#1072#1083#1091'  '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1085#1103
      
        #9'@SUM_BEZNAL_CHECK_DAY_PROD float,  -- '#1057#1091#1084#1084#1072' '#1095#1077#1082#1086#1074' '#1087#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1073#1077 +
        #1079#1085#1072#1083#1091'  '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1085#1103
      
        #9'@D_FROM datetime, @D_TO datetime, @D datetime, @ID_CLI_RRO int,' +
        ' @EPS float;'
      #9'set @EPS=0.001'
      ''
      #9'set @ID_CLI_RRO=:ID_CLI_RRO'
      #9'set @D=GETDATE();'
      ''
      #9'set @D_FROM=dateadd(day, datediff(day, 0, @D), 0)'
      '    set @D_TO=dateadd(day, datediff(day, 0, @D)+1, 0)'
      ''
      ''
      'select @COUNT_NAL_CHECK_DAY_PROD=count(*)'
      
        #9#9'from NAKLCAP where ID_DOC_TYPE=200 and IS_DELETE=0 and D>=@D_F' +
        'ROM and D<=@D_TO'
      
        #9#9'and ID_CLI_RRO=@ID_CLI_RRO and SUM_OPL_CARD<@EPS and IS_FINAL=' +
        '1'
      'select @SUM_NAL_CHECK_DAY_PROD=sum(TOT_SUM)'
      
        #9#9'from NAKLCAP where ID_DOC_TYPE=200 and IS_DELETE=0 and D>=@D_F' +
        'ROM and D<=@D_TO'
      
        #9#9'and ID_CLI_RRO=@ID_CLI_RRO and SUM_OPL_CARD<@EPS and IS_FINAL=' +
        '1'
      'select @SUM_NAL_CHECK_DAY_PROD_REGISTR=sum(TOT_SUM)'
      
        #9#9'from NAKLCAP where ID_DOC_TYPE=200 and IS_DELETE=0 and D>=@D_F' +
        'ROM and D<=@D_TO'
      #9#9'and ID_CLI_RRO=@ID_CLI_RRO and SUM_OPL_CARD<@EPS'
      '    and [IS_REGISTER_RRO]=1  and IS_FINAL=1'
      ''
      ''
      'select @COUNT_BEZNAL_CHECK_DAY_PROD=count(*)'
      
        #9#9'from NAKLCAP where ID_DOC_TYPE=200 and IS_DELETE=0 and D>=@D_F' +
        'ROM and D<=@D_TO'
      
        #9#9'and ID_CLI_RRO=@ID_CLI_RRO and SUM_OPL_CARD>@EPS  and IS_FINAL' +
        '=1'
      'select @SUM_BEZNAL_CHECK_DAY_PROD=sum(TOT_SUM)'
      
        #9#9'from NAKLCAP where ID_DOC_TYPE=200 and IS_DELETE=0 and D>=@D_F' +
        'ROM and D<=@D_TO'
      
        #9#9'and ID_CLI_RRO=@ID_CLI_RRO and SUM_OPL_CARD>@EPS  and IS_FINAL' +
        '=1'
      ''
      ''
      
        'select @COUNT_NAL_CHECK_DAY_PROD as COUNT_NAL_CHECK_DAY_PROD, @S' +
        'UM_NAL_CHECK_DAY_PROD as SUM_NAL_CHECK_DAY_PROD,'
      
        '@SUM_NAL_CHECK_DAY_PROD_REGISTR as SUM_NAL_CHECK_DAY_PROD_REGIST' +
        'R,'
      
        #9#9'@COUNT_BEZNAL_CHECK_DAY_PROD as COUNT_BEZNAL_CHECK_DAY_PROD, @' +
        'SUM_BEZNAL_CHECK_DAY_PROD as SUM_BEZNAL_CHECK_DAY_PROD')
    Left = 72
    Top = 48
  end
  object Q_IS_NAL: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_NAKLCAP int, @EPS float, @SUM_OPL_CARD float;'
      'set @EPS=0.001'
      'set @ID_NAKLCAP =:ID_NAKLCAP'
      
        'set @SUM_OPL_CARD= isnull((select SUM_OPL_CARD from NAKLCAP wher' +
        'e ID_NAKLCAP=@ID_NAKLCAP), 0.0);'
      'if @SUM_OPL_CARD>@EPS'
      'begin'
      'select 0 as IS_NAL '
      'end'
      'else'
      'begin'
      'select 1 as IS_NAL '
      'end;')
    Left = 192
    Top = 32
  end
  object QRealizDay: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      'declare @D_From datetime'
      'declare @D_To datetime'
      'declare @D_From_Smena datetime'
      'declare @D_To_Smena datetime'
      'declare @D datetime'
      ''
      '--set @D='#39'06.04.2023 14:45:00'#39
      'set @D=:D;'
      ''
      'set @D_From=CAST(FLOOR(CAST(@D AS FLOAT)) AS DATETIME)'
      'set @D_To=DATEADD(second,-1, DATEADD(day,1,@D_From))'
      ''
      
        'set @D_From_Smena=isnull((select [D_START_SMENY] from [dbo].[D_S' +
        'TART_SMEN] where [IS_STARTED_SMENA]=1 ),@D_From)'
      'set @D_To_Smena=GETDATE()'
      ''
      ''
      ''
      ''
      ''
      
        'declare @S_REAL float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' '#1087#1088#1086#1076 +
        #1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072')'
      'declare @SUM_SDACHI_TO_CARD float'
      'declare @SUM_NAL float'
      'declare @SUM_VOZVR_NAL float'
      'declare @ZATRATY float'
      'declare @KASSA_INP float'
      'declare @KASSA_OUT float'
      
        'declare @S_REAL_RRO float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' ' +
        #1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072')'
      'declare @SUM_SDACHI_TO_CARD_RRO float'
      'declare @SUM_NAL_RRO float'
      'declare @SUM_VOZVR_NAL_RRO float'
      'declare @ZATRATY_RRO float'
      'declare @KASSA_INP_RRO float'
      'declare @KASSA_OUT_RRO float'
      ''
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1080#1090#1086#1075#1086
      'Set @S_REAL=0.0;'
      'Set @S_REAL_RRO=0.0;'
      ''
      ''
      ''
      ''
      #9'select @S_REAL_RRO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0)'
      #9'from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      ''
      ''
      #9'-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      #9'set @SUM_SDACHI_TO_CARD_RRO=0.0'
      
        #9'select @SUM_SDACHI_TO_CARD_RRO= isnull(SUM([SUM_SDACHI_TO_CARD]' +
        '),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_NAL_RRO=0.0'
      
        #9'select @SUM_NAL_RRO= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_' +
        'SDACHI_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_VOZVR_NAL_RRO=0.0'
      
        #9'select @SUM_VOZVR_NAL_RRO= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]' +
        '),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      #9'--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      #9'set @ZATRATY_RRO=0.0'
      
        #9'select @ZATRATY_RRO= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAK' +
        'LCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=222 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      #9'--'#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091' 289'
      #9'set @KASSA_INP_RRO=0.0'
      
        #9'select @KASSA_INP_RRO= isnull(SUM([TOT_SUM]),0.0) from [dbo].[N' +
        'AKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=289 and NC.IS_REGISTER_RRO =1  and NC.IS_' +
        'FINAL=1'
      ''
      ''
      #9'--'#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' 290'
      #9'set @KASSA_OUT_RRO=0.0'
      
        #9'select @KASSA_OUT_RRO= isnull(SUM([TOT_SUM]),0.0) from [dbo].[N' +
        'AKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From_Smena and NC.D_CREATE<=@D_To_Smena a' +
        'nd NC.IS_DELETE=0'
      
        '  and NC.[ID_DOC_TYPE]=290 and NC.IS_REGISTER_RRO =1   and NC.IS' +
        '_FINAL=1'
      ''
      ''
      ''
      ''
      'select @S_REAL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0)'
      #9'from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200'
      '  and NC.IS_REGISTER_RRO =0  and NC.IS_FINAL=1'
      ''
      ''
      ''
      ''
      #9'-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      #9'set @SUM_SDACHI_TO_CARD=0.0'
      
        #9'select @SUM_SDACHI_TO_CARD= isnull(SUM([SUM_SDACHI_TO_CARD]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200'
      '  and NC.IS_REGISTER_RRO =0    and NC.IS_FINAL=1'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_NAL=0.0'
      
        #9'select @SUM_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_SDAC' +
        'HI_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200'
      '  and NC.IS_REGISTER_RRO =0   and NC.IS_FINAL=1'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_VOZVR_NAL=0.0'
      
        #9'select @SUM_VOZVR_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204'
      '  and NC.IS_REGISTER_RRO =0   and NC.IS_FINAL=1'
      ''
      ''
      #9'--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      #9'set @ZATRATY=0.0'
      
        #9'select @ZATRATY= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLCAP' +
        '] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=222'
      '  and NC.IS_REGISTER_RRO =0   and NC.IS_FINAL=1'
      ''
      ''
      #9'--'#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091' 289'
      #9'set @KASSA_INP=0.0'
      
        #9'select @KASSA_INP= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=289'
      '  and NC.IS_REGISTER_RRO =0   and NC.IS_FINAL=1'
      ''
      ''
      #9'--'#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' 290'
      #9'set @KASSA_OUT=0.0'
      
        #9'select @KASSA_OUT= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=290'
      '  and NC.IS_REGISTER_RRO =0   and NC.IS_FINAL=1'
      ''
      ''
      ''
      'declare @S_REAL_ALL float'
      ''
      'select @S_REAL_ALL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0)'
      'from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200'
      '  and NC.IS_FINAL=1'
      ''
      ''
      'select @S_REAL as S_REAL, @S_REAL_RRO as S_REAL_RRO,'
      
        '@SUM_NAL-@SUM_VOZVR_NAL+@SUM_SDACHI_TO_CARD-@ZATRATY+@KASSA_INP-' +
        '@KASSA_OUT as SUM_KAS,'
      
        '@SUM_NAL_RRO-@SUM_VOZVR_NAL_RRO+@SUM_SDACHI_TO_CARD_RRO-@ZATRATY' +
        '_RRO+@KASSA_INP_RRO-@KASSA_OUT_RRO as SUM_KAS_RRO,'
      '@S_REAL_ALL as S_REAL_ALL,'
      '@SUM_NAL_RRO as SUM_NAL_RRO'
      ''
      '')
    Left = 66
    Top = 106
  end
  object ADOCommandEditLocalBonus: TADOCommand
    CommandText = 
      'declare @SUM_BALL float, @ID_CLI int'#13#10'set @SUM_BALL= :SUM_BALL'#13#10 +
      'set @ID_CLI= :ID_CLI'#13#10#13#10'update B set [SUM_BALL]=@SUM_BALL'#13#10'FROM ' +
      '[BONUSES] B'#13#10'where [ID_CLI]=@ID_CLI'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'SUM_BALL'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CLI'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 407
    Top = 586
  end
  object SP_SEARCH_TOV_FROM_BARCODE: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'SEARCH_TOV_FROM_BARCODE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@BARCODE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@NAME_TOV'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 255
        Value = Null
      end
      item
        Name = '@NUMB'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
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
    Left = 323
    Top = 73
  end
  object Q_IS_BONUS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_NAKLCAP int, @EPS float, @SUM_OPL_BONUS float;'
      'set @EPS=0.001'
      'set @ID_NAKLCAP =:ID_NAKLCAP'
      
        'set @SUM_OPL_BONUS= isnull((select SUM_OPL_BONUS from NAKLCAP wh' +
        'ere ID_NAKLCAP=@ID_NAKLCAP), 0.0);'
      'if @SUM_OPL_BONUS>@EPS'
      'begin'
      'select 1 as IS_BONUS'
      'end'
      'else'
      'begin'
      'select 0 as IS_BONUS'
      'end;')
    Left = 264
    Top = 32
  end
  object ADOCommandDeleteNotFinalDoc: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_NAKLCAP int, @ID_USER int'#13#10'set @ID_NAK' +
      'LCAP=:ID_NAKLCAP'#13#10'set @ID_USER=:ID_USER'#13#10'update NAKLCAP set IS_D' +
      'ELETE=1, [D_DELETE]=GETDATE(), [COMMENT_DEL]='#39#1057#1073#1088#1086#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39', ' +
      '[ID_USER_DEL]=@ID_USER  from NAKLCAP where ID_NAKLCAP=@ID_NAKLCA' +
      'P'
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 131
    Top = 610
  end
  object ADOCommandFinalDoc: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_NAKLCAP int, @ID_USER int'#13#10'set @ID_NAK' +
      'LCAP=:ID_NAKLCAP'#13#10'set @ID_USER=:ID_USER'#13#10'update NAKLCAP set IS_F' +
      'INAL=1, [ID_USERS]=@ID_USER  from NAKLCAP where ID_NAKLCAP=@ID_N' +
      'AKLCAP'
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 259
    Top = 642
  end
end
