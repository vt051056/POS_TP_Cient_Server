object FSaleDocList: TFSaleDocList
  Left = 0
  Top = 0
  Caption = 'FSaleDocList'
  ClientHeight = 508
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 508
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 849
      Height = 136
      Align = alTop
      TabOrder = 0
      object ShapePRRO: TShape
        Left = 685
        Top = 9
        Width = 26
        Height = 25
        Brush.Color = clRed
      end
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 6
        Width = 80
        Height = 25
        DataSource = DM1.DS_SaleDocList
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BBDelDoc: TBitBtn
        Left = 235
        Top = 76
        Width = 110
        Height = 50
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBDelDocClick
      end
      object BBAddDoc: TBitBtn
        Left = 6
        Top = 76
        Width = 110
        Height = 50
        Hint = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1053#1086#1074#1099#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
        TabOrder = 2
        OnClick = BBAddDocClick
      end
      object BBEditDoc: TBitBtn
        Left = 122
        Top = 76
        Width = 110
        Height = 50
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
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
        OnClick = BBEditDocClick
      end
      object BBClose: TBitBtn
        Left = 717
        Top = 9
        Width = 120
        Height = 64
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkClose
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 31
        Width = 231
        Height = 42
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 5
        object Edit1: TEdit
          Left = 8
          Top = 14
          Width = 79
          Height = 21
          TabOrder = 0
          OnChange = Edit1Change
        end
        object BBSearchDown: TBitBtn
          Left = 98
          Top = 10
          Width = 25
          Height = 25
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
          Left = 128
          Top = 10
          Width = 25
          Height = 25
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
          Left = 158
          Top = 6
          Width = 67
          Height = 17
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
          Caption = #1082#1086#1085#1090#1077#1082#1089#1090
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 159
          Top = 22
          Width = 67
          Height = 17
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1087#1086#1083#1102' '#1085#1072#1088#1080#1084#1077#1088' '#1076#1083#1103' '#1095#1080#1089#1077#1083' >5; <7 '
          Caption = #1092#1080#1083#1100#1090#1088
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = CheckBox2Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 241
        Top = 31
        Width = 438
        Height = 42
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
        TabOrder = 6
        object Label1: TLabel
          Left = 6
          Top = 18
          Width = 5
          Height = 13
          Caption = #1089
        end
        object Label2: TLabel
          Left = 110
          Top = 18
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object D_To: TDateTimePicker
          Left = 128
          Top = 14
          Width = 85
          Height = 21
          Date = 38585.999988425930000000
          Time = 38585.999988425930000000
          TabOrder = 0
          OnChange = D_FromChange
        end
        object CBISDEL: TCheckBox
          Left = 216
          Top = 16
          Width = 79
          Height = 17
          Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077
          TabOrder = 1
          OnClick = CBISDELClick
        end
        object D_From: TDateTimePicker
          Left = 18
          Top = 14
          Width = 85
          Height = 21
          Date = 38585.000000000000000000
          Time = 38585.000000000000000000
          TabOrder = 2
          OnChange = D_FromChange
        end
        object RG_Show: TRadioGroup
          Left = 310
          Top = 6
          Width = 115
          Height = 31
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #1057#1074#1086#1080
            #1042#1089#1077)
          TabOrder = 3
          OnClick = RG_ShowClick
        end
      end
      object BBRefresh: TBitBtn
        Left = 90
        Top = 7
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
        TabOrder = 7
        OnClick = BBRefreshClick
      end
      object BBRestore: TBitBtn
        Left = 686
        Top = 40
        Width = 25
        Height = 25
        Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BBRestoreClick
      end
      object BBSetting: TBitBtn
        Left = 178
        Top = 6
        Width = 25
        Height = 25
        Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = BBSettingClick
      end
      object BBUnsetTransmit: TBitBtn
        Left = 217
        Top = 6
        Width = 240
        Height = 25
        Caption = #1057#1085#1103#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1077#1088#1074#1077#1088
        TabOrder = 10
        OnClick = BBUnsetTransmitClick
      end
      object BBDocReport: TBitBtn
        Left = 129
        Top = 6
        Width = 27
        Height = 25
        Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BBDocReportClick
      end
      object BBSelectAll: TBitBtn
        Left = 474
        Top = 6
        Width = 87
        Height = 25
        Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
        TabOrder = 12
        OnClick = BBSelectAllClick
      end
      object BBUnSelectAll: TBitBtn
        Left = 568
        Top = 6
        Width = 107
        Height = 25
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1099#1076#1077#1083#1077#1085'.'
        TabOrder = 13
        OnClick = BBUnSelectAllClick
      end
      object BB_Union_Invent: TBitBtn
        Left = 559
        Top = 76
        Width = 278
        Height = 50
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = BB_Union_InventClick
      end
      object BB_Load_Doc: TBitBtn
        Left = 351
        Top = 76
        Width = 120
        Height = 50
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1089' '#1089#1077#1088#1074#1077#1088#1072
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnClick = BB_Load_DocClick
      end
      object BB_Send_Sverka: TBitBtn
        Left = 477
        Top = 76
        Width = 268
        Height = 50
        Hint = #1055#1077#1088#1077#1076#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1089#1074#1077#1088#1082#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1085#1072' '#1089#1077#1088#1074#1077#1088
        Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1089#1074#1077#1088#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = BB_Send_SverkaClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 137
      Width = 849
      Height = 370
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 847
        Height = 368
        Align = alClient
        DataSource = DM1.DS_SaleDocList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawDataCell = DBGrid1DrawDataCell
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
      end
    end
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
      end
      item
        Name = 'ID_DOC_TYPE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select [ID_LINK_DOC_2], [IS_SVERENO]  from [dbo].[NAKLCAP] NC'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=:d_from'
      'and NC.[D]<=:d_to'
      'and NC.[IS_EXPORT]=1'
      'and NC.[ID_DOC_TYPE] =:ID_DOC_TYPE')
    Left = 424
    Top = 216
  end
  object QControlNotFinalDoc: TADOQuery
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
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      
        'declare @d_from datetime, @d_to datetime, @ID_DOC_TYPE int, @ID_' +
        'USER int'
      'set @d_from=:d_from'
      'set @d_to=:d_to'
      'set @ID_DOC_TYPE= :ID_DOC_TYPE'
      'set @ID_USER= :ID_USER'
      ''
      'select [ID_NAKLCAP], TOT_SUM, TOT_NUM  from [dbo].[NAKLCAP] NC'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=@d_from'
      'and NC.[D]<=@d_to'
      'and NC.[IS_FINAL]=0'
      'and NC.[ID_DOC_TYPE] = @ID_DOC_TYPE'
      'and NC.ID_USERS=@ID_USER'
      'order by  NC.[D] desc'
      '')
    Left = 176
    Top = 256
  end
end
