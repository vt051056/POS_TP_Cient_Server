program Test_API_PRRO;

uses
  Vcl.Forms,
  UMain_F in 'UMain_F.pas' {F_Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Main, F_Main);
  Application.Run;
end.
