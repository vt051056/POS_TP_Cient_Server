unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Button4: TButton;
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    BGetCertificate: TButton;
    BGetPrivateKey: TButton;
    BGetObjects: TButton;
    BSetup: TButton;
    OpenDialog1: TOpenDialog;
    E_Certificat: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    E_Key: TEdit;
    BBSelectCert: TBitBtn;
    BBSelectKey: TBitBtn;
    BOpenShift: TButton;
    BSetupRegistrar: TButton;
    BTransactionsRegistrarState: TButton;
    BCloseShift: TButton;
    procedure Button4Click(Sender: TObject);
    procedure BGetCertificateClick(Sender: TObject);
    procedure BGetPrivateKeyClick(Sender: TObject);
    procedure BGetObjectsClick(Sender: TObject);
    procedure BBSelectCertClick(Sender: TObject);
    procedure BSetupClick(Sender: TObject);
    procedure BSetupRegistrarClick(Sender: TObject);
    procedure BOpenShiftClick(Sender: TObject);
    procedure BTransactionsRegistrarStateClick(Sender: TObject);
    procedure BCloseShiftClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }

      Certificate: string;
      PrivateKey: string;
      Password: string;
      NumFiscal:Int64;
  end;

var
  Form4: TForm4;

implementation
uses  IdCoderMIME, IdMultipartFormData, System.JSON, Soap.EncdDecd;


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
   // OutStr := TStringStream.Create('', TEncoding.ANSI);
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





procedure TForm4.BBSelectCertClick(Sender: TObject);
begin
 OpenDialog1.Execute();
end;

procedure TForm4.BGetCertificateClick(Sender: TObject);
var
  Reader: TStreamReader;
begin
// читаем сертификат из файла
 // Reader := TStreamReader.Create( 'E:\key1\—ухаренко ќлег јндр≥йович (дир) 12.11.2021\—ухаренко ќлег јндр≥йович (“ест)-10187647.cer', TEncoding.ANSI);

  Reader := TStreamReader.Create( 'E:\ѕечать\“естовий платник 4 (“ест)-10187669.cer', TEncoding.ANSI);

  Certificate :=Reader.ReadToEnd();
  Reader.Free();
  // преобразовать к Base64
  Certificate :=EncodeString(Certificate);
  memo1.Clear;
  memo1.Lines.Add(Certificate);
end;

procedure TForm4.BGetPrivateKeyClick(Sender: TObject);
var
  Reader: TStreamReader;
begin
// читаем ключ из файла
 // Reader := TStreamReader.Create( 'E:\key1\—ухаренко ќлег јндр≥йович (дир) 12.11.2021\Key-6.dat', TEncoding.ANSI);
 Reader := TStreamReader.Create( 'E:\ѕечать\Key-6.dat', TEncoding.ANSI);

  PrivateKey :=Reader.ReadToEnd();
  Reader.Free();
  // преобразовать к Base64
  PrivateKey :=EncodeString(PrivateKey);
     memo1.Clear;
  memo1.Lines.Add(PrivateKey);
end;

procedure TForm4.BSetupClick(Sender: TObject);
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.BGetObjectsClick(Sender: TObject);

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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.BSetupRegistrarClick(Sender: TObject);
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
  NumFiscal:= 4000164369;
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.BOpenShiftClick(Sender: TObject);
 {
 "УCommandФ: УOpenShiftФ
 Х УNumFiscalФ: У‘≥скальний номер ѕ––ќФ
 Х УTestingФ: Уќзнака зм≥ни, що м≥стить тестов≥ документиФ    }
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.BTransactionsRegistrarStateClick(Sender: TObject);
{
Х УCommandФ: УTransactionsRegistrarStateФ
Х УNumFiscalФ: У‘≥скальний номер ѕ––ќФ
Х УIncludeTaxObjectФ: Уќзнака запиту в≥домостей обТЇкту оподаткуванн€ (не обовТ€зковий)Ф (false/true)
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.BCloseShiftClick(Sender: TObject);
{
  Х УCommandФ: УCloseShiftФ
  Х УNumFiscalФ: У‘≥скальний номер ѕ––ќФ
  Х УZRepAutoФ: Ујвтоматично створювати Z-зв≥т, €кщо в≥дсутн≥йФ (false/true)
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
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

procedure TForm4.Button4Click(Sender: TObject);
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
        ShowMessage('ќшибка: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
  end;
  Memo1.Lines.Add(sResponse);
//  Showmessage(sResponse);

end;


end.
