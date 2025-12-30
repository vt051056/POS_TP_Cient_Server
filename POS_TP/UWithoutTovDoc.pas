unit UWithoutTovDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Touch.Keyboard, Vcl.Buttons, Data.DB, Data.Win.ADODB;

type
  TFWithoutTovDoc = class(TForm)
    Panel1: TPanel;
    Panel13: TPanel;
    BB_NUM_LK: TBitBtn;
    TouchKeyboard1: TTouchKeyboard;
    Panel10: TPanel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DT_Date_doc: TDateTimePicker;
    DT_Time_doc: TDateTimePicker;
    EN: TEdit;
    E_TOT_SUM: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBoxCLI_SELECT: TGroupBox;
    ECLI_ContrAgent: TEdit;
    BBSel_CLI_ContrAgent: TBitBtn;
    Label_Client: TLabel;
    BBRecept_To_Resistr: TBitBtn;
    SP_SET_RRO_DATA_TO_NAKLCAP: TADOStoredProc;
    E_COMMENT: TComboBox;
    DTP_Day_Vyruchki: TDateTimePicker;
    Label4: TLabel;
    ADOCommandDeleteDoc: TADOCommand;
    procedure BB_NUM_LKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E_TOT_SUMExit(Sender: TObject);
    procedure E_TOT_SUMChange(Sender: TObject);
    procedure E_TOT_SUMKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BBSel_CLI_ContrAgentClick(Sender: TObject);
    procedure BBRecept_To_ResistrClick(Sender: TObject);
    procedure DTP_Day_VyruchkiChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_DOC_TYPE:integer;
    ID_NAKLCAP:longint;

    ID_CLIENT:longint;
    CLI_D:string;
    ID_KATEGOR_CLI_D:LongInt;
    ID_KATEGOR_CLI_K:LongInt;
    KATEGOR_D:string;
    KATEGOR_K:string;
    ID_CLI_K:longint;
    CLI_K:string;
    SCH_D,SCH_K:string;

    TIME_DEFAULT:TDateTime;

    ID_DOC_PROTOTYPE:longInt;   // документ прототип с которого берется информация

    TOT_SUM:extended;
    TouchKeyboard_Layout:string;
    SUM_BONUS_BALL, SDK_DOLG :extended;

    procedure SetDocInfo;
    procedure SetCaptionNakl;
    procedure SetControlElements;
    function SaveDoc:boolean;

    function LoadBonusCli(INN:string; var vSUM_BALL:extended; var vSDK:extended):boolean;
    // загрузка инфо о бонусной карте INN клиента
    procedure GetBonusCli(INN:string; v_ID_CLI:longint; var vSUM_BALL, vSDK:extended);
    procedure BBRecept_To_Resistr_visualization;
  end;

var
  FWithoutTovDoc: TFWithoutTovDoc;

  function  FWithoutTovDocDlg(v_id_doc_type:integer; var v_ID_NAKLCAP:longint; vID_DOC_PROTOTYPE:longInt):integer;


implementation

{$R *.dfm}

uses UDataModule1, myfuncs,  UMainForm, System.UITypes, USERS_F, CLIENT_F1, Login_form,
ClientClassesUnit1, System.JSON, UDataModule2, Print_Functions, DateUtils, StrUtils;

function  FWithoutTovDocDlg(v_id_doc_type:integer; var v_ID_NAKLCAP:longint; vID_DOC_PROTOTYPE:longInt):integer;
begin
 FWithoutTovDoc:=TFWithoutTovDoc.Create(Application);
 with FWithoutTovDoc do
 begin
  try
   ID_DOC_TYPE:=v_id_doc_type;
   ID_NAKLCAP:=v_ID_NAKLCAP;
   ID_DOC_PROTOTYPE:=vID_DOC_PROTOTYPE;
   SetDocInfo;
   Label_Client.Caption:='';
   result:=ShowModal;
   if result=mrOk then v_ID_NAKLCAP:=ID_NAKLCAP
   else v_ID_NAKLCAP:=-1;

  finally
   FreeAndNil(FWithoutTovDoc);
  end;
 end;
end;


function TFWithoutTovDoc.LoadBonusCli(INN:string; var vSUM_BALL:extended; var vSDK:extended):boolean;
var
server:TServerMethods1Client;
result_q: TJSONObject;
i:integer;
JPair: TJSONPair;
MemberName: string;
comment:string;
status_oper:integer;


begin
  result:=false;
  server:=TServerMethods1Client.Create(DataModule2.SQLConnection1.DBXConnection);

   result_q:=server.get_BonusCli_proc(INN);

   try
      {проходим по каждой паре}
        for i := 0 to result_q.Count-1 do
        begin
          JPair:=result_q.Pairs[i];//получили пару по её индексу
          MemberName:=JPair.JsonString.Value;//определили имя
          {ищем в какое свойство записывать значение}
          if MemberName='status_oper' then
            status_oper:=StrToInt(JPair.JsonValue.Value);
          if MemberName='comment' then
            comment:=JPair.JsonValue.Value;

          if MemberName='SUM_BALL' then
            vSUM_BALL:=StrToFloat(JPair.JsonValue.Value);

           if MemberName='SDK' then
            vSDK:=StrToFloat(JPair.JsonValue.Value);
         end;
        if status_oper<>0 then
        begin
          ;
        end
        else
        begin

          result:=true;
        end;
   except
      comment:='Ошибка разбора JSON';
      raise Exception.Create('Ошибка разбора JSON');

   end;

   FreeAndNil(server);
end;  // function LoadBonusCli:boolean;





// загрузка инфо о бонусной карте INN клиента
procedure TFWithoutTovDoc.GetBonusCli(INN:string; v_ID_CLI:longint; var vSUM_BALL, vSDK:extended);
var Save_Cursor:TCursor;
begin
 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
   F_main.RemoteDBConnect;// F_main.ActionConnectRemoteDBExecute(Self);


  if   F_main.is_connect_server then
  begin
    try
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;
        //загрузка инфо о бонусной карте INN клиента
      if not LoadBonusCli(INN, vSUM_BALL,vSDK) then
      begin
        vSUM_BALL:=0.0;

      end;


    finally
      Screen.Cursor := Save_Cursor;
      MessageDlg('Загрузка бонусов и долгов выполнена!', mtInformation, [mbOk], 0);



    end;

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
       F_main.ActionDisconnectRemoteDBExecute(Self);
  end;


end;    // procedure TFWithoutTovDoc.GetBonusCli(INN:string; var vSUM_BALL, vSUM_BALL_FOR_PAY:extended);

procedure TFWithoutTovDoc.BBRecept_To_Resistr_visualization;
var Bmp   : Vcl.Graphics.TBitmap;
begin
//  BBRecept_To_Resistr.Glyph.Assign(nil);
  Bmp:=TBitmap.Create;
  try
    Bmp.Width:=BBRecept_To_Resistr.Width;
    Bmp.Height:=BBRecept_To_Resistr.Height;
    Bmp.Canvas.Font.Assign(BBRecept_To_Resistr.Font);
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
    begin
      BBRecept_To_Resistr.Caption:='';//'Рег';
      Bmp.Canvas.Brush.Color:=clRed;
     // BBRecept_To_Resistr.Glyph.LoadFromResourceName(hInstance, 'red_button_16');
    end
    else
    begin
      BBRecept_To_Resistr.Caption:='';//'Не рег';
      Bmp.Canvas.Brush.Color:=clGreen;
    //  BBRecept_To_Resistr.Glyph.LoadFromResourceName(hInstance, 'blue_button_16');
    end;

     //по периметру квадрат другого цвета
      Bmp.Canvas.Pen.Color:=clBlack;
      Bmp.Canvas.Pen.Style:=psSolid;
     // Bmp.Canvas.Pen.Width:=1;
      Bmp.Canvas.Rectangle(1,1,Bmp.Width-1, Bmp.Height-1);
      Bmp.Canvas.Brush.Style:=bsSolid;
     Bmp.Canvas.FillRect(Rect(2,2,Bmp.Width-2,Bmp.Height-2));
      //выводим текст в середине
    {Bmp.Canvas.TextOut(
                       (Bmp.Width-Bmp.Canvas.TextWidth(BBRecept_To_Resistr.Caption)) div 2,
                                          (Bmp.Height-Bmp.Canvas.TextHeight(BBRecept_To_Resistr.Caption)) div 2,
                                                              BBRecept_To_Resistr.Caption);}


     BBRecept_To_Resistr.Glyph.Assign(Bmp);
  finally
    Bmp.Free;
  end;

end;



procedure TFWithoutTovDoc.BBRecept_To_ResistrClick(Sender: TObject);
begin
    F_main.IS_RECEPT_TO_REGISTR_RRO:=not F_main.IS_RECEPT_TO_REGISTR_RRO;
    F_main.BitBtn26.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
    F_main.BitBtn27.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
  //  F_main.BBKassaIn.Visible:= F_main.IS_RECEPT_TO_REGISTR_RRO;
  //  F_main.BBKassaOut.Visible:= F_main.IS_RECEPT_TO_REGISTR_RRO;
    BBRecept_To_Resistr_visualization;
    if ID_DOC_TYPE=290 then   //изъятие денег с кассы
    begin
      if MessageDlg('Расчитать кассовые итоги смены?', mtWarning, [mbNo, mbYes], 0)= mrYes then
      begin
        if F_main.IS_RECEPT_TO_REGISTR_RRO then
        begin
          F_Main.LastShiftTotals(False,False); // ostat_kassy_RRO
          E_TOT_SUM.Text:=FloatToStr(F_Main.ostat_kassy_RRO);
        end
        else
        begin

          with DM1.QKassaReport_RRO do
          begin
            Close;
            Parameters.ParamByName('ID_USER').Value:=id_user_select;
            Parameters.ParamByName('IS_REGISTER_RRO').Value:=0;
            Parameters.ParamByName('D_From').Value:=StartOfTheDay(F_main.D_Work.DateTime);
            Parameters.ParamByName('D_To').Value:=EndOfTheDay(F_main.D_Work.DateTime);
            Open;
            F_Main.ostat_kassy:=FieldByName('SUM_KAS').AsFloat;
            E_TOT_SUM.Text:=FloatToStr(F_Main.ostat_kassy);
            Close;
          end;

        end;
      end;
    end;
end;

procedure TFWithoutTovDoc.BBSel_CLI_ContrAgentClick(Sender: TObject);

begin
  if F_clientDlg_1(ID_KATEGOR_CLI_K,KATEGOR_K)=mrOk then
  begin
    case ID_DOC_TYPE of
      70:      // возврат долга от покупателя
      begin

        ID_CLI_K:= ID_client_select_1;
        CLI_K:=client_select_1;
        ECLI_ContrAgent.Text:=CLI_K;
        GetBonusCli(INN_client_select_1, ID_client_select_1, SUM_BONUS_BALL, SDK_DOLG);
        Label_Client.Caption:=Format('Долг - %.2f', [SDK_DOLG]);

      end;
    end;
  end;
end;

procedure TFWithoutTovDoc.BB_NUM_LKClick(Sender: TObject);
begin
  if TouchKeyboard_Layout='NumPad' then
  begin
    TouchKeyboard_Layout:='Standard';
    BB_NUM_LK.Caption:='1234...';
  end
  else
  begin
    TouchKeyboard_Layout:='NumPad';
    BB_NUM_LK.Caption:='АБВГ...';
  end;
  TouchKeyboard1.Layout:=TouchKeyboard_Layout;


end;

procedure TFWithoutTovDoc.DTP_Day_VyruchkiChange(Sender: TObject);
var s:string;
begin
  E_COMMENT.Text:=StuffString(E_COMMENT.Text, Length(E_COMMENT.Text)-9, 10, DateToStr(DTP_Day_Vyruchki.Date));
end;

procedure TFWithoutTovDoc.E_TOT_SUMChange(Sender: TObject);
begin
if Trim(E_TOT_SUM.Text)='' then
begin
  E_TOT_SUM.Text :='';
  TOT_SUM:=0.0;
  exit;
end;

try
  TOT_SUM:=StrToFloat(Trim(E_TOT_SUM.Text));
except
  MessageDlg('Сумма не число!', mtError,[mbOk], 0);
end;
end;

procedure TFWithoutTovDoc.E_TOT_SUMExit(Sender: TObject);
begin
try
  TOT_SUM:=StrToFloat(Trim(E_TOT_SUM.Text));
except
  MessageDlg('Сумма не число!', mtError,[mbOk], 0);
end;
end;

procedure TFWithoutTovDoc.E_TOT_SUMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key='.' then Key:=',';
  if Not (Key in ['0'..'9', #8,',',#45])then Key:=#0;
end;

procedure TFWithoutTovDoc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var Result_exit:integer;
  var sumInOut:extended;
NumFiscal,  NumLocal, OrderDateTime :string;
IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
begin

  if modalresult=mrOk then
  begin
    if not SaveDoc then
    begin
      CanClose :=false;
    end
    else
    begin  // док сохранен
    // проверить необходимость регистрации в налоговой
       if (ID_DOC_TYPE=289) then     // внесение в кассу
       begin
          if F_main.IS_RECEPT_TO_REGISTR_RRO then  // регистрировать
          begin
            IS_CAN_REGISTRED_RRO:=1;  // зарегистрировать в налоговой
            if F_main.RegisterKassa_In_Out_RRO(False, (ID_DOC_TYPE=289), ID_NAKLCAP, TOT_SUM, NumFiscal,  NumLocal, OrderDateTime) then
            begin
              IS_REGISTER_RRO:=1;
              if (F_main.SHOW_FISCAL_REP=1) then      // печатать чек
                Print_Kassa_In_Out_RRO(0, (ID_DOC_TYPE=289), TOT_SUM, NumFiscal,  NumLocal, OrderDateTime);
            end
            else
            begin
              IS_REGISTER_RRO:=0;
            end;
          end
          else   // не регистрировать
          begin
            IS_CAN_REGISTRED_RRO:=0;
            IS_REGISTER_RRO:=0;
          end;


           // сохранить данные о регистрации в документе
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP_PROTOTYPE']:=-1;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=IS_CAN_REGISTRED_RRO;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_REGISTER_RRO']:=IS_REGISTER_RRO;

          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_CLI_RRO']:= F_main.ID_CLI_FISCAL;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NUM_FISCAL_KASSA']:= F_main.ID_NUM_FISCAL_KASSA;

          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMLOCAL']:=NumLocal;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMFISCAL']:=NumFiscal;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ORDERDATETIME']:=OrderDateTime;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@QRCODE_REG']:='';

          SP_SET_RRO_DATA_TO_NAKLCAP.ExecProc;
          if SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ER']<>0  then
          begin
           MessageDlg('Ошибка при сохранении регистрации РРО!', mtError,  [mbOk], 0);
          end;

        end; //  if (ID_DOC_TYPE=289)

       if (ID_DOC_TYPE=290) then // изъятие из кассы
       begin
          if F_main.IS_RECEPT_TO_REGISTR_RRO then  // регистрировать
          begin
            IS_CAN_REGISTRED_RRO:=1;  // зарегистрировать в налоговой
            if F_main.RegisterKassa_In_Out_RRO(False, (ID_DOC_TYPE=289), ID_NAKLCAP, F_Main.ostat_kassy_RRO, NumFiscal,  NumLocal, OrderDateTime) then
            begin
              IS_REGISTER_RRO:=1;
              if (F_main.SHOW_FISCAL_REP=1) then      // печатать чек
                Print_Kassa_In_Out_RRO(0, (ID_DOC_TYPE=289), F_Main.ostat_kassy_RRO, NumFiscal,  NumLocal, OrderDateTime);
            end
            else
            begin
              IS_REGISTER_RRO:=0;
            end;
          end
          else   // не регистрировать
          begin
            IS_CAN_REGISTRED_RRO:=0;
            IS_REGISTER_RRO:=0;
          end;


           // сохранить данные о регистрации в документе
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP_PROTOTYPE']:=-1;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=IS_CAN_REGISTRED_RRO;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_REGISTER_RRO']:=IS_REGISTER_RRO;

          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_CLI_RRO']:= F_main.ID_CLI_FISCAL;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NUM_FISCAL_KASSA']:= F_main.ID_NUM_FISCAL_KASSA;


          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMLOCAL']:=NumLocal;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMFISCAL']:=NumFiscal;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ORDERDATETIME']:=OrderDateTime;
          SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@QRCODE_REG']:='';


          SP_SET_RRO_DATA_TO_NAKLCAP.ExecProc;
          if SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ER']<>0  then
          begin
           MessageDlg('Ошибка при сохранении регистрации РРО!', mtError,  [mbOk], 0);
          end;

        end; // if (ID_DOC_TYPE=290) then // изъятие из кассы

       end;  // else if not SaveDoc then

  end   //if modalresult=mrOk then
  else
  begin
    Result_exit:=
    MessageDlg(' Документ не сохранен! Продолжить изменение документа и дальнейшее сохранение его?',
      mtConfirmation, [mbNo, mbYes ], 0);
    if (Result_exit = mrYes) or (Result_exit = mrCancel) then
    begin
      CanClose:=False;
      Exit;
    end;
  end;

end;

procedure TFWithoutTovDoc.FormCreate(Sender: TObject);
begin
  TouchKeyboard_Layout:='NumPad';
  BB_NUM_LK.Caption:='АБВГ...';
  TouchKeyboard1.Layout:=TouchKeyboard_Layout;
  E_TOT_SUM.Text :='';
  TOT_SUM:=0.0;
  E_COMMENT.Text:='';
  E_COMMENT.ItemIndex:=0;
  DTP_Day_Vyruchki.Date:= F_main.D_Work.Date;

end;

procedure TFWithoutTovDoc.FormShow(Sender: TObject);
begin
  SetCaptionNakl;
  SetControlElements;
end;

procedure TFWithoutTovDoc.SetDocInfo;
var n:integer;
begin
  DM1.QDocType_info.Close;
  DM1.QDocType_info.Parameters.ParamByName('ID_DT').Value:=ID_DOC_TYPE;
  DM1.QDocType_info.Open;
  Caption:=DM1.QDocType_info.FieldByName('NAMEDOC').AsString;
  ID_CLIENT:=F_main.ID_TRADE_POINT;
  CLI_D:=F_main.NAME_TRADE_POINT;
  ID_KATEGOR_CLI_D:=DM1.QDocType_info.FieldByName('ID_KATEG_CLI').AsInteger;
  KATEGOR_D:=DM1.QDocType_info.FieldByName('KATEGOR').AsString;
  if ID_DOC_TYPE =70 then // возврат долга от покупателя
  begin
   ID_CLI_K:=DM1.QDocType_info.FieldByName('ID_CLI_K').AsInteger;
   CLI_K:=DM1.QDocType_info.FieldByName('CLI_K').AsString;
   ECLI_ContrAgent.Text:=CLI_K;
  end
  else
  begin
  ID_CLI_K:=F_main.ID_TRADE_POINT;
  CLI_K:=F_main.NAME_TRADE_POINT;
  end;

  ID_KATEGOR_CLI_K:=DM1.QDocType_info.FieldByName('ID_KATEG_CLI_K').AsInteger;
  KATEGOR_K:=DM1.QDocType_info.FieldByName('KATEGOR_K').AsString;
  SCH_D:= DM1.QDocType_info.FieldByName('ID_SCH_D').AsString;
  SCH_K:=DM1.QDocType_info.FieldByName('ID_SCH_K').AsString;
  TIME_DEFAULT:=DM1.QDocType_info.FieldByName('TIME_DEFAULT').AsFloat;

  DT_Date_doc.DateTime:=F_main.D_Work.DateTime;
  DT_Time_doc.Time:=DM1.QDocType_info.FieldByName('TIME_DEFAULT').AsFloat;
  DT_Date_doc.Time:= DT_Time_doc.Time;

  DM1.QDocType_info.Close;

  if ID_NAKLCAP=Unknown_code then
    if F_main.get_nums_doc(ID_DOC_TYPE,n)=0 then EN.Text:=IntToStr(n);



end;

procedure TFWithoutTovDoc.SetCaptionNakl;
begin
if ID_NAKLCAP<>Unknown_code then
  with  dm1.QNaklCapInfo  do
  begin
    Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    dm1.QNaklCapInfo.Open;
    DT_Date_doc.DateTime:=FieldByName('D').AsFloat;
    EN.Text:=FieldByName('NN').AsString;
    ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
    ID_CLIENT:=FieldByName('ID_CLIENT').AsInteger;
    CLI_D:=FieldByName('CLIENT').AsString;
    ID_CLI_K:=FieldByName('ID_CLI_K').AsInteger;
    CLI_K:=FieldByName('CLI_K').AsString;
    ECLI_ContrAgent.Text:=CLI_K;

    SCH_D:=FieldByName('SCH_D').AsString;
    SCH_K:=FieldByName('SCH_K').AsString;

    ID_KATEGOR_CLI_D:=FieldByName('ID_KATEGOR').AsInteger;
    KATEGOR_D:=FieldByName('KATEGOR').AsString;
    ID_KATEGOR_CLI_K:=FieldByName('ID_KATEGOR_K').AsInteger;
    KATEGOR_K:=FieldByName('KATEGOR_K').AsString;

    TOT_SUM:=FieldByName('TOT_SUM').AsFloat;
    E_TOT_SUM.Text:=Format('%.2f',[TOT_SUM]);
    E_COMMENT.Text:=FieldByName('ZATRNAME').AsString;

    SetControlElements;
    Close;
  end;

end;


procedure TFWithoutTovDoc.SetControlElements;
begin

  case ID_DOC_TYPE of
    224:    // инвентаризация кассы
      begin
       Label2.Caption:='Сумма в кассе';
       E_COMMENT.Visible:=False;
       E_COMMENT.Items.Add('Наличие денег в кассе');
       Label3.Visible:=False;
       GroupBoxCLI_SELECT.Visible:=False;
       BBRecept_To_Resistr.Visible:=False;
       DTP_Day_Vyruchki.Visible:=False;
       Label4.Visible:= DTP_Day_Vyruchki.Visible;
      end;
    221:    //а001 POS Передача выручки с ТС на НМК
      begin
       Label2.Caption:='Сумма передаваемой выручки';
       E_COMMENT.Visible:=True;
       E_COMMENT.Items.Add('Выручка, полученная за '+DateToStr(DTP_Day_Vyruchki.Date));
       E_COMMENT.ItemIndex:=0;
       Label3.Visible:=True;
       GroupBoxCLI_SELECT.Visible:=False;
       BBRecept_To_Resistr.Visible:=False;
       DTP_Day_Vyruchki.Visible:=True;
       Label4.Visible:= DTP_Day_Vyruchki.Visible;
      end;
    222:    //а002 POS Расход с кассы ТС на затраты
      begin
       Label2.Caption:='Сумма затрат';
       E_COMMENT.Visible:=true;
       E_COMMENT.Items.Add('Моющие');
       E_COMMENT.Items.Add('Хоз.нужды');
       E_COMMENT.Items.Add('Лаборатория');
       E_COMMENT.Items.Add('Дегустация');
       Label3.Visible:=true;
       GroupBoxCLI_SELECT.Visible:=False;
       BBRecept_To_Resistr.Visible:=False;
       DTP_Day_Vyruchki.Visible:=False;
       Label4.Visible:= DTP_Day_Vyruchki.Visible;
      end;

    70:         // возврат долга от покупателя
       begin
       Label2.Caption:='Сумма возврата долга';
       E_COMMENT.Visible:=True;
       E_COMMENT.Items.Add('Возврат долга');
       Label3.Visible:=True;
       GroupBoxCLI_SELECT.Visible:=True;
       BBRecept_To_Resistr.Visible:=False;
       DTP_Day_Vyruchki.Visible:=False;
       Label4.Visible:= DTP_Day_Vyruchki.Visible;
      end;
     289:         //  Внесение денег в кассу
       begin
       Label2.Caption:='Сумма внесения денег в кассу';
       E_COMMENT.Visible:=False;
       E_COMMENT.Items.Add('Внесение денег в кассу');
       Label3.Visible:=false;
       GroupBoxCLI_SELECT.Visible:=False;
       BBRecept_To_Resistr.Visible:=False;
       BBRecept_To_Resistr_visualization;
       DTP_Day_Vyruchki.Visible:=False;
       Label4.Visible:= DTP_Day_Vyruchki.Visible;
      end;
      290:         //  Изъятие денег из кассы
       begin
         Label2.Caption:='Сумма изъятия денег из кассы';
         E_COMMENT.Visible:=False;
         E_COMMENT.Items.Add('Изъятие денег из кассы');
         Label3.Visible:=false;
         GroupBoxCLI_SELECT.Visible:=False;
         BBRecept_To_Resistr.Visible:=False;
         BBRecept_To_Resistr_visualization;
         DTP_Day_Vyruchki.Visible:=False;
         Label4.Visible:= DTP_Day_Vyruchki.Visible;
         if MessageDlg('Расчитать кассовые итоги смены?', mtWarning, [mbNo, mbYes], 0)= mrYes then
         begin
          (*
          if F_main.IS_RECEPT_TO_REGISTR_RRO then
          begin
            F_Main.LastShiftTotals(False,False); // ostat_kassy_RRO
            E_TOT_SUM.Text:=FloatToStr(F_Main.ostat_kassy_RRO);
          end
          else
          begin

            with DM1.QKassaReport_RRO do
            begin
              Close;
              Parameters.ParamByName('ID_USER').Value:=id_user_select;
              Parameters.ParamByName('IS_REGISTER_RRO').Value:=0;
              Parameters.ParamByName('D_From').Value:=StartOfTheDay(F_main.D_Work.DateTime);
              Parameters.ParamByName('D_To').Value:=EndOfTheDay(F_main.D_Work.DateTime);
              Open;
              F_Main.ostat_kassy:=FieldByName('SUM_KAS').AsFloat;
              E_TOT_SUM.Text:=FloatToStr(F_Main.ostat_kassy);
              Close;
            end;

          end;
           *)
           // вместо закомментированного блока стал расчет общей кассы
          // документ будет делаться только на фиск часть
            F_Main.LastShiftTotals(False,False); // здесь определяется ostat_kassy_RRO - остаток фиск кассы текущей открытой смены
            with DM1.QKassaReport_RRO do    // здесь опред остаток нефиск кассы за весь текущий день
            begin
              Close;
              Parameters.ParamByName('ID_USER').Value:=id_user_select;
              Parameters.ParamByName('IS_REGISTER_RRO').Value:=0;
              Parameters.ParamByName('D_From').Value:=StartOfTheDay(F_main.D_Work.DateTime);
              Parameters.ParamByName('D_To').Value:=EndOfTheDay(F_main.D_Work.DateTime);
              Open;
              F_Main.ostat_kassy:=FieldByName('SUM_KAS').AsFloat;
              Close;
            end;
            E_TOT_SUM.Text:=FloatToStr(F_Main.ostat_kassy+F_Main.ostat_kassy_RRO);
          end;



       end;
  end;


end;



function TFWithoutTovDoc.SaveDoc:boolean;
begin
Result:=false;
if TOT_SUM>eps then
begin


   if ID_DOC_TYPE=290   then  // изъятие денег из кассы
   begin
    // F_Main.ostat_kassy+F_Main.ostat_kassy_RRO

    if F_Main.ostat_kassy>eps then  // остаток нефиск кассы
    begin
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=ID_NAKLCAP;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@D']:=DT_Date_doc.DateTime;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NN']:=EN.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLIENT']:=ID_CLIENT;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CHEREZ']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@DOVER']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@FORMOPL']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANSP']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TARA']:=0.0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PLUS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MINUS']:=0.0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATRNAME']:=E_COMMENT.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATR']:=F_Main.ostat_kassy;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PRICE_KATEG']:=2;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_PRICE_WITHOUT_NDS']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_SUPPLYER']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_SUM']:=F_Main.ostat_kassy;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_NUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_TARA']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_K']:=ID_CLI_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_D']:=SCH_D;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_K']:=SCH_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@STAVKA_NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_DELETE']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_NACENKA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USLUGI']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_BONUS']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_CARD']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_POLUCH']:=0; // сумма покупателя наличными
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_COMMENT']:='';

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_OLD']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_CALC']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_NEW']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ROUND_SUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI_TO_CARD']:= 0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_RRO']:= -1;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_FINAL']:= 1;

      dm1.SP_SAVE_NAKL.ExecProc;
      if dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER']<>0 then
      begin
        MessageDlg('Ошибка при сохранении нового документа!'+
        dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER_COMMENT'], mtError,
            [mbOk], 0);

        Result:=false;
        exit;
      end
      else
      begin
        ID_NAKLCAP:=dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
        Result:=true;
      end;

   // не регистрировать
      F_main.IS_RECEPT_TO_REGISTR_RRO:=False;


    end;   //  if F_Main.ostat_kassy>eps then  // остаток нефиск кассы


    if F_Main.ostat_kassy_RRO>eps then  // остаток фиск кассы
    begin
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=-1;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@D']:=DT_Date_doc.DateTime;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NN']:=EN.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLIENT']:=ID_CLIENT;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CHEREZ']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@DOVER']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@FORMOPL']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANSP']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TARA']:=0.0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PLUS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MINUS']:=0.0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATRNAME']:=E_COMMENT.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATR']:=F_Main.ostat_kassy_RRO;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PRICE_KATEG']:=2;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_PRICE_WITHOUT_NDS']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_SUPPLYER']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_SUM']:=F_Main.ostat_kassy_RRO;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_NUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_TARA']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_K']:=ID_CLI_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_D']:=SCH_D;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_K']:=SCH_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@STAVKA_NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_DELETE']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_NACENKA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USLUGI']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_BONUS']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_CARD']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_POLUCH']:=0; // сумма покупателя наличными
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_COMMENT']:='';

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_OLD']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_CALC']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_NEW']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ROUND_SUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI_TO_CARD']:= 0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_RRO']:= -1;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_FINAL']:= 1;


      dm1.SP_SAVE_NAKL.ExecProc;
      if dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER']<>0 then
      begin
        MessageDlg('Ошибка при сохранении нового документа!'+
        dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER_COMMENT'], mtError,
            [mbOk], 0);

        Result:=false;
        exit;
      end
      else
      begin
        ID_NAKLCAP:=dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
        Result:=true;
      end;
      F_main.IS_RECEPT_TO_REGISTR_RRO:=True;




    end;   //  if F_Main.ostat_kassy_RRO>eps then  // остаток фиск кассы


   end  // if ID_DOC_TYPE=290   then  // изъятие денег из кассы
   else
   begin
      // сохранить док как новый
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=-1;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@D']:=DT_Date_doc.DateTime;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NN']:=EN.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLIENT']:=ID_CLIENT;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CHEREZ']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@DOVER']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@FORMOPL']:='';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANSP']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TARA']:=0.0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PLUS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MINUS']:=0.0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATRNAME']:=E_COMMENT.Text;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATR']:=TOT_SUM;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PRICE_KATEG']:=2;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_PRICE_WITHOUT_NDS']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_SUPPLYER']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_SUM']:=TOT_SUM;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_NUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_TARA']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_K']:=ID_CLI_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_D']:=SCH_D;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_K']:=SCH_K;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@STAVKA_NDS']:=0.0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_DELETE']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_NACENKA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USLUGI']:=Unknown_code;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_BONUS']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_OPL_CARD']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_POLUCH']:=0; // сумма покупателя наличными
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI']:=0;


      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_SKIDKA_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_KOLBASA']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_MYASO']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MIN_TNP']:=0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SKIDKA_COMMENT']:='';

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_OLD']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_CALC']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@BONUS_NEW']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ROUND_SUM']:=0;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_NOT_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CARD_NN_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANS_CODE_FISCAL']:= '';
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SUM_SDACHI_TO_CARD']:= 0;

      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_RRO']:= -1;
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_FINAL']:= 1;
      dm1.SP_SAVE_NAKL.ExecProc;
      if dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER']<>0 then
      begin
        MessageDlg('Ошибка при сохранении нового документа!'+
        dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER_COMMENT'], mtError,
          [mbOk], 0);

        Result:=false;
      end
      else
      begin
          // удалить этот ID_NAKLCAP редактируемый оригинал  документа
        if ID_NAKLCAP<>-1 then
        begin
          ADOCommandDeleteDoc.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
          ADOCommandDeleteDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
          ADOCommandDeleteDoc.Execute;
        end;

        ID_NAKLCAP:=dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
        Result:=true;
      end;

   end;   // else // if ID_DOC_TYPE=290   then  // изъятие денег из кассы


end;  // if TOT_SUM>eps then


end;  // function TF_SaleDoc.SaveDoc:boolean;


end.
