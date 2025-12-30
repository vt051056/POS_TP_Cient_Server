object F_TovReport: TF_TovReport
  Left = 0
  Top = 0
  Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1090#1095#1077#1090
  ClientHeight = 445
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 445
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 48
      Align = alTop
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 15
        Top = 10
        Width = 220
        Height = 25
        DataSource = DS_QTovReport
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 280
        Top = 3
        Width = 345
        Height = 39
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 1
        object Edit1: TEdit
          Left = 8
          Top = 14
          Width = 193
          Height = 21
          TabOrder = 0
          OnChange = Edit1Change
        end
        object BBSearchDown: TBitBtn
          Left = 209
          Top = 10
          Width = 25
          Height = 25
          Hint = #1055#1086#1080#1089#1082' '#1074#1085#1080#1079
          Enabled = False
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
          Left = 241
          Top = 10
          Width = 25
          Height = 25
          Hint = #1055#1086#1080#1089#1082' '#1074#1074#1077#1088#1093
          Enabled = False
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
          Left = 269
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
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 49
      Width = 729
      Height = 335
      Align = alClient
      DataSource = DS_QTovReport
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 384
      Width = 729
      Height = 60
      Align = alBottom
      TabOrder = 2
      object BBClose: TBitBtn
        Left = 579
        Top = 4
        Width = 120
        Height = 52
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkClose
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = BBCloseClick
      end
    end
  end
  object QTovProdaga: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QTovProdagaCalcFields
    Parameters = <
      item
        Name = 'D_From'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_To'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '-- use NMK_TP'
      ''
      'declare @D_From datetime'
      'declare @D_To datetime'
      'declare @ID_USER int'
      ''
      ' --set @D_From='#39'01.04.2020'#39
      ' --set @D_To='#39'01.04.2020 23:59:59'#39
      ' --set @ID_USER=32'
      ''
      ' set @D_From=:D_From;'
      ' set @D_To=:D_To;'
      ' set @ID_USER=:ID_USER;'
      ''
      ''
      ''
      ''
      ''
      
        'select  GT.GRUPTOV, T.ID_GRTOV, T.NAME, NT.ID_TOV, isnull(SUM(NT' +
        '.[NUMB]*NT.[PRICE]),0.0) as S_REAL,'
      
        'isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0) as S_UCHET, isnull(SUM' +
        '(NT.[NUMB]),0.0) as SN_TOV'
      'from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'inner join [dbo].[GRTOV] GT on GT.ID_GRTOV=T.ID_GRTOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200'
      'and PR.ID_USERS=@ID_USER'
      'group by GT.GRUPTOV, T.ID_GRTOV, T.NAME, NT.ID_TOV'
      'order by GT.GRUPTOV, T.NAME'
      ''
      '')
    Left = 127
    Top = 233
    object QTovProdagaGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QTovProdagaID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object QTovProdagaNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 255
    end
    object QTovProdagaID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TOV'
    end
    object QTovProdagaSN_TOV: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'SN_TOV'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovProdagacena_real: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldKind = fkCalculated
      FieldName = 'cena_real'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object QTovProdagacena_uchet: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1091#1095#1077#1090#1085#1072#1103
      FieldKind = fkCalculated
      FieldName = 'cena_uchet'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object QTovProdagaS_REAL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'S_REAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QTovProdagaS_UCHET: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1091#1095#1077#1090#1085#1072#1103
      FieldName = 'S_UCHET'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QTovProdagaucenka: TFloatField
      DisplayLabel = #1059#1094#1077#1085#1082#1072
      FieldKind = fkCalculated
      FieldName = 'ucenka'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object DS_QTovReport: TDataSource
    DataSet = QTovProdaga
    Left = 344
    Top = 241
  end
  object QTovOborot: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QTovProdagaCalcFields
    Parameters = <
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ' --use NMK_TP_EXPERIMENT'
      ''
      ''
      'declare @D_FROM datetime, @D_TO datetime'
      '--set @D_FROM='#39'21.06.2023'#39
      '--set @D_TO='#39'21.06.2023 23:59:59'#39
      ''
      'set @D_FROM=:D_FROM'
      'set @D_TO=:D_TO'
      ''
      'declare @D_LAST_INV datetime -- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
      'set @D_LAST_INV=0'
      
        'select @D_LAST_INV=isnull(max(D),0) from [dbo].[NAKLCAP]  where ' +
        '[ID_DOC_TYPE]=206 and D<@D_FROM and [IS_DELETE]=0'
      ''
      'create table #tov_oborot (ID_TOV int,'
      
        'N_0 float, N_D_VENDOR_0 float, N_D_PRVO_0 float, N_D_BUYER_0 flo' +
        'at, N_K_BUYER_0 float, N_K_VENDOR_0 float, N_K_PRVO_0 float,'
      
        'N_1 float, N_D_VENDOR float, N_D_PRVO float, N_D_BUYER float, N_' +
        'K_BUYER float, N_K_VENDOR float, N_K_PRVO float, N_2 float)'
      ''
      ''
      '-- '#1090#1086#1074#1072#1088#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' (206)'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      ''
      #9'select NT.ID_TOV,'
      #9'isnull(sum([NUMB]),0), 0, 0, 0, 0, 0, 0,'
      #9' 0, 0, 0, 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D=@D_LAST_INV  and NC.[ID_DOC_TYPE] in (206) and  NC.[' +
        'IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      ''
      ''
      ''
      '-- + '#1087#1088#1080#1093#1086#1076#1086#1074' '#1058#1053#1055' (219) + '#1082#1086#1083#1073#1072#1089#1099' (209) + '#1084#1103#1089#1072' (216)'
      
        '-- POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1085#1072' '#1058#1057'(228) + POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1058#1086#1074 +
        #1072#1088#1086#1074' '#1089' '#1053#1052#1050' '#1085#1072' '#1058#1057'(230) + POS_'#1055#1088#1080#1093#1086#1076' '#1086#1074#1086#1097#1077#1081'(271)+a009 POS '#1040#1074#1090#1086' '#1055#1077#1088 +
        #1077#1076#1072#1095#1072' ('#1055#1088#1080#1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(277)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, isnull(sum([NUMB]),0), 0, 0, 0, 0, 0,'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE] ' +
        'in (209, 216, 219, 228, 230, 271, 277 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      '-- +  '#1055#1088#1080#1093#1086#1076' '#1075#1086#1090' '#1087#1088#1086#1076' '#1089#1086#1073#1089#1090#1074' '#1080#1079#1075#1086#1090' '#1089' '#1087#1088'-'#1074#1072' (288)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, isnull(sum([NUMB]),0), 0, 0, 0, 0,'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE] ' +
        'in ( 288 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      '-- +  '#1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103' (204)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, isnull(sum([NUMB]),0), 0, 0, 0,'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE] ' +
        'in ( 204 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      ''
      
        '-- '#1088#1072#1089#1093#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1087#1088#1086#1076#1072#1078#1072' (200), '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086 +
        #1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217),  '#1056#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077 +
        #1085#1090#1086#1074' '#1074' '#1087#1088'-'#1074#1086' (287)'
      
        '-- POS '#1042#1086#1079#1074#1088#1072#1090' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050' (232), POS '#1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088 +
        #1086#1074' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050'(234), POS_'#1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081'(272), POS '#1055#1077#1088#1077#1076#1072#1095#1072' ('#1056#1072#1089 +
        #1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(276)'
      ''
      '-- '#1088#1072#1089#1093#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1087#1088#1086#1076#1072#1078#1072' (200)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, isnull(sum([NUMB]),0), 0, 0,'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE]' +
        ' in (200) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      
        '-- '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217)'
      
        '--  '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), ' +
        #1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217),'
      
        '-- POS '#1042#1086#1079#1074#1088#1072#1090' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050' (232), POS '#1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088 +
        #1086#1074' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050'(234), POS_'#1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081'(272), POS '#1055#1077#1088#1077#1076#1072#1095#1072' ('#1056#1072#1089 +
        #1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(276)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, isnull(sum([NUMB]),0), 0,'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE]' +
        ' in (211, 217, 220, 232, 234, 272, 276) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      '-- '#1056#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1074' '#1087#1088'-'#1074#1086' (287)'
      '-- '#1089' @D_LAST_INV '#1087#1086' @D_FROM'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, isnull(sum([NUMB]),0),'
      #9'0, 0, 0, 0, 0, 0, 0, 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_LAST_INV and  NC.D<@D_FROM and NC.[ID_DOC_TYPE]' +
        ' in (287) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      '------------------------------------'
      ''
      ''
      '-- + '#1087#1088#1080#1093#1086#1076#1086#1074' '#1058#1053#1055' (219) + '#1082#1086#1083#1073#1072#1089#1099' (209) + '#1084#1103#1089#1072' (216)'
      
        '-- POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1085#1072' '#1058#1057'(228) + POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1058#1086#1074 +
        #1072#1088#1086#1074' '#1089' '#1053#1052#1050' '#1085#1072' '#1058#1057'(230) + POS_'#1055#1088#1080#1093#1086#1076' '#1086#1074#1086#1097#1077#1081'(271)+a009 POS '#1040#1074#1090#1086' '#1055#1077#1088 +
        #1077#1076#1072#1095#1072' ('#1055#1088#1080#1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(277)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, isnull(sum([NUMB]),0), 0, 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in (2' +
        '09, 216, 219, 228, 230, 271, 277 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      '-- +  '#1055#1088#1080#1093#1086#1076' '#1075#1086#1090' '#1087#1088#1086#1076' '#1089#1086#1073#1089#1090#1074' '#1080#1079#1075#1086#1090' '#1089' '#1087#1088'-'#1074#1072' (288)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, 0, isnull(sum([NUMB]),0), 0, 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in ( ' +
        '288 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      '-- +  '#1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103' (204)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, 0, 0, isnull(sum([NUMB]),0), 0, 0, 0, 0'
      #9'from [dbo].[NAKLTOV] NT'
      #9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in ( ' +
        '204 ) and  NC.[IS_DELETE]=0'
      #9'group by NT.ID_TOV'
      ''
      ''
      ''
      '-- '#1088#1072#1089#1093#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1087#1088#1086#1076#1072#1078#1072' (200)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, 0, 0, 0, isnull(sum([NUMB]),0), 0, 0, 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in (' +
        '200) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      
        '-- '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217)'
      
        '--  '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), ' +
        #1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217),'
      
        '-- POS '#1042#1086#1079#1074#1088#1072#1090' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050' (232), POS '#1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088 +
        #1086#1074' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050'(234), POS_'#1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081'(272), POS '#1055#1077#1088#1077#1076#1072#1095#1072' ('#1056#1072#1089 +
        #1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(276)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, 0, 0, 0, 0, isnull(sum([NUMB]),0), 0, 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in (' +
        '211, 217, 220, 232, 234, 272, 276) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      '-- '#1056#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1074' '#1087#1088'-'#1074#1086' (287)'
      '-- '#1089' @D_FROM '#1087#1086' @D_TO'
      'insert into #tov_oborot (ID_TOV,'
      
        'N_0, N_D_VENDOR_0, N_D_PRVO_0, N_D_BUYER_0, N_K_BUYER_0, N_K_VEN' +
        'DOR_0, N_K_PRVO_0,'
      
        'N_1, N_D_VENDOR, N_D_PRVO, N_D_BUYER, N_K_BUYER, N_K_VENDOR, N_K' +
        '_PRVO, N_2)'
      #9'select NT.ID_TOV,'
      #9'0, 0, 0, 0, 0, 0, 0,'
      #9'0, 0, 0, 0, 0, 0, isnull(sum([NUMB]),0), 0'
      #9#9'from [dbo].[NAKLTOV] NT'
      #9#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      
        #9#9'where NC.D>=@D_FROM and  NC.D<=@D_TO and NC.[ID_DOC_TYPE] in (' +
        '287) and  NC.[IS_DELETE]=0'
      #9#9'group by NT.ID_TOV'
      ''
      
        'update #tov_oborot set N_1=N_0+N_D_VENDOR_0+N_D_PRVO_0+N_D_BUYER' +
        '_0-N_K_BUYER_0-N_K_VENDOR_0-N_K_PRVO_0'
      
        'update #tov_oborot set N_2=N_0+N_D_VENDOR_0+N_D_PRVO_0+N_D_BUYER' +
        '_0-N_K_BUYER_0-N_K_VENDOR_0-N_K_PRVO_0+'
      
        #9#9#9#9#9#9#9#9'N_D_VENDOR+N_D_PRVO+N_D_BUYER-N_K_BUYER-N_K_VENDOR-N_K_P' +
        'RVO'
      ''
      'SELECT G.GRUPTOV, T.NAME, T.EDIZM,'
      
        'SUM(OB.N_0) as N_0, SUM(OB.N_D_VENDOR_0) as N_D_VENDOR_0, SUM(OB' +
        '.N_D_PRVO_0) as N_D_PRVO_0, SUM(OB.N_D_BUYER_0) as N_D_BUYER_0,'
      
        'SUM(OB.N_K_BUYER_0) as N_K_BUYER_0, SUM(OB.N_K_VENDOR_0) as N_K_' +
        'VENDOR_0, SUM(OB.N_K_PRVO_0) as N_K_PRVO_0,'
      
        'SUM(OB.N_1) as N_1, SUM(OB.N_D_VENDOR) as N_D_VENDOR, SUM(OB.N_D' +
        '_PRVO) as N_D_PRVO, SUM(OB.N_D_BUYER) as N_D_BUYER,'
      
        'SUM(OB.N_K_BUYER) as N_K_BUYER , SUM(OB.N_K_VENDOR) as N_K_VENDO' +
        'R, SUM(OB.N_K_PRVO) as N_K_PRVO, SUM(OB.N_2) as N_2, OB.ID_TOV'
      ''
      '  FROM #tov_oborot OB'
      '  inner join TOV T on T.ID_TOV=OB.ID_TOV'
      '  inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      '  group by G.GRUPTOV, T.NAME, T.EDIZM, OB.ID_TOV'
      '  order by G.GRUPTOV, T.NAME'
      ''
      '  drop table #tov_oborot')
    Left = 119
    Top = 297
    object QTovOborotGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QTovOborotNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 255
    end
    object QTovOborotEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QTovOborotN_0: TFloatField
      DisplayLabel = #1054#1089#1090'.'#1087#1086' '#1080#1085#1074'.'
      FieldName = 'N_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_D_VENDOR_0: TFloatField
      DisplayLabel = #1055#1088#1080#1093' '#1086#1090' '#1087#1086#1089#1090' '#1076#1086
      FieldName = 'N_D_VENDOR_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_D_PRVO_0: TFloatField
      DisplayLabel = #1055#1088#1080#1093' '#1089' '#1087#1088'-'#1074#1072' '#1076#1086
      FieldName = 'N_D_PRVO_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_D_BUYER_0: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088' '#1086#1090' '#1087#1086#1082#1091#1087' '#1076#1086
      FieldName = 'N_D_BUYER_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_BUYER_0: TFloatField
      DisplayLabel = #1055#1088#1086#1076#1072#1078#1072' '#1076#1086
      FieldName = 'N_K_BUYER_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_VENDOR_0: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088' '#1087#1086#1089#1090#1072#1074' '#1076#1086
      FieldName = 'N_K_VENDOR_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_PRVO_0: TFloatField
      DisplayLabel = #1056#1072#1089#1093' '#1074' '#1087#1088'-'#1074#1086
      FieldName = 'N_K_PRVO_0'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_1: TFloatField
      DisplayLabel = #1054#1089#1090' '#1085#1072#1095
      FieldName = 'N_1'
      ReadOnly = True
    end
    object QTovOborotN_D_VENDOR: TFloatField
      DisplayLabel = #1055#1088#1080#1093' '#1086#1090' '#1087#1086#1089#1090
      FieldName = 'N_D_VENDOR'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_D_PRVO: TFloatField
      DisplayLabel = #1055#1088#1080#1093' '#1089' '#1087#1088'-'#1074#1072
      FieldName = 'N_D_PRVO'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_D_BUYER: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088' '#1086#1090' '#1087#1086#1082#1091#1087
      FieldName = 'N_D_BUYER'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_BUYER: TFloatField
      DisplayLabel = #1055#1088#1086#1076#1072#1078#1072
      FieldName = 'N_K_BUYER'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_VENDOR: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088' '#1087#1086#1089#1090#1072#1074
      FieldName = 'N_K_VENDOR'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_K_PRVO: TFloatField
      DisplayLabel = #1056#1072#1089#1093' '#1074' '#1087#1088'-'#1074#1086
      FieldName = 'N_K_PRVO'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotN_2: TFloatField
      DisplayLabel = #1054#1089#1090'.'#1082#1086#1085
      FieldName = 'N_2'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QTovOborotID_TOV: TIntegerField
      DisplayLabel = #1082#1086#1076
      FieldName = 'ID_TOV'
    end
  end
end
