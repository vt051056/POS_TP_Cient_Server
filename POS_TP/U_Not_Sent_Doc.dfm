object F_Not_Sent_Doc: TF_Not_Sent_Doc
  Left = 0
  Top = 0
  Caption = #1053#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1085#1072' '#1089#1077#1088#1074#1077#1088
  ClientHeight = 395
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 335
      Top = 18
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 5
      Width = 96
      Height = 25
      DataSource = F_main.DS_Q_Not_Sent_Docs
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 120
      Top = 6
      Width = 209
      Height = 53
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1089#1077#1088#1074#1077#1088
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 656
      Top = 6
      Width = 75
      Height = 53
      Caption = #1057#1073#1088#1086#1089
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
    end
    object BB_SetFilter: TBitBtn
      Left = 553
      Top = 6
      Width = 97
      Height = 25
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 3
      OnClick = BB_SetFilterClick
    end
    object E_Filter_str: TEdit
      Left = 335
      Top = 37
      Width = 212
      Height = 21
      TabOrder = 4
      Text = 'E_Filter_str'
    end
    object BB_UnSetFilter: TBitBtn
      Left = 553
      Top = 34
      Width = 97
      Height = 25
      Caption = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088
      TabOrder = 5
      OnClick = BB_UnSetFilterClick
    end
    object BB_Set_Is_Export_gezwungen: TBitBtn
      Left = 8
      Top = 36
      Width = 27
      Height = 25
      Hint = #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1089#1090#1080
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = BB_Set_Is_Export_gezwungenClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 743
    Height = 330
    Align = alClient
    DataSource = F_main.DS_Q_Not_Sent_Docs
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
  end
  object Command_Set_Is_Export_gezwungen: TADOCommand
    CommandText = 
      '--use NMK_TP'#13#10'declare @ID_DOC_TYPE int, @D_FROM datetime, @D_TO ' +
      'datetime'#13#10'set @ID_DOC_TYPE=:ID_DOC_TYPE'#13#10'set @D_FROM=:D_FROM'#13#10'se' +
      't @D_TO=:D_TO'#13#10'update NC set NC.IS_EXPORT=1 from NAKLCAP NC wher' +
      'e NC.IS_DELETE=0 '#13#10'and NC.IS_EXPORT=0 and NC.ID_DOC_TYPE=@ID_DOC' +
      '_TYPE and NC.D>=@D_FROM and NC.D<=@D_TO'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
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
      end>
    Left = 139
    Top = 106
  end
end
