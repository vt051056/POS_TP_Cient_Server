unit UPG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFPG = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPG: TFPG;

implementation

{$R *.dfm}

procedure TFPG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=False;
end;

procedure TFPG.FormCreate(Sender: TObject);
begin
  ProgressBar1.Position:=0;
  Timer1.Enabled:=True;
end;

procedure TFPG.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position:=ProgressBar1.Position +1;
  if ProgressBar1.Position>90 then ProgressBar1.Position:=0;

end;

end.
