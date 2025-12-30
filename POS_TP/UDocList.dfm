object FDocList: TFDocList
  Left = 0
  Top = 0
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 508
  ClientWidth = 875
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
    Width = 875
    Height = 508
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 873
      Height = 88
      Align = alTop
      TabOrder = 0
      object ShapePRRO: TShape
        Left = 507
        Top = 41
        Width = 26
        Height = 25
        Brush.Color = clRed
      end
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 6
        Width = 80
        Height = 25
        DataSource = DM1.DS_QDocList
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BBClose: TBitBtn
        Left = 589
        Top = 8
        Width = 120
        Height = 70
        Caption = #1042#1099#1073#1086#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 31
        Width = 231
        Height = 42
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 2
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
          Left = 158
          Top = 21
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
        Left = 252
        Top = 31
        Width = 238
        Height = 42
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
        TabOrder = 3
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
        object D_From: TDateTimePicker
          Left = 18
          Top = 14
          Width = 85
          Height = 21
          Date = 38585.000000000000000000
          Time = 38585.000000000000000000
          TabOrder = 1
          OnChange = D_FromChange
        end
        object CB_AllType: TCheckBox
          Left = 388
          Top = 17
          Width = 83
          Height = 17
          Caption = #1042#1089#1077#1093' '#1090#1080#1087#1086#1074
          TabOrder = 2
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
        TabOrder = 4
        OnClick = BBRefreshClick
      end
      object BBSetting: TBitBtn
        Left = 128
        Top = 7
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
        TabOrder = 5
        OnClick = BBSettingClick
      end
      object BitBtn1: TBitBtn
        Left = 715
        Top = 8
        Width = 120
        Height = 70
        Caption = #1057#1073#1088#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkCancel
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
      end
      object BBDocReport: TBitBtn
        Left = 202
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
        TabOrder = 7
        OnClick = BBDocReportClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 89
      Width = 873
      Height = 418
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 871
        Height = 416
        Align = alClient
        DataSource = DM1.DS_QDocList
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
        OnDrawDataCell = DBGrid1DrawDataCell
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
end
