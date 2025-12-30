object F_Assemb_POS: TF_Assemb_POS
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
  ClientHeight = 607
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 967
    Height = 586
    Align = alClient
    PageIndex = 1
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Norma'
      object Panel1: TPanel
        Left = 32
        Top = 24
        Width = 985
        Height = 497
        TabOrder = 0
        Visible = False
        object GroupBox2: TGroupBox
          Left = 24
          Top = 224
          Width = 513
          Height = 249
          Caption = #1053#1086#1088#1084#1099
          TabOrder = 0
          object Panel4: TPanel
            Left = 16
            Top = 24
            Width = 473
            Height = 41
            TabOrder = 0
            object DBNavigator2: TDBNavigator
              Left = 16
              Top = 8
              Width = 224
              Height = 25
              DataSource = DS_NORM_ASSEMB_POS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
            object BBRefreshNorm: TBitBtn
              Left = 296
              Top = 8
              Width = 25
              Height = 25
              Hint = #1054#1089#1074#1077#1078#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object DBGrid2: TDBGrid
            Left = 32
            Top = 80
            Width = 441
            Height = 120
            DataSource = DS_NORM_ASSEMB_POS
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'GRUPTOV'
                Visible = True
              end
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'NAME'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EDIZM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NORMA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_PROD'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_TOV'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_NORM'
                Visible = True
              end>
          end
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 17
          Width = 505
          Height = 201
          Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
          TabOrder = 1
          object Panel3: TPanel
            Left = 24
            Top = 16
            Width = 449
            Height = 41
            TabOrder = 0
            object DBNavigator1: TDBNavigator
              Left = 8
              Top = 8
              Width = 220
              Height = 25
              DataSource = DS_PRODUCT_POS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
            object BBRefresh: TBitBtn
              Left = 258
              Top = 8
              Width = 25
              Height = 25
              Hint = #1054#1089#1074#1077#1078#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBRefreshClick
            end
          end
          object DBGrid1: TDBGrid
            Left = 16
            Top = 64
            Width = 441
            Height = 120
            DataSource = DS_PRODUCT_POS
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'GRUPTOV'
                Visible = True
              end
              item
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'NAME'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EDIZM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_SYR_MINUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_SYR_PLUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_GOT_MINUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_GOT_PLUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_SUH_MINUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_SUH_PLUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_PROD'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_TOV'
                Visible = True
              end>
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Assemb'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 967
        Height = 586
        Align = alClient
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 496
          Height = 584
          Align = alLeft
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1084#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 492
            Height = 210
            Align = alTop
            TabOrder = 0
            object Label6: TLabel
              Left = 6
              Top = 4
              Width = 56
              Height = 13
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089
            end
            object Label7: TLabel
              Left = 8
              Top = 50
              Width = 12
              Height = 13
              Caption = #1087#1086
            end
            object DBNavigator3: TDBNavigator
              Left = 6
              Top = 98
              Width = 144
              Height = 55
              DataSource = DS_FARSH_DAY_POS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
            object DTPFrom: TDateTimePicker
              Left = 8
              Top = 19
              Width = 145
              Height = 27
              Date = 38143.000000000000000000
              Time = 38143.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = DTPFromChange
            end
            object DTPTo: TDateTimePicker
              Left = 8
              Top = 65
              Width = 145
              Height = 27
              Date = 38143.999988425930000000
              Time = 38143.999988425930000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = DTPFromChange
            end
            object GroupBox5: TGroupBox
              Left = 159
              Top = 2
              Width = 329
              Height = 73
              Caption = #1047#1072#1087#1091#1089#1082' '#1087#1088'-'#1074#1072
              TabOrder = 3
              object SBDelProd: TSpeedButton
                Left = 293
                Top = 17
                Width = 33
                Height = 35
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1080#1102
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
                OnClick = SBDelProdClick
              end
              object SBGetIngrDay: TSpeedButton
                Left = 127
                Top = 17
                Width = 98
                Height = 53
                Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1087#1086' '#1085#1086#1088#1084#1072#1084
                Caption = #1085#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
                  000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
                  99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
                  0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
                  FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
                  0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
                  000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
                  00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
                  00FF3777773333F77733333333333000033F3333333337777333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = SBGetIngrDayClick
              end
              object SBAddProd: TSpeedButton
                Left = 3
                Top = 17
                Width = 54
                Height = 53
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1080#1102' '
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
                OnClick = SBAddProdClick
              end
              object BBEditProd: TBitBtn
                Left = 63
                Top = 17
                Width = 58
                Height = 53
                Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1080#1102
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
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BBEditProdClick
              end
              object BBRefresh_FarshDay: TBitBtn
                Left = 231
                Top = 17
                Width = 41
                Height = 53
                Hint = #1054#1089#1074#1077#1078#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                  3333333777333777FF33339993707399933333773337F3777FF3399933000339
                  9933377333777F3377F3399333707333993337733337333337FF993333333333
                  399377F33333F333377F993333303333399377F33337FF333373993333707333
                  333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                  999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                  99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                  3393333777333777337333333999993333333333377777333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BBRefresh_FarshDayClick
              end
            end
            object GroupBox6: TGroupBox
              Left = 159
              Top = 81
              Width = 329
              Height = 87
              Caption = #1042#1099#1087#1091#1089#1082' '#1075#1086#1090#1086#1074#1086#1075#1086
              TabOrder = 4
              object SBDelDocs: TSpeedButton
                Left = 239
                Top = 19
                Width = 90
                Height = 54
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1088#1072#1089#1093#1086#1076#1072' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1080' '#1087#1088#1080#1093#1086#1076#1072' '#1075#1086#1090#1086#1074#1086#1075#1086
                Caption = #1059#1076#1072#1083' '#1076#1086#1082
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333333333333333333FFF33FF333FFF339993370733
                  999333777FF37FF377733339993000399933333777F777F77733333399970799
                  93333333777F7377733333333999399933333333377737773333333333990993
                  3333333333737F73333333333331013333333333333777FF3333333333910193
                  333333333337773FF3333333399000993333333337377737FF33333399900099
                  93333333773777377FF333399930003999333337773777F777FF339993370733
                  9993337773337333777333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = SBDelDocsClick
              end
              object SBEditGot: TSpeedButton
                Left = 6
                Top = 19
                Width = 54
                Height = 54
                Hint = #1047#1072#1076#1072#1090#1100' '#1082#1086#1083'-'#1074#1086'  '#1080' '#1076#1072#1090#1091' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090#1086#1074#1086#1075#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
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
                ParentShowHint = False
                ShowHint = True
                OnClick = SBEditGotClick
              end
              object BBCalcSebest: TBitBtn
                Left = 66
                Top = 19
                Width = 76
                Height = 54
                Hint = #1056#1072#1089#1095#1077#1090' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
                Caption = #1057#1077#1073#1077#1089#1090
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
                  03333377777777777F33333003333330033333377FF333377F33333300333333
                  0333333377FF33337F3333333003333303333333377FF3337333333333003333
                  333333333377FF3333333333333003333333333333377FF33333333333330033
                  3333333333337733333333333330033333333333333773333333333333003333
                  33333333337733333F3333333003333303333333377333337F33333300333333
                  03333333773333337F33333003333330033333377FFFFFF77F33330000000000
                  0333337777777777733333333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BBCalcSebestClick
              end
              object BBCreateDocs: TBitBtn
                Left = 148
                Top = 19
                Width = 87
                Height = 54
                Hint = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072' '#1088#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1080' '#1085#1072' '#1087#1088#1080#1093#1086#1076' '#1075#1086#1090#1086#1074#1086#1075#1086
                Caption = #1057#1086#1079#1076' '#1076#1086#1082
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
                  000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
                  FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
                  00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
                  00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
                  FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
                  0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
                  05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
                  55557F7777777555555500000005555555557777777555555555}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BBCreateDocsClick
              end
            end
            object BBUnSelectAll: TBitBtn
              Left = 97
              Top = 174
              Width = 107
              Height = 25
              Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1099#1076#1077#1083#1077#1085'.'
              TabOrder = 5
              OnClick = BBUnSelectAllClick
            end
            object BBSelectAll: TBitBtn
              Left = 4
              Top = 173
              Width = 87
              Height = 26
              Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 6
              OnClick = BBSelectAllClick
            end
            object BBUnsetTransmit: TBitBtn
              Left = 210
              Top = 174
              Width = 240
              Height = 25
              Caption = #1057#1085#1103#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1077#1088#1074#1077#1088
              TabOrder = 7
              OnClick = BBUnsetTransmitClick
            end
          end
          object DBGrid3: TDBGrid
            Left = 2
            Top = 225
            Width = 492
            Height = 357
            Align = alClient
            DataSource = DS_FARSH_DAY_POS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawDataCell = DBGrid3DrawDataCell
          end
        end
        object GroupBox4: TGroupBox
          Left = 497
          Top = 1
          Width = 469
          Height = 584
          Align = alClient
          Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099
          TabOrder = 1
          object Panel6: TPanel
            Left = 2
            Top = 15
            Width = 465
            Height = 75
            Align = alTop
            TabOrder = 0
            object SBAddIngr: TSpeedButton
              Left = 195
              Top = 4
              Width = 47
              Height = 63
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
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
              OnClick = SBAddIngrClick
            end
            object SBDeIIngr: TSpeedButton
              Left = 409
              Top = 4
              Width = 48
              Height = 63
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
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
              OnClick = SBDeIIngrClick
            end
            object SBReplaceIngr: TSpeedButton
              Tag = 3
              Left = 357
              Top = 4
              Width = 44
              Height = 63
              Hint = #1047#1072#1084#1077#1085#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' '#1086#1073#1085#1091#1083#1103#1103' '#1092#1072#1082#1090' '#1082#1086#1083'-'#1074#1072' '#1080#1089#1093#1086#1076#1085#1086#1075#1086
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                339977FF777777773377000BFB03333333337773FF733333333F333000333333
                3300333777333333337733333333333333003333333333333377333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SBAddIngrClick
            end
            object SBReplNEHVAT: TSpeedButton
              Tag = 2
              Left = 303
              Top = 4
              Width = 41
              Height = 63
              Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072' + '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                339977FF777777773377000BFB03993333337773FF73FF33333F333000339933
                330033377733FF3333773333339999993300333333FFFFFF3377333333999999
                3333333333FFFFFF33FF333333339933300033333333FF333777333333339933
                300033333333FF33377733333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SBAddIngrClick
            end
            object SBEditIngr: TSpeedButton
              Tag = 1
              Left = 249
              Top = 4
              Width = 45
              Height = 63
              Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072
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
              ParentShowHint = False
              ShowHint = True
              OnClick = SBAddIngrClick
            end
            object DBNavigator4: TDBNavigator
              Left = 8
              Top = 4
              Width = 180
              Height = 63
              DataSource = DS_INGR_CONS_POS
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
          end
          object DBGrid4: TDBGrid
            Left = 2
            Top = 90
            Width = 465
            Height = 492
            Align = alClient
            DataSource = DS_INGR_CONS_POS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawDataCell = DBGrid4DrawDataCell
          end
        end
      end
    end
  end
  object TabSet1: TTabSet
    Left = 0
    Top = 586
    Width = 967
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      #1053#1086#1088#1084#1099
      #1057#1073#1086#1088#1082#1072' ('#1087#1088'-'#1074#1086')')
    TabIndex = 0
    OnClick = TabSet1Click
  end
  object DS_PRODUCT_POS: TDataSource
    DataSet = QPRODUCT_POS
    Left = 256
    Top = 296
  end
  object QPRODUCT_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = QPRODUCT_POSAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select P.[ID_PROD], P.[ID_TOV],  G.GRUPTOV, T.NAME,  T.EDIZM,'
      
        'P.[N_SYR_MINUS], P.[N_SYR_PLUS], P.[N_GOT_MINUS], P.[N_GOT_PLUS]' +
        ', P.[N_SUH_MINUS], P.[N_SUH_PLUS]'
      ''
      'from [dbo].[PRODUCT_POS] P'
      'inner join TOV T on T.ID_TOV=P.ID_TOV'
      'inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      'order by G.GRUPTOV, T.NAME')
    Left = 140
    Top = 289
    object QPRODUCT_POSID_PROD: TIntegerField
      FieldName = 'ID_PROD'
    end
    object QPRODUCT_POSID_TOV: TIntegerField
      FieldName = 'ID_TOV'
    end
    object QPRODUCT_POSGRUPTOV: TWideStringField
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QPRODUCT_POSNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object QPRODUCT_POSEDIZM: TWideStringField
      FieldName = 'EDIZM'
      Size = 5
    end
    object QPRODUCT_POSN_SYR_MINUS: TFloatField
      FieldName = 'N_SYR_MINUS'
    end
    object QPRODUCT_POSN_SYR_PLUS: TFloatField
      FieldName = 'N_SYR_PLUS'
    end
    object QPRODUCT_POSN_GOT_MINUS: TFloatField
      FieldName = 'N_GOT_MINUS'
    end
    object QPRODUCT_POSN_GOT_PLUS: TFloatField
      FieldName = 'N_GOT_PLUS'
    end
    object QPRODUCT_POSN_SUH_MINUS: TFloatField
      FieldName = 'N_SUH_MINUS'
    end
    object QPRODUCT_POSN_SUH_PLUS: TFloatField
      FieldName = 'N_SUH_PLUS'
    end
  end
  object DS_NORM_ASSEMB_POS: TDataSource
    DataSet = QNORM_ASSEMB_POS
    Left = 240
    Top = 368
  end
  object QNORM_ASSEMB_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_PROD'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_PROD int'
      'set @ID_PROD=:ID_PROD'
      
        'select NA.[ID_PROD], NA.[ID_TOV],  G.GRUPTOV, T.NAME, NA.[NORMA]' +
        ', T.EDIZM, NA.ID_NORM'
      'from [dbo].[NORM_ASSEMB_POS] NA'
      'inner join TOV T on T.ID_TOV=NA.ID_TOV'
      'inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      'where NA.[ID_PROD]=@ID_PROD'
      'order by G.GRUPTOV, T.NAME')
    Left = 116
    Top = 369
    object QNORM_ASSEMB_POSID_PROD: TIntegerField
      FieldName = 'ID_PROD'
    end
    object QNORM_ASSEMB_POSID_TOV: TIntegerField
      FieldName = 'ID_TOV'
    end
    object QNORM_ASSEMB_POSGRUPTOV: TWideStringField
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QNORM_ASSEMB_POSNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object QNORM_ASSEMB_POSNORMA: TFloatField
      FieldName = 'NORMA'
    end
    object QNORM_ASSEMB_POSEDIZM: TWideStringField
      FieldName = 'EDIZM'
      Size = 5
    end
    object QNORM_ASSEMB_POSID_NORM: TIntegerField
      FieldName = 'ID_NORM'
    end
  end
  object DS_FARSH_DAY_POS: TDataSource
    DataSet = QFARSH_DAY_POS
    Left = 272
    Top = 208
  end
  object SP_ADD_FARSH_DAY_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'ADD_FARSH_DAY_POS;1'
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
        Name = '@ID_PROD'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DATE_P'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@N_PREPARE'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_SER_NEW'
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
    Left = 384
    Top = 272
  end
  object QFARSH_DAY_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    BeforeInsert = QFARSH_DAY_POSBeforeInsert
    AfterScroll = QFARSH_DAY_POSAfterScroll
    OnCalcFields = QFARSH_DAY_POSCalcFields
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
      'declare  @D_FROM datetime, @D_TO datetime'
      ''
      'set @D_FROM=:D_FROM'
      'set @D_TO=:D_TO'
      '--set @D_FROM='#39'10.06.2021'#39
      '--set @D_TO='#39'10.06.2021 23:59:59'#39
      #9'SELECT'
      #9'T.NAME as PROD_NAME'
      #9',FD.[ID_SER]'
      #9',FD.[ID_PROD]'
      #9',FD.[DATE_P]'
      #9',FD.[N_PREPARE]'
      #9',FD.[DATE_V]'
      #9',FD.[N_GOT]'
      #9',FD.[SEBEST]'
      ''
      #9',FD.[ID_DOC_GOT]'
      #9',FD.[ID_DOC_INGR]'
      '  ,FD.IS_CALC_SEBEST'
      '  ,T.EDIZM'
      '  ,NC_GOT.IS_EXPORT as IS_EXPORT_GOT'
      ',NC_INGR.IS_EXPORT  as IS_EXPORT_INGR'
      ''
      ''
      #9'FROM [dbo].[FARSH_DAY_POS] FD'
      #9'inner join [dbo].[PRODUCT_POS] P on P.ID_PROD=FD.ID_PROD'
      #9'inner join TOV T on T.ID_TOV=P.ID_TOV'
      
        #9'left outer join NAKLCAP NC_GOT on NC_GOT.ID_NAKLCAP=FD.[ID_DOC_' +
        'GOT]'
      
        #9'left outer join NAKLCAP NC_INGR on NC_INGR.ID_NAKLCAP=FD.[ID_DO' +
        'C_INGR]'
      #9'where'
      #9' FD.[DATE_P]>=@D_FROM and FD.[DATE_P]<=@D_TO'
      #9'order by FD.[DATE_P], PROD_NAME')
    Left = 188
    Top = 209
    object QFARSH_DAY_POSPROD_NAME: TWideStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      DisplayWidth = 30
      FieldName = 'PROD_NAME'
      ReadOnly = True
      Size = 255
    end
    object QFARSH_DAY_POSEDIZM: TWideStringField
      FieldName = 'EDIZM'
      Size = 5
    end
    object QFARSH_DAY_POSN_PREPARE: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1079#1072#1087#1091#1089#1082#1072
      FieldName = 'N_PREPARE'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QFARSH_DAY_POSN_GOT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1075#1086#1090#1086#1074
      FieldName = 'N_GOT'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QFARSH_DAY_POScalc: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'calc'
      Calculated = True
    end
    object QFARSH_DAY_POSdoc: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'doc'
      Calculated = True
    end
    object QFARSH_DAY_POSexport: TStringField
      DisplayLabel = #1069#1082#1089#1087#1086#1088#1090
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'export'
      Calculated = True
    end
    object QFARSH_DAY_POSDATE_P: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1087#1091#1089#1082#1072
      FieldName = 'DATE_P'
      ReadOnly = True
    end
    object QFARSH_DAY_POSDATE_V: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090
      FieldName = 'DATE_V'
      ReadOnly = True
    end
    object QFARSH_DAY_POSSEBEST: TFloatField
      DisplayLabel = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SEBEST'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QFARSH_DAY_POSID_SER: TAutoIncField
      DisplayLabel = #1082#1086#1076' '#1089#1077#1088#1080#1080
      FieldName = 'ID_SER'
      ReadOnly = True
    end
    object QFARSH_DAY_POSID_PROD: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1087#1088#1086#1076
      FieldName = 'ID_PROD'
      ReadOnly = True
    end
    object QFARSH_DAY_POSID_DOC_INGR: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1076#1086#1082' '#1088#1072#1089#1093' '#1080#1085#1075#1088
      FieldName = 'ID_DOC_INGR'
      ReadOnly = True
    end
    object QFARSH_DAY_POSID_DOC_GOT: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1076#1086#1082' '#1087#1088#1080#1093' '#1075#1086#1090#1086#1074
      FieldName = 'ID_DOC_GOT'
      ReadOnly = True
    end
    object QFARSH_DAY_POSIS_CALC_SEBEST: TIntegerField
      DisplayLabel = #1056#1072#1089#1095#1077' '#1089#1077#1073#1077#1089#1090
      FieldName = 'IS_CALC_SEBEST'
    end
    object QFARSH_DAY_POSIS_EXPORT_GOT: TIntegerField
      DisplayLabel = #1069#1082#1089#1087#1086#1088#1090' '#1075#1086#1090
      FieldName = 'IS_EXPORT_GOT'
    end
    object QFARSH_DAY_POSIS_EXPORT_INGR: TIntegerField
      DisplayLabel = #1069#1082#1089#1087#1086#1088#1090' '#1080#1085#1075#1088
      FieldName = 'IS_EXPORT_INGR'
    end
  end
  object SP_GET_INGR_CONS_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'GET_INGR_CONS_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SER'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 408
    Top = 344
  end
  object DS_INGR_CONS_POS: TDataSource
    DataSet = QINGR_CONS_POS
    Left = 736
    Top = 208
  end
  object SP_DELETE_FARSH_DAY_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'DELETE_FARSH_DAY_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SER'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 376
    Top = 416
  end
  object SP_REPLACE_INGR_CONS_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    BeforeInsert = SP_REPLACE_INGR_CONS_POSBeforeInsert
    ProcedureName = 'REPLACE_INGR_CONS_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@MODE'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@ID_SER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_INGR_SOURCE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_FACT_SOURCE'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_TOV_DEST'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_FACT_DEST'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_INGR_NEW'
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
    Left = 632
    Top = 320
  end
  object QINGR_CONS_POS: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_SER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '-- use NMK_TP'
      'declare @ID_SER int'
      'set @ID_SER=:ID_SER'
      '--set @ID_SER=1042'
      ''
      'declare @D datetime'
      'set @D=0'
      
        'select @D=FD.DATE_P from [dbo].[FARSH_DAY_POS] FD where FD.ID_SE' +
        'R=@ID_SER'
      ''
      ''
      'declare @D_LAST_INV datetime -- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
      'set @D_LAST_INV=0'
      
        'select @D_LAST_INV=isnull(max(D),0) from [dbo].[NAKLCAP]  where ' +
        '[ID_DOC_TYPE]=206 and D<@D and [IS_DELETE]=0'
      ''
      ''
      ''
      'create table #OST_TMP (ID_TOV int, DEB float, KRED float)'
      ''
      '-- '#1088#1072#1089#1095#1077#1090' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1089#1077#1088#1080#1080' @ID_SER'
      'insert into #OST_TMP (ID_TOV, DEB, KRED)'
      '-- '#1090#1086#1074#1072#1088#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' (206)'
      
        #9'select NT.ID_TOV, isnull(sum([NUMB]),0), 0 from [dbo].[NAKLTOV]' +
        ' NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D=@D_LAST_INV  and NC.[ID_DOC_TYPE] in (206) and  NC.[' +
        'IS_DELETE]=0'
      
        #9'and exists(select * from [dbo].[INGR_CONS_POS] IC where IC.[ID_' +
        'SER]=@ID_SER and IC.ID_TOV=NT.ID_TOV) -- '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074 +
        ' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1089#1077#1088#1080#1080' @ID_SER'
      #9'group by NT.ID_TOV'
      ''
      'insert into #OST_TMP (ID_TOV, DEB, KRED)'
      
        '-- + '#1087#1088#1080#1093#1086#1076#1086#1074' '#1058#1053#1055' (219) + '#1082#1086#1083#1073#1072#1089#1099' (209) + '#1084#1103#1089#1072' (216) + '#1074#1086#1079#1074#1088#1072#1090' '#1086 +
        #1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103' (204)+ '#1055#1088#1080#1093#1086#1076' '#1075#1086#1090' '#1087#1088#1086#1076' '#1089#1086#1073#1089#1090#1074' '#1080#1079#1075#1086#1090' '#1089' '#1087#1088'-'#1074#1072' (288)'
      
        #9'select NT.ID_TOV, isnull(sum([NUMB]),0), 0 from [dbo].[NAKLTOV]' +
        ' NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_LAST_INV and  NC.D<=@D and NC.[ID_DOC_TYPE] in (' +
        '219, 209, 216, 204, 288 ) and  NC.[IS_DELETE]=0'
      
        #9'and exists(select * from [dbo].[INGR_CONS_POS] IC where IC.[ID_' +
        'SER]=@ID_SER and IC.ID_TOV=NT.ID_TOV) -- '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074 +
        ' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1089#1077#1088#1080#1080' @ID_SER'
      #9'group by NT.ID_TOV'
      ''
      'insert into #OST_TMP (ID_TOV, DEB, KRED)'
      
        '-- '#1088#1072#1089#1093#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1087#1088#1086#1076#1072#1078#1072' (200), '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086 +
        #1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217),  '#1056#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077 +
        #1085#1090#1086#1074' '#1074' '#1087#1088'-'#1074#1086' (287)'
      
        #9#9'select NT.ID_TOV,0,isnull(sum([NUMB]),0.0) from [dbo].[NAKLTOV' +
        '] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_LAST_INV and  NC.D<=@D and NC.[ID_DOC_TYPE] in ' +
        '(200, 220, 211, 217, 287 ) and  NC.[IS_DELETE]=0'
      
        #9#9'and exists(select * from [dbo].[INGR_CONS_POS] IC where IC.[ID' +
        '_SER]=@ID_SER and IC.ID_TOV=NT.ID_TOV) -- '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086 +
        #1074' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1089#1077#1088#1080#1080' @ID_SER'
      #9#9'group by NT.ID_TOV'
      ''
      ''
      ''
      ''
      'SELECT G.GRUPTOV, T.NAME, T.EDIZM'
      #9#9',IC.[ID_INGR]'
      '      ,IC.[ID_SER]'
      '      ,IC.[ID_TOV]'
      '      ,IC.[N_NORM]'
      '      ,IC.[N_FACT]'
      '      ,IC.[PRICE]'
      #9'  ,T.ID_GRTOV'
      #9'  , Isnull('
      #9'  ('
      
        #9'  select Isnull(sum(O.DEB-O.KRED), 0) from #OST_TMP O where O.[' +
        'ID_TOV]=IC.ID_TOV'
      #9'  )'
      #9'  ,0) as OSTATOK'
      ''
      '  FROM [dbo].[INGR_CONS_POS] IC'
      '  inner join TOV T on T.ID_TOV=IC.ID_TOV'
      '  inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      '  where IC.[ID_SER]=@ID_SER'
      '  order by G.GRUPTOV, T.NAME'
      ''
      '  drop table #OST_TMP')
    Left = 636
    Top = 209
    object QINGR_CONS_POSNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object QINGR_CONS_POSEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      ReadOnly = True
      Size = 5
    end
    object QINGR_CONS_POSN_NORM: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1086#1088#1084
      FieldName = 'N_NORM'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QINGR_CONS_POSN_FACT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1092#1072#1082#1090
      FieldName = 'N_FACT'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QINGR_CONS_POSOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QINGR_CONS_POSPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QINGR_CONS_POSGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object QINGR_CONS_POSID_INGR: TAutoIncField
      DisplayLabel = #1082#1086#1076' '#1080#1085#1075#1088
      FieldName = 'ID_INGR'
      ReadOnly = True
    end
    object QINGR_CONS_POSID_SER: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1089#1077#1088#1080#1080
      FieldName = 'ID_SER'
      ReadOnly = True
    end
    object QINGR_CONS_POSID_TOV: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'ID_TOV'
      ReadOnly = True
    end
    object QINGR_CONS_POSID_GRTOV: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1075#1088' '#1090#1086#1074
      FieldName = 'ID_GRTOV'
      ReadOnly = True
    end
  end
  object SP_DELETE_INGR_CONS_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    BeforeInsert = SP_REPLACE_INGR_CONS_POSBeforeInsert
    ProcedureName = 'DELETE_INGR_CONS_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_INGR'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 744
    Top = 296
  end
  object SP_EDIT_FARSH_DAY_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'EDIT_FARSH_DAY_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_GOT'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@DATE_V'
        Attributes = [paNullable]
        DataType = ftDateTime
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 392
    Top = 160
  end
  object ADOCommandSetSebest: TADOCommand
    CommandText = 
      'update [dbo].[FARSH_DAY_POS] set [SEBEST]=:SEBEST, [IS_CALC_SEBE' +
      'ST]=1 where [ID_SER]=:ID_SER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'SEBEST'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'ID_SER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 97
    Top = 201
  end
  object SP_CREATE_DOC_PRVO_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'CREATE_DOC_PRVO_POS;1'
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
        Name = '@ID_TRADE_POINT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SER'
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
    Left = 248
    Top = 152
  end
  object SP_DELETE_DOC_PRVO_POS: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'DELETE_DOC_PRVO_POS;1'
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
        Name = '@ID_SER'
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
    Left = 384
    Top = 224
  end
  object ADOCommand_Expotr_Ser__null: TADOCommand
    CommandText = 
      'declare @ID_SER int, @ID_DOC_INGR int, @ID_DOC_GOT int '#13#10'set @ID' +
      '_SER=:ID_SER'#13#10#13#10'set @ID_DOC_INGR=-1'#13#10'set @ID_DOC_GOT=-1'#13#10'select ' +
      '@ID_DOC_INGR=ID_DOC_INGR, @ID_DOC_GOT=ID_DOC_GOT from [FARSH_DAY' +
      '_POS]  where ID_SER=@ID_SER'#13#10#13#10'if @ID_DOC_INGR<>-1 and @ID_DOC_G' +
      'OT<>-1'#13#10'begin'#13#10' update [dbo].[NAKLCAP] set [IS_EXPORT]=0 where I' +
      'D_NAKLCAP in (@ID_DOC_INGR, @ID_DOC_GOT)'#13#10'end'#13#10
    Connection = DM1.ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_SER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 56
    Top = 240
  end
end
