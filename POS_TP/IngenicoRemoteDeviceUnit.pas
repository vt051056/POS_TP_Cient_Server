unit IngenicoRemoteDeviceUnit;

interface

uses
  System.Classes, System.UITypes,
  IngenicoBaseDeviceUnit, IngenicoOperation;

type
  TIngenicoRemoteDevice = class(TIngenicoBaseDevice)
  public
    constructor Create(aOwner: TComponent);
    procedure StartPayment(o: TIngenicoOperation); override;
  end;

implementation

uses
  System.SysUtils,
  Dialogs, Forms,
  CashECardCommonUnit;

{ TIngenicoRemoteDevice }

constructor TIngenicoRemoteDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  UseRemoteDevice := True;
end;

procedure TIngenicoRemoteDevice.StartPayment(o: TIngenicoOperation);
var
  dlg_class: TCashECardCommonClass;
  dlg: TCashECardCommonForm;

  dlg_result: Integer;
begin
  dlg_class := TCashECardCommonClass(GetClass('TCashECardSelfForm' { ECardSavePaymentClass } ));
  if not Assigned(dlg_class) then
    raise Exception.Create('Error: Class undefined (' + 'TCashECardSelfForm' { ECardSavePaymentClass } + ')');

  dlg := dlg_class.Create(DlgOwner);
  try
    dlg.SetOwner(TForm(DlgOwner));
    dlg.CreateButtons;
    dlg.Summa := o.Amount;
    dlg_result := dlg.ShowModal;

    if dlg_result = mrOk then
    begin
      o.Amount := dlg.Summa;
      o.PAN := dlg.PAN;
      o.AutorizationCode := dlg.AuthCode;
      if Assigned(OnConfirmOperation) then
        OnConfirmOperation(Self, o);
    end;
  finally
    FreeAndNil(dlg);
  end;
end;

end.
