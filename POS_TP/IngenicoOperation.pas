unit IngenicoOperation;

interface

//uses
//  gdInterface;

type
  TIngenicoOperationType = (iotUndefined, iotPay, iotRefund, iotPin);

  TIngenicoOperation = class
    Recno: integer;
    Operation: TIngenicoOperationType;
    TerminalID: string;
    Amount: Currency;
    ResponseCode: string;
    PAN: string;
    AutorizationCode: string;
    CardName: string;
    BankID: Integer;
    TransactionID: string;
    Slip_Text: string;
    EmitentBankFlag: boolean;
    PIN: string;
    SignVerif: byte;

    UseRemoteDevice: boolean;
    LogLevel: Integer;

  end;

implementation

end.
