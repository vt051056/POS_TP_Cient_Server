unit UMain_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Data.DB,
  Data.Win.ADODB,System.IniFiles,
  WinTypes,  WinProcs, ComObj,
 ActiveX;


type TGoodInfo = record
  //Артикул товару
  VendorCode:string;
  Article:string;
  //Назва товару
  Name:string;
  //Код УКДЗЕД
  CdUKDZED:string;
  //Код ДКПП(для послуг)
  CdDKPP:string;
  //Тип (1-товар/2-послуга(+)|3-послуга ломбардна(-)). За замовчуваннял товар,
  //якщо нічого не задано.
  GoodsType:string;
  //Штрихкод
  Barcode:string;
  //Код одиниці виміру
  UnitType:string;
  //Кількість товару
  Quantity:string;
  //Ціна товару
  Price:string;
  //Сума
  Amount:string;
  //Процент знижки
  DiscountPrc:string;
  //Сума знижки
  DiscountSum:string;
  //Процент податку ПДВ
  VATRate:string;
  //Ознака - чи включає сума ПДВ
  IsPriceIncludeVAT:boolean;
  //Сума ПДВ
  SumVAT:string;
  //Ознака - підакцизного товару
  IsExcise:boolean;
  //Інші параметри у вигляді строки XML
  //Приклад: <?xml version=\"1.0\" encoding=\"UTF-8\"?><Table><Record VAT
  //=\"20\" IsExcisable=\"False\" Nomenclature=\"STEP Пазл 104 Винни Пух\" UKTZED=\"\"
  //VendorCode=\"82106\" Barcode=\"\" Dimension=\"шт\" Discount=\"1\"
  //DiscountAmount=\"0.56\" PriceIncludeVAT=\"1\" AmountVAT=\"9.24\"/></Table>
  OtherParametrs:string;
  //Літера ставки податку ПДВ
  VATLetter:string;
  //Літера ставки податку Акцизу
  ExciseLetter:string;
  //Штрихкод акцизної марки
  ExciseStampBarcode:string;
end;




type CheckData = record
  GoodsLst:array of TGoodInfo;
  //Коментар
  Comment:string;
  //Тип чека(0 - продаж, 4 - ломбард)
  DocType:int64 = 0;
  DocSubType:int64 = 0;
  SaleOrderNumber:string; //Номер замовлення/договору для опер пред и после платы
  ParentReceiptFiscalNumber:string;  //Фіскальний номер чеку по якому здійснюється доплата/повернення
  SumCash:string; //Сума оплати чеку готівкою
  SumPayByCard:string; // Сума оплати чеку банківською картою
  SumPayByCredit:string; // Сума оплати чеку в кредит
  SumPayByCertificate:string; // Сума оплати чеку сертифікатом
  SumPayCheck:string; // Сума чеку до оплати, з урахуванням всіх надбавок і знижок
  SumPreparePayed:string; // Сума попередньої оплати
  CustomerEmail:string; // Опціонально. Електронна адреса покупця, на яку можна
  //відправити фіскалізований чек, передається в поле
  //електронної адреси при натисканні кнопки "Надіслати чек на
  //Email" екрану відображення чеку. Рекомендовано
  //використовувати при встановленому параметрі відображення
  //вікон інтерфейсу: SetParameter("NOINTERFACEMODE","False")
  //Необов'язкові параметри інформації по транзакції терміналу при безготівкових
  //розрахунках:
  TerminalID:string; // Код теміналу
  ApprovalCode:string; // Код підтвердження
  RRN:string; // РРН транзакції
  IssuerName:string; // Платіжна система
  PAN:string; // Номер картки
  TransactionDate:string; // Дата транзакції (в форматі dd.MM.yyyy HH:mm:ss)
  SignVerif:string; // Електроний підпис
  AcquireName:string; // Термінал
  InvoiceNumber:string; // Номер чеку
  ParentRRN:string; // РРН транзакції чека по якому здійснено повернення

end;

type TCashalotApiRetVal = record
  Description:string;
  JsonVal:string;
  ReceiptFiscalNum:string;
  ReceiptLocalNum:string;
  Return:boolean;
  ShiftID:string;
  XML:string;
  TypeDoc:integer;

end;




type
  TF_Main = class(TForm)
    IdHTTP1: TIdHTTP;
    Q_RRO_CERTIFIC: TADOQuery;
    ADOConnection1: TADOConnection;
    Q_RRO_KASSA_TS: TADOQuery;
    Memo1: TMemo;
    BBOpenShift: TBitBtn;
    BBCloseShift: TBitBtn;
    QNC: TADOQuery;
    QNCID: TAutoIncField;
    QNCID_USER: TIntegerField;
    QNCID_TOV: TIntegerField;
    QNCNUMB: TFloatField;
    QNCEXCISE_BAR_CODE: TWideStringField;
    QNCD: TDateTimeField;
    QNT: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    WideStringField1: TWideStringField;
    DateTimeField1: TDateTimeField;
    BitBtn1: TBitBtn;
    BBValidCard: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BBOpenShiftClick(Sender: TObject);
    procedure BBCloseShiftClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BBValidCardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    name_ini_File:string;
    IniFile:TIniFile;

    //-------------------------------

    app_CashaLot:variant;
    PathToCashalotDir:string;
    PathToCertificate:string;
    PwdToCertificate:string;
    FiscalNumberRRO:string;

    strJSONData:string; // JSON структура з описом проданих товарів або послуг
    strJSONPayData:string;  // JSON структура з підсумками оплати по чеку
    GoodsLst:array of TGoodInfo;
    URL_RRO_Server:string;



    function Get_app_CashaLot:boolean;
    procedure CashaLot_SetParameters;
    procedure CashaLot_OpenShift;
    procedure CashaLot_CloseShift;
    procedure CashaLot_Inet_FiscalizeCheck(vID_NAKLCAP:longInt);
    function Transfer_Data_To_Citizen_Card_Server(JsonToSend: TStringStream; var sResponse:string; var is_repeat:boolean):boolean;
  end;

var
  F_Main: TF_Main;


implementation

{$R *.dfm}
 uses System.JSON, IdSSLOpenSSL, MSXML;


procedure TF_Main.FormCreate(Sender: TObject);
begin
  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  PathToCashalotDir:='';
  PathToCashalotDir:=IniFile.ReadString('cashalot', 'PathToCashalotDir', PathToCashalotDir);
  PathToCertificate:='';
  PathToCertificate:=IniFile.ReadString('cashalot', 'PathToCertificate', PathToCertificate);
  PwdToCertificate:='';
  PwdToCertificate:=IniFile.ReadString('cashalot', 'PwdToCertificate', PwdToCertificate);
  FiscalNumberRRO:='';
  FiscalNumberRRO:=IniFile.ReadString('cashalot', 'FiscalNumberRRO', FiscalNumberRRO);
  FreeAndNil(IniFile);

 // if Get_app_CashaLot then  CashaLot_SetParameters;

  URL_RRO_Server:='https://xvalid.kh.city/citizen-card/validate'
end;



function TF_main.Transfer_Data_To_Citizen_Card_Server(JsonToSend: TStringStream; var sResponse:string; var is_repeat:boolean):boolean;
var Id_HandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin

  IdHTTP1.ConnectTimeout:= 60000;
  IdHTTP1.ReadTimeout:= 60000;
  IdHTTP1.Disconnect;

  IdHTTP1.Request.ContentType := 'application/json';
  IdHTTP1.Request.CharSet := 'utf-8';

  {это необходимо использовать для SSL}
  Id_HandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP1);
  Id_HandlerSocket.SSLOptions.Mode := sslmClient;
  Id_HandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdHTTP1.IOHandler := Id_HandlerSocket;

  is_repeat:=False;
  result:=True;
  try
    sResponse := IdHTTP1.Post(URL_RRO_Server, JsonToSend);
    IdHTTP1.Disconnect;
  except
    on E: Exception do
    begin
      is_repeat:=False;
      MessageDlg('Ошибка отправки данных на сервер '+e.Message+
        '. Нужно отправить позже!', mtError, [mbOk], 0);

      IdHTTP1.Disconnect;
      result:=False;
    end;
  end;
end;







function TF_Main.Get_app_CashaLot:boolean;
var
AppProgID : string;
iunk : IUnknown;
Res : HResult;
begin
  result:=True;
  AppProgID:= 'AddIn.CashaLotApi';
  try
    {пытаемся получить ссылку на запущенный экземпляр сервера.
    Возможные возвращаемые GetActiveObject значения см. в Windows.pas}
    Res:=GetActiveObject(ProgIDToClassID(AppProgID), nil, iunk);
    if Res=MK_E_UNAVAILABLE then {запускаем собственный экземпляр сервера}
      app_CashaLot:=CreateOleObject(AppProgID)
    else
    begin {получаем ссылку на сервер}
      app_CashaLot:=GetActiveOLEObject(AppProgID);
    end;
  except
    result:=False;
    MessageDlg('Не установлена DLL библиотека CashalotApi', mtError, [mbOk], 0);
  end;


end;


procedure TF_Main.CashaLot_SetParameters;
var param_name, param_value:string;
ret:boolean;
begin

    param_name:= 'PathToCashalotDir';
    param_value:=PathToCashalotDir;
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'DeviceIDFnRRO';
    param_value:=FiscalNumberRRO;
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'NOINTERFACEMODE';
    param_value:='True';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'NOAUTOOPENSHIFT';
    param_value:='True';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'USETOKEN';
    param_value:='False';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'PathToCertificate';
    param_value:=PathToCertificate;
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'PwdToCertificate';
    param_value:=PwdToCertificate;
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'DEFAULTPRINTERNAME';
    param_value:='Microsoft Print to PDF';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'AUTOPRINTMODE';
    param_value:='True';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

    param_name:= 'NOPRINTMODE';
    param_value:='False';
    ret:=app_CashaLot.SetParameter(param_name, param_value);

end;

procedure TF_Main.CashaLot_OpenShift;
var ret:variant;
begin
  ret:=app_CashaLot.OpenShift(FiscalNumberRRO);
  memo1.Lines.Clear;
  memo1.Lines.Add(ret.JsonVal);
end;

procedure TF_Main.CashaLot_CloseShift;
var ret:variant;
begin
  ret:=app_CashaLot.CloseShift(FiscalNumberRRO);
  memo1.Lines.Add(ret.JsonVal);
end;




procedure TF_Main.BBCloseShiftClick(Sender: TObject);
begin
 CashaLot_CloseShift;
end;

procedure TF_Main.BBOpenShiftClick(Sender: TObject);
begin
 CashaLot_OpenShift;
end;

procedure TF_Main.BBValidCardClick(Sender: TObject);
begin
 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Setup');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('Certificate', Certificate);
    JsonObject.AddPair('PrivateKey', PrivateKey);
    JsonObject.AddPair('Password', PasswordKey);
  end;
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


  try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  ErrorCode:='';
  if sResponse<>'' then
  begin

    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');


  if not result then   MessageDlg('Ошибка при выполнении команды SetupRRO', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
     Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\SetupRRO.dat', false,  TEncoding.ANSI);
     Writer.Write(sResponse);
     Writer.Free();
  end;

end;

procedure TF_Main.CashaLot_Inet_FiscalizeCheck(vID_NAKLCAP:longInt);
//var ret:variant;
begin
  with QNC do
  begin
    Close;
    Parameters.ParamByName('ID_NAKLCAP').Value:= vID_NAKLCAP;
    Open;
  end;

  with QNT do
  begin
    Close;
    Parameters.ParamByName('ID_NAKLCAP').Value:= vID_NAKLCAP;
    Open;
  end;

//  ret:=app_CashaLot.CloseShift(FiscalNumberRRO);
//  memo1.Lines.Add(ret.JsonVal);
end;


procedure TF_Main.BitBtn1Click(Sender: TObject);
var vID_NAKLCAP:longInt;
begin
  vID_NAKLCAP:=11968119;
  CashaLot_Inet_FiscalizeCheck(vID_NAKLCAP:longInt);
end;


(*
function TF_main.SetupRRO(is_ALCOGOL:boolean):boolean;
var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  ErrorCode:string;
  Writer: TStreamWriter;
  is_repeat_Transfer, is_Transfered:boolean;
begin

  result:=false;
  JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'Setup');
  if is_ALCOGOL then
  begin
    JsonObject.AddPair('Certificate', Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', PasswordKey_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('Certificate', Certificate);
    JsonObject.AddPair('PrivateKey', PrivateKey);
    JsonObject.AddPair('Password', PasswordKey);
  end;
  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  JsonToSend := TStringStream.Create(Utf8Encode(Json));


  try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  ErrorCode:='';
  if sResponse<>'' then
  begin

    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');


  if not result then   MessageDlg('Ошибка при выполнении команды SetupRRO', mtError, [mbOk], 0);

  if WRITE_DEBUG_INFO_RRO=1 then
  begin
     Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\SetupRRO.dat', false,  TEncoding.ANSI);
     Writer.Write(sResponse);
     Writer.Free();
  end;

end;

  if sResponse<>'' then
  begin

    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    JsonObject.Free;
  end;

  result:= (ErrorCode='Ok');

function TF_main.RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
NumFiscal,  NumLocal, OrderDateTime :string; is_prodaga:boolean; ORDERRETNUM:string ):boolean;
 var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONNestedObject: TJSONObject;
  JSONArray: TJSONArray;
  JsonValue :TJsonValue;

  JsonObjectCHECKHEAD: TJSONObject;
  JsonObjectCHECKTOTAL: TJSONObject;

  JSONArrayCHECKPAY: TJSONArray;
  JSONArrayPAYSYS: TJSONArray;
  JSONArrayCHECKTAX: TJSONArray;
  JSONArrayCHECKBODY: TJSONArray;
  JSONArrayEXCISELABELS: TJSONArray;
  JSONArrayCheck: TJSONObject;
    Writer: TStreamWriter;
  QRCodeS64:string;
  UNITCD:integer;
  LETTERS:string;
  is_repeat_Transfer, is_Transfered:boolean;
  ErrorCode:string;
  KassaNumFiscal:int64;
begin

 with DM1.QPrintCashCaption do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
     SKIDKA_KOLBASA:=FieldByName('SKIDKA_KOLBASA').AsFloat;
     SKIDKA_MYASO:=FieldByName('SKIDKA_MYASO').AsFloat;
     SKIDKA_TNP:=FieldByName('SKIDKA_TNP').AsFloat;
     PER_SKIDKA_KOLBASA:=FieldByName('PER_SKIDKA_KOLBASA').AsFloat;
     PER_SKIDKA_MYASO:=FieldByName('PER_SKIDKA_MYASO').AsFloat;
     PER_SKIDKA_TNP:=FieldByName('PER_SKIDKA_TNP').AsFloat;
     SKIDKA_COMMENT:=FieldByName('SKIDKA_COMMENT').AsString;
     MIN_KOLBASA:=FieldByName('MIN_KOLBASA').AsFloat;
     MIN_MYASO:=FieldByName('MIN_MYASO').AsFloat;
     MIN_TNP:=FieldByName('MIN_TNP').AsFloat;
     BONUS_NACHISL:=FieldByName('BONUS_NACHISL').AsFloat;
     BONUS_OLD:=FieldByName('BONUS_OLD').AsFloat;

     BONUS_NEW:=FieldByName('BONUS_NEW').AsFloat;
     NN:=FieldByName('NN').AsString;
     D_CREATE:=FieldByName('D_CREATE').AsFloat;
     TOT_SUM:=FieldByName('TOT_SUM').AsFloat;
     ROUND_SUM:=FieldByName('ROUND_SUM').AsFloat;
     SUM_OPL_BONUS:=FieldByName('SUM_OPL_BONUS').AsFloat;
     SUM_OPL_CARD:=FieldByName('SUM_OPL_CARD').AsFloat;
     SUM_POLUCH:=FieldByName('SUM_POLUCH').AsFloat;
     SUM_SDACHI:=FieldByName('SUM_SDACHI').AsFloat;
     SUM_SDACHI_TO_CARD:=FieldByName('SUM_SDACHI_TO_CARD').AsFloat;
     INN_D:=FieldByName('INN_D').AsString;
     INN_K:=FieldByName('INN_K').AsString;
     ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
     CARD_NN_NOT_FISCAL:=FieldByName('CARD_NN_NOT_FISCAL').AsString;
     TRANS_CODE_NOT_FISCAL:=FieldByName('TRANS_CODE_NOT_FISCAL').AsString;
     MINUS:=FieldByName('MINUS').AsFloat;
     ID_CLI_RRO:=FieldByName('ID_CLI_RRO').AsInteger;
     CHECK_NUMLOCAL:=FieldByName('CHECK_NUMLOCAL').AsString;
     CHECK_NUMFISCAL:=FieldByName('CHECK_NUMFISCAL').AsString;
      ORDERDATETIME_REG:=FieldByName('ORDERDATETIME').AsString;
      QRCODE_REG:=FieldByName('QRCODE_REG').AsString;
      CLI_RRO:=FieldByName('CLI_RRO').AsString;
      INN_RRO:=FieldByName('INN_RRO').AsString;

     Close;
  end;

 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'RegisterCheck');
  {
   if vIS_ALCOGOL_CHECK=1 then
  begin
    JsonObject.AddPair('Certificate', F_main.Certificate_ALCOGOL);
    JsonObject.AddPair('PrivateKey', F_main.PrivateKey_ALCOGOL);
    JsonObject.AddPair('Password', F_main.PasswordKey_ALCOGOL);
  end
  else
  begin
    JsonObject.AddPair('Certificate', F_main.Certificate);
    JsonObject.AddPair('PrivateKey', F_main.PrivateKey);
    JsonObject.AddPair('Password', F_main.PasswordKey);
  end;
  }

  if vIS_ALCOGOL_CHECK=0 then
    KassaNumFiscal:=F_Main.ID_NUM_FISCAL_KASSA
  else  KassaNumFiscal:=F_Main.ID_NUM_FISCAL_KASSA_ALCOGOL;

  JsonObject.AddPair('NumFiscal', TJSONNumber.Create(KassaNumFiscal));


  /////////////////////
  JsonObjectCHECKHEAD:= TJSONObject.Create;

  JsonObjectCHECKHEAD.AddPair('DOCTYPE', TJSONNumber.Create(0));  // Тип документа (числовий): 0-Чек реалізації товарів/послуг, 1-Чек переказу коштів, 2–Чек операції обміну валюти, 3-Чек видачі готівки, 4-Чек обслуговування у ломбарді, 100-Відкриття зміни, 101-Закриття зміни, 102-Початок офлайн сесії, 103-Завершення офлайн сесії-->

  if is_prodaga then
  begin
    JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(0)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Продажа#'+IntToStr(v_ID_NAKLCAP));

  end
  else
  begin
    JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(1)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Возврат#'+IntToStr(v_ID_NAKLCAP));
    JsonObjectCHECKHEAD.AddPair('ORDERRETNUM', ORDERRETNUM); // Фіскальний номер чека, для якого здійснюється повернення (зазначається тільки для чеків повернення) (128 символів)
  end;

 //////////////////////////////////////


  JsonObjectCHECKTOTAL:= TJSONObject.Create;
  JsonObjectCHECKTOTAL.AddPair('SUM', TJSONNumber.Create(TOT_SUM+ROUND_SUM{270.00})); // общая сумма чека  с учетом скидки и округлений
  JsonObjectCHECKTOTAL.AddPair('RNDSUM', TJSONNumber.Create(-1*ROUND_SUM{0.08}));  // сумма округления
  JsonObjectCHECKTOTAL.AddPair('NORNDSUM', TJSONNumber.Create(TOT_SUM{270.08}));  // сумма с учетом скидки без округления
  JsonObjectCHECKTOTAL.AddPair('NOTAXSUM', TJSONNumber.Create(TOT_SUM+MINUS{220.08})); // Сума чеку без урахування податків/зборів и скидок(15.2 цифри)
  JsonObjectCHECKTOTAL.AddPair('USAGETYPE', TJSONNumber.Create(2));   //Тип застосування знижки/націнки (числовий): 0–Попередній продаж, 1–Проміжний підсумок, 2–Спеціальна...
  JsonObjectCHECKTOTAL.AddPair('SUBCHECK', TJSONNumber.Create(TOT_SUM+MINUS{220.08}));  // Сума на яку нараховується знижка/націнка (15.2 цифри)-->
  JsonObjectCHECKTOTAL.AddPair('DISCOUNTTYPE', TJSONNumber.Create(0)); // Тип знижки/націнки (числовий): 0–Сумова, 1–Відсоткова
 // JsonObjectCHECKTOTAL.AddPair('DISCOUNTPERCENT', TJSONNumber.Create(10.00));  // Відсоток знижки/націнки, для відсоткових знижок/націнок (не зазначається при фіксованій сумі знижки/націнки) (15.2 цифри)-->
  JsonObjectCHECKTOTAL.AddPair('DISCOUNTSUM', TJSONNumber.Create(MINUS{50.00})); // Загальна сума знижки/націнки (15.2 цифри)-->

 ////////////////////////////////////////

  //Создаем массив оплат
    JSONArrayCHECKPAY:=TJSONArray.Create;
    {-- добавляем в массив первый объект --}


    if abs(SUM_POLUCH-SUM_SDACHI-SUM_SDACHI_TO_CARD) >Eps then  // оплата наличными
    begin   //
    // 1. заносим в массив пустой json-объект
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(0));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','ГОТІВКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_POLUCH-SUM_SDACHI

      ));   // Сума к оплате (15.2 цифри)
      JSONNestedObject.AddPair('PROVIDED', TJSONNumber.Create(SUM_POLUCH

      ));  //  Сума внесених коштів (15.2 цифри)
      JSONNestedObject.AddPair('REMAINS', TJSONNumber.Create(SUM_SDACHI)); //Решта (не зазначається, якщо решта відсутня) (15.2 цифри)-->
    end;




    if abs(SUM_OPL_BONUS)>Eps then    // безнал оплата дисконтной картой (бонусами)
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(4));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','Д-КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_BONUS));   // Сума к оплате (15.2 цифри)

    end;


    if abs(SUM_SDACHI_TO_CARD)>Eps then    // Сдача перечисляемая на бонускую карту
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(2));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','РЕШТА-КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(-SUM_SDACHI_TO_CARD));   // Сума к оплате (15.2 цифри)

    end;


     if abs(SUM_OPL_CARD)>Eps then    // безнал оплата банковской
    begin
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(1));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','КАРТКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_CARD));   // Сума к оплате (15.2 цифри)

    //Создаем массив платежных систем
      JSONArrayPAYSYS:=TJSONArray.Create;
      JSONArrayPAYSYS.AddElement(TJSONObject.Create);
      JSONNestedObject:=JSONArrayPAYSYS.Items[pred(JSONArrayPAYSYS.Count)] as TJSONObject;
      JSONNestedObject.AddPair('ACQUIRETRANSID',TRANS_CODE_NOT_FISCAL);   // Ідентифікатор транзакції, що надається еквайром та ідентифікує операцію в платіжній системі (128 символів)-->
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_OPL_CARD));   // Сума к оплате (15.2 цифри)


    end;
 ////////////////////////////////
//Создаем массив налогов
    JSONArrayCHECKTAX:=TJSONArray.Create;
    {-- добавляем в массив первый объект --}
    //  заносим в массив пустой json-объект
 {   JSONArrayCHECKTAX.AddElement(TJSONObject.Create);
     //получаем ссылку на добавленный объект
         JSONNestedObject:=JSONArrayCHECKTAX.Items[pred(JSONArrayCHECKTAX.Count)] as TJSONObject;
             //заполняем объект данными
                 JSONNestedObject.AddPair('TYPE', TJSONNumber.Create(0)); // тип налога 0-ПДВ; 1- акциз; 2 - ПФ
                     JSONNestedObject.AddPair('NAME','ПДВ');
                         JSONNestedObject.AddPair('LETTER','А');
                             JSONNestedObject.AddPair('PRC', TJSONNumber.Create(20.00));  //Відсоток податку/збору (15.2 цифри)
                                 JSONNestedObject.AddPair('SIGN', TJSONBool.Create(False)); // Ознака податку/збору, не включеного у вартість
                                     JSONNestedObject.AddPair('TURNOVER', TJSONNumber.Create(TOT_SUM ));  //Сума обсягів для розрахування податку/збору (15.2 цифри)

                                         JSONNestedObject.AddPair('SOURCESUM', TJSONNumber.Create(TOT_SUM )); // Вихідна сума для розрахування податку/збору (15.2 цифри)
                                             JSONNestedObject.AddPair('SUM', TJSONNumber.Create(TOT_SUM*0.2));  // Сума податку/збору (15.2 цифри)-->
                                             }
    if vIS_ALCOGOL_CHECK=1 then
    begin

    {-- добавляем в массив второй объект --}
    JSONArrayCHECKTAX.AddElement(TJSONObject.Create);
    //получаем ссылку на добавленный объект
    JSONNestedObject:=JSONArrayCHECKTAX.Items[pred(JSONArrayCHECKTAX.Count)] as TJSONObject;
    //заполняем объект данными
    JSONNestedObject.AddPair('TYPE', TJSONNumber.Create(1));
    JSONNestedObject.AddPair('NAME','Акциз');
    JSONNestedObject.AddPair('LETTER','Г');
    JSONNestedObject.AddPair('PRC', TJSONNumber.Create(5.00));
    JSONNestedObject.AddPair('TURNOVER', TJSONNumber.Create(TOT_SUM));
    JSONNestedObject.AddPair('SOURCESUM', TJSONNumber.Create(TOT_SUM));
    JSONNestedObject.AddPair('SUM', TJSONNumber.Create(TOT_SUM*0.05));
    end;

    //Создаем массив товаров чека
    JSONArrayCHECKBODY:=TJSONArray.Create;

    with DM1.QPrintReceipt do
    begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
      First;
      while not EOF do
      begin
       if FieldByName('IS_EXCISE').AsInteger=1 then
       begin

     // Создаем массив акцизных марок
        JSONArrayEXCISELABELS:=TJSONArray.Create;
        JSONArrayEXCISELABELS.AddElement(TJSONObject.Create);
        JSONNestedObject:=JSONArrayEXCISELABELS.Items[pred(JSONArrayEXCISELABELS.Count)] as TJSONObject;
        //заполняем объект данными
        JSONNestedObject.AddPair('EXCISELABEL', FieldByName('EXCISE_BAR_CODE').AsString);
       end;


        {-- добавляем в массив первый объект --}
        //  заносим в массив пустой json-объект
        JSONArrayCHECKBODY.AddElement(TJSONObject.Create);
        //получаем ссылку на добавленный объект
        JSONNestedObject:=JSONArrayCHECKBODY.Items[pred(JSONArrayCHECKBODY.Count)] as TJSONObject;
        //заполняем объект данными
        JSONNestedObject.AddPair('CODE', IntToStr(FieldByName('ID_TOV').AsInteger));  // Внутрішній код товару (64 символи)
        JSONNestedObject.AddPair('BARCODE',FieldByName('CODE').AsString);  // Штриховий код товару (64 символи)
        JSONNestedObject.AddPair('UKTZED',FieldByName('UKTZED').AsString); // Код товару згідно з УКТЗЕД (15 цифр)
        JSONNestedObject.AddPair('NAME',FieldByName('TOV_NAME').AsString);  // Найменування товару, послуги або операції (текст)

        if Trim(FieldByName('EDIZM').AsString)='кг' then UNITCD:=301
        else UNITCD:=2009;
        JSONNestedObject.AddPair('UNITCD', TJSONNumber.Create(UNITCD)); // Код одиниці виміру згідно класифікатора (5 цифр)

        JSONNestedObject.AddPair('UNITNM',FieldByName('EDIZM').AsString);   // Найменування одиниці виміру (64 символи); 2009 - шт; 0301 - кг
        JSONNestedObject.AddPair('AMOUNT', TJSONNumber.Create(FieldByName('SN').AsFloat)); // Кількість/об’єм товару (15.3 цифри)
        JSONNestedObject.AddPair('PRICE', TJSONNumber.Create(FieldByName('PRICE').AsFloat));   // цена с ндс
        if vIS_ALCOGOL_CHECK=1 then  LETTERS:='Г';
       // else  LETTERS:='А';
        JSONNestedObject.AddPair('LETTERS',LETTERS);                        // перечень литер налогов

        JSONNestedObject.AddPair('COST', TJSONNumber.Create(FieldByName('ST').AsFloat));  // Сума операції (15.2 цифри)
         if FieldByName('IS_EXCISE').AsInteger=1 then
           JSONNestedObject.AddPair(TJSONPair.Create('JSONArrayEXCISELABELS', JSONArrayEXCISELABELS)); // Акцизні марки

       // JSONNestedObject.AddPair('COMMENT','Коментар до товару');

        Next;
      end;



      Close;
    end;



    ////////////////////////////////////////

    JSONArrayCheck:=TJSONObject.Create;
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKHEAD', JsonObjectCHECKHEAD));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKTOTAL', JsonObjectCHECKTOTAL));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKPAY', JSONArrayCHECKPAY));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKTAX', JSONArrayCHECKTAX));
    JSONArrayCheck.AddPair(TJSONPair.Create('CHECKBODY', JSONArrayCHECKBODY));

  JsonObject.AddPair(TJSONPair.Create('Check', JSONArrayCheck));


  JsonObject.AddPair('GetQrCode', TJSONBool.Create(True));
  JsonObject.AddPair('QrSize', TJSONNumber.Create(256));

  Json :=JsonObject.ToJSON ;

  JsonObject.Free;

  if F_Main.WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheckQuery.dat', false,  TEncoding.ANSI);
    Writer.Write(Json);
    Writer.Free();
  end;



  JsonToSend := TStringStream.Create(Utf8Encode(Json));



   try
   is_repeat_Transfer:=True;
   is_Transfered:=False;
   while is_repeat_Transfer and not is_Transfered do
   begin
    sResponse:='';
    is_Transfered:= F_main.Transfer_Data_To_Fiskal_Server(JsonToSend, sResponse, is_repeat_Transfer);
   end;

  finally
    JsonToSend.Free;
  end;



  if F_Main.WRITE_DEBUG_INFO_RRO=1 then
  begin
    Writer := TStreamWriter.Create(ExtractFilePath(Application.ExeName)+'\RegisterCheck.dat', false,  TEncoding.ANSI);
    Writer.Write(sResponse);
    Writer.Free();
  end;

  ErrorCode:='';
  QRCodeS64:= '';
  QRCode:= '';
  NumFiscal:='';
  NumLocal:= '';
  OrderDateTime:='';
  if sResponse<>'' then
  begin

   { JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    QRCodeS64:= JsonObject.Get('QrCode').JsonValue.Value;
    QRCode:=DecodeString(QRCodeS64);
    NumFiscal:= JsonObject.Get('NumFiscal').JsonValue.Value;
    NumLocal:= JsonObject.Get('NumLocal').JsonValue.Value;
    OrderDateTime:= JsonObject.Get('OrderDateTime').JsonValue.Value;
    JsonObject.Free;  }

   JsonValue := TJSONObject.ParseJSONValue(sResponse);
    ErrorCode:= JsonValue.GetValue<String>('ErrorCode');
    QRCodeS64:= JsonValue.GetValue<String>('QrCode');
    QRCode:=DecodeString(QRCodeS64);
    NumFiscal:= JsonValue.GetValue<String>('NumFiscal');
    NumLocal:= JsonValue.GetValue<String>('NumLocal');
    OrderDateTime:=JsonValue.GetValue<String>('OrderDateTime');

    if vIS_ALCOGOL_CHECK=1 then F_Main.IS_KASSA_OFFLINE_ALCOGOL:=JsonValue.GetValue<Boolean>('Offline')
    else F_Main.IS_KASSA_OFFLINE:=JsonValue.GetValue<Boolean>('Offline');
    if vIS_ALCOGOL_CHECK=1 then
    begin
      if F_Main.IS_KASSA_OFFLINE then
          F_Main.L_shift_Opened_ALCOGOL.Caption:='Смена открыта offline'
      else  F_Main.L_shift_Opened_ALCOGOL.Caption:='Смена открыта online';
    end
    else
    begin
      if F_Main.IS_KASSA_OFFLINE then
          F_Main.L_shift_Opened.Caption:='Смена открыта offline'
      else  F_Main.L_shift_Opened.Caption:='Смена открыта online';
    end;
    JsonValue.Free;

  end;


  result:= (ErrorCode='Ok');


 // Writer := TStreamWriter.Create('e:\key1\QRCODE.JPEG', false,  TEncoding.ANSI);
 // Writer.Write(QRCode);
 // Writer.Free();


end;  // function RegisterCheck_RRO






*)

end.
