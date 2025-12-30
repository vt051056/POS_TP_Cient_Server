unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
Data.SqlExpr, Datasnap.Provider, Data.DB, Data.Win.ADODB,
Datasnap.DSCommonServer, DBXJSON, Datasnap.DSProviderDataModuleAdapter,System.JSON,
Vcl.Forms;

type
  TServerMethods1 = class(TDSServerModule)
    DataSetProvider_Doc_Type: TDataSetProvider;
    ADS_Doc_Type: TADODataSet;
    ADS_NaklCap: TADODataSet;
    DataSetProvider_NaklCap: TDataSetProvider;
    SP_COPY_NAKL: TADOStoredProc;
    SP_SET_PRICE_FROM_NAKL: TADOStoredProc;
    Q_ControlLinkDoc: TADOQuery;
    DataSetProvider_Q_NaklCapInfo: TDataSetProvider;
    DataSetProvider_Q_ControlLinkDoc: TDataSetProvider;
    ADS_Price: TADODataSet;
    DataSetProvider_Price: TDataSetProvider;
    Q_Doc_Type: TADOQuery;
    Q_NaklCapInfo: TADOQuery;
    ADSAvtoNariad: TADODataSet;
    DataSetProviderAvtoNariad: TDataSetProvider;
    ADSAvtoNariadEdit: TADODataSet;
    DataSetProviderAvtoNariadEdit: TDataSetProvider;
    SP_AVTONARIAD_EDIT: TADOStoredProc;
    SP_AVTONARIAD_DELETE: TADOStoredProc;
    SP_AVTONARIAD_COPY: TADOStoredProc;
    ADSSch: TADODataSet;
    DataSetProviderSch: TDataSetProvider;
    ADSSCHTYPE: TADODataSet;
    DataSetProviderSCHTYPE: TDataSetProvider;
    ADSUCH: TADODataSet;
    DataSetProviderUCH: TDataSetProvider;
    ADSUsers: TADODataSet;
    DataSetProviderUsers: TDataSetProvider;
    ADSClients: TADODataSet;
    DataSetProviderClients: TDataSetProvider;
    ADSKateg_Cli: TADODataSet;
    DataSetProviderKateg_Cli: TDataSetProvider;
    DataSetProvider_PricePOS: TDataSetProvider;
    ADSPricePOS: TADODataSet;
    SP_DELETE_KATEG_CLI: TADOStoredProc;
    ADOConnectionTmp: TADOConnection;
    ADSSchID_SCH: TStringField;
    ADSSchSCH_NAME: TWideStringField;
    ADSSchID_SCH_TYPE: TIntegerField;
    ADSSchID_UCHET: TIntegerField;
    ADSSchIN_BALANS: TIntegerField;
    ADSSchUCHET: TStringField;
    ADSSchSCH_TYPE: TStringField;
    QRepOtgruzTov1: TADOQuery;
    DataSetProviderRepOtgruzTov1: TDataSetProvider;
    QKateg_Cli_Import: TADOQuery;
    DataSetProvider_QKateg_Cli_Import: TDataSetProvider;
    QClients_Import: TADOQuery;
    DataSetProvider_QClients_Import: TDataSetProvider;
    QBonuses_Import: TADOQuery;
    DataSetProvider_QBonuses_Import: TDataSetProvider;
    ADS_NaklCap_Export: TADODataSet;
    DataSetProvider_ADS_NaklCap_Export: TDataSetProvider;
    ADS_NaklTov_Export: TADODataSet;
    DataSetProvider_ADS_NaklTov_Export: TDataSetProvider;
    ADS_Naveski_Export: TADODataSet;
    DataSetProviderADS_Naveski_Export: TDataSetProvider;
    QGrTov_Import: TADOQuery;
    DataSetProvider_QGrTov_Import: TDataSetProvider;
    QTov_Import: TADOQuery;
    DataSetProvider_QTov_Import: TDataSetProvider;
    QPRICE_DATE_Import: TADOQuery;
    DataSetProvider_QPRICE_DATE_Import: TDataSetProvider;
    SP_IMPORT_DOC_POS: TADOStoredProc;
    SP_DELETE_TMP_DOC_POS: TADOStoredProc;
    QUserPrice_Import: TADOQuery;
    DataSetProvider_QUserPrice_Import: TDataSetProvider;
    QNaklCap_Import: TADOQuery;
    DataSetProvider_QNaklCap_Import: TDataSetProvider;
    QNaklTov_Import: TADOQuery;
    DataSetProvider_QNaklTov_Import: TDataSetProvider;
    QNaveski_Import: TADOQuery;
    DataSetProvider_QNaveski_Import: TDataSetProvider;
    QSkidka_POS_Import: TADOQuery;
    DataSetProvider_QSkidka_POS_Import: TDataSetProvider;
    DataSetProvider_QNewPriceTov: TDataSetProvider;
    QNewPriceTov: TADOQuery;
    DataSetProvider_ADS_CLIENTS_NEW_POS_Export: TDataSetProvider;
    ADS_CLIENTS_NEW_POS_Export: TADODataSet;
    Q_Bonus_Cli: TADOQuery;
    ADOCommand_UpdateBonusCli: TADOCommand;
    SP_SET_BONUS_CLI_POS_DETAIL: TADOStoredProc;
    Q_Advert: TADOQuery;
    DataSetProvider_Q_Advert: TDataSetProvider;
    DataSetProvider_Q_UserTradePoint: TDataSetProvider;
    Q_UserTradePoint: TADOQuery;
    SP_RECALC_BONUS_CLI_POS: TADOStoredProc;
    ADS_SHTRIH_CODE_TOV_NEW_POS: TADODataSet;
    DataSetProvider_ADS_SHTRIH_CODE_TOV_NEW_POS: TDataSetProvider;
    DataSetProvider_Q_KIO_OPERATIONS_GRUP_Import: TDataSetProvider;
    Q_KIO_OPERATIONS_GRUP_Import: TADOQuery;
    QPRODUCT_POS_Import: TADOQuery;
    DataSetProvider_QPRODUCT_POS_Import: TDataSetProvider;
    QNORM_ASSEMB_POS_Import: TADOQuery;
    DataSetProvider_QNORM_ASSEMB_POS_Import: TDataSetProvider;
    Q_KUPON_CARD_Import: TADOQuery;
    DataSetProvider_Q_KUPON_CARD_Import: TDataSetProvider;
    DataSetProvider_SVERKA_DOC_POS_Export: TDataSetProvider;
    ADS_SVERKA_DOC_POS_Export: TADODataSet;
    SP_IMPORT_SVERKA_DOC_POS: TADOStoredProc;
    SP_CALC_CLI_OBOROT_DOC: TADOStoredProc;
    SP_GET_CLIENT_FOR_INN: TADOStoredProc;
    SP_DELETE_IMPORT_DOC_POS: TADOStoredProc;
    Q_RRO_CERTIFIC: TADOQuery;
    DataSetProvider_Q_RRO_CERTIFIC: TDataSetProvider;
    Q_RRO_KASSA_TS: TADOQuery;
    DataSetProvider_Q_RRO_KASSA_TS: TDataSetProvider;
    DataSetProvider_QBARCODES_Import: TDataSetProvider;
    QBARCODES_Import: TADOQuery;
    ADS_CONST_VALUES_TP_EXPORT: TADODataSet;
    DataSetProvider_ADS_CONST_VALUES_TP_EXPORT: TDataSetProvider;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_user:integer;
    user:string;
    comment:string;

//    ADOConnectionTmp:TADOConnection;

    function login_proc(login, passw: string): TJSONObject;
    function UnLogin_proc(): TJSONObject;
    function get_user_proc: TJSONObject;
    function get_Kateg_Cli_proc: TJSONObject;
    function get_Clients_proc: TJSONObject;
    function get_Bonuses_proc: TJSONObject;
    function get_BonusCli_proc(INN:string): TJSONObject;
    function save_Bonus_Bales_proc(INN:string; S_KOLBASA, S_MYASO, S_TNP, SUM_OPL_BONUS, SUM_SDACHA_TO_BONUS_CARD:double): TJSONObject;
    function get_QAdvert_proc(ID_TRADE_POINT:longint ): TJSONObject;
    function get_Q_UserTradePoint_proc(ID_TRADE_POINT:longint ): TJSONObject;

    function get_GrTov_proc: TJSONObject;
    function get_Tov_proc: TJSONObject;
    function get_BarCodes_proc: TJSONObject;   // получение таблицы штрихкодов товаров
    function get_PRICE_DATE_proc: TJSONObject;
    function get_QNewPriceTov_proc(D:TDateTime; ID_TRADE_POINT:longint ): TJSONObject;
    function get_USER_PRICE_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_QNaklCap_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_QNaklTov_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_QNaveski_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_Skidka_Import_proc(D:TDateTime): TJSONObject;

    function get_KUPON_CARD_proc: TJSONObject;  // получение таблицы купонных карт

    function get_NaklCap_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_NaklTov_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_Naveski_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_CLIENTS_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_SHTRIH_CODE_TOV_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_SVERKA_DOC_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject; // получение временной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT  для экспорта данных
    function get_CONST_VALUES_TP_EXPORT_proc(ID_TRADE_POINT:longint): TJSONObject; // получить настройки торг точки

    function Import_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
    function Import_SVERKA_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;

    function DELETE_TMP_DOC_POS_proc(ID_TRADE_POINT:longint): TJSONObject;

    function get_Doc_Type_proc(ID_CHAR_DOC:integer): TJSONObject;
    function get_NaklCap_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;

    function NaklEdit_proc(ID_NAKLCAP:integer; S_reason_delete_edit: string): TJSONObject;
    // получение инфо о нарядах за период  DFROM, DTO
 //   function get_AvtoNariad_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
     // получение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
 //   function get_AvtoNariadEdit_proc(ID_DOC_TYPE:integer; ID_AVTO_NARIAD:integer): TJSONObject;
    // изменение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE

  //  function Edit_AvtoNariad_proc(ID_DOC_TYPE,ID_AVTO_NARIAD:integer;
  //  N:string; Date_doc:TDateTime; ID_CLI_AVTO, ID_CLI_D:integer; SCH_D, SCH_K:string;
 //   Probeg1, Probeg2, NormaProbegTmp, Motochas1, Motochas2, NormaMotochasTmp:double;
 //   Comment_Rabot:string; N_Topliva, WORK_HOURS:double; ID_DRIVER:integer;
 //   S_reason_delete_edit:string ): TJSONObject;

    // получение данных отчета реализация клиету  с типом ID_CLI, за период с DFROM по DTO
    function get_RepOtgruzTov1_proc(ID_CLI:integer; DFROM, DTO:TDateTime): TJSONObject;
    // получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
    function get_Q_KIO_OPERATIONS_GRUP_Import_proc(): TJSONObject;
    // получение таблицы продукции собственного пр-ва
    function get_QPRODUCT_POS_Import_proc(): TJSONObject;
    // получение таблицы норм продукции собственного пр-ва
    function get_QNORM_ASSEMB_POS_Import_proc(): TJSONObject;
    // Удаление ранее импортированных документов с торг. точки за период
    function DELETE_IMPORT_DOC_POS_proc(ID_TRADE_POINT, ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime): TJSONObject;
    // получение сертификатов, ключей, паролей ФОП, работающей с тт  ID_TRADE_POINT
    function get_RRO_CERTIFIC_proc(ID_TRADE_POINT:longint ): TJSONObject;
    // получение инфо о фискальных кассах работающих на тт  ID_TRADE_POINT
    function get_RRO_KASSA_TS_proc(ID_TRADE_POINT:longint ): TJSONObject;


  end;

var  vServerMethods1:TServerMethods1;

implementation

{$R *.dfm}

uses System.StrUtils, FormServerUnit, DateUtils;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
 ADOConnectionTmp:=Nil;
end;

// соединение с БД
function TServerMethods1.login_proc(login, passw: string): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    Connect_info :string;
    SP_USER_LOGIN_Tmp:TADOStoredProc;

begin

  if ADOConnectionTmp<>Nil then
  begin
    ADOConnectionTmp.Connected:=false;
    FreeAndNil(ADOConnectionTmp);
  end;

  ADOConnectionTmp:= TADOConnection.Create(self);

  Connect_info:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='
  +login+';Password='+passw+
  ';Initial Catalog='+Form1.E_database.Text+';Data Source='+Form1.E_sqlsrv.Text;
  ADOConnectionTmp.LoginPrompt:=False;
  ADOConnectionTmp.Connected:=false;
  ADOConnectionTmp.ConnectionString:=Connect_info;

  try
    ADOConnectionTmp.Connected:=True;
    SP_USER_LOGIN_Tmp:= TADOStoredProc.Create(self);
    SP_USER_LOGIN_Tmp.Connection:=ADOConnectionTmp;
    SP_USER_LOGIN_Tmp.ProcedureName:='USER_LOGIN';
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@RETURN_VALUE',
        ftInteger, pdReturnValue, 0, 0);
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@LOGIN', ftString, pdInput, 50, login);
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@PASSW', ftString, pdInput, 50, passw);
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@ID_USER', ftInteger, pdInputOutput, 0, -1);
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@USER', ftString, pdInputOutput, 50, 'Не определен');
    SP_USER_LOGIN_Tmp.Parameters.CreateParameter('@ER', ftInteger, pdInputOutput, 0, 0);
    SP_USER_LOGIN_Tmp.ExecProc;
    if SP_USER_LOGIN_Tmp.Parameters.ParamValues['@ER']=0 then
     begin
      user:=SP_USER_LOGIN_Tmp.Parameters.ParamValues['@USER'];
      id_user:=SP_USER_LOGIN_Tmp.Parameters.ParamValues['@ID_USER'];
      if id_user=-1 then
      begin
        comment:='Нет регистрации в приложении';
        if ADOConnectionTmp<>Nil then
        begin
          ADOConnectionTmp.Connected:=false;
          FreeAndNil(ADOConnectionTmp);
        end;
      end
      else
      begin
        comment:='Ok';
      end;

     end
     else
      begin
       user:='Не определен';
       id_user:=-1;
       comment:='Нет регистрации в приложении';
       if ADOConnectionTmp<>Nil then
        begin
          ADOConnectionTmp.Connected:=false;
          FreeAndNil(ADOConnectionTmp);
        end;
      end;
  except
   user:='Не определен';
   id_user:=-1;
   comment:='Нет регистрации в БД';
   if ADOConnectionTmp<>Nil then
   begin
    ADOConnectionTmp.Connected:=false;
    FreeAndNil(ADOConnectionTmp);
   end;
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('user', user);
 msg.AddPair(pair);
 pair:=TJSONPair.Create('id_user', TJSONNumber.Create(id_user));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;

  FreeAndNil(SP_USER_LOGIN_Tmp);

end;

// отсоединение то БД
function TServerMethods1.UnLogin_proc(): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

begin
  if ADOConnectionTmp<>Nil then
  begin
    ADOConnectionTmp.Connected:=false;
    FreeAndNil(ADOConnectionTmp);
  end;
  user:='Не определен';
  id_user:=-1;
  comment:='Соединение с БД закрыто!';


 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('user', user);
 msg.AddPair(pair);
 pair:=TJSONPair.Create('id_user', TJSONNumber.Create(id_user));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;

// получение текущего пользователя
function TServerMethods1.get_user_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
begin
 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('user', user);
 msg.AddPair(pair);
 Result := msg;
end;




// получение таблицы категорий контрагентов KATEG_CLI
function TServerMethods1.get_Kateg_Cli_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QKateg_Cli_Import.Active:=False;
      QKateg_Cli_Import.Connection:=ADOConnectionTmp;
      try
        QKateg_Cli_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_Kateg_Cli_proc: TJSONObject;


// получение таблицы контрагентов CLIENTS
function TServerMethods1.get_Clients_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QClients_Import.Active:=False;
      QClients_Import.Connection:=ADOConnectionTmp;
      try
        QClients_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Clients_proc: TJSONObject;




// получение таблицы бонусов
function TServerMethods1.get_Bonuses_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QBonuses_Import.Active:=False;
      QBonuses_Import.Connection:=ADOConnectionTmp;
      try
        QBonuses_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Bonuses_proc: TJSONObject;






// получение инфо о бонусах клиента по штрихкоду INN бонусной карты
function TServerMethods1.get_BonusCli_proc(INN:string): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
    v_ID_CLI:longint;
    SUM_BALL, SDK:extended;
    d_now:TDateTime;
    d_from, d_to: TDateTime;

begin

  SUM_BALL:=0;
  SDK:=0;
  status_oper:=0;

 if id_user<>-1 then
 begin
    if ADOConnectionTmp<>Nil then
    begin
      Q_Bonus_Cli.Active:=False;
      Q_Bonus_Cli.Connection:=ADOConnectionTmp;
      try
        Q_Bonus_Cli.Parameters.ParamByName('INN').Value:=INN;
        Q_Bonus_Cli.Active:=True;
        Q_Bonus_Cli.First;

        if Q_Bonus_Cli.RecordCount>0 then
        begin
          SP_GET_CLIENT_FOR_INN.Connection:=ADOConnectionTmp;
          SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@INN']:=INN;
          SP_GET_CLIENT_FOR_INN.ExecProc;

          if SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ER']=0  then
          begin
            v_ID_CLI:= SP_GET_CLIENT_FOR_INN.Parameters.ParamValues['@ID_CLI'];
            if v_ID_CLI<>-1 then
            begin
            // получить долги
              d_now:=Date();
              d_from:= StartOfTheDay(d_now);
              d_to:=EndOfTheDay(d_now);
              SP_CALC_CLI_OBOROT_DOC.Connection:=ADOConnectionTmp;
              SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@sch_doc']:='361_ТС';
              SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@id_cli_doc']:=v_ID_CLI;
              SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@d_rep_from']:=d_from;
              SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@d_rep_to']:=d_to;
              SP_CALC_CLI_OBOROT_DOC.ExecProc;

              if (SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@ER']=0) then
              begin
                SDK:=SP_CALC_CLI_OBOROT_DOC.Parameters.ParamValues['@DEB_K'];
              end;
            end;
          end;


          status_oper:=0;
          comment:='Ok';

          SUM_BALL:=Q_Bonus_Cli.FieldByName('SUM_BALL').AsFloat;

        end
        else
        begin
          status_oper:=-3;
          comment:='Не зарегистрирована бонусная карта!';
        end;

      except
        on E : Exception do
        begin
          status_oper:=1;
          comment:='Ошибка в запросе: '+E.Message;
        end;
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;


 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);


 pair:=TJSONPair.Create('SUM_BALL', TJSONNumber.Create(SUM_BALL));
 msg.AddPair(pair);

 pair:=TJSONPair.Create('SDK', TJSONNumber.Create(SDK));
 msg.AddPair(pair);

 Q_Bonus_Cli.Active:=False;
 Result := msg;
end;   // function TServerMethods1.get_Bonuses_proc: TJSONObject;


// сохранение инфо о бонусах клиента по штрихкоду INN бонусной карты
function TServerMethods1.save_Bonus_Bales_proc(INN:string; S_KOLBASA, S_MYASO, S_TNP, SUM_OPL_BONUS, SUM_SDACHA_TO_BONUS_CARD:double): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
    SUM_BALL_NEW, SUM_BALL_CALC:extended;
begin
  status_oper:=0;
  comment:='Ok';
  SUM_BALL_NEW:=0.0;
  SUM_BALL_CALC:=0.0;
 if id_user<>-1 then
 begin

    if ADOConnectionTmp<>Nil then
    begin
      SP_SET_BONUS_CLI_POS_DETAIL.Connection:=ADOConnectionTmp;
      try
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@INN').Value:=INN;
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@S_KOLBASA').Value:=S_KOLBASA;
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@S_MYASO').Value:=S_MYASO;
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@S_TNP').Value:=S_TNP;
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@SUM_OPL_BONUS').Value:=SUM_OPL_BONUS;
        SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@SUM_SDACHA_TO_BONUS_CARD').Value:=SUM_SDACHA_TO_BONUS_CARD;
        SP_SET_BONUS_CLI_POS_DETAIL.ExecProc;
        if SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamValues['@ER']<>0  then
        begin
          status_oper:=-1;
          comment:=SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@ER_COMMENT').Value;
        end
        else
        begin
          SUM_BALL_NEW:= SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@SUM_BALL_NEW').Value;
          SUM_BALL_CALC:= SP_SET_BONUS_CLI_POS_DETAIL.Parameters.ParamByName('@SUM_BALL_CALC').Value;
        end;

      except
       status_oper:=1;
       comment:='Ошибка в запросе SET_BONUS_CLI_POS!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;



 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 pair:=TJSONPair.Create('SUM_BALL_NEW', TJSONNumber.Create(SUM_BALL_NEW));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('SUM_BALL_CALC', TJSONNumber.Create(SUM_BALL_CALC));
 msg.AddPair(pair);

 Result := msg;
end;   // function TServerMethods1.save_Bonus_Bales_proc: TJSONObject;






// получение таблицы групп товаров
function TServerMethods1.get_GrTov_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QGrTov_Import.Active:=False;
      QGrTov_Import.Connection:=ADOConnectionTmp;
      try
        QGrTov_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_GrTov_proc: TJSONObject;



// получение таблицы товаров
function TServerMethods1.get_Tov_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QTov_Import.Active:=False;
      QTov_Import.Connection:=ADOConnectionTmp;
      try
        QTov_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Tov_proc: TJSONObject;



// получение таблицы штрихкодов товаров
function TServerMethods1.get_BarCodes_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QBARCODES_Import.Active:=False;
      QBARCODES_Import.Connection:=ADOConnectionTmp;
      try
        QBARCODES_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_BarCodes_proc: TJSONObject;


// получение таблицы цен
function TServerMethods1.get_PRICE_DATE_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QPRICE_DATE_Import.Active:=False;
      QPRICE_DATE_Import.Connection:=ADOConnectionTmp;
      try
        QPRICE_DATE_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_PRICE_DATE_proc: TJSONObject;



// получение изменившихся на указанную дату цен
function TServerMethods1.get_QNewPriceTov_proc(D:TDateTime; ID_TRADE_POINT:longint ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QNewPriceTov.Active:=False;
      QNewPriceTov.Connection:=ADOConnectionTmp;
      try
        QNewPriceTov.Parameters.ParamByName('D').Value:=D;
        QNewPriceTov.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        QNewPriceTov.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QNewPriceTov_proc: TJSONObject;




// получение обьявлений для ТС и покупателей
function TServerMethods1.get_QAdvert_proc(ID_TRADE_POINT:longint ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_Advert.Active:=False;
      Q_Advert.Connection:=ADOConnectionTmp;
      try

        Q_Advert.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        Q_Advert.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QAdvert_proc(ID_TRADE_POINT:longint ): TJSONObject;


// получение сертификатов, ключей, паролей ФОП, работающей с тт  ID_TRADE_POINT
function TServerMethods1.get_RRO_CERTIFIC_proc(ID_TRADE_POINT:longint ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_RRO_CERTIFIC.Active:=False;
      Q_RRO_CERTIFIC.Connection:=ADOConnectionTmp;
      try

        Q_RRO_CERTIFIC.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        Q_RRO_CERTIFIC.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_RRO_CERTIFIC_proc(ID_TRADE_POINT:longint ): TJSONObject;


// получение инфо о фискальных кассах работающих на тт  ID_TRADE_POINT
function TServerMethods1.get_RRO_KASSA_TS_proc(ID_TRADE_POINT:longint ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_RRO_KASSA_TS.Active:=False;
      Q_RRO_KASSA_TS.Connection:=ADOConnectionTmp;
      try

        Q_RRO_KASSA_TS.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        Q_RRO_KASSA_TS.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_RRO_KASSA_TS_proc(ID_TRADE_POINT:longint ): TJSONObject;




// получение таблицы купонных карт
function TServerMethods1.get_KUPON_CARD_proc: TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_KUPON_CARD_Import.Active:=False;
      Q_KUPON_CARD_Import.Connection:=ADOConnectionTmp;
      try
        Q_KUPON_CARD_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_KUPON_CARD_proc: TJSONObject;



// получение пользователей для ТС
function TServerMethods1.get_Q_UserTradePoint_proc(ID_TRADE_POINT:longint ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_UserTradePoint.Active:=False;
      Q_UserTradePoint.Connection:=ADOConnectionTmp;
      try

        Q_UserTradePoint.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        Q_UserTradePoint.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Q_UserTradePoint_proc(ID_TRADE_POINT:longint ): TJSONObject;





// получение таблицы пользовательского прайслиста для торговой точки ID_TRADE_POINT
function TServerMethods1.get_USER_PRICE_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QUserPrice_Import.Active:=False;
      QUserPrice_Import.Connection:=ADOConnectionTmp;
      try
        QUserPrice_Import.Parameters.ParamByName('ID_CLI_TP').Value:=ID_TRADE_POINT;
        QUserPrice_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_USER_PRICE_proc(ID_CLI_TP:integer): TJSONObject;



// получение таблицы шапок документов типа ID_DOC_TYPE для торговой точки ID_TRADE_POINT за дату D_DOC
function TServerMethods1.get_QNaklCap_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QNaklCap_Import.Active:=False;
      QNaklCap_Import.Connection:=ADOConnectionTmp;
      try
        QNaklCap_Import.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        QNaklCap_Import.Parameters.ParamByName('ID_DOC_TYPE').Value:=ID_DOC_TYPE;
        QNaklCap_Import.Parameters.ParamByName('D_DOC').Value:=D_DOC;
        QNaklCap_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QNaklCap_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;



// получение таблицы шапок документов типа ID_DOC_TYPE для торговой точки ID_TRADE_POINT за дату D_DOC
function TServerMethods1.get_QNaklTov_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QNaklTov_Import.Active:=False;
      QNaklTov_Import.Connection:=ADOConnectionTmp;
      try
        QNaklTov_Import.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        QNaklTov_Import.Parameters.ParamByName('ID_DOC_TYPE').Value:=ID_DOC_TYPE;
        QNaklTov_Import.Parameters.ParamByName('D_DOC').Value:=D_DOC;
        QNaklTov_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QNaklTov_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;




// получение таблицы навесок документов типа ID_DOC_TYPE для торговой точки ID_TRADE_POINT за дату D_DOC
function TServerMethods1.get_QNaveski_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QNaveski_Import.Active:=False;
      QNaveski_Import.Connection:=ADOConnectionTmp;
      try
        QNaveski_Import.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
        QNaveski_Import.Parameters.ParamByName('ID_DOC_TYPE').Value:=ID_DOC_TYPE;
        QNaveski_Import.Parameters.ParamByName('D_DOC').Value:=D_DOC;
        QNaveski_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QNaveski_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;


 // получение таблицы скидок на дату D
function TServerMethods1.get_Skidka_Import_proc(D:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QSkidka_POS_Import.Active:=False;
      QSkidka_POS_Import.Connection:=ADOConnectionTmp;
      try
        QSkidka_POS_Import.Parameters.ParamByName('D').Value:=D;
        QSkidka_POS_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Skidka_proc: TJSONObject;





// получение временной таблицы документов  с, для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_NaklCap_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_NaklCap_Export.Active:=False;
    ADS_NaklCap_Export.Connection:=ADOConnectionTmp;
    try
      ADS_NaklCap_Export.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_NaklCap_Export.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_NaklCap_Export_proc



 // получение временной таблицы товарной начинки документов  с, для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_NaklTov_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_NaklTov_Export.Active:=False;
    ADS_NaklTov_Export.Connection:=ADOConnectionTmp;
    try
      ADS_NaklTov_Export.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_NaklTov_Export.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_NaklTov_Export_proc


 // получение временной таблицы навесок товарной начинки документов  с, для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_Naveski_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_Naveski_Export.Active:=False;
    ADS_Naveski_Export.Connection:=ADOConnectionTmp;
    try
      ADS_Naveski_Export.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_Naveski_Export.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_Naveski_Export_proc




 // получение временной таблицы новых покупателей с бонусной картой для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_CLIENTS_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_CLIENTS_NEW_POS_Export.Active:=False;
    ADS_CLIENTS_NEW_POS_Export.Connection:=ADOConnectionTmp;
    try
      ADS_CLIENTS_NEW_POS_Export.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_CLIENTS_NEW_POS_Export.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_CLIENTS_NEW_POS_Export_proc



 // получение временной таблицы новых штрихкодов для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_SHTRIH_CODE_TOV_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin

    ADS_SHTRIH_CODE_TOV_NEW_POS.Active:=False;
    ADS_SHTRIH_CODE_TOV_NEW_POS.Connection:=ADOConnectionTmp;
    try
      ADS_SHTRIH_CODE_TOV_NEW_POS.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_SHTRIH_CODE_TOV_NEW_POS.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_SHTRIH_CODE_TOV_NEW_POS_Export_proc


// получение временной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_SVERKA_DOC_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_SVERKA_DOC_POS_Export.Active:=False;
    ADS_SVERKA_DOC_POS_Export.Connection:=ADOConnectionTmp;
    try
      ADS_SVERKA_DOC_POS_Export.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_SVERKA_DOC_POS_Export.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_SVERKA_DOC_POS_Export_proc



// получение ADS_CONST_VALUES_TP_EXPORT  для торг. точки ID_TRADE_POINT
// для экспорта данных
function TServerMethods1.get_CONST_VALUES_TP_EXPORT_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
  if ADOConnectionTmp<>Nil then
  begin
    ADS_CONST_VALUES_TP_EXPORT.Active:=False;
    ADS_CONST_VALUES_TP_EXPORT.Connection:=ADOConnectionTmp;
    try
      ADS_CONST_VALUES_TP_EXPORT.Parameters.ParamByName('ID_TRADE_POINT').Value:=ID_TRADE_POINT;
      ADS_CONST_VALUES_TP_EXPORT.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end; // function TServerMethods1.get_CONST_VALUES_TP_EXPORT_proc



// импорт документов из временных таблиц полученных из POS системы клиента в учетную БД
function TServerMethods1.Import_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin
 status_oper:=0;
 comment:='Ok';

  if ADOConnectionTmp<>Nil then
  begin
     try
      SP_IMPORT_DOC_POS.Connection:=ADOConnectionTmp;
      SP_IMPORT_DOC_POS.Parameters.ParamValues['@ID_TRADE_POINT']:=ID_TRADE_POINT;
      SP_IMPORT_DOC_POS.ExecProc;
      if SP_IMPORT_DOC_POS.Parameters.ParamValues['@ER']<>0  then
      begin
        status_oper:=-1;
        comment:='Ошибка при выполнении процедуры IMPORT_DOC_POS';
      end;
     finally
      ;
     end;
  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;

function TServerMethods1.Import_SVERKA_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
// импорт признака сверки приходных документов из временных таблиц полученных из POS системы клиента в учетную БД
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin
 status_oper:=0;
 comment:='Ok';

  if ADOConnectionTmp<>Nil then
  begin
     try
      SP_IMPORT_SVERKA_DOC_POS.Connection:=ADOConnectionTmp;
      SP_IMPORT_SVERKA_DOC_POS.Parameters.ParamValues['@ID_TRADE_POINT']:=ID_TRADE_POINT;
      SP_IMPORT_SVERKA_DOC_POS.ExecProc;
      if SP_IMPORT_SVERKA_DOC_POS.Parameters.ParamValues['@ER']<>0  then
      begin
        status_oper:=-1;
        comment:='Ошибка при выполнении процедуры IMPORT_SVERKA_DOC_POS';
      end;
     finally
      ;
     end;
  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;

end;


function TServerMethods1.DELETE_IMPORT_DOC_POS_proc(ID_TRADE_POINT, ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime): TJSONObject;
// Удаление ранее импортированных документов с торг. точки за период
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin
 status_oper:=0;
 comment:='Ok';

  if ADOConnectionTmp<>Nil then
  begin
     try

      SP_DELETE_IMPORT_DOC_POS.Connection:=ADOConnectionTmp;
      SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@ID_TRADE_POINT']:=ID_TRADE_POINT;
      SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@D_FROM']:=D_FROM;
      SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@D_TO']:=D_TO;
      SP_DELETE_IMPORT_DOC_POS.ExecProc;
      if SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@ER']<>0  then
      begin
        status_oper:=-1;
        comment:='Ошибка DELETE_IMPORT_DOC_POS_proc'+SP_DELETE_IMPORT_DOC_POS.Parameters.ParamValues['@ER_COMMENT'];
      end;
     finally
      ;
     end;
  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;

end;


 // Удаление из вспомогательных таблиц данных о документах из POS системы
function TServerMethods1.DELETE_TMP_DOC_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 status_oper:=0;
 comment:='Ok';

  if ADOConnectionTmp<>Nil then
  begin
     try
      SP_DELETE_TMP_DOC_POS.Connection:=ADOConnectionTmp;
      SP_DELETE_TMP_DOC_POS.Parameters.ParamValues['@ID_TRADE_POINT']:=ID_TRADE_POINT;
      SP_DELETE_TMP_DOC_POS.ExecProc;
      if SP_DELETE_TMP_DOC_POS.Parameters.ParamValues['@ER']<>0  then
      begin
        status_oper:=-1;
        comment:='Ошибка при выполнении процедуры DELETE_TMP_DOC_POS';
      end;
     finally
      ;
     end;
  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;





// получение таблицы типов документов  с характером ID_CHAR_DOC
function TServerMethods1.get_Doc_Type_proc(ID_CHAR_DOC:integer): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin

  if ADOConnectionTmp<>Nil then
  begin
    ADS_Doc_Type.Active:=False;
    ADS_Doc_Type.Connection:=ADOConnectionTmp;
    try
      ADS_Doc_Type.Parameters.ParamByName('IDCHARDOC').Value:=ID_CHAR_DOC;
      ADS_Doc_Type.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;


// получение таблицы документов  с типом ID_DOC_TYPE, за период с DFROM по DTO
function TServerMethods1.get_NaklCap_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin

  if ADOConnectionTmp<>Nil then
  begin
    ADS_NaklCap.Active:=False;
    ADS_NaklCap.Connection:=ADOConnectionTmp;
    try
      ADS_NaklCap.Parameters.ParamByName('IDDT').Value:=ID_DOC_TYPE;
      ADS_NaklCap.Parameters.ParamByName('ISDEL').Value:=0;
      ADS_NaklCap.Parameters.ParamByName('DFROM').Value:=DFROM;
      ADS_NaklCap.Parameters.ParamByName('DTO').Value:=DTO;
      ADS_NaklCap.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;


 {
// получение таблицы нарядов ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE, за период с DFROM по DTO
function TServerMethods1.get_AvtoNariad_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin

  if ADOConnectionTmp<>Nil then
  begin
    ADSAvtoNariad.Active:=False;
    ADSAvtoNariad.Connection:=ADOConnectionTmp;
    try
      ADSAvtoNariad.Parameters.ParamByName('IDDT').Value:=ID_DOC_TYPE;
      ADSAvtoNariad.Parameters.ParamByName('ISDEL').Value:=0;
      ADSAvtoNariad.Parameters.ParamByName('DFROM').Value:=DFROM;
      ADSAvtoNariad.Parameters.ParamByName('DTO').Value:=DTO;
      ADSAvtoNariad.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;

}
{
// получение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
function TServerMethods1.get_AvtoNariadEdit_proc(ID_DOC_TYPE:integer; ID_AVTO_NARIAD:integer): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin

  if ADOConnectionTmp<>Nil then
  begin
    ADSAvtoNariadEdit.Active:=False;
    ADSAvtoNariadEdit.Connection:=ADOConnectionTmp;
    try
      ADSAvtoNariadEdit.Parameters.ParamByName('IDDT').Value:=ID_DOC_TYPE;
      ADSAvtoNariadEdit.Parameters.ParamByName('ISDEL').Value:=0;
      ADSAvtoNariadEdit.Parameters.ParamByName('IDAVTONARIAD').Value:=ID_AVTO_NARIAD;
      ADSAvtoNariadEdit.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;
}
{
// изменение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
function TServerMethods1.Edit_AvtoNariad_proc(ID_DOC_TYPE,ID_AVTO_NARIAD:integer;
    N:string; Date_doc:TDateTime; ID_CLI_AVTO, ID_CLI_D:integer; SCH_D, SCH_K:string;
    Probeg1, Probeg2, NormaProbegTmp, Motochas1, Motochas2, NormaMotochasTmp:double;
    Comment_Rabot:string; N_Topliva, WORK_HOURS:double; ID_DRIVER:integer;
    S_reason_delete_edit:string ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
    ID_NC_NEW:Integer;
begin
 status_oper:=0;
 comment:='Ok';
 ID_NC_NEW:=-1;

  if ADOConnectionTmp<>Nil then
  begin
     try
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_AVTO_NARIAD']:=ID_AVTO_NARIAD;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@NN']:=N;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@DATE_DOC']:=Date_doc;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_CLI_AVTO']:=ID_CLI_AVTO;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_CLI_D']:=ID_CLI_D;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@SCH_D']:=SCH_D;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@SCH_K']:=SCH_K;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@Probeg1']:=Probeg1;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@Probeg2']:=Probeg2;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@NormaProbegTmp']:=NormaProbegTmp;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@Motochas1']:=Motochas1;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@Motochas2']:=Motochas2;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@NormaMotochasTmp']:=NormaMotochasTmp;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@Comment_Rabot']:=Comment_Rabot;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@N_Topliva']:=N_Topliva;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@WORK_HOURS']:=WORK_HOURS;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_DRIVER']:=ID_DRIVER;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@S_reason_delete_edit']:=S_reason_delete_edit;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_USER']:=id_user;
      SP_AVTONARIAD_EDIT.Parameters.ParamValues['@IN_TRANSACTION']:=1;
      SP_AVTONARIAD_EDIT.ExecProc;
      if SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ER']=0  then
      begin
        ID_NC_NEW:=SP_AVTONARIAD_EDIT.Parameters.ParamValues['@ID_AVTO_NARIAD_NEW'];
      end;
     finally

     end;
  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 pair:=TJSONPair.Create('ID_AVTO_NARIAD', TJSONNumber.Create(ID_NC_NEW));
 msg.AddPair(pair);
 Result := msg;



end;
}


 // выполнение действий, связанных с редактированием документа с кодом ID_NAKLCAP
// получение таблицы товаров этого документа и информации о шапке с другими данными
function TServerMethods1.NaklEdit_proc(ID_NAKLCAP:integer; S_reason_delete_edit: string ): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе


   Year, Month, Day: Word;
   Date_doc:TDateTime;
   ID_NC_NEW:Integer;
begin
 status_oper:=0;
 comment:='Ok';
 ID_NC_NEW:=-1;

  if ADOConnectionTmp<>Nil then
  begin

    try
      SP_COPY_NAKL.Connection:=ADOConnectionTmp;
      SP_COPY_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
      SP_COPY_NAKL.Parameters.ParamValues['@ID_USER']:=id_user;
      SP_COPY_NAKL.Parameters.ParamValues['@COMMENT_DEL']:=S_reason_delete_edit;
      SP_COPY_NAKL.ExecProc;
      if SP_COPY_NAKL.Parameters.ParamValues['@ER']=0  then
      begin
       // код копии накладной
        ID_NC_NEW:=SP_COPY_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
        SP_SET_PRICE_FROM_NAKL.Connection:=ADOConnectionTmp;
        SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ID_USER']:=id_user;
        SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
        SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@IN_TRANSACTION']:=1;
        SP_SET_PRICE_FROM_NAKL.ExecProc;
        if SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ER']=0  then
        begin
           // инфо о шапке редактируемой накладной
          Q_NaklCapInfo.Active:=False;
          Q_NaklCapInfo.ConnectionString:='';
          Q_NaklCapInfo.Connection:=ADOConnectionTmp;
          Q_NaklCapInfo.Parameters.ParamByName('IDNC').Value:=ID_NC_NEW;
          Q_NaklCapInfo.Active:=True;

          Q_Doc_Type.Active:=False;
          Q_Doc_Type.ConnectionString:='';
          Q_Doc_Type.Connection:=ADOConnectionTmp;
          Q_Doc_Type.Parameters.ParamByName('IDDOCTYPE').Value:=
            Q_NaklCapInfo.FieldByName('ID_DOC_TYPE').asInteger;
          Q_Doc_Type.Active:=True;

         DecodeDate(Q_NaklCapInfo.FieldByName('D').AsFloat, Year, Month, Day);
         Date_doc:=EncodeDate(Year, Month, Day);

          ADS_Price.Active:=False;
          ADS_Price.ConnectionString:='';
          ADS_Price.Connection:=ADOConnectionTmp;
          ADS_Price.Parameters.ParamByName('IDCLI').Value:=
            Q_NaklCapInfo.FieldByName('ID_CLIENT').asInteger;
          ADS_Price.Parameters.ParamByName('D_FROM').Value:=Date_doc;
          ADS_Price.Parameters.ParamByName('D_TO').Value:=Date_doc+1-1/24/60/60;
          ADS_Price.Parameters.ParamByName('per_nds').Value:=
            Q_NaklCapInfo.FieldByName('STAVKA_NDS').AsFloat;
          ADS_Price.Parameters.ParamByName('D_DOC').Value:=
            Q_NaklCapInfo.FieldByName('D').AsFloat;
          ADS_Price.Parameters.ParamByName('IDU').Value:=id_user;
          ADS_Price.Parameters.ParamByName('IDG_FROM').Value:=
           Q_Doc_Type.FieldByName('ID_GRTOV').AsInteger;
          ADS_Price.Parameters.ParamByName('IDG_TO').Value:=
            Q_Doc_Type.FieldByName('ID_GRTOV').AsInteger;
          ADS_Price.Active:=True;


          Q_ControlLinkDoc.Close;
          Q_ControlLinkDoc.ConnectionString:='';
          Q_ControlLinkDoc.Connection:=ADOConnectionTmp;
          Q_ControlLinkDoc.Parameters.ParamByName('IDLINKDOC').Value:=
           Q_NaklCapInfo.FieldByName('ID_NAKLCAP').AsInteger;
          Q_ControlLinkDoc.Open;

        end; // if SP_SET_PRICE_FROM_NAKL.Parameters.ParamValues['@ER']=0  then
       end; // if dm1.SP_COPY_NAKL.Parameters.ParamValues['@ER']=0  then

    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 pair:=TJSONPair.Create('ID_NC_NEW', TJSONNumber.Create(ID_NC_NEW));
 msg.AddPair(pair);




 Result := msg;



end;


// получение данных отчета реализация клиету  с типом ID_CLI, за период с DFROM по DTO
function TServerMethods1.get_RepOtgruzTov1_proc(ID_CLI:integer; DFROM, DTO:TDateTime): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;

    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе

begin

  if ADOConnectionTmp<>Nil then
  begin
    QRepOtgruzTov1.Active:=False;
    QRepOtgruzTov1.Connection:=ADOConnectionTmp;
    try
    {
      ADS_NaklCap.Parameters.ParamByName('IDDT').Value:=ID_DOC_TYPE;
      ADS_NaklCap.Parameters.ParamByName('ISDEL').Value:=0;
      ADS_NaklCap.Parameters.ParamByName('DFROM').Value:=DFROM;
      ADS_NaklCap.Parameters.ParamByName('DTO').Value:=DTO;
      }
     QRepOtgruzTov1.Active:=True;
      status_oper:=0;
      comment:='Ok';
    except
     status_oper:=1;
     comment:='Ошибка в запросе!';
    end;   // try

  end
  else // if ADOConnectionTmp<>Nil then
  begin
    status_oper:=-1;
    comment:='Нет соединения с БД';
  end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;



end;


// получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
function TServerMethods1.get_Q_KIO_OPERATIONS_GRUP_Import_proc(): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      Q_KIO_OPERATIONS_GRUP_Import.Active:=False;
      Q_KIO_OPERATIONS_GRUP_Import.Connection:=ADOConnectionTmp;
      try
        Q_KIO_OPERATIONS_GRUP_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_Q_KIO_OPERATIONS_GRUP_Import_proc(): TJSONObject;



// получение таблицы продукции собственного пр-ва
function TServerMethods1.get_QPRODUCT_POS_Import_proc(): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QPRODUCT_POS_Import.Active:=False;
      QPRODUCT_POS_Import.Connection:=ADOConnectionTmp;
      try
        QPRODUCT_POS_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QPRODUCT_POS_Import_proc(): TJSONObject;


// получение таблицы норм продукции собственного пр-ва
function TServerMethods1.get_QNORM_ASSEMB_POS_Import_proc(): TJSONObject;
var msg:TJSONObject;
    pair:TJSONPair;
    status_oper:integer;   // -1 нет соединения; 0 все хорошо; 1 ошибка в запросе
begin
 if id_user<>-1 then
 begin
     if ADOConnectionTmp<>Nil then
    begin
      QNORM_ASSEMB_POS_Import.Active:=False;
      QNORM_ASSEMB_POS_Import.Connection:=ADOConnectionTmp;
      try
        QNORM_ASSEMB_POS_Import.Active:=True;
        status_oper:=0;
        comment:='Ok ' + user;
      except
       status_oper:=1;
       comment:='Ошибка в запросе!';
      end;   // try

    end
    else // if ADOConnectionTmp<>Nil then
    begin
      status_oper:=-1;
      comment:='Нет соединения с БД';
    end;
 end
 else
 begin
  status_oper:=-2;
  comment:='Нет входа в удаленную БД';
 end;

 msg:=TJSONObject.Create;
 pair:=TJSONPair.Create('status_oper', TJSONNumber.Create(status_oper));
 msg.AddPair(pair);
 pair:=TJSONPair.Create('comment', comment);
 msg.AddPair(pair);
 Result := msg;
end;   // function TServerMethods1.get_QNORM_ASSEMB_POS_Import_proc(): TJSONObject;





end.

