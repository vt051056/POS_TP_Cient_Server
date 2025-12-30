// 
// Created by the DataSnap proxy generator.
// 19.07.2013 14:09:50
// 

unit UServerMethod1Client;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy,
System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders,
Data.DBXCDSReaders, Data.DBXJSONReflect, System.JSON;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    Flogin_procCommand: TDBXCommand;
    FGet_user_procCommand: TDBXCommand;
    procCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function login_proc(login: string; passw: string): TJSONObject;
    function get_user_proc: TJSONObject;
    function UnLogin_proc: TJSONObject;
    function get_Kateg_Cli_proc: TJSONObject;
    function get_Clients_proc: TJSONObject;
    function get_Doc_Type_proc(ID_CHAR_DOC:integer): TJSONObject;
    function get_NaklCap_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
    function NaklEdit_proc(ID_NAKLCAP:integer; S_reason_delete_edit: string): TJSONObject;
     // получение инфо о нарядах за период  DFROM, DTO
    function get_AvtoNariad_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
    // получение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
    function get_AvtoNariadEdit_proc(ID_DOC_TYPE:integer; ID_AVTO_NARIAD:integer): TJSONObject;
    // изменение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
    function Edit_AvtoNariad_proc(ID_DOC_TYPE,ID_AVTO_NARIAD:integer;
    N:string; Date_doc:TDateTime; ID_CLI_AVTO, ID_CLI_D:integer; SCH_D, SCH_K:string;
    Probeg1, Probeg2, NormaProbegTmp, Motochas1, Motochas2, NormaMotochasTmp:double;
    Comment_Rabot:string; N_Topliva, WORK_HOURS:double; ID_DRIVER:integer;
    S_reason_delete_edit:string): TJSONObject;
    function get_RepOtgruzTov1_proc(ID_CLI:integer; DFROM, DTO:TDateTime): TJSONObject;



  end;

implementation


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
  FreeAndNil(Flogin_procCommand);
  FreeAndNil(FGet_user_procCommand);
  if procCommand <> nil then   FreeAndNil(procCommand);
  inherited;
end;

//  соединение с БД
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

function TServerMethods1Client.get_user_proc: TJSONObject;
begin
  if FGet_user_procCommand = nil then
  begin
    FGet_user_procCommand := FDBXConnection.CreateCommand;
    FGet_user_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGet_user_procCommand.Text := 'TServerMethods1.get_user_proc';
    FGet_user_procCommand.Prepare;
  end;
  FGet_user_procCommand.ExecuteUpdate;
  Result := TJSONObject(FGet_user_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

// отсоединение то БД
function TServerMethods1Client.UnLogin_proc: TJSONObject;
begin
  if FGet_user_procCommand = nil then
  begin
    FGet_user_procCommand := FDBXConnection.CreateCommand;
    FGet_user_procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGet_user_procCommand.Text := 'TServerMethods1.UnLogin_proc';
    FGet_user_procCommand.Prepare;
  end;
  FGet_user_procCommand.ExecuteUpdate;
  Result := TJSONObject(FGet_user_procCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


// получение таблицы категорий контрагентов KATEG_CLI
function TServerMethods1Client.get_Kateg_Cli_proc: TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_Kateg_Cli_proc';
  procCommand.Prepare;

  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));

end;


// получение таблицы  контрагентов CLIENTS
function TServerMethods1Client.get_Clients_proc: TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_Clients_proc';
  procCommand.Prepare;

  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));

end;

// получение таблицы типов документов  с характером ID_CHAR_DOC
function TServerMethods1Client.get_Doc_Type_proc(ID_CHAR_DOC:integer): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_Doc_Type_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_CHAR_DOC);
  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));

end;



// получение таблицы документов  с типом ID_DOC_TYPE, за период с DFROM по DTO
function TServerMethods1Client.get_NaklCap_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_NaklCap_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  procCommand.Parameters[1].Value.AsDateTime:=DFROM;
  procCommand.Parameters[2].Value.AsDateTime:=DTO;
  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));

end;





 // выполнение действий, связанных с редактированием документа с кодом ID_NAKLCAP
// получение таблицы товаров этого документа и информации о шапке с другими данными
function TServerMethods1Client.NaklEdit_proc(ID_NAKLCAP:integer; S_reason_delete_edit: string): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.NaklEdit_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_NAKLCAP);
  procCommand.Parameters[1].Value.AsString:=S_reason_delete_edit;

  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));

end;


// получение таблицы документов  с типом ID_DOC_TYPE, за период с DFROM по DTO
function TServerMethods1Client.get_AvtoNariad_proc(ID_DOC_TYPE:integer; DFROM, DTO:TDateTime): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_AvtoNariad_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  procCommand.Parameters[1].Value.AsDateTime:=DFROM;
  procCommand.Parameters[2].Value.AsDateTime:=DTO;
  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));

end;



// получение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
function TServerMethods1Client.get_AvtoNariadEdit_proc(ID_DOC_TYPE:integer; ID_AVTO_NARIAD:integer): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_AvtoNariadEdit_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  procCommand.Parameters[1].Value.SetInt32(ID_AVTO_NARIAD);
  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));

end;

// изменение инфо о наряде ID_AVTO_NARIAD  ID_CHAR_DOC_select=9  с типом ID_DOC_TYPE
function TServerMethods1Client.Edit_AvtoNariad_proc(ID_DOC_TYPE,ID_AVTO_NARIAD:integer;
    N:string; Date_doc:TDateTime; ID_CLI_AVTO, ID_CLI_D:integer; SCH_D, SCH_K:string;
    Probeg1, Probeg2, NormaProbegTmp, Motochas1, Motochas2, NormaMotochasTmp:double;
    Comment_Rabot:string; N_Topliva, WORK_HOURS:double; ID_DRIVER:integer;
    S_reason_delete_edit:string): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;

    procCommand.Text := 'TServerMethods1.Edit_AvtoNariad_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_DOC_TYPE);
  procCommand.Parameters[1].Value.SetInt32(ID_AVTO_NARIAD);

  procCommand.Parameters[2].Value.AsString:=N;
  procCommand.Parameters[3].Value.AsDateTime:=Date_doc;

  procCommand.Parameters[4].Value.SetInt32(ID_CLI_AVTO);
  procCommand.Parameters[5].Value.SetInt32(ID_CLI_D);

  procCommand.Parameters[6].Value.AsString:=SCH_D;
  procCommand.Parameters[7].Value.AsString:=SCH_K;

  procCommand.Parameters[8].Value.AsDouble:=Probeg1;

  procCommand.Parameters[9].Value.AsDouble:=Probeg2;

  procCommand.Parameters[10].Value.AsDouble:=NormaProbegTmp;
  procCommand.Parameters[11].Value.AsDouble:=Motochas1;
  procCommand.Parameters[12].Value.AsDouble:=Motochas1;
  procCommand.Parameters[13].Value.AsDouble:=NormaMotochasTmp;
  procCommand.Parameters[14].Value.AsString:=Comment_Rabot;
  procCommand.Parameters[15].Value.AsDouble:=N_Topliva;
  procCommand.Parameters[16].Value.AsDouble:=WORK_HOURS;
  procCommand.Parameters[17].Value.SetInt32(ID_DRIVER);
  procCommand.Parameters[18].Value.AsString:=S_reason_delete_edit;

  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[19].Value.GetJSONValue(FInstanceOwner));

end;

// получение данных отчета реализация клиету  с типом ID_CLI, за период с DFROM по DTO
function TServerMethods1Client.get_RepOtgruzTov1_proc(ID_CLI:integer; DFROM, DTO:TDateTime): TJSONObject;
begin
  if procCommand <> nil then   FreeAndNil(procCommand);

  procCommand := FDBXConnection.CreateCommand;
  procCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  procCommand.Text := 'TServerMethods1.get_RepOtgruzTov1_proc';
  procCommand.Prepare;

  procCommand.Parameters[0].Value.SetInt32(ID_CLI);
  procCommand.Parameters[1].Value.AsDateTime:=DFROM;
  procCommand.Parameters[2].Value.AsDateTime:=DTO;

  procCommand.ExecuteUpdate;
  Result := TJSONObject(procCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));

end;




end.
