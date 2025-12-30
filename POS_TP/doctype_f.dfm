object F_doctype: TF_doctype
  Left = 239
  Top = 114
  Caption = #1058#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 507
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 711
    Height = 432
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_DOC_TYPE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAMEDOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEXT_NO'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_SCH_D'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_SCH_K'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLI_D'
        Visible = False
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CLI_D'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'KATEGOR'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLI_K'
        Visible = False
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CLI_K'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'KATEGOR_K'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CHAR_DOC'
        Visible = False
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CHAR_DOC'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPTOV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS_PER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WITH_NDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PROV_CASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_GRTOV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SALES_CATEGOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIME_DEFAULT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORM_PRN'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'SUPPL'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'LINK_NAMEDOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_LINK_DOC'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 49
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 12
      Width = 180
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 268
      Top = 6
      Width = 229
      Height = 39
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object Edit1: TEdit
        Left = 8
        Top = 14
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object BBSearchDown: TBitBtn
        Left = 98
        Top = 10
        Width = 25
        Height = 25
        Hint = #1055#1086#1080#1089#1082' '#1074#1085#1080#1079
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBSearchDownClick
      end
      object BBSearchUp: TBitBtn
        Left = 128
        Top = 10
        Width = 25
        Height = 25
        Hint = #1055#1086#1080#1089#1082' '#1074#1074#1077#1088#1093
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BBSearchUpClick
      end
      object CheckBox1: TCheckBox
        Left = 158
        Top = 14
        Width = 67
        Height = 17
        Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
        Caption = #1082#1086#1085#1090#1077#1082#1089#1090
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object BBRefresh: TBitBtn
      Left = 232
      Top = 12
      Width = 25
      Height = 25
      Hint = #1054#1089#1074#1077#1078#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BBRefreshClick
    end
    object BBDelete: TBitBtn
      Left = 188
      Top = 12
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
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
      TabOrder = 3
      OnClick = BBDeleteClick
    end
    object BitBtn1: TBitBtn
      Left = 506
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1086#1088
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 594
      Top = 16
      Width = 83
      Height = 25
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 481
    Width = 711
    Height = 26
    Align = alBottom
    TabOrder = 2
    object CBSetEdit: TCheckBox
      Left = 10
      Top = 4
      Width = 87
      Height = 17
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
      Caption = #1042#1082#1083'. '#1088#1077#1076#1072#1082#1090
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = CBSetEditClick
    end
  end
end
