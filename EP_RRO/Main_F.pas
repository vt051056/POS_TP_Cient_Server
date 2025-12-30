unit Main_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TF_Main = class(TForm)
    IdHTTP1: TIdHTTP;
    ADOConnection1: TADOConnection;
    Panel17: TPanel;
    Panel18: TPanel;
    BBAddCLI: TBitBtn;
    BBDelCLI: TBitBtn;
    DBNavigator7: TDBNavigator;
    DBGrid7: TDBGrid;
    Q_RRO_CERTIFIC: TADOQuery;
    DS_Q_RRO_CERTIFIC: TDataSource;
    Q_RRO_CERTIFICID_CLI: TIntegerField;
    Q_RRO_CERTIFICCERTIFICATE: TMemoField;
    Q_RRO_CERTIFICPRIVATE_KEY: TMemoField;
    Q_RRO_CERTIFICPASSW: TWideStringField;
    Q_RRO_CERTIFICCLIENT: TWideStringField;
    ADOCommandDeleteRRO_KASSA_TS: TADOCommand;
    Panel1: TPanel;
    BGetPrivateKey: TButton;
    Button4: TButton;
    BCloseShift: TButton;
    BOpenShift: TButton;
    BTransactionsRegistrarState: TButton;
    BSetupRegistrar: TButton;
    BSetup: TButton;
    BGetObjects: TButton;
    BGetCertificate: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    BBAddTT: TBitBtn;
    BBDelTT: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Q_RRO_KASSA_TS: TADOQuery;
    SP_ADD_RRO_KASSA_TS: TADOStoredProc;
    DS_Q_RRO_KASSA_TS: TDataSource;
    Q_RRO_KASSA_TSID_RRO_KASSA: TIntegerField;
    Q_RRO_KASSA_TSID_TT: TIntegerField;
    Q_RRO_KASSA_TSID_CLI: TIntegerField;
    Q_RRO_KASSA_TSNAME_KASSA: TWideStringField;
    Q_RRO_KASSA_TSTT: TWideStringField;
    Q_RRO_KASSA_TSADRES: TWideStringField;
    SP_DELETE_RRO_CERTIFIC: TADOStoredProc;
    Q_RRO_KASSA_TSID_NUM_FISCAL_KASSA: TLargeintField;
    Memo1: TMemo;
    Q_RRO_CERTIFICPATH_TO_CERTIFICATE: TWideStringField;
    Q_RRO_KASSA_TSPASSW: TWideStringField;
    Q_RRO_KASSA_TSPATH_TO_CERTIFICATE: TWideStringField;
    Q_RRO_KASSA_TSPATH_TO_PRIVATE_KEY: TWideStringField;
    Q_RRO_CERTIFICPATH_TO_PRIVATE_KEY: TWideStringField;
    Q_RRO_CERTIFICDATE_END_CERTIFICATE: TDateTimeField;
    Q_RRO_KASSA_TSDATE_END_CERTIFICATE: TDateTimeField;
    BBEditCert_ObjHoz: TBitBtn;
    BBEditCertKass: TBitBtn;
    SP_EDIT_RRO_KASSA_TS: TADOStoredProc;
    SP_ADD_RRO_OBJ_HOZ: TADOStoredProc;
    SP_EDIT_RRO_OBJ_HOZ: TADOStoredProc;
    Q_RRO_KASSA_TSCERTIFICATE: TMemoField;
    Q_RRO_KASSA_TSPRIVATE_KEY: TMemoField;
    procedure Button4Click(Sender: TObject);
    procedure BGetCertificateClick(Sender: TObject);
    procedure BGetPrivateKeyClick(Sender: TObject);
    procedure BGetObjectsClick(Sender: TObject);
    procedure BSetupClick(Sender: TObject);
    procedure BSetupRegistrarClick(Sender: TObject);
    procedure BOpenShiftClick(Sender: TObject);
    procedure BTransactionsRegistrarStateClick(Sender: TObject);
    procedure BCloseShiftClick(Sender: TObject);
    procedure BBAddCLIClick(Sender: TObject);
    procedure BBDelCLIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBAddTTClick(Sender: TObject);
    procedure Q_RRO_CERTIFICAfterScroll(DataSet: TDataSet);
    procedure BBDelTTClick(Sender: TObject);
    procedure BBEditCert_ObjHozClick(Sender: TObject);
    procedure BBEditCertKassClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }

      Certificate: string;
      PrivateKey: string;
      Password: string;
      CertificateFileName, PrivateKeyFileName:string;
      ID_CLI_Certificate:longint;
      CLI_Certificate:string;
      NumFiscal:Int64;
      Date_end:TDateTime;

      function GetCertificate(FileName:string):string;
      function GetPrivateKey(FileName:string):string;
      procedure Reopen_Q_RRO_CERTIFIC(ID_CLI:longint);
      procedure Reopen_Q_RRO_KASSA_TS(ID_RRO_KASSA:longint);
  end;

var
  F_Main: TF_Main;

implementation
uses  IdCoderMIME, IdMultipartFormData, System.JSON, Soap.EncdDecd, RRO_cert_info,
RRO_Kassa_info, reg_server;


{$R *.dfm}

function EncodeString(const Input: string): string;
var
  InStr, OutStr: TStringStream;
begin
//  InStr := TStringStream.Create(Input, TEncoding.UTF8);
InStr := TStringStream.Create(Input, TEncoding.ANSI);
  try
    OutStr := TStringStream.Create('');
    try
      EncodeStream(InStr, OutStr);
      Result := OutStr.DataString;
    finally
      OutStr.Free;
    end;
  finally
    InStr.Free;
  end;
end;

function DecodeString(const Input: string): string;
var
  InStr, OutStr: TStringStream;
begin
  InStr := TStringStream.Create(Input);
  try
    OutStr := TStringStream.Create('', TEncoding.ANSI);
    try
      DecodeStream(InStr, OutStr);
      Result := OutStr.DataString;
    finally
      OutStr.Free;
    end;
  finally
    InStr.Free;
  end;
end;


function TF_Main.GetCertificate(FileName:string):string;
var
  Reader: TStreamReader;
  s:string;
begin
  try
  // читаем сертификат из файла
    Reader := TStreamReader.Create( FileName, TEncoding.ANSI);
    s :=Reader.ReadToEnd();
    Reader.Free();
  except
    MessageDlg('Ошибка чтения сертификата!', mtError, [mbOk], 0);
    s:=''
  end;
  // преобразовать к Base64
  result :=EncodeString(s);
end;


function TF_Main.GetPrivateKey(FileName:string):string;
var
  Reader: TStreamReader;
  s:string;
begin
  try
  // читаем ключ из файла
    Reader := TStreamReader.Create(FileName, TEncoding.ANSI);
    s :=Reader.ReadToEnd();
    Reader.Free();
  // преобразовать к Base64
  except
    MessageDlg('Ошибка чтения ключа!', mtError, [mbOk], 0);
    s:=''
  end;
  result :=EncodeString(s);
end;

procedure TF_Main.Q_RRO_CERTIFICAfterScroll(DataSet: TDataSet);
begin
  ID_CLI_Certificate:= Q_RRO_CERTIFIC.FieldByName('ID_CLI').AsInteger;
  CLI_Certificate:= Q_RRO_CERTIFIC.FieldByName('CLIENT').AsString;
  Reopen_Q_RRO_KASSA_TS(-1);
end;

procedure TF_Main.Reopen_Q_RRO_CERTIFIC(ID_CLI:longint);
begin
  with Q_RRO_CERTIFIC do
  begin
    Close;
    Open;
    if ID_CLI<>-1 then Locate('ID_CLI',ID_CLI,[loCaseInsensitive]);
  end;
  Reopen_Q_RRO_KASSA_TS(-1);
end;

procedure TF_Main.BBAddCLIClick(Sender: TObject);
begin
  Date_end:=Date();
  ID_CLI_Certificate:=-1;
  if F_RRO_Sert_dlg(ID_CLI_Certificate, CertificateFileName, PrivateKeyFileName, Password, Date_end)=mrOk then
  begin
    Certificate:=GetCertificate(CertificateFileName);
    PrivateKey:=GetPrivateKey(PrivateKeyFileName);
    with SP_ADD_RRO_OBJ_HOZ do   // записать в табл [RRO_CERTIFIC]
    begin
      Parameters.ParamByName('@ID_CLI').Value:=ID_CLI_Certificate;
      Parameters.ParamByName('@CERTIFICATE').Value:=Certificate;
      Parameters.ParamByName('@PRIVATE_KEY').Value:=PrivateKey;
      Parameters.ParamByName('@PASSW').Value:=Password;
      Parameters.ParamByName('@PATH_TO_CERTIFICATE').Value:=CertificateFileName;
      Parameters.ParamByName('@PATH_TO_PRIVATE_KEY').Value:=PrivateKeyFileName;
      Parameters.ParamByName('@DATE_END_CERTIFICATE').Value:=Date_end;
      ExecProc;

      if Parameters.ParamValues['@ER']=0 then
      begin
        Reopen_Q_RRO_CERTIFIC(ID_CLI_Certificate);
      end
      else MessageDlg('Ошибка добавления объекта хозяйствования!', mtError, [mbOk], 0);
    end;


  end;
end;

procedure TF_Main.Reopen_Q_RRO_KASSA_TS(ID_RRO_KASSA:longint);
begin
  with Q_RRO_KASSA_TS do
  begin
    Close;
    Parameters.ParamByName('ID_CLI').Value:=ID_CLI_Certificate;
    Open;
    if ID_RRO_KASSA<>-1 then Locate('ID_RRO_KASSA',ID_RRO_KASSA,[loCaseInsensitive]);
  end;

end;

procedure TF_Main.BBAddTTClick(Sender: TObject);
var vID_TT: longint;
vID_NUM_FISCAL_KASSA:int64;
vNAME_KASSA:string;

begin
  Date_end:=Date();
  vID_TT:=-1;
  if F_RRO_Kassa_dlg(ID_CLI_Certificate, CLI_Certificate, vID_TT, vID_NUM_FISCAL_KASSA, vNAME_KASSA,
  CertificateFileName, PrivateKeyFileName, Password, Date_end)=mrOk then
  begin
    Certificate:=GetCertificate(CertificateFileName);
    PrivateKey:=GetPrivateKey(PrivateKeyFileName);
    with SP_ADD_RRO_KASSA_TS do   // записать в табл [RRO_KASSA_TS]
    begin
      Parameters.ParamByName('@ID_CLI').Value:=ID_CLI_Certificate;
      Parameters.ParamByName('@ID_TT').Value:=vID_TT;
      Parameters.ParamByName('@ID_NUM_FISCAL_KASSA').Value:=vID_NUM_FISCAL_KASSA;
      Parameters.ParamByName('@NAME_KASSA').Value:=vNAME_KASSA;
      Parameters.ParamByName('@CERTIFICATE').Value:=Certificate;
      Parameters.ParamByName('@PRIVATE_KEY').Value:=PrivateKey;
      Parameters.ParamByName('@PASSW').Value:=Password;
      Parameters.ParamByName('@PATH_TO_CERTIFICATE').Value:=CertificateFileName;
      Parameters.ParamByName('@PATH_TO_PRIVATE_KEY').Value:=PrivateKeyFileName;
      Parameters.ParamByName('@DATE_END_CERTIFICATE').Value:=Date_end;
      ExecProc;

      if Parameters.ParamValues['@ER']=0 then
      begin
        Reopen_Q_RRO_KASSA_TS(Parameters.ParamValues['@ID_NEW']);
      end
      else MessageDlg('Ошибка добавления кассы!', mtError, [mbOk], 0);
    end;



  end;
end;

procedure TF_Main.BBDelCLIClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
with Q_RRO_CERTIFIC do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID_CLI').AsInteger;
    prior;
    pred_ID:=FieldByName('ID_CLI').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID_CLI').AsInteger;
  end;

with SP_DELETE_RRO_CERTIFIC do   // записать в табл [RRO_CERTIFIC]
  begin
    Parameters.ParamByName('@ID_CLI').Value:=carrent_ID;
    ExecProc;
    if Parameters.ParamValues['@ER']=0 then
    begin
      if pred_ID=carrent_ID then // удаляем 1ю
        Reopen_Q_RRO_CERTIFIC(next_ID)
      else
      if next_ID=carrent_ID then // удаляем последнюю
        Reopen_Q_RRO_CERTIFIC(pred_ID)
      else Reopen_Q_RRO_CERTIFIC(pred_ID);
    end
    else MessageDlg('Ошибка Удаления сертификата!', mtError, [mbOk], 0);


  end;


   Q_RRO_CERTIFIC.Enablecontrols;
end;

procedure TF_Main.BBDelTTClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
  with Q_RRO_KASSA_TS do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID_RRO_KASSA').AsInteger;
    prior;
    pred_ID:=FieldByName('ID_RRO_KASSA').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID_RRO_KASSA').AsInteger;
  end;

  with ADOCommandDeleteRRO_KASSA_TS do   // удалить в табл [RRO_KASSA_TS]
  begin
    Parameters.ParamByName('ID_RRO_KASSA').Value:=carrent_ID;
    Execute;
    if pred_ID=carrent_ID then // удаляем 1ю
        Reopen_Q_RRO_KASSA_TS(next_ID)
    else
    if next_ID=carrent_ID then // удаляем последнюю
        Reopen_Q_RRO_KASSA_TS(pred_ID)
      else Reopen_Q_RRO_KASSA_TS(pred_ID);


  end;


   Q_RRO_KASSA_TS.Enablecontrols;

end;

procedure TF_Main.BBEditCertKassClick(Sender: TObject);
var vID_TT: longint;
vID_NUM_FISCAL_KASSA:int64;
vNAME_KASSA:string;
carrent_ID:longint;
begin

  carrent_ID:=Q_RRO_KASSA_TS.FieldByName('ID_RRO_KASSA').AsInteger;

  with Q_RRO_KASSA_TS do
  begin
    vID_TT:=FieldByName('ID_TT').AsInteger;
    vID_NUM_FISCAL_KASSA:=FieldByName('ID_NUM_FISCAL_KASSA').AsLargeInt;
    vNAME_KASSA:=FieldByName('NAME_KASSA').AsString;
    CertificateFileName:=FieldByName('PATH_TO_CERTIFICATE').AsString;
    PrivateKeyFileName:=FieldByName('PATH_TO_PRIVATE_KEY').AsString;
    Password:=FieldByName('PASSW').AsString;
    Date_end:=FieldByName('DATE_END_CERTIFICATE').AsDateTime;
  end;

  if F_RRO_Kassa_dlg(ID_CLI_Certificate, CLI_Certificate, vID_TT, vID_NUM_FISCAL_KASSA, vNAME_KASSA,
  CertificateFileName, PrivateKeyFileName, Password, Date_end)=mrOk then
  begin
    Certificate:=GetCertificate(CertificateFileName);
    PrivateKey:=GetPrivateKey(PrivateKeyFileName);
    with SP_EDIT_RRO_KASSA_TS do   // удалить в табл [RRO_KASSA_TS]
    begin

      Parameters.ParamByName('@ID_RRO_KASSA').Value:=carrent_ID;
      Parameters.ParamByName('@ID_CLI').Value:=ID_CLI_Certificate;
      Parameters.ParamByName('@ID_TT').Value:=vID_TT;
      Parameters.ParamByName('@ID_NUM_FISCAL_KASSA').Value:=vID_NUM_FISCAL_KASSA;
      Parameters.ParamByName('@NAME_KASSA').Value:=vNAME_KASSA;
      Parameters.ParamByName('@CERTIFICATE').Value:=Certificate;
      Parameters.ParamByName('@PRIVATE_KEY').Value:=PrivateKey;
      Parameters.ParamByName('@PASSW').Value:=Password;
      Parameters.ParamByName('@PATH_TO_CERTIFICATE').Value:=CertificateFileName;
      Parameters.ParamByName('@PATH_TO_PRIVATE_KEY').Value:=PrivateKeyFileName;
      Parameters.ParamByName('@DATE_END_CERTIFICATE').Value:=Date_end;
      ExecProc;

      if Parameters.ParamValues['@ER']=0 then
      begin
        Reopen_Q_RRO_KASSA_TS(carrent_ID);
      end
      else MessageDlg('Ошибка редактирования кассы!', mtError, [mbOk], 0);

    end;



  end;
end;

procedure TF_Main.BBEditCert_ObjHozClick(Sender: TObject);
begin

  with Q_RRO_CERTIFIC do
  begin
    ID_CLI_Certificate:=FieldByName('ID_CLI').AsInteger;
    CertificateFileName:=FieldByName('PATH_TO_CERTIFICATE').AsString;
    PrivateKeyFileName:=FieldByName('PATH_TO_PRIVATE_KEY').AsString;
    Password:=FieldByName('PASSW').AsString;
    Date_end:=FieldByName('DATE_END_CERTIFICATE').AsDateTime;
  end;

  if F_RRO_Sert_dlg(ID_CLI_Certificate, CertificateFileName, PrivateKeyFileName, Password, Date_end)=mrOk then
  begin

    Certificate:=GetCertificate(CertificateFileName);
    PrivateKey:=GetPrivateKey(PrivateKeyFileName);
    with SP_EDIT_RRO_OBJ_HOZ do   // записать в табл [RRO_CERTIFIC]
    begin
      Parameters.ParamByName('@ID_CLI').Value:=ID_CLI_Certificate;
      Parameters.ParamByName('@CERTIFICATE').Value:=Certificate;
      Parameters.ParamByName('@PRIVATE_KEY').Value:=PrivateKey;
      Parameters.ParamByName('@PASSW').Value:=Password;
      Parameters.ParamByName('@PATH_TO_CERTIFICATE').Value:=CertificateFileName;
      Parameters.ParamByName('@PATH_TO_PRIVATE_KEY').Value:=PrivateKeyFileName;
      Parameters.ParamByName('@DATE_END_CERTIFICATE').Value:=Date_end;
      ExecProc;

      if Parameters.ParamValues['@ER']=0 then
      begin
        Reopen_Q_RRO_CERTIFIC(ID_CLI_Certificate);
      end
      else MessageDlg('Ошибка редактирования объекта хозяйствования!', mtError, [mbOk], 0);
    end;

  end;

end;

procedure TF_Main.BGetCertificateClick(Sender: TObject);
var
  Reader: TStreamReader;
begin
// читаем сертификат из файла
 // Reader := TStreamReader.Create( 'E:\key1\Сухаренко Олег Андрійович (дир) 12.11.2021\Сухаренко Олег Андрійович (Тест)-10187647.cer', TEncoding.ANSI);

  Reader := TStreamReader.Create( 'E:\Печать\Тестовий платник 4 (Тест)-10187669.cer', TEncoding.ANSI);

  Certificate :=Reader.ReadToEnd();
  Reader.Free();
  // преобразовать к Base64
  Certificate :=EncodeString(Certificate);
  memo1.Clear;
  memo1.Lines.Add(Certificate);
end;

procedure TF_Main.BGetPrivateKeyClick(Sender: TObject);
var
  Reader: TStreamReader;
begin
// читаем ключ из файла
 // Reader := TStreamReader.Create( 'E:\key1\Сухаренко Олег Андрійович (дир) 12.11.2021\Key-6.dat', TEncoding.ANSI);
 Reader := TStreamReader.Create( 'E:\Печать\Key-6.dat', TEncoding.ANSI);

  PrivateKey :=Reader.ReadToEnd();
  Reader.Free();
  // преобразовать к Base64
  PrivateKey :=EncodeString(PrivateKey);
     memo1.Clear;
  memo1.Lines.Add(PrivateKey);
end;

procedure TF_Main.BSetupClick(Sender: TObject);
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Password:='testplat2021';
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Setup');
  JsonObject.AddPair('Certificate', Certificate);
  JsonObject.AddPair('PrivateKey', PrivateKey);
  JsonObject.AddPair('Password', Password);
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\RESP.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);



end;

procedure TF_Main.BGetObjectsClick(Sender: TObject);

var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
 // Password:='testplat2021';
 (*
   {"Entity":72498,"SingleTax":false,"Name":"Январь Кафе",
   "Address":"УКРАЇНА, М.КИЇВ СВЯТОШИНСЬКИЙ Р-Н, м.Київ, проспект Перемоги, 67",
   "Tin":"34554363","Ipn":"123456789020",
   "OrgName":"Тестовий платник 4",
   "TransactionsRegistrars":[{"NumFiscal":4000080702,"NumLocal":11111,
   "Name":"ВебЧек сервер 1","Closed":false},
   {"NumFiscal":4000080709,"NumLocal":111112,
   "Name":"ВебЧек сервер 2","Closed":false},
   {"NumFiscal":4000080708,"NumLocal":111113,
   "Name":"ВебЧек сервер 3","Closed":false},
   {"NumFiscal":4000080710,"NumLocal":111114,
   "Name":"ВебЧек сервер 4","Closed":false},
   {"NumFiscal":4000080706,"NumLocal":111115,
   "Name":"ВебЧек сервер 5","Closed":false},
   {"NumFiscal":4000080711,"NumLocal":111116,
   "Name":"ВебЧек сервер 6","Closed":false},
   {"NumFiscal":4000080707,"NumLocal":111117,
   "Name":"ВебЧек сервер 7","Closed":false},
   {"NumFiscal":4000080704,"NumLocal":111118,
   "Name":"ВебЧек сервер 8","Closed":false},
   {"NumFiscal":4000080705,"NumLocal":111119,"Name":"ВебЧек сервер 9","Closed":false},
   {"NumFiscal":4000080703,"NumLocal":1111110,"Name":"ВебЧек сервер 10","Closed":false}]}],
   "ErrorCode":"Ok","ErrorMessage":null}


 *)

  with Q_RRO_CERTIFIC do
  begin
   Certificate:=FieldByName('CERTIFICATE').AsString;
   PrivateKey:=FieldByName('PRIVATE_KEY').AsString;
   Password:=FieldByName('PASSW').AsString;
  end;

 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Objects');
  JsonObject.AddPair('Certificate', Certificate);
  JsonObject.AddPair('PrivateKey', PrivateKey);
  JsonObject.AddPair('Password', Password);
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  Writer := TStreamWriter.Create('e:\key1\JSON.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\Objects.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);




end;

procedure TF_Main.BSetupRegistrarClick(Sender: TObject);
 {
 "Command": "SetupRegistrar",
  "NumFiscal": 4000164369,
   "WorkMode": "Normal",
    "SendToCabinet": true   }
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Password:='testplat2021';
  NumFiscal:= 4000080708;
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'SetupRegistrar');
  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(NumFiscal));
  JsonObject.AddPair('WorkMode', 'Normal');
  JsonObject.AddPair('SendToCabinet',TJSONBool.Create(True));
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  Writer := TStreamWriter.Create('e:\key1\JSON.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\RESP.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);





end;

procedure TF_Main.BOpenShiftClick(Sender: TObject);
 {
 "“Command”: “OpenShift”
 • “NumFiscal”: “Фіскальний номер ПРРО”
 • “Testing”: “Ознака зміни, що містить тестові документи”    }
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Password:='testplat2021';
  NumFiscal:= 4000164369;
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'OpenShift');
  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(NumFiscal));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  Writer := TStreamWriter.Create('e:\key1\JSON.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\RESP.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);





end;

procedure TF_Main.BTransactionsRegistrarStateClick(Sender: TObject);
{
• “Command”: “TransactionsRegistrarState”
• “NumFiscal”: “Фіскальний номер ПРРО”
• “IncludeTaxObject”: “Ознака запиту відомостей об’єкту оподаткування (не обов’язковий)” (false/true)
}
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Password:='testplat2021';
  NumFiscal:= 4000164369;
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'TransactionsRegistrarState');
  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(NumFiscal));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  Writer := TStreamWriter.Create('e:\key1\JSON.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\RESP.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);




end;



procedure TF_Main.BCloseShiftClick(Sender: TObject);
{
  • “Command”: “CloseShift”
  • “NumFiscal”: “Фіскальний номер ПРРО”
  • “ZRepAuto”: “Автоматично створювати Z-звіт, якщо відсутній” (false/true)
}
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
   Writer: TStreamWriter;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Password:='testplat2021';
  NumFiscal:= 4000164369;
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'CloseShift');
  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(NumFiscal));
  JsonObject.AddPair('ZRepAuto',TJSONBool.Create(True));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  Writer := TStreamWriter.Create('e:\key1\JSON.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



  JsonToSend := TStringStream.Create(Utf8Encode(Json));
//  JsonToSend := TStringStream.Create(Json);
  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

  Writer := TStreamWriter.Create('e:\key1\RESP.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  Memo1.Clear;
  Memo1.Lines.Add(sResponse);




end;

procedure TF_Main.Button4Click(Sender: TObject);
var
  Json: string;
  url:string;
  sResponse: string;
  JsonToSend: TStringStream;
begin
  url:='http://192.168.0.191:80/fsapi/';
  Json := '{"Command": "serverstate"}';



  JsonToSend := TStringStream.Create(Utf8Encode(Json));

  try
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.CharSet := 'utf-8';

    try
      sResponse := IdHTTP1.Post(url, JsonToSend);
    except
      on E: Exception do
        ShowMessage('Ошибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;

    Memo1.Clear;
  Memo1.Lines.Add(sResponse);
//  Showmessage(sResponse);

end;


procedure TF_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 Q_RRO_CERTIFIC.Close;
end;

procedure TF_Main.FormCreate(Sender: TObject);
begin
  ADOConnection1.Connected:=False;
  ADOConnection1.ConnectionString:=Connect_info;
  Reopen_Q_RRO_CERTIFIC(-1);
end;

end.
