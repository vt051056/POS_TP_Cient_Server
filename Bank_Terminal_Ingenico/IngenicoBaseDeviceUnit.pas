unit IngenicoBaseDeviceUnit;

interface

uses
  System.Classes,
  IngenicoOperation;

type
  TIngenicoState = class
    StateText: string;
    Error: boolean;
    ErrCode: integer;
    ErrMessage: string;
  public
    procedure Clear;
    procedure SetError(aErrCode: integer; aErrMessage: string);
  end;

  TIngenicoConnParams = class
  private
    FPortNumber: integer;
    FPortSpeed: integer;
    FProtocolVersion: integer;
  public
    property PortNumber: integer read FPortNumber;
    property PortSpeed: integer read FPortSpeed;
    constructor Create(aPortNumber: integer; aPortSpeed: integer);

  end;

  TIngenicoStateUpdateEvent = procedure(Sender: TObject; aState: TIngenicoState) of object;
  TIngenicoConfirmOperationEvent = procedure(Sender: TObject; aOperation: TIngenicoOperation) of object;
  TIngenicoErrorOperationEvent = procedure(Sender: TObject; aOperation: TIngenicoOperation) of object;

  IIngenicoBase = interface
    ['{E54FA9F9-E321-4D6E-82FB-B96E084DE7A0}']
    procedure ElevateState(aState: TIngenicoState);
    procedure ElevateOperation(aOperation: TIngenicoOperation);
  end;

  TIngenicoBaseDevice = class(TComponent, IIngenicoBase)
  private
    FParams: TIngenicoConnParams;
    FOnStateChanged: TIngenicoStateUpdateEvent;
    FWorkState: TIngenicoState;
    FOnConfirmOperation: TIngenicoConfirmOperationEvent;
    FOnErrorOperation: TIngenicoErrorOperationEvent;
    FBankID: integer;
    FUseRemoteDevice: boolean;
    FLogLevel :integer;
    FDlgOwner: TComponent;
  protected
    procedure LoadParams;
  public
    constructor Create(aOwner: TComponent);
    class function LoadAtStart: boolean;

    procedure StartPayment(o: TIngenicoOperation); virtual; abstract;
    procedure StartRefund(o: TIngenicoOperation); virtual; abstract;
    procedure StartPIN(o: TIngenicoOperation); virtual; abstract;
    procedure ElevateState(aState: TIngenicoState);
    procedure ElevateOperation(aOperation: TIngenicoOperation);

    property Params: TIngenicoConnParams read FParams;
    property BankID: integer read FBankID write FBankID;
    property OnStateChanged: TIngenicoStateUpdateEvent read FOnStateChanged write FOnStateChanged;
    property OnConfirmOperation: TIngenicoConfirmOperationEvent read FOnConfirmOperation write FOnConfirmOperation;
    property OnErrorOperation: TIngenicoErrorOperationEvent read FOnErrorOperation write FOnErrorOperation;
    property State: TIngenicoState read FWorkState;
    property UseRemoteDevice: boolean read FUseRemoteDevice write FUseRemoteDevice;
    property LogLevel: integer read FLogLevel write FLogLevel;
    property DlgOwner: TComponent read FDlgOwner write FDlgOwner;

  end;

implementation

uses
  System.SysUtils,
  VCL.Forms,
  Dialogs,
  IniFiles;

{ TIngenicoBaseDevice }

procedure TIngenicoBaseDevice.ElevateOperation(aOperation: TIngenicoOperation);
begin
  if Assigned(FOnConfirmOperation) then
    FOnConfirmOperation(Self, aOperation);
end;

constructor TIngenicoBaseDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  LoadParams;
  FWorkState := TIngenicoState.Create;
  FUseRemoteDevice := False;
end;

class function TIngenicoBaseDevice.LoadAtStart: boolean;
begin
  Result := True;
end;

procedure TIngenicoBaseDevice.LoadParams;
const
  INGENICO_INI_SECTION = 'Ingenico5100';
  INGENICO_DEFAULT_PAN_TIMEOUT_SEC = 120;
  INGENICO_DEFAULT_PROCESSING_TIMEOUT_SEC = 300;
var
  i: TIniFile;
  ifn: string;
begin
  ifn := ExtractFilePath(Application.ExeName) + 'ingenico.ini';
  i := TIniFile.Create(ifn);
  try
  if not FileExists(ifn)then
  begin
    i.WriteInteger(INGENICO_INI_SECTION, 'PortNumber', 1);
    i.WriteInteger(INGENICO_INI_SECTION, 'PortSpeed', 9600);
    i.WriteInteger(INGENICO_INI_SECTION, 'BankID', 0);
    i.WriteInteger(INGENICO_INI_SECTION, 'LogLevel', 0);
    FParams := TIngenicoConnParams.Create(1,  9600);
    FBankID := 0;
    FLogLevel := 0;
  end
  else
  begin
    FParams := TIngenicoConnParams.Create(i.ReadInteger(INGENICO_INI_SECTION, 'PortNumber', 1), i.ReadInteger(INGENICO_INI_SECTION, 'PortSpeed', 9600));
    FBankID := i.ReadInteger(INGENICO_INI_SECTION, 'BankID', 0);
    FLogLevel := i.ReadInteger(INGENICO_INI_SECTION, 'LogLevel', 0);
  end;

  finally
    FreeAndNil(i);
  end;
end;

procedure TIngenicoBaseDevice.ElevateState(aState: TIngenicoState);
begin
  FWorkState.StateText := aState.StateText;
  FWorkState.Error := aState.Error;
  FWorkState.ErrCode := aState.ErrCode;
  FWorkState.ErrMessage := aState.ErrMessage;
  if Assigned(FOnStateChanged) then
    FOnStateChanged(Self, aState);
end;

{ TIngenicoParams }

constructor TIngenicoConnParams.Create(aPortNumber, aPortSpeed: integer);
begin
  FPortNumber := aPortNumber;
  FPortSpeed := aPortSpeed;
end;

{ TIngenicoState }

procedure TIngenicoState.Clear;
begin
  StateText := '';
  Error := False;
  ErrCode := 0;
  ErrMessage := ''
end;

procedure TIngenicoState.SetError(aErrCode: integer; aErrMessage: string);
begin
  Error := True;
  ErrCode := aErrCode;
  ErrMessage := aErrMessage;
end;

end.
