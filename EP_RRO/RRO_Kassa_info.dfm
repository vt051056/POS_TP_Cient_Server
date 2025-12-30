object F_RRO_Kassa: TF_RRO_Kassa
  Left = 614
  Top = 171
  Caption = #1050#1072#1089#1089#1099' '#1056#1056#1054
  ClientHeight = 402
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel16: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 402
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 449
      Top = 1
      Width = 335
      Height = 400
      Align = alClient
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 333
        Height = 25
        DataSource = DS_QTT
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 26
        Width = 333
        Height = 373
        Align = alClient
        DataSource = DS_QTT
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 448
      Height = 400
      Align = alLeft
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 131
        Width = 57
        Height = 13
        Caption = #1048#1084#1103' '#1082#1072#1089#1089#1099
      end
      object Label2: TLabel
        Left = 11
        Top = 158
        Width = 137
        Height = 13
        Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1082#1072#1089#1089#1099
      end
      object Label3: TLabel
        Left = 11
        Top = 282
        Width = 38
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object Label4: TLabel
        Left = 226
        Top = 282
        Width = 76
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      end
      object BitBtn1: TBitBtn
        Left = 154
        Top = 337
        Width = 75
        Height = 25
        Caption = #1057#1073#1088#1086#1089
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn6: TBitBtn
        Left = 11
        Top = 337
        Width = 75
        Height = 25
        Caption = #1043#1086#1090#1086#1074#1086
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
      end
      object E_NAME_KASSA: TEdit
        Left = 115
        Top = 128
        Width = 305
        Height = 21
        TabOrder = 2
        Text = 'E_NAME_KASSA'
      end
      object E_ID_NUM_FISCAL_KASSA: TEdit
        Left = 154
        Top = 155
        Width = 255
        Height = 21
        TabOrder = 3
        Text = 'E_ID_NUM_FISCAL_KASSA'
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 8
        Width = 430
        Height = 49
        Caption = #1061#1086#1079#1103#1081#1089#1090#1074#1091#1102#1097#1080#1081' '#1086#1073#1098#1077#1082#1090
        TabOrder = 4
        object EClient: TEdit
          Left = 8
          Top = 17
          Width = 409
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 73
        Width = 430
        Height = 49
        Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1090#1086#1095#1082#1072
        TabOrder = 5
        object E_TT: TEdit
          Left = 8
          Top = 17
          Width = 409
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
      end
      object BB_GetPrivateKeyFileName: TBitBtn
        Left = 358
        Top = 238
        Width = 75
        Height = 25
        Caption = #1050#1083#1102#1095
        TabOrder = 6
        OnClick = BB_GetPrivateKeyFileNameClick
      end
      object E_PrivateKeyFileName: TEdit
        Left = 11
        Top = 240
        Width = 329
        Height = 21
        TabOrder = 7
        Text = 'E_PrivateKeyFileName'
      end
      object BB_GetCertificateFileName: TBitBtn
        Left = 358
        Top = 198
        Width = 75
        Height = 25
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
        TabOrder = 8
        OnClick = BB_GetCertificateFileNameClick
      end
      object E_CertificateFileName: TEdit
        Left = 11
        Top = 200
        Width = 329
        Height = 21
        TabOrder = 9
        Text = 'E_CertificateFileName'
      end
      object E_Passw: TEdit
        Left = 78
        Top = 279
        Width = 121
        Height = 21
        TabOrder = 10
        Text = 'E_Passw'
      end
      object DTP_Date_End: TDateTimePicker
        Left = 314
        Top = 279
        Width = 106
        Height = 21
        Date = 45343.000000000000000000
        Time = 45343.000000000000000000
        TabOrder = 11
      end
    end
  end
  object QTT: TADOQuery
    Connection = F_Main.ADOConnection1
    CursorType = ctStatic
    AfterScroll = QTTAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select C.ID_CLIENTS, C.CLIENT, C.ADRES, KC.KATEGOR'
      ''
      'from CLIENTS C'
      'left outer join KATEG_CLI KC on  KC.ID_KATEGOR= C.ID_KATEGOR'
      'where C.ID_KATEGOR=2'
      '    '
      '     and C.IS_DELETE=0'
      'order by C.CLIENT'
      '')
    Left = 528
    Top = 145
    object QTTID_CLIENTS: TAutoIncField
      FieldName = 'ID_CLIENTS'
      ReadOnly = True
    end
    object QTTCLIENT: TWideStringField
      DisplayLabel = #1058#1086#1088#1075#1086#1074#1072#1103' '#1090#1086#1095#1082#1072
      DisplayWidth = 50
      FieldName = 'CLIENT'
      Size = 255
    end
    object QTTADRES: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'ADRES'
      Size = 255
    end
    object QTTKATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'KATEGOR'
      Size = 50
    end
  end
  object DS_QTT: TDataSource
    DataSet = QTT
    Left = 608
    Top = 161
  end
  object OpenDialog1: TOpenDialog
    Left = 337
    Top = 329
  end
end
