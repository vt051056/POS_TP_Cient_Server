object FWithoutTovDoc: TFWithoutTovDoc
  Left = 0
  Top = 0
  Caption = 'FWithoutTovDoc'
  ClientHeight = 538
  ClientWidth = 857
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
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 857
    Height = 309
    Align = alClient
    TabOrder = 0
    object Panel13: TPanel
      Left = 1
      Top = 1
      Width = 855
      Height = 41
      Align = alTop
      TabOrder = 0
      object BB_NUM_LK: TBitBtn
        Left = 4
        Top = 6
        Width = 97
        Height = 29
        Caption = #1050#1083#1072#1074#1080#1072#1090#1091#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BB_NUM_LKClick
      end
    end
    object TouchKeyboard1: TTouchKeyboard
      Left = 1
      Top = 42
      Width = 855
      Height = 266
      Align = alClient
      GradientEnd = clSilver
      GradientStart = clGray
      Layout = 'Standard'
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 229
    Align = alTop
    TabOrder = 1
    object Label10: TLabel
      Left = 17
      Top = 19
      Width = 46
      Height = 25
      Caption = #1044#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 17
      Top = 105
      Width = 24
      Height = 25
      Caption = #8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 237
      Top = 109
      Width = 60
      Height = 25
      Caption = #1057#1091#1084#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 17
      Top = 165
      Width = 220
      Height = 25
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 672
      Top = 194
      Width = 21
      Height = 25
      Caption = #1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DT_Date_doc: TDateTimePicker
      Left = 16
      Top = 45
      Width = 211
      Height = 33
      Date = 38575.000000000000000000
      Time = 38575.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DT_Time_doc: TDateTimePicker
      Left = 69
      Top = 18
      Width = 90
      Height = 21
      Date = 38575.000000000000000000
      Time = 38575.000000000000000000
      Kind = dtkTime
      TabOrder = 1
      Visible = False
    end
    object EN: TEdit
      Left = 16
      Top = 136
      Width = 169
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object E_TOT_SUM: TEdit
      Left = 236
      Top = 137
      Width = 169
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'E_TOT_SUM'
      OnChange = E_TOT_SUMChange
      OnExit = E_TOT_SUMExit
      OnKeyPress = E_TOT_SUMKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 703
      Top = 19
      Width = 145
      Height = 59
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 703
      Top = 119
      Width = 145
      Height = 50
      Caption = #1057#1073#1088#1086#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
    end
    object GroupBoxCLI_SELECT: TGroupBox
      Left = 233
      Top = 4
      Width = 464
      Height = 102
      Caption = #1050#1088#1077#1076#1080#1090#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label_Client: TLabel
        Left = 19
        Top = 66
        Width = 113
        Height = 25
        Caption = 'Label_Client'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ECLI_ContrAgent: TEdit
        Left = 3
        Top = 28
        Width = 390
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object BBSel_CLI_ContrAgent: TBitBtn
        Left = 399
        Top = 20
        Width = 50
        Height = 50
        Hint = #1042#1099#1073#1086#1088' '#1082#1088#1077#1076#1080#1090#1086#1088#1072' - Ctrl-F2'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
          BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
          BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
          BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
          BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
          EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
          EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
          EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
          EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBSel_CLI_ContrAgentClick
      end
    end
    object BBRecept_To_Resistr: TBitBtn
      Left = 744
      Top = 179
      Width = 81
      Height = 45
      Caption = #1056#1077#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BBRecept_To_ResistrClick
    end
    object E_COMMENT: TComboBox
      Left = 17
      Top = 191
      Width = 640
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'E_COMMENT'
    end
    object DTP_Day_Vyruchki: TDateTimePicker
      Left = 703
      Top = 192
      Width = 145
      Height = 31
      Date = 45554.000000000000000000
      Time = 45554.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnChange = DTP_Day_VyruchkiChange
    end
  end
  object SP_SET_RRO_DATA_TO_NAKLCAP: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'SET_RRO_DATA_TO_NAKLCAP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NAKLCAP'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NAKLCAP_PROTOTYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_CAN_REGISTRED_RRO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_REGISTER_RRO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_RRO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NUM_FISCAL_KASSA'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@CHECK_NUMLOCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@CHECK_NUMFISCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@ORDERDATETIME'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@QRCODE_REG'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
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
    Left = 499
    Top = 129
  end
  object ADOCommandDeleteDoc: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_NAKLCAP int, @ID_USER int'#13#10'set @ID_NAK' +
      'LCAP=:ID_NAKLCAP'#13#10'set @ID_USER=:ID_USER'#13#10'update NAKLCAP set IS_D' +
      'ELETE=1, [D_DELETE]=GETDATE(), [COMMENT_DEL]='#39#1057#1073#1088#1086#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39', ' +
      '[ID_USER_DEL]=@ID_USER  from NAKLCAP where ID_NAKLCAP=@ID_NAKLCA' +
      'P'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 643
    Top = 134
  end
end
