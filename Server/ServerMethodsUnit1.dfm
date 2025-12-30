object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 617
  Width = 892
  object DataSetProvider_Doc_Type: TDataSetProvider
    DataSet = ADS_Doc_Type
    Left = 160
    Top = 16
  end
  object ADS_Doc_Type: TADODataSet
    Connection = ADOConnectionTmp
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
      'OC=DT.ID_LINK_CH_DOC'#13#10#13#10'where DT.ID_CHAR_DOC=:IDCHARDOC'#13#10'ORDER B' +
      'Y DT.NAMEDOC'
    Parameters = <
      item
        Name = 'IDCHARDOC'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 16
  end
  object ADS_NaklCap: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select  NC.D, NC.NN, NC.CHEREZ, NC.DOVER, NC.OSNOV, NC.UDOST, '#13#10 +
      'NC.FORMOPL, NC.TRANSP, NC.TARA, NC.PLUS, NC.MINUS, NC.ZATRNAME, ' +
      #13#10'NC.ZATR, NC.PRICE_KATEG, NC.ID_NAKLCAP, NC.TOT_SUM, NC.TOT_NUM' +
      ', NC.SCH_D, NC.SCH_K,'#13#10' CL.CLIENT,CLS.CLIENT SUPPL,'#13#10'NC.NUM_TARA' +
      ', NC.D_CREATE, NC.D_DELETE, NC.COMMENT_DEL,'#13#10'U."NAME"  USER_CR, ' +
      'UD."NAME"  USER_DEL,'#13#10'TA."NAME" NAMETARA, NC.ID_TARA, NC.ID_GR_P' +
      'ROV, CLK.CLIENT CLI_K, NC.NDS, NC.STAVKA_NDS,'#13#10' DT.NAMEDOC, DCH.' +
      'CHAR_DOC,NC.ID_DOC_TYPE,DT.ID_CHAR_DOC, NC.ID_CLI_K,'#13#10'NC.IS_DELE' +
      'TE, NC.CLOSE_SUM, NC.ID_LINK_DOC, DTL.NAMEDOC DOC_LINK, NC_L.D D' +
      '_LINK, NC_L.NN NN_LINK, NC.PER_NACENKA, NC.FIX_PROV, NC.NALOG_NA' +
      'KL, CLK.INN INN_K, CL.INN INN_D, NC.ID_CLIENT'#13#10' from NAKLCAP NC'#13 +
      #10'left outer join CLIENTS CL'#13#10' on CL.ID_CLIENTS=NC.ID_CLIENT'#13#10'lef' +
      't outer join USERS U'#13#10' on U.ID_USERS=NC.ID_USERS'#13#10'left outer joi' +
      'n CLIENTS CLS'#13#10' on CLS.ID_CLIENTS=NC.ID_SUPPLYER'#13#10'left outer joi' +
      'n CLIENTS CLK'#13#10' on CLK.ID_CLIENTS=NC.ID_CLI_K'#13#10' left outer join ' +
      'USERS UD'#13#10' on UD.ID_USERS=NC.ID_USER_DEL'#13#10'left outer join TOV TA' +
      #13#10' on TA.ID_TOV=NC.ID_TARA'#13#10'left outer join DOC_TYPE DT'#13#10' on DT.' +
      'ID_DOC_TYPE=NC.ID_DOC_TYPE'#13#10'left outer join DOC_CHAR DCH'#13#10' on DC' +
      'H.ID_CHAR_DOC=DT.ID_CHAR_DOC'#13#10'left outer join NAKLCAP NC_L on NC' +
      '_L.ID_NAKLCAP=NC.ID_LINK_DOC'#13#10'left outer join DOC_TYPE DTL'#13#10' on ' +
      'DTL.ID_DOC_TYPE=NC_L.ID_DOC_TYPE'#13#10#13#10'where NC.ID_DOC_TYPE=:IDDT'#13#10 +
      '    and NC.IS_DELETE=:ISDEL'#13#10'    and NC.D >=:DFROM'#13#10'    and NC.D' +
      '<=:DTO'#13#10'order by NC.D, NC.NN '
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
      end>
    Left = 16
    Top = 168
  end
  object DataSetProvider_NaklCap: TDataSetProvider
    DataSet = ADS_NaklCap
    Left = 64
    Top = 168
  end
  object SP_COPY_NAKL: TADOStoredProc
    Connection = ADOConnectionTmp
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
    Left = 192
    Top = 216
  end
  object SP_SET_PRICE_FROM_NAKL: TADOStoredProc
    Connection = ADOConnectionTmp
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
    Left = 224
    Top = 216
  end
  object Q_ControlLinkDoc: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDLINKDOC'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select DT.NAMEDOC, NC.D, NC.NN, NC.ID_NAKLCAP from NAKLCAP NC'
      'inner join DOC_TYPE DT on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE'
      'where NC.ID_LINK_DOC=:IDLINKDOC'
      'and NC.IS_DELETE=0')
    Left = 104
    Top = 216
  end
  object DataSetProvider_Q_NaklCapInfo: TDataSetProvider
    DataSet = Q_NaklCapInfo
    Left = 56
    Top = 216
  end
  object DataSetProvider_Q_ControlLinkDoc: TDataSetProvider
    DataSet = Q_ControlLinkDoc
    Left = 144
    Top = 216
  end
  object ADS_Price: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'DECLARE @IDCLI INTEGER'#13#10'SET @IDCLI=:IDCLI'#13#10#13#10'DECLARE @D_FROM DAT' +
      'ETIME'#13#10'SET @D_FROM=:D_FROM'#13#10#13#10'DECLARE @D_TO DATETIME'#13#10'SET @D_TO=' +
      ':D_TO'#13#10#13#10'DECLARE @per_nds FLOAT'#13#10'SET @per_nds=:per_nds'#13#10#13#10'DECLAR' +
      'E @D_DOC DATETIME'#13#10'SET @D_DOC=:D_DOC'#13#10#13#10'DECLARE @IDU INTEGER'#13#10'SE' +
      'T @IDU=:IDU'#13#10#13#10'DECLARE @IDG_FROM INTEGER'#13#10'SET @IDG_FROM=:IDG_FRO' +
      'M'#13#10#13#10'DECLARE @IDG_TO INTEGER'#13#10'SET @IDG_TO=:IDG_TO'#13#10' '#13#10'   '#13#10#13#10#13#10'S' +
      'ELECT     dbo.PRICE.ID_TOV, dbo.PRICE.ID_USERS, dbo.PRICE.NUMB, ' +
      'dbo.PRICE.PRICE_TMP, dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.GOST, ' +
      #13#10'           dbo.TOV.SROKREAL, '#13#10#13#10'dbo.TOV.CODE, dbo.TOV.ID_GRTO' +
      'V,'#13#10'           dbo.GRTOV.GRUPTOV, dbo.PRICE.OSTAT, dbo.PRICE.PRI' +
      'CE_UCH, '#13#10#13#10'(SELECT SUM( NT.NUMB)  FROM NAKLTOV NT'#13#10'inner join N' +
      'AKLCAP NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'#13#10'inner join DOC_TYPE DT' +
      ' on DT.ID_DOC_TYPE=NC.ID_DOC_TYPE'#13#10'where NC.ID_CLIENT=@IDCLI'#13#10'  ' +
      '  and NC.D>=@D_FROM'#13#10'    and NC.D<=@D_TO'#13#10'    and NC.IS_DELETE=0' +
      #13#10'    and NT.ID_TOV=dbo.PRICE.ID_TOV'#13#10'    and DT.ID_CHAR_DOC=8) ' +
      'ZAK,'#13#10#13#10'('#13#10'SELECT Count(*) from PRODUCT where PRODUCT.ID_TOV=dbo' +
      '.PRICE.ID_TOV'#13#10') IS_NORM,'#13#10#13#10'dbo.TOV.FLAG_SOCIAL,'#13#10'dbo.TOV.MAX_P' +
      'RICE/(@per_nds) MAX_PRICE,'#13#10'dbo.TOV.IS_USE,'#13#10'dbo.TOV.COMPARE_PRI' +
      'CE,'#13#10#13#10'('#13#10'select TOP 1 PRICE_DATE.PRICE1'#13#10'from PRICE_DATE'#13#10'where' +
      ' PRICE_DATE.D_START<=@D_DOC'#13#10'and PRICE_DATE.ID_TOV=dbo.PRICE.ID_' +
      'TOV'#13#10'and PRICE_DATE.IS_DELETE=0'#13#10'ORDER BY PRICE_DATE.D_START DES' +
      'C'#13#10') PRICE1,'#13#10#13#10'('#13#10'select TOP 1 PRICE_DATE.PRICE2'#13#10'from PRICE_DA' +
      'TE'#13#10'where PRICE_DATE.D_START<=@D_DOC'#13#10'and PRICE_DATE.ID_TOV=dbo.' +
      'PRICE.ID_TOV'#13#10'and PRICE_DATE.IS_DELETE=0'#13#10'ORDER BY PRICE_DATE.D_' +
      'START DESC'#13#10') PRICE2,'#13#10#13#10'('#13#10'select TOP 1 PRICE_DATE.PRICE3'#13#10'from' +
      ' PRICE_DATE'#13#10'where PRICE_DATE.D_START<=@D_DOC'#13#10'and PRICE_DATE.ID' +
      '_TOV=dbo.PRICE.ID_TOV'#13#10'and PRICE_DATE.IS_DELETE=0'#13#10'ORDER BY PRIC' +
      'E_DATE.D_START DESC'#13#10') PRICE3,'#13#10#13#10'('#13#10'select TOP 1 PRICE_DATE.PRI' +
      'CE4'#13#10'from PRICE_DATE'#13#10'where PRICE_DATE.D_START<=@D_DOC'#13#10'and PRIC' +
      'E_DATE.ID_TOV=dbo.PRICE.ID_TOV'#13#10'and PRICE_DATE.IS_DELETE=0'#13#10'ORDE' +
      'R BY PRICE_DATE.D_START DESC'#13#10') PRICE4'#13#10#13#10#13#10'FROM         dbo.PRI' +
      'CE '#13#10' INNER JOIN dbo.TOV ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'#13#10'i' +
      'nner JOIN dbo.GRTOV ON dbo.TOV.ID_GRTOV = dbo.GRTOV.ID_GRTOV'#13#10#13#10 +
      'WHERE dbo.PRICE.ID_USERS=@IDU '#13#10'    AND dbo.TOV.ID_GRTOV>=@IDG_F' +
      'ROM'#13#10'    AND dbo.TOV.ID_GRTOV<=@IDG_TO'#13#10'    '#13#10'ORDER BY NAME'
    Parameters = <
      item
        Name = 'IDCLI'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
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
      end
      item
        Name = 'per_nds'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IDG_FROM'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IDG_TO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 328
    Top = 216
  end
  object DataSetProvider_Price: TDataSetProvider
    DataSet = ADS_Price
    Left = 376
    Top = 216
  end
  object Q_Doc_Type: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDDOCTYPE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from [dbo].[DOC_TYPE] where [ID_DOC_TYPE]=:IDDOCTYPE'
      '')
    Left = 272
    Top = 216
  end
  object Q_NaklCapInfo: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDNC'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select NC.ID_NAKLCAP,NC.D, NC.NN, NC.ID_DOC_TYPE, NC.ID_CLIENT, ' +
        'NC.CHEREZ, NC.DOVER, NC.OSNOV,'
      
        ' NC.UDOST, NC.FORMOPL, NC.TRANSP, NC.TARA, NC.PLUS, NC.MINUS, NC' +
        '.ZATRNAME,'
      
        ' NC.ZATR, NC.PRICE_KATEG, NC.ID_USERS, NC.ID_SUPPLYER, NC.IS_DEL' +
        'ETE, NC.TOT_SUM, NC.TOT_NUM,'
      'CL1.CLIENT SUPPLYER,'
      ' CL2.CLIENT, CL2.RS, CL2.MFO, CL2.OKPO, CL2.BANK,'
      'NC.NUM_TARA, NC.D_CREATE, NC.D_DELETE,'
      'U."NAME"  USER_CR, UD."NAME"  USER_DEL,'
      'TA."NAME" NAMETARA, NC.ID_TARA, NC.ID_CLI_K, NC.SCH_D, NC.SCH_K,'
      
        ' CL3.CLIENT CLI_K, CL3.RS RS_K, CL3.MFO MFO_K, CL3.OKPO OKPO_K, ' +
        'CL2.BANK BANK_K, NC.NDS, NC.STAVKA_NDS, NC.ID_LINK_DOC,'
      'NCL.NN NN_LINK, NCL.D D_LINK, DTL.NAMEDOC NAMEDOC_LINK,'
      'CL2.PER_MINUS PER_MINUS_DEBET,'
      'CL3.PER_MINUS PER_MINUS_KRED,'
      'CL2.PRICE_TIME PRICE_TIME_DEBET,'
      'CL3.PRICE_TIME PRICE_TIME_KRED,'
      'NC.PER_NACENKA,'
      'CL2.SALES_CATEGOR CLI_SALES_CATEGOR,'
      'NC.SKIDKA_PAKET'
      'from NAKLCAP NC '
      'left outer join CLIENTS CL1 on CL1.ID_CLIENTS=NC.ID_SUPPLYER'
      'left outer join CLIENTS CL2 on CL2.ID_CLIENTS=NC.ID_CLIENT'
      'left outer join CLIENTS CL3 on CL3.ID_CLIENTS=NC.ID_CLI_K'
      'left outer join USERS U on U.ID_USERS=NC.ID_USERS'
      ' left outer join USERS UD on UD.ID_USERS=NC.ID_USER_DEL'
      'left outer join TOV TA on TA.ID_TOV=NC.ID_TARA'
      'left outer join NAKLCAP NCL on NCL.ID_NAKLCAP=NC.ID_LINK_DOC'
      'left outer join DOC_TYPE DTL on DTL.ID_DOC_TYPE=NCL.ID_DOC_TYPE'
      'where NC.ID_NAKLCAP =:IDNC')
    Left = 16
    Top = 216
  end
  object ADSAvtoNariad: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select NC.ID_AVTO_NARIAD, NC.D, NC.NN, NC.PROBEG1, NC.PROBEG2, N' +
      'C.MOTOCHAS1, NC.MOTOCHAS2, '#13#10'NC.NORMA_PROBEG_TMP, NC.NORMA_MOTOC' +
      'HAS_TMP, NC.N_TOPLIVA, NC.COMMENT_RABOT, NC.IS_DELETE, NC.ID_USE' +
      'R, '#13#10'NC.ID_USER_DEL, NC.D_CREATE, NC.D_DELETE, NC.COMMENT_DEL, N' +
      'C.ID_GRPROV, NC.SCH_D,'#13#10'NC.ID_CLI_D, NC.SCH_K, NC.ID_CLI_AVTO,'#13#10 +
      ' CLD.CLIENT CL_D, CLK.CLIENT CL_K,'#13#10#13#10'U."NAME"  USER_CR, UD."NAM' +
      'E"  USER_DEL,'#13#10' '#13#10' CLK.INN INN_K, CLD.INN INN_D,'#13#10'NC.ID_DOC_TYPE' +
      ','#13#10'NC.WORK_HOURS,'#13#10'NC.ID_DRIVER, DR.CLIENT DRIVER'#13#10' '#13#10' from AVTO' +
      '_NARIAD NC'#13#10'left outer join CLIENTS CLD'#13#10' on CLD.ID_CLIENTS=NC.I' +
      'D_CLI_D'#13#10#13#10'left outer join USERS U'#13#10' on U.ID_USERS=NC.ID_USER'#13#10#13 +
      #10'left outer join CLIENTS CLK'#13#10' on CLK.ID_CLIENTS=NC.ID_CLI_AVTO'#13 +
      #10#13#10' left outer join USERS UD'#13#10' on UD.ID_USERS=NC.ID_USER_DEL'#13#10#13#10 +
      'left outer join CLIENTS DR'#13#10' on DR.ID_CLIENTS=NC.ID_DRIVER'#13#10#13#10'wh' +
      'ere NC.ID_DOC_TYPE=:IDDT'#13#10'    and NC.IS_DELETE=:ISDEL'#13#10'    and N' +
      'C.D >=:DFROM'#13#10'    and NC.D<=:DTO'#13#10'order by NC.D, NC.NN  '
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
      end>
    Left = 24
    Top = 264
  end
  object DataSetProviderAvtoNariad: TDataSetProvider
    DataSet = ADSAvtoNariad
    Left = 80
    Top = 264
  end
  object ADSAvtoNariadEdit: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select NC.ID_AVTO_NARIAD, NC.D, NC.NN, NC.PROBEG1, NC.PROBEG2, N' +
      'C.MOTOCHAS1, NC.MOTOCHAS2, '#13#10'NC.NORMA_PROBEG_TMP, NC.NORMA_MOTOC' +
      'HAS_TMP, NC.N_TOPLIVA, NC.COMMENT_RABOT, NC.IS_DELETE, NC.ID_USE' +
      'R, '#13#10'NC.ID_USER_DEL, NC.D_CREATE, NC.D_DELETE, NC.COMMENT_DEL, N' +
      'C.ID_GRPROV, NC.SCH_D,'#13#10'NC.ID_CLI_D, NC.SCH_K, NC.ID_CLI_AVTO,'#13#10 +
      ' CLD.CLIENT CL_D, CLK.CLIENT CL_K,'#13#10#13#10'U."NAME"  USER_CR, UD."NAM' +
      'E"  USER_DEL,'#13#10' '#13#10' CLK.INN INN_K, CLD.INN INN_D,'#13#10'NC.ID_DOC_TYPE' +
      ','#13#10'NC.WORK_HOURS,'#13#10'NC.ID_DRIVER, DR.CLIENT DRIVER '#13#10' from AVTO_N' +
      'ARIAD NC'#13#10'left outer join CLIENTS CLD'#13#10' on CLD.ID_CLIENTS=NC.ID_' +
      'CLI_D'#13#10#13#10'left outer join USERS U'#13#10' on U.ID_USERS=NC.ID_USER'#13#10#13#10'l' +
      'eft outer join CLIENTS CLK'#13#10' on CLK.ID_CLIENTS=NC.ID_CLI_AVTO'#13#10#13 +
      #10' left outer join USERS UD'#13#10' on UD.ID_USERS=NC.ID_USER_DEL'#13#10#13#10#13#10 +
      'left outer join CLIENTS DR'#13#10' on DR.ID_CLIENTS=NC.ID_DRIVER'#13#10#13#10'wh' +
      'ere NC.ID_DOC_TYPE=:IDDT'#13#10'    and NC.IS_DELETE=:ISDEL'#13#10'    and N' +
      'C.ID_AVTO_NARIAD=:IDAVTONARIAD'
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
        Name = 'IDAVTONARIAD'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 312
  end
  object DataSetProviderAvtoNariadEdit: TDataSetProvider
    DataSet = ADSAvtoNariadEdit
    Left = 88
    Top = 312
  end
  object SP_AVTONARIAD_EDIT: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'AVTONARIAD_EDIT;1'
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
        Name = '@ID_AVTO_NARIAD'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@DATE_DOC'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_CLI_AVTO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_D'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SCH_D'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@SCH_K'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@Probeg1'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Probeg2'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@NormaProbegTmp'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Motochas1'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Motochas2'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@NormaMotochasTmp'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Comment_Rabot'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@N_Topliva'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@WORK_HOURS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_DRIVER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@S_reason_delete_edit'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
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
        Name = '@IN_TRANSACTION'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_AVTO_NARIAD_NEW'
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
    Left = 144
    Top = 312
  end
  object SP_AVTONARIAD_DELETE: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'AVTONARIAD_DELETE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_AVTO_NARIAD'
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
    Left = 184
    Top = 312
  end
  object SP_AVTONARIAD_COPY: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'AVTONARIAD_COPY;1'
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
        Name = '@ID_AVTO_NARIAD'
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
    Left = 224
    Top = 312
  end
  object ADSSch: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select SCH.ID_SCH, SCH.SCH_NAME, SCH.ID_SCH_TYPE, SCH.ID_UCHET, ' +
      'SCH.IN_BALANS'#13#10'from SCH'#13#10#13#10
    Parameters = <>
    Left = 32
    Top = 376
    object ADSSchID_SCH: TStringField
      FieldName = 'ID_SCH'
      FixedChar = True
      Size = 10
    end
    object ADSSchSCH_NAME: TWideStringField
      FieldName = 'SCH_NAME'
      Size = 50
    end
    object ADSSchID_SCH_TYPE: TIntegerField
      FieldName = 'ID_SCH_TYPE'
    end
    object ADSSchID_UCHET: TIntegerField
      FieldName = 'ID_UCHET'
    end
    object ADSSchIN_BALANS: TIntegerField
      FieldName = 'IN_BALANS'
    end
    object ADSSchUCHET: TStringField
      FieldKind = fkLookup
      FieldName = 'UCHET'
      LookupDataSet = ADSUCH
      LookupKeyFields = 'ID_UCHET'
      LookupResultField = 'UCHET'
      KeyFields = 'ID_UCHET'
      Lookup = True
    end
    object ADSSchSCH_TYPE: TStringField
      FieldKind = fkLookup
      FieldName = 'SCH_TYPE'
      LookupDataSet = ADSSCHTYPE
      LookupKeyFields = 'ID_SCH_TYPE'
      LookupResultField = 'SCH_TYPE'
      KeyFields = 'ID_SCH_TYPE'
      Size = 30
      Lookup = True
    end
  end
  object DataSetProviderSch: TDataSetProvider
    DataSet = ADSSch
    Left = 96
    Top = 376
  end
  object ADSSCHTYPE: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 'select ID_SCH_TYPE, SCH_TYPE from SCH_TYPE'
    Parameters = <>
    Left = 36
    Top = 430
  end
  object DataSetProviderSCHTYPE: TDataSetProvider
    DataSet = ADSSCHTYPE
    Left = 104
    Top = 432
  end
  object ADSUCH: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 'select ID_UCHET, UCHET from UCH'
    Parameters = <>
    Left = 36
    Top = 482
  end
  object DataSetProviderUCH: TDataSetProvider
    DataSet = ADSUCH
    Left = 104
    Top = 488
  end
  object ADSUsers: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
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
    Left = 216
    Top = 376
  end
  object DataSetProviderUsers: TDataSetProvider
    DataSet = ADSUsers
    Left = 264
    Top = 376
  end
  object ADSClients: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select C.ID_CLIENTS, C.CLIENT, C.RS, C.MFO, C.OKPO, C.INN, C.RNN' +
      ','#13#10'C.TEL, C.DIRECTOR, C.BUHGALTER, C.ADRES, C.BANK, C.ID_KATEGOR' +
      ', C.AUX_INFO,'#13#10'KC.KATEGOR, C.PER_MINUS, C.PRICE_TIME,'#13#10'C.DOGOVOR' +
      ',C.N_DOGOVOR,C.D_DOGOVOR,'#13#10'C.ID_PARENT,'#13#10'C.SALES_CATEGOR, C.IS_D' +
      'ELETE,'#13#10'C.N_NAKL_DOLG, C.D_OTSROCHKI_DOLGA, SK.NAME_SALES_KATEG,' +
      ' C.IS_CONTROL_DOLG'#13#10#13#10'from CLIENTS C'#13#10'left outer join KATEG_CLI ' +
      'KC on  KC.ID_KATEGOR= C.ID_KATEGOR'#13#10'left outer join SALES_KATEGO' +
      'R SK on  SK.ID_SALES_KATEG= C.SALES_CATEGOR'#13#10'where C.ID_KATEGOR>' +
      '=:ID_K1'#13#10'     and C.ID_KATEGOR<=:ID_K2'#13#10'     and C.IS_DELETE=:is' +
      'delete'#13#10'order by C.CLIENT'
    Parameters = <
      item
        Name = 'ID_K1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_K2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 248
    Top = 448
  end
  object DataSetProviderClients: TDataSetProvider
    DataSet = ADSClients
    Left = 296
    Top = 448
  end
  object ADSKateg_Cli: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select ID_KATEGOR, KATEGOR, IS_DELETE from KATEG_CLI '#13#10'where IS_' +
      'DELETE=:isdelete'#13#10'order by KATEGOR'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 384
    Top = 448
  end
  object DataSetProviderKateg_Cli: TDataSetProvider
    DataSet = ADSKateg_Cli
    Left = 416
    Top = 448
  end
  object DataSetProvider_PricePOS: TDataSetProvider
    DataSet = ADSPricePOS
    Left = 560
    Top = 304
  end
  object ADSPricePOS: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'DECLARE @D_DOC DATETIME'#13#10'SET @D_DOC=:D_DOC'#13#10#13#10'DECLARE @IDU INTEG' +
      'ER'#13#10'SET @IDU=:IDU'#13#10#13#10'DECLARE @IDG_FROM INTEGER'#13#10'SET @IDG_FROM=:I' +
      'DG_FROM'#13#10#13#10'DECLARE @IDG_TO INTEGER'#13#10'SET @IDG_TO=:IDG_TO'#13#10' '#13#10'   '#13 +
      #10#13#10#13#10'SELECT     dbo.PRICE.ID_TOV, dbo.PRICE.ID_USERS, dbo.PRICE.' +
      'NUMB, dbo.PRICE.PRICE_TMP, dbo.TOV.NAME, dbo.TOV.EDIZM, dbo.TOV.' +
      'GOST, '#13#10'           dbo.TOV.SROKREAL, dbo.TOV.CODE, dbo.TOV.ID_GR' +
      'TOV,'#13#10'           dbo.GRTOV.GRUPTOV, dbo.PRICE.OSTAT, dbo.PRICE.P' +
      'RICE_UCH,'#13#10'('#13#10'select TOP 1 PRICE_DATE.PRICE2'#13#10'from PRICE_DATE'#13#10'w' +
      'here PRICE_DATE.D_START<=@D_DOC'#13#10'and PRICE_DATE.ID_TOV=dbo.PRICE' +
      '.ID_TOV'#13#10'and PRICE_DATE.IS_DELETE=0'#13#10'ORDER BY PRICE_DATE.D_START' +
      ' DESC'#13#10') PRICE2'#13#10#13#10#13#10#13#10'FROM         dbo.PRICE '#13#10' INNER JOIN dbo.' +
      'TOV ON dbo.PRICE.ID_TOV = dbo.TOV.ID_TOV'#13#10'inner JOIN dbo.GRTOV O' +
      'N dbo.TOV.ID_GRTOV = dbo.GRTOV.ID_GRTOV'#13#10#13#10'WHERE dbo.PRICE.ID_US' +
      'ERS=@IDU '#13#10'    AND dbo.TOV.ID_GRTOV>=@IDG_FROM'#13#10'    AND dbo.TOV.' +
      'ID_GRTOV<=@IDG_TO'#13#10'    '#13#10'ORDER BY NAME'
    Parameters = <
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IDG_FROM'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IDG_TO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 488
    Top = 304
  end
  object SP_DELETE_KATEG_CLI: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'DELETE_KATEG_CLI;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_KATEGOR'
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
    Top = 448
  end
  object ADOConnectionTmp: TADOConnection
    CommandTimeout = 3600
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_EP;Data Source=127.0.0.1\MSSQLS' +
      'RV17;Use Procedure for Prepare=1;Auto Translate=True;Packet Size' +
      '=4096;Workstation ID=DEVMAIN;Use Encryption for Data=False;Tag w' +
      'ith column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object QRepOtgruzTov1: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DECLARE @i INT'
      'DECLARE @S_CREATE_TABLE VARCHAR(1250)'
      ''
      'declare @first_day_month datetime'
      'declare @last_day_month datetime'
      ''
      'declare @start_year int'
      'declare @start_month int'
      'declare @n_month int'
      'declare @start_date datetime'
      ''
      ''
      'declare @year int'
      'declare @month int'
      'declare @day int'
      ''
      ''
      ''
      ''
      'set @start_year=2017      -- '#1075#1086#1076' '#1089
      'set @start_month=1  -- '#1084#1077#1089#1103#1094' '#1089
      
        'set @n_month=4   -- '#1082#1086#1083'-'#1074#1086' '#1084#1077#1089#1103#1094#1077#1074' '#1074' '#1086#1090#1095#1077#1090#1077' '#1085#1072#1095#1080#1085#1072#1103' '#1089' @start_mon' +
        'th'
      
        'set @start_date=DATETIMEFROMPARTS (@start_year, @start_month, 1,' +
        '0,0,0,0)'
      ''
      ''
      'declare @cli_name1 nvarchar(100);'
      ' set @cli_name1='#39#1060#1054#1055'  '#1061#1074#1086#1089#1090#1080#1095#1077#1085#1082#1086' '#1040'.'#1070'.'#39';'
      ''
      ''
      'SET @i=1'
      ''
      'SET @S_CREATE_TABLE='#39#39
      ''
      'BEGIN TRANSACTION'
      ''
      'WHILE @i <= @n_month'
      'BEGIN'
      'SET @S_CREATE_TABLE=@S_CREATE_TABLE+'
      '  +'#39' SN'#39'+CAST(@i as nvarchar(3))+'#39' FLOAT'#39
      '  if @i<>@n_month'
      '  BEGIN'
      '   SET @S_CREATE_TABLE=@S_CREATE_TABLE+'#39','#39
      '  END'
      '  SET @i=@i+1'
      'END -- WHILE @i <= @n_month'
      ''
      'CREATE TABLE #TMP_Table (id INT PRIMARY KEY )'
      ''
      
        'SET @S_CREATE_TABLE='#39'alter table #TMP_Table add BASETOV INTEGER,' +
        ' TOV_NAME NVARCHAR(255), GRUPTOV NVARCHAR(255), '#39'+@S_CREATE_TABL' +
        'E'
      'EXEC(@S_CREATE_TABLE)'
      ''
      ''
      'DECLARE @ER INT'
      'DECLARE @ID_TOV INT'
      'DECLARE @BASETOV INT'
      'DECLARE @TOV_NAME NVARCHAR(255)'
      'DECLARE @GRUPTOV NVARCHAR(255)'
      'DECLARE @SN FLOAT'
      'DECLARE @SNV FLOAT -- '#1074#1086#1079#1074#1088#1072#1090#1099
      ''
      ''
      
        'DECLARE Tov_cursor CURSOR  FOR select T.ID_TOV, T.BASETOV, T.NAM' +
        'E, GRTOV.GRUPTOV from TOV T'
      #9#9#9#9#9#9#9#9#9#9'left outer join GRTOV on GRTOV.ID_GRTOV=T.ID_GRTOV'
      #9#9#9#9#9#9#9#9#9#9'where'
      #9#9#9#9#9#9#9#9#9#9' T.ID_GRTOV=5'
      #9#9#9#9#9#9#9#9#9#9'or T.ID_GRTOV=8'
      #9#9#9#9#9#9#9#9#9#9'or T.ID_GRTOV=15'
      #9#9#9#9#9#9#9#9#9#9'or T.ID_GRTOV=19'
      #9#9#9#9#9#9#9#9#9#9'or T.ID_GRTOV=22'
      #9#9#9#9#9#9#9#9#9#9'or T.ID_GRTOV=24'
      #9#9#9#9#9#9#9#9#9#9'order by T.NAME, GRTOV.GRUPTOV'
      ''
      'SET @ER=0'
      'OPEN Tov_cursor'
      'SET @ER=@ER+@@ERROR'
      
        'FETCH NEXT FROM Tov_cursor INTO @ID_TOV, @BASETOV, @TOV_NAME, @G' +
        'RUPTOV'
      'WHILE (@@FETCH_STATUS = 0)'
      ' BEGIN'
      
        ' INSERT INTO #TMP_Table (id, BASETOV, TOV_NAME, GRUPTOV) VALUES(' +
        '@ID_TOV, @BASETOV, @TOV_NAME, @GRUPTOV)'
      ' SET @ER=@ER+@@ERROR'
      #9'SET @i=1'
      #9'WHILE @i <= @n_month'
      #9'BEGIN'
      ''
      #9'set @first_day_month=DATEADD(mm, @i-1, @start_date)'
      #9'set @last_day_month=EOMONTH (@first_day_month)'
      #9'set @day=DATEPART ( dd , @last_day_month )'
      #9'set @month=DATEPART ( mm , @last_day_month )'
      #9'set @year=DATEPART ( yyyy , @last_day_month )'
      
        #9'set @last_day_month=DATETIMEFROMPARTS (@year, @month, @day,23,5' +
        '9,59,0)'
      ''
      #9#9'SET @SN= IsNull((select sum(NUMB) from NMK_EP.dbo.NAKLTOV NT'
      #9#9'inner join NAKLCAP NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      #9#9'inner join CLIENTS CL on CL.ID_CLIENTS=NC.ID_CLIENT'
      #9#9'where'
      #9#9' CL.ID_KATEGOR=4 and'
      #9#9' CL.CLIENT = @cli_name1  and'
      #9#9#9' NC.D>=@first_day_month and NC.D<=@last_day_month'
      #9#9#9'and NC.IS_DELETE=0'
      
        #9#9#9'and (NC.ID_DOC_TYPE=90 or NC.ID_DOC_TYPE=48 or NC.ID_DOC_TYPE' +
        '=17 or NC.ID_DOC_TYPE=16)'
      #9#9#9'and NT.ID_TOV=@ID_TOV),0)'
      ''
      #9'SET @ER=@ER+@@ERROR'
      ''
      #9'-- '#1074#1086#1079#1074#1088#1072#1090#1099
      #9'SET @SNV= IsNull((select sum(NUMB) from NMK_EP.dbo.NAKLTOV NT'
      #9#9'inner join NAKLCAP NC on NC.ID_NAKLCAP=NT.ID_NAKLCAP'
      #9#9'inner join CLIENTS CL on CL.ID_CLIENTS=NC.ID_CLIENT'
      #9#9'where'
      #9#9' CL.ID_KATEGOR=4 and'
      #9#9' CL.CLIENT = @cli_name1  and'
      #9#9#9' NC.D>=@first_day_month and NC.D<=@last_day_month'
      #9#9#9'and NC.IS_DELETE=0'
      #9#9#9'and (NC.ID_DOC_TYPE=59 or NC.ID_DOC_TYPE=150)'
      #9#9#9'and NT.ID_TOV=@ID_TOV),0)'
      ''
      #9'SET @ER=@ER+@@ERROR'
      ''
      #9'SET @SN=@SN-@SNV'
      ''
      #9'SET @S_CREATE_TABLE='#39'UPDATE #TMP_Table SET'#39'+'
      
        #9'                    '#39' SN'#39'+CAST(@i as nvarchar(3))+'#39'='#39'+CAST(@SN ' +
        'as nvarchar(255))+'
      #9#9#9#9#9#9#39' where id='#39'+CAST(@ID_TOV as nvarchar(20))'
      ''
      #9'EXEC(@S_CREATE_TABLE)'
      ''
      #9'SET @i=@i+1'
      #9'END -- WHILE @i <= @n_month'
      ''
      ''
      
        '  FETCH NEXT FROM Tov_cursor INTO @ID_TOV,@BASETOV, @TOV_NAME, @' +
        'GRUPTOV'
      ' END -- '#1082#1086#1085#1077#1094' '#1094#1080#1082#1083#1072' '#1087#1086' '#1092#1080#1088#1084#1072#1084
      ' CLOSE Tov_cursor'
      ' DEALLOCATE Tov_cursor'
      ''
      ' declare @eps float'
      ' set @eps=0.00001'
      
        ' delete #TMP_Table where SN1<@eps and SN2<@eps and SN3<@eps and ' +
        'SN4<@eps'
      ''
      ' COMMIT  TRANSACTION'
      ''
      'SELECT * FROM #TMP_Table where 1=1'
      'ORDER BY TOV_NAME, GRUPTOV'
      ''
      ''
      ''
      ''
      ''
      ''
      'DROP TABLE #TMP_Table'
      ''
      '')
    Left = 568
    Top = 216
  end
  object DataSetProviderRepOtgruzTov1: TDataSetProvider
    DataSet = QRepOtgruzTov1
    Left = 640
    Top = 216
  end
  object QKateg_Cli_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select [ID_KATEGOR], [KATEGOR], [IS_DELETE] from [dbo].[KATEG_CL' +
        'I]'
      'where [IS_DELETE]=0  and  [ID_KATEGOR] in (1, 2, 45, 47, 48, 50)')
    Left = 344
    Top = 24
  end
  object DataSetProvider_QKateg_Cli_Import: TDataSetProvider
    DataSet = QKateg_Cli_Import
    Left = 376
    Top = 24
  end
  object QClients_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [ID_CLIENTS]'
      '      ,[CLIENT]'
      '      ,[RS]'
      '      ,[MFO]'
      '      ,[OKPO]'
      '      ,[INN]'
      '      ,[RNN]'
      '      ,[TEL]'
      '      ,[DIRECTOR]'
      '      ,[BUHGALTER]'
      '      ,[ADRES]'
      '      ,[BANK]'
      '      ,[ID_KATEGOR]'
      '      ,[AUX_INFO]'
      '      ,[PER_MINUS]'
      '      ,[PRICE_TIME]'
      '      ,[DOGOVOR]'
      '      ,[N_DOGOVOR]'
      '      ,[D_DOGOVOR]'
      '      ,[ID_PARENT]'
      '      ,[SALES_CATEGOR]'
      '      ,[IS_DELETE]'
      '      ,[N_NAKL_DOLG]'
      '      ,[D_OTSROCHKI_DOLGA]'
      '      ,[IS_CONTROL_DOLG]'
      '      ,[EMAIL]'
      '      ,[BIRTHDAY]'
      
        '  FROM [dbo].[CLIENTS]  where  ID_KATEGOR in (1, 2,45, 47, 48, 5' +
        '0) and IS_DELETE=0'
      '')
    Left = 432
    Top = 24
  end
  object DataSetProvider_QClients_Import: TDataSetProvider
    DataSet = QClients_Import
    Left = 464
    Top = 24
  end
  object QBonuses_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [ID_BONUS]'
      '      ,[ID_CLI]'
      '      ,[SUM_BALL]'
      'FROM [dbo].[BONUSES]'
      'where [IS_FIXED]=0'
      '')
    Left = 512
    Top = 24
  end
  object DataSetProvider_QBonuses_Import: TDataSetProvider
    DataSet = QBonuses_Import
    Left = 544
    Top = 24
  end
  object ADS_NaklCap_Export: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select  * from NAKLCAP_POS NC'#13#10'where NC.[ID_TRADE_POINT] =:ID_TR' +
      'ADE_POINT '#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 24
    Top = 120
  end
  object DataSetProvider_ADS_NaklCap_Export: TDataSetProvider
    DataSet = ADS_NaklCap_Export
    Left = 72
    Top = 120
  end
  object ADS_NaklTov_Export: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select  * from NAKLTOV_POS NT'#13#10'where NT.[ID_TRADE_POINT] =:ID_TR' +
      'ADE_POINT '#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 176
    Top = 120
  end
  object DataSetProvider_ADS_NaklTov_Export: TDataSetProvider
    DataSet = ADS_NaklTov_Export
    Left = 224
    Top = 120
  end
  object ADS_Naveski_Export: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select  * from NAVESKI_POS N'#13#10'where N.[ID_TRADE_POINT] =:ID_TRAD' +
      'E_POINT '#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 280
    Top = 120
  end
  object DataSetProviderADS_Naveski_Export: TDataSetProvider
    DataSet = ADS_Naveski_Export
    Left = 328
    Top = 120
  end
  object QGrTov_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [ID_GRTOV]'
      '      ,[GRUPTOV]'
      '      ,[SEQUENTIAL]'
      '      ,[IS_DELETE]'
      '  FROM [dbo].[GRTOV] where'
      
        ' -- [ID_GRTOV] in (40,39,38, 8, 15, 5, 19, 22, 36, 24, 27, 32, 3' +
        '5, 28, 34, 26, 29, 33, 31, 30, 37, 2, 16,43, 44)'
      '   ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1, 2, 3, 4, 5, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1058#1053#1055 +
        ', '#1072#1083#1082#1086#1075#1086#1083#1100', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086','
      ')'
      
        'or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088 +
        #1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099)
    Left = 616
    Top = 24
  end
  object DataSetProvider_QGrTov_Import: TDataSetProvider
    DataSet = QGrTov_Import
    Left = 648
    Top = 24
  end
  object QTov_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [ID_TOV]'
      '      ,[NAME]'
      '      ,[EDIZM]'
      '      ,[GOST]'
      '      ,[SROKREAL]'
      '      ,[CODE]'
      '      ,[ID_GRTOV]'
      '      ,[ID_VID]'
      '      ,[FLAG_SOCIAL]'
      '      ,[MAX_PRICE]'
      '      ,[IS_USE]'
      '      ,[COMPARE_PRICE]'
      '      ,[PART]'
      '      ,[AVAILABILITY]'
      '      ,[NOVELTY]'
      '      ,[RECOMMENDED]'
      '      ,[ID_KATEGOR_CLI]'
      '      ,[BASETOV]'
      '      ,[IS_DELETE]'
      '      ,[UKTZED]'
      '      ,[IS_FISCAL]'
      '      ,[IS_EXCISE]'
      '  FROM [dbo].[TOV]'
      '  where'
      
        '  --[ID_GRTOV] in (40,39,38, 8, 15, 5, 19, 22, 36, 24, 27, 32, 3' +
        '5, 28, 34, 26, 29, 33, 31, 30, 37,2, 16,43, 44)'
      '  ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1, 2, 3, 4, 5, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1058#1053#1055 +
        ', '#1072#1083#1082#1086#1075#1086#1083#1100', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086','
      ')'
      
        'or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088 +
        #1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099
      '')
    Left = 720
    Top = 24
  end
  object DataSetProvider_QTov_Import: TDataSetProvider
    DataSet = QTov_Import
    Left = 752
    Top = 24
  end
  object QPRICE_DATE_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  PD.[ID_PRICE_DATE]'
      '      ,PD.[ID_TOV]'
      '      ,PD.[D_START]'
      '      ,PD.[PRICE1]'
      '      ,PD.[PRICE2]'
      '      ,PD.[PRICE3]'
      '      ,PD.[PRICE4]'
      '      ,PD.[D_EDIT_NEW]'
      '      ,PD.[ID_USER]'
      '      ,PD.[IS_DELETE]'
      '      ,PD.[D_DELETE]'
      '      ,PD.[ID_USER_DELETE]'
      '      ,PD.[COMMENT_DEL]'
      '      ,PD.[ID_CLI]'
      '  FROM [dbo].[PRICE_DATE] PD'
      '  inner join TOV T on T.[ID_TOV]=PD.[ID_TOV]'
      '  where'
      
        '  -- T.[ID_GRTOV] in (40,39, 38, 8, 15, 5, 19, 22, 36, 24, 27, 3' +
        '2, 35, 28, 34, 26, 29, 33, 31, 30, 37,2, 16, 43, 44)'
      '   ('
      #9#9'ID_GRTOV in ('
      
        #9#9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG whe' +
        're KOG.[ID_VID_OPERATION] in (1, 2, 3, 4, 5, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1058#1053 +
        #1055', '#1072#1083#1082#1086#1075#1086#1083#1100', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086','
      #9#9')'
      
        #9'or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077 +
        #1088#1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099
      #9')'
      '  and PD.[IS_DELETE]=0 and T.[IS_DELETE]=0'
      '')
    Left = 520
    Top = 72
  end
  object DataSetProvider_QPRICE_DATE_Import: TDataSetProvider
    DataSet = QPRICE_DATE_Import
    Left = 584
    Top = 72
  end
  object SP_IMPORT_DOC_POS: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'IMPORT_DOC_POS_V1;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 392
    Top = 120
  end
  object SP_DELETE_TMP_DOC_POS: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'DELETE_TMP_DOC_POS;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 464
    Top = 120
  end
  object QUserPrice_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CLI_TP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ' -- use NMK_EP'
      'SET NOCOUNT ON;'
      'declare @D_WORK datetime'
      'declare @ID_CLI_TP int'
      'declare @ID_VENDOR int'
      'declare @CLI_TP nvarchar(255)'
      ''
      'set @D_WORK=GetDate();'
      ''
      ' set @ID_CLI_TP=:ID_CLI_TP'
      ' -- set @ID_CLI_TP=1454'
      ''
      ''
      'declare @ID_NMK int'
      'set @ID_NMK =2729;   -- '#1053#1052#1050' ('#1082#1086#1083#1073#1072#1089#1072')'
      ''
      'declare @EPS float'
      'set @EPS=0.000001'
      ''
      'declare @SALES_CATEGOR int'
      'set @SALES_CATEGOR =2'
      'set @CLI_TP='#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39
      
        'select @CLI_TP=[CLIENT], @SALES_CATEGOR=[SALES_CATEGOR] from [db' +
        'o].[CLIENTS]'
      'where [ID_CLIENTS]=@ID_CLI_TP'
      ''
      
        'CREATE TABLE #PRICE_TP (ID_TOV int, ID_GRTOV int, ID_VENDOR int,' +
        ' PRICE1 float,  PRICE2 float, PRICE3 float,  PRICE4 float,'
      
        'PRICE7 float, PRICE8 float,  PRICE9 float, IS_ACTION int, SALES_' +
        'CATEGOR int,'
      'PRICE_UCH float,  PRICE_VENDOR float )'
      ''
      '-- '#1058#1053#1055', '#1072#1083#1082#1086#1075#1086#1083#1100
      
        'INSERT INTO #PRICE_TP (ID_TOV, ID_GRTOV, ID_VENDOR, PRICE1,  PRI' +
        'CE2, PRICE3,  PRICE4, PRICE7, PRICE8,  PRICE9, IS_ACTION, SALES_' +
        'CATEGOR, PRICE_UCH,  PRICE_VENDOR)'
      'select EVT.[ID_TOV], T.ID_GRTOV, EVT.[ID_VENDOR],'
      'ISNULL('
      '( select TOP 1 PRICE_DATE.PRICE1'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9') ,0.0 ) as PRICE_1,'
      ''
      #9' ISNULL(( select TOP 1 PRICE_DATE.PRICE2'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_2,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE3'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_3,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE4'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_4,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE7'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_7,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE8'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_8,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE9'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_9,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.IS_ACTION'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=EVT.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=EVT.[ID_VENDOR]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0) as IS_ACTION,'
      ''
      #9'@SALES_CATEGOR,'
      #9'0.0,'
      #9'0.0'
      ''
      ''
      '  from [dbo].[EXIST_VENDOR_TOV]  EVT'
      'inner join TOV T on T.ID_TOV=EVT.[ID_TOV]'
      'inner join CLIENTS CL on CL.ID_CLIENTS=EVT.[ID_VENDOR]'
      
        'where EVT.[IS_EXIST]=1 and T.IS_DELETE=0 and CL.ID_KATEGOR=45 an' +
        'd EVT.[ID_VENDOR]<>-1'
      ''
      'and  T.ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (3,5)'
      ' ) -- '#1058#1053#1055', '#1072#1083#1082#1086#1075#1086#1083#1100
      ''
      ''
      '-- '#1055#1090#1080#1094#1072', '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072'), '#1086#1074#1086#1097#1080
      
        'INSERT INTO #PRICE_TP (ID_TOV, ID_GRTOV, ID_VENDOR, PRICE1,  PRI' +
        'CE2, PRICE3,  PRICE4,   PRICE7, PRICE8,  PRICE9,'
      'IS_ACTION, SALES_CATEGOR, PRICE_UCH,  PRICE_VENDOR)'
      'select PD.[ID_TOV], T.ID_GRTOV, PD.[ID_CLI],'
      ''
      ' ISNULL('
      '( select TOP 1 PRICE_DATE.PRICE1'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9') ,0.0 ) as PRICE_1,'
      ''
      #9' ISNULL(( select TOP 1 PRICE_DATE.PRICE2'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_2,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE3'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_3,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE4'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_4,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE7'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_7,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE8'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_8,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE9'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_9,'
      ''
      ''
      #9'ISNULL(( select TOP 1 PRICE_DATE.IS_ACTION'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0) as IS_ACTION,'
      ''
      ''
      ''
      '@SALES_CATEGOR,'
      #9'0.0,'
      #9'0.0'
      #9'from PRICE_DATE PD'
      #9'inner join TOV T on T.ID_TOV=PD.[ID_TOV]'
      ''
      'where'
      
        '-- T.[ID_GRTOV] in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 27, 32' +
        ', 35, 28, 34, 26, 29, 33, 31, 30, 37,2, 16, 43)'
      '--'#9'T.[ID_GRTOV] =38'
      '(T.ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (2,4)'
      ') -- '#1084#1103#1089#1086', '#1086#1074#1086#1097#1080
      
        'or T.[ID_GRTOV] in (37, 2) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072 +
        ')'
      ')'
      
        'and PD.[IS_DELETE]=0 and T.[IS_DELETE]=0 and PD.ID_CLI=@ID_CLI_T' +
        'P'
      
        '  and not exists(  select *  from #PRICE_TP where #PRICE_TP.ID_T' +
        'OV=PD.[ID_TOV] and #PRICE_TP.ID_VENDOR=PD.[ID_CLI])'
      '  group by  PD.[ID_TOV], T.ID_GRTOV, PD.[ID_CLI]'
      ''
      ''
      ''
      '-- '#1076#1083#1103' '#1082#1086#1083#1073#1072#1089#1099' , '#1087#1072#1082#1077#1090#1086#1074
      
        'INSERT INTO #PRICE_TP (ID_TOV, ID_GRTOV, ID_VENDOR, PRICE1,  PRI' +
        'CE2, PRICE3,  PRICE4,  PRICE7, PRICE8,  PRICE9,'
      'IS_ACTION, SALES_CATEGOR, PRICE_UCH,  PRICE_VENDOR)'
      'select PD.[ID_TOV], T.ID_GRTOV, PD.[ID_CLI],'
      ''
      ' ISNULL('
      '( select TOP 1 PRICE_DATE.PRICE1'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9') ,0.0 ) as PRICE_1,'
      ''
      #9' ISNULL(( select TOP 1 PRICE_DATE.PRICE2'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_2,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE3'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_3,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE4'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_4,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE7'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_7,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE8'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_8,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE9'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_9,'
      ''
      #9'ISNULL(( select TOP 1 PRICE_DATE.IS_ACTION'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=PD.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=PD.[ID_CLI]'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0) as IS_ACTION,'
      ''
      ''
      ''
      '@SALES_CATEGOR,'
      #9'0.0,'
      #9'0.0'
      #9'from PRICE_DATE PD'
      #9'inner join TOV T on T.ID_TOV=PD.[ID_TOV]'
      ''
      'where -- '#1076#1083#1103' '#1082#1086#1083#1073#1072#1089#1099' , '#1087#1072#1082#1077#1090#1086#1074', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1072
      
        #9'-- T.[ID_GRTOV] in (40, 39,  8, 15, 5, 19, 22, 36, 24, 37,2, 44' +
        ')'
      #9'('
      #9'T.ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1,6)'
      ' ) -- '#1082#1086#1083#1073#1072#1089#1072' , '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1072
      ' or'
      'T.[ID_GRTOV] in ( 39) -- '#1087#1072#1082#1077#1090#1099
      #9')'
      #9'and PD.[IS_DELETE]=0 and T.[IS_DELETE]=0 and PD.ID_CLI=-1'
      
        '  and not exists(  select *  from #PRICE_TP where #PRICE_TP.ID_T' +
        'OV=PD.[ID_TOV] and #PRICE_TP.ID_VENDOR=PD.[ID_CLI])'
      '  group by  PD.[ID_TOV], T.ID_GRTOV, PD.[ID_CLI]'
      ''
      ''
      ''
      '-- '#1076#1083#1103' '#1076#1088#1091#1075#1080#1093
      
        'INSERT INTO #PRICE_TP (ID_TOV, ID_GRTOV, ID_VENDOR, PRICE1,  PRI' +
        'CE2, PRICE3,  PRICE4, PRICE7, PRICE8, PRICE9,'
      'IS_ACTION, SALES_CATEGOR, PRICE_UCH,  PRICE_VENDOR)'
      ''
      'SELECT T.ID_TOV, T.[ID_GRTOV],-1,'
      ''
      'ISNULL('
      '( select TOP 1 PRICE_DATE.PRICE1'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9') ,0.0 ) as PRICE_1,'
      ''
      #9' ISNULL(( select TOP 1 PRICE_DATE.PRICE2'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_2,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE3'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_3,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE4'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_4,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE7'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_7,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE8'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_8,'
      #9'ISNULL(( select TOP 1 PRICE_DATE.PRICE9'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0.0) as PRICE_9,'
      ''
      #9'ISNULL(( select TOP 1 PRICE_DATE.IS_ACTION'
      #9#9'from PRICE_DATE'
      #9#9'where PRICE_DATE.D_START<= @D_WORK'
      #9#9'and PRICE_DATE.ID_TOV=T.[ID_TOV]'
      #9#9'and PRICE_DATE.IS_DELETE=0'
      #9#9'and PRICE_DATE.ID_CLI=-1'
      #9#9'ORDER BY PRICE_DATE.D_START DESC'
      #9'),0) as IS_ACTION,'
      ''
      ''
      ''
      '@SALES_CATEGOR,'
      #9'0.0,'
      #9'0.0'
      ''
      ' from TOV T'
      
        '   where  -- T.[ID_GRTOV] in (40, 39, 38, 8, 15, 5, 19, 22, 36, ' +
        '24, 27, 32, 35, 28, 34, 26, 29, 33, 31, 30, 37,2,16, 43,44)'
      '   ( T.ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1,2,3,4,5,6)'
      ')'
      
        'or T.[ID_GRTOV] in (37, 2, 39) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088#1072#1073 +
        #1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099
      ')'
      '   and T.IS_DELETE=0 and not('
      '   exists('
      '   select * from #PRICE_TP PT where PT.ID_TOV=T.ID_TOV'
      '   )'
      '   )'
      ''
      ''
      'update #PRICE_TP set PRICE_VENDOR=PRICE1'
      ''
      '-------------------------------------------'
      
        'update #PRICE_TP set PRICE_UCH=PRICE1 from #PRICE_TP where SALES' +
        '_CATEGOR=1 and'
      
        '--not(ID_GRTOV in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 37,2, 4' +
        '4, 16))'
      ' ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (3, 4, 5) --'#1058#1053#1055', '#1086#1074#1086#1097#1080', '#1072#1083#1082#1086#1075#1086#1083#1100
      ')'
      
        'update #PRICE_TP set PRICE_UCH=PRICE2 from #PRICE_TP where SALES' +
        '_CATEGOR=2 and'
      
        '--not(ID_GRTOV in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 37,2, 4' +
        '4, 16))'
      ' ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (3, 4, 5) --'#1058#1053#1055', '#1086#1074#1086#1097#1080', '#1072#1083#1082#1086#1075#1086#1083#1100
      ')'
      
        'update #PRICE_TP set PRICE_UCH=PRICE3 from #PRICE_TP where SALES' +
        '_CATEGOR=3 and'
      
        '--not(ID_GRTOV in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 37,2, 4' +
        '4, 16))'
      ' ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (3, 4, 5) --'#1058#1053#1055', '#1086#1074#1086#1097#1080', '#1072#1083#1082#1086#1075#1086#1083#1100
      ')'
      
        'update #PRICE_TP set PRICE_UCH=PRICE4 from #PRICE_TP where SALES' +
        '_CATEGOR=4 and'
      
        '--not(ID_GRTOV in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 37,2, 4' +
        '4, 16))'
      ' ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (3, 4, 5) --'#1058#1053#1055', '#1086#1074#1086#1097#1080', '#1072#1083#1082#1086#1075#1086#1083#1100
      ')'
      ''
      'update #PRICE_TP set PRICE_UCH=PRICE2 from #PRICE_TP where'
      
        '-- ID_GRTOV in (40, 39, 38, 8, 15, 5, 19, 22, 36, 24, 37,2, 44, ' +
        '16) -- '#1076#1083#1103' '#1082#1086#1083#1073#1072#1089#1099', '#1084#1103#1089#1072' , '#1087#1072#1082#1077#1090#1086#1074', '#1086#1090#1093#1086#1076#1086#1074', '#1090#1072#1088#1099
      '( ID_GRTOV in ('
      
        ' select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1, 2, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086 +
        ','
      ')'
      
        'or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077#1088 +
        #1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099
      ')'
      ''
      ''
      '--------------------------------------'
      '---- '#1086#1089#1090#1072#1074#1080#1090#1100' '#1101#1090#1086#1090' '#1073#1083#1086#1082' '#1074#1084#1077#1089#1090#1086' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1087#1086#1089#1083#1077' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080' '#1094#1077#1085
      '--update #PRICE_TP set PRICE_UCH=IIF(SALES_CATEGOR = 1, PRICE1,'
      '--'#9#9#9#9#9#9#9#9#9'IIF(SALES_CATEGOR = 2, PRICE2,'
      '--'#9#9#9#9#9#9#9#9#9#9'IIF(SALES_CATEGOR = 3, PRICE3,'
      '--'#9#9#9#9#9#9#9#9#9#9'IIF(SALES_CATEGOR = 4, PRICE4,'
      '--'#9#9#9#9#9#9#9#9#9#9'IIF(SALES_CATEGOR = 7, PRICE7,'
      '--'#9#9#9#9#9#9#9#9#9#9'IIF(SALES_CATEGOR = 8, PRICE8, PRICE9)))))'
      ''
      '--)  from #PRICE_TP where'
      '--( ID_GRTOV in ('
      
        '-- select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wh' +
        'ere KOG.[ID_VID_OPERATION] in (1, 2, 3, 4, 5, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1089 +
        #1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086', '#1058#1053#1055', '#1086#1074#1086#1097#1080', '#1072#1083#1082#1086#1075#1086#1083#1100
      '--)'
      
        '--or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088 +
        #1077#1088#1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099
      '--)'
      '---------------------------------'
      ''
      ''
      
        'update #PRICE_TP set ID_VENDOR=@ID_NMK from #PRICE_TP where ID_V' +
        'ENDOR in (-1, @ID_CLI_TP)'
      ''
      
        'update #PRICE_TP set PRICE_VENDOR=PRICE_UCH from #PRICE_TP where' +
        ' PRICE_VENDOR<@EPS'
      ''
      
        'select p.ID_TOV , p.PRICE_UCH , p.ID_VENDOR , p.PRICE_VENDOR, p.' +
        'IS_ACTION from #PRICE_TP p'
      #9'inner join TOV T on T.ID_TOV=p.[ID_TOV]'
      '  where T.[AVAILABILITY]=1 and p.PRICE_UCH>0'
      '--where'
      '--and p.ID_GRTOV in (38)'
      '-- order by T.NAME'
      
        '--where ( select COUNT(*) from #PRICE_TP p1 where p1.ID_TOV=p.ID' +
        '_TOV) >1'
      ''
      ''
      'DROP TABLE #PRICE_TP'
      ''
      '')
    Left = 560
    Top = 128
  end
  object DataSetProvider_QUserPrice_Import: TDataSetProvider
    DataSet = QUserPrice_Import
    Left = 608
    Top = 128
  end
  object QNaklCap_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_DOC_TYPE int'
      'declare @D_DOC datetime'
      'declare @ID_TRADE_POINT int'
      ''
      'set @ID_DOC_TYPE=:ID_DOC_TYPE'
      'set @D_DOC=:D_DOC'
      'set @ID_TRADE_POINT=:ID_TRADE_POINT'
      ''
      '--set @ID_DOC_TYPE=209 -- '#1087#1088#1080#1093#1086#1076' '#1082#1086#1083#1073#1072#1089#1099
      '--set @D_DOC='#39'26.07.2021 10:00'#39
      '--set @ID_TRADE_POINT=2558 -- 602'#1084#1088
      ''
      'declare @D_FROM datetime, @D_TO datetime, @Y int, @M int, @D int'
      ''
      'set @D=DATEPART ( dd , @D_DOC )'
      'set @M=DATEPART ( mm , @D_DOC )'
      'set @Y=DATEPART ( yyyy , @D_DOC )'
      ''
      'SET @D_FROM=DATETIMEFROMPARTS (@Y, @M, @D,0,0,0,0)'
      'SET @D_TO=DATETIMEFROMPARTS (@Y, @M, @D,23,59,59,0)'
      ''
      ''
      '--declare @D_LAST_INV datetime, @ID_DT_INVENT int'
      '--set @ID_DT_INVENT=206 -- 001 POS '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103' '#1090#1086#1074#1072#1088#1086#1074
      '--set @D_LAST_INV=@D_FROM'
      ''
      '---- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090
      '--set @D_LAST_INV= isnull(('
      '--select top 1 (I_L.[DATE_INV])  from [dbo].[INVCAP] I_L'
      '-- where I_L.DATE_INV<@D_TO and I_L.[ID_DOC_TYPE]=@ID_DT_INVENT'
      '-- order by I_L.DATE_INV DESC'
      '--),@D_FROM)'
      ''
      '--SET @D_FROM = DATEADD(second,1, @D_LAST_INV)'
      ''
      ''
      'select [ID_NAKLCAP],'
      '[D],'
      '[NN],'
      '[ID_DOC_TYPE],'
      '[ID_CLIENT],'
      '[PRICE_KATEG],'
      '[TOT_SUM],'
      '[TOT_NUM],'
      '[NUM_TARA],'
      '[ID_TARA],'
      '[ID_CLI_K],'
      '[SCH_D],'
      '[SCH_K],'
      '[NDS],'
      '[STAVKA_NDS],'
      '[IS_SVERENO]'
      
        'from [dbo].[NAKLCAP] where [ID_DOC_TYPE]=@ID_DOC_TYPE and D>=@D_' +
        'FROM and D<=@D_TO and [ID_CLIENT]=@ID_TRADE_POINT and [IS_DELETE' +
        ']=0'
      '')
    Left = 752
    Top = 72
  end
  object DataSetProvider_QNaklCap_Import: TDataSetProvider
    DataSet = QNaklCap_Import
    Left = 808
    Top = 72
  end
  object QNaklTov_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_DOC_TYPE int'
      'declare @D_DOC datetime'
      'declare @ID_TRADE_POINT int'
      ''
      'set @ID_DOC_TYPE=:ID_DOC_TYPE'
      'set @D_DOC=:D_DOC'
      'set @ID_TRADE_POINT=:ID_TRADE_POINT'
      ''
      '--set @ID_DOC_TYPE=209'
      '--set @D_DOC='#39'10.09.2019 10:00'#39
      '--set @ID_TRADE_POINT=2608'
      ''
      'declare @D_FROM datetime, @D_TO datetime, @Y int, @M int, @D int'
      ''
      'set @D=DATEPART ( dd , @D_DOC )'
      'set @M=DATEPART ( mm , @D_DOC )'
      'set @Y=DATEPART ( yyyy , @D_DOC )'
      ''
      'SET @D_FROM=DATETIMEFROMPARTS (@Y, @M, @D,0,0,0,0)'
      'SET @D_TO=DATETIMEFROMPARTS (@Y, @M, @D,23,59,59,0)'
      ''
      ''
      '--declare @D_LAST_INV datetime, @ID_DT_INVENT int'
      '--set @ID_DT_INVENT=206 -- 001 POS '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103' '#1090#1086#1074#1072#1088#1086#1074
      '--set @D_LAST_INV=@D_FROM'
      ''
      '---- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090
      '--set @D_LAST_INV= isnull(('
      '--select top 1 (I_L.[DATE_INV])  from [dbo].[INVCAP] I_L'
      '-- where I_L.DATE_INV<@D_TO and I_L.[ID_DOC_TYPE]=@ID_DT_INVENT'
      '-- order by I_L.DATE_INV DESC'
      '--),@D_FROM)'
      ''
      '--SET @D_FROM = DATEADD(second,1, @D_LAST_INV)'
      ''
      ''
      ''
      ''
      
        'select NT.[ID_NAKLCAP], NT.[ID_TOV], NT.[PRICE], NT.[NUMB], NT.[' +
        'COMMENT] from [dbo].[NAKLTOV] NT'
      'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP= NT.[ID_NAKLCAP]'
      
        'where NC.[ID_DOC_TYPE]=@ID_DOC_TYPE and NC.D>=@D_FROM and NC.D<=' +
        '@D_TO'
      'and NC.[ID_CLIENT]=@ID_TRADE_POINT and NC.[IS_DELETE]=0'
      ''
      '')
    Left = 712
    Top = 128
  end
  object DataSetProvider_QNaklTov_Import: TDataSetProvider
    DataSet = QNaklTov_Import
    Left = 752
    Top = 128
  end
  object QNaveski_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D_DOC'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_DOC_TYPE int'
      'declare @D_DOC datetime'
      'declare @ID_TRADE_POINT int'
      ''
      'set @ID_DOC_TYPE=:ID_DOC_TYPE'
      'set @D_DOC=:D_DOC'
      'set @ID_TRADE_POINT=:ID_TRADE_POINT'
      ''
      '--set @ID_DOC_TYPE=209'
      '--set @D_DOC='#39'10.09.2019 10:00'#39
      '--set @ID_TRADE_POINT=2608'
      ''
      'declare @D_FROM datetime, @D_TO datetime, @Y int, @M int, @D int'
      ''
      'set @D=DATEPART ( dd , @D_DOC )'
      'set @M=DATEPART ( mm , @D_DOC )'
      'set @Y=DATEPART ( yyyy , @D_DOC )'
      ''
      'SET @D_FROM=DATETIMEFROMPARTS (@Y, @M, @D,0,0,0,0)'
      'SET @D_TO=DATETIMEFROMPARTS (@Y, @M, @D,23,59,59,0)'
      ''
      ''
      '--declare @D_LAST_INV datetime, @ID_DT_INVENT int'
      '--set @ID_DT_INVENT=206 -- 001 POS '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103' '#1090#1086#1074#1072#1088#1086#1074
      '--set @D_LAST_INV=@D_FROM'
      ''
      '---- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1080#1085#1074#1077#1085#1090
      '--set @D_LAST_INV= isnull(('
      '--select top 1 (I_L.[DATE_INV])  from [dbo].[INVCAP] I_L'
      '-- where I_L.DATE_INV<@D_TO and I_L.[ID_DOC_TYPE]=@ID_DT_INVENT'
      '-- order by I_L.DATE_INV DESC'
      '--),@D_FROM)'
      ''
      '--SET @D_FROM = DATEADD(second,1, @D_LAST_INV)'
      ''
      ''
      ''
      ''
      
        'select NV.[ID_NAKLCAP], NV.[ID_TOV], NV.[NUMB], NV.[D] from [dbo' +
        '].[NAVESKI] NV'
      'inner join [dbo].[NAKLCAP] NC on NC.ID_NAKLCAP= NV.[ID_NAKLCAP]'
      
        'where NC.[ID_DOC_TYPE]=@ID_DOC_TYPE and NC.D>=@D_FROM and NC.D<=' +
        '@D_TO and NC.[ID_CLIENT]=@ID_TRADE_POINT and NC.[IS_DELETE]=0')
    Left = 720
    Top = 176
  end
  object DataSetProvider_QNaveski_Import: TDataSetProvider
    DataSet = QNaveski_Import
    Left = 760
    Top = 184
  end
  object QSkidka_POS_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'declare @D datetime'
      'set @D=:D'
      'set @D= DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      
        'select [ID_SKIDKA], [PER_SKIDKA_KOLBASA], [PER_SKIDKA_MYASO], [P' +
        'ER_SKIDKA_TNP],'
      
        '[COMMENT], [D_FROM], [D_TO], [MIN_KOLBASA], [MIN_MYASO], [MIN_TN' +
        'P], [IS_NAMED],'
      'DAY_TIME_FROM, DAY_TIME_TO'
      ' from [dbo].[SKIDKA_POS]'
      
        'where DATEADD(dd, 0, DATEDIFF(dd, 0, [D_FROM]))<=@D and DATEADD(' +
        'dd, 0, DATEDIFF(dd, 0, [D_TO]))>=@D')
    Left = 432
    Top = 72
  end
  object DataSetProvider_QSkidka_POS_Import: TDataSetProvider
    DataSet = QSkidka_POS_Import
    Left = 464
    Top = 72
  end
  object DataSetProvider_QNewPriceTov: TDataSetProvider
    DataSet = QNewPriceTov
    Left = 800
    Top = 248
  end
  object QNewPriceTov: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '-- Use NMK_EP'
      'declare @D datetime'
      'declare @ID_TRADE_POINT int'
      ''
      'set @D=:D;'
      'set @ID_TRADE_POINT=:ID_TRADE_POINT'
      ''
      '--set @D=GETDATE();'
      '--set @ID_TRADE_POINT=2608'
      ''
      ''
      'declare @isdel int'
      'set @isdel=0;'
      ''
      ''
      ''
      'declare @D_FROM datetime, @D_TO datetime'
      ''
      'set @D_FROM= DATEADD(dd, 0, DATEDIFF(dd, 0, @D))'
      ''
      
        'set @D_TO= DATEADD(second, 59, DATEADD(minute, 59, DATEADD(hour,' +
        ' 23, @D_FROM)))'
      ''
      'declare @EPS float'
      'set @EPS=0.00000001'
      ''
      ''
      
        #9'select PD.ID_TOV, PD.PRICE2, CL.CLIENT,PD.ID_CLI  from [dbo].[P' +
        'RICE_DATE] PD'
      #9'inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=PD.ID_CLI'
      #9'where'
      
        #9#9'PD.D_START>=@D_FROM and PD.D_START<=@D_TO and PD.IS_DELETE=0 a' +
        'nd PD.PRICE2>@EPS'
      #9#9'and'
      #9#9' exists('
      
        #9#9'select * from [dbo].[EXIST_VENDOR_TOV] where [ID_VENDOR]=PD.ID' +
        '_CLI and [ID_TOV]=PD.ID_TOV and [IS_EXIST]=1)'
      ''
      #9#9'and ((CL.ID_KATEGOR=45) -- '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1080' '#1058#1053#1055' '#1085#1072' '#1058#1057
      #9#9'or (PD.ID_CLI =-1)'
      #9#9'or (PD.ID_CLI =@ID_TRADE_POINT))'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 736
    Top = 248
  end
  object DataSetProvider_ADS_CLIENTS_NEW_POS_Export: TDataSetProvider
    DataSet = ADS_CLIENTS_NEW_POS_Export
    Left = 528
    Top = 368
  end
  object ADS_CLIENTS_NEW_POS_Export: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select * from [dbo].[CLIENTS_NEW_POS]'#13#10' where [ID_TRADE_POINT]=:' +
      'ID_TRADE_POINT'#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 480
    Top = 368
  end
  object Q_Bonus_Cli: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'INN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'declare @INN nvarchar(20)'
      'set @INN = :INN'
      'SELECT'
      '      B.[SUM_BALL]'
      ''
      '  FROM [dbo].[BONUSES] B'
      '  inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=B.ID_CLI'
      
        '  where (CL.INN=@INN or CL.TEL=@INN) and CL.IS_DELETE=0  and B.[' +
        'IS_FIXED]=0')
    Left = 320
    Top = 72
  end
  object ADOCommand_UpdateBonusCli: TADOCommand
    Connection = ADOConnectionTmp
    Parameters = <>
    Left = 656
    Top = 80
  end
  object SP_SET_BONUS_CLI_POS_DETAIL: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'SET_BONUS_CLI_POS_DETAIL_V1;1'
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
        Name = '@S_KOLBASA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_MYASO'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@S_TNP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
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
        Name = '@SUM_SDACHA_TO_BONUS_CARD'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@SUM_BALL_CALC'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@SUM_BALL_NEW'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 100
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
    Left = 376
    Top = 72
  end
  object Q_Advert: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_TRADE_POIN int'
      'set @ID_TRADE_POIN=:ID_TRADE_POINT'
      
        'select ID_ADVERT, TYPE_MSG, ID_CLI, MSG from ADVERT_MSG where TY' +
        'PE_MSG in (1, 2, 4, 5)'
      'and (ID_CLI=@ID_TRADE_POIN or ID_CLI=-1)'
      'order by ID_ADVERT')
    Left = 88
    Top = 72
  end
  object DataSetProvider_Q_Advert: TDataSetProvider
    DataSet = Q_Advert
    Left = 120
    Top = 72
  end
  object DataSetProvider_Q_UserTradePoint: TDataSetProvider
    DataSet = Q_UserTradePoint
    Left = 736
    Top = 368
  end
  object Q_UserTradePoint: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select UT.ID_USER, UT.ID_TRADEPOINT, U.NAME U_NAME, U.[LOGIN]'
      '      ,U.[STATUS]'
      '      ,U.[BIRTHDAY]'
      '      ,U.[PASSW]'
      '      ,U.[IS_DELETE]'
      'from USER_TRADEPOINT UT'
      'left outer join USERS U on U.ID_USERS=UT.ID_USER'
      'where UT.ID_TRADEPOINT=:ID_TRADE_POINT'
      '')
    Left = 704
    Top = 368
  end
  object SP_RECALC_BONUS_CLI_POS: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'RECALC_BONUS_CLI_POS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 576
    Top = 432
  end
  object ADS_SHTRIH_CODE_TOV_NEW_POS: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'select * from [dbo].[SHTRIH_CODE_TOV_NEW_POS]'#13#10' where [ID_TRADE_' +
      'POINT]=:ID_TRADE_POINT'#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 680
    Top = 424
  end
  object DataSetProvider_ADS_SHTRIH_CODE_TOV_NEW_POS: TDataSetProvider
    DataSet = ADS_SHTRIH_CODE_TOV_NEW_POS
    Left = 728
    Top = 424
  end
  object DataSetProvider_Q_KIO_OPERATIONS_GRUP_Import: TDataSetProvider
    DataSet = Q_KIO_OPERATIONS_GRUP_Import
    Left = 800
    Top = 304
  end
  object Q_KIO_OPERATIONS_GRUP_Import: TADOQuery
    Connection = ADOConnectionTmp
    Parameters = <>
    SQL.Strings = (
      '-- use NMK_EP'
      
        '-- '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1086' '#1074#1080#1076#1072#1084' '#1086#1087#1077#1088#1072#1094#1080#1081' 1 '#1082#1086#1083#1073#1072#1089#1072'. 2 '#1084#1103#1089#1086'. 3 '#1058#1053#1055', 4 ' +
        #1086#1074#1086#1097#1080', 5 '#1072#1083#1082#1086#1075#1086#1083#1100', 6 '#1089#1086#1073#1089#1090#1074'. '#1087#1088'-'#1074#1086
      'select * from [dbo].[KIO_OPERATIONS_GRUP]')
    Left = 712
    Top = 304
  end
  object QPRODUCT_POS_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select [ID_PROD], [ID_TOV],'
      
        '[N_SYR_MINUS], [N_SYR_PLUS], [N_GOT_MINUS], [N_GOT_PLUS], [N_SUH' +
        '_MINUS], [N_SUH_PLUS]'
      'from [dbo].[PRODUCT_POS]')
    Left = 688
    Top = 488
  end
  object DataSetProvider_QPRODUCT_POS_Import: TDataSetProvider
    DataSet = QPRODUCT_POS_Import
    Left = 728
    Top = 488
  end
  object QNORM_ASSEMB_POS_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select [ID_NORM], [ID_PROD], [ID_TOV], [NORMA]'
      'from [dbo].[NORM_ASSEMB_POS] ')
    Left = 688
    Top = 536
  end
  object DataSetProvider_QNORM_ASSEMB_POS_Import: TDataSetProvider
    DataSet = QNORM_ASSEMB_POS_Import
    Left = 728
    Top = 536
  end
  object Q_KUPON_CARD_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[KUPON_CARD]')
    Left = 216
    Top = 72
  end
  object DataSetProvider_Q_KUPON_CARD_Import: TDataSetProvider
    DataSet = Q_KUPON_CARD_Import
    Left = 248
    Top = 72
  end
  object DataSetProvider_SVERKA_DOC_POS_Export: TDataSetProvider
    DataSet = ADS_SVERKA_DOC_POS_Export
    Left = 224
    Top = 176
  end
  object ADS_SVERKA_DOC_POS_Export: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM [SVERKA_DOC_POS] where [ID_TRADE_POINT]=:ID_TRADE_' +
      'POINT'#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 176
    Top = 176
  end
  object SP_IMPORT_SVERKA_DOC_POS: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'IMPORT_SVERKA_DOC_POS;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 520
    Top = 512
  end
  object SP_CALC_CLI_OBOROT_DOC: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'CALC_CLI_OBOROT_DOC;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sch_doc'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@id_cli_doc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@d_rep_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@d_rep_to'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DEB_N'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@KRED_N'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@deb_not_prov'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@kred_not_prov'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@DEB_K'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end
      item
        Name = '@KRED_K'
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
    Left = 316
    Top = 283
  end
  object SP_GET_CLIENT_FOR_INN: TADOStoredProc
    Connection = ADOConnectionTmp
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
    Left = 414
    Top = 276
  end
  object SP_DELETE_IMPORT_DOC_POS: TADOStoredProc
    Connection = ADOConnectionTmp
    ProcedureName = 'DELETE_IMPORT_DOC_POS;1'
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
    Left = 320
    Top = 520
  end
  object Q_RRO_CERTIFIC: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_TRADE_POINT int'
      'set @ID_TRADE_POINT= :ID_TRADE_POINT -- 8154'
      ''
      'SELECT RC.[ID_CLI]'
      '      ,RC.[CERTIFICATE]'
      '      ,RC.[PRIVATE_KEY]'
      '      ,RC.[PASSW]'
      #9'  ,RC.DATE_END_CERTIFICATE'
      'FROM [dbo].[RRO_CERTIFIC] RC'
      
        'where RC.[ID_CLI] in (select RK.[ID_CLI] from [dbo].[RRO_KASSA_T' +
        'S] RK where RK.[ID_TT]=@ID_TRADE_POINT)')
    Left = 456
    Top = 184
  end
  object DataSetProvider_Q_RRO_CERTIFIC: TDataSetProvider
    DataSet = Q_RRO_CERTIFIC
    Left = 488
    Top = 184
  end
  object Q_RRO_KASSA_TS: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_TRADE_POINT int'
      'set @ID_TRADE_POINT=:ID_TRADE_POINT --8154'
      ''
      'SELECT  RK.[ID_RRO_KASSA]'
      '      ,RK.[ID_TT]'
      '      ,RK.[ID_CLI]'
      '      ,RK.[ID_NUM_FISCAL_KASSA]'
      '      ,RK.[NAME_KASSA]'
      #9'  ,RK.[CERTIFICATE]'
      #9'  ,RK.[PRIVATE_KEY]'
      '    ,RK.[PASSW]'
      #9'  ,RK.DATE_END_CERTIFICATE'
      '  FROM [dbo].[RRO_KASSA_TS] RK'
      'where RK.[ID_TT]=@ID_TRADE_POINT')
    Left = 552
    Top = 176
  end
  object DataSetProvider_Q_RRO_KASSA_TS: TDataSetProvider
    DataSet = Q_RRO_KASSA_TS
    Left = 584
    Top = 176
  end
  object DataSetProvider_QBARCODES_Import: TDataSetProvider
    DataSet = QBARCODES_Import
    Left = 120
    Top = 552
  end
  object QBARCODES_Import: TADOQuery
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '--use NMK_EP'
      ''
      'SELECT BC.[ID_BARCODE]'
      '      ,BC.[ID_TOV]'
      '      ,BC.[BARCODE]'
      '      ,BC.[SYMBOLS_WEIGHT_OF_BARCODE]'
      '      ,BC.[WEIGHT_MULTIPLIER]'
      '  FROM [BARCODES] BC'
      '  inner join [TOV] T on T.ID_TOV=BC.ID_TOV'
      '  where  ID_GRTOV in ('
      
        #9'select KOG.[ID_GRTOV] from [dbo].[KIO_OPERATIONS_GRUP] KOG wher' +
        'e KOG.[ID_VID_OPERATION] in (1, 2, 3, 4, 5, 6) --'#1082#1086#1083#1073', '#1084#1103#1089#1086', '#1058#1053#1055 +
        ', '#1072#1083#1082#1086#1075#1086#1083#1100', '#1089#1086#1073#1089#1090#1074' '#1087#1088'-'#1074#1086','
      #9')'
      
        #9'or [ID_GRTOV] in (37, 2, 39, 16) --  '#1086#1090#1093#1086#1076#1099', '#1084#1072#1090#1077#1088#1080#1072#1083#1099'('#1087#1088#1086#1084#1087#1077#1088#1077 +
        #1088#1072#1073#1086#1090#1082#1072'), '#1087#1072#1082#1077#1090#1099#9', '#1090#1072#1088#1099)
    Left = 88
    Top = 552
  end
  object ADS_CONST_VALUES_TP_EXPORT: TADODataSet
    Connection = ADOConnectionTmp
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM [CONST_VALUES_TRADE_POINTS] where [ID_TP]=:ID_TRAD' +
      'E_POINT'#13#10
    Parameters = <
      item
        Name = 'ID_TRADE_POINT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 288
    Top = 168
  end
  object DataSetProvider_ADS_CONST_VALUES_TP_EXPORT: TDataSetProvider
    DataSet = ADS_CONST_VALUES_TP_EXPORT
    Left = 336
    Top = 168
  end
end
