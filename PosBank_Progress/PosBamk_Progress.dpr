program PosBamk_Progress;

uses
  Vcl.Forms,
  UPG in 'UPG.pas' {FPG};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPG, FPG);
  Application.Run;
end.
