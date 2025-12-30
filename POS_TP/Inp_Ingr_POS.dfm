object F_Inp_Ingr_POS: TF_Inp_Ingr_POS
  Left = 591
  Top = 208
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074
  ClientHeight = 575
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelSource: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 113
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 632
    object GroupBox2: TGroupBox
      Left = 8
      Top = 1
      Width = 809
      Height = 109
      Caption = #1047#1072#1084#1077#1085#1103#1077#1084#1099#1081' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 22
        Width = 67
        Height = 13
        Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1072
      end
      object Label2: TLabel
        Left = 12
        Top = 54
        Width = 31
        Height = 13
        Caption = #1058#1086#1074#1072#1088
      end
      object Label6: TLabel
        Left = 265
        Top = 85
        Width = 87
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090
      end
      object Label7: TLabel
        Left = 14
        Top = 85
        Width = 104
        Height = 15
        Caption = #1050#1086#1083'-'#1074#1086' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1077
      end
      object E_GRUP_Source: TEdit
        Left = 86
        Top = 18
        Width = 331
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object E_TOV_Source: TEdit
        Left = 86
        Top = 50
        Width = 331
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object E_EDIZM_Source: TEdit
        Left = 489
        Top = 76
        Width = 33
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object E_N_FACT_Source: TEdit
        Left = 358
        Top = 76
        Width = 114
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'E_N_FACT_Source'
      end
      object E_N_NORM_Source: TEdit
        Left = 124
        Top = 81
        Width = 65
        Height = 22
        ReadOnly = True
        TabOrder = 4
        Text = 'E_N_NORM_Source'
      end
    end
  end
  object PanelDest: TPanel
    Left = 0
    Top = 113
    Width = 837
    Height = 404
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 632
    ExplicitHeight = 360
    object DBGrid1: TDBGrid
      Left = 1
      Top = 201
      Width = 835
      Height = 202
      Align = alClient
      DataSource = DS_Q_Ingr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 835
      Height = 200
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 630
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 833
        Height = 101
        Align = alTop
        Caption = #1047#1072#1084#1077#1085#1103#1102#1097#1080#1081' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
        TabOrder = 0
        ExplicitWidth = 628
        object Label3: TLabel
          Left = 10
          Top = 22
          Width = 67
          Height = 13
          Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1072
        end
        object Label4: TLabel
          Left = 12
          Top = 46
          Width = 31
          Height = 13
          Caption = #1058#1086#1074#1072#1088
        end
        object DBText1: TDBText
          Left = 130
          Top = 18
          Width = 479
          Height = 17
          DataField = 'GRUPTOV'
          DataSource = DS_Q_Ingr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 56
          Top = 41
          Width = 553
          Height = 17
          DataField = 'NAME'
          DataSource = DS_Q_Ingr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 201
          Top = 68
          Width = 52
          Height = 17
          DataField = 'EDIZM'
          DataSource = DS_Q_Ingr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 14
          Top = 73
          Width = 59
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        end
        object E_N_FACT_Dest: TEdit
          Left = 79
          Top = 64
          Width = 116
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'E_N_FACT_Dest'
        end
      end
      object GroupBox4: TGroupBox
        Left = 1
        Top = 102
        Width = 833
        Height = 97
        Align = alClient
        Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 99
        ExplicitWidth = 830
        object LGrup: TLabel
          Left = 10
          Top = 71
          Width = 42
          Height = 16
          Caption = #1043#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox3: TGroupBox
          Left = 364
          Top = 11
          Width = 383
          Height = 54
          Caption = #1055#1086#1080#1089#1082
          TabOrder = 0
          object Edit1: TEdit
            Left = 3
            Top = 15
            Width = 193
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = Edit1Change
          end
          object BBSearchDown: TBitBtn
            Left = 202
            Top = 10
            Width = 43
            Height = 41
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
            Left = 251
            Top = 10
            Width = 48
            Height = 41
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
            Left = 307
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
        object BBAllGrTovSel: TBitBtn
          Left = 259
          Top = 17
          Width = 78
          Height = 48
          Hint = #1042#1099#1073#1086#1088' '#1074#1089#1077#1093' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
            000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
            99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
            0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
            FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
            0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
            000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
            00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
            00FF33337FFF7FF77733333300000000033F3333777777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BBAllGrTovSelClick
        end
        object BBGrTovSel: TBitBtn
          Left = 184
          Top = 17
          Width = 69
          Height = 48
          Hint = #1042#1099#1073#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
            FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
            990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
            990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
            FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
            00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
            00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
            00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
            03FF33337FFF77777333333300000333333F3333777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BBGrTovSelClick
        end
        object DBNavigator1: TDBNavigator
          Left = 10
          Top = 17
          Width = 152
          Height = 48
          DataSource = DS_Q_Ingr
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 3
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 517
    Width = 837
    Height = 58
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 456
    ExplicitWidth = 834
    object BitBtn2: TBitBtn
      Left = 206
      Top = 6
      Width = 75
      Height = 43
      Caption = #1057#1073#1088#1086#1089
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 51
      Top = 5
      Width = 75
      Height = 44
      Caption = #1043#1086#1090#1086#1074#1086
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Q_Ingr: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--USE NMK_TP'
      'declare @ID_GRTOV int'
      'set @ID_GRTOV=:ID_GRTOV'
      ''
      'if @ID_GRTOV<>-1'
      'begin'
      
        #9'select T.[ID_TOV], T.[NAME], T.[EDIZM], T.[CODE], T.[ID_GRTOV],' +
        ' G.GRUPTOV from TOV T'
      #9'inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      #9'where T.[ID_GRTOV]=@ID_GRTOV'
      #9'order by G.GRUPTOV, T.[NAME]'
      ''
      'end'
      'else'
      'begin'
      
        #9'select T.[ID_TOV], T.[NAME], T.[EDIZM], T.[CODE], T.[ID_GRTOV],' +
        ' G.GRUPTOV from TOV T'
      #9'inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      #9'order by G.GRUPTOV, T.[NAME]'
      'end;'
      '')
    Left = 168
    Top = 344
    object Q_IngrID_TOV: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1090#1086#1074
      FieldName = 'ID_TOV'
      ReadOnly = True
    end
    object Q_IngrNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object Q_IngrEDIZM: TWideStringField
      DisplayLabel = #1080#1079#1084
      FieldName = 'EDIZM'
      ReadOnly = True
      Size = 5
    end
    object Q_IngrCODE: TWideStringField
      DisplayLabel = #1064#1090#1088#1080#1093#1082#1086#1076
      FieldName = 'CODE'
      ReadOnly = True
    end
    object Q_IngrGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object Q_IngrID_GRTOV: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1075#1088' '#1090#1086#1074
      FieldName = 'ID_GRTOV'
      ReadOnly = True
    end
  end
  object DS_Q_Ingr: TDataSource
    DataSet = Q_Ingr
    Left = 240
    Top = 344
  end
end
