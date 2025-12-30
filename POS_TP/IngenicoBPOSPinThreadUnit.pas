unit IngenicoBPOSPinThreadUnit;

interface

uses
  IngenicoBaseThreadUnit;

type
  TIngenicoBPOSPinThread = class(TIngenicoBaseThread)
  protected
    procedure Execute(); override;
  end;

implementation

uses
  System.Variants,
  SysUtils, Windows, ECRCommXLib_TLB, ActiveX;

type
  TProtocolStatus = (itsWaitingPIN, itsWaitingAckNak);

  { TIngenicoBPOSPinThread }

procedure TIngenicoBPOSPinThread.Execute;
var
  lTerminal: IBPOS1Lib;
  lDeviceState: Byte;
  lProtoState: TProtocolStatus;
  lStoped: boolean;
  sScritText: WideString;

  procedure WaitResponse;
  var
    Res: boolean;
    PAN: String;
    EntryMode: String;
    LastStMsCode: Integer;
  begin
    LastStMsCode := 0;

    while lTerminal.Get_LastResult = 2 do
    begin
      If (lTerminal.LastStatMsgCode <> 0) and (lTerminal.LastStatMsgCode <> LastStMsCode) then
        // HAS POS status progress message, we can display it on the ECR
        // POS can sent multiple status messages as (CardReaded , PIN Required, Host Auth
        LastStMsCode := lTerminal.LastStatMsgCode;
    end;
  end;

begin
  CoInitializeEx(Nil, COINIT_MULTITHREADED);
  lTerminal := CoBPOS1Lib.Create;
  try
    lStoped := False;
    LocalState.Clear;
    if Operation.LogLevel > 0 then
    begin
      LogFileSuffix := 'Pin';
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

    lDeviceState := lTerminal.Get_LastStatMsgCode;

    lProtoState := itsWaitingPIN;
    LocalState.StateText := 'Запрос Пин-кода...';
    Synchronize(UpdateState);

    sScritText := '<ActionScenarioRequest> <Action>GetPinBonusCard</Action> ' //
      + ' <Prompt> <Line txt="Введіть PIN:" fnt="B" align="C"/> </Prompt> ' //
      + ' <Timeout>20000</Timeout> </ActionScenarioRequest>';
    lTerminal.StartScenario(2, sScritText);

    while not lStoped do
    begin
      case lProtoState of
        itsWaitingPIN:
          begin
            Operation.PIN := lTerminal.Get_ScenarioData;
            if lTerminal.Get_LastResult <> 2 then
            begin
              lDeviceState := lTerminal.Get_LastStatMsgCode;
              lProtoState := itsWaitingAckNak;
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
              LocalState.StateText := 'PIN Получен..';
              Synchronize(UpdateState);
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
    lTerminal:= nil;
    CoUninitialize();
  end;

end;

end.
