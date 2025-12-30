unit IngenicoBPOSRetThreadUnit;

interface

uses
  IngenicoBaseThreadUnit;

type
  TIngenicoBPOSRetThread = class(TIngenicoBaseThread)
  protected
    procedure Execute(); override;
  end;

implementation

uses
  System.SysUtils,
  WinAPI.ActiveX,
  ECRCommXLib_TLB;

type
  TProtocolStatus = (itsWaitingPAN, itsWaitingRequest, itsWaitingAckNak, itsWaitingResponse);

  { TIngenicoBPOSPayThread }

procedure TIngenicoBPOSRetThread.Execute;
var
  lTerminal: IBPOS1Lib;
  lDeviceState: Byte;
  lProtoState: TProtocolStatus;
  lStoped: boolean;

  procedure WaitResponse;
  var
    Res: boolean;
    PAN: String;
    EntryMode: String;
    LastStMsCode: Integer;
  begin
    LastStMsCode := 0;

    While lTerminal.Get_LastResult = 2 do
    begin
      If (lTerminal.LastStatMsgCode <> 0) and (lTerminal.LastStatMsgCode <> LastStMsCode) then
        // HAS POS status progress message, we can display it on the ECR
        // POS can sent multiple status messages as (CardReaded , PIN Required, Host Auth
        LastStMsCode := lTerminal.LastStatMsgCode;

      { If LastStMsCode = 11 Then
        PAN = lTerminal.PAN;
        EntryMode = lTerminal.EntryMode;
        lTerminal.CorrectTransaction(Amount, AddAmount) End If
        End If }
    end;
  end;

begin
  CoInitializeEx(Nil, COINIT_MULTITHREADED);
  lTerminal := CoBPOS1Lib.Create;
  try
    lStoped := False;
    LocalState.clear;
    if Operation.LogLevel > 0 then
    begin
      LogFileSuffix := 'Ref';
      lTerminal.useLogging(Operation.LogLevel, GetLogFileName);
    end;
    lTerminal.CommClose;
    lTerminal.SetErrorLang(1);
    lTerminal.CommOpen(ConnParams.PortNumber, ConnParams.PortSpeed);
    LocalState.StateText := 'Инициализирован';
    Synchronize(UpdateState);

    Sleep(100);
    lTerminal.Cancel();
    Sleep(2000);

    LocalState.StateText := 'Платим...';
    Synchronize(UpdateState);
    lTerminal.Refund(StrToInt(FormatFloat('000000000000', Operation.Amount * 100)), 0, 1, Operation.TransactionID);

    lDeviceState := lTerminal.Get_LastStatMsgCode;

    lProtoState := itsWaitingPAN;
    // SetStatus(itsWaitingPAN, lState);

    while not lStoped do
    begin
      case lProtoState of
        itsWaitingPAN:
          begin
            // if IsTimeoutExpired(_panTimeout) then
            // begin

            lDeviceState := lTerminal.Get_LastStatMsgCode;
            LocalState.StateText := 'Ждем карту...';
            Synchronize(UpdateState);

            // SetStatus(itsWaitingPAN, lDeviceState, False);
            lProtoState := itsWaitingPAN;
            if (lDeviceState = 3) // authorization in progress
              or (lDeviceState = 4) // waiting for cashier action
              or (lDeviceState = 5) // printing receipt
              or (lDeviceState = 10) // in progress
              or (lDeviceState = 11) // correct transaction
            then
            begin
              // SetStatus(itsWaitingRequest, lDeviceState);
              lProtoState := itsWaitingRequest;
              LocalState.StateText := 'Формируем запрос..';
              Synchronize(UpdateState);
              // SetStatus(itsWaitingResponse, lDeviceState);
              lProtoState := itsWaitingResponse;

              continue;
            end;

            if lTerminal.Get_LastResult <> 2 then
            begin
              lDeviceState := lTerminal.Get_LastStatMsgCode;
              // SetStatus(itsWaitingAckNak, lDeviceState);
              lProtoState := itsWaitingAckNak;
              continue;
            end;
          end;
        itsWaitingResponse:
          begin
            // if IsTimeoutExpired(_panTimeout) then
            // begin
            // end;
            if lTerminal.Get_LastResult = 2 then
            begin
              // in processing
            end
            else
            begin
              lDeviceState := lTerminal.Get_LastStatMsgCode;
              // SetStatus(itsWaitingAckNak, lDeviceState);
              lProtoState := itsWaitingAckNak;
              LocalState.StateText := 'Ожидаем ответ..';
              Synchronize(UpdateState);
              continue;
            end;
          end;
        itsWaitingAckNak:
          begin
            if lTerminal.Get_LastResult = 1 then
            begin
              LocalState.SetError(lTerminal.Get_LastErrorCode, lTerminal.Get_LastErrorDescription);
              Synchronize(UpdateState);
              lStoped := True;
            end
            else if lTerminal.Get_LastResult = 0 then
            begin
              LocalState.StateText := 'Оплата подтверждена..';
              Synchronize(UpdateState);
              Operation.ResponseCode := FormatFloat('00', lTerminal.Get_ResponseCode);
              Operation.PAN := lTerminal.Get_pan;
              Operation.AutorizationCode := lTerminal.Get_AuthCode;
              Operation.CardName := lTerminal.Get_IssuerName;
              Operation.TransactionID := lTerminal.rrn;
              Operation.EmitentBankFlag := False;
              lTerminal.Confirm;
              // Check if confirmation is received
              WaitResponse;
              // Get formatted receipt into a one buffer
              If lTerminal.Get_LastResult = 0 then
              begin
                lTerminal.ReqCurrReceipt;
                // Check if ReqCurrReceipt is sent mErr = WaitResponse(Terminal)
                WaitResponse;
                If lTerminal.Get_LastResult = 0 then
                  Operation.Slip_Text := lTerminal.Get_Receipt;
              end;
              lTerminal.ReqCurrReceipt;

              Synchronize(ConfirmOperation);
              lStoped := True;
            end;
          end;
      end;
      Sleep(100);

    end;

    if lStoped then
    begin
      lTerminal.Cancel();
      while lTerminal.Get_LastResult = 2 do
      begin
        Sleep(50);
      end;
    end
    else
      while lTerminal.Get_LastResult = 2 do
        Sleep(100);
  finally
    Sleep(100);
    lTerminal.CommClose;
    Sleep(100);
    if Operation.LogLevel > 0 then
      lTerminal.useLogging(Operation.LogLevel, 'Ingenico.log');
    lTerminal := nil;
    CoUninitialize();
  end;

end;

end.
