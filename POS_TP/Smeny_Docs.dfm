object F_Smeny_Docs: TF_Smeny_Docs
  Left = 0
  Top = 0
  Caption = #1057#1084#1077#1085#1099' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 563
  ClientWidth = 858
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
    Top = 0
    Width = 858
    Height = 563
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 856
      Height = 113
      Align = alTop
      TabOrder = 0
      object LabelError: TLabel
        Left = 472
        Top = 48
        Width = 327
        Height = 19
        Caption = #1045#1089#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BBGetShifts: TBitBtn
        Left = 291
        Top = 17
        Width = 152
        Height = 35
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1084#1077#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BBGetShiftsClick
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 7
        Width = 277
        Height = 89
        Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 26
          Width = 7
          Height = 19
          Caption = #1089
        end
        object Label4: TLabel
          Left = 6
          Top = 57
          Width = 18
          Height = 19
          Caption = #1087#1086
        end
        object D_From: TDateTimePicker
          Left = 33
          Top = 23
          Width = 119
          Height = 27
          Date = 38613.000000000000000000
          Time = 38613.000000000000000000
          TabOrder = 0
        end
        object D_To: TDateTimePicker
          Left = 33
          Top = 54
          Width = 119
          Height = 27
          Date = 38613.999988425930000000
          Time = 38613.999988425930000000
          TabOrder = 1
        end
        object T_From: TDateTimePicker
          Left = 158
          Top = 23
          Width = 107
          Height = 27
          Date = 38774.000000000000000000
          Time = 38774.000000000000000000
          Kind = dtkTime
          TabOrder = 2
        end
        object T_To: TDateTimePicker
          Left = 158
          Top = 54
          Width = 107
          Height = 27
          Date = 38774.999988425930000000
          Time = 38774.999988425930000000
          Kind = dtkTime
          TabOrder = 3
        end
      end
      object BBGetZRep: TBitBtn
        Left = 291
        Top = 58
        Width = 152
        Height = 35
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' Z-'#1086#1090#1095#1077#1090' '#1089#1084#1077#1085#1099' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1089#1084#1077#1085
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' Z-'#1086#1090#1095#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BBGetZRepClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 114
      Width = 856
      Height = 448
      Align = alClient
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 385
        Height = 446
        Align = alLeft
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 383
          Height = 444
          Align = alClient
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 1
            Top = 26
            Width = 381
            Height = 417
            Align = alClient
            DataSource = DS_ADOTable_SHIFTS
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object DBNavigator1: TDBNavigator
            Left = 1
            Top = 1
            Width = 381
            Height = 25
            DataSource = DS_ADOTable_SHIFTS
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alTop
            TabOrder = 1
          end
        end
      end
      object Panel5: TPanel
        Left = 386
        Top = 1
        Width = 469
        Height = 446
        Align = alClient
        TabOrder = 1
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 467
          Height = 444
          Align = alClient
          TabOrder = 0
          object DBGrid4: TDBGrid
            Left = 1
            Top = 81
            Width = 465
            Height = 362
            Align = alClient
            DataSource = DS_Q_Doc_Uchet
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawDataCell = DBGrid4DrawDataCell
          end
          object Panel10: TPanel
            Left = 1
            Top = 1
            Width = 465
            Height = 80
            Align = alTop
            TabOrder = 1
            object DBNavigator4: TDBNavigator
              Left = 9
              Top = 9
              Width = 128
              Height = 25
              DataSource = DS_Q_Doc_Uchet
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
            end
            object BBRepairAll: TBitBtn
              Left = 183
              Top = 41
              Width = 146
              Height = 29
              Hint = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1090#1082#1088#1099#1090#1086#1081' '#1089#1084#1077#1085#1099')'
              Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1074#1089#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBRepairAllClick
            end
            object BBGetDocList: TBitBtn
              Left = 151
              Top = 6
              Width = 178
              Height = 29
              Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1089#1084#1077#1085#1099' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1089#1084#1077#1085
              Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BBGetDocListClick
            end
            object BBRepairCurrent: TBitBtn
              Left = 9
              Top = 41
              Width = 168
              Height = 29
              Hint = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1090#1082#1088#1099#1090#1086#1081' '#1089#1084#1077#1085#1099')'
              Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BBRepairCurrentClick
            end
            object BBMoveNotRegDocToOpenShift: TBitBtn
              Left = 335
              Top = 6
              Width = 27
              Height = 28
              Hint = 
                #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1085#1077#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1086#1090#1082#1088#1099#1090#1091#1102' '#1090#1077#1082#1091#1097#1091#1102' '#1089#1084#1077#1085 +
                #1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
                FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
                990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
                990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
                FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
                00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
                0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
                00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
                03FF3777773337777333333333333333333F3333333333333333}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = BBMoveNotRegDocToOpenShiftClick
            end
            object BBMoveAllNotRegDocToOpenShift: TBitBtn
              Left = 368
              Top = 6
              Width = 27
              Height = 28
              Hint = 
                #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074#1089#1077' '#1085#1077#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1086#1090#1082#1088#1099#1090#1091#1102' '#1090#1077#1082#1091#1097#1091#1102 +
                ' '#1089#1084#1077#1085#1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
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
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BBMoveAllNotRegDocToOpenShiftClick
            end
          end
        end
      end
    end
  end
  object ADOTable_SHIFTS: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOTable_SHIFTSAfterScroll
    TableName = 'SHIFTS'
    Left = 64
    Top = 168
    object ADOTable_SHIFTSShiftId: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090' '#1089#1084#1077#1085#1099
      FieldName = 'ShiftId'
    end
    object ADOTable_SHIFTSOpened: TDateTimeField
      DisplayLabel = #1054#1090#1082#1088#1099#1090#1072
      FieldName = 'Opened'
    end
    object ADOTable_SHIFTSClosed: TDateTimeField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object ADOTable_SHIFTSZRepFiscalNum: TWideStringField
      DisplayLabel = #1060#1080#1089#1082' '#8470' Z-'#1086#1090#1095#1077#1090#1072
      DisplayWidth = 20
      FieldName = 'ZRepFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSOpenShiftFiscalNum: TWideStringField
      DisplayWidth = 20
      FieldName = 'OpenShiftFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSCloseShiftFiscalNum: TWideStringField
      DisplayWidth = 20
      FieldName = 'CloseShiftFiscalNum'
      Size = 50
    end
    object ADOTable_SHIFTSOpenName: TWideStringField
      DisplayWidth = 30
      FieldName = 'OpenName'
      Size = 255
    end
    object ADOTable_SHIFTSOpenSubjectKeyId: TWideStringField
      DisplayWidth = 30
      FieldName = 'OpenSubjectKeyId'
      Size = 255
    end
    object ADOTable_SHIFTSCloseName: TWideStringField
      DisplayWidth = 30
      FieldName = 'CloseName'
      Size = 255
    end
    object ADOTable_SHIFTSCloseSubjectKeyId: TWideStringField
      DisplayWidth = 30
      FieldName = 'CloseSubjectKeyId'
      Size = 255
    end
    object ADOTable_SHIFTSID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
  end
  object DS_ADOTable_SHIFTS: TDataSource
    DataSet = ADOTable_SHIFTS
    Left = 136
    Top = 176
  end
  object ADOCommandDeleteShifts: TADOCommand
    CommandText = '--use NMK_TP'#13#10'delete [dbo].[SHIFTS] where [ID_USER]=:ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 72
    Top = 272
  end
  object Tb_SHIFTS_DOCUMS_RRO: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'SHIFTS_DOCUMS_RRO'
    Left = 328
    Top = 160
    object Tb_SHIFTS_DOCUMS_RROID_USER: TIntegerField
      FieldName = 'ID_USER'
    end
    object Tb_SHIFTS_DOCUMS_RRONumFiscal: TWideStringField
      FieldName = 'NumFiscal'
      Size = 50
    end
    object Tb_SHIFTS_DOCUMS_RRONumLocal: TIntegerField
      FieldName = 'NumLocal'
    end
    object Tb_SHIFTS_DOCUMS_RRODocDateTime: TDateTimeField
      FieldName = 'DocDateTime'
    end
    object Tb_SHIFTS_DOCUMS_RRODocClass: TWideStringField
      FieldName = 'DocClass'
      Size = 50
    end
    object Tb_SHIFTS_DOCUMS_RROCheckDocType: TWideStringField
      FieldName = 'CheckDocType'
      Size = 50
    end
    object Tb_SHIFTS_DOCUMS_RROCheckDocSubType: TWideStringField
      FieldName = 'CheckDocSubType'
      Size = 50
    end
    object Tb_SHIFTS_DOCUMS_RRORevoked: TIntegerField
      FieldName = 'Revoked'
    end
    object Tb_SHIFTS_DOCUMS_RROStorned: TIntegerField
      FieldName = 'Storned'
    end
  end
  object ADOCommandDeleteTb_SHIFTS_DOCUMS_RRO: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'delete [dbo].[SHIFTS_DOCUMS_RRO] where [ID_USER]=:' +
      'ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 72
    Top = 336
  end
  object Tb_SHIFTS_DOCUM_DETAIL_RRO: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'SHIFTS_DOCUM_DETAIL_RRO'
    Left = 392
    Top = 224
    object Tb_SHIFTS_DOCUM_DETAIL_RROID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RRONumFiscal: TWideStringField
      DisplayLabel = #1060#1080#1089#1082' '#8470
      DisplayWidth = 10
      FieldName = 'NumFiscal'
      Size = 50
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RRODocDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DocDateTime'
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RROSumDoc: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082
      FieldName = 'SumDoc'
      DisplayFormat = '0.00'
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RROID_NAKLCAP: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1076#1086#1082' id_naklcap'
      FieldName = 'ID_NAKLCAP'
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RRODocSubType: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 20
      FieldName = 'DocSubType'
      Size = 50
    end
    object Tb_SHIFTS_DOCUM_DETAIL_RRONumLocal: TWideStringField
      DisplayLabel = #1051#1086#1082#1072#1083#8470
      DisplayWidth = 10
      FieldName = 'NumLocal'
      Size = 50
    end
  end
  object ADOCommandDeleteTb_SHIFTS_DOCUM_DETAIL_RRO: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'delete [dbo].[SHIFTS_DOCUM_DETAIL_RRO] where [ID_U' +
      'SER]=:ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 272
    Top = 272
  end
  object Q_Doc_Uchet: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_NUM_FISCAL_KASSA'
        DataType = ftString
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
      '--use NMK_TP'
      'declare @d_from datetime, @d_to datetime,'
      '@ID_NUM_FISCAL_KASSA nvarchar(50),'
      '@ID_USER int'
      ''
      '--set @d_from='#39'16.05.2023 11:17:02'#39
      '--set @d_to=getdate()'
      '--set @ID_NUM_FISCAL_KASSA=4000143384'
      '--set @ID_USER=32'
      'set @d_from=:d_from'
      'set @d_to=:d_to'
      'set @ID_NUM_FISCAL_KASSA=:ID_NUM_FISCAL_KASSA'
      'set @ID_USER=:ID_USER'
      
        'select DT.NAMEDOC, NC.D_CREATE, NC.[TOT_SUM], NC.[ID_NAKLCAP], N' +
        'C.[ID_DOC_TYPE], NC.[IS_REGISTER_RRO], NC.[ID_NUM_FISCAL_KASSA],'
      
        'DRRO.[NumFiscal], DRRO.[DocDateTime], DRRO.NumLocal, NC.ID_LINK_' +
        'DOC from NAKLCAP NC'
      'inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE'
      
        'left outer join [SHIFTS_DOCUM_DETAIL_RRO] DRRO on DRRO.ID_NAKLCA' +
        'P=NC.ID_NAKLCAP and DRRO.ID_USER=@ID_USER'
      
        'where NC.IS_DELETE=0 and NC.[ID_DOC_TYPE] in (200, 204, 289, 290' +
        ')'
      'and NC.D_CREATE>=@d_from and NC.D_CREATE<=@d_to'
      'and NC.[IS_CAN_REGISTRED_RRO]=1'
      'and NC.[ID_NUM_FISCAL_KASSA]=@ID_NUM_FISCAL_KASSA'
      ''
      'order by  NC.D_CREATE')
    Left = 596
    Top = 174
    object Q_Doc_UchetNAMEDOC: TWideStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      DisplayWidth = 30
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object Q_Doc_UchetTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
      DisplayFormat = '0.00'
    end
    object Q_Doc_UchetD_CREATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'D_CREATE'
    end
    object Q_Doc_UchetDocDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DocDateTime'
    end
    object Q_Doc_UchetNumFiscal: TWideStringField
      DisplayLabel = #1060#1080#1089#1082#8470
      DisplayWidth = 15
      FieldName = 'NumFiscal'
      Size = 50
    end
    object Q_Doc_UchetIS_REGISTER_RRO: TIntegerField
      FieldName = 'IS_REGISTER_RRO'
    end
    object Q_Doc_UchetID_NUM_FISCAL_KASSA: TWideStringField
      DisplayWidth = 15
      FieldName = 'ID_NUM_FISCAL_KASSA'
      Size = 50
    end
    object Q_Doc_UchetID_NAKLCAP: TAutoIncField
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
    end
    object Q_Doc_UchetID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
    end
    object Q_Doc_UchetNumLocal: TWideStringField
      DisplayWidth = 10
      FieldName = 'NumLocal'
      Size = 50
    end
    object Q_Doc_UchetID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
    end
  end
  object DS_Q_Doc_Uchet: TDataSource
    DataSet = Q_Doc_Uchet
    Left = 664
    Top = 176
  end
  object QDocPrototypeCaption: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      'select  NC.[CHECK_NUMFISCAL] from NAKLCAP NC'
      'where NC.[ID_NAKLCAP]= :ID_NAKLCAP'
      '')
    Left = 627
    Top = 249
  end
  object ADOCommandUpdateD_Create: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_NAKLCAP int'#13#10'set @ID_NAKLCAP=:ID_NAKLC' +
      'AP'#13#10#13#10'update NAKLCAP set D_CREATE=GETDATE() from NAKLCAP where I' +
      'D_NAKLCAP=@ID_NAKLCAP'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 712
    Top = 328
  end
end
