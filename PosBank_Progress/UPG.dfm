object FPG: TFPG
  Left = 0
  Top = 0
  Caption = #1061#1086#1076' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 48
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 15
    Width = 249
    Height = 17
    TabOrder = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 48
    Top = 8
  end
end
