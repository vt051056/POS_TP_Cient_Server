object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 336
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 128
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 187
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 56
    Top = 120
    Width = 385
    Height = 193
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 496
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 232
    Top = 24
    Width = 187
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_EP;Data Source=C-17\MSSQLSRV17'
    Provider = 'SQLOLEDB.1'
    Left = 480
    Top = 24
  end
  object ADO_TERMINAL_RESP: TADOTable
    Connection = ADOConnection1
    TableName = 'TERMINAL_RESP'
    Left = 520
    Top = 80
  end
end
