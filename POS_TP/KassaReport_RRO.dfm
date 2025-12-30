object F_KassaReport_RRO: TF_KassaReport_RRO
  Left = 0
  Top = 0
  Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
  ClientHeight = 640
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 148
    Align = alTop
    TabOrder = 0
    object L_Period: TLabel
      Left = 8
      Top = 129
      Width = 41
      Height = 13
      Caption = 'L_Period'
    end
    object ShapePRRO: TShape
      Left = 841
      Top = 83
      Width = 26
      Height = 24
      Brush.Color = clRed
    end
    object BBGetShifts: TBitBtn
      Left = 261
      Top = 11
      Width = 152
      Height = 35
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1084#1077#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BBGetShiftsClick
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 1
      Width = 241
      Height = 78
      Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label39: TLabel
        Left = 8
        Top = 20
        Width = 6
        Height = 16
        Caption = #1089
      end
      object Label40: TLabel
        Left = 6
        Top = 51
        Width = 14
        Height = 16
        Caption = #1087#1086
      end
      object D_From: TDateTimePicker
        Left = 23
        Top = 18
        Width = 105
        Height = 24
        Date = 38613.000000000000000000
        Time = 38613.000000000000000000
        TabOrder = 0
      end
      object D_To: TDateTimePicker
        Left = 23
        Top = 48
        Width = 105
        Height = 24
        Date = 38613.999988425930000000
        Time = 38613.999988425930000000
        TabOrder = 1
      end
      object T_From: TDateTimePicker
        Left = 148
        Top = 17
        Width = 86
        Height = 24
        Date = 38774.000000000000000000
        Time = 38774.000000000000000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 2
        OnChange = T_FromChange
        OnExit = T_FromChange
      end
      object T_To: TDateTimePicker
        Left = 148
        Top = 48
        Width = 86
        Height = 24
        Date = 38774.999988425930000000
        Time = 38774.999988425930000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 3
        OnChange = T_ToExit
        OnExit = T_ToExit
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 648
      Top = 82
      Width = 180
      Height = 25
      DataSource = DS_ADOTable_SHIFTS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object BB_Get_LastShiftTotals: TBitBtn
      Left = 648
      Top = 15
      Width = 219
      Height = 31
      Caption = 'X-'#1086#1090#1095#1077#1090' '#1089' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1086#1090#1082#1088#1099#1090#1086#1081' '#1089#1084#1077#1085#1099
      TabOrder = 3
      OnClick = BB_Get_LastShiftTotalsClick
    end
    object BB_X_REP: TBitBtn
      Left = 261
      Top = 45
      Width = 152
      Height = 35
      Caption = #1048#1090#1086#1075#1080' '#1089#1084#1077#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BB_X_REPClick
    end
    object RG_Vid_X_REP: TRadioGroup
      Left = 483
      Top = 7
      Width = 159
      Height = 122
      Caption = #1042#1080#1076' '#1080#1090#1086#1075#1086#1074
      ItemIndex = 0
      Items.Strings = (
        #1053#1077#1092#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1087#1086' '#1089#1084#1077#1085#1077
        #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1087#1086' '#1089#1084#1077#1085#1077
        #1054#1073#1097#1080#1081' '#1087#1086' '#1089#1084#1077#1085#1077
        #1053#1077#1092#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        #1054#1073#1097#1080#1081' '#1079#1072' '#1087#1077#1088#1080#1086#1076)
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 148
    Width = 353
    Height = 492
    Align = alLeft
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 351
      Height = 490
      Align = alClient
      Caption = #1042#1089#1077#1075#1086
      TabOrder = 0
      object S_2KAT: TDBText
        Left = 274
        Top = 24
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'S_2KAT'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 56
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'S_REAL'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 40
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_UCEN'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 227
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_OPL_CARD'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 208
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_OPL_BONUS'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 246
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_NAL'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 300
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_VOZVR_NAL'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label20: TLabel
        Left = 16
        Top = 396
        Width = 160
        Height = 13
        Caption = '19. '#1048#1090#1086#1075#1086' '#1085#1072#1083#1080#1095#1082#1080' '#1074' '#1082#1072#1089#1089#1077'='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SUM_KAS: TDBText
        Left = 274
        Top = 410
        Width = 70
        Height = 19
        Alignment = taRightJustify
        DataField = 'SUM_KAS'
        DataSource = DM1.DSQKassaReport_RRO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
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
        Left = 274
        Top = 129
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SKIDKA'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 80
        Width = 70
        Height = 15
        Alignment = taRightJustify
        DataField = 'SKIDKA_KOLBASA'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label29: TLabel
        Left = 16
        Top = 96
        Width = 92
        Height = 13
        Caption = '5. '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1084#1103#1089#1091
      end
      object SKIDKA_MYASO: TDBText
        Left = 274
        Top = 96
        Width = 70
        Height = 15
        Alignment = taRightJustify
        DataField = 'SKIDKA_MYASO'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label30: TLabel
        Left = 16
        Top = 113
        Width = 89
        Height = 13
        Caption = '6. '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1058#1053#1055
      end
      object SKIDKA_TNP: TDBText
        Left = 274
        Top = 113
        Width = 70
        Height = 15
        Alignment = taRightJustify
        DataField = 'SKIDKA_TNP'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label31: TLabel
        Left = 16
        Top = 339
        Width = 179
        Height = 13
        Caption = '16. '#1047#1072#1090#1088#1072#1090#1099' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1085#1072#1083#1080#1095#1082#1086#1081
      end
      object ZATRATY: TDBText
        Left = 274
        Top = 337
        Width = 70
        Height = 19
        Alignment = taRightJustify
        DataField = 'ZATRATY'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 169
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_REAL_TO_PAY'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 147
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'ROUND_SUM'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 265
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_SDACHI_TO_CARD'
        DataSource = DM1.DSQKassaReport_RRO
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
        Left = 274
        Top = 319
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'SUM_VOZVR_CARD'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label36: TLabel
        Left = 16
        Top = 361
        Width = 139
        Height = 13
        Caption = '17. '#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091
      end
      object KASSA_INP: TDBText
        Left = 274
        Top = 361
        Width = 70
        Height = 16
        Alignment = taRightJustify
        DataField = 'KASSA_INP'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object KASSA_OUT: TDBText
        Left = 274
        Top = 380
        Width = 70
        Height = 19
        Alignment = taRightJustify
        DataField = 'KASSA_OUT'
        DataSource = DM1.DSQKassaReport_RRO
      end
      object Label37: TLabel
        Left = 16
        Top = 380
        Width = 142
        Height = 13
        Caption = '18. '#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099
      end
      object Label38: TLabel
        Left = 16
        Top = 429
        Width = 232
        Height = 13
        Caption = '20. '#1042#1099#1090#1086#1088#1075' ('#1085#1072#1083'+'#1073#1077#1079#1085#1072#1083')=11+12-14-15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object L_Vytorg: TLabel
        Left = 293
        Top = 429
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'L_Vytorg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 15
        Top = 410
        Width = 252
        Height = 13
        Caption = '                                          =12+13-14-16+17-18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel3: TPanel
    Left = 353
    Top = 148
    Width = 540
    Height = 492
    Align = alClient
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 229
      Width = 538
      Height = 262
      Align = alBottom
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 5
        Top = 4
        Width = 258
        Height = 124
        Caption = #1050#1086#1083#1073#1072#1089#1072
        TabOrder = 0
        object DBText6: TDBText
          Left = 188
          Top = 13
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_2KAT_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label7: TLabel
          Left = 5
          Top = 13
          Width = 156
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
        end
        object Label8: TLabel
          Left = 5
          Top = 32
          Width = 180
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
        end
        object DBText7: TDBText
          Left = 188
          Top = 32
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_REAL_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label9: TLabel
          Left = 5
          Top = 51
          Width = 172
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText8: TDBText
          Left = 188
          Top = 51
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SUM_UCEN_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label16: TLabel
          Left = 5
          Top = 70
          Width = 137
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText15: TDBText
          Left = 188
          Top = 70
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label21: TLabel
          Left = 5
          Top = 86
          Width = 87
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object DBText20: TDBText
          Left = 188
          Top = 86
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_VOZVR_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label22: TLabel
          Left = 5
          Top = 105
          Width = 91
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object DBText21: TDBText
          Left = 188
          Top = 105
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_VOZVR_KOLBASA'
          DataSource = DM1.DSQKassaReport_RRO
        end
      end
      object GroupBox4: TGroupBox
        Left = 5
        Top = 134
        Width = 258
        Height = 120
        Caption = #1058#1053#1055
        TabOrder = 1
        object DBText12: TDBText
          Left = 191
          Top = 14
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_2KAT_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label13: TLabel
          Left = 6
          Top = 14
          Width = 156
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
        end
        object Label14: TLabel
          Left = 6
          Top = 33
          Width = 180
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
        end
        object DBText13: TDBText
          Left = 191
          Top = 33
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_REAL_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label15: TLabel
          Left = 6
          Top = 52
          Width = 172
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText14: TDBText
          Left = 191
          Top = 52
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SUM_UCEN_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label18: TLabel
          Left = 6
          Top = 71
          Width = 137
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText17: TDBText
          Left = 191
          Top = 71
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label25: TLabel
          Left = 6
          Top = 86
          Width = 87
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object Label26: TLabel
          Left = 6
          Top = 102
          Width = 91
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object DBText24: TDBText
          Left = 191
          Top = 86
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_VOZVR_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object DBText25: TDBText
          Left = 191
          Top = 100
          Width = 60
          Height = 15
          Alignment = taRightJustify
          DataField = 'SN_VOZVR_TNP'
          DataSource = DM1.DSQKassaReport_RRO
        end
      end
      object GroupBox3: TGroupBox
        Left = 269
        Top = 4
        Width = 244
        Height = 124
        Caption = #1052#1103#1089#1086
        TabOrder = 2
        object DBText9: TDBText
          Left = 177
          Top = 10
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_2KAT_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label10: TLabel
          Left = 5
          Top = 14
          Width = 156
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1094#1077#1085#1072#1084' '#1087#1088#1072#1081#1089#1072
        end
        object Label11: TLabel
          Left = 5
          Top = 33
          Width = 180
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1085#1099#1084' '#1094#1077#1085#1072#1084
        end
        object DBText10: TDBText
          Left = 177
          Top = 33
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_REAL_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label12: TLabel
          Left = 5
          Top = 52
          Width = 172
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1091#1094#1077#1085#1082#1080' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText11: TDBText
          Left = 177
          Top = 52
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SUM_UCEN_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label17: TLabel
          Left = 5
          Top = 71
          Width = 137
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
        end
        object DBText16: TDBText
          Left = 177
          Top = 71
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object Label23: TLabel
          Left = 5
          Top = 88
          Width = 87
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object Label24: TLabel
          Left = 5
          Top = 106
          Width = 91
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        end
        object DBText22: TDBText
          Left = 177
          Top = 88
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_VOZVR_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
        object DBText23: TDBText
          Left = 177
          Top = 102
          Width = 60
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_VOZVR_MYASO'
          DataSource = DM1.DSQKassaReport_RRO
        end
      end
      object GroupBox7: TGroupBox
        Left = 272
        Top = 135
        Width = 241
        Height = 119
        Caption = #1053#1077#1079#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        TabOrder = 3
        object DBGrid2: TDBGrid
          Left = 2
          Top = 40
          Width = 237
          Height = 77
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 237
          Height = 25
          Align = alTop
          TabOrder = 1
          object DBNavigator2: TDBNavigator
            Left = 4
            Top = 3
            Width = 80
            Height = 19
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            TabOrder = 0
          end
          object BB_Del_Not_Final_Doc: TBitBtn
            Left = 90
            Top = 1
            Width = 23
            Height = 23
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1085#1077#1079#1072#1082#1086#1085#1095#1077#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
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
            OnClick = BB_Del_Not_Final_DocClick
          end
          object BB_Del_All_Not_Final_Doc: TBitBtn
            Left = 130
            Top = 1
            Width = 23
            Height = 23
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1085#1077#1079#1072#1082#1086#1085#1095#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
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
            TabOrder = 2
            OnClick = BB_Del_All_Not_Final_DocClick
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 538
      Height = 228
      Align = alClient
      TabOrder = 1
      object GroupBox6: TGroupBox
        Left = 1
        Top = 1
        Width = 536
        Height = 226
        Align = alClient
        Caption = #1057#1084#1077#1085#1099' '#1087#1077#1088#1080#1086#1076#1072
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 532
          Height = 209
          Align = alClient
          DataSource = DS_ADOTable_SHIFTS
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnDrawDataCell = DBGrid1DrawDataCell
        end
      end
    end
  end
  object ADOTable_SHIFTS: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOTable_SHIFTSAfterScroll
    TableName = 'SHIFTS'
    Left = 440
    Top = 168
    object ADOTable_SHIFTSShiftId: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090' '#1089#1084#1077#1085#1099
      FieldName = 'ShiftId'
    end
    object ADOTable_SHIFTSOpened: TDateTimeField
      DisplayLabel = #1054#1090#1082#1088#1099#1090#1072
      FieldName = 'Opened'
    end
    object ADOTable_SHIFTSClosed: TDateTimeField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object ADOTable_SHIFTSZRepFiscalNum: TWideStringField
      DisplayLabel = #1060#1080#1089#1082' '#8470' Z-'#1086#1090#1095#1077#1090#1072
      DisplayWidth = 20
      FieldName = 'ZRepFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSOpenShiftFiscalNum: TWideStringField
      DisplayWidth = 20
      FieldName = 'OpenShiftFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSCloseShiftFiscalNum: TWideStringField
      DisplayWidth = 20
      FieldName = 'CloseShiftFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSOpenName: TWideStringField
      DisplayWidth = 30
      FieldName = 'OpenName'
      Size = 255
    end
    object ADOTable_SHIFTSOpenSubjectKeyId: TWideStringField
      DisplayWidth = 30
      FieldName = 'OpenSubjectKeyId'
      Size = 255
    end
    object ADOTable_SHIFTSCloseName: TWideStringField
      DisplayWidth = 30
      FieldName = 'CloseName'
      Size = 255
    end
    object ADOTable_SHIFTSCloseSubjectKeyId: TWideStringField
      DisplayWidth = 30
      FieldName = 'CloseSubjectKeyId'
      Size = 255
    end
    object ADOTable_SHIFTSID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
  end
  object DS_ADOTable_SHIFTS: TDataSource
    DataSet = ADOTable_SHIFTS
    Left = 512
    Top = 176
  end
  object ADOCommandDeleteShifts: TADOCommand
    CommandText = '--use NMK_TP'#13#10'delete [dbo].[SHIFTS] where [ID_USER]=:ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 448
    Top = 272
  end
end
