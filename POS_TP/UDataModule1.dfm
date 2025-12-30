object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 757
  Width = 850
  object ADOConnection1: TADOConnection
    CommandTimeout = 300
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_TP_EXPERIMENT;Data Source=C-17\' +
      'MSSQLSRV17;Use Procedure for Prepare=1;Auto Translate=True;Packe' +
      't Size=4096;Workstation ID=C-17;Use Encryption for Data=False;Ta' +
      'g with column collation when possible=False'
    ConnectionTimeout = 3600
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ADODSUsers: TADODataSet
    AutoCalcFields = False
    Connection = ADOConnection1
    CommandText = 
      'select ID_USERS, NAME, LOGIN, STATUS, BIRTHDAY, IS_DELETE'#13#10'  fro' +
      'm USERS'#13#10'where IS_DELETE=:isdelete'#13#10' order by NAME'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 14
    object ADODSUsersID_USERS: TAutoIncField
      FieldName = 'ID_USERS'
      ReadOnly = True
      Visible = False
    end
    object ADODSUsersNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 50
    end
    object ADODSUsersLOGIN: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      DisplayWidth = 15
      FieldName = 'LOGIN'
      Size = 50
    end
    object ADODSUsersSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
    end
    object ADODSUsersBIRTHDAY: TDateTimeField
      DisplayLabel = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHDAY'
    end
    object ADODSUsersIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSUSERS: TDataSource
    DataSet = ADODSUsers
    Left = 146
    Top = 14
  end
  object Tb_USER_CONNECT: TADOTable
    Connection = ADOConnection1
    TableName = 'USER_CONNECT'
    Left = 191
    Top = 12
  end
  object Q_USER_CONNECT: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select UC.ID_USER, U.NAME U_NAME from USER_CONNECT UC'
      'inner join USERS U on U.ID_USERS=UC.ID_USER')
    Left = 231
    Top = 12
    object Q_USER_CONNECTID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
    object Q_USER_CONNECTU_NAME: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'U_NAME'
      Size = 50
    end
  end
  object DS_Q_USER_CONNECT: TDataSource
    DataSet = Q_USER_CONNECT
    Left = 263
    Top = 12
  end
  object SP_DELETE_USER_CONNECT: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_USER_CONNECT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 303
    Top = 16
  end
  object DS_SaleDocList: TDataSource
    DataSet = ADS_SaleDocList
    Left = 72
    Top = 80
  end
  object ADS_SaleDocList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADS_SaleDocListAfterScroll
    OnCalcFields = ADS_SaleDocListCalcFields
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_DOC_TYPE int, @IS_DELETE int, @DFROM d' +
      'atetime, @DTO datetime,'#13#10'@ID_USER int, @ID_USER_FROM int, @ID_US' +
      'ER_TO int, @SHOW_ALL int'#13#10#13#10'set @ID_DOC_TYPE =:IDDT'#13#10'set @IS_DEL' +
      'ETE=:ISDEL'#13#10'set @DFROM=:DFROM'#13#10'set @DTO=:DTO'#13#10'set @ID_USER=:ID_U' +
      'SER'#13#10'set @SHOW_ALL=:SHOW_ALL'#13#10#13#10'--set @ID_DOC_TYPE =206'#13#10'--set @' +
      'IS_DELETE=0'#13#10'--set @DFROM='#39'01.01.2000'#39#13#10'--set @DTO=getdate()'#13#10'--' +
      'set @ID_USER=32'#13#10'--set @SHOW_ALL=1'#13#10#13#10#13#10#13#10'if @SHOW_ALL=1'#13#10'begin'#13 +
      #10#9'set @ID_USER_FROM=0'#13#10#9'set @ID_USER_TO=2147483647'#13#10'end'#13#10'else'#13#10'b' +
      'egin'#13#10#9'set @ID_USER_FROM=@ID_USER'#13#10#9'set @ID_USER_TO=@ID_USER'#13#10'en' +
      'd;'#13#10'  '#13#10#13#10'select  NC.D, NC.NN, NC.MINUS, NC.PRICE_KATEG, NC.ID_N' +
      'AKLCAP, NC.TOT_SUM, NC.TOT_NUM, NC.SCH_D, NC.SCH_K,'#13#10' CL.CLIENT,' +
      ' NC.D_CREATE, NC.D_DELETE, NC.COMMENT_DEL,'#13#10'U."NAME"  USER_CR, U' +
      'D."NAME"  USER_DEL,'#13#10' NC.ID_GR_PROV, CLK.CLIENT CLI_K,'#13#10' DT.NAME' +
      'DOC, DCH.CHAR_DOC,NC.ID_DOC_TYPE,DT.ID_CHAR_DOC, NC.ID_CLI_K,'#13#10'N' +
      'C.IS_DELETE, NC.CLOSE_SUM, NC.FIX_PROV, CLK.INN INN_K, CL.INN IN' +
      'N_D, NC.ID_CLIENT,'#13#10'NC.SUM_OPL_BONUS, NC.SUM_OPL_CARD, NC.SUM_PO' +
      'LUCH,'#13#10'NC.SUM_SDACHI, NC.IS_EXPORT, '#13#10'NC.[SKIDKA_KOLBASA], NC.[S' +
      'KIDKA_MYASO], NC.[SKIDKA_TNP], '#13#10'NC.[PER_SKIDKA_KOLBASA], NC.[PE' +
      'R_SKIDKA_MYASO], NC.[PER_SKIDKA_TNP],'#13#10'NC.[SKIDKA_COMMENT], NC.[' +
      'MIN_KOLBASA], NC.[MIN_MYASO], NC.[MIN_TNP], NC.[ROUND_SUM],'#13#10'NC.' +
      '[CARD_NN_NOT_FISCAL], NC.[TRANS_CODE_NOT_FISCAL],'#13#10'NC.[CARD_NN_F' +
      'ISCAL], NC.[TRANS_CODE_FISCAL],'#13#10'NC.[IS_SVERENO], NC.[ID_LINK_DO' +
      'C_2], NC.SUM_SDACHI_TO_CARD, NC.[IS_CAN_REGISTRED_RRO], NC.[IS_R' +
      'EGISTER_RRO], NC.[ID_CLI_RRO], '#13#10'NC.[CHECK_NUMFISCAL], NC.[ORDER' +
      'DATETIME], CL_FOP.CLIENT as FOP,  NC.[ID_NUM_FISCAL_KASSA], NC.I' +
      'D_USERS, NC.ZATRNAME,'#13#10'NC.IS_FINAL'#13#10' from NAKLCAP NC'#13#10'left outer' +
      ' join CLIENTS CL'#13#10' on CL.ID_CLIENTS=NC.ID_CLIENT'#13#10'left outer joi' +
      'n CLIENTS CLK'#13#10' on CLK.ID_CLIENTS=NC.ID_CLI_K'#13#10'left outer join U' +
      'SERS U'#13#10' on U.ID_USERS=NC.ID_USERS'#13#10'left outer join USERS UD'#13#10' o' +
      'n UD.ID_USERS=NC.ID_USER_DEL'#13#10'left outer join DOC_TYPE DT'#13#10' on D' +
      'T.ID_DOC_TYPE=NC.ID_DOC_TYPE'#13#10'left outer join DOC_CHAR DCH'#13#10' on ' +
      'DCH.ID_CHAR_DOC=DT.ID_CHAR_DOC'#13#10#13#10' left outer join CLIENTS CL_FO' +
      'P'#13#10' on CL_FOP.ID_CLIENTS=NC.[ID_CLI_RRO]'#13#10#13#10'where NC.ID_DOC_TYPE' +
      '=@ID_DOC_TYPE'#13#10#9'and NC.IS_DELETE=@IS_DELETE'#13#10#13#10'    and NC.D >=@D' +
      'FROM'#13#10'    and NC.D<=@DTO'#13#10#9'and NC.ID_USERS>=@ID_USER_FROM and NC' +
      '.ID_USERS<=@ID_USER_TO'#13#10'order by NC.D, NC.NN'
    Parameters = <
      item
        Name = 'IDDT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ISDEL'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DFROM'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DTO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'SHOW_ALL'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 32
    Top = 80
    object ADS_SaleDocListD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
    end
    object ADS_SaleDocListNN: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NN'
      Size = 50
    end
    object ADS_SaleDocListTOT_NUM: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'TOT_NUM'
      DisplayFormat = '0.000'
    end
    object ADS_SaleDocListTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListCLIENT: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLIENT'
      Size = 255
    end
    object ADS_SaleDocListCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_K'
      Size = 255
    end
    object ADS_SaleDocListSUM_OPL_BONUS: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
      FieldName = 'SUM_OPL_BONUS'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSUM_OPL_CARD: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1082#1072#1088#1090#1086#1081
      FieldName = 'SUM_OPL_CARD'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSUM_POLUCH: TFloatField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085#1086' '#1085#1072#1083#1080#1095#1085#1099#1084#1080
      FieldName = 'SUM_POLUCH'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListROUND_SUM: TFloatField
      DisplayLabel = #1054#1082#1088#1091#1075#1083#1077#1085#1080#1103
      FieldName = 'ROUND_SUM'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSUM_SDACHI: TFloatField
      DisplayLabel = #1057#1076#1072#1095#1072
      FieldName = 'SUM_SDACHI'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListD_CREATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'D_CREATE'
    end
    object ADS_SaleDocListNAMEDOC: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 20
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object ADS_SaleDocListIS_EXPORT: TIntegerField
      DisplayLabel = #1055#1077#1088#1077#1076#1072#1085#1086' '#1085#1072' '#1089#1077#1088#1074#1077#1088
      FieldName = 'IS_EXPORT'
    end
    object ADS_SaleDocListINN_K: TWideStringField
      FieldName = 'INN_K'
      Visible = False
    end
    object ADS_SaleDocListINN_D: TWideStringField
      FieldName = 'INN_D'
      Visible = False
    end
    object ADS_SaleDocListMINUS: TFloatField
      FieldName = 'MINUS'
      Visible = False
    end
    object ADS_SaleDocListPRICE_KATEG: TIntegerField
      FieldName = 'PRICE_KATEG'
      Visible = False
    end
    object ADS_SaleDocListID_NAKLCAP: TAutoIncField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
    end
    object ADS_SaleDocListSCH_D: TStringField
      FieldName = 'SCH_D'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_SaleDocListSCH_K: TStringField
      FieldName = 'SCH_K'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_SaleDocListD_DELETE: TDateTimeField
      FieldName = 'D_DELETE'
      Visible = False
    end
    object ADS_SaleDocListCOMMENT_DEL: TWideStringField
      FieldName = 'COMMENT_DEL'
      Visible = False
      Size = 50
    end
    object ADS_SaleDocListUSER_CR: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'USER_CR'
      Size = 50
    end
    object ADS_SaleDocListUSER_DEL: TWideStringField
      FieldName = 'USER_DEL'
      Visible = False
      Size = 50
    end
    object ADS_SaleDocListID_GR_PROV: TIntegerField
      FieldName = 'ID_GR_PROV'
      Visible = False
    end
    object ADS_SaleDocListCHAR_DOC: TWideStringField
      FieldName = 'CHAR_DOC'
      Visible = False
      Size = 50
    end
    object ADS_SaleDocListID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
      Visible = False
    end
    object ADS_SaleDocListID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
      Visible = False
    end
    object ADS_SaleDocListID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object ADS_SaleDocListIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
    object ADS_SaleDocListCLOSE_SUM: TFloatField
      FieldName = 'CLOSE_SUM'
      Visible = False
    end
    object ADS_SaleDocListFIX_PROV: TIntegerField
      FieldName = 'FIX_PROV'
      Visible = False
    end
    object ADS_SaleDocListID_CLIENT: TIntegerField
      FieldName = 'ID_CLIENT'
      Visible = False
    end
    object ADS_SaleDocListSKIDKA_KOLBASA: TFloatField
      DisplayLabel = #1057#1082#1080#1076#1082#1072' '#1082#1086#1083#1073#1072#1089#1072
      FieldName = 'SKIDKA_KOLBASA'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSKIDKA_MYASO: TFloatField
      DisplayLabel = #1057#1082#1080#1076#1082#1072' '#1084#1103#1089#1086
      FieldName = 'SKIDKA_MYASO'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSKIDKA_TNP: TFloatField
      DisplayLabel = #1057#1082#1080#1076#1082#1072' '#1058#1053#1055
      FieldName = 'SKIDKA_TNP'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListPER_SKIDKA_KOLBASA: TFloatField
      DisplayLabel = '% '#1057#1082#1080#1076#1082#1080' '#1082#1086#1083#1073#1072#1089#1072
      FieldName = 'PER_SKIDKA_KOLBASA'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListPER_SKIDKA_MYASO: TFloatField
      DisplayLabel = '% '#1057#1082#1080#1076#1082#1080' '#1084#1103#1089#1086
      FieldName = 'PER_SKIDKA_MYASO'
    end
    object ADS_SaleDocListPER_SKIDKA_TNP: TFloatField
      DisplayLabel = '% '#1057#1082#1080#1076#1082#1080' '#1058#1053#1055
      FieldName = 'PER_SKIDKA_TNP'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListSKIDKA_COMMENT: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1082#1080#1076#1082#1080
      DisplayWidth = 30
      FieldName = 'SKIDKA_COMMENT'
      FixedChar = True
      Size = 255
    end
    object ADS_SaleDocListMIN_KOLBASA: TFloatField
      DisplayLabel = #1052#1080#1085' '#1082#1086#1083#1073#1072#1089#1072
      FieldName = 'MIN_KOLBASA'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListMIN_MYASO: TFloatField
      DisplayLabel = #1052#1080#1085' '#1084#1103#1089#1086
      FieldName = 'MIN_MYASO'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListMIN_TNP: TFloatField
      DisplayLabel = #1052#1080#1085' '#1058#1053#1055
      FieldName = 'MIN_TNP'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListCARD_NN_NOT_FISCAL: TWideStringField
      DisplayLabel = #1041#1072#1085#1082'_'#1082#1072#1088#1090#1072
      DisplayWidth = 10
      FieldName = 'CARD_NN_NOT_FISCAL'
      Size = 50
    end
    object ADS_SaleDocListTRANS_CODE_NOT_FISCAL: TWideStringField
      DisplayLabel = #1050#1086#1076' '#1073#1072#1085#1082' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      DisplayWidth = 10
      FieldName = 'TRANS_CODE_NOT_FISCAL'
      Size = 50
    end
    object ADS_SaleDocListCARD_NN_FISCAL: TWideStringField
      DisplayLabel = #1041#1072#1085#1082'_'#1082#1072#1088#1090#1072' '#1072#1083#1082#1086#1075
      DisplayWidth = 10
      FieldName = 'CARD_NN_FISCAL'
      Size = 50
    end
    object ADS_SaleDocListTRANS_CODE_FISCAL: TWideStringField
      DisplayLabel = #1050#1086#1076' '#1073#1072#1085#1082' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1072#1083#1082#1086#1075
      DisplayWidth = 10
      FieldName = 'TRANS_CODE_FISCAL'
      Size = 50
    end
    object ADS_SaleDocListIS_SVERENO: TIntegerField
      DisplayLabel = #1057#1074#1077#1088#1077#1085#1086
      FieldName = 'IS_SVERENO'
    end
    object ADS_SaleDocListID_LINK_DOC_2: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084' '#1074' '#1091#1095#1077#1090#1082' '#1053#1052#1050
      FieldName = 'ID_LINK_DOC_2'
    end
    object ADS_SaleDocListSUM_SDACHI_TO_CARD: TFloatField
      DisplayLabel = #1057#1076#1072#1095#1072' '#1085#1072' '#1082#1072#1088#1090#1091
      FieldName = 'SUM_SDACHI_TO_CARD'
      DisplayFormat = '0.00'
    end
    object ADS_SaleDocListIS_CAN_REGISTRED_RRO: TIntegerField
      FieldName = 'IS_CAN_REGISTRED_RRO'
    end
    object ADS_SaleDocListIS_REGISTER_RRO: TIntegerField
      FieldName = 'IS_REGISTER_RRO'
    end
    object ADS_SaleDocListID_CLI_RRO: TIntegerField
      FieldName = 'ID_CLI_RRO'
    end
    object ADS_SaleDocListCHECK_NUMFISCAL: TWideStringField
      DisplayLabel = #1060#1080#1089#1082' '#8470#1095#1077#1082#1072
      DisplayWidth = 10
      FieldName = 'CHECK_NUMFISCAL'
      Size = 50
    end
    object ADS_SaleDocListORDERDATETIME: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'ORDERDATETIME'
      Size = 50
    end
    object ADS_SaleDocListFOP: TWideStringField
      DisplayLabel = #1060#1054#1055
      DisplayWidth = 20
      FieldName = 'FOP'
      Size = 255
    end
    object ADS_SaleDocListID_NUM_FISCAL_KASSA: TWideStringField
      DisplayLabel = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#8470' '#1082#1072#1089#1089#1099
      DisplayWidth = 10
      FieldName = 'ID_NUM_FISCAL_KASSA'
      Size = 50
    end
    object ADS_SaleDocListID_USERS: TIntegerField
      FieldName = 'ID_USERS'
      Visible = False
    end
    object ADS_SaleDocListZATRNAME: TWideStringField
      DisplayLabel = #1057#1074#1077#1088#1082#1072' '#1087#1088#1086#1076#1072#1074#1094#1072#1084#1080
      DisplayWidth = 50
      FieldName = 'ZATRNAME'
      Size = 255
    end
    object ADS_SaleDocListIS_FINAL: TIntegerField
      FieldName = 'IS_FINAL'
      Visible = False
    end
    object ADS_SaleDocListis_final_doc: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldKind = fkCalculated
      FieldName = 'is_final_doc'
      Size = 30
      Calculated = True
    end
  end
  object TbClose_Date: TADOTable
    Connection = ADOConnection1
    TableName = 'CLOSE_DATE'
    Left = 356
    Top = 18
  end
  object DSClose_Date: TDataSource
    DataSet = TbClose_Date
    Left = 400
    Top = 16
  end
  object SP_DELETE_NAKL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_NAKL;1'
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
        Name = '@MODE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@COMMENT_DEL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_USER_DEL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IN_TRANSACTION'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 122
    Top = 84
  end
  object SP_FIX_PROV_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'FIX_PROV_DOC;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 180
    Top = 88
  end
  object SP_NON_FIX_PROV_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'NON_FIX_PROV_DOC;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 226
    Top = 88
  end
  object ADODSPrice: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = ADODSPriceAfterPost
    AfterScroll = ADODSPriceAfterScroll
    CommandText = 
      '-- use NMK_TP'#13#10'DECLARE @IDU INTEGER'#13#10'DECLARE @IDG INTEGER'#13#10'DECLA' +
      'RE @ID_VENDOR int'#13#10'declare @IS_EXISTS_OSTATOK int'#13#10'SET @IDU=:IDU' +
      #13#10'SET @IDG=:IDG'#13#10'SET @ID_VENDOR=:ID_VENDOR '#13#10'set @IS_EXISTS_OSTA' +
      'TOK =:v_IS_EXISTS_OSTATOK'#13#10'--SET @IDU=32'#13#10'--SET @IDG=45'#13#10'--SET @' +
      'ID_VENDOR=-1'#13#10'--set @IS_EXISTS_OSTATOK =0'#13#10#13#10'IF @ID_VENDOR=7761 ' +
      '-- '#1087#1086#1089#1090#1072#1074#1097#1080#1082' '#1086#1074#1086#1097#1077#1081#13#10'begin'#13#10#9'SET @ID_VENDOR=2729 -- '#1053#1052#1050'('#1082#1086#1083#1073#1072#1089#1072')' +
      #13#10'end;'#13#10#13#10#13#10'declare @IS_EXISTS_FROM int'#13#10'declare @IS_EXISTS_TO i' +
      'nt'#13#10'if @IS_EXISTS_OSTATOK=0'#13#10'begin'#13#10#9'set  @IS_EXISTS_FROM=0'#13#10#9'se' +
      't  @IS_EXISTS_TO=1'#13#10'end'#13#10'else '#13#10'begin'#13#10#9'set  @IS_EXISTS_FROM=1'#13#10 +
      #9'set  @IS_EXISTS_TO=1'#13#10'end;'#13#10#13#10'if (@IDG<>-1) and (@ID_VENDOR<>-1' +
      ')'#13#10'begin'#13#10#9'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE.ID_USERS, dbo.' +
      'PRICE.NUMB, dbo.PRICE.PRICE_TMP, dbo.PRICE.PRICE_UCH, dbo.PRICE.' +
      'OSTAT, '#13#10#9'dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.CODE, dbo.TOV.ID_' +
      'GRTOV, dbo.GRTOV.GRUPTOV,'#13#10#9'dbo.PRICE.ID_VENDOR, CL.CLIENT as VE' +
      'NDOR, dbo.PRICE.PRICE_VENDOR, dbo.PRICE.[NUMB_PROTOTYPE], dbo.PR' +
      'ICE.[IS_EXISTS_OSTATOK], dbo.PRICE.[IS_ACTION],'#13#10#9'dbo.TOV.IS_FIS' +
      'CAL, dbo.TOV.[IS_EXCISE] '#13#10#9'FROM dbo.PRICE '#13#10#9' INNER JOIN dbo.TO' +
      'V ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'#13#10#9'inner JOIN dbo.GRTOV ON' +
      ' dbo.TOV.ID_GRTOV = dbo.GRTOV.ID_GRTOV'#13#10#9'inner join [dbo].[CLIEN' +
      'TS] CL on CL.ID_CLIENTS=dbo.PRICE.ID_VENDOR'#13#10#13#10#9'WHERE dbo.PRICE.' +
      'ID_USERS=@IDU '#13#10#9#9'AND dbo.TOV.ID_GRTOV=@IDG'#13#10#9#9'AND dbo.PRICE.ID_' +
      'VENDOR=@ID_VENDOR'#13#10#9#9'and dbo.PRICE.[IS_EXISTS_OSTATOK]>=@IS_EXIS' +
      'TS_FROM and dbo.PRICE.[IS_EXISTS_OSTATOK]<=@IS_EXISTS_TO'#13#10#9'ORDER' +
      ' BY dbo.TOV.NAME'#13#10'end'#13#10'else'#13#10'begin'#13#10#13#10#9'if (@IDG=-1) and (@ID_VEN' +
      'DOR<>-1)'#13#10#9'begin'#13#10#9#9'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE.ID_US' +
      'ERS, dbo.PRICE.NUMB, dbo.PRICE.PRICE_TMP, dbo.PRICE.PRICE_UCH, d' +
      'bo.PRICE.OSTAT, '#13#10#9#9'dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.CODE, d' +
      'bo.TOV.ID_GRTOV, dbo.GRTOV.GRUPTOV,'#13#10#9#9'dbo.PRICE.ID_VENDOR, CL.C' +
      'LIENT as VENDOR, dbo.PRICE.PRICE_VENDOR, dbo.PRICE.[NUMB_PROTOTY' +
      'PE], dbo.PRICE.[IS_EXISTS_OSTATOK], dbo.PRICE.[IS_ACTION],'#13#10#9#9'db' +
      'o.TOV.IS_FISCAL, dbo.TOV.[IS_EXCISE]      '#13#10#9#9'FROM dbo.PRICE '#13#10#9 +
      #9' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'#13#10#9#9'inn' +
      'er JOIN dbo.GRTOV ON dbo.TOV.ID_GRTOV = dbo.GRTOV.ID_GRTOV'#13#10#9#9'in' +
      'ner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=dbo.PRICE.ID_VENDOR' +
      #13#10#9#9'WHERE dbo.PRICE.ID_USERS=@IDU '#13#10#9#9#9'AND dbo.PRICE.ID_VENDOR=@' +
      'ID_VENDOR'#13#10#9#9#9'and dbo.PRICE.[IS_EXISTS_OSTATOK]>=@IS_EXISTS_FROM' +
      ' and dbo.PRICE.[IS_EXISTS_OSTATOK]<=@IS_EXISTS_TO'#13#10#9#9'ORDER BY db' +
      'o.TOV.NAME'#13#10#9'end'#13#10#9'else'#13#10#9'begin'#13#10#13#10#9#9'if (@IDG<>-1) and (@ID_VEND' +
      'OR=-1)'#13#10#9#9'begin'#13#10#9#9#9'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE.ID_US' +
      'ERS, dbo.PRICE.NUMB, dbo.PRICE.PRICE_TMP, dbo.PRICE.PRICE_UCH, d' +
      'bo.PRICE.OSTAT, '#13#10#9#9#9'dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.CODE, ' +
      'dbo.TOV.ID_GRTOV, dbo.GRTOV.GRUPTOV,'#13#10#9#9#9'dbo.PRICE.ID_VENDOR, CL' +
      '.CLIENT as VENDOR, dbo.PRICE.PRICE_VENDOR, dbo.PRICE.[NUMB_PROTO' +
      'TYPE], dbo.PRICE.[IS_EXISTS_OSTATOK], dbo.PRICE.[IS_ACTION],'#13#10#9#9 +
      #9'dbo.TOV.IS_FISCAL, dbo.TOV.[IS_EXCISE]     '#13#10#9#9#9'FROM dbo.PRICE ' +
      #13#10#9#9#9' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'#13#10#9 +
      #9#9'inner JOIN dbo.GRTOV ON dbo.TOV.ID_GRTOV = dbo.GRTOV.ID_GRTOV'#13 +
      #10#9#9#9'inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=dbo.PRICE.ID_' +
      'VENDOR'#13#10#9#9#9'WHERE dbo.PRICE.ID_USERS=@IDU '#13#10#9#9#9#9'AND dbo.TOV.ID_GR' +
      'TOV=@IDG'#13#10#9#9#9#9'and dbo.PRICE.[IS_EXISTS_OSTATOK]>=@IS_EXISTS_FROM' +
      ' and dbo.PRICE.[IS_EXISTS_OSTATOK]<=@IS_EXISTS_TO'#13#10#9#9#9'ORDER BY d' +
      'bo.TOV.NAME'#13#10#9#9'end'#13#10#9#9'else'#13#10#9#9'begin'#13#10#9#9#9'if (@IDG=-1) and (@ID_VE' +
      'NDOR=-1)'#13#10#9#9#9'begin'#13#10#9#9#9#9'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE.I' +
      'D_USERS, dbo.PRICE.NUMB, dbo.PRICE.PRICE_TMP, dbo.PRICE.PRICE_UC' +
      'H, dbo.PRICE.OSTAT, '#13#10#9#9#9#9'dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.C' +
      'ODE, dbo.TOV.ID_GRTOV, dbo.GRTOV.GRUPTOV,'#13#10#9#9#9#9'dbo.PRICE.ID_VEND' +
      'OR, CL.CLIENT as VENDOR, dbo.PRICE.PRICE_VENDOR, dbo.PRICE.[NUMB' +
      '_PROTOTYPE], dbo.PRICE.[IS_EXISTS_OSTATOK], dbo.PRICE.[IS_ACTION' +
      '],'#13#10#9#9#9#9'dbo.TOV.IS_FISCAL, dbo.TOV.[IS_EXCISE]    '#13#10#9#9#9#9'FROM dbo' +
      '.PRICE '#13#10#9#9#9#9' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV.I' +
      'D_TOV'#13#10#9#9#9#9'inner JOIN dbo.GRTOV ON dbo.TOV.ID_GRTOV = dbo.GRTOV.' +
      'ID_GRTOV'#13#10#9#9#9#9'inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=dbo' +
      '.PRICE.ID_VENDOR'#13#10#9#9#9#9'WHERE dbo.PRICE.ID_USERS=@IDU '#13#10#9#9#9#9'and db' +
      'o.PRICE.[IS_EXISTS_OSTATOK]>=@IS_EXISTS_FROM and dbo.PRICE.[IS_E' +
      'XISTS_OSTATOK]<=@IS_EXISTS_TO'#13#10#9#9#9#9'ORDER BY dbo.TOV.NAME'#13#10#9#9#9'end' +
      #13#10#9#9#9'else '#13#10#9#9#9'begin'#13#10#9#9#9#9'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE' +
      '.ID_USERS, dbo.PRICE.NUMB, dbo.PRICE.PRICE_TMP, dbo.PRICE.PRICE_' +
      'UCH, dbo.PRICE.OSTAT, '#13#10#9#9#9#9'dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV' +
      '.CODE, dbo.TOV.ID_GRTOV, dbo.GRTOV.GRUPTOV,'#13#10#9#9#9#9'dbo.PRICE.ID_VE' +
      'NDOR, CL.CLIENT as VENDOR, dbo.PRICE.PRICE_VENDOR, dbo.PRICE.[NU' +
      'MB_PROTOTYPE], dbo.PRICE.[IS_EXISTS_OSTATOK], dbo.PRICE.[IS_ACTI' +
      'ON],'#13#10#9#9#9#9'dbo.TOV.IS_FISCAL, dbo.TOV.[IS_EXCISE]    '#13#10#9#9#9#9'FROM d' +
      'bo.PRICE '#13#10#9#9#9#9' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV' +
      '.ID_TOV'#13#10#9#9#9#9'inner JOIN dbo.GRTOV ON dbo.TOV.ID_GRTOV = dbo.GRTO' +
      'V.ID_GRTOV'#13#10#9#9#9#9'inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=d' +
      'bo.PRICE.ID_VENDOR'#13#10#9#9#9#9'WHERE dbo.PRICE.ID_USERS=@IDU '#13#10#9#9#9#9'and ' +
      'dbo.PRICE.[IS_EXISTS_OSTATOK]>=@IS_EXISTS_FROM and dbo.PRICE.[IS' +
      '_EXISTS_OSTATOK]<=@IS_EXISTS_TO'#13#10#9#9#9#9'ORDER BY dbo.TOV.NAME'#13#10#9#9#9'e' +
      'nd;'#13#10#9#9'end;'#13#10#9'end;'#13#10'end;'#13#10
    CommandTimeout = 300
    IndexFieldNames = 'NAME'
    Parameters = <
      item
        Name = 'IDU'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IDG'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_VENDOR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'v_IS_EXISTS_OSTATOK'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 22
    Top = 154
    object ADODSPriceID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 7
      FieldName = 'ID_TOV'
    end
    object ADODSPriceCODE: TWideStringField
      DisplayLabel = #1064#1090#1088#1080#1093#1082#1086#1076
      DisplayWidth = 13
      FieldName = 'CODE'
    end
    object ADODSPriceNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1090#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object ADODSPriceEDIZM: TWideStringField
      DisplayLabel = #1080#1079#1084
      DisplayWidth = 3
      FieldName = 'EDIZM'
      ReadOnly = True
      Size = 5
    end
    object ADODSPricePRICE_UCH: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 7
      FieldName = 'PRICE_UCH'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ADODSPriceNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 7
      FieldName = 'NUMB'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object ADODSPriceOSTAT: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTAT'
      DisplayFormat = '0.000'
    end
    object ADODSPricePRICE_TMP: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1091#1094#1077#1085#1082#1080
      DisplayWidth = 7
      FieldName = 'PRICE_TMP'
      DisplayFormat = '0.00'
    end
    object ADODSPriceGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 10
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object ADODSPriceID_USERS: TIntegerField
      FieldName = 'ID_USERS'
      Visible = False
    end
    object ADODSPriceID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object ADODSPriceID_VENDOR: TIntegerField
      FieldName = 'ID_VENDOR'
      Visible = False
    end
    object ADODSPriceVENDOR: TWideStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 30
      FieldName = 'VENDOR'
      Size = 255
    end
    object ADODSPricePRICE_VENDOR: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      FieldName = 'PRICE_VENDOR'
      DisplayFormat = '0.00'
    end
    object ADODSPriceNUMB_PROTOTYPE: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074' '#1087#1088#1086#1090#1086#1090#1080#1087#1077
      FieldName = 'NUMB_PROTOTYPE'
      DisplayFormat = '0.000'
    end
    object ADODSPriceIS_EXISTS_OSTATOK: TIntegerField
      DisplayLabel = #1045#1089#1090#1100' '#1080#1083#1080' '#1073#1099#1083#1086' '#1074' '#1085#1072#1083#1080#1095#1080#1080
      FieldName = 'IS_EXISTS_OSTATOK'
    end
    object ADODSPriceIS_ACTION: TIntegerField
      DisplayLabel = #1040#1082#1094#1080#1086#1085#1085#1072#1103' '#1094#1077#1085#1072
      FieldName = 'IS_ACTION'
    end
    object ADODSPriceIS_FISCAL: TIntegerField
      DisplayLabel = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081
      FieldName = 'IS_FISCAL'
    end
    object ADODSPriceIS_EXCISE: TIntegerField
      DisplayLabel = #1053#1072#1083#1080#1095#1080#1077' '#1072#1082#1094#1080#1079#1085#1086#1081' '#1084#1072#1088#1082#1080
      FieldName = 'IS_EXCISE'
    end
  end
  object DSPrice: TDataSource
    DataSet = ADODSPrice
    Left = 76
    Top = 158
  end
  object QNAVESKI_TMP: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'IDUSER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IDTOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select ID, ID_USER, ID_TOV, NUMB, D, EXCISE_BAR_CODE from NAVESK' +
        'I_TMP'
      'where ID_USER=:IDUSER and ID_TOV=:IDTOV    ')
    Left = 142
    Top = 152
    object QNAVESKI_TMPID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object QNAVESKI_TMPID_USER: TIntegerField
      FieldName = 'ID_USER'
      ReadOnly = True
      Visible = False
    end
    object QNAVESKI_TMPID_TOV: TIntegerField
      FieldName = 'ID_TOV'
      ReadOnly = True
      Visible = False
    end
    object QNAVESKI_TMPNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUMB'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QNAVESKI_TMPEXCISE_BAR_CODE: TWideStringField
      DisplayLabel = #1064#1090#1088'-'#1082#1086#1076' '#1072#1082#1094#1080#1079#1085#1086#1081' '#1084#1072#1088#1082#1080
      DisplayWidth = 10
      FieldName = 'EXCISE_BAR_CODE'
      Size = 30
    end
    object QNAVESKI_TMPD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
      ReadOnly = True
    end
  end
  object DSQNAVESKI_TMP: TDataSource
    DataSet = QNAVESKI_TMP
    Left = 184
    Top = 150
  end
  object SP_SAVE_NAKL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'SAVE_NAKL;1'
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
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@D'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@NN'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_CLIENT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CHEREZ'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@DOVER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@OSNOV'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@UDOST'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@FORMOPL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@TRANSP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@TARA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PLUS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MINUS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ZATRNAME'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@ZATR'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PRICE_KATEG'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_PRICE_WITHOUT_NDS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SUPPLYER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@TOT_SUM'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@TOT_NUM'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@NUM_TARA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_TARA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_K'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SCH_D'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@SCH_K'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@NDS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@STAVKA_NDS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@IS_DELETE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_LINK_DOC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PER_NACENKA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_USLUGI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SUM_OPL_BONUS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SUM_OPL_CARD'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SUM_POLUCH'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SUM_SDACHI'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@MIN_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MIN_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MIN_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@BONUS_OLD'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@BONUS_CALC'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@BONUS_NEW'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ROUND_SUM'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@CARD_NN_NOT_FISCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@TRANS_CODE_NOT_FISCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@CARD_NN_FISCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@TRANS_CODE_FISCAL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@SUM_SDACHI_TO_CARD'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
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
        Name = '@IS_FINAL'
        Attributes = [paNullable]
        DataType = ftInteger
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
      end
      item
        Name = '@ID_NC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 20
    Top = 206
  end
  object ADODSGrTov: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select ID_GRTOV, GRUPTOV, SEQUENTIAL, IS_DELETE from GRTOV where' +
      ' IS_DELETE=:isdelete'#13#10'order by GRUPTOV'
    IndexFieldNames = 'GRUPTOV'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 512
    Top = 22
    object ADODSGrTovID_GRTOV: TAutoIncField
      FieldName = 'ID_GRTOV'
      ReadOnly = True
      Visible = False
    end
    object ADODSGrTovGRUPTOV: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object ADODSGrTovSEQUENTIAL: TIntegerField
      DisplayLabel = #8470' '#1087#1086#1089#1083#1077#1076#1086#1074'. '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      FieldName = 'SEQUENTIAL'
    end
    object ADODSGrTovIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSGrTov: TDataSource
    DataSet = ADODSGrTov
    Left = 558
    Top = 22
  end
  object SP_SET_NEXT_NUMB_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'SET_NEXT_NUMB_N;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@PN'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = 0
      end>
    Left = 382
    Top = 90
  end
  object SP_GET_NEXT_NUMB_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GET_NEXT_NUMB_N;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PN'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 522
    Top = 88
  end
  object SP_SET_USER_PRICELIST: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'SET_USER_PRICELIST;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@D_WORK'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@IN_TRANSACTION'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLIENT'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 72
    Top = 208
  end
  object SP_CONTROL_PRICE_SELECT: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'CONTROL_PRICE_SELECT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SUMNUMB'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
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
    Left = 132
    Top = 206
  end
  object SP_CLEAR_PRICE_SELECT: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'CLEAR_PRICE_SELECT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 200
    Top = 206
  end
  object SP_SET_PRICE_FROM_NAKL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'SET_PRICE_FROM_NAKL;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
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
        Name = '@IN_TRANSACTION'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 278
    Top = 212
  end
  object SP_COPY_NAKL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'COPY_NAKL;1'
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
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@COMMENT_DEL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ER'
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
      end>
    Left = 34
    Top = 268
  end
  object QPriceTovSelect: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QPriceTovSelectCalcFields
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'IDU'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @IDU INTEGER'
      'SET @IDU=:IDU'
      'SELECT PRICE.NUMB,'
      
        'TOV.NAME, TOV.EDIZM, TOV.CODE, GRTOV.GRUPTOV, PRICE.PRICE_TMP, P' +
        'RICE_UCH, PRICE.ID_TOV,'
      'PRICE.PRICE_VENDOR, PRICE.OSTAT,'
      'TOV.IS_FISCAL'
      'FROM  PRICE'
      ' INNER JOIN TOV ON PRICE.ID_TOV = TOV.ID_TOV'
      'inner JOIN GRTOV ON TOV.ID_GRTOV = GRTOV.ID_GRTOV'
      'WHERE PRICE.ID_USERS=@IDU and PRICE.NUMB>0'
      'ORDER BY GRUPTOV,NAME')
    Left = 119
    Top = 274
    object QPriceTovSelectrn: TIntegerField
      DisplayLabel = #8470#1087#1087
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'rn'
      ReadOnly = True
      Calculated = True
    end
    object QPriceTovSelectNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object QPriceTovSelectEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      DisplayWidth = 3
      FieldName = 'EDIZM'
      ReadOnly = True
      Size = 5
    end
    object QPriceTovSelectNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 7
      FieldName = 'NUMB'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QPriceTovSelectprice_select: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'price_select'
      ReadOnly = True
      DisplayFormat = '0.00'
      Calculated = True
    end
    object QPriceTovSelectss: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'ss'
      ReadOnly = True
      DisplayFormat = '0.00'
      Calculated = True
    end
    object QPriceTovSelectCODE: TWideStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 10
      FieldName = 'CODE'
      ReadOnly = True
      Visible = False
    end
    object QPriceTovSelectGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 10
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object QPriceTovSelectPRICE_TMP: TFloatField
      FieldName = 'PRICE_TMP'
      ReadOnly = True
      Visible = False
    end
    object QPriceTovSelectPRICE_UCH: TFloatField
      FieldName = 'PRICE_UCH'
      ReadOnly = True
      Visible = False
    end
    object QPriceTovSelectID_TOV: TIntegerField
      FieldName = 'ID_TOV'
      ReadOnly = True
      Visible = False
    end
    object QPriceTovSelectPRICE_VENDOR: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      FieldName = 'PRICE_VENDOR'
    end
    object QPriceTovSelectss_vendor: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      FieldKind = fkCalculated
      FieldName = 'ss_vendor'
      Calculated = True
    end
    object QPriceTovSelectOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object QPriceTovSelectIS_FISCAL: TIntegerField
      DisplayLabel = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081
      FieldName = 'IS_FISCAL'
    end
  end
  object DS_QPriceTovSelect: TDataSource
    DataSet = QPriceTovSelect
    Left = 175
    Top = 276
  end
  object QPriceUser: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDU'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @D_DOC DATETIME'
      '-- SET @D_DOC=:D_DOC'
      ''
      'DECLARE @IDU INTEGER'
      'SET @IDU=:IDU'
      ''
      'DECLARE @EPS FLOAT'
      'SET @EPS=0.00000001'
      ''
      'SELECT dbo.PRICE.NUMB, dbo.PRICE.PRICE_TMP,'
      ''
      ' dbo.TOV.ID_GRTOV, dbo.TOV.NAME,'
      ''
      '/*'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE1'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=dbo.PRICE.ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE1,'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE2'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=dbo.PRICE.ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE2,'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE3'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=dbo.PRICE.ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE3,'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE4'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=dbo.PRICE.ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE4,'
      ''
      '*/'
      ' dbo.PRICE.PRICE_UCH,'
      ' dbo.PRICE.PRICE_VENDOR'
      'FROM  dbo.PRICE '
      ' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'
      ''
      'WHERE dbo.PRICE.ID_USERS=@IDU'
      'and  dbo.PRICE.NUMB>@EPS'
      ''
      '')
    Left = 244
    Top = 272
  end
  object SP_NAVESKI_DEL_IDTOV: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'NAVESKI_DEL_IDTOV;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 258
    Top = 160
  end
  object SP_NAVESKI_DEL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'NAVESKI_DEL;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 336
    Top = 158
  end
  object SP_NAVESKI_ADD: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'NAVESKI_ADD;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NUMB'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@EXCISE_BAR_CODE'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 30
        Value = Null
      end
      item
        Name = '@ID_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 394
    Top = 158
  end
  object QDocType_info: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_DT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select DT.NAMEDOC,DT.NEXT_NO,DT.ID_SCH_D,DT.ID_SCH_K,'
      'DT.ID_CLI_D,DT.ID_CLI_K,'
      'CLD.CLIENT CLI_D,CLK.CLIENT CLI_K,'
      'DT.ID_GRTOV, GT.GRUPTOV,'
      'DT.ID_KATEG_CLI, KC.KATEGOR,'
      'DT.SALES_CATEGOR, DT.WITH_NDS, DT.TIME_DEFAULT, DT.FORM_PRN,'
      'DT.ID_KATEG_CLI_K, KCK.KATEGOR KATEGOR_K,'
      'CLSU.CLIENT SUPPL, DT.ID_SUPPL, DT.ID_CHAR_DOC'
      ' from DOC_TYPE DT'
      'left outer join CLIENTS CLD on CLD.ID_CLIENTS=ID_CLI_D'
      'left outer join CLIENTS CLK on CLK.ID_CLIENTS=ID_CLI_K'
      'left outer join GRTOV GT on GT.ID_GRTOV=DT.ID_GRTOV '
      'left outer join KATEG_CLI KC on KC.ID_KATEGOR=DT.ID_KATEG_CLI'
      
        'left outer join KATEG_CLI KCK on KCK.ID_KATEGOR=DT.ID_KATEG_CLI_' +
        'K'
      'left outer join CLIENTS CLSU ON CLSU.ID_CLIENTS=DT.ID_SUPPL'
      ''
      'where DT.ID_DOC_TYPE=:ID_DT')
    Left = 632
    Top = 72
  end
  object QPriceSelect: TADOQuery
    Connection = ADOConnection1
    OnCalcFields = QPriceTovSelectCalcFields
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ID_TOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @ID_TOV INTEGER'
      'SET @ID_TOV=:ID_TOV'
      'DECLARE @D_DOC DATETIME'
      'SET @D_DOC=:D_DOC'
      'select @ID_TOV IDTOV,'
      '('
      'select TOP 1 PRICE_DATE.PRICE1'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=@ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE1,'
      '('
      'select TOP 1 PRICE_DATE.PRICE2'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=@ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE2,'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE3'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=@ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE3,'
      ''
      '('
      'select TOP 1 PRICE_DATE.PRICE4'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D_DOC'
      'and PRICE_DATE.ID_TOV=@ID_TOV'
      'and PRICE_DATE.IS_DELETE=0'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE4')
    Left = 127
    Top = 328
  end
  object QNaklCapInfo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
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
      
        'SELECT NC.[ID_NAKLCAP], NC.[D], NC.[NN], NC.[ID_DOC_TYPE], NC.[I' +
        'D_CLIENT], NC.[PRICE_KATEG],'
      
        'NC.[ID_CLI_K], NC.[SCH_D], NC.[SCH_K], CL.[CLIENT], CL.[ID_KATEG' +
        'OR], K.[KATEGOR],'
      
        'NC.[SUM_OPL_BONUS], NC.[SUM_OPL_CARD],  CLK.[CLIENT] CLI_K,  KK.' +
        '[KATEGOR] KATEGOR_K ,'
      
        ' CLK.[ID_KATEGOR] ID_KATEGOR_K, CL.INN INN_D, CLK.INN INN_K, NC.' +
        'TOT_SUM, NC.ZATR,'
      
        ' NC.ZATRNAME, NC.[CARD_NN_FISCAL], NC.[TRANS_CODE_FISCAL], NC.[C' +
        'ARD_NN_NOT_FISCAL], NC.[TRANS_CODE_NOT_FISCAL]'
      'FROM [dbo].[NAKLCAP] NC'
      
        'left outer join [dbo].[CLIENTS] CL on CL.[ID_CLIENTS]=NC.[ID_CLI' +
        'ENT]'
      
        'left outer join [dbo].[KATEG_CLI] K on K.[ID_KATEGOR]=CL.[ID_KAT' +
        'EGOR]'
      
        'left outer join [dbo].[CLIENTS] CLK on CLK.[ID_CLIENTS]=NC.[ID_C' +
        'LI_K]'
      
        'left outer join [dbo].[KATEG_CLI] KK on KK.[ID_KATEGOR]=CLK.[ID_' +
        'KATEGOR]'
      'WHERE [ID_NAKLCAP]=:ID_NAKLCAP')
    Left = 328
    Top = 288
  end
  object SP_GET_CLIENT_FOR_INN: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GET_CLIENT_FOR_INN;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@INN'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 20
        Value = Null
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@CLI'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdOutput
        Size = 255
        Value = Null
      end
      item
        Name = '@ID_KATEGOR'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@KATEGOR'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdOutput
        Size = 50
        Value = Null
      end
      item
        Name = '@BIRTHDAY'
        Attributes = [paNullable]
        DataType = ftDateTime
        Direction = pdOutput
        Value = Null
      end
      item
        Name = '@IS_PENSIONER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end>
    Left = 390
    Top = 212
  end
  object SP_REGISTER_CLI_FOR_BONUS_CARD: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'REGISTER_CLI_FOR_BONUS_CARD;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TRADE_POINT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@INN'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 20
        Value = Null
      end
      item
        Name = '@CLIENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@TEL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 15
        Value = Null
      end
      item
        Name = '@EMAIL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@BIRTHDAY'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 50
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
    Left = 462
    Top = 276
  end
  object SP_PROV_CAS_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'PROV_CAS_DOC;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 50
        Value = Null
      end>
    Left = 438
    Top = 212
  end
  object SP_DELETE_GRPROV: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_GRPROV;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_GRPROV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IN_TRANSACTION'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 456
    Top = 158
  end
  object ADODSDocType: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select DT.ID_DOC_TYPE, DT.NAMEDOC, DT.NEXT_NO, '#13#10'DT.ID_SCH_D, DT' +
      '.ID_SCH_K, DT.ID_CLI_D, DT.ID_CLI_K,'#13#10'CLD.CLIENT CLI_D, CLK.CLIE' +
      'NT CLI_K, DT.ID_CHAR_DOC, DC.CHAR_DOC, DT.NDS_PER, DT.ID_PROV_CA' +
      'SE,'#13#10'DT.ID_GRTOV, GT.GRUPTOV,'#13#10'DT.ID_KATEG_CLI, KC.KATEGOR,'#13#10'DT.' +
      'ID_KATEG_CLI_K, KCK.KATEGOR KATEGOR_K,'#13#10'DT.SALES_CATEGOR, DT.WIT' +
      'H_NDS, DT.TIME_DEFAULT, DT.FORM_PRN, DT.ID_SUPPL,  '#13#10'CLSU.CLIENT' +
      ' SUPPL,'#13#10'DT.ID_LINK_DOC,'#13#10#13#10'DC1.CHAR_DOC LINK_CHAR_DOC , '#13#10'DT.ID' +
      '_LINK_CH_DOC'#13#10#13#10#13#10'from DOC_TYPE DT '#13#10'left outer join CLIENTS CLD' +
      ' ON CLD.ID_CLIENTS=DT.ID_CLI_D'#13#10'left outer join CLIENTS CLK ON C' +
      'LK.ID_CLIENTS=DT.ID_CLI_K'#13#10'left  outer join DOC_CHAR DC ON DC.ID' +
      '_CHAR_DOC=DT.ID_CHAR_DOC'#13#10'left outer join GRTOV GT on GT.ID_GRTO' +
      'V=DT.ID_GRTOV '#13#10'left outer join KATEG_CLI KC on KC.ID_KATEGOR=DT' +
      '.ID_KATEG_CLI '#13#10'left outer join KATEG_CLI KCK on KCK.ID_KATEGOR=' +
      'DT.ID_KATEG_CLI_K '#13#10'left outer join CLIENTS CLSU ON CLSU.ID_CLIE' +
      'NTS=DT.ID_SUPPL'#13#10'left  outer join DOC_CHAR DC1 ON  DC1.ID_CHAR_D' +
      'OC=DT.ID_LINK_CH_DOC'#13#10#13#10'where DT.ID_CHAR_DOC between :ID_CHAR_FR' +
      'OM AND  :ID_CHAR_TO'#13#10'ORDER BY DT.NAMEDOC'
    Parameters = <
      item
        Name = 'ID_CHAR_FROM'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CHAR_TO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 638
    Top = 20
    object ADODSDocTypeID_DOC_TYPE: TAutoIncField
      FieldName = 'ID_DOC_TYPE'
      ReadOnly = True
      Visible = False
    end
    object ADODSDocTypeNAMEDOC: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object ADODSDocTypeNEXT_NO: TIntegerField
      DisplayLabel = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#8470
      FieldName = 'NEXT_NO'
    end
    object ADODSDocTypeID_SCH_D: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1044
      FieldName = 'ID_SCH_D'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADODSDocTypeID_SCH_K: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1050
      FieldName = 'ID_SCH_K'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADODSDocTypeCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_D'
      ReadOnly = True
      Size = 255
    end
    object ADODSDocTypeKATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075' '#1082#1083#1080#1077#1085#1090#1072' '#1044
      DisplayWidth = 20
      FieldName = 'KATEGOR'
      ReadOnly = True
      Size = 50
    end
    object ADODSDocTypeCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_K'
      ReadOnly = True
      Size = 255
    end
    object ADODSDocTypeKATEGOR_K: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075' '#1082#1083#1080#1077#1085#1090#1072' '#1050
      DisplayWidth = 20
      FieldName = 'KATEGOR_K'
      Size = 50
    end
    object ADODSDocTypeID_CLI_D: TIntegerField
      FieldName = 'ID_CLI_D'
      Visible = False
    end
    object ADODSDocTypeID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object ADODSDocTypeGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088'.'#1090#1086#1074#1072#1088#1086#1074
      DisplayWidth = 15
      FieldName = 'GRUPTOV'
      ReadOnly = True
      Size = 50
    end
    object ADODSDocTypeSALES_CATEGOR: TIntegerField
      DisplayLabel = #1050#1072#1090#1077#1075'.'#1094#1077#1085
      FieldName = 'SALES_CATEGOR'
    end
    object ADODSDocTypeNDS_PER: TFloatField
      DisplayLabel = '% '#1053#1044#1057
      FieldName = 'NDS_PER'
    end
    object ADODSDocTypeWITH_NDS: TIntegerField
      DisplayLabel = #1057' '#1053#1044#1057' (1) '#1073#1077#1079' (0)'
      FieldName = 'WITH_NDS'
    end
    object ADODSDocTypeCHAR_DOC: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 15
      FieldName = 'CHAR_DOC'
      Size = 50
    end
    object ADODSDocTypeID_CHAR_DOC: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'ID_CHAR_DOC'
    end
    object ADODSDocTypeID_PROV_CASE: TIntegerField
      DisplayLabel = #1042#1072#1088'.'#1087#1088#1086#1074#1086#1076#1086#1082
      FieldName = 'ID_PROV_CASE'
    end
    object ADODSDocTypeID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object ADODSDocTypeID_KATEG_CLI: TIntegerField
      FieldName = 'ID_KATEG_CLI'
      Visible = False
    end
    object ADODSDocTypeTIME_DEFAULT: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086' '#1091#1084#1086#1083#1095
      FieldName = 'TIME_DEFAULT'
      EditMask = '!90:00;1;_'
    end
    object ADODSDocTypeFORM_PRN: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1087#1077#1095#1072#1090#1085#1086#1081' '#1092#1086#1088#1084#1099
      FieldName = 'FORM_PRN'
    end
    object ADODSDocTypeID_KATEG_CLI_K: TIntegerField
      FieldName = 'ID_KATEG_CLI_K'
      Visible = False
    end
    object ADODSDocTypeID_SUPPL: TIntegerField
      FieldName = 'ID_SUPPL'
      ReadOnly = True
      Visible = False
    end
    object ADODSDocTypeSUPPL: TWideStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 30
      FieldName = 'SUPPL'
      ReadOnly = True
      Size = 255
    end
    object ADODSDocTypeID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
      Visible = False
    end
    object ADODSDocTypeLINK_CHAR_DOC: TWideStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088' '#1089#1074#1103#1079#1072#1085#1085'. '#1076#1086#1082
      DisplayWidth = 20
      FieldName = 'LINK_CHAR_DOC'
      Size = 50
    end
    object ADODSDocTypeID_LINK_CH_DOC: TIntegerField
      FieldName = 'ID_LINK_CH_DOC'
      Visible = False
    end
    object ADODSDocTypeLINK_NAMEDOC: TStringField
      DisplayLabel = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1076#1086#1082
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'LINK_NAMEDOC'
      Size = 50
      Calculated = True
    end
  end
  object DSDocType: TDataSource
    DataSet = ADODSDocType
    Left = 684
    Top = 22
  end
  object ADODSDOC_CHAR: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select ID_CHAR_DOC, CHAR_DOC from DOC_CHAR'
    Parameters = <>
    Left = 316
    Top = 346
    object ADODSDOC_CHARID_CHAR_DOC: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_CHAR_DOC'
    end
    object ADODSDOC_CHARCHAR_DOC: TWideStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088
      FieldName = 'CHAR_DOC'
      Size = 50
    end
  end
  object DSDOC_CHAR: TDataSource
    DataSet = ADODSDOC_CHAR
    Left = 356
    Top = 348
  end
  object SP_DELETE_DOCCHAR: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_DOCCHAR;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CHAR_DOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 398
    Top = 348
  end
  object SP_DELETE_DOCTYPE: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_DOCTYPE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 690
    Top = 74
  end
  object ADODSUCH: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select ID_UCHET, UCHET from UCH'
    Parameters = <>
    Left = 36
    Top = 402
    object ADODSUCHID_UCHET: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_UCHET'
    end
    object ADODSUCHUCHET: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'UCHET'
      Size = 50
    end
  end
  object DSUCH: TDataSource
    DataSet = ADODSUCH
    Left = 92
    Top = 400
  end
  object ADODSSCHTYPE: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select ID_SCH_TYPE, SCH_TYPE from SCH_TYPE'
    Parameters = <>
    Left = 156
    Top = 406
    object ADODSSCHTYPEID_SCH_TYPE: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SCH_TYPE'
    end
    object ADODSSCHTYPESCH_TYPE: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SCH_TYPE'
      Size = 50
    end
  end
  object DSSCHTYPE: TDataSource
    DataSet = ADODSSCHTYPE
    Left = 200
    Top = 404
  end
  object ADODSSCH: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select SCH.ID_SCH, SCH.SCH_NAME, SCH.ID_SCH_TYPE, SCH.ID_UCHET, ' +
      'UCH.UCHET, SCH_TYPE.SCH_TYPE, SCH.IN_BALANS, SCH.IS_VISIBLE'#13#10' fr' +
      'om SCH'#13#10'inner join  UCH on UCH.ID_UCHET=SCH.ID_UCHET'#13#10'inner join' +
      ' SCH_TYPE on SCH_TYPE.ID_SCH_TYPE=SCH.ID_SCH_TYPE'#13#10
    Parameters = <>
    Left = 270
    Top = 406
    object ADODSSCHID_SCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'ID_SCH'
      FixedChar = True
      Size = 10
    end
    object ADODSSCHSCH_NAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SCH_NAME'
      Size = 50
    end
    object ADODSSCHID_SCH_TYPE: TIntegerField
      FieldName = 'ID_SCH_TYPE'
      Visible = False
    end
    object ADODSSCHID_UCHET: TIntegerField
      FieldName = 'ID_UCHET'
      Visible = False
    end
    object ADODSSCHUCHET: TWideStringField
      DisplayLabel = #1059#1095#1077#1090
      DisplayWidth = 25
      FieldName = 'UCHET'
      Size = 50
    end
    object ADODSSCHSCH_TYPE: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 25
      FieldName = 'SCH_TYPE'
      Size = 50
    end
    object ADODSSCHIN_BALANS: TIntegerField
      DisplayLabel = #1042' '#1073#1072#1083#1072#1085#1089
      FieldName = 'IN_BALANS'
    end
    object ADODSSCHIS_VISIBLE: TIntegerField
      DisplayLabel = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1092#1086#1088#1084#1077' '#1073#1072#1083#1072#1085#1089#1072
      FieldName = 'IS_VISIBLE'
    end
  end
  object DSSCH: TDataSource
    DataSet = ADODSSCH
    Left = 316
    Top = 404
  end
  object Q_USERSCHPERM: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SCH'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select SCH_NOT_ALLOW from USERSCHPERM'
      'where ID_USER=:ID_USER and SCH_NOT_ALLOW=:SCH')
    Left = 384
    Top = 396
  end
  object SP_DELETE_SCH: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_SCH;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SCH'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
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
    Left = 444
    Top = 410
  end
  object Q_NaklCap_For_Export: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        '-- '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1089#1077#1088#1074#1077#1088' NMK - IS_TRANSMISSION_RECEPT' +
        'ION=0 '#1080#1083#1080' 2'
      'select * from [dbo].[NAKLCAP] NC'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=:d_from'
      'and NC.[D]<=:d_to'
      'and NC.[IS_EXPORT]=0'
      'and NC.[IS_FINAL]=1'
      'and not (NC.[ID_DOC_TYPE] in'
      
        '(select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSI' +
        'ON_RECEPTION] in (1,3)))')
    Left = 560
    Top = 344
  end
  object ADOCommand_Expotr_null: TADOCommand
    CommandText = 
      'update [dbo].[NAKLCAP] set [IS_EXPORT]=0 where '#13#10'[D]>=:d_from an' +
      'd'#13#10'[D]<=:d_to'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 736
    Top = 296
  end
  object ADOCommand_Delete_PredKateg_Cli: TADOCommand
    CommandText = 'delete [dbo].[KATEG_CLI_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 552
    Top = 392
  end
  object ADOCommandInsertKaterCli: TADOCommand
    CommandText = 
      'insert into [dbo].[KATEG_CLI] ([ID_KATEGOR], [KATEGOR], [IS_DELE' +
      'TE]) '#13#10'values (:ID_KATEGOR, :KATEGOR, :IS_DELETE)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_KATEGOR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'KATEGOR'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 592
    Top = 392
  end
  object ADOCommand_Delete_PredCli: TADOCommand
    CommandText = 'delete [dbo].[CLIENTS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 712
    Top = 392
  end
  object ADOCommandInsertCli: TADOCommand
    CommandText = 
      'insert into [dbo].[CLIENTS] ([ID_CLIENTS]'#13#10'      ,[CLIENT]'#13#10'    ' +
      '  ,[RS]'#13#10'      ,[MFO]'#13#10'      ,[OKPO]'#13#10'      ,[INN]'#13#10'      ,[RNN]' +
      #13#10'      ,[TEL]'#13#10'      ,[DIRECTOR]'#13#10'      ,[BUHGALTER]'#13#10'      ,[A' +
      'DRES]'#13#10'      ,[BANK]'#13#10'      ,[ID_KATEGOR]'#13#10'      ,[AUX_INFO]'#13#10'  ' +
      '    ,[PER_MINUS]'#13#10'      ,[PRICE_TIME]'#13#10'      ,[DOGOVOR]'#13#10'      ,' +
      '[N_DOGOVOR]'#13#10'      ,[D_DOGOVOR]'#13#10'      ,[ID_PARENT]'#13#10'      ,[SAL' +
      'ES_CATEGOR]'#13#10'      ,[IS_DELETE]'#13#10'      ,[N_NAKL_DOLG]'#13#10'      ,[D' +
      '_OTSROCHKI_DOLGA]'#13#10'      ,[IS_CONTROL_DOLG]'#13#10'      , [EMAIL]'#13#10'  ' +
      '    , [BIRTHDAY]) '#13#10'values (:ID_CLIENTS '#13#10'      ,:CLIENT '#13#10'     ' +
      ' ,:RS '#13#10'      ,:MFO '#13#10'      ,:OKPO '#13#10'      ,:INN '#13#10'      ,:RNN '#13 +
      #10'      ,:TEL '#13#10'      ,:DIRECTOR '#13#10'      ,:BUHGALTER '#13#10'      ,:AD' +
      'RES '#13#10'      ,:BANK '#13#10'      ,:ID_KATEGOR '#13#10'      ,:AUX_INFO '#13#10'   ' +
      '   ,:PER_MINUS '#13#10'      ,:PRICE_TIME '#13#10'      ,:DOGOVOR '#13#10'      ,:' +
      'N_DOGOVOR '#13#10'      ,:D_DOGOVOR '#13#10'      ,:ID_PARENT '#13#10'      ,:SALE' +
      'S_CATEGOR '#13#10'      ,:IS_DELETE '#13#10'      ,:N_NAKL_DOLG '#13#10'      ,:D_' +
      'OTSROCHKI_DOLGA '#13#10'      ,:IS_CONTROL_DOLG'#13#10'       ,:EMAIL'#13#10'     ' +
      '  , :BIRTHDAY)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_CLIENTS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CLIENT'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'RS'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'MFO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'OKPO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'INN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'RNN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'TEL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'DIRECTOR'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'BUHGALTER'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ADRES'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'BANK'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ID_KATEGOR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'AUX_INFO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'PER_MINUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE_TIME'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'DOGOVOR'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'N_DOGOVOR'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'D_DOGOVOR'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ID_PARENT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SALES_CATEGOR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'N_NAKL_DOLG'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D_OTSROCHKI_DOLGA'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'IS_CONTROL_DOLG'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'EMAIL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'BIRTHDAY'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 744
    Top = 392
  end
  object ADOCommand_Delete_PredBonuses: TADOCommand
    CommandText = 'delete [dbo].[BONUSES_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 544
    Top = 448
  end
  object ADOCommandInsertBonuses: TADOCommand
    CommandText = 
      'insert into [dbo].[BONUSES] ('#13#10#9'   [ID_BONUS]'#13#10'      ,[ID_CLI]'#13#10 +
      '      ,[SUM_BALL]'#13#10'    '#13#10#9'  ) values ('#13#10#9'   :ID_BONUS'#13#10'      ,:I' +
      'D_CLI'#13#10'      ,:SUM_BALL'#13#10'     )'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_BONUS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SUM_BALL'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Left = 584
    Top = 448
  end
  object ADOCommand_Delete_PredGrTov: TADOCommand
    CommandText = 'delete [dbo].[GRTOV_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 544
    Top = 496
  end
  object ADOCommandInsertGrTov: TADOCommand
    CommandText = 
      'insert into [dbo].[GRTOV] ('#13#10#9'   [ID_GRTOV]'#13#10'      ,[GRUPTOV]'#13#10' ' +
      '     ,[SEQUENTIAL]'#13#10'      ,[IS_DELETE]) values ('#13#10#9'   :ID_GRTOV'#13 +
      #10'      ,:GRUPTOV'#13#10'      ,:SEQUENTIAL'#13#10'      ,:IS_DELETE)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_GRTOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'GRUPTOV'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'SEQUENTIAL'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 576
    Top = 496
  end
  object ADOCommand_Delete_PredTov: TADOCommand
    CommandText = 'delete [dbo].[TOV_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 520
    Top = 567
  end
  object ADOCommandInsertTov: TADOCommand
    CommandText = 
      'insert into [dbo].[TOV] ([ID_TOV]'#13#10'      ,[NAME]'#13#10'      ,[EDIZM]' +
      #13#10'      ,[GOST]'#13#10'      ,[SROKREAL]'#13#10'      ,[CODE]'#13#10'      ,[ID_GR' +
      'TOV]'#13#10'      ,[ID_VID]'#13#10'      ,[FLAG_SOCIAL]'#13#10'      ,[MAX_PRICE]'#13 +
      #10'      ,[IS_USE]'#13#10'      ,[COMPARE_PRICE]'#13#10'      ,[PART]'#13#10'      ,' +
      '[AVAILABILITY]'#13#10'      ,[NOVELTY]'#13#10'      ,[RECOMMENDED]'#13#10'      ,[' +
      'ID_KATEGOR_CLI]'#13#10'      ,[BASETOV]'#13#10'      ,[IS_DELETE]'#13#10'      ,[U' +
      'KTZED]'#13#10#9',[IS_FISCAL]'#13#10#9',[IS_EXCISE]'#13#10#13#10#9'   ) values ('#13#10#9'   :ID_' +
      'TOV      '#13#10'      ,:NAME'#13#10'      ,:EDIZM'#13#10'      ,:GOST'#13#10'      ,:SR' +
      'OKREAL'#13#10'      ,:CODE'#13#10'      ,:ID_GRTOV'#13#10'      ,:ID_VID'#13#10'      ,:' +
      'FLAG_SOCIAL'#13#10'      ,:MAX_PRICE'#13#10'      ,:IS_USE'#13#10'      ,:COMPARE_' +
      'PRICE'#13#10'      ,:PART'#13#10'      ,:AVAILABILITY'#13#10'      ,:NOVELTY'#13#10'    ' +
      '  ,:RECOMMENDED'#13#10'      ,:ID_KATEGOR_CLI'#13#10'      ,:BASETOV'#13#10'      ' +
      ',:IS_DELETE'#13#10'      ,:UKTZED'#13#10#9'  ,:IS_FISCAL'#13#10#9'  ,:IS_EXCISE'#13#10#9'  ' +
      ' )'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'EDIZM'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'GOST'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'SROKREAL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'CODE'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'ID_GRTOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_VID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'FLAG_SOCIAL'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'MAX_PRICE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'IS_USE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'COMPARE_PRICE'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'PART'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'AVAILABILITY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NOVELTY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RECOMMENDED'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_KATEGOR_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'BASETOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'UKTZED'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'IS_FISCAL'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_EXCISE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 552
    Top = 568
  end
  object ADOCommandDelete_PRICE_DATE: TADOCommand
    CommandText = 'delete [dbo].[PRICE_DATE]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 432
    Top = 600
  end
  object ADOCommandInsertPRICE_DATE: TADOCommand
    CommandText = 
      'insert into [dbo].[PRICE_DATE] ([ID_PRICE_DATE]'#13#10'      ,[ID_TOV]' +
      #13#10'      ,[D_START]'#13#10'      ,[PRICE1]'#13#10'      ,[PRICE2]'#13#10'      ,[PR' +
      'ICE3]'#13#10'      ,[PRICE4]'#13#10'      ,[D_EDIT_NEW]'#13#10'      ,[ID_USER]'#13#10' ' +
      '     ,[IS_DELETE]'#13#10'      ,[D_DELETE]'#13#10'      ,[ID_USER_DELETE]'#13#10' ' +
      '     ,[COMMENT_DEL]'#13#10'      ,[ID_CLI]'#13#10#9'   ) values (:ID_PRICE_DA' +
      'TE'#13#10'      ,:ID_TOV'#13#10'      ,:D_START'#13#10'      ,:PRICE1'#13#10'      ,:PRI' +
      'CE2'#13#10'      ,:PRICE3'#13#10'      ,:PRICE4'#13#10'      ,:D_EDIT_NEW'#13#10'      ,' +
      ':ID_USER'#13#10'      ,:IS_DELETE'#13#10'      ,:D_DELETE'#13#10'      ,:ID_USER_D' +
      'ELETE'#13#10'      ,:COMMENT_DEL'#13#10'      ,:ID_CLI'#13#10#9'      )'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_PRICE_DATE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D_START'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'PRICE1'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE2'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE3'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE4'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'D_EDIT_NEW'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D_DELETE'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ID_USER_DELETE'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'COMMENT_DEL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'ID_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 464
    Top = 600
  end
  object Q_NaklTov_For_Export: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        '-- '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1089#1077#1088#1074#1077#1088' NMK - IS_TRANSMISSION_RECEPT' +
        'ION=0 '#1080#1083#1080' 2'
      
        'select NT.[ID_NAKLCAP], NT.[ID_TOV], NT.[PRICE], NT.[NUMB], NT.[' +
        'COMMENT], NC.[D], NC.[ID_DOC_TYPE]  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=:d_from'
      'and NC.[D]<=:d_to'
      'and NC.[IS_EXPORT]=0'
      'and NC.[IS_FINAL]=1'
      'and not (NC.[ID_DOC_TYPE] in'
      
        '(select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSI' +
        'ON_RECEPTION] in (1,3)))')
    Left = 600
    Top = 344
  end
  object Q_Naveski_For_Export: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        '-- '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1089#1077#1088#1074#1077#1088' NMK - IS_TRANSMISSION_RECEPT' +
        'ION=0 '#1080#1083#1080' 2'
      
        'select NV.[ID_NAKLCAP], NV.[ID_TOV], NV.[NUMB], NV.[D], NC.[D] a' +
        's DNC, NC.[ID_DOC_TYPE]  from [dbo].[NAVESKI] NV'
      'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NV.ID_NAKLCAP'
      'where NC.IS_DELETE=0'
      ' and NC.[D]>=:d_from'
      'and NC.[D]<=:d_to'
      'and NC.[IS_EXPORT]=0'
      'and NC.[IS_FINAL]=1'
      'and not (NC.[ID_DOC_TYPE] in'
      
        '(select [ID_DOC_TYPE] from [dbo].[DOC_TYPE] where [IS_TRANSMISSI' +
        'ON_RECEPTION] in (1,3)))'
      ''
      '')
    Left = 696
    Top = 344
  end
  object ADOCommand_Expotr_set: TADOCommand
    CommandText = 
      'update [dbo].[NAKLCAP] set [IS_EXPORT]=1 where '#13#10'[D]>=:d_from an' +
      'd'#13#10'[D]<=:d_to'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'd_from'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'd_to'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 688
    Top = 296
  end
  object QPrintReceipt: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], (CAST(NT.PRICE AS DECIMA' +
        'L(8,2))) as '#39'PRICE'#39','
      'sum(CAST(NV.NUMB AS DECIMAL(8,3))) as SN,'
      
        'sum(CAST(NT.PRICE AS DECIMAL(8,2))*CAST(NV.NUMB AS DECIMAL(8,3))' +
        ' ) as ST,'
      'T.IS_EXCISE, NV.[EXCISE_BAR_CODE],'
      'NV.ID_TOV, T.CODE, T.[UKTZED] from [dbo].[NAVESKI] NV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NV.ID_TOV'
      
        'inner join [dbo].[NAKLTOV] NT on NT.ID_NAKLCAP=NV.ID_NAKLCAP and' +
        ' NT.ID_TOV=NV.ID_TOV'
      'where NV.[ID_NAKLCAP]=:ID_NAKLCAP'
      
        'group by T.[NAME], T.[EDIZM], NT.PRICE,  T.IS_EXCISE,   NV.[EXCI' +
        'SE_BAR_CODE], NV.ID_TOV, T.CODE, T.[UKTZED]'
      ''
      ''
      '')
    Left = 320
    Top = 480
  end
  object QPrintCashCaption: TADOQuery
    Connection = ADOConnection1
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
      
        'select NC.[ID_NAKLCAP],  NC.[ID_CLIENT], NC.[ID_CLI_K], NC.[NN],' +
        ' NC.[D_CREATE],'
      
        'NC.[TOT_SUM], NC.[SUM_OPL_BONUS], NC.[SUM_OPL_CARD], NC.[SUM_POL' +
        'UCH], NC.[SUM_SDACHI],'
      'NC.[SKIDKA_KOLBASA], NC.[SKIDKA_MYASO], NC.[SKIDKA_TNP],'
      
        'NC.[PER_SKIDKA_KOLBASA], NC.[PER_SKIDKA_MYASO], NC.[PER_SKIDKA_T' +
        'NP], NC.[SKIDKA_COMMENT],'
      
        'NC.[MIN_KOLBASA], NC.[MIN_MYASO], NC.[MIN_TNP], NC.[BONUS_NACHIS' +
        'L], NC.[BONUS_OLD],  NC.[BONUS_NEW],'
      
        'CLD.INN as INN_D, CLK.INN as INN_K, NC.ID_DOC_TYPE, NC.[ROUND_SU' +
        'M], NC.SUM_SDACHI_TO_CARD,'
      
        'NC.CARD_NN_NOT_FISCAL, NC.TRANS_CODE_NOT_FISCAL, NC.MINUS, NC.[I' +
        'D_CLI_RRO], NC.[CHECK_NUMLOCAL], NC.[CHECK_NUMFISCAL],'
      
        'NC.[ORDERDATETIME], NC.[QRCODE_REG], isnull(CLRRO.CLIENT,'#39#39') as ' +
        'CLI_RRO,   isnull(CLRRO.INN,'#39#39') as INN_RRO'
      'from [dbo].[NAKLCAP] NC'
      'inner join CLIENTS CLD on CLD.ID_CLIENTS=NC.ID_CLIENT'
      'inner join CLIENTS CLK on CLK.ID_CLIENTS=NC.ID_CLI_K'
      
        'left outer join CLIENTS CLRRO on CLRRO.ID_CLIENTS=NC.[ID_CLI_RRO' +
        ']'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      ''
      '')
    Left = 280
    Top = 480
  end
  object SP_COPY_DOC_FOR_VOZVRAT: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'COPY_DOC_FOR_VOZVRAT;1'
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
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
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
      end>
    Left = 32
    Top = 502
  end
  object QKassaRepotr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QPriceTovSelectCalcFields
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
      end
      item
        Name = 'IS_REGISTER_RRO_ONLY'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      'declare @D_From datetime'
      'declare @D_To datetime'
      'declare @ID_USER int'
      'declare @IS_REGISTER_RRO_ONLY int'
      ''
      ' --set @D_From='#39'01.04.2023'#39
      ' --set @D_To='#39'01.04.2023 23:59:59'#39
      ' --set @ID_USER=32'
      ' --set @IS_REGISTER_RRO_ONLY=0'
      ''
      ' set @D_From=:D_From;'
      ' set @D_To=:D_To;'
      ' set @ID_USER=:ID_USER;'
      ' set @IS_REGISTER_RRO_ONLY=:IS_REGISTER_RRO_ONLY'
      ''
      'create table #t(i int)'
      'if @IS_REGISTER_RRO_ONLY<>0'
      'begin'
      #9'insert into #t(i) select 1'
      'end'
      'else'
      'begin'
      #9'insert into #t(i) select 0'
      #9'insert into #t(i) select 1'
      'end'
      ''
      
        'declare @S_REAL float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' '#1087#1088#1086#1076 +
        #1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072')'
      
        'declare @S_2KAT float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080 +
        #1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080
      'declare @S_SKIDKA_KOLBASA float,'
      
        '  @S_SKIDKA_MYASO float,  @S_SKIDKA_TNP float, @S_SKIDKA float; ' +
        '-- '#1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1086#1082
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1080#1090#1086#1075#1086
      'Set @S_REAL=0.0;'
      'Set @S_2KAT=0.0;'
      'set @S_SKIDKA_KOLBASA=0.0;'
      'set @S_SKIDKA_MYASO=0.0;'
      'set @S_SKIDKA_TNP=0.0;'
      'set @S_SKIDKA=0.0;'
      ''
      'select @S_SKIDKA_KOLBASA= isnull(SUM([SKIDKA_KOLBASA]),0.0),'
      '@S_SKIDKA_MYASO= isnull(SUM([SKIDKA_MYASO]),0.0),'
      
        '@S_SKIDKA_TNP= isnull(SUM([SKIDKA_TNP]),0.0) from [dbo].[NAKLCAP' +
        '] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      'set @S_SKIDKA=@S_SKIDKA_KOLBASA+@S_SKIDKA_MYASO+@S_SKIDKA_TNP'
      ''
      ''
      ''
      'select @S_REAL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      '@S_2KAT=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0)'
      'from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      
        '-- and T.[ID_GRTOV] in (38, 8, 15, 5, 19, 22, 36, 24, 27, 32, 35' +
        ', 28, 34, 26, 29, 33, 31, 30, 40, 44)'
      ''
      ''
      ''
      'declare @S_VOZVR float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
      ''
      '-- '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1080#1090#1086#1075#1086
      'Set @S_VOZVR=0.0;'
      
        'select @S_VOZVR=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0) from [dbo]' +
        '.[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      
        '-- and T.[ID_GRTOV] in (38, 8, 15, 5, 19, 22, 36, 24, 27, 32, 35' +
        ', 28, 34, 26, 29, 33, 31, 30, 40, 44)'
      ''
      ''
      ''
      
        'declare @S_REAL_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100 +
        #1085#1086#1081' '#1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1082#1086#1083#1073#1072#1089#1072
      
        'declare @S_2KAT_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' ' +
        #1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1072
      'declare @SN_KOLBASA float;'
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1082#1086#1083#1073#1072#1089#1099
      'Set @S_REAL_KOLBASA=0.0;'
      'Set @S_2KAT_KOLBASA=0.0;'
      'set @SN_KOLBASA=0.0;'
      
        'select @S_REAL_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S' +
        '_2KAT_KOLBASA=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),  @SN_KO' +
        'LBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '-- and T.ID_GRTOV in (8, 15, 5, 19, 22, 36, 24, 40, 44)'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9')'
      ''
      ''
      'declare @S_VOZVR_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      'declare @SN_VOZVR_KOLBASA float;'
      '-- '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
      'Set @S_VOZVR_KOLBASA=0.0;'
      'SET @SN_VOZVR_KOLBASA=0.0;'
      'select @S_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        '@SN_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLT' +
        'OV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '-- and T.ID_GRTOV in (8, 15, 5, 19, 22, 36, 24, 40, 44)'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9')'
      ''
      ''
      ''
      ''
      
        'declare @S_REAL_MYASO float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086 +
        #1081' '#1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1084#1103#1089#1086
      
        'declare @S_2KAT_MYASO float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072 +
        #1090#1077#1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1086
      'declare @SN_MYASO float;'
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1084#1103#1089#1072
      'Set @S_REAL_MYASO=0.0;'
      'Set @S_2KAT_MYASO=0.0;'
      'set @SN_MYASO=0.0;'
      
        'select @S_REAL_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_2' +
        'KAT_MYASO=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      '@SN_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '--and T.ID_GRTOV =38'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9')'
      ''
      ''
      'declare @S_VOZVR_MYASO float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1084#1103#1089#1086
      'declare @SN_VOZVR_MYASO float;'
      '-- '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
      'Set @S_VOZVR_MYASO=0.0;'
      'Set @SN_VOZVR_MYASO=0.0;'
      ''
      'select @S_VOZVR_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        '@SN_VOZVR_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV]' +
        ' NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '-- and T.ID_GRTOV =38'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9')'
      ''
      ''
      
        'declare @S_REAL_TNP float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' ' +
        #1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1096#1090#1091#1095#1082#1072
      
        'declare @S_2KAT_TNP float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072#1090#1077 +
        #1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1096#1090#1091#1095#1082#1072
      'declare @SN_TNP float;'
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1090#1085#1087
      'Set @S_REAL_TNP=0.0;'
      'Set @S_2KAT_TNP=0.0;'
      'set @SN_TNP=0.0;'
      
        'select @S_REAL_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_2KA' +
        'T_TNP=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      '@SN_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '-- and T.ID_GRTOV in (26, 27, 28, 29, 30, 31, 32, 33, 34, 35)'
      '-- and not (T.ID_GRTOV in (5,8,15,19,22,24,36, 38, 40, 44))'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9')'
      ''
      'declare @S_VOZVR_TNP float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1096#1090#1091#1095#1082#1072
      'declare @SN_VOZVR_TNP float;'
      '-- '#1074#1086#1079#1074#1088' '#1090#1085#1087
      'Set @S_VOZVR_TNP=0.0;'
      'Set @SN_VOZVR_TNP=0.0;'
      ''
      'select @S_VOZVR_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        '@SN_VOZVR_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] N' +
        'T'
      'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP]'
      'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      'and PR.ID_USERS=@ID_USER'
      '-- and T.ID_GRTOV in (26, 27, 28, 29, 30, 31, 32, 33, 34, 35)'
      '-- and not (T.ID_GRTOV in (5,8,15,19,22,24,36, 38, 40,44))'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9')'
      ''
      'declare @ROUND_SUM float'
      '-- '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103
      'set @ROUND_SUM=0.0'
      
        'select @ROUND_SUM= isnull(SUM([ROUND_SUM]),0.0) from [dbo].[NAKL' +
        'CAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'declare @SUM_OPL_CARD float'
      '-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1076#1077#1085#1077#1075' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
      'set @SUM_OPL_CARD=0.0'
      
        'select @SUM_OPL_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [dbo]' +
        '.[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'declare @SUM_OPL_BONUS float'
      '-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
      'set @SUM_OPL_BONUS=0.0'
      
        'select @SUM_OPL_BONUS= isnull(SUM([SUM_OPL_BONUS]),0.0) from [db' +
        'o].[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'declare @SUM_SDACHI_TO_CARD float'
      '-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      'set @SUM_SDACHI_TO_CARD=0.0'
      
        'select @SUM_SDACHI_TO_CARD= isnull(SUM([SUM_SDACHI_TO_CARD]),0.0' +
        ') from [dbo].[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'declare @SUM_NAL float'
      '-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      'set @SUM_NAL=0.0'
      
        'select @SUM_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_SDACH' +
        'I_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      'declare @SUM_VOZVR_NAL float'
      '-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      'set @SUM_VOZVR_NAL=0.0'
      
        'select @SUM_VOZVR_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]),0.0' +
        ') from [dbo].[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'declare @SUM_VOZVR_CARD float'
      '-- '#1074#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1091#1102' '#1082#1072#1088#1090#1091
      'set @SUM_VOZVR_CARD=0.0'
      
        'select @SUM_VOZVR_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [db' +
        'o].[NAKLCAP] NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      '-- '#1091#1094#1077#1085#1082#1080' '#1074#1089#1077
      'declare @SUM_UCEN float'
      'set @SUM_UCEN=@S_2KAT-@S_REAL'
      ''
      '-- '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1099
      'declare @SUM_UCEN_KOLBASA float'
      'set @SUM_UCEN_KOLBASA=@S_2KAT_KOLBASA-@S_REAL_KOLBASA'
      ''
      '-- '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1072
      'declare @SUM_UCEN_MYASO float'
      'set @SUM_UCEN_MYASO=@S_2KAT_MYASO-@S_REAL_MYASO'
      ''
      '-- '#1091#1094#1077#1085#1082#1080' '#1090#1085#1087
      'declare @SUM_UCEN_TNP float'
      'set @SUM_UCEN_TNP=@S_2KAT_TNP-@S_REAL_TNP'
      ''
      'declare @ZATRATY float'
      '--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      'set @ZATRATY=0.0'
      
        'select @ZATRATY= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLCAP]' +
        ' NC'
      
        'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[I' +
        'D_DOC_TYPE]=222 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      'drop table #t'
      ''
      ''
      
        'select @S_REAL as S_REAL, @S_2KAT as S_2KAT, @S_REAL_KOLBASA as ' +
        'S_REAL_KOLBASA, @S_2KAT_KOLBASA as S_2KAT_KOLBASA,'
      '@S_REAL_MYASO as S_REAL_MYASO, @S_2KAT_MYASO as S_2KAT_MYASO,'
      '@S_REAL_TNP as S_REAL_TNP, @S_2KAT_TNP as S_2KAT_TNP,'
      
        '@SUM_UCEN as SUM_UCEN, @SUM_UCEN_KOLBASA as SUM_UCEN_KOLBASA, @S' +
        'UM_UCEN_MYASO as SUM_UCEN_MYASO, @SUM_UCEN_TNP as SUM_UCEN_TNP,'
      
        '@SUM_OPL_CARD as SUM_OPL_CARD, @SUM_OPL_BONUS as SUM_OPL_BONUS, ' +
        '@SUM_NAL as SUM_NAL, @SN_KOLBASA as SN_KOLBASA, @SN_MYASO as SN_' +
        'MYASO,'
      '@SN_TNP as SN_TNP,'
      '@S_VOZVR as S_VOZVR,'
      '@S_VOZVR_KOLBASA as  S_VOZVR_KOLBASA,'
      '@SN_VOZVR_KOLBASA as SN_VOZVR_KOLBASA,'
      '@S_VOZVR_MYASO as  S_VOZVR_MYASO,'
      '@SN_VOZVR_MYASO as  SN_VOZVR_MYASO,'
      '@S_VOZVR_TNP  as  S_VOZVR_TNP,'
      '@SN_VOZVR_TNP as SN_VOZVR_TNP,'
      '@SUM_VOZVR_NAL as SUM_VOZVR_NAL,'
      '@SUM_NAL-@SUM_VOZVR_NAL+@SUM_SDACHI_TO_CARD-@ZATRATY as SUM_KAS,'
      '@S_SKIDKA_KOLBASA as SKIDKA_KOLBASA,'
      '@S_SKIDKA_MYASO as SKIDKA_MYASO,'
      '@S_SKIDKA_TNP as SKIDKA_TNP,'
      '@S_SKIDKA as SKIDKA,'
      '@ZATRATY as ZATRATY,'
      '@SUM_VOZVR_CARD as SUM_VOZVR_CARD,'
      '@ROUND_SUM as ROUND_SUM,'
      '@SUM_SDACHI_TO_CARD as SUM_SDACHI_TO_CARD,'
      '@S_REAL-@S_SKIDKA+@ROUND_SUM as SUM_REAL_TO_PAY'
      ''
      '')
    Left = 119
    Top = 446
    object QKassaRepotrS_REAL: TFloatField
      FieldName = 'S_REAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_2KAT: TFloatField
      FieldName = 'S_2KAT'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_REAL_KOLBASA: TFloatField
      FieldName = 'S_REAL_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_2KAT_KOLBASA: TFloatField
      FieldName = 'S_2KAT_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_REAL_MYASO: TFloatField
      FieldName = 'S_REAL_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_2KAT_MYASO: TFloatField
      FieldName = 'S_2KAT_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_REAL_TNP: TFloatField
      FieldName = 'S_REAL_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_2KAT_TNP: TFloatField
      FieldName = 'S_2KAT_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_UCEN: TFloatField
      FieldName = 'SUM_UCEN'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_UCEN_KOLBASA: TFloatField
      FieldName = 'SUM_UCEN_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_UCEN_MYASO: TFloatField
      FieldName = 'SUM_UCEN_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_UCEN_TNP: TFloatField
      FieldName = 'SUM_UCEN_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_OPL_CARD: TFloatField
      FieldName = 'SUM_OPL_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_OPL_BONUS: TFloatField
      FieldName = 'SUM_OPL_BONUS'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_KOLBASA: TFloatField
      FieldName = 'SN_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_MYASO: TFloatField
      FieldName = 'SN_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_TNP: TFloatField
      FieldName = 'SN_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_VOZVR: TFloatField
      FieldName = 'S_VOZVR'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_VOZVR_KOLBASA: TFloatField
      FieldName = 'S_VOZVR_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_VOZVR_KOLBASA: TFloatField
      FieldName = 'SN_VOZVR_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_VOZVR_MYASO: TFloatField
      FieldName = 'S_VOZVR_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_VOZVR_MYASO: TFloatField
      FieldName = 'SN_VOZVR_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrS_VOZVR_TNP: TFloatField
      FieldName = 'S_VOZVR_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSN_VOZVR_TNP: TFloatField
      FieldName = 'SN_VOZVR_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_VOZVR_NAL: TFloatField
      FieldName = 'SUM_VOZVR_NAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_KAS: TFloatField
      FieldName = 'SUM_KAS'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSKIDKA_KOLBASA: TFloatField
      FieldName = 'SKIDKA_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSKIDKA_MYASO: TFloatField
      FieldName = 'SKIDKA_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSKIDKA_TNP: TFloatField
      FieldName = 'SKIDKA_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSKIDKA: TFloatField
      FieldName = 'SKIDKA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrZATRATY: TFloatField
      FieldName = 'ZATRATY'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_VOZVR_CARD: TFloatField
      FieldName = 'SUM_VOZVR_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrROUND_SUM: TFloatField
      FieldName = 'ROUND_SUM'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_SDACHI_TO_CARD: TFloatField
      FieldName = 'SUM_SDACHI_TO_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaRepotrSUM_REAL_TO_PAY: TFloatField
      FieldName = 'SUM_REAL_TO_PAY'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object DSQKassaRepotr: TDataSource
    DataSet = QKassaRepotr
    Left = 160
    Top = 448
  end
  object ADOCommandSetNull_PRICE_TMP: TADOCommand
    CommandText = 'update PRICE set PRICE_TMP=0.0 where ID_USERS=:ID_USER'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 496
  end
  object ADOCommandInsert_UserPRICE: TADOCommand
    CommandText = 
      'insert [dbo].[PRICE] ([ID_TOV], [ID_USERS], [ID_VENDOR], [NUMB],' +
      ' [PRICE_TMP], [OSTAT], [PRICE_UCH], [COMMENT], [PRICE_VENDOR], [' +
      'IS_ACTION])'#13#10'values (:ID_TOV, :ID_USERS, :ID_VENDOR, :NUMB, :PRI' +
      'CE_TMP, :OSTAT, :PRICE_UCH, :COMMENT, :PRICE_VENDOR, :IS_ACTION)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_USERS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_VENDOR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NUMB'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE_TMP'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'OSTAT'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PRICE_UCH'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'PRICE_VENDOR'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'IS_ACTION'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 336
    Top = 600
  end
  object QDocList: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QDocListCalcFields
    Parameters = <
      item
        Name = 'IDDT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DFROM'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DTO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'select  NC.D, NC.NN, NC.MINUS, NC.PRICE_KATEG, NC.ID_NAKLCAP, NC' +
        '.TOT_SUM, NC.TOT_NUM, NC.SCH_D, NC.SCH_K,'
      ' CL.CLIENT, NC.D_CREATE,'
      'U."NAME"  USER_CR,'
      '  CLK.CLIENT CLI_K,'
      
        ' DT.NAMEDOC, DCH.CHAR_DOC,NC.ID_DOC_TYPE,DT.ID_CHAR_DOC, NC.ID_C' +
        'LI_K,'
      '  CLK.INN INN_K, CL.INN INN_D, NC.ID_CLIENT,'
      '  NC.[IS_CAN_REGISTRED_RRO], NC.[IS_REGISTER_RRO], NC.IS_FINAL'
      ' from NAKLCAP NC'
      'left outer join CLIENTS CL'
      ' on CL.ID_CLIENTS=NC.ID_CLIENT'
      'left outer join CLIENTS CLK'
      ' on CLK.ID_CLIENTS=NC.ID_CLI_K'
      'left outer join USERS U'
      ' on U.ID_USERS=NC.ID_USERS'
      'left outer join DOC_TYPE DT'
      ' on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE'
      'left outer join DOC_CHAR DCH'
      ' on DCH.ID_CHAR_DOC=DT.ID_CHAR_DOC'
      ''
      'where NC.ID_DOC_TYPE=:IDDT'
      '    and NC.IS_DELETE=0'
      '    and NC.D >=:DFROM'
      '    and NC.D<=:DTO'
      'order by NC.D, NC.NN'
      '')
    Left = 32
    Top = 120
    object QDocListD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
    end
    object QDocListNN: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NN'
      Size = 50
    end
    object QDocListTOT_NUM: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'TOT_NUM'
      DisplayFormat = '0.000'
    end
    object QDocListTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
      DisplayFormat = '0.00'
    end
    object QDocListCLIENT: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLIENT'
      Size = 255
    end
    object QDocListCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 30
      FieldName = 'CLI_K'
      Size = 255
    end
    object QDocListMINUS: TFloatField
      FieldName = 'MINUS'
      Visible = False
    end
    object QDocListPRICE_KATEG: TIntegerField
      FieldName = 'PRICE_KATEG'
      Visible = False
    end
    object QDocListID_NAKLCAP: TAutoIncField
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
      Visible = False
    end
    object QDocListSCH_D: TStringField
      FieldName = 'SCH_D'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QDocListSCH_K: TStringField
      FieldName = 'SCH_K'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QDocListD_CREATE: TDateTimeField
      FieldName = 'D_CREATE'
      Visible = False
    end
    object QDocListUSER_CR: TWideStringField
      FieldName = 'USER_CR'
      Visible = False
      Size = 50
    end
    object QDocListNAMEDOC: TWideStringField
      FieldName = 'NAMEDOC'
      Visible = False
      Size = 50
    end
    object QDocListCHAR_DOC: TWideStringField
      FieldName = 'CHAR_DOC'
      Visible = False
      Size = 50
    end
    object QDocListID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
      Visible = False
    end
    object QDocListID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
      Visible = False
    end
    object QDocListID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object QDocListINN_K: TWideStringField
      FieldName = 'INN_K'
      Visible = False
    end
    object QDocListINN_D: TWideStringField
      FieldName = 'INN_D'
      Visible = False
    end
    object QDocListID_CLIENT: TIntegerField
      FieldName = 'ID_CLIENT'
      Visible = False
    end
    object QDocListIS_CAN_REGISTRED_RRO: TIntegerField
      FieldName = 'IS_CAN_REGISTRED_RRO'
    end
    object QDocListIS_REGISTER_RRO: TIntegerField
      FieldName = 'IS_REGISTER_RRO'
    end
    object QDocListIS_FINAL: TIntegerField
      FieldName = 'IS_FINAL'
      Visible = False
    end
    object QDocListis_final_doc: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldKind = fkCalculated
      FieldName = 'is_final_doc'
      Size = 30
      Calculated = True
    end
  end
  object DS_QDocList: TDataSource
    DataSet = QDocList
    Left = 72
    Top = 120
  end
  object ADOCommandOstatkiCalc: TADOCommand
    CommandText = 
      ' --use NMK_TP_EXPERIMENT'#13#10#13#10'declare @D datetime'#13#10'declare @ID_USE' +
      'R int, @EPS float'#13#10#13#10'set @D=:D'#13#10'set @ID_USER=:ID_USER'#13#10'--set @D=' +
      #39'21.06.2023 23:59:59'#39#13#10'--set @ID_USER=32'#13#10#13#10'set @EPS=0.0001'#13#10'dec' +
      'lare @D_LAST_INV datetime -- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080#13#10'set ' +
      '@D_LAST_INV=0'#13#10'select @D_LAST_INV=isnull(max(D),0) from [dbo].[N' +
      'AKLCAP]  where [ID_DOC_TYPE]=206 and D<@D and [IS_DELETE]=0'#13#10'sel' +
      'ect @D_LAST_INV'#13#10#13#10'declare @ID_TOV int, @DEB float, @KRED float'#13 +
      #10#13#10'update [dbo].[PRICE] set [OSTAT]=0.0, [IS_EXISTS_OSTATOK]=0 f' +
      'rom [dbo].[PRICE] where  [ID_USERS]=@ID_USER'#13#10#13#10'create table #OS' +
      'T_TMP (ID_TOV int, DEB float, KRED float)'#13#10#13#10#13#10'insert into #OST_' +
      'TMP (ID_TOV, DEB, KRED)'#13#10'-- '#1090#1086#1074#1072#1088#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' (206' +
      ')'#13#10#9'select NT.ID_TOV, isnull(sum([NUMB]),0), 0 from [dbo].[NAKLT' +
      'OV] NT'#13#10#9'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NA' +
      'KLCAP'#13#10#9'where NC.D=@D_LAST_INV  and NC.[ID_DOC_TYPE] in (206) an' +
      'd  NC.[IS_DELETE]=0'#13#10#9'group by NT.ID_TOV'#13#10#13#10'insert into #OST_TMP' +
      ' (ID_TOV, DEB, KRED)'#13#10'-- + '#1087#1088#1080#1093#1086#1076#1086#1074' '#1058#1053#1055' (219) + '#1082#1086#1083#1073#1072#1089#1099' (209) + ' +
      #1084#1103#1089#1072' (216) + '#1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103' (204)+ '#1055#1088#1080#1093#1086#1076' '#1075#1086#1090' '#1087#1088#1086#1076' '#1089#1086#1073#1089#1090#1074 +
      ' '#1080#1079#1075#1086#1090' '#1089' '#1087#1088'-'#1074#1072' (288)+'#13#10'-- POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1085#1072' '#1058#1057'(228' +
      ') + POS '#1040#1074#1090#1086' '#1055#1088#1080#1093#1086#1076' '#1058#1086#1074#1072#1088#1086#1074' '#1089' '#1053#1052#1050' '#1085#1072' '#1058#1057'(230) + POS_'#1055#1088#1080#1093#1086#1076' '#1086#1074#1086#1097#1077#1081 +
      '(271)+a009 POS '#1040#1074#1090#1086' '#1055#1077#1088#1077#1076#1072#1095#1072' ('#1055#1088#1080#1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(277)'#13#10'-' +
      '- + '#1055#1088#1080#1093#1086#1076' '#1076#1080#1089#1082#1086#1085#1090#1085#1099#1093' '#1082#1072#1088#1090' '#1085#1072' '#1058#1057' (308)'#9#13#10#9'select NT.ID_TOV, isnu' +
      'll(sum([NUMB]),0), 0 from [dbo].[NAKLTOV] NT'#13#10#9'inner join [dbo].' +
      '[NAKLCAP] NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'#13#10#9'where NC.D>=@D_LAS' +
      'T_INV and  NC.D<=@D and NC.[ID_DOC_TYPE] in (204, 209, 216, 219,' +
      ' 228, 230, 271, 277, 288, 308 ) and  NC.[IS_DELETE]=0'#13#10#9'group by' +
      ' NT.ID_TOV'#13#10#13#10'insert into #OST_TMP (ID_TOV, DEB, KRED)'#13#10'-- '#1088#1072#1089#1093#1086 +
      #1076' '#1090#1086#1074#1072#1088#1072' '#1087#1088#1086#1076#1072#1078#1072' (200), '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055' (220), '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086 +
      #1083#1073#1072#1089#1099' '#1085#1072' '#1053#1052#1050' (211), '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072' (217),  '#1056#1072#1089#1093#1086#1076' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074' '#1074' '#1087 +
      #1088'-'#1074#1086' (287)'#13#10'-- POS '#1042#1086#1079#1074#1088#1072#1090' '#1087#1083#1072#1090#1085#1086#1081' '#1090#1072#1088#1099' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050' (232), POS '#1042 +
      #1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1058#1057' '#1085#1072' '#1053#1052#1050'(234), POS_'#1057#1087#1080#1089#1072#1085#1080#1077' '#1086#1074#1086#1097#1077#1081'(272), POS '#1055 +
      #1077#1088#1077#1076#1072#1095#1072' ('#1056#1072#1089#1093#1086#1076') '#1090#1086#1074#1072#1088#1086#1074' '#1089' '#1090#1090' '#1085#1072' '#1090#1090'(276)'#13#10'-- POS '#1042#1099#1076#1072#1095#1072' '#1076#1080#1089#1082#1086#1085#1090#1085 +
      #1099#1093' '#1082#1072#1088#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1102' (309)'#9#9#13#10#9#9'select NT.ID_TOV,0,isnull(sum([NUM' +
      'B]),0.0) from [dbo].[NAKLTOV] NT'#13#10#9#9'inner join [dbo].[NAKLCAP] N' +
      'C on NC.ID_NAKLCAP=NT.ID_NAKLCAP'#13#10#9#9'where NC.D>=@D_LAST_INV and ' +
      ' NC.D<=@D and NC.[ID_DOC_TYPE] in (200, 211, 217, 220, 232, 234,' +
      ' 272, 276, 287, 309 ) and  NC.[IS_DELETE]=0'#13#10#9#9'group by NT.ID_TO' +
      'V'#13#10#13#10#13#10'--select * from '#9'#OST_TMP'#9#13#10'--select T.NAME, O.ID_TOV, Is' +
      'null(sum(O.DEB-O.KRED), 0) from #OST_TMP O'#13#10'--inner join TOV T o' +
      'n T.ID_TOV=O.ID_TOV '#13#10'--group by  T.NAME,O.ID_TOV '#13#10#13#10'update P s' +
      'et P.[OSTAT]='#13#10'('#13#10'select Isnull(sum(O.DEB-O.KRED), 0) from #OST_' +
      'TMP O where O.[ID_TOV]=P.ID_TOV'#13#10#13#10') '#13#10'from [dbo].[PRICE] P wher' +
      'e  P.[ID_USERS]=@ID_USER'#13#10#13#10'drop table #OST_TMP'#13#10#13#10'update P set ' +
      'P.[IS_EXISTS_OSTATOK]=1 from [dbo].[PRICE] P where  P.[ID_USERS]' +
      '=@ID_USER and P.[OSTAT]>0'#13#10
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'D'
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
    Left = 16
    Top = 616
  end
  object ADOCommandInsert_DocumCap: TADOCommand
    CommandText = 
      'insert NAKLCAP_IMPORT_TMP ('#13#10'[ID_NAKLCAP], '#13#10'[ID_USER],'#13#10'[D],'#13#10'[' +
      'NN],'#13#10'[ID_DOC_TYPE],'#13#10'[ID_CLIENT],'#13#10'[PRICE_KATEG],'#13#10'[TOT_SUM],'#13#10 +
      '[TOT_NUM],'#13#10'[NUM_TARA],'#13#10'[ID_TARA],'#13#10'[ID_CLI_K],'#13#10'[SCH_D],'#13#10'[SCH' +
      '_K],'#13#10'[NDS],'#13#10'[STAVKA_NDS],'#13#10'[IS_SVERENO]'#13#10')'#13#10'values('#13#10':ID_NAKLC' +
      'AP, '#13#10':ID_USER,'#13#10':D,'#13#10':NN,'#13#10':ID_DOC_TYPE,'#13#10':ID_CLIENT,'#13#10':PRICE_K' +
      'ATEG,'#13#10':TOT_SUM,'#13#10':TOT_NUM,'#13#10':NUM_TARA,'#13#10':ID_TARA,'#13#10':ID_CLI_K,'#13#10 +
      ':SCH_D,'#13#10':SCH_K,'#13#10':NDS,'#13#10':STAVKA_NDS,'#13#10':IS_SVERENO'#13#10')'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_USER'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'NN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ID_DOC_TYPE'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLIENT'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRICE_KATEG'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TOT_SUM'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'TOT_NUM'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'NUM_TARA'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'ID_TARA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI_K'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SCH_D'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'SCH_K'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'NDS'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'STAVKA_NDS'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'IS_SVERENO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 616
  end
  object ADOCommandInsert_DocumTov: TADOCommand
    CommandText = 
      'insert NAKLTOV_IMPORT_TMP ('#13#10'[ID_NAKLCAP], '#13#10'[ID_USER], '#13#10'[ID_TO' +
      'V], '#13#10'[PRICE], '#13#10'[NUMB], '#13#10'[COMMENT]'#13#10')'#13#10'values('#13#10':ID_NAKLCAP, '#13 +
      #10':ID_USER, '#13#10':ID_TOV, '#13#10':PRICE, '#13#10':NUMB, '#13#10':COMMENT'#13#10')'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_USER'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRICE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'NUMB'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 168
    Top = 616
  end
  object ADOCommandInsert_DocumNaveski: TADOCommand
    CommandText = 
      'insert NAVESKI_IMPORT_TMP ('#13#10'[ID_NAKLCAP], '#13#10'[ID_USER], '#13#10'[ID_TO' +
      'V], '#13#10'[NUMB], '#13#10'[D]'#13#10')'#13#10'values('#13#10':ID_NAKLCAP, '#13#10':ID_USER, '#13#10':ID_' +
      'TOV, '#13#10':NUMB, '#13#10':D'#13#10')'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_USER'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NUMB'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'D'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 208
    Top = 616
  end
  object SP_COPY_IMPORT_DOC: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'COPY_IMPORT_DOC;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@D_FROM'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@D_TO'
        Attributes = [paNullable]
        DataType = ftDateTime
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
    Left = 36
    Top = 458
  end
  object SP_IVNENT_UNION: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'IVNENT_UNION;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@D_INV'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NAKLCAP_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 34
    Top = 332
  end
  object ADOCommandDelete_PredSkidka: TADOCommand
    CommandText = 'delete [dbo].[SKIDKA_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 56
    Top = 560
  end
  object ADOCommandInsert_Skidka: TADOCommand
    CommandText = 
      'insert into [dbo].[SKIDKA_POS]'#13#10'( [ID_SKIDKA],'#13#10'[PER_SKIDKA_KOLB' +
      'ASA], [PER_SKIDKA_MYASO], [PER_SKIDKA_TNP],'#13#10' [COMMENT], [D_FROM' +
      '], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN_TNP],'#13#10'[IS_NAMED], [' +
      'DAY_TIME_FROM], [DAY_TIME_TO]'#13#10')'#13#10'values'#13#10'('#13#10':ID_SKIDKA, :PER_SK' +
      'IDKA_KOLBASA,  :PER_SKIDKA_MYASO,  :PER_SKIDKA_TNP, '#13#10':COMMENT, ' +
      ':D_FROM, :D_TO, :MIN_KOLBASA, :MIN_MYASO, :MIN_TNP,'#13#10':IS_NAMED, ' +
      ' :DAY_TIME_FROM, :DAY_TIME_TO'#13#10')'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_SKIDKA'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PER_SKIDKA_KOLBASA'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PER_SKIDKA_MYASO'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'PER_SKIDKA_TNP'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'COMMENT'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'MIN_KOLBASA'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'MIN_MYASO'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'MIN_TNP'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'IS_NAMED'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DAY_TIME_FROM'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DAY_TIME_TO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 88
    Top = 560
  end
  object SP_CALC_DOC_RESULT: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'CALC_DOC_RESULT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDU'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PER_SKIDKA_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MIN_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MIN_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MIN_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_KOLBASA'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_KOLBASA'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_MYASO'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_MYASO'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_TNP'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_TNP'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_KOLBASA_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_KOLBASA_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_MYASO_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_MYASO_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@N_TNP_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 3
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_TNP_NOT_ACTION'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_KOLBASA'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_MYASO'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@SKIDKA_TNP'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 15
        Value = Null
      end
      item
        Name = '@COUNT_SEL_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 338
    Top = 212
  end
  object QPrintReceipt_Kolbasa: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      
        '-- and T.ID_GRTOV  in (8, 15, 5, 19, 22, 36, 24, 40, 44) -- '#1082#1086#1083#1073 +
        #1072#1089#1072
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 352
    Top = 480
  end
  object QPrintReceipt_Myaso: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      '-- and T.ID_GRTOV  in (38) -- '#1084#1103#1089#1086
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 384
    Top = 480
  end
  object QPrintReceipt_TNP: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      
        '-- and not (T.ID_GRTOV  in (8, 15, 5, 19, 22, 36, 24,38,40,44)) ' +
        '-- '#1058#1053#1055
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 416
    Top = 480
  end
  object ADOCommand_Delete_PredNewPriceTov: TADOCommand
    CommandText = 'delete [dbo].[NEW_PRICE_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 240
    Top = 568
  end
  object ADOCommandInsertNEW_PRICE_POS: TADOCommand
    CommandText = 
      'insert into [dbo].[NEW_PRICE_POS]'#13#10'( [ID_TOV],'#13#10'[PRICE2])'#13#10'value' +
      's'#13#10'('#13#10':ID_TOV, :PRICE2)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'PRICE2'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Left = 272
    Top = 568
  end
  object Q_CLIENTS_NEW_POS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select [ID_CLI], [ID_TRADE_POINT], [CLIENT], [INN], [TEL], [EMAI' +
        'L], [BIRTHDAY], [ID_USER] from [dbo].[CLIENTS_NEW_POS]'
      ''
      ''
      '')
    Left = 552
    Top = 272
  end
  object ADOCommand_Delete_PredAdvertMsg: TADOCommand
    CommandText = 'delete [dbo].[ADVERT_MSG_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 384
    Top = 568
  end
  object ADOCommandInsertAdvert: TADOCommand
    CommandText = 
      'insert into [dbo].[ADVERT_MSG]'#13#10'( [ID_ADVERT], [TYPE_MSG], [ID_C' +
      'LI], [MSG])'#13#10'values'#13#10'('#13#10':ID_ADVERT, :TYPE_MSG, :ID_CLI, :MSG)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_ADVERT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TYPE_MSG'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'MSG'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1000
        Value = Null
      end>
    Left = 416
    Top = 568
  end
  object ADOCommand_Delete_PredUserTradePoint: TADOCommand
    CommandText = 'delete [dbo].[USERS_TMP] '
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 472
    Top = 520
  end
  object ADOCommand_Insert_UserTradePoint: TADOCommand
    CommandText = 
      'insert into [dbo].[USERS]'#13#10'( [ID_USERS]'#13#10'      ,[NAME]'#13#10'      ,[' +
      'LOGIN]'#13#10'      ,[STATUS]'#13#10'      ,[BIRTHDAY]'#13#10'      ,[PASSW]'#13#10'    ' +
      '  ,[IS_DELETE])'#13#10'values'#13#10'('#13#10':ID_USERS'#13#10'      ,:U_NAME'#13#10'      ,:L' +
      'OGIN'#13#10'      ,:STATUS'#13#10'      ,:BIRTHDAY'#13#10'      ,:PASSW'#13#10'      ,:I' +
      'S_DELETE)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_USERS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'U_NAME'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'LOGIN'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'STATUS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'BIRTHDAY'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'PASSW'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 504
    Top = 520
  end
  object ADOCommandDeleteCLIENTS_NEW_POS: TADOCommand
    CommandText = 'delete [dbo].[CLIENTS_NEW_POS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 712
    Top = 448
  end
  object ADOCommand_Delete_PredPrice: TADOCommand
    CommandText = 'delete [dbo].[PRICE_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 304
    Top = 600
  end
  object Q_PrinterSetup: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select [ID], [PRINTER_NAME], [PRINTER_INDEX], [IS_FISCAL] from [' +
        'dbo].[PRINTER_SETUP]')
    Left = 748
    Top = 538
  end
  object ADOCommand_Delete_PredKioOperGroup: TADOCommand
    CommandText = 'delete KIO_OPERATIONS_GRUP_TMP'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 592
    Top = 608
  end
  object ADOCommandInsertKIO_OPERATIONS_GRUP: TADOCommand
    CommandText = 
      'insert into [dbo].[KIO_OPERATIONS_GRUP]'#13#10'( [ID_VID_OPERATION],[I' +
      'D_GRTOV])'#13#10'values'#13#10'(:ID_VID_OPERATION, :ID_GRTOV)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_VID_OPERATION'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_GRTOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 632
    Top = 608
  end
  object ADOCommand_Delete_PredPRODUCT_POS: TADOCommand
    CommandText = 'delete [dbo].[PRODUCT_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 528
    Top = 208
  end
  object ADOCommand_Insert_PRODUCT_POS: TADOCommand
    CommandText = 
      'insert into [dbo].[PRODUCT_POS]'#13#10'([ID_PROD], [ID_TOV], [N_SYR_MI' +
      'NUS], [N_SYR_PLUS], [N_GOT_MINUS], [N_GOT_PLUS], [N_SUH_MINUS], ' +
      '[N_SUH_PLUS] )'#13#10'values'#13#10'(:ID_PROD, :ID_TOV, :N_SYR_MINUS, :N_SYR' +
      '_PLUS, :N_GOT_MINUS, :N_GOT_PLUS, :N_SUH_MINUS, :N_SUH_PLUS )'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_PROD'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'N_SYR_MINUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'N_SYR_PLUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'N_GOT_MINUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'N_GOT_PLUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'N_SUH_MINUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'N_SUH_PLUS'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Left = 560
    Top = 208
  end
  object ADOCommand_Delete_PredNORM_ASSEMB_POS: TADOCommand
    CommandText = 'delete [dbo].[NORM_ASSEMB_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 688
    Top = 208
  end
  object ADOCommand_Insert_NORM_ASSEMB_POS: TADOCommand
    CommandText = 
      'insert into [dbo].[NORM_ASSEMB_POS]'#13#10'([ID_NORM], [ID_PROD], [ID_' +
      'TOV], [NORMA] )'#13#10'values'#13#10'(:ID_NORM, :ID_PROD, :ID_TOV, :NORMA )'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_NORM'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_PROD'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NORMA'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Left = 720
    Top = 208
  end
  object QPrintReceipt_Tov_Fiscal: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      '-- use NMK_TP'
      '-- '#1092#1080#1089#1082#1072#1083#1100#1085#1099#1077' '#1090#1086#1074#1072#1088#1099' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      
        'select NT.ID_TOV, T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.' +
        'NUMB, (NT.PRICE*NT.NUMB) as ST,'
      'T.CODE, T.UKTZED, T.[IS_EXCISE]  from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP and T.IS_FISCAL=1')
    Left = 280
    Top = 520
  end
  object QPrintReceipt_Tov_NotFiscal: TADOQuery
    Connection = ADOConnection1
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
      '-- use NMK_TP'
      '-- '#1085#1077#1092#1080#1089#1082#1072#1083#1100#1085#1099#1077' '#1090#1086#1074#1072#1088#1099' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      'T.CODE, T.UKTZED, T.[IS_EXCISE] from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP and T.IS_FISCAL=0')
    Left = 320
    Top = 520
  end
  object QPrintReceipt_Kolbasa_NotFiscal: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      'and T.IS_FISCAL=0'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (1) -- '#1082#1086#1083#1073#1072#1089#1072
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 344
    Top = 440
  end
  object QPrintReceipt_Myaso_NotFiscal: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      'and T.IS_FISCAL=0'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (2) -- '#1084#1103#1089#1086
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 384
    Top = 440
  end
  object QPrintReceipt_TNP_NotFiscal: TADOQuery
    Connection = ADOConnection1
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
      
        'select T.[NAME] as TOV_NAME, T.[EDIZM], NT.PRICE, NT.NUMB, (NT.P' +
        'RICE*NT.NUMB) as ST,'
      '('
      
        'select TOP 1 P.[IS_ACTION] from [dbo].[PRICE] P where P.ID_TOV=N' +
        'T.ID_TOV'
      ') as IS_ACTION'
      ' from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      'where [ID_NAKLCAP]=:ID_NAKLCAP'
      'and T.IS_FISCAL=0'
      'and T.ID_GRTOV in ('
      
        #9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG ' +
        'where KOG.[ID_VID_OPERATION] in (3,4,5,6) -- '#1058#1053#1055
      #9#9#9#9')'
      'order by IS_ACTION, T.[NAME]')
    Left = 424
    Top = 448
  end
  object ADOCommand_Delete_PredKUPON_CARD: TADOCommand
    CommandText = 'delete [dbo].[KUPON_CARD_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 720
    Top = 496
  end
  object ADOCommandInsertKUPON_CARD: TADOCommand
    CommandText = 
      'insert into [dbo].[KUPON_CARD] '#13#10'('#13#10#9'   [ID_KUPON]'#13#10')'#13#10' values '#13 +
      #10'('#13#10#9'   :ID_KUPON'#13#10')'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_KUPON'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 752
    Top = 496
  end
  object Q_EXCISE_BAR_CODE: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_NAKLCAP int, @ID_TOV int'
      'set @ID_NAKLCAP=:ID_NAKLCAP'
      'set @ID_TOV=:ID_TOV'
      ''
      
        'select [EXCISE_BAR_CODE] from [dbo].[NAVESKI] where [ID_NAKLCAP]' +
        '=@ID_NAKLCAP and  [ID_TOV]=@ID_TOV '
      
        'and [EXCISE_BAR_CODE] IS NOT NULL and RTRIM(LTRIM([EXCISE_BAR_CO' +
        'DE]))<>'#39#39)
    Left = 360
    Top = 520
  end
  object ADOCommandDELETE_RRO_CERTIFIC: TADOCommand
    CommandText = 'delete [dbo].[RRO_KASSA_TS]'#13#10'delete [dbo].[RRO_CERTIFIC]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 576
    Top = 136
  end
  object ADOCommandDELETE_RRO_KASSA_TS: TADOCommand
    CommandText = 'delete [dbo].[RRO_KASSA_TS]'#13#10
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 680
    Top = 136
  end
  object ADOCommandInsertRRO_Certific: TADOCommand
    CommandText = 
      'declare @ID_CLI int, @CERTIF nvarchar(MAX), @PRIVATE_KEY nvarcha' +
      'r(MAX), @PASSW nvarchar(50), @DATE_END_CERTIFICATE datetime'#13#10'set' +
      ' @ID_CLI=:ID_CLI'#13#10'set @CERTIF=:CERTIF'#13#10'set @PRIVATE_KEY =:PRIVAT' +
      'E_KEY '#13#10'set @PASSW=:PASSW'#13#10'set @DATE_END_CERTIFICATE=:DATE_END_C' +
      'ERTIFICATE'#13#10#13#10'insert into [dbo].[RRO_CERTIFIC] ([ID_CLI]'#13#10'      ' +
      ',[CERTIFICATE]'#13#10'      ,[PRIVATE_KEY]'#13#10'      ,[PASSW] '#13#10#9'  ,[DATE' +
      '_END_CERTIFICATE]'#13#10#9'  )'#13#10#9'  values (@ID_CLI'#13#10'      ,@CERTIF'#13#10'   ' +
      '   ,@PRIVATE_KEY'#13#10'      ,@PASSW'#13#10#9'  ,@DATE_END_CERTIFICATE'#13#10#9'  )'
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_CLI'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CERTIF'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PRIVATE_KEY'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PASSW'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DATE_END_CERTIFICATE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 536
    Top = 139
  end
  object ADOCommandInsertRRO_KASSA_TS: TADOCommand
    CommandText = 
      'declare @ID_RRO_KASSA int, @ID_CLI int, @ID_TT int, @ID_NUM_FISC' +
      'AL_KASSA bigint, @NAME_KASSA nvarchar(50),'#13#10' @CERTIFICATE nvarch' +
      'ar(MAX), @PRIVATE_KEY nvarchar(MAX), @PASSW nvarchar(50), @DATE_' +
      'END_CERTIFICATE datetime '#13#10#13#10'set @ID_RRO_KASSA=:ID_RRO_KASSA'#13#10'se' +
      't @ID_CLI=:ID_CLI'#13#10'set @ID_TT=:ID_TT'#13#10'set @ID_NUM_FISCAL_KASSA=:' +
      'ID_NUM_FISCAL_KASSA'#13#10'set @NAME_KASSA=:NAME_KASSA '#13#10#13#10'set @CERTIF' +
      'ICATE=:CERTIF'#13#10'set @PRIVATE_KEY =:PRIVATE_KEY '#13#10'set @PASSW=:PASS' +
      'W'#13#10'set @DATE_END_CERTIFICATE=:DATE_END_CERTIFICATE'#13#10#13#10#13#10#13#10'insert' +
      ' into [dbo].[RRO_KASSA_TS] ('#13#10#9'[ID_RRO_KASSA]'#13#10#9',[ID_TT]'#13#10'    ,[' +
      'ID_CLI]'#13#10'    ,[ID_NUM_FISCAL_KASSA]'#13#10'    ,[NAME_KASSA]'#13#10#9',[CERTI' +
      'FICATE]'#13#10#9',[PRIVATE_KEY]'#13#10#9',[PASSW]'#13#10#9',[DATE_END_CERTIFICATE]'#13#10#13 +
      #10#9')'#13#10#9'  values ('#13#10#9'  @ID_RRO_KASSA'#13#10#9'  ,@ID_TT'#13#10'      ,@ID_CLI'#13#10 +
      '      ,@ID_NUM_FISCAL_KASSA'#13#10'      ,@NAME_KASSA'#13#10#9'  ,@CERTIFICAT' +
      'E'#13#10'      ,@PRIVATE_KEY'#13#10'      ,@PASSW'#13#10#9'  ,@DATE_END_CERTIFICATE' +
      #13#10#9'  )'
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_RRO_KASSA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CLI'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_NUM_FISCAL_KASSA'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end
      item
        Name = 'NAME_KASSA'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CERTIF'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PRIVATE_KEY'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PASSW'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DATE_END_CERTIFICATE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 728
    Top = 139
  end
  object QKassaReport_RRO: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      end
      item
        Name = 'IS_REGISTER_RRO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_TP'
      ''
      'declare @D_From datetime'
      'declare @D_To datetime'
      'declare @ID_USER int'
      'declare @IS_REGISTER_RRO int'
      '--declare @D datetime'
      ''
      ' --set @D_From='#39'22.04.2024'#39
      ' --set @D_To='#39'22.04.2024 23:59:59'#39
      ' --set @ID_USER=32'
      ' --set @IS_REGISTER_RRO=2'
      ''
      ' set @D_From=:D_From;'
      ' set @D_To=:D_To;'
      ' set @ID_USER=:ID_USER;'
      ' set @IS_REGISTER_RRO=:IS_REGISTER_RRO'
      ''
      
        ' -- 0 - '#1085#1077' '#1092#1080#1089#1082#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1089#1084#1077#1085#1077' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D_CREATE)  #t ->' +
        ' 0'
      ' -- 1 - '#1060#1080#1089#1082#1072#1083' '#1086#1087#1077#1088' '#1087#1086' '#1089#1084#1077#1085#1077' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D_CREATE)'#9'#t -> 1'
      ' -- 2 - '#1074#1089#1077#9#1087#1086' '#1089#1084#1077#1085#1077' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D_CREATE)'#9#9#9#9'#t -> 0,1'
      ' -- 3 - '#1085#1077' '#1092#1080#1089#1082#1072#1083' '#1079#1072' '#1087#1077#1088#1080#1086#1076' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D) #t -> 0'
      ' -- 4 - '#1092#1080#1089#1082#1072#1083' '#1079#1072' '#1087#1077#1088#1080#1086#1076' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D) #t -> 1'
      ' -- 5 - '#1074#1089#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084' D) #t -> 0,1'
      ''
      ''
      
        '-- set @D=cast(floor(cast(@D_To as float)) as datetime) -- '#1090#1077#1082#1091#1097 +
        #1072#1103' '#1076#1072#1090#1072' '#1073#1077#1079' '#1074#1088#1077#1084#1077#1085#1080
      ''
      'create table #t(i int)'
      ''
      'if @IS_REGISTER_RRO  in (0,3)'
      'begin'
      #9'insert into #t(i) select 0'
      'end;'
      ''
      'if @IS_REGISTER_RRO  in (1,4)'
      'begin'
      #9'insert into #t(i) select 1'
      'end;'
      ''
      'if @IS_REGISTER_RRO  in (2,5)'
      'begin'
      #9'insert into #t(i) select 0'
      #9'insert into #t(i) select 1'
      'end'
      ''
      
        'declare @S_REAL float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' '#1087#1088#1086#1076 +
        #1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072')'
      
        'declare @S_2KAT float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080 +
        #1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080
      'declare @S_SKIDKA_KOLBASA float,'
      
        '  @S_SKIDKA_MYASO float,  @S_SKIDKA_TNP float, @S_SKIDKA float; ' +
        '-- '#1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1086#1082
      'declare @S_VOZVR float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
      
        'declare @S_REAL_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100 +
        #1085#1086#1081' '#1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1082#1086#1083#1073#1072#1089#1072
      
        'declare @S_2KAT_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' ' +
        #1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1072
      'declare @SN_KOLBASA float;'
      'declare @S_VOZVR_KOLBASA float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      'declare @SN_VOZVR_KOLBASA float;'
      
        'declare @S_REAL_MYASO float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086 +
        #1081' '#1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1084#1103#1089#1086
      
        'declare @S_2KAT_MYASO float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072 +
        #1090#1077#1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1086
      'declare @SN_MYASO float;'
      'declare @S_VOZVR_MYASO float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1084#1103#1089#1086
      'declare @SN_VOZVR_MYASO float;'
      
        'declare @S_REAL_TNP float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1094#1077#1085#1077' '#1088#1077#1072#1083#1100#1085#1086#1081' ' +
        #1087#1088#1086#1076#1072#1078#1080' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1091#1094#1077#1085#1082#1072') '#1096#1090#1091#1095#1082#1072
      
        'declare @S_2KAT_TNP float; -- '#1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' 2 '#1094#1077#1085#1086#1074#1086#1081' '#1082#1072#1090#1077 +
        #1075#1086#1088#1080#1080' '#1077#1089#1083#1080' '#1073#1099' '#1085#1077' '#1073#1099#1083#1086' '#1091#1094#1077#1085#1082#1080' '#1096#1090#1091#1095#1082#1072
      'declare @SN_TNP float;'
      'declare @S_VOZVR_TNP float; -- '#1089#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1096#1090#1091#1095#1082#1072
      'declare @SN_VOZVR_TNP float;'
      'declare @ROUND_SUM float'
      'declare @SUM_OPL_CARD float'
      'declare @SUM_OPL_BONUS float'
      'declare @SUM_SDACHI_TO_CARD float'
      'declare @SUM_VOZVR_CARD float'
      'declare @SUM_UCEN float'
      'declare @SUM_UCEN_KOLBASA float'
      'declare @SUM_NAL float'
      'declare @SUM_VOZVR_NAL float'
      'declare @ZATRATY float'
      'declare @KASSA_INP float'
      'declare @KASSA_OUT float'
      'declare @SUM_UCEN_MYASO float'
      'declare @SUM_UCEN_TNP float'
      ''
      '-- '#1087#1088#1086#1076#1072#1078#1080' '#1080#1090#1086#1075#1086
      'Set @S_REAL=0.0;'
      'Set @S_2KAT=0.0;'
      'set @S_SKIDKA_KOLBASA=0.0;'
      'set @S_SKIDKA_MYASO=0.0;'
      'set @S_SKIDKA_TNP=0.0;'
      'set @S_SKIDKA=0.0;'
      ''
      '/*'
      'if @IS_REGISTER_RRO in (1)'
      'begin'
      #9'select @S_SKIDKA_KOLBASA= isnull(SUM([SKIDKA_KOLBASA]),0.0),'
      #9'@S_SKIDKA_MYASO= isnull(SUM([SKIDKA_MYASO]),0.0),'
      
        #9'@S_SKIDKA_TNP= isnull(SUM([SKIDKA_TNP]),0.0) from [dbo].[NAKLCA' +
        'P] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'set @S_SKIDKA=@S_SKIDKA_KOLBASA+@S_SKIDKA_MYASO+@S_SKIDKA_TNP'
      ''
      ''
      ''
      #9'select @S_REAL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      #9'@S_2KAT=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0)'
      #9'from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1080#1090#1086#1075#1086
      #9'Set @S_VOZVR=0.0;'
      
        #9'select @S_VOZVR=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0) from [dbo' +
        '].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_REAL_KOLBASA=0.0;'
      #9'Set @S_2KAT_KOLBASA=0.0;'
      #9'set @SN_KOLBASA=0.0;'
      
        #9'select @S_REAL_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @' +
        'S_2KAT_KOLBASA=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),  @SN_K' +
        'OLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_VOZVR_KOLBASA=0.0;'
      #9'SET @SN_VOZVR_KOLBASA=0.0;'
      #9'select @S_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKL' +
        'TOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1084#1103#1089#1072
      #9'Set @S_REAL_MYASO=0.0;'
      #9'Set @S_2KAT_MYASO=0.0;'
      #9'set @SN_MYASO=0.0;'
      
        #9'select @S_REAL_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_' +
        '2KAT_MYASO=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
      #9'Set @S_VOZVR_MYASO=0.0;'
      #9'Set @SN_VOZVR_MYASO=0.0;'
      ''
      #9'select @S_VOZVR_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV' +
        '] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1090#1085#1087
      #9'Set @S_REAL_TNP=0.0;'
      #9'Set @S_2KAT_TNP=0.0;'
      #9'set @SN_TNP=0.0;'
      
        #9'select @S_REAL_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_2K' +
        'AT_TNP=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088' '#1090#1085#1087
      #9'Set @S_VOZVR_TNP=0.0;'
      #9'Set @SN_VOZVR_TNP=0.0;'
      ''
      #9'select @S_VOZVR_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] ' +
        'NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103
      #9'set @ROUND_SUM=0.0'
      
        #9'select @ROUND_SUM= isnull(SUM([ROUND_SUM]),0.0) from [dbo].[NAK' +
        'LCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1076#1077#1085#1077#1075' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
      #9'set @SUM_OPL_CARD=0.0'
      
        #9'select @SUM_OPL_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [dbo' +
        '].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
      #9'set @SUM_OPL_BONUS=0.0'
      
        #9'select @SUM_OPL_BONUS= isnull(SUM([SUM_OPL_BONUS]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      #9'set @SUM_SDACHI_TO_CARD=0.0'
      
        #9'select @SUM_SDACHI_TO_CARD= isnull(SUM([SUM_SDACHI_TO_CARD]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_NAL=0.0'
      
        #9'select @SUM_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_SDAC' +
        'HI_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_VOZVR_NAL=0.0'
      
        #9'select @SUM_VOZVR_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1091#1102' '#1082#1072#1088#1090#1091
      #9'set @SUM_VOZVR_CARD=0.0'
      
        #9'select @SUM_VOZVR_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1074#1089#1077
      #9'set @SUM_UCEN=@S_2KAT-@S_REAL'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1099
      #9'set @SUM_UCEN_KOLBASA=@S_2KAT_KOLBASA-@S_REAL_KOLBASA'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1072
      ''
      #9'set @SUM_UCEN_MYASO=@S_2KAT_MYASO-@S_REAL_MYASO'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1090#1085#1087
      ''
      #9'set @SUM_UCEN_TNP=@S_2KAT_TNP-@S_REAL_TNP'
      ''
      ''
      #9'--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      #9'set @ZATRATY=0.0'
      
        #9'select @ZATRATY= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLCAP' +
        '] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=222 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'--'#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091' 289'
      #9'set @KASSA_INP=0.0'
      
        #9'select @KASSA_INP= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=289 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      ''
      #9'--'#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' 290'
      #9'set @KASSA_OUT=0.0'
      
        #9'select @KASSA_OUT= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To'
      #9'and cast(floor(cast(NC.D as float)) as datetime)=@D'
      
        #9'and NC.IS_DELETE=0 and NC.[ID_DOC_TYPE]=290 and NC.IS_REGISTER_' +
        'RRO in (select i from #t)'
      ''
      'end;'
      '*/'
      ''
      
        'if @IS_REGISTER_RRO in (3, 4, 5) -- '#1086#1090#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1087#1086' '#1088#1072#1073#1086#1095#1080#1084' '#1076 +
        #1072#1090#1072#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      'begin'
      #9'select @S_SKIDKA_KOLBASA= isnull(SUM([SKIDKA_KOLBASA]),0.0),'
      #9'@S_SKIDKA_MYASO= isnull(SUM([SKIDKA_MYASO]),0.0),'
      
        #9'@S_SKIDKA_TNP= isnull(SUM([SKIDKA_TNP]),0.0) from [dbo].[NAKLCA' +
        'P] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'set @S_SKIDKA=@S_SKIDKA_KOLBASA+@S_SKIDKA_MYASO+@S_SKIDKA_TNP'
      ''
      ''
      ''
      #9'select @S_REAL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      #9'@S_2KAT=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0)'
      #9'from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1080#1090#1086#1075#1086
      #9'Set @S_VOZVR=0.0;'
      
        #9'select @S_VOZVR=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0) from [dbo' +
        '].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_REAL_KOLBASA=0.0;'
      #9'Set @S_2KAT_KOLBASA=0.0;'
      #9'set @SN_KOLBASA=0.0;'
      
        #9'select @S_REAL_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @' +
        'S_2KAT_KOLBASA=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),  @SN_K' +
        'OLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_VOZVR_KOLBASA=0.0;'
      #9'SET @SN_VOZVR_KOLBASA=0.0;'
      #9'select @S_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKL' +
        'TOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1084#1103#1089#1072
      #9'Set @S_REAL_MYASO=0.0;'
      #9'Set @S_2KAT_MYASO=0.0;'
      #9'set @SN_MYASO=0.0;'
      
        #9'select @S_REAL_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_' +
        '2KAT_MYASO=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
      #9'Set @S_VOZVR_MYASO=0.0;'
      #9'Set @SN_VOZVR_MYASO=0.0;'
      ''
      #9'select @S_VOZVR_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV' +
        '] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1090#1085#1087
      #9'Set @S_REAL_TNP=0.0;'
      #9'Set @S_2KAT_TNP=0.0;'
      #9'set @SN_TNP=0.0;'
      
        #9'select @S_REAL_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_2K' +
        'AT_TNP=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088' '#1090#1085#1087
      #9'Set @S_VOZVR_TNP=0.0;'
      #9'Set @SN_VOZVR_TNP=0.0;'
      ''
      #9'select @S_VOZVR_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] ' +
        'NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103
      #9'set @ROUND_SUM=0.0'
      
        #9'select @ROUND_SUM= isnull(SUM([ROUND_SUM]),0.0) from [dbo].[NAK' +
        'LCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1076#1077#1085#1077#1075' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
      #9'set @SUM_OPL_CARD=0.0'
      
        #9'select @SUM_OPL_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [dbo' +
        '].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
      #9'set @SUM_OPL_BONUS=0.0'
      
        #9'select @SUM_OPL_BONUS= isnull(SUM([SUM_OPL_BONUS]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      #9'set @SUM_SDACHI_TO_CARD=0.0'
      
        #9'select @SUM_SDACHI_TO_CARD= isnull(SUM([SUM_SDACHI_TO_CARD]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_NAL=0.0'
      
        #9'select @SUM_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_SDAC' +
        'HI_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_VOZVR_NAL=0.0'
      
        #9'select @SUM_VOZVR_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1091#1102' '#1082#1072#1088#1090#1091
      #9'set @SUM_VOZVR_CARD=0.0'
      
        #9'select @SUM_VOZVR_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1074#1089#1077
      ''
      #9'set @SUM_UCEN=@S_2KAT-@S_REAL'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1099
      ''
      #9'set @SUM_UCEN_KOLBASA=@S_2KAT_KOLBASA-@S_REAL_KOLBASA'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1072
      ''
      #9'set @SUM_UCEN_MYASO=@S_2KAT_MYASO-@S_REAL_MYASO'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1090#1085#1087
      ''
      #9'set @SUM_UCEN_TNP=@S_2KAT_TNP-@S_REAL_TNP'
      ''
      ''
      #9'--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      #9'set @ZATRATY=0.0'
      
        #9'select @ZATRATY= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLCAP' +
        '] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=222 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'--'#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091' 289'
      #9'set @KASSA_INP=0.0'
      
        #9'select @KASSA_INP= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=289 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      ''
      #9'--'#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' 290'
      #9'set @KASSA_OUT=0.0'
      
        #9'select @KASSA_OUT= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D>=@D_From and NC.D<=@D_To and NC.IS_DELETE=0 and NC.[' +
        'ID_DOC_TYPE]=290 and NC.IS_REGISTER_RRO in (select i from #t)'
      ''
      
        'end; -- if @IS_REGISTER_RRO in (3,4,5) -- '#1086#1090#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1087#1086' '#1088#1072#1073 +
        #1086#1095#1080#1084' '#1076#1072#1090#1072#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ''
      
        'if @IS_REGISTER_RRO in (0,1,2) -- '#1086#1090#1095#1077#1090#1099' '#1087#1086' '#1076#1072#1090#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1076#1086#1082#1091#1084#1077 +
        #1085#1090#1086#1074
      'begin'
      #9'select @S_SKIDKA_KOLBASA= isnull(SUM([SKIDKA_KOLBASA]),0.0),'
      #9'@S_SKIDKA_MYASO= isnull(SUM([SKIDKA_MYASO]),0.0),'
      
        #9'@S_SKIDKA_TNP= isnull(SUM([SKIDKA_TNP]),0.0) from [dbo].[NAKLCA' +
        'P] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'set @S_SKIDKA=@S_SKIDKA_KOLBASA+@S_SKIDKA_MYASO+@S_SKIDKA_TNP'
      ''
      ''
      ''
      #9'select @S_REAL=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      #9'@S_2KAT=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0)'
      #9'from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1080#1090#1086#1075#1086
      #9'Set @S_VOZVR=0.0;'
      
        #9'select @S_VOZVR=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0) from [dbo' +
        '].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_REAL_KOLBASA=0.0;'
      #9'Set @S_2KAT_KOLBASA=0.0;'
      #9'set @SN_KOLBASA=0.0;'
      
        #9'select @S_REAL_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @' +
        'S_2KAT_KOLBASA=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),  @SN_K' +
        'OLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1082#1086#1083#1073#1072#1089#1099
      #9'Set @S_VOZVR_KOLBASA=0.0;'
      #9'SET @SN_VOZVR_KOLBASA=0.0;'
      #9'select @S_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_KOLBASA=isnull(SUM(NT.[NUMB]),0.0)   from [dbo].[NAKL' +
        'TOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (1)'
      #9#9#9#9#9')'
      ''
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1084#1103#1089#1072
      #9'Set @S_REAL_MYASO=0.0;'
      #9'Set @S_2KAT_MYASO=0.0;'
      #9'set @SN_MYASO=0.0;'
      
        #9'select @S_REAL_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_' +
        '2KAT_MYASO=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1084#1103#1089#1072
      #9'Set @S_VOZVR_MYASO=0.0;'
      #9'Set @SN_VOZVR_MYASO=0.0;'
      ''
      #9'select @S_VOZVR_MYASO=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_MYASO=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV' +
        '] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (2)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1087#1088#1086#1076#1072#1078#1080' '#1090#1085#1087
      #9'Set @S_REAL_TNP=0.0;'
      #9'Set @S_2KAT_TNP=0.0;'
      #9'set @SN_TNP=0.0;'
      
        #9'select @S_REAL_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0), @S_2K' +
        'AT_TNP=isnull(SUM(NT.[NUMB]*PR.[PRICE_UCH]),0.0),'
      #9'@SN_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088' '#1090#1085#1087
      #9'Set @S_VOZVR_TNP=0.0;'
      #9'Set @SN_VOZVR_TNP=0.0;'
      ''
      #9'select @S_VOZVR_TNP=isnull(SUM(NT.[NUMB]*NT.[PRICE]),0.0),'
      
        #9'@SN_VOZVR_TNP=isnull(SUM(NT.[NUMB]),0.0)  from [dbo].[NAKLTOV] ' +
        'NT'
      
        #9'inner join [dbo].[NAKLCAP] NC on NC.[ID_NAKLCAP]=NT.[ID_NAKLCAP' +
        ']'
      #9'inner join [dbo].[PRICE] PR on PR.[ID_TOV]=NT.ID_TOV'
      #9'inner join [dbo].[TOV] T on T.ID_TOV=NT.ID_TOV'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      #9'and PR.ID_USERS=@ID_USER'
      #9'and T.ID_GRTOV in ('
      
        #9#9#9#9#9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG' +
        ' where KOG.[ID_VID_OPERATION] in (3,4,5,6)'
      #9#9#9#9#9')'
      ''
      ''
      #9'-- '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103
      #9'set @ROUND_SUM=0.0'
      
        #9'select @ROUND_SUM= isnull(SUM([ROUND_SUM]),0.0) from [dbo].[NAK' +
        'LCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1076#1077#1085#1077#1075' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1082#1072#1088#1090#1086#1081
      #9'set @SUM_OPL_CARD=0.0'
      
        #9'select @SUM_OPL_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [dbo' +
        '].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1073#1086#1085#1091#1089#1072#1084#1080
      #9'set @SUM_OPL_BONUS=0.0'
      
        #9'select @SUM_OPL_BONUS= isnull(SUM([SUM_OPL_BONUS]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'-- '#1089#1076#1072#1095#1072' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1072#1103' '#1085#1072' '#1082#1072#1088#1090#1091
      #9'set @SUM_SDACHI_TO_CARD=0.0'
      
        #9'select @SUM_SDACHI_TO_CARD= isnull(SUM([SUM_SDACHI_TO_CARD]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'-- '#1087#1086#1083#1091#1095#1077#1085#1086' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_NAL=0.0'
      
        #9'select @SUM_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]-[SUM_SDAC' +
        'HI_TO_CARD]),0.0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=200 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1086#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1082#1086#1081
      #9'set @SUM_VOZVR_NAL=0.0'
      
        #9'select @SUM_VOZVR_NAL= isnull(SUM([SUM_POLUCH]-[SUM_SDACHI]),0.' +
        '0) from [dbo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1091#1102' '#1082#1072#1088#1090#1091
      #9'set @SUM_VOZVR_CARD=0.0'
      
        #9'select @SUM_VOZVR_CARD= isnull(SUM([SUM_OPL_CARD]),0.0) from [d' +
        'bo].[NAKLCAP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=204 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1074#1089#1077
      ''
      #9'set @SUM_UCEN=@S_2KAT-@S_REAL'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1082#1086#1083#1073#1072#1089#1099
      ''
      #9'set @SUM_UCEN_KOLBASA=@S_2KAT_KOLBASA-@S_REAL_KOLBASA'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1084#1103#1089#1072
      ''
      #9'set @SUM_UCEN_MYASO=@S_2KAT_MYASO-@S_REAL_MYASO'
      ''
      #9'-- '#1091#1094#1077#1085#1082#1080' '#1090#1085#1087
      ''
      #9'set @SUM_UCEN_TNP=@S_2KAT_TNP-@S_REAL_TNP'
      ''
      ''
      #9'--'#1072'002 POS '#1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099' '#1058#1057' '#1085#1072' '#1079#1072#1090#1088#1072#1090#1099
      #9'set @ZATRATY=0.0'
      
        #9'select @ZATRATY= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLCAP' +
        '] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=222 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'--'#1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1074' '#1082#1072#1089#1089#1091' 289'
      #9'set @KASSA_INP=0.0'
      
        #9'select @KASSA_INP= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=289 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      ''
      #9'--'#1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' 290'
      #9'set @KASSA_OUT=0.0'
      
        #9'select @KASSA_OUT= isnull(SUM([TOT_SUM]),0.0) from [dbo].[NAKLC' +
        'AP] NC'
      
        #9'where NC.D_CREATE>=@D_From and NC.D_CREATE<=@D_To and NC.IS_DEL' +
        'ETE=0 and NC.[ID_DOC_TYPE]=290 and NC.IS_REGISTER_RRO in (select' +
        ' i from #t)'
      ''
      'end; --  else if @IS_REGISTER_RRO=3'
      ''
      'drop table #t'
      ''
      ''
      
        'select @S_REAL as S_REAL, @S_2KAT as S_2KAT, @S_REAL_KOLBASA as ' +
        'S_REAL_KOLBASA, @S_2KAT_KOLBASA as S_2KAT_KOLBASA,'
      '@S_REAL_MYASO as S_REAL_MYASO, @S_2KAT_MYASO as S_2KAT_MYASO,'
      '@S_REAL_TNP as S_REAL_TNP, @S_2KAT_TNP as S_2KAT_TNP,'
      
        '@SUM_UCEN as SUM_UCEN, @SUM_UCEN_KOLBASA as SUM_UCEN_KOLBASA, @S' +
        'UM_UCEN_MYASO as SUM_UCEN_MYASO, @SUM_UCEN_TNP as SUM_UCEN_TNP,'
      
        '@SUM_OPL_CARD as SUM_OPL_CARD, @SUM_OPL_BONUS as SUM_OPL_BONUS, ' +
        '@SUM_NAL as SUM_NAL, @SN_KOLBASA as SN_KOLBASA, @SN_MYASO as SN_' +
        'MYASO,'
      '@SN_TNP as SN_TNP,'
      '@S_VOZVR as S_VOZVR,'
      '@S_VOZVR_KOLBASA as  S_VOZVR_KOLBASA,'
      '@SN_VOZVR_KOLBASA as SN_VOZVR_KOLBASA,'
      '@S_VOZVR_MYASO as  S_VOZVR_MYASO,'
      '@SN_VOZVR_MYASO as  SN_VOZVR_MYASO,'
      '@S_VOZVR_TNP  as  S_VOZVR_TNP,'
      '@SN_VOZVR_TNP as SN_VOZVR_TNP,'
      '@SUM_VOZVR_NAL as SUM_VOZVR_NAL,'
      ''
      '@S_SKIDKA_KOLBASA as SKIDKA_KOLBASA,'
      '@S_SKIDKA_MYASO as SKIDKA_MYASO,'
      '@S_SKIDKA_TNP as SKIDKA_TNP,'
      '@S_SKIDKA as SKIDKA,'
      '@ZATRATY as ZATRATY,'
      '@SUM_VOZVR_CARD as SUM_VOZVR_CARD,'
      '@ROUND_SUM as ROUND_SUM,'
      '@SUM_SDACHI_TO_CARD as SUM_SDACHI_TO_CARD,'
      '@S_REAL-@S_SKIDKA+@ROUND_SUM as SUM_REAL_TO_PAY,'
      '@KASSA_INP as KASSA_INP,'
      '@KASSA_OUT as KASSA_OUT,'
      
        '@SUM_NAL-@SUM_VOZVR_NAL+@SUM_SDACHI_TO_CARD-@ZATRATY+@KASSA_INP-' +
        '@KASSA_OUT as SUM_KAS'
      ''
      '')
    Left = 119
    Top = 474
    object QKassaReport_RROS_REAL: TFloatField
      FieldName = 'S_REAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_2KAT: TFloatField
      FieldName = 'S_2KAT'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_REAL_KOLBASA: TFloatField
      FieldName = 'S_REAL_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_2KAT_KOLBASA: TFloatField
      FieldName = 'S_2KAT_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_REAL_MYASO: TFloatField
      FieldName = 'S_REAL_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_2KAT_MYASO: TFloatField
      FieldName = 'S_2KAT_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_REAL_TNP: TFloatField
      FieldName = 'S_REAL_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_2KAT_TNP: TFloatField
      FieldName = 'S_2KAT_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_UCEN: TFloatField
      FieldName = 'SUM_UCEN'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_UCEN_KOLBASA: TFloatField
      FieldName = 'SUM_UCEN_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_UCEN_MYASO: TFloatField
      FieldName = 'SUM_UCEN_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_UCEN_TNP: TFloatField
      FieldName = 'SUM_UCEN_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_OPL_CARD: TFloatField
      FieldName = 'SUM_OPL_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_OPL_BONUS: TFloatField
      FieldName = 'SUM_OPL_BONUS'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_KOLBASA: TFloatField
      FieldName = 'SN_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_MYASO: TFloatField
      FieldName = 'SN_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_TNP: TFloatField
      FieldName = 'SN_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_VOZVR: TFloatField
      FieldName = 'S_VOZVR'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_VOZVR_KOLBASA: TFloatField
      FieldName = 'S_VOZVR_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_VOZVR_KOLBASA: TFloatField
      FieldName = 'SN_VOZVR_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_VOZVR_MYASO: TFloatField
      FieldName = 'S_VOZVR_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_VOZVR_MYASO: TFloatField
      FieldName = 'SN_VOZVR_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROS_VOZVR_TNP: TFloatField
      FieldName = 'S_VOZVR_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSN_VOZVR_TNP: TFloatField
      FieldName = 'SN_VOZVR_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_VOZVR_NAL: TFloatField
      FieldName = 'SUM_VOZVR_NAL'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSKIDKA_KOLBASA: TFloatField
      FieldName = 'SKIDKA_KOLBASA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSKIDKA_MYASO: TFloatField
      FieldName = 'SKIDKA_MYASO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSKIDKA_TNP: TFloatField
      FieldName = 'SKIDKA_TNP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSKIDKA: TFloatField
      FieldName = 'SKIDKA'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROZATRATY: TFloatField
      FieldName = 'ZATRATY'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_VOZVR_CARD: TFloatField
      FieldName = 'SUM_VOZVR_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROROUND_SUM: TFloatField
      FieldName = 'ROUND_SUM'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_SDACHI_TO_CARD: TFloatField
      FieldName = 'SUM_SDACHI_TO_CARD'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_REAL_TO_PAY: TFloatField
      FieldName = 'SUM_REAL_TO_PAY'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROKASSA_INP: TFloatField
      FieldName = 'KASSA_INP'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROKASSA_OUT: TFloatField
      FieldName = 'KASSA_OUT'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object QKassaReport_RROSUM_KAS: TFloatField
      FieldName = 'SUM_KAS'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object DSQKassaReport_RRO: TDataSource
    DataSet = QKassaReport_RRO
    Left = 168
    Top = 476
  end
  object SP_SET_RRO_DATA_TO_NAKLCAP: TADOStoredProc
    Connection = ADOConnection1
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
    Left = 763
    Top = 353
  end
  object ADOCommand_Delete_PredBarcodes: TADOCommand
    CommandText = 'delete [dbo].[BARCODES_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 672
    Top = 568
  end
  object ADOCommandInsert_BARCODES: TADOCommand
    CommandText = 
      'insert into [BARCODES] ('#13#10#9#9'[ID_BARCODE]'#13#10'      ,[ID_TOV]'#13#10'     ' +
      ' ,[BARCODE]'#13#10'      ,[SYMBOLS_WEIGHT_OF_BARCODE]'#13#10'      ,[WEIGHT_' +
      'MULTIPLIER])'#13#10' values (:ID_BARCODE'#13#10'      ,:ID_TOV'#13#10'      ,:BARC' +
      'ODE'#13#10'      ,:SYMBOLS_WEIGHT_OF_BARCODE'#13#10'      ,:WEIGHT_MULTIPLIE' +
      'R)'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_BARCODE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_TOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'BARCODE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'SYMBOLS_WEIGHT_OF_BARCODE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'WEIGHT_MULTIPLIER'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Left = 712
    Top = 568
  end
  object ADOCommandSavePredUsers: TADOCommand
    CommandText = 
      'delete [USERS_TMP]'#13#10'insert into [USERS_TMP] ('#13#10#9#9'[ID_USERS]'#13#10'   ' +
      '   ,[NAME]'#13#10'      ,[LOGIN]'#13#10'      ,[STATUS]'#13#10'      ,[BIRTHDAY]'#13#10 +
      '      ,[PASSW]'#13#10'      ,[IS_DELETE])'#13#10'select [ID_USERS]'#13#10'      ,[' +
      'NAME]'#13#10'      ,[LOGIN]'#13#10'      ,[STATUS]'#13#10'      ,[BIRTHDAY]'#13#10'     ' +
      ' ,[PASSW]'#13#10'      ,[IS_DELETE] from [USERS]'#13#10#13#10'delete [USERS] whe' +
      're [ID_USERS]<>:ID_USER_SELECT'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_USER_SELECT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 408
    Top = 520
  end
  object ADOCommandRestorePredUsers: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'delete [USERS]'#13#10'insert into [USERS] ('#13#10#9#9'[ID_USERS' +
      ']'#13#10'      ,[NAME]'#13#10'      ,[LOGIN]'#13#10'      ,[STATUS]'#13#10'      ,[BIRTH' +
      'DAY]'#13#10'      ,[PASSW]'#13#10'      ,[IS_DELETE])'#13#10'select [ID_USERS]'#13#10'  ' +
      '    ,[NAME]'#13#10'      ,[LOGIN]'#13#10'      ,[STATUS]'#13#10'      ,[BIRTHDAY]'#13 +
      #10'      ,[PASSW]'#13#10'      ,[IS_DELETE] from [USERS_TMP]'#13#10#13#10'delete [' +
      'USERS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 440
    Top = 520
  end
  object ADOCommandSavePredKateg_Cli: TADOCommand
    CommandText = 
      'delete [KATEG_CLI_TMP]'#13#10'insert into [KATEG_CLI_TMP] ( [ID_KATEGO' +
      'R]'#13#10'      ,[KATEGOR]'#13#10'      ,[IS_DELETE]'#13#10#9#9')'#13#10'select [ID_KATEGO' +
      'R]'#13#10'      ,[KATEGOR]'#13#10'      ,[IS_DELETE] from [KATEG_CLI]'#13#10#13#10'del' +
      'ete [KATEG_CLI]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 512
    Top = 392
  end
  object ADOCommandRestorePredKateg_Cli: TADOCommand
    CommandText = 
      'delete [KATEG_CLI]'#13#10'insert into [KATEG_CLI] ('#13#10#9#9'[ID_KATEGOR]'#13#10' ' +
      '     ,[KATEGOR]'#13#10'      ,[IS_DELETE])'#13#10'select [ID_KATEGOR]'#13#10'     ' +
      ' ,[KATEGOR]'#13#10'      ,[IS_DELETE] from [KATEG_CLI_TMP]'#13#10#13#10'delete [' +
      'KATEG_CLI_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 632
    Top = 392
  end
  object ADOCommandRestorePredCli: TADOCommand
    CommandText = 
      'delete [CLIENTS]'#13#10'insert into [CLIENTS] ('#13#10#9#9'[ID_CLIENTS]'#13#10'     ' +
      ' ,[CLIENT]'#13#10'      ,[RS]'#13#10'      ,[MFO]'#13#10'      ,[OKPO]'#13#10'      ,[IN' +
      'N]'#13#10'      ,[RNN]'#13#10'      ,[TEL]'#13#10'      ,[DIRECTOR]'#13#10'      ,[BUHGA' +
      'LTER]'#13#10'      ,[ADRES]'#13#10'      ,[BANK]'#13#10'      ,[ID_KATEGOR]'#13#10'     ' +
      ' ,[AUX_INFO]'#13#10'      ,[PER_MINUS]'#13#10'      ,[PRICE_TIME]'#13#10'      ,[D' +
      'OGOVOR]'#13#10'      ,[N_DOGOVOR]'#13#10'      ,[D_DOGOVOR]'#13#10'      ,[ID_PARE' +
      'NT]'#13#10'      ,[SALES_CATEGOR]'#13#10'      ,[IS_DELETE]'#13#10'      ,[N_NAKL_' +
      'DOLG]'#13#10'      ,[D_OTSROCHKI_DOLGA]'#13#10'      ,[IS_CONTROL_DOLG]'#13#10'   ' +
      '   ,[EMAIL]'#13#10'      ,[BIRTHDAY])'#13#10'select [ID_CLIENTS]'#13#10'      ,[CL' +
      'IENT]'#13#10'      ,[RS]'#13#10'      ,[MFO]'#13#10'      ,[OKPO]'#13#10'      ,[INN]'#13#10' ' +
      '     ,[RNN]'#13#10'      ,[TEL]'#13#10'      ,[DIRECTOR]'#13#10'      ,[BUHGALTER]' +
      #13#10'      ,[ADRES]'#13#10'      ,[BANK]'#13#10'      ,[ID_KATEGOR]'#13#10'      ,[AU' +
      'X_INFO]'#13#10'      ,[PER_MINUS]'#13#10'      ,[PRICE_TIME]'#13#10'      ,[DOGOVO' +
      'R]'#13#10'      ,[N_DOGOVOR]'#13#10'      ,[D_DOGOVOR]'#13#10'      ,[ID_PARENT]'#13#10 +
      '      ,[SALES_CATEGOR]'#13#10'      ,[IS_DELETE]'#13#10'      ,[N_NAKL_DOLG]' +
      #13#10'      ,[D_OTSROCHKI_DOLGA]'#13#10'      ,[IS_CONTROL_DOLG]'#13#10'      ,[' +
      'EMAIL]'#13#10'      ,[BIRTHDAY] from [CLIENTS_TMP]'#13#10#13#10'delete [CLIENTS_' +
      'TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 776
    Top = 392
  end
  object ADOCommandSavePredCli: TADOCommand
    CommandText = 
      'delete [CLIENTS_TMP]'#13#10'insert into [CLIENTS_TMP] ( [ID_CLIENTS]'#13#10 +
      '      ,[CLIENT]'#13#10'      ,[RS]'#13#10'      ,[MFO]'#13#10'      ,[OKPO]'#13#10'     ' +
      ' ,[INN]'#13#10'      ,[RNN]'#13#10'      ,[TEL]'#13#10'      ,[DIRECTOR]'#13#10'      ,[' +
      'BUHGALTER]'#13#10'      ,[ADRES]'#13#10'      ,[BANK]'#13#10'      ,[ID_KATEGOR]'#13#10 +
      '      ,[AUX_INFO]'#13#10'      ,[PER_MINUS]'#13#10'      ,[PRICE_TIME]'#13#10'    ' +
      '  ,[DOGOVOR]'#13#10'      ,[N_DOGOVOR]'#13#10'      ,[D_DOGOVOR]'#13#10'      ,[ID' +
      '_PARENT]'#13#10'      ,[SALES_CATEGOR]'#13#10'      ,[IS_DELETE]'#13#10'      ,[N_' +
      'NAKL_DOLG]'#13#10'      ,[D_OTSROCHKI_DOLGA]'#13#10'      ,[IS_CONTROL_DOLG]' +
      #13#10'      ,[EMAIL]'#13#10'      ,[BIRTHDAY]'#13#10#9#9')'#13#10'select [ID_CLIENTS]'#13#10' ' +
      '     ,[CLIENT]'#13#10'      ,[RS]'#13#10'      ,[MFO]'#13#10'      ,[OKPO]'#13#10'      ' +
      ',[INN]'#13#10'      ,[RNN]'#13#10'      ,[TEL]'#13#10'      ,[DIRECTOR]'#13#10'      ,[B' +
      'UHGALTER]'#13#10'      ,[ADRES]'#13#10'      ,[BANK]'#13#10'      ,[ID_KATEGOR]'#13#10' ' +
      '     ,[AUX_INFO]'#13#10'      ,[PER_MINUS]'#13#10'      ,[PRICE_TIME]'#13#10'     ' +
      ' ,[DOGOVOR]'#13#10'      ,[N_DOGOVOR]'#13#10'      ,[D_DOGOVOR]'#13#10'      ,[ID_' +
      'PARENT]'#13#10'      ,[SALES_CATEGOR]'#13#10'      ,[IS_DELETE]'#13#10'      ,[N_N' +
      'AKL_DOLG]'#13#10'      ,[D_OTSROCHKI_DOLGA]'#13#10'      ,[IS_CONTROL_DOLG]'#13 +
      #10'      ,[EMAIL]'#13#10'      ,[BIRTHDAY] from [CLIENTS]'#13#10#13#10'delete [CLI' +
      'ENTS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 680
    Top = 392
  end
  object ADOCommandSavePredBonuses: TADOCommand
    CommandText = 
      'delete [BONUSES_TMP]'#13#10'insert into [BONUSES_TMP] ( [ID_BONUS]'#13#10'  ' +
      '    ,[ID_CLI]'#13#10'      ,[SUM_BALL]'#13#10#9#9')'#13#10'select [ID_BONUS]'#13#10'      ' +
      ',[ID_CLI]'#13#10'      ,[SUM_BALL] from [BONUSES]'#13#10#13#10'delete [BONUSES]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 504
    Top = 448
  end
  object ADOCommandRestorePredBonuses: TADOCommand
    CommandText = 
      'delete [BONUSES]'#13#10'insert into [BONUSES] ([ID_BONUS]'#13#10'      ,[ID_' +
      'CLI]'#13#10'      ,[SUM_BALL]'#13#10#9#9')'#13#10'select [ID_BONUS]'#13#10'      ,[ID_CLI]' +
      #13#10'      ,[SUM_BALL] from [BONUSES_TMP]'#13#10#13#10'delete [BONUSES_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 624
    Top = 448
  end
  object ADOCommandSavePredGrTov: TADOCommand
    CommandText = 
      'delete [GRTOV_TMP]'#13#10'insert into [GRTOV_TMP] ( [ID_GRTOV]'#13#10'      ' +
      ',[GRUPTOV]'#13#10'      ,[SEQUENTIAL]'#13#10'      ,[IS_DELETE]'#13#10#9#9')'#13#10'select' +
      ' [ID_GRTOV]'#13#10'      ,[GRUPTOV]'#13#10'      ,[SEQUENTIAL]'#13#10'      ,[IS_D' +
      'ELETE] from [GRTOV]'#13#10#13#10'delete [GRTOV]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 512
    Top = 496
  end
  object ADOCommandRestorePredGrTov: TADOCommand
    CommandText = 
      'delete [GRTOV]'#13#10'insert into [GRTOV] ([ID_GRTOV]'#13#10'      ,[GRUPTOV' +
      ']'#13#10'      ,[SEQUENTIAL]'#13#10'      ,[IS_DELETE]'#13#10#9#9')'#13#10'select [ID_GRTO' +
      'V]'#13#10'      ,[GRUPTOV]'#13#10'      ,[SEQUENTIAL]'#13#10'      ,[IS_DELETE] fr' +
      'om [GRTOV_TMP]'#13#10#13#10'delete [GRTOV_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 608
    Top = 496
  end
  object ADOCommandSavePredTov: TADOCommand
    CommandText = 
      'delete [TOV_TMP]'#13#10'insert into [TOV_TMP] ( [ID_TOV]'#13#10'      ,[NAME' +
      ']'#13#10'      ,[EDIZM]'#13#10'      ,[GOST]'#13#10'      ,[SROKREAL]'#13#10'      ,[COD' +
      'E]'#13#10'      ,[ID_GRTOV]'#13#10'      ,[ID_VID]'#13#10'      ,[FLAG_SOCIAL]'#13#10'  ' +
      '    ,[MAX_PRICE]'#13#10'      ,[IS_USE]'#13#10'      ,[COMPARE_PRICE]'#13#10'     ' +
      ' ,[PART]'#13#10'      ,[AVAILABILITY]'#13#10'      ,[NOVELTY]'#13#10'      ,[RECOM' +
      'MENDED]'#13#10'      ,[ID_KATEGOR_CLI]'#13#10'      ,[BASETOV]'#13#10'      ,[IS_D' +
      'ELETE]'#13#10'      ,[UKTZED]'#13#10'      ,[IS_FISCAL]'#13#10'      ,[IS_EXCISE]'#13 +
      #10#9#9')'#13#10'select [ID_TOV]'#13#10'      ,[NAME]'#13#10'      ,[EDIZM]'#13#10'      ,[GO' +
      'ST]'#13#10'      ,[SROKREAL]'#13#10'      ,[CODE]'#13#10'      ,[ID_GRTOV]'#13#10'      ' +
      ',[ID_VID]'#13#10'      ,[FLAG_SOCIAL]'#13#10'      ,[MAX_PRICE]'#13#10'      ,[IS_' +
      'USE]'#13#10'      ,[COMPARE_PRICE]'#13#10'      ,[PART]'#13#10'      ,[AVAILABILIT' +
      'Y]'#13#10'      ,[NOVELTY]'#13#10'      ,[RECOMMENDED]'#13#10'      ,[ID_KATEGOR_C' +
      'LI]'#13#10'      ,[BASETOV]'#13#10'      ,[IS_DELETE]'#13#10'      ,[UKTZED]'#13#10'    ' +
      '  ,[IS_FISCAL]'#13#10'      ,[IS_EXCISE] from [TOV]'#13#10#13#10'delete [TOV]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 488
    Top = 568
  end
  object ADOCommandRestorePredTov: TADOCommand
    CommandText = 
      'delete [TOV]'#13#10'insert into [TOV] ([ID_TOV]'#13#10'      ,[NAME]'#13#10'      ' +
      ',[EDIZM]'#13#10'      ,[GOST]'#13#10'      ,[SROKREAL]'#13#10'      ,[CODE]'#13#10'     ' +
      ' ,[ID_GRTOV]'#13#10'      ,[ID_VID]'#13#10'      ,[FLAG_SOCIAL]'#13#10'      ,[MAX' +
      '_PRICE]'#13#10'      ,[IS_USE]'#13#10'      ,[COMPARE_PRICE]'#13#10'      ,[PART]'#13 +
      #10'      ,[AVAILABILITY]'#13#10'      ,[NOVELTY]'#13#10'      ,[RECOMMENDED]'#13#10 +
      '      ,[ID_KATEGOR_CLI]'#13#10'      ,[BASETOV]'#13#10'      ,[IS_DELETE]'#13#10' ' +
      '     ,[UKTZED]'#13#10'      ,[IS_FISCAL]'#13#10'      ,[IS_EXCISE] '#13#10#9#9')'#13#10'se' +
      'lect [ID_TOV]'#13#10'      ,[NAME]'#13#10'      ,[EDIZM]'#13#10'      ,[GOST]'#13#10'   ' +
      '   ,[SROKREAL]'#13#10'      ,[CODE]'#13#10'      ,[ID_GRTOV]'#13#10'      ,[ID_VID' +
      ']'#13#10'      ,[FLAG_SOCIAL]'#13#10'      ,[MAX_PRICE]'#13#10'      ,[IS_USE]'#13#10'  ' +
      '    ,[COMPARE_PRICE]'#13#10'      ,[PART]'#13#10'      ,[AVAILABILITY]'#13#10'    ' +
      '  ,[NOVELTY]'#13#10'      ,[RECOMMENDED]'#13#10'      ,[ID_KATEGOR_CLI]'#13#10'   ' +
      '   ,[BASETOV]'#13#10'      ,[IS_DELETE]'#13#10'      ,[UKTZED]'#13#10'      ,[IS_F' +
      'ISCAL]'#13#10'      ,[IS_EXCISE]  from [TOV_TMP]'#13#10#13#10'delete [TOV_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 592
    Top = 568
  end
  object ADOCommandSavePredBarcodes: TADOCommand
    CommandText = 
      'delete [BARCODES_TMP]'#13#10'insert into [BARCODES_TMP] ( [ID_BARCODE]' +
      #13#10'      ,[ID_TOV]'#13#10'      ,[BARCODE]'#13#10'      ,[SYMBOLS_WEIGHT_OF_B' +
      'ARCODE]'#13#10'      ,[WEIGHT_MULTIPLIER]'#13#10#9#9')'#13#10'select [ID_BARCODE]'#13#10' ' +
      '     ,[ID_TOV]'#13#10'      ,[BARCODE]'#13#10'      ,[SYMBOLS_WEIGHT_OF_BARC' +
      'ODE]'#13#10'      ,[WEIGHT_MULTIPLIER] from [BARCODES]'#13#10#13#10'delete [BARC' +
      'ODES]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 632
    Top = 568
  end
  object ADOCommandRestorePredBarcodes: TADOCommand
    CommandText = 
      'delete [BARCODES]'#13#10'insert into [BARCODES] ([ID_BARCODE]'#13#10'      ,' +
      '[ID_TOV]'#13#10'      ,[BARCODE]'#13#10'      ,[SYMBOLS_WEIGHT_OF_BARCODE]'#13#10 +
      '      ,[WEIGHT_MULTIPLIER]'#13#10#9#9')'#13#10'select [ID_BARCODE]'#13#10'      ,[ID' +
      '_TOV]'#13#10'      ,[BARCODE]'#13#10'      ,[SYMBOLS_WEIGHT_OF_BARCODE]'#13#10'   ' +
      '   ,[WEIGHT_MULTIPLIER] from [BARCODES_TMP]'#13#10#13#10'delete [BARCODES_' +
      'TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 752
    Top = 568
  end
  object ADOCommandSavePredPrice: TADOCommand
    CommandText = 
      'delete [PRICE_TMP]'#13#10'insert into [PRICE_TMP] ( [ID_TOV]'#13#10'      ,[' +
      'ID_USERS]'#13#10'      ,[ID_VENDOR]'#13#10'      ,[NUMB]'#13#10'      ,[PRICE_TMP]' +
      #13#10'      ,[OSTAT]'#13#10'      ,[PRICE_UCH]'#13#10'      ,[COMMENT]'#13#10'      ,[' +
      'PRICE_VENDOR]'#13#10'      ,[IS_EXISTS_OSTATOK]'#13#10'      ,[NUMB_PROTOTYP' +
      'E]'#13#10'      ,[IS_ACTION]'#13#10#9#9')'#13#10'select [ID_TOV]'#13#10'      ,[ID_USERS]'#13 +
      #10'      ,[ID_VENDOR]'#13#10'      ,[NUMB]'#13#10'      ,[PRICE_TMP]'#13#10'      ,[' +
      'OSTAT]'#13#10'      ,[PRICE_UCH]'#13#10'      ,[COMMENT]'#13#10'      ,[PRICE_VEND' +
      'OR]'#13#10'      ,[IS_EXISTS_OSTATOK]'#13#10'      ,[NUMB_PROTOTYPE]'#13#10'      ' +
      ',[IS_ACTION] from [PRICE]'#13#10#13#10'delete [PRICE]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 272
    Top = 600
  end
  object ADOCommandRestorePredPrice: TADOCommand
    CommandText = 
      'delete [PRICE]'#13#10'insert into [PRICE] ([ID_TOV]'#13#10'      ,[ID_USERS]' +
      #13#10'      ,[ID_VENDOR]'#13#10'      ,[NUMB]'#13#10'      ,[PRICE_TMP]'#13#10'      ,' +
      '[OSTAT]'#13#10'      ,[PRICE_UCH]'#13#10'      ,[COMMENT]'#13#10'      ,[PRICE_VEN' +
      'DOR]'#13#10'      ,[IS_EXISTS_OSTATOK]'#13#10'      ,[NUMB_PROTOTYPE]'#13#10'     ' +
      ' ,[IS_ACTION]'#13#10#9#9')'#13#10'select [ID_TOV]'#13#10'      ,[ID_USERS]'#13#10'      ,[' +
      'ID_VENDOR]'#13#10'      ,[NUMB]'#13#10'      ,[PRICE_TMP]'#13#10'      ,[OSTAT]'#13#10' ' +
      '     ,[PRICE_UCH]'#13#10'      ,[COMMENT]'#13#10'      ,[PRICE_VENDOR]'#13#10'    ' +
      '  ,[IS_EXISTS_OSTATOK]'#13#10'      ,[NUMB_PROTOTYPE]'#13#10'      ,[IS_ACTI' +
      'ON]  from [PRICE_TMP]'#13#10#13#10'delete [PRICE_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 368
    Top = 600
  end
  object ADOCommandSavePredNewPriceTov: TADOCommand
    CommandText = 
      'delete [NEW_PRICE_POS_TMP]'#13#10'insert into [NEW_PRICE_POS_TMP] ( [I' +
      'D_TOV]'#13#10'      ,[PRICE2]'#13#10#9#9')'#13#10'select [ID_TOV]'#13#10'      ,[PRICE2] f' +
      'rom [NEW_PRICE_POS]'#13#10#13#10'delete [NEW_PRICE_POS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 208
    Top = 568
  end
  object ADOCommandRestorePredNewPriceTov: TADOCommand
    CommandText = 
      'delete [NEW_PRICE_POS]'#13#10'insert into [NEW_PRICE_POS] ([ID_TOV]'#13#10' ' +
      '     ,[PRICE2]'#13#10#9#9')'#13#10'select [ID_TOV]'#13#10'      ,[PRICE2]  from [NEW' +
      '_PRICE_POS_TMP]'#13#10#13#10'delete [NEW_PRICE_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 304
    Top = 568
  end
  object ADOCommandSavePredAdvertMsg: TADOCommand
    CommandText = 
      'delete [ADVERT_MSG_TMP]'#13#10'insert into [ADVERT_MSG_TMP] ( [ID_ADVE' +
      'RT]'#13#10'      ,[TYPE_MSG]'#13#10'      ,[ID_CLI]'#13#10'      ,[MSG]'#13#10#9#9')'#13#10'sele' +
      'ct [ID_ADVERT]'#13#10'      ,[TYPE_MSG]'#13#10'      ,[ID_CLI]'#13#10'      ,[MSG]' +
      ' from [ADVERT_MSG]'#13#10#13#10'delete [ADVERT_MSG]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 352
    Top = 568
  end
  object ADOCommandRestorePredAdvertMsg: TADOCommand
    CommandText = 
      'delete [ADVERT_MSG]'#13#10'insert into [ADVERT_MSG] ([ID_ADVERT]'#13#10'    ' +
      '  ,[TYPE_MSG]'#13#10'      ,[ID_CLI]'#13#10'      ,[MSG]'#13#10#9#9')'#13#10'select [ID_AD' +
      'VERT]'#13#10'      ,[TYPE_MSG]'#13#10'      ,[ID_CLI]'#13#10'      ,[MSG]  from [A' +
      'DVERT_MSG_TMP]'#13#10#13#10'delete [ADVERT_MSG_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 448
    Top = 568
  end
  object ADOCommandSavePredKioOperGroup: TADOCommand
    CommandText = 
      'delete [KIO_OPERATIONS_GRUP_TMP]'#13#10'insert into [KIO_OPERATIONS_GR' +
      'UP_TMP] ([ID_VID_OPERATION]'#13#10'      ,[ID_GRTOV]'#13#10#9#9')'#13#10'select [ID_' +
      'VID_OPERATION]'#13#10'      ,[ID_GRTOV] from [KIO_OPERATIONS_GRUP]'#13#10#13#10 +
      'delete [KIO_OPERATIONS_GRUP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 552
    Top = 608
  end
  object ADOCommandRestorePredKioOperGroup: TADOCommand
    CommandText = 
      'delete [KIO_OPERATIONS_GRUP]'#13#10'insert into [KIO_OPERATIONS_GRUP] ' +
      '([ID_VID_OPERATION]'#13#10'      ,[ID_GRTOV]'#13#10#9#9')'#13#10'select [ID_VID_OPER' +
      'ATION]'#13#10'      ,[ID_GRTOV] from [KIO_OPERATIONS_GRUP_TMP]'#13#10#13#10'dele' +
      'te [KIO_OPERATIONS_GRUP_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 672
    Top = 608
  end
  object ADOCommandSavePredPRODUCT_POS: TADOCommand
    CommandText = 
      'delete [PRODUCT_POS_TMP]'#13#10'insert into [PRODUCT_POS_TMP] ( [ID_PR' +
      'OD]'#13#10'      ,[ID_TOV]'#13#10'      ,[N_SYR_MINUS]'#13#10'      ,[N_SYR_PLUS]'#13 +
      #10'      ,[N_GOT_MINUS]'#13#10'      ,[N_GOT_PLUS]'#13#10'      ,[N_SUH_MINUS]' +
      #13#10'      ,[N_SUH_PLUS]'#13#10#9#9')'#13#10'select [ID_PROD]'#13#10'      ,[ID_TOV]'#13#10' ' +
      '     ,[N_SYR_MINUS]'#13#10'      ,[N_SYR_PLUS]'#13#10'      ,[N_GOT_MINUS]'#13#10 +
      '      ,[N_GOT_PLUS]'#13#10'      ,[N_SUH_MINUS]'#13#10'      ,[N_SUH_PLUS] f' +
      'rom [PRODUCT_POS]'#13#10#13#10'delete [PRODUCT_POS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 496
    Top = 208
  end
  object ADOCommandRestorePredPRODUCT_POS: TADOCommand
    CommandText = 
      'delete [PRODUCT_POS]'#13#10'insert into [PRODUCT_POS] ('#13#10#9#9'[ID_PROD]'#13#10 +
      '      ,[ID_TOV]'#13#10'      ,[N_SYR_MINUS]'#13#10'      ,[N_SYR_PLUS]'#13#10'    ' +
      '  ,[N_GOT_MINUS]'#13#10'      ,[N_GOT_PLUS]'#13#10'      ,[N_SUH_MINUS]'#13#10'   ' +
      '   ,[N_SUH_PLUS])'#13#10'select [ID_PROD]'#13#10'      ,[ID_TOV]'#13#10'      ,[N_' +
      'SYR_MINUS]'#13#10'      ,[N_SYR_PLUS]'#13#10'      ,[N_GOT_MINUS]'#13#10'      ,[N' +
      '_GOT_PLUS]'#13#10'      ,[N_SUH_MINUS]'#13#10'      ,[N_SUH_PLUS] from [PROD' +
      'UCT_POS_TMP]'#13#10#13#10'delete [PRODUCT_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 592
    Top = 208
  end
  object ADOCommandSavePredNORM_ASSEMB_POS: TADOCommand
    CommandText = 
      'delete [NORM_ASSEMB_POS_TMP]'#13#10'insert into [NORM_ASSEMB_POS_TMP] ' +
      '( [ID_NORM]'#13#10'      ,[ID_PROD]'#13#10'      ,[ID_TOV]'#13#10'      ,[NORMA]'#13#10 +
      #9#9')'#13#10'select [ID_NORM]'#13#10'      ,[ID_PROD]'#13#10'      ,[ID_TOV]'#13#10'      ' +
      ',[NORMA] from [NORM_ASSEMB_POS]'#13#10#13#10'delete [NORM_ASSEMB_POS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 656
    Top = 208
  end
  object ADOCommandRestorePredNORM_ASSEMB_POS: TADOCommand
    CommandText = 
      'delete [NORM_ASSEMB_POS]'#13#10'insert into [NORM_ASSEMB_POS] ('#13#10#9#9'[ID' +
      '_NORM]'#13#10'      ,[ID_PROD]'#13#10'      ,[ID_TOV]'#13#10'      ,[NORMA])'#13#10'sele' +
      'ct [ID_NORM]'#13#10'      ,[ID_PROD]'#13#10'      ,[ID_TOV]'#13#10'      ,[NORMA] ' +
      'from [NORM_ASSEMB_POS_TMP]'#13#10#13#10'delete [NORM_ASSEMB_POS_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 752
    Top = 208
  end
  object ADOCommandSavePredKUPON_CARD: TADOCommand
    CommandText = 
      'delete [KUPON_CARD_TMP]'#13#10'insert into [KUPON_CARD_TMP] ( [ID_KUPO' +
      'N]'#13#10#9#9')'#13#10'select [ID_KUPON] from [KUPON_CARD]'#13#10#13#10'delete [KUPON_CA' +
      'RD]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 688
    Top = 496
  end
  object ADOCommandRestorePredKUPON_CARD: TADOCommand
    CommandText = 
      'delete [KUPON_CARD]'#13#10'insert into [KUPON_CARD] ([ID_KUPON]'#13#10#9#9')'#13#10 +
      'select [ID_KUPON] from [KUPON_CARD_TMP]'#13#10#13#10'delete [KUPON_CARD_TM' +
      'P]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 784
    Top = 496
  end
  object ADOCommandSavePredSkidka: TADOCommand
    CommandText = 
      'delete [SKIDKA_POS_TMP]'#13#10'insert into [SKIDKA_POS_TMP] ( [ID_SKID' +
      'KA]'#13#10'      ,[PER_SKIDKA_KOLBASA]'#13#10'      ,[PER_SKIDKA_MYASO]'#13#10'   ' +
      '   ,[PER_SKIDKA_TNP]'#13#10'      ,[COMMENT]'#13#10'      ,[D_FROM]'#13#10'      ,' +
      '[D_TO]'#13#10'      ,[MIN_KOLBASA]'#13#10'      ,[MIN_MYASO]'#13#10'      ,[MIN_TN' +
      'P]'#13#10'      ,[IS_NAMED]'#13#10'      ,[DAY_TIME_FROM]'#13#10'      ,[DAY_TIME_' +
      'TO]'#13#10#9#9')'#13#10'select [ID_SKIDKA]'#13#10'      ,[PER_SKIDKA_KOLBASA]'#13#10'     ' +
      ' ,[PER_SKIDKA_MYASO]'#13#10'      ,[PER_SKIDKA_TNP]'#13#10'      ,[COMMENT]'#13 +
      #10'      ,[D_FROM]'#13#10'      ,[D_TO]'#13#10'      ,[MIN_KOLBASA]'#13#10'      ,[M' +
      'IN_MYASO]'#13#10'      ,[MIN_TNP]'#13#10'      ,[IS_NAMED]'#13#10'      ,[DAY_TIME' +
      '_FROM]'#13#10'      ,[DAY_TIME_TO] from [SKIDKA_POS]'#13#10#13#10'delete [SKIDKA' +
      '_POS]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 8
    Top = 560
  end
  object ADOCommandRestorePredSkidka: TADOCommand
    CommandText = 
      'delete [SKIDKA_POS]'#13#10'insert into [SKIDKA_POS] ([ID_SKIDKA]'#13#10'    ' +
      '  ,[PER_SKIDKA_KOLBASA]'#13#10'      ,[PER_SKIDKA_MYASO]'#13#10'      ,[PER_' +
      'SKIDKA_TNP]'#13#10'      ,[COMMENT]'#13#10'      ,[D_FROM]'#13#10'      ,[D_TO]'#13#10' ' +
      '     ,[MIN_KOLBASA]'#13#10'      ,[MIN_MYASO]'#13#10'      ,[MIN_TNP]'#13#10'     ' +
      ' ,[IS_NAMED]'#13#10'      ,[DAY_TIME_FROM]'#13#10'      ,[DAY_TIME_TO]'#13#10#9#9')'#13 +
      #10'select [ID_SKIDKA]'#13#10'      ,[PER_SKIDKA_KOLBASA]'#13#10'      ,[PER_SK' +
      'IDKA_MYASO]'#13#10'      ,[PER_SKIDKA_TNP]'#13#10'      ,[COMMENT]'#13#10'      ,[' +
      'D_FROM]'#13#10'      ,[D_TO]'#13#10'      ,[MIN_KOLBASA]'#13#10'      ,[MIN_MYASO]' +
      #13#10'      ,[MIN_TNP]'#13#10'      ,[IS_NAMED]'#13#10'      ,[DAY_TIME_FROM]'#13#10' ' +
      '     ,[DAY_TIME_TO]  from [SKIDKA_POS_TMP]'#13#10#13#10'delete [SKIDKA_POS' +
      '_TMP]'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 128
    Top = 560
  end
  object ADOCommandDelete_Docum_TMP: TADOCommand
    CommandText = 
      'declare @ID_USER int'#13#10'set @ID_USER=:ID_USER '#13#10'delete [dbo].[NAKL' +
      'CAP_IMPORT_TMP]  where [ID_USER]=@ID_USER'#13#10'delete [dbo].[NAKLTOV' +
      '_IMPORT_TMP]  where [ID_USER]=@ID_USER'#13#10'delete [dbo].[NAVESKI_IM' +
      'PORT_TMP]  where [ID_USER]=@ID_USER'
    Connection = ADOConnection1
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 672
  end
end
