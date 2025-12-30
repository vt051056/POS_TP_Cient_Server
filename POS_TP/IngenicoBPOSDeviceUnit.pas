unit IngenicoBPOSDeviceUnit;

interface

uses
  IngenicoBaseDeviceUnit, IngenicoOperation;

type
  TIngenicoBPOSDevice = class(TIngenicoBaseDevice)

  public
    procedure StartPayment(o: TIngenicoOperation); override;
    procedure StartRefund(o: TIngenicoOperation); override;
    procedure StartPIN(o: TIngenicoOperation); override;
  end;

implementation

uses
  System.SysUtils,
  IngenicoBaseThreadUnit,
  IngenicoBPOSPayThreadUnit, IngenicoBPOSRetThreadUnit, IngenicoBPOSPinThreadUnit;

{ TIngenicoBPOSDevice }

procedure TIngenicoBPOSDevice.StartPayment(o: TIngenicoOperation);
var
  Th: TIngenicoBaseThread;
begin
  Th := TIngenicoBPOSPayThread.Create(Self, Params, o);
  try
    Th.WaitFor;
  finally
    Th.Free;
  end;
  if State.Error then
    raise Exception.Create(State.ErrMessage);
end;

procedure TIngenicoBPOSDevice.StartPIN(o: TIngenicoOperation);
var
  Th: TIngenicoBaseThread;
begin
  Th := TIngenicoBPOSPinThread.Create(Self, Params, o);
  try
    Th.WaitFor;
  finally
    Th.Free;
  end;
  if State.Error then
    raise Exception.Create(State.ErrMessage);
end;

procedure TIngenicoBPOSDevice.StartRefund(o: TIngenicoOperation);
var
  Th: TIngenicoBaseThread;
begin
  Th := TIngenicoBPOSRetThread.Create(Self, Params, o);
  try
    Th.WaitFor;
  finally
    Th.Free;
  end;
  if State.Error then
    raise Exception.Create(State.ErrMessage);

end;

end.
