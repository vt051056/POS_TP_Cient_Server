unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    E_Amount: TEdit;
    Label1: TLabel;
    RG_FuncTerminal: TRadioGroup;
    BExecute_Function: TButton;
    procedure BExecute_FunctionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pay;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses IngenicoBPOSDeviceUnit, IngenicoOperation;

procedure TForm1.Pay;
var vIngenicoBPOSDevice:TIngenicoBPOSDevice;
  vIngenicoOperation:TIngenicoOperation;
begin
  vIngenicoOperation := TIngenicoOperation.Create;
  with vIngenicoOperation do
  begin
    Recno:=1;
    Operation:=iotPay;
    TerminalID:='';
    Amount:=1.20;
    ResponseCode:='';
    PAN:='';
    AutorizationCode:='';
    CardName:='';
    BankID:=0;
    TransactionID:='';
    Slip_Text:='';
    EmitentBankFlag:=false;
    PIN:='';
    SignVerif:=0;


    UseRemoteDevice:= false;
    LogLevel:=1;
    end;
  vIngenicoBPOSDevice := TIngenicoBPOSDevice.Create(self);
  try
    vIngenicoBPOSDevice.StartPayment(vIngenicoOperation);
  finally
    vIngenicoBPOSDevice.Free;
  end;

end;

procedure TForm1.BExecute_FunctionClick(Sender: TObject);
begin
  case RG_FuncTerminal.ItemIndex of
  0:  // оплата покупки
    begin
     Pay;
    end;
  1:  // возврат покупки
    begin
      ;
    end;
  2:  // отмена покупки
    begin
      ;
    end;
  end;
end;

end.
