program RRO_Setting;

uses
  Vcl.Forms,
  RRO_Kassa_info in 'RRO_Kassa_info.pas' {F_RRO_Kassa},
  Main_F in 'Main_F.pas' {F_Main},
  RRO_cert_info in 'RRO_cert_info.pas' {F_RRO_Sert},
  reg_server in 'reg_server.pas' {FReg_serv};

{$R *.res}

begin
  Application.Initialize;
  if  FReg_servShowModal=1 then
  begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TF_main, F_main);
    Application.Run;
  end;
end.
