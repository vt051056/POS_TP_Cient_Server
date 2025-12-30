object F_Inp_Got_POS: TF_Inp_Got_POS
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 194
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 194
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 162
    object Label1: TLabel
      Left = 215
      Top = 11
      Width = 129
      Height = 13
      Caption = #1042#1099#1087#1091#1089#1082#1072#1077#1084#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object Label3: TLabel
      Left = 16
      Top = 110
      Width = 125
      Height = 13
      Caption = #1042#1099#1087#1091#1089#1082#1072#1077#1084#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
    end
    object GroupBox3: TGroupBox
      Left = 10
      Top = 5
      Width = 199
      Height = 99
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090#1086#1074#1086#1081
      TabOrder = 0
      object Label5: TLabel
        Left = 6
        Top = 24
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object Label2: TLabel
        Left = 6
        Top = 70
        Width = 30
        Height = 13
        Caption = #1042#1088#1077#1084#1103
      end
      object DTPGotDay: TDateTimePicker
        Left = 40
        Top = 16
        Width = 156
        Height = 27
        Date = 38143.000011574070000000
        Time = 38143.000011574070000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DTPGotDayChange
        OnExit = DTPGotDayExit
      end
      object DTPGotTime: TDateTimePicker
        Left = 40
        Top = 65
        Width = 156
        Height = 27
        Date = 38748.208333333340000000
        Time = 38748.208333333340000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = dtkTime
        ParentFont = False
        TabOrder = 1
        OnChange = DTPGotTimeChange
        OnExit = DTPGotTimeExit
      end
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 129
      Width = 81
      Height = 49
      Caption = #1043#1086#1090#1086#1074#1086
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 400
      Top = 133
      Width = 75
      Height = 49
      Caption = #1057#1073#1088#1086#1089
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
    end
    object E_N_GOT: TEdit
      Left = 215
      Top = 30
      Width = 86
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'E_N_GOT'
    end
    object E_TOV: TEdit
      Left = 165
      Top = 106
      Width = 310
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'E_TOV'
    end
    object E_Edizm: TEdit
      Left = 328
      Top = 30
      Width = 37
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'E_Edizm'
    end
  end
end
