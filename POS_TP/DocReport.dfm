object F_DocReport: TF_DocReport
  Left = 110
  Top = 0
  Caption = #1048#1090#1086#1075#1086#1074#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  ClientHeight = 611
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 611
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 614
    ExplicitHeight = 661
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 744
      Height = 181
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 612
      object Label3: TLabel
        Left = 12
        Top = 7
        Width = 35
        Height = 19
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 273
        Top = 7
        Width = 18
        Height = 19
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 405
        Top = 7
        Width = 46
        Height = 19
        Caption = #1057#1091#1084#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 12
        Top = 39
        Width = 166
        Height = 19
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RG_Sverka: TRadioGroup
        Left = 299
        Top = 92
        Width = 179
        Height = 67
        Caption = #1057#1074#1077#1088#1082#1072
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1053#1077#1074#1077#1088#1085#1086
          #1042#1077#1088#1085#1086)
        ParentFont = False
        TabOrder = 0
        OnClick = RG_SverkaClick
      end
      object GroupBox5: TGroupBox
        Left = 5
        Top = 92
        Width = 289
        Height = 67
        Caption = #1055#1086#1080#1089#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Edit1: TEdit
          Left = 7
          Top = 27
          Width = 94
          Height = 27
          TabOrder = 0
          OnChange = Edit1Change
        end
        object BBSearchDown: TBitBtn
          Left = 108
          Top = 22
          Width = 39
          Height = 32
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
          Left = 153
          Top = 22
          Width = 36
          Height = 32
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
          Left = 195
          Top = 17
          Width = 85
          Height = 17
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
          Caption = #1082#1086#1085#1090#1077#1082#1089#1090
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 195
          Top = 40
          Width = 85
          Height = 17
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1087#1086#1083#1102' '#1085#1072#1088#1080#1084#1077#1088' '#1076#1083#1103' '#1095#1080#1089#1077#1083' >5; <7 '
          Caption = #1092#1080#1083#1100#1090#1088
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = CheckBox2Click
        end
      end
      object DBEdit1: TDBEdit
        Left = 53
        Top = 9
        Width = 190
        Height = 27
        DataField = 'DD'
        DataSource = DSQDocRepotr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 297
        Top = 9
        Width = 88
        Height = 27
        DataField = 'NN'
        DataSource = DSQDocRepotr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 457
        Top = 9
        Width = 128
        Height = 27
        DataField = 'SS'
        DataSource = DSQDocRepotr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 12
        Top = 64
        Width = 573
        Height = 27
        DataField = 'COMMENT'
        DataSource = DSQDocRepotr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object BBClose: TBitBtn
        Left = 484
        Top = 97
        Width = 113
        Height = 62
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkClose
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
        OnClick = BBCloseClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 182
      Width = 744
      Height = 237
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 612
      ExplicitHeight = 246
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 742
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 610
        object DBNavigator1: TDBNavigator
          Left = 37
          Top = 4
          Width = 184
          Height = 28
          DataSource = DS_Q_Detail_Tov
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 42
        Width = 742
        Height = 194
        Align = alClient
        DataSource = DS_Q_Detail_Tov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 419
      Width = 744
      Height = 191
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 410
      ExplicitWidth = 722
      object L_not_final: TLabel
        Left = 24
        Top = 117
        Width = 167
        Height = 19
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1079#1072#1074#1077#1088#1096#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 52
        Width = 273
        Height = 47
        Caption = #1052#1103#1089#1086
        TabOrder = 0
        object DBText9: TDBText
          Left = 138
          Top = 13
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_MYASO'
          DataSource = DSQDocRepotr
        end
        object Label10: TLabel
          Left = 16
          Top = 13
          Width = 72
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1084#1103#1089#1091
        end
        object Label11: TLabel
          Left = 16
          Top = 29
          Width = 76
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1084#1103#1089#1091
        end
        object DBText10: TDBText
          Left = 138
          Top = 29
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_MYASO'
          DataSource = DSQDocRepotr
        end
      end
      object GroupBox4: TGroupBox
        Left = 287
        Top = 52
        Width = 273
        Height = 47
        Caption = #1058#1053#1055
        TabOrder = 1
        object DBText12: TDBText
          Left = 138
          Top = 15
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_TNP'
          DataSource = DSQDocRepotr
        end
        object Label13: TLabel
          Left = 16
          Top = 15
          Width = 69
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1058#1053#1055
        end
        object Label14: TLabel
          Left = 16
          Top = 30
          Width = 73
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1058#1053#1055
        end
        object DBText13: TDBText
          Left = 138
          Top = 30
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_TNP'
          DataSource = DSQDocRepotr
        end
      end
      object GroupBox2: TGroupBox
        Left = 287
        Top = 3
        Width = 273
        Height = 47
        Caption = #1050#1086#1083#1073#1072#1089#1072
        TabOrder = 2
        object DBText6: TDBText
          Left = 138
          Top = 14
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'S_KOLBASA'
          DataSource = DSQDocRepotr
        end
        object Label7: TLabel
          Left = 16
          Top = 14
          Width = 90
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1082#1086#1083#1073#1072#1089#1077
        end
        object Label8: TLabel
          Left = 16
          Top = 30
          Width = 94
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1082#1086#1083#1073#1072#1089#1077
        end
        object DBText7: TDBText
          Left = 138
          Top = 30
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'SN_KOLBASA'
          DataSource = DSQDocRepotr
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 3
        Width = 273
        Height = 47
        Caption = #1042#1089#1077#1075#1086
        TabOrder = 3
        object DBTextS_2KAT: TDBText
          Left = 138
          Top = 14
          Width = 120
          Height = 19
          Alignment = taRightJustify
          DataField = 'S_INV'
          DataSource = DSQDocRepotr
        end
        object Label1: TLabel
          Left = 16
          Top = 14
          Width = 104
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        end
        object Label2: TLabel
          Left = 16
          Top = 29
          Width = 108
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        end
        object DBText1: TDBText
          Left = 138
          Top = 29
          Width = 120
          Height = 17
          Alignment = taRightJustify
          DataField = 'N_INV'
          DataSource = DSQDocRepotr
        end
      end
      object BitBtn2: TBitBtn
        Left = 214
        Top = 143
        Width = 183
        Height = 32
        Caption = #1055#1077#1095#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtn2Click
      end
      object BB_Final: TBitBtn
        Left = 8
        Top = 142
        Width = 183
        Height = 33
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  object QDocRepotr: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      'declare @ID_NAKLCAP int'
      ''
      'set @ID_NAKLCAP=  :ID_NAKLCAP'
      '--set @ID_NAKLCAP=32096'
      ''
      'declare @S_INV float; -- '#1089#1091#1084#1084#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' '#1074#1089#1077#1075#1086
      'declare @N_INV float; -- '#1082#1086#1083'-'#1074#1086' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' '#1074#1089#1077#1075#1086
      ''
      '-- '#1080#1090#1086#1075#1086
      'Set @S_INV=0.0;'
      'Set @N_INV=0.0;'
      
        'select @S_INV=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),  @N_INV=isn' +
        'ull(SUM(NT.[NUMB]),0.0) from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      ''
      ''
      'declare @S_KOLBASA float; -- '#1089#1091#1084#1084#1072'  '#1082#1086#1083#1073#1072#1089#1072
      'declare @SN_KOLBASA float;'
      '-- '#1082#1086#1083#1073#1072#1089#1099
      'Set @S_KOLBASA=0.0;'
      'set @SN_KOLBASA=0.0;'
      
        'select @S_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @SN_KOL' +
        'BASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      'and T.ID_GRTOV in (8, 15, 5, 19, 22, 36, 24, 40, 44)'
      ''
      ''
      ''
      ''
      'declare @S_MYASO float; -- '#1089#1091#1084#1084#1072'  '#1084#1103#1089#1086
      'declare @SN_MYASO float;'
      '-- '#1084#1103#1089#1072
      'Set @S_MYASO=0.0;'
      'set @SN_MYASO=0.0;'
      'select @S_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      '@SN_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      'and T.ID_GRTOV =38'
      ''
      ''
      'declare @S_TNP float; -- '#1089#1091#1084#1084#1072' '#1096#1090#1091#1095#1082#1072
      'declare @SN_TNP float;'
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1090#1085#1087
      'Set @S_TNP=0.0;'
      'set @SN_TNP=0.0;'
      'select @S_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      '@SN_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      'and not (T.ID_GRTOV in (5,8,15,19,22,24,36, 38, 40,44))'
      ''
      'declare @DD datetime;'
      
        'declare @NN nvarchar(50), @COMMENT nvarchar(255), @SS float, @NA' +
        'ME_DOC nvarchar(255), @ID_CHAR_DOC int, @IS_FINAL int;'
      ''
      ''
      
        'select @DD=NC.D, @NN=NC.NN, @SS=NC.TOT_SUM, @COMMENT=NC.ZATRNAME' +
        ', @NAME_DOC=DT.NAMEDOC, @ID_CHAR_DOC=DT.ID_CHAR_DOC,'
      '@IS_FINAL=NC.IS_FINAL'
      '  from [dbo].[NAKLCAP] NC'
      '  inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      ''
      ''
      ''
      ''
      'select @S_INV as S_INV, @N_INV as N_INV,'
      '@S_KOLBASA as S_KOLBASA, @SN_KOLBASA as SN_KOLBASA,'
      '@S_MYASO as S_MYASO,  @SN_MYASO as SN_MYASO,'
      
        '@S_TNP as S_TNP, @SN_TNP as SN_TNP, @DD as DD, @NN as NN, @SS as' +
        ' SS,'
      
        '@COMMENT as COMMENT, @NAME_DOC as NAME_DOC, @ID_CHAR_DOC as ID_C' +
        'HAR_DOC,'
      '@IS_FINAL as IS_FINAL'
      ''
      '')
    Left = 303
    Top = 187
    object QDocRepotrS_INV: TFloatField
      FieldName = 'S_INV'
      ReadOnly = True
    end
    object QDocRepotrN_INV: TFloatField
      FieldName = 'N_INV'
      ReadOnly = True
    end
    object QDocRepotrS_KOLBASA: TFloatField
      FieldName = 'S_KOLBASA'
      ReadOnly = True
    end
    object QDocRepotrSN_KOLBASA: TFloatField
      FieldName = 'SN_KOLBASA'
      ReadOnly = True
    end
    object QDocRepotrS_MYASO: TFloatField
      FieldName = 'S_MYASO'
      ReadOnly = True
    end
    object QDocRepotrSN_MYASO: TFloatField
      FieldName = 'SN_MYASO'
      ReadOnly = True
    end
    object QDocRepotrS_TNP: TFloatField
      FieldName = 'S_TNP'
      ReadOnly = True
    end
    object QDocRepotrSN_TNP: TFloatField
      FieldName = 'SN_TNP'
      ReadOnly = True
    end
    object QDocRepotrDD: TDateTimeField
      FieldName = 'DD'
      ReadOnly = True
    end
    object QDocRepotrNN: TWideStringField
      FieldName = 'NN'
      ReadOnly = True
      Size = 50
    end
    object QDocRepotrSS: TFloatField
      FieldName = 'SS'
      ReadOnly = True
    end
    object QDocRepotrCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      ReadOnly = True
      Size = 255
    end
    object QDocRepotrNAME_DOC: TWideStringField
      FieldName = 'NAME_DOC'
      ReadOnly = True
      Size = 255
    end
    object QDocRepotrID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
      ReadOnly = True
    end
    object QDocRepotrIS_FINAL: TIntegerField
      FieldName = 'IS_FINAL'
      ReadOnly = True
    end
  end
  object DSQDocRepotr: TDataSource
    DataSet = QDocRepotr
    Left = 328
    Top = 115
  end
  object Q_Detail_Tov: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_NAKLCAP int'
      ''
      'set @ID_NAKLCAP=  :ID_NAKLCAP'
      ''
      
        'select NT.ID_TOV, G.GRUPTOV, T.NAME as TOV_NAME, T.EDIZM, NT.NUM' +
        'B, NT.PRICE,  (NT.[NUMB]*NT.[PRICE]) as SU'
      'from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'inner join [dbo].[GRTOV] G on G.ID_GRTOV=T.ID_GRTOV'
      'where NC.[ID_NAKLCAP]=@ID_NAKLCAP'
      ''
      '')
    Left = 439
    Top = 315
    object Q_Detail_TovID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TOV'
    end
    object Q_Detail_TovTOV_NAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'TOV_NAME'
      Size = 255
    end
    object Q_Detail_TovEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object Q_Detail_TovNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUMB'
      DisplayFormat = '0.000'
    end
    object Q_Detail_TovPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '0.00'
    end
    object Q_Detail_TovSU: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SU'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object Q_Detail_TovGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
  end
  object DS_Q_Detail_Tov: TDataSource
    DataSet = Q_Detail_Tov
    Left = 520
    Top = 315
  end
end
