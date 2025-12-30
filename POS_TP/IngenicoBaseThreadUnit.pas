unit IngenicoBaseThreadUnit;

interface

uses
  System.Classes,
  System.SysUtils,
  IngenicoBaseDeviceUnit, IngenicoOperation;

type
  TIngenicoBaseThread = class(TThread)

  private
    FOwner: TComponent;
    FConnParams: TIngenicoConnParams;
    FOperation: TIngenicoOperation;
    FLocalState: TIngenicoState;
    FLogFileSuffix: string;
  protected
    procedure UpdateState;
    procedure ConfirmOperation;
    function GetLogFileName: string;

    property ConnParams: TIngenicoConnParams read FConnParams;
    property Operation: TIngenicoOperation read FOperation;
    property LocalState: TIngenicoState read FLocalState write FLocalState;
    property LogFileSuffix: string read FLogFileSuffix write FLogFileSuffix;
  public
    constructor Create(aOwner: TComponent; aConnParams: TIngenicoConnParams; aOperation: TIngenicoOperation);
  end;

implementation
uses UsaleDoc;

{ TIngenicoBaseThread }

constructor TIngenicoBaseThread.Create(aOwner: TComponent; aConnParams: TIngenicoConnParams; aOperation: TIngenicoOperation);
begin
  FOwner := aOwner;
  FLocalState := TIngenicoState.Create;
  FConnParams := aConnParams;
  FOperation := aOperation;
  FLogFileSuffix := '';
  inherited Create(False);
  FreeOnTerminate := False;
end;

function TIngenicoBaseThread.GetLogFileName: string;
begin
  Result := 'Ingenico' + LogFileSuffix;
  if Operation.Recno <> 0 then
    Result := Result + '_' + IntToStr(Operation.Recno) + '.log';
end;

procedure TIngenicoBaseThread.UpdateState;
var
  I: IIngenicoBase;
begin
  if Supports(FOwner, IIngenicoBase, I) then
    I.ElevateState(FLocalState);
  F_SaleDoc.Memo1.Lines.Add(LocalState.StateText);
end;



procedure TIngenicoBaseThread.ConfirmOperation;
var
  I: IIngenicoBase;
begin
  if Supports(FOwner, IIngenicoBase, I) then
    I.ElevateOperation(FOperation);
  F_SaleDoc.Memo1.Lines.Add(LocalState.StateText);
end;

end.
