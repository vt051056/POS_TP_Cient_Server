unit F_new_shtrih_code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_NewStrihCode = class(TForm)
    Panel4: TPanel;
    L_NameTov: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    E_sc: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BBCreate_ShtrihCode: TBitBtn;
    Label2: TLabel;
    E_SYMBOLS_WEIGHT_OF_BARCODE: TEdit;
    Label3: TLabel;
    E_WEIGHT_MULTIPLIER: TEdit;
    procedure BBCreate_ShtrihCodeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E_SYMBOLS_WEIGHT_OF_BARCODEExit(Sender: TObject);
    procedure E_WEIGHT_MULTIPLIERExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idtov:longint;
    sc:String;
    SYMBOLS_WEIGHT_OF_BARCODE:integer;
    WEIGHT_MULTIPLIER:extended;

  end;

var
  F_NewStrihCode: TF_NewStrihCode;

  function  F_NewStrihCodeDlg(nametov:string; v_idTov:longint; var v_sc:string;
var vSYMBOLS_WEIGHT_OF_BARCODE:integer; var vWEIGHT_MULTIPLIER:extended):integer;

implementation

{$R *.dfm}
uses Codage_CB;


function  F_NewStrihCodeDlg(nametov:string; v_idTov:longint; var v_sc:string;
var vSYMBOLS_WEIGHT_OF_BARCODE:integer; var vWEIGHT_MULTIPLIER:extended):integer;
begin
 F_NewStrihCode:=TF_NewStrihCode.Create(Application);
 with F_NewStrihCode do
 begin
  try
    L_NameTov.Caption:=nametov;
    idtov:=v_idTov;
    E_sc.Text:= v_sc;
    SYMBOLS_WEIGHT_OF_BARCODE := vSYMBOLS_WEIGHT_OF_BARCODE;
    WEIGHT_MULTIPLIER := vWEIGHT_MULTIPLIER;
    E_SYMBOLS_WEIGHT_OF_BARCODE.Text:=IntToStr(SYMBOLS_WEIGHT_OF_BARCODE);
    E_WEIGHT_MULTIPLIER.Text  := FloatToStr(WEIGHT_MULTIPLIER);
    
    result:=ShowModal;
    if result=mrOk then
    begin
      v_sc:=E_sc.Text;
      vSYMBOLS_WEIGHT_OF_BARCODE:=SYMBOLS_WEIGHT_OF_BARCODE;
      vWEIGHT_MULTIPLIER := WEIGHT_MULTIPLIER
    end;

  finally
   Free;
   F_NewStrihCode:=Nil;
  end;
 end;
end;



procedure TF_NewStrihCode.BBCreate_ShtrihCodeClick(Sender: TObject);
var s:string;
begin
 s:=IntToStr(idTov);
 if Length(s)>12 then
 begin
  MessageDlg('Длина внутреннего кода товара более 12 знаков. Сгенерировать штрих-код невозможно!',
   mtError, [mbOk], 0);
  Exit;
 end;

 E_sc.Text:=calc_CodeEAN13(s);

end;

procedure TF_NewStrihCode.E_SYMBOLS_WEIGHT_OF_BARCODEExit(Sender: TObject);
begin
  try
    SYMBOLS_WEIGHT_OF_BARCODE:=StrToInt(E_SYMBOLS_WEIGHT_OF_BARCODE.Text)  
  except
    MessageDlg('Кол-во символов веса не число!', mtError, [mbOk], 0);  
    E_SYMBOLS_WEIGHT_OF_BARCODE.SetFocus;
  end;
end;



procedure TF_NewStrihCode.E_WEIGHT_MULTIPLIERExit(Sender: TObject);
begin
  try
    WEIGHT_MULTIPLIER:=StrToFloat(E_WEIGHT_MULTIPLIER.Text)  
  except
    MessageDlg('Множитель пересчета в учетые ед.измерения не число!', mtError, [mbOk], 0);  
    E_WEIGHT_MULTIPLIER.SetFocus;
  end;
end;

procedure TF_NewStrihCode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modalResult=mrOk then
  begin
    try

      CanClose:=True;
    except

      CanClose:=False;
    end;
  end;
end;

end.
