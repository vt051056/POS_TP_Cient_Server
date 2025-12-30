object F_Restore_Doc: TF_Restore_Doc
  Left = 0
  Top = 0
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1085#1077#1089#1086#1093#1088#1072#1085#1077#1085#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 216
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 152
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 685
      Height = 150
      Align = alClient
      DataSource = DS_QNOT_SAVED_DOC
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 152
    Width = 687
    Height = 64
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 472
      Top = 8
      Width = 153
      Height = 49
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object BBRestore: TBitBtn
      Left = 16
      Top = 8
      Width = 153
      Height = 49
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BBRestoreClick
    end
  end
  object QNOT_SAVED_DOC: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select U.NAME, DT.NAMEDOC, CLD.CLIENT as CLI_D,  CLK.CLIENT as C' +
        'LI_K, NSD.[NN], NSD.[D], '
      
        #9#9'NSD.[ID_USER], NSD.[ID_DOC_TYPE], NSD.[ID_CLI_D], NSD.[ID_CLI_' +
        'K], NSD.ID_NOT_SAVED_DOC'
      #9'  from  [dbo].[NOT_SAVED_DOC] NSD'
      #9'  inner join [dbo].[USERS] U on U.ID_USERS=NSD.ID_USER'
      #9'  inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NSD.ID_DOC_TYPE'
      #9'  inner join CLIENTS CLD on CLD.ID_CLIENTS=NSD.ID_CLI_D'
      #9'  inner join CLIENTS CLK on CLK.ID_CLIENTS=NSD.ID_CLI_K'
      ''
      '')
    Left = 395
    Top = 27
    object QNOT_SAVED_DOCNAME: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 10
      FieldName = 'NAME'
      Size = 50
    end
    object QNOT_SAVED_DOCNAMEDOC: TWideStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      DisplayWidth = 20
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object QNOT_SAVED_DOCCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 20
      FieldName = 'CLI_D'
      Size = 255
    end
    object QNOT_SAVED_DOCCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 20
      FieldName = 'CLI_K'
      Size = 255
    end
    object QNOT_SAVED_DOCNN: TWideStringField
      DisplayLabel = #8470#1076#1086#1082
      DisplayWidth = 10
      FieldName = 'NN'
      Size = 50
    end
    object QNOT_SAVED_DOCD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
    end
    object QNOT_SAVED_DOCID_USER: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      FieldName = 'ID_USER'
    end
    object QNOT_SAVED_DOCID_DOC_TYPE: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1076#1086#1082
      FieldName = 'ID_DOC_TYPE'
    end
    object QNOT_SAVED_DOCID_CLI_D: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1076#1077#1073
      FieldName = 'ID_CLI_D'
    end
    object QNOT_SAVED_DOCID_CLI_K: TIntegerField
      DisplayLabel = #1082#1086#1076' '#1082#1088#1077#1076
      FieldName = 'ID_CLI_K'
    end
    object QNOT_SAVED_DOCID_NOT_SAVED_DOC: TAutoIncField
      DisplayLabel = #1082#1086#1076' '#1079#1072#1087#1080#1089#1080
      FieldName = 'ID_NOT_SAVED_DOC'
      ReadOnly = True
    end
  end
  object DS_QNOT_SAVED_DOC: TDataSource
    DataSet = QNOT_SAVED_DOC
    Left = 400
    Top = 80
  end
  object SP_RESTORE_NOT_SAVED_DOC: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'RESTORE_NOT_SAVED_DOC;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NOT_SAVED_DOC'
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
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 255
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
    Left = 203
    Top = 39
  end
end
