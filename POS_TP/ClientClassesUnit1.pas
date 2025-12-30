//
// Created by the DataSnap proxy generator.
// 17.05.2017 15:48:58
//

unit ClientClassesUnit1;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    Flogin_procCommand: TDBXCommand;
    FUnLogin_procCommand: TDBXCommand;
    Fget_user_procCommand: TDBXCommand;
    Fget_Kateg_Cli_procCommand: TDBXCommand;
    Fget_Clients_procCommand: TDBXCommand;
    Fget_Bonuses_procCommand: TDBXCommand;
    Fget_BonusCli_procCommand: TDBXCommand;
    Fset_BonusClient_procCommand: TDBXCommand;
    Fget_GrTov_procCommand: TDBXCommand;
    Fget_Tov_procCommand: TDBXCommand;
    Fget_BarCodes_procCommand: TDBXCommand;
    Fget_PRICE_DATE_procCommand: TDBXCommand;
    Fget_QNewPriceTov_procCommand: TDBXCommand;
    Fget_QAdvert_procCommand: TDBXCommand;
    Fget_Q_UserTradePoint_procСommand: TDBXCommand;
    Fget_USER_PRICE_procCommand: TDBXCommand;
    Fget_QNaklCap_Import_procCommand: TDBXCommand;
    Fget_QNaklTov_Import_procCommand: TDBXCommand;
    Fget_QNaveski_Import_procCommand: TDBXCommand;
    Fget_Skidka_Import_procCommand: TDBXCommand;
    Fget_KUPON_CARD_procCommand: TDBXCommand;

    Fget_NaklCapExport_procCommand: TDBXCommand;
    Fget_NaklTovExport_procCommand: TDBXCommand;
    Fget_NaveskiExport_procCommand: TDBXCommand;
    Fget_CLIENTS_NEW_POS_Export_procCommand: TDBXCommand;
    Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand: TDBXCommand;
    Fget_SVERKA_DOC_POS_Export_procCommand: TDBXCommand;
    Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand: TDBXCommand;
    Fget_QPRODUCT_POS_Import_procCommand: TDBXCommand;
    Fget_QNORM_ASSEMB_POS_Import_procCommand: TDBXCommand;

    FImport_Doc_POS_procCommand: TDBXCommand;
    FImport_SVERKA_Doc_POS_procCommand: TDBXCommand;
    FDELETE_TMP_DOC_POS_procCommand: TDBXCommand;

    Fget_Doc_Type_procCommand: TDBXCommand;
    Fget_NaklCap_procCommand: TDBXCommand;
    FNaklEdit_procCommand: TDBXCommand;
    Fget_AvtoNariad_procCommand: TDBXCommand;
    Fget_AvtoNariadEdit_procCommand: TDBXCommand;
    FEdit_AvtoNariad_procCommand: TDBXCommand;
    FDELETE_IMPORT_DOC_POS_procCommand: TDBXCommand;
    Fget_RRO_KASSA_TS_procCommand: TDBXCommand;
    Fget_RRO_CERTIFIC_procCommand: TDBXCommand;
    FCONST_VALUES_TP_EXPORT_procCommand: TDBXCommand;

  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    function login_proc(login: string; passw: string): TJSONObject;
    function UnLogin_proc: TJSONObject;
    function get_user_proc: TJSONObject;
    function get_Kateg_Cli_proc: TJSONObject;
    function get_Clients_proc: TJSONObject;
    function get_Bonuses_proc: TJSONObject;
    function get_BonusCli_proc(INN:string): TJSONObject;
    function save_Bonus_Bales_proc(INN:string; S_KOLBASA, S_MYASO, S_TNP, SUM_OPL_BONUS, SUM_SDACHA_TO_BONUS_CARD:double): TJSONObject;

    function get_GrTov_proc: TJSONObject;
    function get_Tov_proc: TJSONObject;
    function get_BarCodes_proc: TJSONObject;
    function get_PRICE_DATE_proc: TJSONObject;
    function get_QNewPriceTov_proc(D:TDateTime; ID_TRADE_POINT:longint ) : TJSONObject;
    function get_QAdvert_proc(ID_TRADE_POINT:longint ): TJSONObject;
    function get_Q_UserTradePoint_proc(ID_TRADE_POINT:longint ): TJSONObject;
    function get_USER_PRICE_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_QNaklCap_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_QNaklTov_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_QNaveski_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
    function get_Skidka_Import_proc(D:TDateTime): TJSONObject;
    function get_KUPON_CARD_proc: TJSONObject; // получение таблицы купонных карт

     // получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
    function get_Q_KIO_OPERATIONS_GRUP_Import_proc(): TJSONObject;

    // получение таблицы продукции собственного пр-ва
    function get_QPRODUCT_POS_Import_proc(): TJSONObject;
    // получение таблицы норм продукции собственного пр-ва
    function get_QNORM_ASSEMB_POS_Import_proc(): TJSONObject;

    function get_NaklCap_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_NaklTov_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_Naveski_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_CLIENTS_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_SHTRIH_CODE_TOV_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function get_SVERKA_DOC_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
    function Import_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
    function Import_SVERKA_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
    function DELETE_TMP_DOC_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
    function DELETE_IMPORT_DOC_POS_proc(ID_TRADE_POINT, ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime): TJSONObject;

    function get_RRO_CERTIFIC_proc(ID_TRADE_POINT:longint ): TJSONObject;
    function get_RRO_KASSA_TS_proc(ID_TRADE_POINT:longint ): TJSONObject;

    function get_Doc_Type_proc(ID_CHAR_DOC: Integer): TJSONObject;
    function get_NaklCap_proc(ID_DOC_TYPE: Integer; DFROM: TDateTime; DTO: TDateTime): TJSONObject;
    function NaklEdit_proc(ID_NAKLCAP: Integer; S_reason_delete_edit: string): TJSONObject;
    function get_AvtoNariad_proc(ID_DOC_TYPE: Integer; DFROM: TDateTime; DTO: TDateTime): TJSONObject;
    function get_AvtoNariadEdit_proc(ID_DOC_TYPE: Integer; ID_AVTO_NARIAD: Integer): TJSONObject;
    function Edit_AvtoNariad_proc(ID_DOC_TYPE: Integer; ID_AVTO_NARIAD: Integer; N: string; Date_doc: TDateTime; ID_CLI_AVTO: Integer; ID_CLI_D: Integer; SCH_D: string; SCH_K: string; Probeg1: Double; Probeg2: Double; NormaProbegTmp: Double; Motochas1: Double; Motochas2: Double; NormaMotochasTmp: Double; Comment_Rabot: string; N_Topliva: Double; WORK_HOURS: Double; ID_DRIVER: Integer; S_reason_delete_edit: string): TJSONObject;
    function get_CONST_VALUES_TP_EXPORT_proc(ID_TRADE_POINT:longint): TJSONObject;

  end;

implementation

procedure TServerMethods1Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TServerMethods1.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

function TServerMethods1Client.login_proc(login: string; passw: string): TJSONObject;
begin
  if Flogin_procCommand = nil then
  begin
    Flogin_procCommand := FDBXConnection.CreateCommand;
    Flogin_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Flogin_procCommand.Text := 'TServerMethods1.login_proc';
    Flogin_procCommand.Prepare;
  end;
  Flogin_procCommand.Parameters[0].Value.SetWideString(login);
  Flogin_procCommand.Parameters[1].Value.SetWideString(passw);
  Flogin_procCommand.ExecuteUpdate;
  Result := TJSONObject(Flogin_procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.UnLogin_proc: TJSONObject;
begin
  if FUnLogin_procCommand = nil then
  begin
    FUnLogin_procCommand := FDBXConnection.CreateCommand;
    FUnLogin_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUnLogin_procCommand.Text := 'TServerMethods1.UnLogin_proc';
    FUnLogin_procCommand.Prepare;
  end;
  FUnLogin_procCommand.ExecuteUpdate;
  Result := TJSONObject(FUnLogin_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_user_proc: TJSONObject;
begin
  if Fget_user_procCommand = nil then
  begin
    Fget_user_procCommand := FDBXConnection.CreateCommand;
    Fget_user_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_user_procCommand.Text := 'TServerMethods1.get_user_proc';
    Fget_user_procCommand.Prepare;
  end;
  Fget_user_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_user_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_Kateg_Cli_proc: TJSONObject;
begin
  if Fget_Kateg_Cli_procCommand = nil then
  begin
    Fget_Kateg_Cli_procCommand := FDBXConnection.CreateCommand;
    Fget_Kateg_Cli_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Kateg_Cli_procCommand.Text := 'TServerMethods1.get_Kateg_Cli_proc';
    Fget_Kateg_Cli_procCommand.Prepare;
  end;
  Fget_Kateg_Cli_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Kateg_Cli_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_Clients_proc: TJSONObject;
begin
  if Fget_Clients_procCommand = nil then
  begin
    Fget_Clients_procCommand := FDBXConnection.CreateCommand;
    Fget_Clients_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Clients_procCommand.Text := 'TServerMethods1.get_Clients_proc';
    Fget_Clients_procCommand.Prepare;
  end;
  Fget_Clients_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Clients_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_Bonuses_proc: TJSONObject;
begin
  if Fget_Bonuses_procCommand = nil then
  begin
    Fget_Bonuses_procCommand := FDBXConnection.CreateCommand;
    Fget_Bonuses_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Bonuses_procCommand.Text := 'TServerMethods1.get_Bonuses_proc';
    Fget_Bonuses_procCommand.Prepare;
  end;
  Fget_Bonuses_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Bonuses_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_BonusCli_proc(INN:string): TJSONObject;
begin
  if Fget_BonusCli_procCommand = nil then
  begin
    Fget_BonusCli_procCommand := FDBXConnection.CreateCommand;
    Fget_BonusCli_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_BonusCli_procCommand.Text := 'TServerMethods1.get_BonusCli_proc';
    Fget_BonusCli_procCommand.Prepare;
  end;
  Fget_BonusCli_procCommand.Parameters[0].Value.SetWideString(INN);
  Fget_BonusCli_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_BonusCli_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.save_Bonus_Bales_proc(INN:string; S_KOLBASA, S_MYASO, S_TNP, SUM_OPL_BONUS, SUM_SDACHA_TO_BONUS_CARD:double): TJSONObject;
begin
  if Fset_BonusClient_procCommand = nil then
  begin
    Fset_BonusClient_procCommand := FDBXConnection.CreateCommand;
    Fset_BonusClient_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fset_BonusClient_procCommand.Text := 'TServerMethods1.save_Bonus_Bales_proc';
    Fset_BonusClient_procCommand.Prepare;
  end;
  Fset_BonusClient_procCommand.Parameters[0].Value.SetWideString(INN);
  Fset_BonusClient_procCommand.Parameters[1].Value.SetDouble(S_KOLBASA);
  Fset_BonusClient_procCommand.Parameters[2].Value.SetDouble(S_MYASO);
  Fset_BonusClient_procCommand.Parameters[3].Value.SetDouble(S_TNP);
  Fset_BonusClient_procCommand.Parameters[4].Value.SetDouble(SUM_OPL_BONUS);
  Fset_BonusClient_procCommand.Parameters[5].Value.SetDouble(SUM_SDACHA_TO_BONUS_CARD);
  Fset_BonusClient_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fset_BonusClient_procCommand.Parameters[6].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_KUPON_CARD_proc: TJSONObject;
begin
  if Fget_KUPON_CARD_procCommand = nil then
  begin
    Fget_KUPON_CARD_procCommand := FDBXConnection.CreateCommand;
    Fget_KUPON_CARD_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_KUPON_CARD_procCommand.Text := 'TServerMethods1.get_KUPON_CARD_proc';
    Fget_KUPON_CARD_procCommand.Prepare;
  end;
  Fget_KUPON_CARD_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_KUPON_CARD_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_GrTov_proc: TJSONObject;
begin
  if Fget_GrTov_procCommand = nil then
  begin
    Fget_GrTov_procCommand := FDBXConnection.CreateCommand;
    Fget_GrTov_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_GrTov_procCommand.Text := 'TServerMethods1.get_GrTov_proc';
    Fget_GrTov_procCommand.Prepare;
  end;
  Fget_GrTov_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_GrTov_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_Tov_proc: TJSONObject;
begin
  if Fget_Tov_procCommand = nil then
  begin
    Fget_Tov_procCommand := FDBXConnection.CreateCommand;
    Fget_Tov_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Tov_procCommand.Text := 'TServerMethods1.get_Tov_proc';
    Fget_Tov_procCommand.Prepare;
  end;
  Fget_Tov_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Tov_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_BarCodes_proc: TJSONObject;
begin
  if Fget_BarCodes_procCommand = nil then
  begin
    Fget_BarCodes_procCommand := FDBXConnection.CreateCommand;
    Fget_BarCodes_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_BarCodes_procCommand.Text := 'TServerMethods1.get_BarCodes_proc';
    Fget_BarCodes_procCommand.Prepare;
  end;
  Fget_BarCodes_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_BarCodes_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_PRICE_DATE_proc: TJSONObject;
begin
  if Fget_PRICE_DATE_procCommand = nil then
  begin
    Fget_PRICE_DATE_procCommand := FDBXConnection.CreateCommand;
    Fget_PRICE_DATE_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_PRICE_DATE_procCommand.Text := 'TServerMethods1.get_PRICE_DATE_proc';
    Fget_PRICE_DATE_procCommand.Prepare;
  end;
  Fget_PRICE_DATE_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_PRICE_DATE_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_QNewPriceTov_proc(D:TDateTime; ID_TRADE_POINT:longint ): TJSONObject;
begin
  if Fget_QNewPriceTov_procCommand = nil then
  begin
    Fget_QNewPriceTov_procCommand := FDBXConnection.CreateCommand;
    Fget_QNewPriceTov_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QNewPriceTov_procCommand.Text := 'TServerMethods1.get_QNewPriceTov_proc';
    Fget_QNewPriceTov_procCommand.Prepare;
  end;
  Fget_QNewPriceTov_procCommand.Parameters[0].Value.AsDateTime:=D;
  Fget_QNewPriceTov_procCommand.Parameters[1].Value.SetInt32(ID_TRADE_POINT);

  Fget_QNewPriceTov_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QNewPriceTov_procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_QAdvert_proc(ID_TRADE_POINT:longint ): TJSONObject;
begin
  if Fget_QAdvert_procCommand = nil then
  begin
    Fget_QAdvert_procCommand := FDBXConnection.CreateCommand;
    Fget_QAdvert_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QAdvert_procCommand.Text := 'TServerMethods1.get_QAdvert_proc';
    Fget_QAdvert_procCommand.Prepare;
  end;

  Fget_QAdvert_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_QAdvert_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QAdvert_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_RRO_CERTIFIC_proc(ID_TRADE_POINT:longint ): TJSONObject;
begin
  if Fget_RRO_CERTIFIC_procCommand = nil then
  begin
    Fget_RRO_CERTIFIC_procCommand := FDBXConnection.CreateCommand;
    Fget_RRO_CERTIFIC_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_RRO_CERTIFIC_procCommand.Text := 'TServerMethods1.get_RRO_CERTIFIC_proc';
    Fget_RRO_CERTIFIC_procCommand.Prepare;
  end;

  Fget_RRO_CERTIFIC_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_RRO_CERTIFIC_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_RRO_CERTIFIC_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_RRO_KASSA_TS_proc(ID_TRADE_POINT:longint ): TJSONObject;
begin
  if Fget_RRO_KASSA_TS_procCommand = nil then
  begin
    Fget_RRO_KASSA_TS_procCommand := FDBXConnection.CreateCommand;
    Fget_RRO_KASSA_TS_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_RRO_KASSA_TS_procCommand.Text := 'TServerMethods1.get_RRO_KASSA_TS_proc';
    Fget_RRO_KASSA_TS_procCommand.Prepare;
  end;

  Fget_RRO_KASSA_TS_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_RRO_KASSA_TS_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_RRO_KASSA_TS_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_Q_UserTradePoint_proc(ID_TRADE_POINT:longint ): TJSONObject;
begin
  if Fget_Q_UserTradePoint_procСommand = nil then
  begin
    Fget_Q_UserTradePoint_procСommand := FDBXConnection.CreateCommand;
    Fget_Q_UserTradePoint_procСommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Q_UserTradePoint_procСommand.Text := 'TServerMethods1.get_Q_UserTradePoint_proc';
    Fget_Q_UserTradePoint_procСommand.Prepare;
  end;

  Fget_Q_UserTradePoint_procСommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_Q_UserTradePoint_procСommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Q_UserTradePoint_procСommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_USER_PRICE_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_USER_PRICE_procCommand = nil then
  begin
    Fget_USER_PRICE_procCommand := FDBXConnection.CreateCommand;
    Fget_USER_PRICE_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_USER_PRICE_procCommand.Text := 'TServerMethods1.get_USER_PRICE_proc';
    Fget_USER_PRICE_procCommand.Prepare;
  end;
  Fget_USER_PRICE_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_USER_PRICE_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_USER_PRICE_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_QNaklCap_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
begin
  if Fget_QNaklCap_Import_procCommand = nil then
  begin
    Fget_QNaklCap_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_QNaklCap_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QNaklCap_Import_procCommand.Text := 'TServerMethods1.get_QNaklCap_Import_proc';
    Fget_QNaklCap_Import_procCommand.Prepare;
  end;
  Fget_QNaklCap_Import_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_QNaklCap_Import_procCommand.Parameters[1].Value.SetInt32(ID_DOC_TYPE);
  Fget_QNaklCap_Import_procCommand.Parameters[2].Value.AsDateTime:=D_DOC;
  Fget_QNaklCap_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QNaklCap_Import_procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_QNaklTov_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
begin
  if Fget_QNaklTov_Import_procCommand = nil then
  begin
    Fget_QNaklTov_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_QNaklTov_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QNaklTov_Import_procCommand.Text := 'TServerMethods1.get_QNaklTov_Import_proc';
    Fget_QNaklTov_Import_procCommand.Prepare;
  end;
  Fget_QNaklTov_Import_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_QNaklTov_Import_procCommand.Parameters[1].Value.SetInt32(ID_DOC_TYPE);
  Fget_QNaklTov_Import_procCommand.Parameters[2].Value.AsDateTime:=D_DOC;
  Fget_QNaklTov_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QNaklTov_Import_procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_QNaveski_Import_proc(ID_TRADE_POINT:longint; ID_DOC_TYPE:longint; D_DOC:TDateTime): TJSONObject;
begin
  if Fget_QNaveski_Import_procCommand = nil then
  begin
    Fget_QNaveski_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_QNaveski_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QNaveski_Import_procCommand.Text := 'TServerMethods1.get_QNaveski_Import_proc';
    Fget_QNaveski_Import_procCommand.Prepare;
  end;
  Fget_QNaveski_Import_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_QNaveski_Import_procCommand.Parameters[1].Value.SetInt32(ID_DOC_TYPE);
  Fget_QNaveski_Import_procCommand.Parameters[2].Value.AsDateTime:=D_DOC;
  Fget_QNaveski_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QNaveski_Import_procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_Skidka_Import_proc(D:TDateTime): TJSONObject;
begin
  if Fget_Skidka_Import_procCommand = nil then
  begin
    Fget_Skidka_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_Skidka_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Skidka_Import_procCommand.Text := 'TServerMethods1.get_Skidka_Import_proc';
    Fget_Skidka_Import_procCommand.Prepare;
  end;

  Fget_Skidka_Import_procCommand.Parameters[0].Value.AsDateTime:=D;
  Fget_Skidka_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Skidka_Import_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


 // получение таблицы групп товаров по видам операция (1 колбаса. 2 мясо. 3 ТНП, 4 овощи, 5 алкоголь, 6 собств. пр-во)
function TServerMethods1Client.get_Q_KIO_OPERATIONS_GRUP_Import_proc(): TJSONObject;
begin
  if Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand = nil then
  begin
    Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand.Text := 'TServerMethods1.get_Q_KIO_OPERATIONS_GRUP_Import_proc';
    Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand.Prepare;
  end;


  Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Q_KIO_OPERATIONS_GRUP_Import_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;




 // получение таблицы продукции собственного пр-ва
function TServerMethods1Client.get_QPRODUCT_POS_Import_proc(): TJSONObject;
begin
  if Fget_QPRODUCT_POS_Import_procCommand = nil then
  begin
    Fget_QPRODUCT_POS_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_QPRODUCT_POS_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QPRODUCT_POS_Import_procCommand.Text := 'TServerMethods1.get_QPRODUCT_POS_Import_proc';
    Fget_QPRODUCT_POS_Import_procCommand.Prepare;
  end;


  Fget_QPRODUCT_POS_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QPRODUCT_POS_Import_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

 // получение таблицы норм продукции собственного пр-ва
function TServerMethods1Client.get_QNORM_ASSEMB_POS_Import_proc(): TJSONObject;
begin
  if Fget_QNORM_ASSEMB_POS_Import_procCommand = nil then
  begin
    Fget_QNORM_ASSEMB_POS_Import_procCommand := FDBXConnection.CreateCommand;
    Fget_QNORM_ASSEMB_POS_Import_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_QNORM_ASSEMB_POS_Import_procCommand.Text := 'TServerMethods1.get_QNORM_ASSEMB_POS_Import_proc';
    Fget_QNORM_ASSEMB_POS_Import_procCommand.Prepare;
  end;


  Fget_QNORM_ASSEMB_POS_Import_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_QNORM_ASSEMB_POS_Import_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_NaklCap_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_NaklCapExport_procCommand = nil then
  begin
    Fget_NaklCapExport_procCommand := FDBXConnection.CreateCommand;
    Fget_NaklCapExport_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_NaklCapExport_procCommand.Text := 'TServerMethods1.get_NaklCap_Export_proc';
    Fget_NaklCapExport_procCommand.Prepare;
  end;

  Fget_NaklCapExport_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_NaklCapExport_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_NaklCapExport_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;




function TServerMethods1Client.get_NaklTov_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_NaklTovExport_procCommand = nil then
  begin
    Fget_NaklTovExport_procCommand := FDBXConnection.CreateCommand;
    Fget_NaklTovExport_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_NaklTovExport_procCommand.Text := 'TServerMethods1.get_NaklTov_Export_proc';
    Fget_NaklTovExport_procCommand.Prepare;
  end;

  Fget_NaklTovExport_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_NaklTovExport_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_NaklTovExport_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_Naveski_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_NaveskiExport_procCommand = nil then
  begin
    Fget_NaveskiExport_procCommand := FDBXConnection.CreateCommand;
    Fget_NaveskiExport_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_NaveskiExport_procCommand.Text := 'TServerMethods1.get_Naveski_Export_proc';
    Fget_NaveskiExport_procCommand.Prepare;
  end;

  Fget_NaveskiExport_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_NaveskiExport_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_NaveskiExport_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_CLIENTS_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_CLIENTS_NEW_POS_Export_procCommand = nil then
  begin
    Fget_CLIENTS_NEW_POS_Export_procCommand := FDBXConnection.CreateCommand;
    Fget_CLIENTS_NEW_POS_Export_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_CLIENTS_NEW_POS_Export_procCommand.Text := 'TServerMethods1.get_CLIENTS_NEW_POS_Export_proc';
    Fget_CLIENTS_NEW_POS_Export_procCommand.Prepare;
  end;

  Fget_CLIENTS_NEW_POS_Export_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_CLIENTS_NEW_POS_Export_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_CLIENTS_NEW_POS_Export_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.get_SHTRIH_CODE_TOV_NEW_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand = nil then
  begin
    Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand := FDBXConnection.CreateCommand;
    Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.Text := 'TServerMethods1.get_SHTRIH_CODE_TOV_NEW_POS_Export_proc';

    Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.Prepare;
  end;

  Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_SHTRIH_CODE_TOV_NEW_POS_Export_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_SVERKA_DOC_POS_Export_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if Fget_SVERKA_DOC_POS_Export_procCommand = nil then
  begin
    Fget_SVERKA_DOC_POS_Export_procCommand := FDBXConnection.CreateCommand;
    Fget_SVERKA_DOC_POS_Export_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_SVERKA_DOC_POS_Export_procCommand.Text := 'TServerMethods1.get_SVERKA_DOC_POS_Export_proc';

    Fget_SVERKA_DOC_POS_Export_procCommand.Prepare;
  end;

  Fget_SVERKA_DOC_POS_Export_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  Fget_SVERKA_DOC_POS_Export_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_SVERKA_DOC_POS_Export_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.Import_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if FImport_Doc_POS_procCommand = nil then
  begin
    FImport_Doc_POS_procCommand := FDBXConnection.CreateCommand;
    FImport_Doc_POS_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImport_Doc_POS_procCommand.Text := 'TServerMethods1.Import_Doc_POS_proc';
    FImport_Doc_POS_procCommand.Prepare;
  end;

  FImport_Doc_POS_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  FImport_Doc_POS_procCommand.ExecuteUpdate;
  Result := TJSONObject(FImport_Doc_POS_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.Import_SVERKA_Doc_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if FImport_SVERKA_Doc_POS_procCommand = nil then
  begin
    FImport_SVERKA_Doc_POS_procCommand := FDBXConnection.CreateCommand;
    FImport_SVERKA_Doc_POS_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FImport_SVERKA_Doc_POS_procCommand.Text := 'TServerMethods1.Import_SVERKA_Doc_POS_proc';
    FImport_SVERKA_Doc_POS_procCommand.Prepare;
  end;

  FImport_SVERKA_Doc_POS_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  FImport_SVERKA_Doc_POS_procCommand.ExecuteUpdate;
  Result := TJSONObject(FImport_SVERKA_Doc_POS_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_CONST_VALUES_TP_EXPORT_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if FCONST_VALUES_TP_EXPORT_procCommand = nil then
  begin
    FCONST_VALUES_TP_EXPORT_procCommand := FDBXConnection.CreateCommand;
    FCONST_VALUES_TP_EXPORT_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCONST_VALUES_TP_EXPORT_procCommand.Text := 'TServerMethods1.get_CONST_VALUES_TP_EXPORT_proc';
    FCONST_VALUES_TP_EXPORT_procCommand.Prepare;
  end;

  FCONST_VALUES_TP_EXPORT_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  FCONST_VALUES_TP_EXPORT_procCommand.ExecuteUpdate;
  Result := TJSONObject(FCONST_VALUES_TP_EXPORT_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.DELETE_TMP_DOC_POS_proc(ID_TRADE_POINT:longint): TJSONObject;
begin
  if FDELETE_TMP_DOC_POS_procCommand = nil then
  begin
    FDELETE_TMP_DOC_POS_procCommand := FDBXConnection.CreateCommand;
    FDELETE_TMP_DOC_POS_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDELETE_TMP_DOC_POS_procCommand.Text := 'TServerMethods1.DELETE_TMP_DOC_POS_proc';
    FDELETE_TMP_DOC_POS_procCommand.Prepare;
  end;

  FDELETE_TMP_DOC_POS_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  FDELETE_TMP_DOC_POS_procCommand.ExecuteUpdate;
  Result := TJSONObject(FDELETE_TMP_DOC_POS_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.get_Doc_Type_proc(ID_CHAR_DOC: Integer): TJSONObject;
begin
  if Fget_Doc_Type_procCommand = nil then
  begin
    Fget_Doc_Type_procCommand := FDBXConnection.CreateCommand;
    Fget_Doc_Type_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_Doc_Type_procCommand.Text := 'TServerMethods1.get_Doc_Type_proc';
    Fget_Doc_Type_procCommand.Prepare;
  end;
  Fget_Doc_Type_procCommand.Parameters[0].Value.SetInt32(ID_CHAR_DOC);
  Fget_Doc_Type_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_Doc_Type_procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_NaklCap_proc(ID_DOC_TYPE: Integer; DFROM: TDateTime; DTO: TDateTime): TJSONObject;
begin
  if Fget_NaklCap_procCommand = nil then
  begin
    Fget_NaklCap_procCommand := FDBXConnection.CreateCommand;
    Fget_NaklCap_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_NaklCap_procCommand.Text := 'TServerMethods1.get_NaklCap_proc';
    Fget_NaklCap_procCommand.Prepare;
  end;
  Fget_NaklCap_procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  Fget_NaklCap_procCommand.Parameters[1].Value.AsDateTime := DFROM;
  Fget_NaklCap_procCommand.Parameters[2].Value.AsDateTime := DTO;
  Fget_NaklCap_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_NaklCap_procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.DELETE_IMPORT_DOC_POS_proc(ID_TRADE_POINT, ID_DOC_TYPE:longint; D_FROM, D_TO:TDateTime): TJSONObject;
begin
  if FDELETE_IMPORT_DOC_POS_procCommand = nil then
  begin
    FDELETE_IMPORT_DOC_POS_procCommand := FDBXConnection.CreateCommand;
    FDELETE_IMPORT_DOC_POS_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDELETE_IMPORT_DOC_POS_procCommand.Text := 'TServerMethods1.DELETE_IMPORT_DOC_POS_proc';
    FDELETE_IMPORT_DOC_POS_procCommand.Prepare;
  end;
  FDELETE_IMPORT_DOC_POS_procCommand.Parameters[0].Value.SetInt32(ID_TRADE_POINT);
  FDELETE_IMPORT_DOC_POS_procCommand.Parameters[1].Value.SetInt32(ID_DOC_TYPE);
  FDELETE_IMPORT_DOC_POS_procCommand.Parameters[2].Value.AsDateTime := D_FROM;
  FDELETE_IMPORT_DOC_POS_procCommand.Parameters[3].Value.AsDateTime := D_TO;
  FDELETE_IMPORT_DOC_POS_procCommand.ExecuteUpdate;
  Result := TJSONObject(FDELETE_IMPORT_DOC_POS_procCommand.Parameters[4].Value.GetJSONValue(FInstanceOwner));
end;



function TServerMethods1Client.NaklEdit_proc(ID_NAKLCAP: Integer; S_reason_delete_edit: string): TJSONObject;
begin
  if FNaklEdit_procCommand = nil then
  begin
    FNaklEdit_procCommand := FDBXConnection.CreateCommand;
    FNaklEdit_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNaklEdit_procCommand.Text := 'TServerMethods1.NaklEdit_proc';
    FNaklEdit_procCommand.Prepare;
  end;
  FNaklEdit_procCommand.Parameters[0].Value.SetInt32(ID_NAKLCAP);
  FNaklEdit_procCommand.Parameters[1].Value.SetWideString(S_reason_delete_edit);
  FNaklEdit_procCommand.ExecuteUpdate;
  Result := TJSONObject(FNaklEdit_procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_AvtoNariad_proc(ID_DOC_TYPE: Integer; DFROM: TDateTime; DTO: TDateTime): TJSONObject;
begin
  if Fget_AvtoNariad_procCommand = nil then
  begin
    Fget_AvtoNariad_procCommand := FDBXConnection.CreateCommand;
    Fget_AvtoNariad_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_AvtoNariad_procCommand.Text := 'TServerMethods1.get_AvtoNariad_proc';
    Fget_AvtoNariad_procCommand.Prepare;
  end;
  Fget_AvtoNariad_procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  Fget_AvtoNariad_procCommand.Parameters[1].Value.AsDateTime := DFROM;
  Fget_AvtoNariad_procCommand.Parameters[2].Value.AsDateTime := DTO;
  Fget_AvtoNariad_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_AvtoNariad_procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.get_AvtoNariadEdit_proc(ID_DOC_TYPE: Integer; ID_AVTO_NARIAD: Integer): TJSONObject;
begin
  if Fget_AvtoNariadEdit_procCommand = nil then
  begin
    Fget_AvtoNariadEdit_procCommand := FDBXConnection.CreateCommand;
    Fget_AvtoNariadEdit_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_AvtoNariadEdit_procCommand.Text := 'TServerMethods1.get_AvtoNariadEdit_proc';
    Fget_AvtoNariadEdit_procCommand.Prepare;
  end;
  Fget_AvtoNariadEdit_procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  Fget_AvtoNariadEdit_procCommand.Parameters[1].Value.SetInt32(ID_AVTO_NARIAD);
  Fget_AvtoNariadEdit_procCommand.ExecuteUpdate;
  Result := TJSONObject(Fget_AvtoNariadEdit_procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.Edit_AvtoNariad_proc(ID_DOC_TYPE: Integer; ID_AVTO_NARIAD: Integer; N: string; Date_doc: TDateTime; ID_CLI_AVTO: Integer; ID_CLI_D: Integer; SCH_D: string; SCH_K: string; Probeg1: Double; Probeg2: Double; NormaProbegTmp: Double; Motochas1: Double; Motochas2: Double; NormaMotochasTmp: Double; Comment_Rabot: string; N_Topliva: Double; WORK_HOURS: Double; ID_DRIVER: Integer; S_reason_delete_edit: string): TJSONObject;
begin
  if FEdit_AvtoNariad_procCommand = nil then
  begin
    FEdit_AvtoNariad_procCommand := FDBXConnection.CreateCommand;
    FEdit_AvtoNariad_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEdit_AvtoNariad_procCommand.Text := 'TServerMethods1.Edit_AvtoNariad_proc';
    FEdit_AvtoNariad_procCommand.Prepare;
  end;
  FEdit_AvtoNariad_procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  FEdit_AvtoNariad_procCommand.Parameters[1].Value.SetInt32(ID_AVTO_NARIAD);
  FEdit_AvtoNariad_procCommand.Parameters[2].Value.SetWideString(N);
  FEdit_AvtoNariad_procCommand.Parameters[3].Value.AsDateTime := Date_doc;
  FEdit_AvtoNariad_procCommand.Parameters[4].Value.SetInt32(ID_CLI_AVTO);
  FEdit_AvtoNariad_procCommand.Parameters[5].Value.SetInt32(ID_CLI_D);
  FEdit_AvtoNariad_procCommand.Parameters[6].Value.SetWideString(SCH_D);
  FEdit_AvtoNariad_procCommand.Parameters[7].Value.SetWideString(SCH_K);
  FEdit_AvtoNariad_procCommand.Parameters[8].Value.SetDouble(Probeg1);
  FEdit_AvtoNariad_procCommand.Parameters[9].Value.SetDouble(Probeg2);
  FEdit_AvtoNariad_procCommand.Parameters[10].Value.SetDouble(NormaProbegTmp);
  FEdit_AvtoNariad_procCommand.Parameters[11].Value.SetDouble(Motochas1);
  FEdit_AvtoNariad_procCommand.Parameters[12].Value.SetDouble(Motochas2);
  FEdit_AvtoNariad_procCommand.Parameters[13].Value.SetDouble(NormaMotochasTmp);
  FEdit_AvtoNariad_procCommand.Parameters[14].Value.SetWideString(Comment_Rabot);
  FEdit_AvtoNariad_procCommand.Parameters[15].Value.SetDouble(N_Topliva);
  FEdit_AvtoNariad_procCommand.Parameters[16].Value.SetDouble(WORK_HOURS);
  FEdit_AvtoNariad_procCommand.Parameters[17].Value.SetInt32(ID_DRIVER);
  FEdit_AvtoNariad_procCommand.Parameters[18].Value.SetWideString(S_reason_delete_edit);
  FEdit_AvtoNariad_procCommand.ExecuteUpdate;
  Result := TJSONObject(FEdit_AvtoNariad_procCommand.Parameters[19].Value.GetJSONValue(FInstanceOwner));
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  Flogin_procCommand.DisposeOf;
  FUnLogin_procCommand.DisposeOf;
  Fget_user_procCommand.DisposeOf;
  Fget_Doc_Type_procCommand.DisposeOf;
  Fget_NaklCap_procCommand.DisposeOf;
  FNaklEdit_procCommand.DisposeOf;
  Fget_AvtoNariad_procCommand.DisposeOf;
  Fget_AvtoNariadEdit_procCommand.DisposeOf;
  FEdit_AvtoNariad_procCommand.DisposeOf;
  inherited;
end;

end.

