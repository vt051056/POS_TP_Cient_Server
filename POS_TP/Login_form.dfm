object F_Login: TF_Login
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
  ClientHeight = 348
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label3: TLabel
    Left = 125
    Top = 187
    Width = 37
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088
  end
  object Label4: TLabel
    Left = 125
    Top = 206
    Width = 25
    Height = 13
    Caption = #1055#1086#1088#1090
  end
  object Label5: TLabel
    Left = 119
    Top = 245
    Width = 138
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1074#1103#1079#1080' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084
  end
  object Login: TEdit
    Left = 8
    Top = 29
    Width = 161
    Height = 21
    TabOrder = 0
    Text = 'Login'
  end
  object Passw: TEdit
    Left = 8
    Top = 80
    Width = 161
    Height = 21
    TabOrder = 1
    Text = 'Passw'
  end
  object BBOk: TBitBtn
    Left = 16
    Top = 121
    Width = 75
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BBCancel: TBitBtn
    Left = 135
    Top = 121
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object GBShowPassw: TCheckBox
    Left = 192
    Top = 82
    Width = 121
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 4
    OnClick = GBShowPasswClick
  end
  object BBSaveLog: TBitBtn
    Left = 192
    Top = 27
    Width = 25
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
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
    OnClick = BBSaveLogClick
  end
  object EHost: TEdit
    Left = 168
    Top = 182
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 6
    Text = '127.0.0.1'
  end
  object EPort: TEdit
    Left = 168
    Top = 206
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 7
    Text = '211'
  end
  object RadioGroup1: TRadioGroup
    Left = 9
    Top = 168
    Width = 104
    Height = 71
    Caption = #1057#1077#1088#1074#1077#1088'/'#1087#1086#1088#1090
    ItemIndex = 0
    Items.Strings = (
      #1054#1089#1085#1086#1074#1085#1086#1081
      #1056#1077#1079#1077#1088#1074#1085#1099#1081)
    TabOrder = 8
    OnClick = RadioGroup1Click
  end
  object BBPing: TBitBtn
    Left = 8
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Ping'
    TabOrder = 9
    OnClick = BBPingClick
  end
  object Memo1: TMemo
    Left = 89
    Top = 264
    Width = 232
    Height = 70
    TabOrder = 10
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
    Left = 240
    Top = 120
  end
  object IdIcmpClient1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 58
    IPVersion = Id_IPv4
    OnReply = IdIcmpClient1Reply
    Left = 280
    Top = 232
  end
end
