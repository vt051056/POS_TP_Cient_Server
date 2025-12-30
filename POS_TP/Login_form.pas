unit Login_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons,
  System.IniFiles, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient;

type
  TF_Login = class(TForm)
    Login: TEdit;
    Passw: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BBOk: TBitBtn;
    BBCancel: TBitBtn;
    GBShowPassw: TCheckBox;
    BBSaveLog: TBitBtn;
    Label3: TLabel;
    EHost: TEdit;
    Label4: TLabel;
    EPort: TEdit;
    Q_ConstValues: TADOQuery;
    RadioGroup1: TRadioGroup;
    BBPing: TBitBtn;
    Label5: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    Memo1: TMemo;
    procedure GBShowPasswClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBSaveLogClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BBPingClick(Sender: TObject);
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
  public
    { Public declarations }
     iniFile:TIniFile;
     name_ini_File : string;
    // user:string;
    // id_user:integer;
   //  comment:string;

  end;

var
  F_Login: TF_Login;
  user_remoute_DB:string;     // пользователь удаленной БД
  id_user_remoute_DB:integer; // для импорта-экспорта данных
  Host_server:string; // IP удаленного сервера приложений
  Port_server:string; // порт

  IP_SERVER_APP:string;
  PORT_SERVER_APP:string;
  IP_SERVER_RESERV_APP:string;
  PORT_SERVER_RESERV_APP:string;

function F_LoginDLG(var v_user, v_passw, v_host, v_port:string):integer;

implementation

{$R *.dfm}
uses ClientClassesUnit1, System.JSON, UDataModule2, myfuncs, UDataModule1;

function F_LoginDLG(var v_user, v_passw, v_host, v_port:string):integer;
begin
  try
    F_Login:= TF_Login.Create(Application);
    result:=F_Login.ShowModal;
    if result=mrOk then
    begin
     v_user:= F_Login.Login.Text;
     v_passw:=  F_Login.Passw.Text;
     v_host:= F_Login.EHost.Text;
     v_port:=  F_Login.EPort.Text;
     F_Login.BBSaveLogClick(F_Login);
    end;

  finally
    FreeAndNil(F_Login);
  end;
end;



procedure TF_Login.BBSaveLogClick(Sender: TObject);

begin
 name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
 IniFile:=TIniFile.Create(name_ini_File);
 IniFile.WriteString('login', 'log',Login.Text);
 IniFile.WriteString('login', 'passw',Passw.Text);
 IniFile.WriteString('login', 'host',EHost.Text);
 IniFile.WriteString('login', 'port',EPort.Text);
 FreeAndNil(IniFile);
end;

procedure TF_Login.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin

  end;

 end;
end;



procedure TF_Login.FormCreate(Sender: TObject);
begin
 GBShowPassw.Checked:=False;
 Passw.PasswordChar:='*';
 name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
 IniFile:=TIniFile.Create(name_ini_File);
 Login.Text:=IniFile.ReadString('login', 'log','Логин');
 Passw.Text:=IniFile.ReadString('login', 'passw','Пароль');
 with Q_ConstValues do
  begin
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='IP_SERVER_APP';
    Open;
    IP_SERVER_APP:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='PORT_SERVER_APP';
    Open;
    PORT_SERVER_APP:=FieldByName('CONST_VALUE').AsString;
    Close;

    Close;
    Parameters.ParamByName('CONST_NAME').Value:='IP_SERVER_RESERV_APP';
    Open;
    IP_SERVER_RESERV_APP:=FieldByName('CONST_VALUE').AsString;
    Close;
    Parameters.ParamByName('CONST_NAME').Value:='PORT_SERVER_RESERV_APP';
    Open;
    PORT_SERVER_RESERV_APP:=FieldByName('CONST_VALUE').AsString;
    Close;

  end;

 FreeAndNil(IniFile);

 EHost.Text:=IP_SERVER_APP;           //IniFile.ReadString('login', 'host','127.0.0.1');
 EPort.Text:=PORT_SERVER_APP;            //IniFile.ReadString('login', 'port','211');


end;

procedure TF_Login.GBShowPasswClick(Sender: TObject);
begin
 if GBShowPassw.Checked then Passw.PasswordChar:=#0
 else  Passw.PasswordChar:='*';

end;

procedure TF_Login.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
var
  sTime: String;
begin
  if (AReplyStatus.MsRoundTripTime = 0) then
    sTime := '< 1'
  else
    sTime := '=';
  memo1.Lines.Add(Format('%d bytes from %s: icmp_seq=%d ttl=%d time%s%d ms',
                            [AReplyStatus.BytesReceived,
                             AReplyStatus.FromIpAddress,
                             AReplyStatus.SequenceId,
                             AReplyStatus.TimeToLive,
                             sTime,
                             AReplyStatus.MsRoundTripTime]));

end;

procedure TF_Login.BBPingClick(Sender: TObject);
var
 i: Integer;
begin
 Memo1.Clear;
 try
 IdIcmpClient1.Host := EHost.Text;
 for i := 1 to 4 do
 begin
   IdIcmpClient1.Ping;
   Application.ProcessMessages;
 end;
 except
  Memo1.Lines.Add('Нет интернет соедитения')
 end;

end;

procedure TF_Login.RadioGroup1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex=0 then
 begin
  EHost.Text:=IP_SERVER_APP;
  EPort.Text:=PORT_SERVER_APP;
 end
 else
 begin
  EHost.Text:=IP_SERVER_RESERV_APP;
  EPort.Text:=PORT_SERVER_RESERV_APP;
 end;

end;

end.
