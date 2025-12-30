unit FormServerUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, System.IniFiles;

type
  TForm1 = class(TForm)
    E_Port: TEdit;
    BBSetting: TBitBtn;
    Label3: TLabel;
    E_database: TEdit;
    Label2: TLabel;
    E_sqlsrv: TEdit;

    Label1: TLabel;
    BBStartSrv: TBitBtn;
    procedure BBSettingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBStartSrvClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniFile:TIniFile;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses ServerContainerUnit1;

procedure TForm1.BBSettingClick(Sender: TObject);
begin
IniFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
with IniFile do
begin
 WriteString('servset','sqlsrv', E_sqlsrv.Text);
 WriteString('servset','database', E_database.Text);
 WriteString('servset','port', E_Port.Text);
 Free;
end;

end;

procedure TForm1.BBStartSrvClick(Sender: TObject);
begin
  ServerContainer1.DSServer1.Stop;
  ServerContainer1.DSTCPServerTransport1.Port:=StrToInt(Trim(E_Port.Text));
  ServerContainer1.DSServer1.Start;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
IniFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
with IniFile do
begin
 E_sqlsrv.Text:=ReadString('servset','sqlsrv', '');
 E_database.Text:=ReadString('servset','database', '');
 E_Port.Text:=ReadString('servset','port', '');

 Free;
end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ServerContainer1.DSServer1.Stop;
  ServerContainer1.DSTCPServerTransport1.Port:=StrToInt(Trim(E_Port.Text));
  ServerContainer1.DSServer1.Start;
end;

end.

