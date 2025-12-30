object F_KassaReport: TF_KassaReport
  Left = 0
  Top = 0
  Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
  ClientHeight = 592
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 411
    Height = 430
    Caption = #1042#1089#1077#1075#1086
    TabOrder = 0
    object S_2KAT: TDBText
      Left = 288
      Top = 24
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_2KAT'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 169
      Height = 13
      Caption = '1. '#1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 217
      Height = 13
      Caption = '3. '#1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084'=1-2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object S_REAL: TDBText
      Left = 288
      Top = 56
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_REAL'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 40
      Width = 185
      Height = 13
      Caption = '2. '#1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object SUM_UCEN: TDBText
      Left = 288
      Top = 40
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_UCEN'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label4: TLabel
      Left = 16
      Top = 227
      Width = 172
      Height = 13
      Caption = '11. '#1054#1087#1083#1072#1090#1099' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1084#1080' '#1082#1072#1088#1090#1072#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SUM_OPL_CARD: TDBText
      Left = 288
      Top = 227
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_OPL_CARD'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 208
      Width = 109
      Height = 13
      Caption = '10. '#1054#1087#1083#1072#1090#1099' '#1073#1086#1085#1091#1089#1072#1084#1080
    end
    object SUM_OPL_BONUS: TDBText
      Left = 288
      Top = 208
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_OPL_BONUS'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label6: TLabel
      Left = 16
      Top = 246
      Width = 118
      Height = 13
      Caption = '12. '#1054#1087#1083#1072#1090#1099' '#1085#1072#1083#1080#1095#1085#1099#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SUM_NAL: TDBText
      Left = 288
      Top = 246
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_NAL'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 16
      Top = 300
      Width = 127
      Height = 13
      Caption = '14. '#1042#1086#1079#1074#1088#1072#1090#1099' '#1085#1072#1083#1080#1095#1085#1099#1084#1080
    end
    object SUM_VOZVR_NAL: TDBText
      Left = 288
      Top = 300
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_VOZVR_NAL'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label20: TLabel
      Left = 16
      Top = 377
      Width = 235
      Height = 13
      Caption = '17. '#1048#1090#1086#1075#1086' '#1085#1072#1083#1080#1095#1082#1080' '#1074' '#1082#1072#1089#1089#1077'=12+13-14-16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SUM_KAS: TDBText
      Left = 288
      Top = 377
      Width = 100
      Height = 19
      Alignment = taRightJustify
      DataField = 'SUM_KAS'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 16
      Top = 129
      Width = 151
      Height = 13
      Caption = '7. '#1057#1091#1084#1084#1072' '#1074#1089#1077#1093' '#1089#1082#1080#1076#1086#1082'=4+5+6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SKIDKA: TDBText
      Left = 288
      Top = 129
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SKIDKA'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 16
      Top = 80
      Width = 110
      Height = 13
      Caption = '4. '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1082#1086#1083#1073#1072#1089#1077
    end
    object SKIDKA_KOLBASA: TDBText
      Left = 288
      Top = 80
      Width = 100
      Height = 15
      Alignment = taRightJustify
      DataField = 'SKIDKA_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label29: TLabel
      Left = 16
      Top = 96
      Width = 92
      Height = 13
      Caption = '5. '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1084#1103#1089#1091
    end
    object SKIDKA_MYASO: TDBText
      Left = 288
      Top = 96
      Width = 100
      Height = 15
      Alignment = taRightJustify
      DataField = 'SKIDKA_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label30: TLabel
      Left = 16
      Top = 113
      Width = 89
      Height = 13
      Caption = '6. '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1058#1053#1055
    end
    object SKIDKA_TNP: TDBText
      Left = 288
      Top = 113
      Width = 100
      Height = 15
      Alignment = taRightJustify
      DataField = 'SKIDKA_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label31: TLabel
      Left = 16
      Top = 338
      Width = 179
      Height = 13
      Caption = '16. '#1047#1072#1090#1088#1072#1090#1099' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1085#1072#1083#1080#1095#1082#1086#1081
    end
    object ZATRATY: TDBText
      Left = 288
      Top = 338
      Width = 100
      Height = 19
      Alignment = taRightJustify
      DataField = 'ZATRATY'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label32: TLabel
      Left = 16
      Top = 169
      Width = 130
      Height = 13
      Caption = '9. '#1057#1091#1084#1084#1072' '#1082' '#1086#1087#1083#1072#1090#1077'=3-7+8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SUM_REAL_TO_PAY: TDBText
      Left = 259
      Top = 169
      Width = 129
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_REAL_TO_PAY'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 16
      Top = 147
      Width = 74
      Height = 13
      Caption = '8. '#1054#1082#1088#1091#1075#1088#1077#1085#1080#1103
    end
    object ROUND_SUM: TDBText
      Left = 259
      Top = 147
      Width = 129
      Height = 17
      Alignment = taRightJustify
      DataField = 'ROUND_SUM'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label34: TLabel
      Left = 16
      Top = 265
      Width = 224
      Height = 13
      Caption = '13. '#1057#1076#1072#1095#1072' '#1087#1077#1088#1077#1095#1080#1089#1083#1103#1077#1084#1072#1103' '#1085#1072' '#1073#1086#1085#1091#1089#1085#1099#1081' '#1089#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SUM_SDACHI_TO_CARD: TDBText
      Left = 288
      Top = 265
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_SDACHI_TO_CARD'
      DataSource = DM1.DSQKassaRepotr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 16
      Top = 319
      Width = 181
      Height = 13
      Caption = '15. '#1042#1086#1079#1074#1088#1072#1090#1099' '#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1091#1102' '#1082#1072#1088#1090#1091
    end
    object SUM_VOZVR_CARD: TDBText
      Left = 288
      Top = 319
      Width = 100
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_VOZVR_CARD'
      DataSource = DM1.DSQKassaRepotr
    end
  end
  object GroupBox2: TGroupBox
    Left = 437
    Top = 11
    Width = 353
    Height = 137
    Caption = #1050#1086#1083#1073#1072#1089#1072
    TabOrder = 1
    object DBText6: TDBText
      Left = 232
      Top = 24
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_2KAT_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 156
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
    end
    object Label8: TLabel
      Left = 16
      Top = 43
      Width = 180
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
    end
    object DBText7: TDBText
      Left = 232
      Top = 43
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_REAL_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label9: TLabel
      Left = 16
      Top = 62
      Width = 172
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText8: TDBText
      Left = 232
      Top = 62
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_UCEN_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label16: TLabel
      Left = 16
      Top = 81
      Width = 137
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText15: TDBText
      Left = 232
      Top = 81
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SN_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label21: TLabel
      Left = 16
      Top = 97
      Width = 87
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object DBText20: TDBText
      Left = 232
      Top = 97
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_VOZVR_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label22: TLabel
      Left = 16
      Top = 116
      Width = 91
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object DBText21: TDBText
      Left = 232
      Top = 116
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SN_VOZVR_KOLBASA'
      DataSource = DM1.DSQKassaRepotr
    end
  end
  object GroupBox3: TGroupBox
    Left = 437
    Top = 154
    Width = 353
    Height = 142
    Caption = #1052#1103#1089#1086
    TabOrder = 2
    object DBText9: TDBText
      Left = 232
      Top = 24
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_2KAT_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label10: TLabel
      Left = 16
      Top = 24
      Width = 156
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
    end
    object Label11: TLabel
      Left = 16
      Top = 43
      Width = 180
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
    end
    object DBText10: TDBText
      Left = 232
      Top = 43
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_REAL_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label12: TLabel
      Left = 16
      Top = 62
      Width = 172
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText11: TDBText
      Left = 232
      Top = 62
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_UCEN_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label17: TLabel
      Left = 16
      Top = 81
      Width = 137
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText16: TDBText
      Left = 232
      Top = 81
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SN_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label23: TLabel
      Left = 16
      Top = 98
      Width = 87
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object Label24: TLabel
      Left = 16
      Top = 116
      Width = 91
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object DBText22: TDBText
      Left = 232
      Top = 98
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_VOZVR_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
    object DBText23: TDBText
      Left = 232
      Top = 112
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SN_VOZVR_MYASO'
      DataSource = DM1.DSQKassaRepotr
    end
  end
  object GroupBox4: TGroupBox
    Left = 439
    Top = 300
    Width = 353
    Height = 134
    Caption = #1058#1053#1055
    TabOrder = 3
    object DBText12: TDBText
      Left = 232
      Top = 24
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_2KAT_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label13: TLabel
      Left = 16
      Top = 24
      Width = 156
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
    end
    object Label14: TLabel
      Left = 16
      Top = 43
      Width = 180
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
    end
    object DBText13: TDBText
      Left = 232
      Top = 43
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_REAL_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label15: TLabel
      Left = 16
      Top = 62
      Width = 172
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText14: TDBText
      Left = 232
      Top = 62
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SUM_UCEN_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label18: TLabel
      Left = 16
      Top = 81
      Width = 137
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
    end
    object DBText17: TDBText
      Left = 232
      Top = 81
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'SN_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object Label25: TLabel
      Left = 16
      Top = 96
      Width = 87
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object Label26: TLabel
      Left = 16
      Top = 112
      Width = 91
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
    end
    object DBText24: TDBText
      Left = 232
      Top = 96
      Width = 113
      Height = 17
      Alignment = taRightJustify
      DataField = 'S_VOZVR_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
    object DBText25: TDBText
      Left = 227
      Top = 110
      Width = 113
      Height = 15
      Alignment = taRightJustify
      DataField = 'SN_VOZVR_TNP'
      DataSource = DM1.DSQKassaRepotr
    end
  end
  object BBClose: TBitBtn
    Left = 705
    Top = 483
    Width = 120
    Height = 70
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
    OnClick = BBCloseClick
  end
  object GroupBox7: TGroupBox
    Left = 804
    Top = 8
    Width = 341
    Height = 426
    Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    object BB_Z_Report: TBitBtn
      Left = 203
      Top = 373
      Width = 121
      Height = 41
      Caption = 'Z - '#1086#1090#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BB_Z_ReportClick
    end
    object BB_X_Report: TBitBtn
      Left = 35
      Top = 272
      Width = 198
      Height = 41
      Caption = 'X - '#1086#1090#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BB_X_ReportClick
    end
    object BB_Open_Cash_Box_Fiscal: TBitBtn
      Left = 16
      Top = 23
      Width = 143
      Height = 41
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1077#1085#1077#1078#1085#1099#1081' '#1103#1097#1080#1082
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1103#1097#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BB_Open_Cash_Box_FiscalClick
    end
    object GroupBox5: TGroupBox
      Left = 7
      Top = 68
      Width = 314
      Height = 73
      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1085#1072#1083#1080#1095#1085#1086#1089#1090#1080' '#1074' '#1082#1072#1089#1089#1091' '#1092#1080#1089#1082#1072#1083#1100#1085#1091#1102
      TabOrder = 3
      object E_In_Cash: TEdit
        Left = 20
        Top = 36
        Width = 61
        Height = 24
        TabOrder = 0
        Text = '0'
      end
      object BB_In_Cash: TBitBtn
        Left = 87
        Top = 30
        Width = 121
        Height = 40
        Caption = #1042#1085#1077#1089#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BB_In_CashClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 6
      Top = 146
      Width = 315
      Height = 73
      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1085#1072#1083#1080#1095#1085#1086#1089#1090#1080' '#1080#1079' '#1082#1072#1089#1089#1099' '#1092#1080#1089#1082#1072#1083#1100#1085#1091#1102
      TabOrder = 4
      object E_Out_Cash: TEdit
        Left = 20
        Top = 36
        Width = 61
        Height = 24
        TabOrder = 0
        Text = '0'
      end
      object BB_Out_Cash: TBitBtn
        Left = 87
        Top = 25
        Width = 121
        Height = 41
        Caption = #1048#1079#1098#1103#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BB_Out_CashClick
      end
    end
    object BB_Tov_Report: TBitBtn
      Left = 35
      Top = 225
      Width = 198
      Height = 41
      Caption = #1058#1086#1074#1072#1088#1085#1099#1081' - '#1086#1090#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = BB_Tov_ReportClick
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 440
    Width = 627
    Height = 134
    Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1090#1077#1088#1084#1080#1085#1072#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object BBCloseDay_Fiscal: TBitBtn
      Left = 3
      Top = 72
      Width = 339
      Height = 41
      Hint = #1054#1087#1077#1088#1072#1094#1080#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1076#1085#1103' '#1076#1083#1103' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1075#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '#1087#1086' '#1072#1083#1082#1086#1075#1086#1083#1102
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1075#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '#1040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BBCloseDay_FiscalClick
    end
    object BBCloseDay_NotFiscal: TBitBtn
      Left = 3
      Top = 25
      Width = 339
      Height = 41
      Hint = #1054#1087#1077#1088#1072#1094#1080#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1076#1085#1103' '#1076#1083#1103' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1075#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1075#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BBCloseDay_NotFiscalClick
    end
    object Memo1: TMemo
      Left = 368
      Top = 24
      Width = 249
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
  end
end
