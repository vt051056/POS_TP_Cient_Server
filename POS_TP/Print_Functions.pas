unit Print_Functions;

interface

uses  UMainForm;

var
    Fiscal_Printer_Name:string;
    Not_Fiscal_Printer_Name:string;
    Fiscal_Printer_Index:integer;
    Not_Fiscal_Printer_Index:integer;
    SKIDKA_KOLBASA, SKIDKA_MYASO, SKIDKA_TNP:extended;
    PER_SKIDKA_KOLBASA, PER_SKIDKA_MYASO, PER_SKIDKA_TNP:extended;
    SKIDKA_COMMENT: string;
    MIN_KOLBASA, MIN_MYASO, MIN_TNP, BONUS_NACHISL,
    BONUS_OLD, BONUS_CALC, BONUS_NEW, MINUS,
    SUM_OPL_BONUS, SUM_OPL_CARD, SUM_POLUCH, SUM_SDACHI, ROUND_SUM, SUM_SDACHI_TO_CARD,
    TOT_MONEY :extended;
    NN, INN_D, INN_K:string;
    D_CREATE:TDateTime;
    TOT_SUM:extended;
    ID_DOC_TYPE:integer;
    ID_NAKLCAP:integer;
    CARD_NN_NOT_FISCAL, TRANS_CODE_NOT_FISCAL: string;

    ID_CLI_RRO:Integer;
    CHECK_NUMLOCAL:String;
    CHECK_NUMFISCAL:String;
    ORDERDATETIME_REG:String;
    QRCODE_REG:String;
    CLI_RRO:String;
    INN_RRO:String;

    var isExistFiscalPrinter:boolean;
      isExistFiscalTov:boolean;
      isExistNotFiscalTov:boolean;

 function ExistFiscalPrinter:boolean;
 procedure Print_Cash_Receipt_XP_58_NotFiscal;
 procedure Print_Cash_Receipt_POS_58_NotFiscal;
 procedure Print_Cash_Receipt_NotFiscal;
 procedure Print_Cash_Receipt_Fiscal(is_PRODAGA:boolean);
 procedure Print_Cash_Receipt(v_ID_NAKLCAP:integer; is_PRODAGA:boolean);
 procedure Print_Cash_Receipt_NotFiscal_All_TOV;   //  нефискальная печать всех товаров
 procedure Print_Cash_Receipt_XP_58_NotFiscal_All_TOV;
 procedure Print_Cash_Receipt_POS_58_NotFiscal_All_TOV;
 procedure Print_Cash_Receipt_Vozvrat_XP_58;
 procedure Print_Cash_Receipt_Vozvrat_POS_58;
 procedure Print_Cash_Receipt_Vozvrat_XP_58_All_TOV;
 procedure Print_Cash_Receipt_Vozvrat_POS_58_All_TOV;
 procedure Print_Cash_Receipt_VozvrNotFiscal_All_TOV;
 procedure Print_Cash_Receipt_VozvrNotFiscal;
 procedure Open_Cash_Box_Fiscal;
 procedure In_Cash_Box_Fiscal(sum_val:extended);  // внесение налички в фискальную кассу
 procedure Out_Cash_Box_Fiscal(sum_val:extended);  // изъятие налички из фискальной кассы
 procedure Tov_Report;
 procedure X_Report;
 procedure Z_Report;
 procedure NULL_CHECK;  // аннулирование чека
 procedure PrintToBuyerDisplay(s1_displ, s2_displ:string);   // вывод на дисплей покупателя

Procedure CennikPrint(productName, groupName: string; price: extended; id: integer;
shtrihcode  :string);

// печать чека с регистрацией РРО
procedure Print_Cash_ReceiptWithRegisterRRO(v_ID_NAKLCAP:integer; is_PRODAGA:boolean; vIS_ALCOGOL_CHECK:integer; ORDERRETNUM:string );


 procedure Print_Kassa_In_Out_RRO(vIS_ALCOGOL_CHECK: integer; is_In:boolean;  sumInOut: extended;
NumFiscal,  NumLocal, OrderDateTime :string);

// печать X- отчета
procedure Print_LastShiftTotals_RRO(vIS_ALCOGOL_CHECK: integer; vZREP:TZ_REP; ostat_kassy:extended);

// печать Z- отчета
procedure Print_ZRep_RRO(DataZRep:widestring);
// печать чека РРО
procedure Print_Check_RRO(DataRep:widestring);

implementation
uses UDataModule1, Printers, VCL.Dialogs, System.SysUtils, myfuncs, Vcl.Graphics,
Codage_CB, USaleDoc, CShPorts_TLB, lpos_vfd_lcd, System.JSON, System.Classes,System.Math,Jpeg;


// печать X- отчета
procedure Print_LastShiftTotals_RRO(vIS_ALCOGOL_CHECK: integer; vZREP:TZ_REP; ostat_kassy:extended);
var
s_print, sa:string;
y_print, dy_print:integer;
x_print, i:integer;


begin

try

  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);

  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;


    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= F_main.CLI_FISCAL; // Зарегистрировынный ФОП
    end
    else
    begin
      s_print:= F_main.CLI_FISCAL_ALCOGOL; // Зарегистрировынный ФОП
    end;

    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;
    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;

    for i := 0 to 1 do
    begin
      s_print:=Copy(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString, i*40+1, 40);
      Printer.Canvas.Font.Size := 6;
      x_print:= 0;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
    end;

    Printer.Canvas.Font.Size := 9;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL_ALCOGOL]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString;
    Printer.Canvas.Font.Size := 9;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 9;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA)]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA_ALCOGOL)]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Зміна з %s по %s', [DateTimeToStr(F_main.DataTimeShift_Opened),DateTimeToStr(Now())]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= 'Реалiзацiя';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Кiльк. чекiв %s', [IntToStr(vZREP.ZREPREALIZ.ORDERSCNT)]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Заг. сума без закругл. %8.2f', [vZREP.ZREPREALIZ.NORNDSUM]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Закруглення %8.2f', [vZREP.ZREPREALIZ.RNDSUM]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Загальна сума %8.2f', [vZREP.ZREPREALIZ.SUM]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= 'Оплати';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    for i := 0 to Length(vZREP.ZREPREALIZ.PAYFORMS)-1 do
    begin
      s_print:= Format('%d %s %8.2f', [vZREP.ZREPREALIZ.PAYFORMS[i].PAYFORMCD,
      vZREP.ZREPREALIZ.PAYFORMS[i].PAYFORMNM, vZREP.ZREPREALIZ.PAYFORMS[i].SUM ]);
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
     end;

    s_print:= 'Податки';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    for i := 0 to Length(vZREP.ZREPREALIZ.TAXES)-1 do
    begin
      s_print:= Format('%d %s %s %8.2f, %8.2f, %8.2f', [vZREP.ZREPREALIZ.TAXES[i].TYPE_TAX,
      vZREP.ZREPREALIZ.TAXES[i].NAME, vZREP.ZREPREALIZ.TAXES[i].LETTER, vZREP.ZREPREALIZ.TAXES[i].PRC,
      vZREP.ZREPREALIZ.TAXES[i].SOURCESUM,  vZREP.ZREPREALIZ.TAXES[i].SUM ]);
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
     end;



    s_print:= 'Повернення';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Кiльк. чекiв %d', [vZREP.ZREPRETURN.ORDERSCNT]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Загальна сума %8.2f', [vZREP.ZREPRETURN.SUM]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= 'Оплати повернення';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    for i := 0 to Length(vZREP.ZREPRETURN.PAYFORMS)-1 do
    begin
      s_print:= Format('%d %s %8.2f', [vZREP.ZREPRETURN.PAYFORMS[i].PAYFORMCD,
      vZREP.ZREPRETURN.PAYFORMS[i].PAYFORMNM, vZREP.ZREPRETURN.PAYFORMS[i].SUM ]);
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
     end;

    s_print:= 'Податки повернення';
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    for i := 0 to Length(vZREP.ZREPRETURN.TAXES)-1 do
    begin
      s_print:= Format('%d %s %s %8.2f, %8.2f, %8.2f', [vZREP.ZREPRETURN.TAXES[i].TYPE_TAX,
      vZREP.ZREPRETURN.TAXES[i].NAME, vZREP.ZREPRETURN.TAXES[i].LETTER, vZREP.ZREPRETURN.TAXES[i].PRC,
      vZREP.ZREPRETURN.TAXES[i].SOURCESUM,  vZREP.ZREPRETURN.TAXES[i].SUM ]);
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
     end;


    s_print:= Format('Внесення %8.2f', [vZREP.ZREPBODY.SERVICEINPUT]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);
    s_print:= Format('Вилучення %8.2f', [vZREP.ZREPBODY.SERVICEOUTPUT]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:= Format('Залишок у касi %8.2f', [ostat_kassy]);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;
end;



// печать чека РРО
procedure Print_Check_RRO(DataRep:widestring);
var
s_print, sa:string;
y_print, dy_print:integer;
x_print, i, j:integer;
s1,s:string;

begin

try
  s:= UTF8Decode(DataRep);

  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);

  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
  y_print:=0;
  Printer.BeginDoc;
  Printer.Canvas.Font.Size := 6;
  x_print:=0;



  i:= Pos(#$D+#$A,s);  // поиск конца строки и перевода каретки
  while i>0 do
  begin
    s1:=COPY(s,1,i-1);

     for j := 0 to 1 do
      begin
        s_print:=Copy(s1, j*40+1, 40);
        if s_print<>'' then
        begin
          Inc(y_print,dy_print);
          Printer.Canvas.TextOut(x_print,y_print,s_print);
        end;
      end;

    delete(s,1,i+1);
    i:= Pos(#$D+#$A,s);
  end;

  Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;
end;


// печать Z- отчета
procedure Print_ZRep_RRO(DataZRep:widestring);
var
s_print, sa:string;
y_print, dy_print:integer;
x_print, i, j:integer;
s1,s:string;

begin

try
  s:= UTF8Decode(DataZRep);

  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);

  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
  y_print:=0;
  Printer.BeginDoc;
  Printer.Canvas.Font.Size := 6;
  x_print:=0;



  i:= Pos(#$D+#$A,s);  // поиск конца строки и перевода каретки
  while i>0 do
  begin
    s1:=COPY(s,1,i-1);

     for j := 0 to 1 do
      begin
        s_print:=Copy(s1, j*40+1, 40);
        if s_print<>'' then
        begin
          Inc(y_print,dy_print);
          Printer.Canvas.TextOut(x_print,y_print,s_print);
        end;
      end;

    delete(s,1,i+1);
    i:= Pos(#$D+#$A,s);
  end;

  Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;
end;

procedure Print_Kassa_In_Out_RRO(vIS_ALCOGOL_CHECK: integer; is_In:boolean;  sumInOut: extended;
NumFiscal,  NumLocal, OrderDateTime :string);
var
s_print, sa:string;
y_print, dy_print:integer;
x_print, i:integer;

begin

try

  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);

  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;


    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= F_main.CLI_FISCAL; // Зарегистрировынный ФОП
    end
    else
    begin
      s_print:= F_main.CLI_FISCAL_ALCOGOL; // Зарегистрировынный ФОП
    end;

    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;
    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;

    for i := 0 to 1 do
    begin
      s_print:=Copy(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString, i*40+1, 40);
      Printer.Canvas.Font.Size := 6;
      x_print:= 0;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
    end;

    Printer.Canvas.Font.Size := 9;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL_ALCOGOL]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString;
    Printer.Canvas.Font.Size := 9;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 9;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA)]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA_ALCOGOL)]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);
    if is_In then
      s_print:= Format('Сума внесення %.2f', [sumInOut])
    else   s_print:= Format('Сума изъятия %.2f', [sumInOut]);
    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Inc(y_print,dy_print);
    Printer.Canvas.Font.Size := 7;
    s_print:= Format('ФН %s вiд %s ', [NumFiscal, OrderDateTime]);
    Printer.Canvas.TextOut(0,y_print,s_print);



    Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;
end;


(*
function RegisterCheck_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint; var QRCode,
NumFiscal,  NumLocal, OrderDateTime :string; is_prodaga:boolean; ORDERRETNUM:string ):boolean;
 var
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  JsonObject: TJSONObject;
  JSONNestedObject: TJSONObject;
  JSONArray: TJSONArray;

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

 JsonObject:=TJSONObject.Create;
  JsonObject.AddPair('Command', 'RegisterCheck');
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
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Продажа-ком');
  end
  else
  begin
    JsonObjectCHECKHEAD.AddPair('DOCSUBTYPE', TJSONNumber.Create(1)); // Розширений тип документа (числовий): 0-Касовий чек (реалізація), 1-Видатковий чек (повернення), 2-Чек операції «службове внесення»/«отримання авансу», 3-Чек операції «отримання підкріплення», 4–Чек операції «службова видача»/«інкасація», 5-Чек сторнування попереднього чека-->
    JsonObjectCHECKHEAD.AddPair('COMMENT', 'Возврат-ком');
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
    if abs(SUM_POLUCH-SUM_SDACHI-SUM_SDACHI_TO_CARD)>Eps then  // оплата наличными
    begin   //
    // 1. заносим в массив пустой json-объект
      JSONArrayCHECKPAY.AddElement(TJSONObject.Create);
      //получаем ссылку на добавленный объект
      JSONNestedObject:=JSONArrayCHECKPAY.Items[pred(JSONArrayCHECKPAY.Count)] as TJSONObject;
      //заполняем объект данными
      JSONNestedObject.AddPair('PAYFORMCD', TJSONNumber.Create(0));  // Код форми оплати (числовий): 0–Готівка, 1–Банківська картка, 2-Попередня оплата, 3-Кредит, ...
      JSONNestedObject.AddPair('PAYFORMNM','ГОТІВКА');   // наименование формы оплаты
      JSONNestedObject.AddPair('SUM', TJSONNumber.Create(SUM_POLUCH-SUM_SDACHI-SUM_SDACHI_TO_CARD));   // Сума к оплате (15.2 цифри)
      JSONNestedObject.AddPair('PROVIDED', TJSONNumber.Create(SUM_POLUCH-SUM_SDACHI_TO_CARD));  //  Сума внесених коштів (15.2 цифри)
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

    with DM1.QPrintReceipt do   // все товары в чеке открыт в Print_Cash_ReceiptWithRegisterRRO
    begin
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


Writer := TStreamWriter.Create('e:\key1\RegisterCheckQuery.dat', false,  TEncoding.ANSI);
  Writer.Write(Json);
  Writer.Free();



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




  Writer := TStreamWriter.Create('e:\key1\RegisterCheck.dat', false,  TEncoding.ANSI);
  Writer.Write(sResponse);
  Writer.Free();

  ErrorCode:='';
  QRCodeS64:= '';
  QRCode:= '';
  NumFiscal:='';
  NumLocal:= '';
  OrderDateTime:='';
  if sResponse<>'' then
  begin
    JsonObject := TJSONObject.ParseJSONValue(sResponse) as TJSONObject;
    ErrorCode:= JsonObject.Get('ErrorCode').JsonValue.Value;
    QRCodeS64:= JsonObject.Get('QrCode').JsonValue.Value;
    QRCode:=DecodeString(QRCodeS64);
    NumFiscal:= JsonObject.Get('NumFiscal').JsonValue.Value;
    NumLocal:= JsonObject.Get('NumLocal').JsonValue.Value;
    OrderDateTime:= JsonObject.Get('OrderDateTime').JsonValue.Value;
    JsonObject.Free;
  end;


  result:= (ErrorCode='Ok');


 // Writer := TStreamWriter.Create('e:\key1\QRCODE.JPEG', false,  TEncoding.ANSI);
 // Writer.Write(QRCode);
 // Writer.Free();


end;  // function RegisterCheck_RRO
*)



procedure Print_Cash_Receipt_RRO(vIS_ALCOGOL_CHECK: integer; v_ID_NAKLCAP:longint);
var
s_print, sa:string;
y_print, dy_print:integer;
x_print:integer;

JPEG: TJPEGImage;
QRCodeStream: TStringStream;

ScaleQRCodeImg:extended;

i:integer;
ss_kolbasa, ss_myaso, ss_tnp:extended;
ss_kolbasa_action, ss_myaso_action, ss_tnp_action:extended;

begin

try
  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);

  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;


    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= F_main.CLI_FISCAL; // Зарегистрировынный ФОП
    end
    else
    begin
      s_print:= F_main.CLI_FISCAL_ALCOGOL; // Зарегистрировынный ФОП
    end;

    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;

    for i := 0 to 1 do
    begin
      s_print:=Copy(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString, i*40+1, 40);
      Printer.Canvas.Font.Size := 6;
      x_print:= 0;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
    end;

    Printer.Canvas.Font.Size := 8;
    x_print:= 0;

    if F_Main.RRO_ENABLED=1 then
    begin
      Inc(y_print,dy_print);
      if vIS_ALCOGOL_CHECK=0 then
      begin
        s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL]); // Касса ПРРО
      end
      else
      begin
        s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL_ALCOGOL]); // Касса ПРРО
      end;
      Printer.Canvas.TextOut(x_print,y_print,s_print);
    end;


    s_print:=F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString;
    Printer.Canvas.Font.Size := 8;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA)]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA_ALCOGOL)]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);



    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');



    Inc(y_print,dy_print);
    Printer.Canvas.Font.Size := 7;
     // товарная составляющая

    with DM1.QPrintReceipt_Kolbasa  do
    begin
      First;
      ss_kolbasa:=0;
      ss_kolbasa_action:=0;
      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);

        if FieldByName('IS_ACTION').AsInteger=1 then
        begin
          sa:='Акція';
          ss_kolbasa_action:=ss_kolbasa_action+FieldByName('ST').Asfloat;
          Inc(y_print,dy_print);
          s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
          Printer.Canvas.TextOut(0,y_print,s_print);
        end
        else
        begin
          sa:='';
          ss_kolbasa:=ss_kolbasa+FieldByName('ST').Asfloat;
          if abs(SKIDKA_KOLBASA)>Eps then
          begin
            Inc(y_print,dy_print);
            s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_KOLBASA]);
            Printer.Canvas.TextOut(0,y_print,s_print);
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x (%6.2f - %6.2f)  = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('PRICE').Asfloat*PER_SKIDKA_KOLBASA/100,
              FieldByName('PRICE').Asfloat * (1-PER_SKIDKA_KOLBASA/100) * FieldByName('NUMB').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end
          else
          begin
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end;

        end;

        Inc(y_print,dy_print);

        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Kolbasa  do


    with DM1.QPrintReceipt_Myaso  do
    begin
      First;
      ss_myaso:=0;
      ss_myaso_action:=0;

      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        if FieldByName('IS_ACTION').AsInteger=1 then
        begin
         sa:='Акція';
         ss_myaso_action:=ss_myaso_action+FieldByName('ST').Asfloat;
         Inc(y_print,dy_print);
         s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
         Printer.Canvas.TextOut(0,y_print,s_print);
        end
        else
        begin
          sa:='';
          ss_myaso:=ss_myaso+FieldByName('ST').Asfloat;
          if abs(SKIDKA_MYASO)>Eps then
          begin
            Inc(y_print,dy_print);
            s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_MYASO]);
            Printer.Canvas.TextOut(0,y_print,s_print);
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x (%6.2f - %6.2f)  = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('PRICE').Asfloat*PER_SKIDKA_MYASO/100,
              FieldByName('PRICE').Asfloat * (1-PER_SKIDKA_MYASO/100) * FieldByName('NUMB').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end
          else
          begin
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end;
        end;

        Inc(y_print,dy_print);
        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Myaso  do



    with DM1.QPrintReceipt_TNP  do
    begin
      First;
      ss_tnp:=0;
      ss_tnp_action:=0;
      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        if FieldByName('IS_ACTION').AsInteger=1 then
        begin
          sa:='Акція';
          ss_tnp_action:=ss_tnp_action+FieldByName('ST').Asfloat;
          Inc(y_print,dy_print);
          s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
            FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
          Printer.Canvas.TextOut(0,y_print,s_print);
        end
        else
        begin
          sa:='';
          ss_tnp:=ss_tnp+FieldByName('ST').Asfloat;
          if abs(SKIDKA_TNP)>Eps then
          begin
            Inc(y_print,dy_print);
            s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_TNP]);
            Printer.Canvas.TextOut(0,y_print,s_print);
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x (%6.2f - %6.2f)  = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('PRICE').Asfloat*PER_SKIDKA_TNP/100,
              FieldByName('PRICE').Asfloat * (1-PER_SKIDKA_TNP/100) * FieldByName('NUMB').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end
          else
          begin
            Inc(y_print,dy_print);
            s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
              FieldByName('PRICE').Asfloat, FieldByName('ST').Asfloat, sa]);
            Printer.Canvas.TextOut(0,y_print,s_print);
          end;
        end;

        Inc(y_print,dy_print);

        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_TNP  do

  {  //----
    if abs(ss_kolbasa)>Eps then
    begin
      s_print:=Format('Сума неакц прод %6.2f%', [ss_kolbasa]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;
    if abs(ss_kolbasa_action)>Eps then
    begin
      s_print:=Format('Сума акц прод %6.2f%', [ss_kolbasa_action]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;

    if abs(SKIDKA_KOLBASA)>Eps then
    begin
      s_print:=Format('Знижка прод %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_KOLBASA]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

     // s_print:=Format('%6.2f%% x %6.2f = %6.2f',
    //  [PER_SKIDKA_KOLBASA, SKIDKA_KOLBASA*100/PER_SKIDKA_KOLBASA, (-1)*SKIDKA_KOLBASA]);
      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_KOLBASA, ss_kolbasa, (-1)*SKIDKA_KOLBASA]);

      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    //-----
    if abs(ss_myaso)>Eps then
    begin
      s_print:=Format('Сума неакц птиці %6.2f%', [ss_myaso]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;
    if abs(ss_myaso_action)>Eps then
    begin
      s_print:=Format('Сума акц птиці %6.2f%', [ss_myaso_action]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;

    if abs(SKIDKA_MYASO)>Eps then
    begin
      s_print:=Format('Знижка птиці %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_MYASO]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

   //   s_print:=Format('%6.2f%% x %6.2f = %6.2f',
   //   [PER_SKIDKA_MYASO, SKIDKA_MYASO*100/PER_SKIDKA_MYASO, (-1)*SKIDKA_MYASO]);
      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_MYASO, ss_myaso, (-1)*SKIDKA_MYASO]);

      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    //----
    if abs(ss_tnp)>Eps then
    begin
      s_print:=Format('Сума неакц тов %6.2f%', [ss_tnp]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;
    if abs(ss_tnp_action)>Eps then
    begin
      s_print:=Format('Сума акц тов %6.2f%', [ss_tnp_action]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
    end;

    if abs(SKIDKA_TNP)>Eps then
    begin
      s_print:=Format('Знижка тов %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_TNP]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    //  s_print:=Format('%6.2f%% x %6.2f = %6.2f',
    //  [PER_SKIDKA_TNP, SKIDKA_TNP*100/PER_SKIDKA_TNP, (-1)*SKIDKA_TNP]);
      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_TNP, ss_tnp, (-1)*SKIDKA_TNP]);

      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    }

    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
   // Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'СУМА');
    Printer.Canvas.Font.Style := [];
   // Printer.Canvas.TextOut(200, y_print,Format('%6.2f', [F_SaleDoc.TOT_SUM_NOT_FISCAL]));
    Printer.Canvas.TextOut(200, y_print,Format('%6.2f', [TOT_SUM]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

    if abs(SUM_OPL_BONUS)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Сплачено бонусом ');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_OPL_BONUS]));
    end;

   // if abs(F_SaleDoc.D_ROUND_TOT_SUM_NOT_FISCAL)>Eps then
    if abs(ROUND_SUM)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ЗАОКРУГЛЕННЯ ');
     // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.D_ROUND_TOT_SUM_NOT_FISCAL]));
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [ROUND_SUM]));
    end;

     Inc(y_print,2*dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'ДО СПЛАТИ ');
   // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.TOT_MONEY]));
    Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [TOT_MONEY]));

   // if F_SaleDoc.IS_BANK_TRANSACTION_NOT_FISCAL then
    if Trim(TRANS_CODE_NOT_FISCAL)<>'' then
    begin
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Опл.карткою');
     // Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_NN_NOT_FISCAL]));
      Printer.Canvas.TextOut(200,y_print, Format('%s', [CARD_NN_NOT_FISCAL]));

    //  Inc(y_print,dy_print);
    //  Printer.Canvas.TextOut(0,y_print,'Плат.сист.');
    //  Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_PAY_SYSTEM]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Танзакция');
    //  Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CODE_TRANSACTION_NOT_FISCAL]));
      Printer.Canvas.TextOut(200,y_print, Format('%s', [TRANS_CODE_NOT_FISCAL]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'СУМА');
     // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_OPL_CARD]));
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_OPL_CARD]));
    end
    else
    begin

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ГОТIВКА');
      // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_OPL_NAL]));
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_POLUCH]));
    end;


    Inc(y_print,dy_print);
    //if (F_SaleDoc.SUM_SDACHA<-Eps) then
    if (SUM_SDACHI<-Eps) then
      Printer.Canvas.TextOut(0,y_print,'Борг')
    else  Printer.Canvas.TextOut(0,y_print,'РЕШТА');

  //  Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA+F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]));
    Printer.Canvas.TextOut(200,y_print, Format('%6.2f',
      [SUM_SDACHI+SUM_SDACHI_TO_CARD]));
    Inc(y_print,dy_print);

   // if (F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD>Eps) then
    if (SUM_SDACHI_TO_CARD>Eps) then
    begin
      Printer.Canvas.TextOut(0,y_print,'РЕШТА на карту');
     // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]));
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_SDACHI_TO_CARD]));
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'РЕШТА готiвкою');
     // Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA]));
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_SDACHI]));
      Inc(y_print,dy_print);
    end;


    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

 //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE)]);
//    Inc(y_print,dy_print);
 //   Printer.Canvas.TextOut(0,y_print,s_print);


   // ID_CLIENT, CLI_D , is_Registered_Client  Edit_BonusCard.Text
     Inc(y_print,dy_print);
    if ID_DOC_TYPE=200 then
    begin
      if INN_D<>'' then
      begin
        s_print:= Format('Бонусна карта № %s', [INN_D]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);
        s_print:= Format('Було бонусiв %6.2f', [BONUS_OLD]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Використано бонусiв -%6.2f', [SUM_OPL_BONUS]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Нараховано бонусiв +%6.2f', [BONUS_NACHISL]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
       // s_print:= Format('Решта на бон.карту +%6.2f', [F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]);
        s_print:= Format('Решта на бон.карту +%6.2f', [SUM_SDACHI_TO_CARD]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        //Inc(y_print,dy_print);
       // s_print:= Format('Заокруглення бонусiв =%6.2f', [Int(BONUS_NEW)-BONUS_NEW]);
       // Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);
        //s_print:= Format('Накопичено бонусiв =%6.2f', [Int(BONUS_NEW)]);
        s_print:= Format('Накопичено бонусiв =%6.2f', [BONUS_NEW]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
      end; // if INN_D<>'' then
    end;   //  if ID_DOC_TYPE=200 then


  {  Inc(y_print,dy_print);
    s_print:= Format('Чек №%s вiд %s %s ', [NN, DateToStr(D_CREATE), TimeToStr(D_CREATE)]);
    Printer.Canvas.TextOut(0,y_print,s_print);
    Inc(y_print,dy_print);
}

     { Inc(y_print,dy_print);
      s_print:= Format('ЛФН %s', [CHECK_NUMLOCAL]);
      Printer.Canvas.TextOut(0,y_print,s_print);  }
      Inc(y_print,dy_print);
      s_print:= Format('ФН %s', [CHECK_NUMFISCAL]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
      s_print:= Format('вiд %s ', [ORDERDATETIME_REG]);
      Printer.Canvas.TextOut(0,y_print,s_print);



      if F_Main.RRO_ENABLED=1 then
      begin
      // печать QRCODE

        try
        QRCodeStream:=TStringStream.Create(QRCODE_REG);
        JPEG := TJPEGImage.create;
        JPEG.LoadFromStream(QRCodeStream);
        QRCodeStream.Free;

        ScaleQRCodeImg := 0.75* Printer.PageWidth / JPEG.Width;


        Inc(y_print,dy_print);
       // x_print:= round((Printer.PageWidth - JPEG.Width)/2);
       // Printer.Canvas.Draw(x_print,y_print, JPEG);
        x_print:= round((Printer.PageWidth - Trunc(ScaleQRCodeImg * JPEG.Width))/2);
        Printer.Canvas.StretchDraw(Rect(x_print, y_print, x_print+Trunc(ScaleQRCodeImg * JPEG.Width),
         y_print+Trunc(ScaleQRCodeImg * JPEG.Height)), JPEG);
        Inc(y_print,dy_print+Trunc(ScaleQRCodeImg * JPEG.Height));
        JPEG.free;
        except
          MessageDlg('Ошибка QR кода!', mtError, [mbOk], 0);

        end;
      end;



    s_print:=Format('Гаряча лiнiя %s', [F_Main.CHECK_HOT_LINE_FIRM_TEL]);
    Printer.Canvas.TextOut(0,y_print,s_print);
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
     Inc(y_print,dy_print);
    with F_main.Q_Advert do
    begin
      if  not Active then
      begin
        Parameters.ParamByName('TYPE_MSG').Value:=5; // для покупателя
        Open;
      end;

      First;
      while not EOF  do
      begin
         Printer.Canvas.TextOut(0,y_print,FieldByName('MSG').AsString);
          Inc(y_print,dy_print);
        Next;
      end;
    end;

    Printer.Canvas.TextOut(0,y_print,F_Main.CHECK_FOOTER_SLOGAN); //Хай завжди буде смачно!
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,F_Main.CHECK_FOOTER_TXT); //Не є фіскальним чеком
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'___________________________________');
    Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;

end;  // procedure Print_Cash_Receipt_RRO);



procedure Print_Cash_Receipt_Vozvrat_RRO(vIS_ALCOGOL_CHECK:integer; v_ID_NAKLCAP:longint; ORDERRETNUM:string);
var
s_print:string;
y_print, dy_print, i:integer;
x_print:integer;

JPEG: TJPEGImage;
QRCodeStream: TStringStream;
ScaleQRCodeImg:extended;

begin

try

  // здесь вывод на печать чека  ID_NAKLCAP
   Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
    dy_print:=25;
    x_print:=0;
    y_print:=0;
    Printer.BeginDoc;
 Printer.Canvas.Font.Size := 7;


    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= F_main.CLI_FISCAL; // Зарегистрировынный ФОП
    end
    else
    begin
      s_print:= F_main.CLI_FISCAL_ALCOGOL; // Зарегистрировынный ФОП
    end;

    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString;

    for i := 0 to 1 do
    begin
      s_print:=Copy(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString, i*40+1, 40);
      Printer.Canvas.Font.Size := 6;
      x_print:= 0;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(x_print,y_print,s_print);
    end;

    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('IД %s', [F_main.INN_CLI_FISCAL_ALCOGOL]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    s_print:=F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString;
    Printer.Canvas.Font.Size := 8;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 8;
    x_print:= 0;
    Inc(y_print,dy_print);
    if vIS_ALCOGOL_CHECK=0 then
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA)]); // Касса ПРРО
    end
    else
    begin
      s_print:= Format('Каса № %s', [IntToStr(F_main.ID_NUM_FISCAL_KASSA_ALCOGOL)]); // Касса ПРРО
    end;
    Printer.Canvas.TextOut(x_print,y_print,s_print);



    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');


    Printer.Canvas.Font.Size := 9;
    Inc(y_print,dy_print);
    s_print:='Повернення';
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');


    // товарная составляющая

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    x_print:=0;
    with DM1.QPrintReceipt  do
    begin

      First;
      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f ', [FieldByName('SN').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat]);

        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        Next;
      end;


    end; //  with DM1.QPrintReceipt  do

    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'СУММА');
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(x_print+200, y_print, Format('%6.2f', [TOT_SUM]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
     Inc(y_print,dy_print*2);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'ГОТIВКА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_POLUCH]));
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'РЕШТА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_SDACHI]));
    Printer.Canvas.Font.Style := [];
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');


      Inc(y_print,dy_print);
      s_print:= Format('ФН %s', [CHECK_NUMFISCAL]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);
      s_print:= Format('вiд %s ', [ORDERDATETIME_REG]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      // печать QRCODE
      if F_Main.RRO_ENABLED=1 then
      begin
      // печать QRCODE

        try
        QRCodeStream:=TStringStream.Create(QRCODE_REG);
        JPEG := TJPEGImage.create;
        JPEG.LoadFromStream(QRCodeStream);
        QRCodeStream.Free;

        ScaleQRCodeImg := 0.75* Printer.PageWidth / JPEG.Width;


        Inc(y_print,dy_print);
       // x_print:= round((Printer.PageWidth - JPEG.Width)/2);
       // Printer.Canvas.Draw(x_print,y_print, JPEG);
        x_print:= round((Printer.PageWidth - Trunc(ScaleQRCodeImg * JPEG.Width))/2);
        Printer.Canvas.StretchDraw(Rect(x_print, y_print, x_print+Trunc(ScaleQRCodeImg * JPEG.Width),
         y_print+Trunc(ScaleQRCodeImg * JPEG.Height)), JPEG);
        Inc(y_print,dy_print+Trunc(ScaleQRCodeImg * JPEG.Height));
        JPEG.free;
        except
          MessageDlg('Ошибка QR кода!', mtError, [mbOk], 0);

        end;
      end;


      Inc(y_print,dy_print);
  //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE) ]);
  //   Printer.Canvas.TextOut(x_print,y_print,s_print);


    s_print:=Format('Гаряча лiнiя %s', ['(057)7557770']);
      Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,F_Main.CHECK_FOOTER_TXT); //Не є фіскальним чеком
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');

    Printer.EndDoc;
 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;

end;     // procedure Print_Cash_Receipt_Vozvrat_RRO





procedure Print_Cash_ReceiptWithRegisterRRO(v_ID_NAKLCAP:integer; is_PRODAGA:boolean; vIS_ALCOGOL_CHECK:integer; ORDERRETNUM:string );
begin
// для отладки

// MessageDlg('Чек напечатан! Удалить этот код после отладки', mtError,[mbOk], 0);
//  exit;


ID_NAKLCAP:= v_ID_NAKLCAP;
// инфо о документе

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
      TOT_MONEY:= TOT_SUM + ROUND_SUM - SUM_OPL_BONUS;

     Close;
  end;



  // колбасы  и фискал и нефискал
 with DM1.QPrintReceipt_Kolbasa do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

  // мясо  и фискал и нефискал
 with DM1.QPrintReceipt_Myaso do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

    // ТНП  и фискал и нефискал
 with DM1.QPrintReceipt_TNP do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;




 with DM1.QPrintReceipt do   // все товары для возвратов
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;


    // вывод всех товаров в на принтер
    if is_PRODAGA then Print_Cash_Receipt_RRO(vIS_ALCOGOL_CHECK,v_ID_NAKLCAP)   //   печать всех товаров продажи
    else Print_Cash_Receipt_Vozvrat_RRO(vIS_ALCOGOL_CHECK, v_ID_NAKLCAP, ORDERRETNUM);       //   печать всех товаров возврата




 // DM1.QPrintCashCaption.Close;

  DM1.QPrintReceipt_Kolbasa.Close;
  DM1.QPrintReceipt_Myaso.Close;
  DM1.QPrintReceipt_TNP.Close;


  DM1.QPrintReceipt.Close;


end;  // procedure Print_Cash_ReceiptWithRegisterRRO




function ExistFiscalPrinter:boolean;
begin
  result:=False;
  Fiscal_Printer_Name:='';
  Fiscal_Printer_Index:=-100;
  Not_Fiscal_Printer_Name:='';
  Not_Fiscal_Printer_Index:=-100;
  with DM1.Q_PrinterSetup do
  begin
     Close;
     Open;
     First;
     while not EOF do
     begin
       if FieldByName('IS_FISCAL').AsInteger=1 then
       begin
        result:=True;
        Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;

       end
       else
       begin
        Not_Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Not_Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;
       end;
      Next;
     end;
     Close;
   end;

end;


procedure Open_Cash_Box_Fiscal;
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printer:integer;
command_Str:string;
begin

  coKripton :=    CShPorts_TLB.CoKripton(F_main);
  krip := coKripton.Create();
  status_Fiscal_Printer:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printer=0 then
  begin
  // открыть денежный ящик
    command_Str := F_Main.PASSW_FISCAL+';';
    krip.SendCommand($83,command_Str);

  end;
  krip.ClosePort;
end;

procedure In_Cash_Box_Fiscal(sum_val:extended);  // внесение налички в фискальную кассу
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printer:integer;
command_Str, sum_str:string;
begin

  coKripton :=    CShPorts_TLB.CoKripton(F_main);
  krip := coKripton.Create();
  status_Fiscal_Printer:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printer=0 then
  begin
    sum_str:=StringReplace(Format('%.2f',[sum_val]), ',','.',[rfReplaceAll, rfIgnoreCase]);
    command_Str :=  F_Main.PASSW_FISCAL+';'+'0;'+ sum_str + ';';
    krip.SendCommand($6E, command_Str);

  end;
  krip.ClosePort;
end;

procedure Out_Cash_Box_Fiscal(sum_val:extended);  // изъятие налички из фискальной кассы
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printer:integer;
command_Str, sum_str:string;
begin

  coKripton :=    CShPorts_TLB.CoKripton(F_main);
  krip := coKripton.Create();
  status_Fiscal_Printer:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printer=0 then
  begin
    sum_str:=StringReplace(Format('%.2f',[sum_val]), ',','.',[rfReplaceAll, rfIgnoreCase]);
    command_Str :=  F_Main.PASSW_FISCAL+';'+'0;'+ sum_str + ';';
    krip.SendCommand($6E, command_Str);

  end;
  krip.ClosePort;
end;


procedure NULL_CHECK;  // аннулирование чека
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printeg:integer;
command_Str:string;
begin
 coKripton :=    CShPorts_TLB.CoKripton(F_Main);
  krip := coKripton.Create();
  status_Fiscal_Printeg:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printeg=0 then
  begin
    command_Str :=  F_Main.PASSW_FISCAL+';'+'0;';
    krip.SendCommand($6B, command_Str);

  end
  else
  begin
    MessageDlg('Ошибка открытия фискального принтера! '+krip.Error, mtError,[mbOk], 0);
    krip.ClosePort;
    Exit;
  end;


  krip.ClosePort;

end;





procedure Tov_Report;
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printeg:integer;
command_Str:string;
begin
 coKripton :=    CShPorts_TLB.CoKripton(F_Main);
  krip := coKripton.Create();
  status_Fiscal_Printeg:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printeg=0 then
  begin
     // не работает !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    command_Str :=  F_Main.PASSW_FISCAL+';'+
    '0;999999;';
    krip.SendCommand($A4, command_Str);

  end
  else
  begin
    MessageDlg('Ошибка открытия фискального принтера! '+krip.Error, mtError,[mbOk], 0);
    krip.ClosePort;
    Exit;
  end;


  krip.ClosePort;

end;


procedure X_Report;
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printeg:integer;
command_Str:string;
begin
 coKripton :=    CShPorts_TLB.CoKripton(F_Main);
  krip := coKripton.Create();
  status_Fiscal_Printeg:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printeg=0 then
  begin
    command_Str :=  F_Main.PASSW_FISCAL+';'+'1;';
    krip.SendCommand($A1, command_Str);

  end
  else
  begin
    MessageDlg('Ошибка открытия фискального принтера! '+krip.Error, mtError,[mbOk], 0);
    krip.ClosePort;
    Exit;
  end;


  krip.ClosePort;

end;

procedure Z_Report;
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printeg:integer;
command_Str:string;
begin
 coKripton :=    CShPorts_TLB.CoKripton(F_Main);
  krip := coKripton.Create();
  status_Fiscal_Printeg:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printeg=0 then
  begin
    command_Str :=  F_Main.PASSW_FISCAL+';'+'0;';
    krip.SendCommand($A1, command_Str);

  end
  else
  begin
    MessageDlg('Ошибка открытия фискального принтера! '+krip.Error, mtError,[mbOk], 0);
    krip.ClosePort;
    Exit;
  end;


  krip.ClosePort;


end;


{
function ExistFiscalTov:boolean;
begin
  result:=False;
  with DM1.QPrintReceipt_Tov_Fiscal do
  begin
     Close;

     Open;
     First;
     while not EOF do
     begin
       if FieldByName('IS_FISCAL').AsInteger=1 then
       begin
        result:=True;
        Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;

       end
       else
       begin
        Not_Fiscal_Printer_Name:=FieldByName('PRINTER_NAME').AsString;
        Not_Fiscal_Printer_Index:=FieldByName('PRINTER_INDEX').AsInteger;
       end;
      Next;
     end;
     Close;
   end;

  end;
 }

procedure Print_Cash_Receipt_Fiscal(is_PRODAGA:boolean);
var coKripton : CShPorts_TLB.CoKripton;
var krip : cshports_tlb.Kripton;
status_Fiscal_Printeg:integer;
command_Str:string;
tov_name:string;
numb_str, price_str, sum_pay_str,excise_bar_code_srt:string;
round_Sum_Opl:extended;
i:integer;
begin

  coKripton :=    CShPorts_TLB.CoKripton(F_Main);
  krip := coKripton.Create();
  status_Fiscal_Printeg:=krip.OpenPort(F_Main.COM_PORT_FISCAL, 9600);
  if status_Fiscal_Printeg=0 then
  begin

  // анулирование всего чека, если была ошибка в предыдущем
    command_Str := F_Main.PASSW_FISCAL+';'+'0;';
    krip.SendCommand($6B, command_Str);

  // открываем фискальный чек
  //   пароль; №оператора;№кассы; тип чека(0-продажа, 1-воврат)
  if is_PRODAGA then  command_Str := F_Main.PASSW_FISCAL+';'+'0;1;0;'
  else  command_Str := F_Main.PASSW_FISCAL+';'+'0;1;1;';
    krip.SendCommand($63, command_Str);
  end
  else
  begin
    MessageDlg('Ошибка открытия фискального принтера! '+krip.Error, mtError,[mbOk], 0);
    krip.ClosePort;
    Exit;
  end;



  with DM1.QPrintReceipt_Tov_Fiscal do
  begin
    First;
    while not eof do
    begin
       // инфо о товаре
      tov_name:= Copy(Trim(FieldByName('TOV_NAME').AsString),1,75);   // ограничение 75 символов
      command_Str :=  F_Main.PASSW_FISCAL+';'+
        IntToStr(FieldByName('ID_TOV').AsInteger)+';'+
        tov_name+';'+
        // Налоговая группа, №отдела,модификатор(00-весовой товар)
        F_Main.GRUP_FISCAL+';'+'0;00;'+
        Trim(FieldByName('EDIZM').AsString)+';'+
        Trim(FieldByName('UKTZED').AsString)+';';
      //  +     FieldByName('CODE').AsString+';';
      krip.SendCommand($24, command_Str);

  //     MessageDlg('24 Прогр тов! '+command_Str, mtError,[mbOk], 0);

      // продажа товара
      numb_str:=StringReplace(Format('%.3f',[FieldByName('NUMB').AsFloat]), ',','.',[rfReplaceAll, rfIgnoreCase]);
      price_str:=StringReplace(Format('%.2f',[FieldByName('PRICE').AsFloat]), ',','.',[rfReplaceAll, rfIgnoreCase]);

      if FieldByName('IS_EXCISE').AsInteger=1 then
      begin    // продажа с акцизной маркой

        // получить список штрихкодов акцизных марок товара  ID_TOV
        DM1.Q_EXCISE_BAR_CODE.Close;
        DM1.Q_EXCISE_BAR_CODE.Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
        DM1.Q_EXCISE_BAR_CODE.Parameters.ParamByName('ID_TOV').Value:=FieldByName('ID_TOV').AsInteger;
        DM1.Q_EXCISE_BAR_CODE.Open;
        DM1.Q_EXCISE_BAR_CODE.First;
        excise_bar_code_srt:='';
        while not DM1.Q_EXCISE_BAR_CODE.EOF do
        begin
          excise_bar_code_srt:= excise_bar_code_srt+
            DM1.Q_EXCISE_BAR_CODE.FieldByName('EXCISE_BAR_CODE').AsString+';';
          DM1.Q_EXCISE_BAR_CODE.Next;
        end; //  while not DM1.Q_EXCISE_BAR_CODE.EOF do

        if DM1.Q_EXCISE_BAR_CODE.RecordCount<6 then
        begin   // дополнить пустыми параметрами
         for i := 1 to 6-DM1.Q_EXCISE_BAR_CODE.RecordCount do
             excise_bar_code_srt:= excise_bar_code_srt+';';
        end;

        DM1.Q_EXCISE_BAR_CODE.Close;
        command_Str :=   F_Main.PASSW_FISCAL+';' + IntToStr(FieldByName('ID_TOV').AsInteger) + ';' +
        numb_str + ';'+
        price_str + ';'+
        excise_bar_code_srt;
        krip.SendCommand($7C, command_Str);
      end
      else
      begin  // продажа без акцизной марки
        command_Str :=   F_Main.PASSW_FISCAL+';' + IntToStr(FieldByName('ID_TOV').AsInteger) + ';' +
        numb_str + ';'+
        price_str + ';';
        krip.SendCommand($64, command_Str);
      end;

     //   MessageDlg('64 Продажа тов! '+command_Str, mtError,[mbOk], 0);

      Next;
    end;  //     while not eof do

  end; //   with DM1.QPrintReceipt_Tov_Fiscal do
    // вывод итогов
  command_Str:=F_Main.PASSW_FISCAL+';'+'1;';
  krip.SendCommand($6D, command_Str);
  //    MessageDlg('6D Итоги! '+command_Str, mtError,[mbOk], 0);

// MessageDlg('итог фискального принтера! '+krip.Error, mtError,[mbOk], 0);
  if F_SaleDoc.IS_BANK_TRANSACTION_FISCAL then
  begin
  //оплата  безнал   картой
    sum_pay_str:=StringReplace(Format('%.2f',[F_SaleDoc.SUM_OPL_CARD_FISCAL]), ',','.',[rfReplaceAll, rfIgnoreCase]);
    //  тип платежа 1 - (кол=во форм оплаты 1 нал)
   // command_Str:= F_Main.PASSW_FISCAL+';'+'1;'+sum_pay_str+';'+IntToStr(ID_NAKLCAP)+';';

    command_Str:= F_Main.PASSW_FISCAL+';'+'1;'+sum_pay_str+';'+F_SaleDoc.CODE_TRANSACTION_FISCAL+';';
    krip.SendCommand($78, command_Str);
  //    MessageDlg('78 Оплата! '+command_Str, mtError,[mbOk], 0);

  end
  else
  begin

  //оплата  наличкой
    sum_pay_str:=StringReplace(Format('%.2f',[F_SaleDoc.SUM_OPL_NAL_FISCAL]), ',','.',[rfReplaceAll, rfIgnoreCase]);
    //  тип платежа 0 - (кол=во форм оплаты 1 нал)
    command_Str:= F_Main.PASSW_FISCAL+';'+'0;'+sum_pay_str+';';
    krip.SendCommand($67, command_Str);
  end;



 // MessageDlg('оплата фискального принтера! '+krip.Error, mtError,[mbOk], 0);



  // закрыть чек
  command_Str:=F_Main.PASSW_FISCAL+';'+'0;';
  krip.SendCommand($65, command_Str);
  //    MessageDlg('65 закрытие! '+command_Str, mtError,[mbOk], 0);
 // MessageDlg('закрытие фискального принтера! '+krip.Error, mtError,[mbOk], 0);

  krip.ClosePort;


end;   // Print_Cash_Receipt_Fiscal

procedure Print_Cash_Receipt(v_ID_NAKLCAP:integer; is_PRODAGA:boolean );

begin
// для отладки

// MessageDlg('Чек напечатан! Удалить этот код после отладки', mtError,[mbOk], 0);
//  exit;




ID_NAKLCAP:= v_ID_NAKLCAP;
// инфо о документе
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
     INN_D:=FieldByName('INN_D').AsString;
     INN_K:=FieldByName('INN_K').AsString;
     ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
     Close;
  end;
  isExistFiscalPrinter:=ExistFiscalPrinter;
  // фискальные товары
  with DM1.QPrintReceipt_Tov_Fiscal do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
     isExistFiscalTov:=(RecordCount>0);
  end;
  // нефискальные товары
 with DM1.QPrintReceipt_Tov_NotFiscal do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
     isExistNotFiscalTov:=(RecordCount>0);
  end;


  // колбасы  и фискал и нефискал
 with DM1.QPrintReceipt_Kolbasa do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

  // мясо  и фискал и нефискал
 with DM1.QPrintReceipt_Myaso do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

    // ТНП  и фискал и нефискал
 with DM1.QPrintReceipt_TNP do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;


  // колбасы  нефискал
 with DM1.QPrintReceipt_Kolbasa_NotFiscal do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

  // мясо  нефискал
 with DM1.QPrintReceipt_Myaso_NotFiscal do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

    // ТНП  нефискал
 with DM1.QPrintReceipt_TNP_NotFiscal do
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

 with DM1.QPrintReceipt do   // все товары для возвратов
  begin
     Close;
     Parameters.ParamByName('ID_NAKLCAP').Value:= v_ID_NAKLCAP;
     Open;
     First;
  end;

  if isExistFiscalPrinter then
  begin
    if isExistFiscalTov then // есть фискальные товары
    begin
      Print_Cash_Receipt_Fiscal(is_PRODAGA);    // фискальная печать продажи или возврата
    end;
    if isExistNotFiscalTov then // есть нефискальные товары
    begin
      if is_PRODAGA then Print_Cash_Receipt_NotFiscal   //  нефискальная печать продажи
      else Print_Cash_Receipt_VozvrNotFiscal ; //  нефискальная печать возврата
    end;

  end // if isExistFiscalPrinter  then
  else
  begin   // нет фискальных принтеров
    // вывод всех товаров в нефискальный принтер
    if is_PRODAGA then Print_Cash_Receipt_NotFiscal_All_TOV   //  нефискальная печать всех товаров продажи
    else Print_Cash_Receipt_VozvrNotFiscal_All_TOV ;                                        //  нефискальная печать всех товаров возврата
  end; //  else if isExistFiscalPrinter then



  DM1.QPrintCashCaption.Close;
  DM1.QPrintReceipt_Tov_Fiscal.Close;
  DM1.QPrintReceipt_Tov_NotFiscal.Close;
  DM1.QPrintReceipt_Kolbasa.Close;
  DM1.QPrintReceipt_Myaso.Close;
  DM1.QPrintReceipt_TNP.Close;
  DM1.QPrintReceipt_Kolbasa_NotFiscal.Close;
  DM1.QPrintReceipt_Myaso_NotFiscal.Close;
  DM1.QPrintReceipt_TNP_NotFiscal.Close;

  DM1.QPrintReceipt.Close;


end;  // procedure Print_Cash_Receipt(v_ID_NAKLCAP:integer);

procedure Print_Cash_Receipt_NotFiscal_All_TOV;   //  нефискальная печать всех товаров
begin
  if Not_Fiscal_Printer_Name='XP-58' then
  begin
    Print_Cash_Receipt_XP_58_NotFiscal_All_TOV;
  end
  else
  begin
    if Not_Fiscal_Printer_Name='POS-58' then
    begin
      Print_Cash_Receipt_POS_58_NotFiscal_All_TOV;

    end
    else
    begin
       MessageDlg('Не известный принтер!', mtError, [mbOk], 0);
    end;
  end;
end; // procedure Print_Cash_Receipt_NotFiscal_All_TOV;



procedure Print_Cash_Receipt_NotFiscal;
begin
 // не фискальная печать

  if Not_Fiscal_Printer_Name='XP-58' then
  begin
    Print_Cash_Receipt_XP_58_NotFiscal;
  end
  else
  begin
    if Not_Fiscal_Printer_Name='POS-58' then
    begin
      Print_Cash_Receipt_POS_58_NotFiscal;

    end
    else
    begin
       MessageDlg('Не известный принтер!', mtError, [mbOk], 0);
    end;
  end;
end;  // procedure Print_Cash_Receipt_NotFiscal;




procedure Print_Cash_Receipt_XP_58_NotFiscal;
var
s_print, sa:string;
y_print, dy_print:integer;
x_print:integer;
begin

Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
try
  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;
    s_print:= F_main.CHECK_TITLE_FIRM_NAME; //'НОВОЖАНIВСЬКИЙ М''ЯСОКОМБИНАТ';

 //   s_print:=F_main.QTradepointInfo.FieldByName('PARENT_NAME').AsString;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString);


    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString);

    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');



    Inc(y_print,dy_print);
    Printer.Canvas.Font.Size := 7;
     // товарная составляющая
    with DM1.QPrintReceipt_Kolbasa_NotFiscal  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Kolbasa  do
    if abs(SKIDKA_KOLBASA)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_KOLBASA]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_KOLBASA, SKIDKA_KOLBASA*100/PER_SKIDKA_KOLBASA, (-1)*SKIDKA_KOLBASA]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    with DM1.QPrintReceipt_Myaso_NotFiscal  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);


        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Myaso  do
    if abs(SKIDKA_MYASO)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_MYASO]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_MYASO, SKIDKA_MYASO*100/PER_SKIDKA_MYASO, (-1)*SKIDKA_MYASO]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    with DM1.QPrintReceipt_TNP_NotFiscal  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);


        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_TNP  do
    if abs(SKIDKA_TNP)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_TNP]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_TNP, SKIDKA_TNP*100/PER_SKIDKA_TNP, (-1)*SKIDKA_TNP]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;



    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
   // Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'СУМА');
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(200, y_print,Format('%6.2f', [F_SaleDoc.TOT_SUM_NOT_FISCAL]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

    if abs(SUM_OPL_BONUS)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Сплачено бонусом ');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_OPL_BONUS]));
    end;

    if abs(F_SaleDoc.D_ROUND_TOT_SUM_NOT_FISCAL)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ЗАОКРУГЛЕННЯ ');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.D_ROUND_TOT_SUM_NOT_FISCAL]));
    end;

     Inc(y_print,2*dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'ДО СПЛАТИ ');
    Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.TOT_MONEY]));

    if F_SaleDoc.IS_BANK_TRANSACTION_NOT_FISCAL then
    begin
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Опл.карткою');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_NN_NOT_FISCAL]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Плат.сист.');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_PAY_SYSTEM]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Танзакция');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CODE_TRANSACTION_NOT_FISCAL]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'СУМА');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_OPL_CARD]));
    end
    else
    begin

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ГОТIВКА');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_OPL_NAL]));
    end;


    Inc(y_print,dy_print);
    if (F_SaleDoc.SUM_SDACHA<-Eps) then   Printer.Canvas.TextOut(0,y_print,'Борг')
    else  Printer.Canvas.TextOut(0,y_print,'РЕШТА');

    Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA+F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]));
    Inc(y_print,dy_print);

    if (F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD>Eps) then
    begin
      Printer.Canvas.TextOut(0,y_print,'РЕШТА на карту');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]));
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'РЕШТА готiвкою');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_SDACHA]));
      Inc(y_print,dy_print);
    end;


    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

 //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE)]);
//    Inc(y_print,dy_print);
 //   Printer.Canvas.TextOut(0,y_print,s_print);


   // ID_CLIENT, CLI_D , is_Registered_Client  Edit_BonusCard.Text
     Inc(y_print,dy_print);
    if ID_DOC_TYPE=200 then
    begin
      if INN_D<>'' then
      begin
        s_print:= Format('Бонусна карта № %s', [INN_D]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);
        s_print:= Format('Було бонусiв %6.2f', [BONUS_OLD]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Використано бонусiв -%6.2f', [SUM_OPL_BONUS]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Нараховано бонусiв +%6.2f', [BONUS_NACHISL]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Решта на бон.карту +%6.2f', [F_SaleDoc.SUM_SDACHA_TO_BONUS_CARD]);
        Printer.Canvas.TextOut(0,y_print,s_print);
       // Inc(y_print,dy_print);
      //  s_print:= Format('Заокруглення бонусiв =%6.2f', [Int(BONUS_NEW)-BONUS_NEW]);
       // Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);
       // s_print:= Format('Накопичено бонусiв =%6.2f', [Int(BONUS_NEW)]);
        s_print:= Format('Накопичено бонусiв =%6.2f', [BONUS_NEW]);
        Printer.Canvas.TextOut(0,y_print,s_print);


         Inc(y_print,dy_print);
      end; // if INN_D<>'' then
    end;   //  if ID_DOC_TYPE=200 then


    s_print:=Format('Гаряча лiнiя %s', [F_Main.CHECK_HOT_LINE_FIRM_TEL]);
    Printer.Canvas.TextOut(0,y_print,s_print);
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
     Inc(y_print,dy_print);
    with F_main.Q_Advert do
    begin
      if  not Active then
      begin
        Parameters.ParamByName('TYPE_MSG').Value:=5; // для покупателя
        Open;
      end;

      First;
      while not EOF  do
      begin
         Printer.Canvas.TextOut(0,y_print,FieldByName('MSG').AsString);
          Inc(y_print,dy_print);
        Next;
      end;
    end;

    Printer.Canvas.TextOut(0,y_print,F_Main.CHECK_FOOTER_SLOGAN); //Хай завжди буде смачно!
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,F_Main.CHECK_FOOTER_TXT); //Не є фіскальним чеком
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'___________________________________');
    Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;

end;  // procedure Print_Cash_Receipt_XP_58(v_ID_NAKLCAP:integer);


procedure Print_Cash_Receipt_POS_58_NotFiscal;
begin
  Print_Cash_Receipt_XP_58_NotFiscal;
end;  // procedure Print_Cash_Receipt_POS_58(v_ID_NAKLCAP:integer);



procedure Print_Cash_Receipt_XP_58_NotFiscal_All_TOV;
var
s_print, sa:string;
y_print, dy_print:integer;
x_print:integer;
begin

Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
try
  dy_print:=25;
  // здесь вывод на печать чека  ID_NAKLCAP
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;
    s_print:= 'НОВОЖАНIВСЬКИЙ М''ЯСОКОМБИНАТ';
 //   s_print:=F_main.QTradepointInfo.FieldByName('PARENT_NAME').AsString;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString);


    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString);

    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');



    Inc(y_print,dy_print);
    Printer.Canvas.Font.Size := 7;
     // товарная составляющая
    with DM1.QPrintReceipt_Kolbasa  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Kolbasa  do
    if abs(SKIDKA_KOLBASA)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_KOLBASA]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_KOLBASA, SKIDKA_KOLBASA*100/PER_SKIDKA_KOLBASA, (-1)*SKIDKA_KOLBASA]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    with DM1.QPrintReceipt_Myaso  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);


        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_Myaso  do
    if abs(SKIDKA_MYASO)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_MYASO]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_MYASO, SKIDKA_MYASO*100/PER_SKIDKA_MYASO, (-1)*SKIDKA_MYASO]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;

    with DM1.QPrintReceipt_TNP  do
    begin
      First;
      while not EOF do
      begin
        if FieldByName('IS_ACTION').AsInteger=1 then sa:='A'
        else sa:='';
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f %s  ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat, sa]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);


        Next;
      end;

      Close;
    end; //  with DM1.QPrintReceipt_TNP  do
    if abs(SKIDKA_TNP)>Eps then
    begin
      s_print:=Format('Знижка %s %6.2f%%', [SKIDKA_COMMENT, PER_SKIDKA_TNP]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

      s_print:=Format('%6.2f%% x %6.2f = %6.2f',
      [PER_SKIDKA_TNP, SKIDKA_TNP*100/PER_SKIDKA_TNP, (-1)*SKIDKA_TNP]);
      Printer.Canvas.TextOut(0,y_print,s_print);
      Inc(y_print,dy_print);

    end;



    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
   // Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'СУМА');
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(200, y_print,Format('%6.2f', [TOT_SUM]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

    if abs(SUM_OPL_BONUS)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Сплачено бонусом ');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_OPL_BONUS]));
    end;

    if abs(ROUND_SUM)>Eps then
    begin
      Inc(y_print,2*dy_print);
      Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
      Printer.Canvas.Font.Size := 8;
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ЗАОКРУГЛЕННЯ ');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [ROUND_SUM]));
    end;

     Inc(y_print,2*dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'ДО СПЛАТИ ');
    Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.TOT_MONEY+F_SaleDoc.TOT_MONEY_FISCAL]));

     if F_SaleDoc.IS_BANK_TRANSACTION_NOT_FISCAL then
    begin
      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ОПЛАТА КАРТКОЮ');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_NN_NOT_FISCAL]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Плат.сист.');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CARD_PAY_SYSTEM]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'Танзакция');
      Printer.Canvas.TextOut(200,y_print, Format('%s', [F_SaleDoc.CODE_TRANSACTION_NOT_FISCAL]));

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'СУМА');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [F_SaleDoc.SUM_OPL_CARD]));
    end
    else
    begin

      Inc(y_print,dy_print);
      Printer.Canvas.TextOut(0,y_print,'ГОТIВКА');
      Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_POLUCH]));
    end;



    if (SUM_SDACHI<-Eps) then   Printer.Canvas.TextOut(0,y_print,'Борг')
    else    Printer.Canvas.TextOut(0,y_print,'РЕШТА');
    Printer.Canvas.TextOut(200,y_print, Format('%6.2f', [SUM_SDACHI]));
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];

 //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE)]);
 //   Inc(y_print,dy_print);
 //   Printer.Canvas.TextOut(0,y_print,s_print);


   // ID_CLIENT, CLI_D , is_Registered_Client  Edit_BonusCard.Text
     Inc(y_print,dy_print);
    if ID_DOC_TYPE=200 then
    begin
      if INN_D<>'' then
      begin
        s_print:= Format('Бонусна карта № %s', [INN_D]);
        Printer.Canvas.TextOut(0,y_print,s_print);
        Inc(y_print,dy_print);
        s_print:= Format('Було бонусiв %6.2f', [BONUS_OLD]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Використано бонусiв -%6.2f', [SUM_OPL_BONUS]);
        Printer.Canvas.TextOut(0,y_print,s_print);
         Inc(y_print,dy_print);
        s_print:= Format('Нараховано бонусiв +%6.2f', [BONUS_NACHISL]);
        Printer.Canvas.TextOut(0,y_print,s_print);
      //  Inc(y_print,dy_print);
      //  s_print:= Format('Заокруглення бонусiв =%6.2f', [Int(BONUS_NEW)-BONUS_NEW]);
      //  Printer.Canvas.TextOut(0,y_print,s_print);
          Inc(y_print,dy_print);
       // s_print:= Format('Накопичено бонусiв =%6.2f', [Int(BONUS_NEW)]);
        s_print:= Format('Накопичено бонусiв =%6.2f', [BONUS_NEW]);
        Printer.Canvas.TextOut(0,y_print,s_print);


         Inc(y_print,dy_print);
      end; // if INN_D<>'' then
    end;   //  if ID_DOC_TYPE=200 then


    s_print:=Format('Гаряча лiнiя %s', ['(057)7557770']);
    Printer.Canvas.TextOut(0,y_print,s_print);
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-------------------------------------------------');
     Inc(y_print,dy_print);
    with F_main.Q_Advert do
    begin
      if  not Active then
      begin
        Parameters.ParamByName('TYPE_MSG').Value:=5; // для покупателя
        Open;
      end;

      First;
      while not EOF  do
      begin
         Printer.Canvas.TextOut(0,y_print,FieldByName('MSG').AsString);
          Inc(y_print,dy_print);
        Next;
      end;
    end;

    Printer.Canvas.TextOut(0,y_print,'Хай завжди буде смачно!');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'Не є фіскальним чеком');
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'___________________________________');
    Printer.EndDoc;

 except
  MessageDlg('Ошибка печати!', mtError, [mbOk], 0);
end;

end;  // procedure Print_Cash_Receipt_XP_58_All_TOV;


procedure Print_Cash_Receipt_POS_58_NotFiscal_All_TOV;
begin
  Print_Cash_Receipt_XP_58_NotFiscal_All_TOV;
end;  // procedure Print_Cash_Receipt_POS_58_All_TOV;

procedure Print_Cash_Receipt_VozvrNotFiscal;
begin

  if Not_Fiscal_Printer_Name='XP-58' then
  begin
    Print_Cash_Receipt_Vozvrat_XP_58;
  end
  else
  begin
    if Not_Fiscal_Printer_Name='POS-58' then
    begin
      Print_Cash_Receipt_Vozvrat_POS_58;
    end
    else
    begin
       MessageDlg('Не известный принтер!', mtError, [mbOk], 0);
    end;
  end;

   //  фискальная печать



end;


procedure Print_Cash_Receipt_VozvrNotFiscal_All_TOV;
begin

  if Not_Fiscal_Printer_Name='XP-58' then
  begin
    Print_Cash_Receipt_Vozvrat_XP_58_All_TOV;
  end
  else
  begin
    if Not_Fiscal_Printer_Name='POS-58' then
    begin
      Print_Cash_Receipt_Vozvrat_POS_58_All_TOV;
    end
    else
    begin
       MessageDlg('Не известный принтер!', mtError, [mbOk], 0);
    end;
  end;

   //  фискальная печать



end;

procedure Print_Cash_Receipt_Vozvrat_XP_58_All_TOV;
var
s_print:string;
y_print, dy_print:integer;
x_print:integer;
begin
  // здесь вывод на печать чека  ID_NAKLCAP
   Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
    dy_print:=25;
    x_print:=0;
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;
    s_print:= 'НОВОЖАНIВСЬКИЙ М''ЯСОКОМБИНАТ';
 //   s_print:=F_main.QTradepointInfo.FieldByName('PARENT_NAME').AsString;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString);


    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString);

    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Inc(y_print,dy_print);
    s_print:='Возврат';
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.TextOut(x_print,y_print,'Возврат');


    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');


    // товарная составляющая

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    x_print:=0;
    with DM1.QPrintReceipt  do
    begin

      First;
      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat]);

        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        Next;
      end;


    end; //  with DM1.QPrintReceipt  do

    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'СУММА');
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(x_print+200, y_print, Format('%6.2f', [TOT_SUM]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
     Inc(y_print,dy_print*2);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'ГОТIВКА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_POLUCH]));
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'РЕШТА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_SDACHI]));
    Printer.Canvas.Font.Style := [];


      Inc(y_print,dy_print);
  //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE) ]);
  //   Printer.Canvas.TextOut(x_print,y_print,s_print);


    s_print:=Format('Гаряча лiнiя %s', ['(057)7557770']);
      Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);
      Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'Хай завжди буде смачно!');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'Не є фіскальним чеком');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'___________________________________');
    Printer.EndDoc;


end;


procedure Print_Cash_Receipt_Vozvrat_POS_58_All_TOV;
begin
  Print_Cash_Receipt_Vozvrat_XP_58_All_TOV;

end;  //   Print_Cash_Receipt_Vozvrat_POS_58(v_ID_NAKLCAP:integer);


procedure Print_Cash_Receipt_Vozvrat_XP_58;
var
s_print:string;
y_print, dy_print:integer;
x_print:integer;
begin
  // здесь вывод на печать чека  ID_NAKLCAP
   Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
    dy_print:=25;
    x_print:=0;
    y_print:=0;
    Printer.BeginDoc;
    Printer.Canvas.Font.Size := 7;

    s_print:= 'НОВОЖАНIВСЬКИЙ М''ЯСОКОМБИНАТ';
 //   s_print:=F_main.QTradepointInfo.FieldByName('PARENT_NAME').AsString;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('ADRES_TRADEPOINT').AsString);


    Printer.Canvas.Font.Size := 6;
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,F_main.QTradepointInfo.FieldByName('NAME_TRADE_POINT').AsString);

    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Чек №%s', [NN]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);


    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    s_print:=Format('Вiд %s', [DateTimeToStr(D_CREATE)]);
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);

    Inc(y_print,dy_print);
    s_print:='Возврат';
    x_print:= round((Printer.PageWidth - Printer.Canvas.TextWidth(s_print))/2);
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.TextOut(x_print,y_print,'Возврат');

    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(0,y_print,'-----------------------------------------------');


    // товарная составляющая

    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
    x_print:=0;
    with DM1.QPrintReceipt_Tov_NotFiscal  do
    begin

      First;
      while not EOF do
      begin
        s_print:=Format('%s', [FieldByName('TOV_NAME').AsString]);
        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        s_print:=Format('%6.3f x %6.2f = %6.2f ', [FieldByName('NUMB').Asfloat,
          FieldByName('PRICE').Asfloat,FieldByName('ST').Asfloat]);

        Inc(y_print,dy_print);
        Printer.Canvas.TextOut(x_print,y_print,s_print);

        Next;
      end;


    end; //  with DM1.QPrintReceipt  do

    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 14;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'СУММА');
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(x_print+200, y_print, Format('%6.2f', [TOT_SUM]));
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [];
     Inc(y_print,dy_print*2);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'ГОТIВКА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_POLUCH]));
    Printer.Canvas.Font.Size := 8;
    Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'РЕШТА');
    Printer.Canvas.TextOut(x_print+200,y_print, Format('%6.2f', [SUM_SDACHI]));
    Printer.Canvas.Font.Style := [];


      Inc(y_print,dy_print);
  //   s_print:=Format('№%s / %s', [NN, DateTimeToStr(D_CREATE) ]);
  //   Printer.Canvas.TextOut(x_print,y_print,s_print);


    s_print:=Format('Гаряча лiнiя %s', ['(057)7557770']);
      Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,s_print);
      Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'-------------------------------------------------');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'Хай завжди буде смачно!');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'Не є фіскальним чеком');
     Inc(y_print,dy_print);
    Printer.Canvas.TextOut(x_print,y_print,'___________________________________');
    Printer.EndDoc;


end;


procedure Print_Cash_Receipt_Vozvrat_POS_58;
begin
  Print_Cash_Receipt_Vozvrat_XP_58;

end;  //   Print_Cash_Receipt_Vozvrat_POS_58(v_ID_NAKLCAP:integer);



Procedure CennikPrint(productName, groupName: string; price: extended; id: integer;
shtrihcode  :string);
var  prc, str1, str2, str3, str4, pId, shtrihcode_PRN :string;
ix, iy:integer;
var Mul :integer;
Dr	: TCBDirection;
Old_Brush_Color :integer;
isExestFiscalPrinter:boolean;
  begin



isExestFiscalPrinter:=ExistFiscalPrinter;

  Printer.PrinterIndex:=Printer.Printers.IndexOf(Not_Fiscal_Printer_Name);
     prc := Format('%.2f',[price]);
     str1 := Copy(productName, 0, 20);
     if Trim(str1)='' then str1 := '.';
     str2 := Copy(productName, 21, 20);
     if Trim(str2)='' then str2 := '.';
     str3 := Copy(productName, 41, 38);
     if Trim(str3)='' then str3 := '.';
     str4 := Copy(productName, 87, 38);
     if Trim(str4)='' then str4 := '.';
     pId := 'Код '+IntToStr(id);

        Printer.BeginDoc;
        GetPrinterInfo;

       ix:= PrinterCoordX(0);
       iy:= PrinterCoordY(0);
        Printer.Canvas.Font.Size := 12;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix, iy, str1);

       iy:= iy+ PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str2);

        Printer.Canvas.Font.Size := 6;
      iy:= iy+ PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str3);

        Printer.Canvas.Font.Size := 6;
      iy:= iy+PrinterCoordY(5);
        Printer.Canvas.TextOut(ix, iy, str4);

         ix:= PrinterCoordX(5);
         iy:= iy+ PrinterCoordY(3);
        //price
        Printer.Canvas.Font.Size := 34;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.TextOut(ix, iy, prc);

        ix:= PrinterCoordX(0);
        iy:= iy+ PrinterCoordY(15);

        //Pricetag front-side productId
        Printer.Canvas.Font.Size := 8;   //-
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix, iy, pId + ' ' + groupName );



        shtrihcode := Trim(shtrihcode);

         ix:= PrinterCoordX(0);
         iy:= iy+ PrinterCoordY(7);

        Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix,iy,'-----------------------------------------------');


// обратная сторона

          Printer.NewPage;


         ix:= 0;
         iy:= 100;

        Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.Font.Color:=clBlack;
     //   Printer.Canvas.TextOut(ix,iy,'.');

         ix:= 0;
         iy:= iy+100;
      //   Printer.Canvas.TextOut(ix,iy,'.');

         ix:= 0;
         iy:= 100;
       //  Printer.Canvas.TextOut(ix,iy,'.');


        pId := IntToStr(id);
        Printer.Canvas.Font.Size := 30;
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.Font.Color:=clBlack;

        ix:= 300;
        iy:= 100;   //500

        AngleTextOut(Printer.Canvas, 180, ix, iy, IntToStr(id));


        if (shtrihcode<>'') and (Length(shtrihcode)=13) then
        begin
          Dr:=cbdGauche; // верхногами // направление штрих кода cbdHaut, cbdGauche, cbdBas
          Mul:=3;     // масштабирование
          shtrihcode_PRN:= shtrihcode;
          delete(shtrihcode_PRN, length(shtrihcode_PRN), 1);    // без контрольной суммы
          ix:= 350;
          iy:= iy+ 100;  //  400
          Old_Brush_Color:=Printer.Canvas.Brush.Color;
          Printer.Canvas.Brush.Color:=clBlack;
          DessinCodeEAN13(shtrihcode_PRN, Printer.Canvas, Dr,
            ix, iy ,20, Mul, True);
          Printer.Canvas.Brush.Color:= Old_Brush_Color;

         end;


        ix:= 300;
        iy:= iy+ 100;
        Printer.Canvas.Font.Size := 8;   //-
        Printer.Canvas.Font.Style := [];
        AngleTextOut(Printer.Canvas, 180, ix, iy, DateToStr(Date()));

        ix:= 2;
        iy:= iy+ 100;  // 1000
       Printer.Canvas.Font.Size := 10;
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.TextOut(ix,iy,'-----------------------------------------------');

        Printer.EndDoc;


  end;



procedure PrintToBuyerDisplay(s1_displ, s2_displ:string);   // вывод на дисплей покупателя
Var
buf: array [0..255] of byte;
i: byte;
res:integer;
s1, s2: ansistring;
begin

  Clear_disp(); // очистить дисплей
  horizontal();
  if s1_displ<>'' then
  begin
    s1 := WideStringToString(s1_displ, 1251  );
    for i:=0 to 255 do buf[i]:=0;
    for i:=0 to length(s1)-1 do buf[i]:=ord(s1[i+1]);
    res:=send_str(@buf, 0, length(s1));
  end;   //  if Str_1<>'' then

  if s2_displ<>'' then
  begin
    s2 := WideStringToString(s2_displ, 1251  );
    for i:=0 to 255 do buf[i]:=0;
    for i:=0 to length(s2)-1 do buf[i]:=ord(s2[i+1]);
    res:=send_str(@buf, 1, length(s2));
   // If res <> ERROR_NO_ERROR then ShowError(res);
  end;   //  if Str_2<>'' then
end;



end.
