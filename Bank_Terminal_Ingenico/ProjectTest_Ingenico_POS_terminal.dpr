program ProjectTest_Ingenico_POS_terminal;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IngenicoBaseThreadUnit in 'IngenicoBaseThreadUnit.pas',
  IngenicoBPOSPayThreadUnit in 'IngenicoBPOSPayThreadUnit.pas',
  IngenicoBPOSPinThreadUnit in 'IngenicoBPOSPinThreadUnit.pas',
  IngenicoBPOSRetThreadUnit in 'IngenicoBPOSRetThreadUnit.pas',
  ECRCommXLib_TLB in 'ECRCommXLib_TLB.pas',
  IngenicoBaseDeviceUnit in 'IngenicoBaseDeviceUnit.pas',
  IngenicoOperation in 'IngenicoOperation.pas',
  IngenicoBPOSDeviceUnit in 'IngenicoBPOSDeviceUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
