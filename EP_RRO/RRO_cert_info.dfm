object F_RRO_Sert: TF_RRO_Sert
  Left = 614
  Top = 171
  Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099' '#1060#1054#1055
  ClientHeight = 331
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
    Height = 331
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 480
      Top = 1
      Width = 304
      Height = 329
      Align = alClient
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 302
        Height = 25
        DataSource = DS_QCli
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 26
        Width = 302
        Height = 302
        Align = alClient
        DataSource = DS_QCli
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
      Width = 479
      Height = 329
      Align = alLeft
      TabOrder = 1
      object Label3: TLabel
        Left = 11
        Top = 155
        Width = 38
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object Label1: TLabel
        Left = 199
        Top = 155
        Width = 76
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      end
      object BitBtn1: TBitBtn
        Left = 192
        Top = 200
        Width = 75
        Height = 25
        Caption = #1057#1073#1088#1086#1089
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn6: TBitBtn
        Left = 27
        Top = 200
        Width = 75
        Height = 25
        Caption = #1043#1086#1090#1086#1074#1086
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
      end
      object E_Passw: TEdit
        Left = 55
        Top = 152
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'E_Passw'
      end
      object BB_GetPrivateKeyFileName: TBitBtn
        Left = 352
        Top = 110
        Width = 75
        Height = 25
        Caption = #1050#1083#1102#1095
        TabOrder = 3
        OnClick = BB_GetPrivateKeyFileNameClick
      end
      object E_PrivateKeyFileName: TEdit
        Left = 11
        Top = 112
        Width = 329
        Height = 21
        TabOrder = 4
        Text = 'E_PrivateKeyFileName'
      end
      object BB_GetCertificateFileName: TBitBtn
        Left = 352
        Top = 70
        Width = 75
        Height = 25
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
        TabOrder = 5
        OnClick = BB_GetCertificateFileNameClick
      end
      object E_CertificateFileName: TEdit
        Left = 11
        Top = 72
        Width = 329
        Height = 21
        TabOrder = 6
        Text = 'E_CertificateFileName'
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 8
        Width = 430
        Height = 49
        Caption = #1061#1086#1079#1103#1081#1089#1090#1074#1091#1102#1097#1080#1081' '#1086#1073#1098#1077#1082#1090
        TabOrder = 7
        object EClient: TEdit
          Left = 8
          Top = 17
          Width = 353
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
      end
      object DTP_Date_End: TDateTimePicker
        Left = 287
        Top = 152
        Width = 106
        Height = 21
        Date = 45343.000000000000000000
        Time = 45343.000000000000000000
        TabOrder = 8
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 409
    Top = 209
  end
  object QCli: TADOQuery
    Connection = F_Main.ADOConnection1
    CursorType = ctStatic
    AfterScroll = QCliAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select C.ID_CLIENTS, C.CLIENT, C.RS, C.MFO, C.OKPO, C.INN, C.RNN' +
        ','
      
        'C.TEL, C.DIRECTOR, C.BUHGALTER, C.ADRES, C.BANK, C.ID_KATEGOR, C' +
        '.AUX_INFO,'
      'KC.KATEGOR'
      ''
      'from CLIENTS C'
      'left outer join KATEG_CLI KC on  KC.ID_KATEGOR= C.ID_KATEGOR'
      'where C.ID_KATEGOR=50'
      '    '
      '     and C.IS_DELETE=0'
      'order by C.CLIENT')
    Left = 528
    Top = 145
    object QCliID_CLIENTS: TAutoIncField
      FieldName = 'ID_CLIENTS'
      ReadOnly = True
    end
    object QCliCLIENT: TWideStringField
      FieldName = 'CLIENT'
      Size = 255
    end
    object QCliRS: TWideStringField
      FieldName = 'RS'
      Size = 40
    end
    object QCliMFO: TWideStringField
      FieldName = 'MFO'
    end
    object QCliOKPO: TWideStringField
      FieldName = 'OKPO'
    end
    object QCliINN: TWideStringField
      FieldName = 'INN'
    end
    object QCliRNN: TWideStringField
      FieldName = 'RNN'
    end
    object QCliTEL: TWideStringField
      FieldName = 'TEL'
      Size = 15
    end
    object QCliDIRECTOR: TWideStringField
      FieldName = 'DIRECTOR'
      Size = 50
    end
    object QCliBUHGALTER: TWideStringField
      FieldName = 'BUHGALTER'
      Size = 50
    end
    object QCliADRES: TWideStringField
      FieldName = 'ADRES'
      Size = 255
    end
    object QCliBANK: TWideStringField
      FieldName = 'BANK'
      Size = 50
    end
    object QCliID_KATEGOR: TIntegerField
      FieldName = 'ID_KATEGOR'
    end
    object QCliAUX_INFO: TWideStringField
      FieldName = 'AUX_INFO'
      Size = 50
    end
    object QCliKATEGOR: TWideStringField
      FieldName = 'KATEGOR'
      Size = 50
    end
  end
  object DS_QCli: TDataSource
    DataSet = QCli
    Left = 608
    Top = 161
  end
end
