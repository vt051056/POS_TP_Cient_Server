object F_Invent_Confirm: TF_Invent_Confirm
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1089#1084#1077#1085#1099' '#1080' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 367
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 49
    Top = 8
    Width = 342
    Height = 19
    Caption = #1055#1077#1088#1077#1076#1072#1102#1090#1089#1103' '#1090#1086#1074#1072#1088#1085#1086'-'#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1099#1077' '#1094#1077#1085#1085#1086#1089#1090#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 58
    Top = 71
    Width = 96
    Height = 19
    Caption = #1074' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 190
    Height = 19
    Caption = #1055#1088#1086#1076#1072#1074#1077#1094' '#1089#1076#1072#1102#1097#1080#1081' '#1089#1084#1077#1085#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 214
    Width = 229
    Height = 19
    Caption = #1055#1088#1086#1076#1072#1074#1077#1094' '#1087#1088#1080#1085#1080#1084#1072#1102#1097#1080#1081' '#1089#1084#1077#1085#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 89
    Top = 38
    Width = 65
    Height = 19
    Caption = #1085#1072' '#1089#1091#1084#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object E_TOT_SUM: TEdit
    Left = 160
    Top = 35
    Width = 169
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'E_TOT_SUM'
  end
  object E_TOT_NUM: TEdit
    Left = 160
    Top = 68
    Width = 169
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'E_TOT_NUM'
  end
  object CB_1: TComboBox
    Left = 204
    Top = 117
    Width = 213
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  end
  object CB_2: TComboBox
    Left = 243
    Top = 211
    Width = 174
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 150
    Width = 409
    Height = 42
    Caption = #1057#1076#1072#1083' - '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 244
    Width = 409
    Height = 45
    Caption = #1055#1088#1080#1085#1103#1083' - '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BB_CANCEL: TBitBtn
    Left = 268
    Top = 310
    Width = 142
    Height = 41
    Caption = #1057#1073#1088#1086#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
  end
  object BB_OK: TBitBtn
    Left = 21
    Top = 318
    Width = 121
    Height = 41
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 7
  end
  object QUsers: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select [NAME] from [USERS]')
    Left = 336
    Top = 11
  end
  object Command_ConfirmInvent: TADOCommand
    CommandText = 
      'declare @ID_NAKLCAP int, @USER1 nvarchar(50), @USER2 nvarchar(50' +
      ') '#13#10'set @ID_NAKLCAP=:ID_NAKLCAP'#13#10'set @USER1=:USER1'#13#10'set @USER2=:' +
      'USER2'#13#10'update NAKLCAP set [IS_SVERENO]=1, [ZATRNAME]='#39#1055#1077#1088#1077#1076#1072#1083' '#39'+' +
      '@USER1+ '#39'; '#1055#1088#1080#1085#1103#1083' '#39'+@USER2  from NAKLCAP where ID_NAKLCAP=@ID_NA' +
      'KLCAP'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'USER1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'USER2'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 196
    Top = 298
  end
end
