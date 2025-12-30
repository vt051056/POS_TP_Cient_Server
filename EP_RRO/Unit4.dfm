object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 478
  ClientWidth = 889
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
    Left = 8
    Top = 4
    Width = 63
    Height = 13
    Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
  end
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 28
    Height = 13
    Caption = #1050#1083#1102#1095
  end
  object Button4: TButton
    Left = 480
    Top = 24
    Width = 75
    Height = 25
    Caption = 'ServerState'
    TabOrder = 0
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 48
    Top = 312
    Width = 609
    Height = 153
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object BGetCertificate: TButton
    Left = 704
    Top = 16
    Width = 113
    Height = 25
    Caption = 'BGetCertificate'
    TabOrder = 2
    OnClick = BGetCertificateClick
  end
  object BGetPrivateKey: TButton
    Left = 704
    Top = 47
    Width = 113
    Height = 25
    Caption = 'BGetPrivateKey'
    TabOrder = 3
    OnClick = BGetPrivateKeyClick
  end
  object BGetObjects: TButton
    Left = 704
    Top = 78
    Width = 113
    Height = 25
    Caption = 'BGetObjects'
    TabOrder = 4
    OnClick = BGetObjectsClick
  end
  object BSetup: TButton
    Left = 704
    Top = 120
    Width = 113
    Height = 25
    Caption = 'BSetup'
    TabOrder = 5
    OnClick = BSetupClick
  end
  object E_Certificat: TEdit
    Left = 8
    Top = 18
    Width = 409
    Height = 21
    TabOrder = 6
    Text = 'E_Certificat'
  end
  object E_Key: TEdit
    Left = 8
    Top = 51
    Width = 409
    Height = 21
    TabOrder = 7
    Text = 'E_Key'
  end
  object BBSelectCert: TBitBtn
    Left = 423
    Top = 16
    Width = 26
    Height = 25
    TabOrder = 8
    OnClick = BBSelectCertClick
  end
  object BBSelectKey: TBitBtn
    Left = 423
    Top = 47
    Width = 26
    Height = 25
    TabOrder = 9
  end
  object BOpenShift: TButton
    Left = 704
    Top = 222
    Width = 113
    Height = 25
    Caption = 'BOpenShift'
    TabOrder = 10
    OnClick = BOpenShiftClick
  end
  object BSetupRegistrar: TButton
    Left = 704
    Top = 160
    Width = 113
    Height = 25
    Caption = 'BSetupRegistrar'
    TabOrder = 11
    OnClick = BSetupRegistrarClick
  end
  object BTransactionsRegistrarState: TButton
    Left = 704
    Top = 191
    Width = 153
    Height = 25
    Caption = 'BTransactionsRegistrarState'
    TabOrder = 12
    OnClick = BTransactionsRegistrarStateClick
  end
  object BCloseShift: TButton
    Left = 704
    Top = 288
    Width = 105
    Height = 25
    Caption = 'BCloseShift'
    TabOrder = 13
    OnClick = BCloseShiftClick
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 608
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Left = 408
    Top = 80
  end
end
