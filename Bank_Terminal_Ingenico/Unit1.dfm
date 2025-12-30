object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 349
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 64
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object E_Amount: TEdit
    Left = 85
    Top = 61
    Width = 68
    Height = 21
    TabOrder = 0
    Text = 'E_Amount'
  end
  object RG_FuncTerminal: TRadioGroup
    Left = 192
    Top = 24
    Width = 185
    Height = 81
    Caption = #1060#1091#1085#1082#1094#1080#1103' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
    Items.Strings = (
      #1054#1087#1083#1072#1090#1072' '#1087#1086#1082#1091#1087#1082#1080
      #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1082#1091#1087#1082#1080
      #1054#1090#1084#1077#1085#1072' '#1087#1086#1082#1091#1087#1082#1080)
    TabOrder = 1
  end
  object BExecute_Function: TButton
    Left = 56
    Top = 136
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BExecute_FunctionClick
  end
end
