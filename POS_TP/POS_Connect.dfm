object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 359
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 359
    Align = alClient
    TabOrder = 0
    object Price_Lbl: TLabel
      Left = 232
      Top = 109
      Width = 42
      Height = 13
      Caption = 'Price_Lbl'
    end
    object Bonus_Lbl: TLabel
      Left = 424
      Top = 53
      Width = 48
      Height = 13
      Caption = 'Bonus_Lbl'
    end
    object SaleValue_Lbl: TLabel
      Left = 424
      Top = 109
      Width = 65
      Height = 13
      Caption = 'SaleValue_Lbl'
    end
    object Count_Lbl: TLabel
      Left = 72
      Top = 109
      Width = 48
      Height = 13
      Caption = 'Count_Lbl'
    end
    object IDTov_Lbl: TLabel
      Left = 72
      Top = 53
      Width = 48
      Height = 13
      Caption = 'IDTov_Lbl'
    end
    object Cash_Lbl: TLabel
      Left = 80
      Top = 173
      Width = 43
      Height = 13
      Caption = 'Cash_Lbl'
    end
    object Krip_Error: TLabel
      Left = 432
      Top = 168
      Width = 48
      Height = 13
      Caption = 'Krip_Error'
    end
    object TovName_Lbl: TLabel
      Left = 232
      Top = 48
      Width = 64
      Height = 13
      Caption = 'TovName_Lbl'
    end
    object Button1: TButton
      Left = 304
      Top = 232
      Width = 75
      Height = 25
      Caption = #1055#1088#1086#1076#1072#1078#1072
      TabOrder = 0
      OnClick = Button1Click
    end
    object Price_Edit: TEdit
      Left = 232
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '25.00'
    end
    object Bonus_Edit: TEdit
      Left = 424
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Count_Edit: TEdit
      Left = 72
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '1.750'
    end
    object IDTov_Edit: TEdit
      Left = 72
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object SaleValue_Edit: TEdit
      Left = 424
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Cash_Edit: TEdit
      Left = 72
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 6
      Text = '850.50'
    end
    object KripError_Edit: TEdit
      Left = 424
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object TovName_Edit: TEdit
      Left = 232
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object VoidCheck: TButton
      Left = 424
      Top = 232
      Width = 121
      Height = 25
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1095#1077#1082
      TabOrder = 9
      OnClick = VoidCheckClick
    end
    object OpenCheck_Btn: TButton
      Left = 72
      Top = 232
      Width = 75
      Height = 25
      Caption = 'OpenCheck'
      TabOrder = 10
      OnClick = OpenCheck_BtnClick
    end
    object AddProduct: TButton
      Left = 199
      Top = 232
      Width = 75
      Height = 25
      Caption = 'AddProduct'
      TabOrder = 11
      OnClick = AddProductClick
    end
  end
end
