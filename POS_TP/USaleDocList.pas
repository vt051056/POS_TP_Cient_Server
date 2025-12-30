unit USaleDocList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, IniFiles, DB, System.UITypes,
  Data.Win.ADODB;

type
  TFSaleDocList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BBDelDoc: TBitBtn;
    BBAddDoc: TBitBtn;
    BBEditDoc: TBitBtn;
    BBClose: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    D_To: TDateTimePicker;
    CBISDEL: TCheckBox;
    D_From: TDateTimePicker;
    BBRefresh: TBitBtn;
    BBRestore: TBitBtn;
    BBSetting: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BBUnsetTransmit: TBitBtn;
    BBDocReport: TBitBtn;
    BBSelectAll: TBitBtn;
    BBUnSelectAll: TBitBtn;
    BB_Union_Invent: TBitBtn;
    BB_Load_Doc: TBitBtn;
    BB_Send_Sverka: TBitBtn;
    Q_SVERKA_DOC_For_Export: TADOQuery;
    ShapePRRO: TShape;
    RG_Show: TRadioGroup;
    QControlNotFinalDoc: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBSettingClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BBAddDocClick(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure BBDelDocClick(Sender: TObject);
    procedure BBRestoreClick(Sender: TObject);
    procedure BBFixProvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure D_FromChange(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BBEditDocClick(Sender: TObject);
    procedure CBISDELClick(Sender: TObject);
    procedure BBUnsetTransmitClick(Sender: TObject);
    procedure BBDocReportClick(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure BBUnSelectAllClick(Sender: TObject);
    procedure BB_Union_InventClick(Sender: TObject);
    procedure BB_Load_DocClick(Sender: TObject);
    procedure BB_Send_SverkaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RG_ShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_doclisttype:longint;
    ID_CHAR_DOC:longint;

    v_ID_NAKLCAP:longint;
    CarentFieldSeach:string;
    name_ini_File : string;
    iniFile:TIniFile;
    CTRLBooleanViewNalogDoc:integer;
    search_id_naklcap:longint;
    procedure ReopenQ;
    procedure FoundNakl(v_ID_NAKLCAP:longint);
    function FixProv:integer;
    // импорт признака сверки в учетную БД
    procedure UpLoadSverkaDocForExport;

  end;

var
  FSaleDocList: TFSaleDocList;
  function FSaleDocList_dlg(v_id_doclisttype:integer; v_search_id_naklcap:longint):integer;

implementation
uses UDataModule1, UMainForm, myfuncs, Reason_del, users_f, USaleDoc, UDocList,
UWithoutTovDoc, DocReport, Print_Functions, Login_form, UDataModule2;
{$R *.dfm}


function FSaleDocList_dlg(v_id_doclisttype:integer; v_search_id_naklcap:longint):integer;
begin
 FSaleDocList:=TFSaleDocList.Create(Application);
 with FSaleDocList do
 begin
  try
    id_doclisttype:=v_id_doclisttype;
    search_id_naklcap:=v_search_id_naklcap;
    DM1.QDocType_info.Close;
    DM1.QDocType_info.Parameters.ParamByName('ID_DT').Value:=id_doclisttype;
    DM1.QDocType_info.Open;
    Caption:=DM1.QDocType_info.FieldByName('NAMEDOC').AsString;
    ID_CHAR_DOC:=DM1.QDocType_info.FieldByName('ID_CHAR_DOC').AsInteger;
    DM1.QDocType_info.Close;
    
    result:=ShowModal;
  finally
   FreeAndNil(FSaleDocList);
  end;
 end;
end;



procedure TFSaleDocList.ReopenQ;
begin
 DM1.ADS_SaleDocList.Close;
 DM1.ADS_SaleDocList.Parameters.ParamByName('IDDT').Value:=id_doclisttype;
 if CBISDEL.Checked then DM1.ADS_SaleDocList.Parameters.ParamByName('ISDEL').Value :=1
 else DM1.ADS_SaleDocList.Parameters.ParamByName('ISDEL').Value :=0;
 DM1.ADS_SaleDocList.Parameters.ParamByName('DFROM').Value :=D_from.Date;
 DM1.ADS_SaleDocList.Parameters.ParamByName('DTO').Value :=D_To.Date;
 DM1.ADS_SaleDocList.Parameters.ParamByName('ID_USER').Value :=ID_user_select;
 DM1.ADS_SaleDocList.Parameters.ParamByName('SHOW_ALL').Value :=RG_Show.ItemIndex;
 DM1.ADS_SaleDocList.Open;
  // продажи, возвраты покуп, внесение в кассу, изъятие из кассы
 if (id_doclisttype=200) or (id_doclisttype=204) or (id_doclisttype=289) or (id_doclisttype=290) then   // продажи
 begin

  if F_main.IS_RECEPT_TO_REGISTR_RRO then
  begin
 //   DM1.ADS_SaleDocList.Filtered:=True;
 //   DM1.ADS_SaleDocList.Filter:= '(IS_REGISTER_RRO=1 or IS_CAN_REGISTRED_RRO=1)';
    ShapePRRO.Brush.Color:=clRed;
    F_main.ShapePRRO.Brush.Color:=clRed;
    F_main.PRRO_ON_OFF.Caption:='ПРРО - режим вкл';
  end
  else
  begin
  //  DM1.ADS_SaleDocList.Filtered:=False;
  //  DM1.ADS_SaleDocList.Filter:= '';
    ShapePRRO.Brush.Color:=clGreen;
    F_main.ShapePRRO.Brush.Color:=clGreen;
    F_main.PRRO_ON_OFF.Caption:='ПРРО - режим выкл';

  end;


    F_main.BitBtn26.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
    F_main.BitBtn27.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
 end
 else
 begin
  if F_main.IS_RECEPT_TO_REGISTR_RRO then F_main.PRRO_ON_OFFClick(Owner);

    DM1.ADS_SaleDocList.Filtered:=False;
    DM1.ADS_SaleDocList.Filter:= '';
    ShapePRRO.Brush.Color:=clGreen;
    F_main.ShapePRRO.Brush.Color:=clGreen;
    F_main.PRRO_ON_OFF.Caption:='ПРРО - режим выкл';
 end;


end;

procedure TFSaleDocList.RG_ShowClick(Sender: TObject);
begin
  BBRefreshClick(Sender);
  BB_Union_Invent.Enabled:= (RG_Show.ItemIndex=1);
end;

procedure TFSaleDocList.FoundNakl(v_ID_NAKLCAP:longint);
begin
with DM1.ADS_SaleDocList do
begin
 DisableControls;

 ReopenQ;
 if (v_ID_NAKLCAP<>-1) then
 begin
    try
      locate('ID_NAKLCAP', v_ID_NAKLCAP, [loCaseInsensitive]);
    except
      First;
    end;
 end;

 EnableControls;
end;
end;


procedure TFSaleDocList.BBAddDocClick(Sender: TObject);
var vID_DOC_PROTOTYPE:longInt;
v_ID_NAKLCAP_Not_Final:longint;
v_TOT_SUM_Not_Final:extended;
v_TOT_NUM_Not_Final:extended;

begin
// проверка на наличие незавершенных документов типа  id_doclisttype
  v_ID_NAKLCAP_Not_Final:=-1;
  with QControlNotFinalDoc do
  begin
    Close;
    Parameters.ParamByName('d_from').Value:=D_From.DateTime;
    Parameters.ParamByName('d_to').Value:=D_To.DateTime;
    Parameters.ParamByName('ID_DOC_TYPE').Value:=id_doclisttype;
    Parameters.ParamByName('ID_USER').Value:=id_user_select;
    Open;
    First;
    if RecordCount>0 then
    begin
      v_ID_NAKLCAP_Not_Final:=FieldByName('ID_NAKLCAP').AsInteger;
      v_TOT_SUM_Not_Final:=FieldByName('TOT_SUM').AsFloat;
      v_TOT_NUM_Not_Final:=FieldByName('TOT_NUM').AsFloat;
    end;
    Close;
  end;

  if v_ID_NAKLCAP_Not_Final<>-1 then
  begin
    MessageDlg(
      Format('Есть незавершенный документ на сумму %.2f и кол-во %.2f.',
        [v_TOT_SUM_Not_Final, v_TOT_NUM_Not_Final]), mtError, [mbOk], 0);
    begin
      FoundNakl(v_ID_NAKLCAP_Not_Final);
      if F_DocReportDlg(v_ID_NAKLCAP_Not_Final)=mrOk then
      begin
        BBEditDocClick(Sender);
        exit;
      end;
    end;

  end;


  if (id_doclisttype=206) and (DM1.ADS_SaleDocList.FieldByName('IS_SVERENO').AsInteger=1) then // инвентаризация
  begin
    MessageDlg(Format('Инвентаризация сверена - %s; Добавлять нельзя!',
      [DM1.ADS_SaleDocList.FieldByName('ZATRNAME').AsString]), mtInformation, [mbOk], 0);
    Exit;
  end;
  vID_DOC_PROTOTYPE:=-1;
  if id_doclisttype=204 then   // возврат от покупателя
  begin
    // если включен режим не показывать фискальные отчеты - 0 то брать прототипы и фискальных и нефискальныз продаж
    if F_main.SHOW_FISCAL_REP=0 then F_main.IS_RECEPT_TO_REGISTR_RRO:=False;

    if FDocList_dlg(200, vID_DOC_PROTOTYPE )<>mrOk then  // документ прототип - продажа
    begin
      MessageDlg('Не выбран документ прототип для возврата!', mtError, [mbOk], 0);
    end;
  end;
  if id_doclisttype=219 then   // приход ТНП
  begin
    if MessageDlg('Вы хотите использоать в качестве прототипа заказы ТНП?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FDocList_dlg(163, vID_DOC_PROTOTYPE );  // документ прототип - заказы ТНП
  end;

  if id_doclisttype=271 then   // приход овощей
  begin
    if MessageDlg('Вы хотите использоать в качестве прототипа заказы овощей?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FDocList_dlg(270, vID_DOC_PROTOTYPE );  // документ прототип - заказы Овощей
  end;

  v_ID_NAKLCAP:=-1;
  if ID_CHAR_DOC<>0 then
  begin
    F_SaleDocDlg(id_doclisttype, v_ID_NAKLCAP, vID_DOC_PROTOTYPE );
  end
  else
  begin
    FWithoutTovDocDlg(id_doclisttype, v_ID_NAKLCAP, vID_DOC_PROTOTYPE);
  end;

  FoundNakl(v_ID_NAKLCAP);
  DBGrid1.SelectedRows.Clear;
end;

procedure TFSaleDocList.BBDelDocClick(Sender: TObject);
var pred_ID_NAKLCAP, next_ID_NAKLCAP,carrent_ID_NAKLCAP:longint;
var S_reason_delete_edit: string;
begin
  if (id_doclisttype=206) and (DM1.ADS_SaleDocList.FieldByName('IS_SVERENO').AsInteger=1) then // инвентаризация
  begin
    MessageDlg(Format('Инвентаризация сверена - %s; Удалять нельзя!',
      [DM1.ADS_SaleDocList.FieldByName('ZATRNAME').AsString]), mtInformation, [mbOk], 0);
    Exit;
  end;

 if ((id_doclisttype=200) or (id_doclisttype=204) or (id_doclisttype=289) or (id_doclisttype=290))
 and (DM1.ADS_SaleDocList.FieldByName('IS_REGISTER_RRO').AsInteger=1) then
 begin
   if MessageDlg('Данные зарегистрированы в налоговой, Вы уверены в удалении?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
 end;

if MessageDlg('Вы уверенны в удалении документа?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
DBGrid1.SelectedRows.Clear;

if (DM1.ADS_SaleDocList.FieldByName('FIX_PROV').AsInteger=0) then
 begin

// проверка на существование расходов позже (для товарных документов, кроме заказов)

if DM1.IsClosedPeriod(DM1.ADS_SaleDocList.FieldByName('D').AsFloat) then Exit;

if GetReasonStr(S_reason_delete_edit)=mrOk then
begin
with DM1.ADS_SaleDocList do
begin
 Disablecontrols;
 carrent_ID_NAKLCAP:=FieldByName('ID_NAKLCAP').AsInteger;
 prior;
 pred_ID_NAKLCAP:=FieldByName('ID_NAKLCAP').AsInteger;
 if carrent_ID_NAKLCAP=pred_ID_NAKLCAP then Next
 else begin Next; Next; end;
 next_ID_NAKLCAP:=FieldByName('ID_NAKLCAP').AsInteger;
  if CBISDEL.Checked then
 dm1.SP_DELETE_NAKL.Parameters.ParamValues['@MODE']:=1
 else dm1.SP_DELETE_NAKL.Parameters.ParamValues['@MODE']:=0;
 dm1.SP_DELETE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=carrent_ID_NAKLCAP;
 dm1.SP_DELETE_NAKL.Parameters.ParamValues['@COMMENT_DEL']:=S_reason_delete_edit;
 dm1.SP_DELETE_NAKL.Parameters.ParamValues['@ID_USER_DEL']:=id_user_select;
 dm1.SP_DELETE_NAKL.Parameters.ParamValues['@IN_TRANSACTION']:=1;  // открыть транзакцию

 dm1.SP_DELETE_NAKL.ExecProc;
 if dm1.SP_DELETE_NAKL.Parameters.ParamValues['@ER']=0
 then
  begin
   if pred_ID_NAKLCAP=carrent_ID_NAKLCAP then // удаляем 1-ю
    FoundNakl(next_ID_NAKLCAP)
   else
    if next_ID_NAKLCAP=carrent_ID_NAKLCAP then // удаляем последнюю
     FoundNakl(pred_ID_NAKLCAP)
    else FoundNakl(pred_ID_NAKLCAP);

  end
 else MessageDlg('Ошибка при удалении накладной!', mtError,
      [mbOk], 0);

 Enablecontrols;
end;
end;
end
else MessageDlg('Проводки документа зафиксированы. Удалять нельзя!', mtInformation, [mbOk], 0);

end;
end;


procedure TFSaleDocList.BBDocReportClick(Sender: TObject);
var vID_NAKLCAP:Longint;
begin
  vID_NAKLCAP:=DM1.ADS_SaleDocList.FieldByName('ID_NAKLCAP').AsInteger;
  if F_DocReportDlg(vID_NAKLCAP)=mrOk then
  begin
    BBEditDocClick(Sender);
    exit;
  end;
  FoundNakl(vID_NAKLCAP);
end;

procedure TFSaleDocList.BBEditDocClick(Sender: TObject);
begin
if (id_doclisttype=206) and (DM1.ADS_SaleDocList.FieldByName('IS_SVERENO').AsInteger=1) then // инвентаризация
begin

  MessageDlg(Format('Инвентаризация сверена - %s; Изменять нельзя!',
    [DM1.ADS_SaleDocList.FieldByName('ZATRNAME').AsString]), mtInformation, [mbOk], 0);
  Exit;
end;

if (id_doclisttype=206) and (DM1.ADS_SaleDocList.FieldByName('ID_USERS').AsInteger<>id_user_select) then // инвентаризация
begin

  MessageDlg(Format('Инвентаризация сделана другим пользователем (%s). Проверте не открыта ли она на другом рабочем месте.',
    [user_select]), mtInformation, [mbOk], 0);
  if MessageDlg('Вы уверены в изменении этой инвентаризации?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
end;


 if ((id_doclisttype=200) or (id_doclisttype=204) or (id_doclisttype=289) or (id_doclisttype=290))
 and (DM1.ADS_SaleDocList.FieldByName('IS_REGISTER_RRO').AsInteger=1) then
 begin
   if MessageDlg('Данные зарегистрированы в налоговой, Вы уверены в изменении?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
 end;

if DM1.IsClosedPeriod(DM1.ADS_SaleDocList.FieldByName('D').AsFloat) then Exit;
 v_ID_NAKLCAP:=DM1.ADS_SaleDocList.FieldByName('ID_NAKLCAP').AsInteger;


 if ID_CHAR_DOC<>0 then
  begin
     F_SaleDocDlg(id_doclisttype, v_ID_NAKLCAP, -1);
  end
  else
  begin
    FWithoutTovDocDlg(id_doclisttype, v_ID_NAKLCAP, -1);
  end;


 FoundNakl(v_ID_NAKLCAP);
 DBGrid1.SelectedRows.Clear;
end;

function TFSaleDocList.FixProv:integer;
begin
  if DM1.ADS_SaleDocList.FieldByName('ID_GR_PROV').AsFloat <>-1 then //  есть проводки
  begin
    if DM1.ADS_SaleDocList.FieldByName('FIX_PROV').AsInteger =0 then
      begin
        DM1.SP_FIX_PROV_DOC.Parameters.ParamValues['@ID_NAKLCAP']:=
          DM1.ADS_SaleDocList.FieldByName('ID_NAKLCAP').AsInteger;
        DM1.SP_FIX_PROV_DOC.ExecProc;
        if DM1.SP_FIX_PROV_DOC.Parameters.ParamValues['@ER']<>0 then
        begin
     //    MessageDlg('Проводки документа не зафиксированы!', mtInformation, [mbOk], 0);
         result:=-1;
         exit;
        end
        else
        begin
      //   MessageDlg('Проводки документа зафиксированы!', mtInformation, [mbOk], 0);
         result:=1;
         exit;
        end;
      end
      else
      begin
        DM1.SP_NON_FIX_PROV_DOC.Parameters.ParamValues['@ID_NAKLCAP']:=
          DM1.ADS_SaleDocList.FieldByName('ID_NAKLCAP').AsInteger;
        DM1.SP_NON_FIX_PROV_DOC.ExecProc;
        if DM1.SP_NON_FIX_PROV_DOC.Parameters.ParamValues['@ER']<>0 then
        begin
      //    MessageDlg('Проводки документа не расфиксированы!', mtInformation, [mbOk], 0);
          result:=-2;
         exit;
        end
        else
        begin
  //        MessageDlg('Проводки документа расфиксированы!', mtInformation, [mbOk], 0);
          result:=2;
         exit;
        end;

      end;
  end;   //  if DM1.ADS_SaleDocList.FieldByName('ID_GR_PROV').AsFloat <>-1 then //  есть проводки
end;




procedure TFSaleDocList.BBFixProvMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CTRLBooleanViewNalogDoc:=0;
 if ssAlt in Shift then
      CTRLBooleanViewNalogDoc:=1;
 if ssShift in Shift then
      CTRLBooleanViewNalogDoc:=2;
 if  ssCtrl in Shift then
      CTRLBooleanViewNalogDoc:=3;
 if  ssRight in Shift then
      CTRLBooleanViewNalogDoc:=4;
end;






procedure TFSaleDocList.BBRefreshClick(Sender: TObject);
begin
v_ID_NAKLCAP:=DM1.ADS_SaleDocList.FieldByName('ID_NAKLCAP').AsInteger;
FoundNakl(v_ID_NAKLCAP);
end;

procedure TFSaleDocList.BBRestoreClick(Sender: TObject);
begin
with DM1.ADS_SaleDocList do
 begin
  Edit;
  FieldByName('IS_DELETE').AsInteger:=0;
  Post;
 end;
 ReopenQ;
end;

procedure TFSaleDocList.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.ADS_SaleDocList.DisableControls;
 with DM1.ADS_SaleDocList do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.ADS_SaleDocList.EnableControls;

end;

procedure TFSaleDocList.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.ADS_SaleDocList.DisableControls;
 with DM1.ADS_SaleDocList do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.ADS_SaleDocList.EnableControls;

end;


procedure TFSaleDocList.BBSelectAllClick(Sender: TObject);
begin
if DM1.ADS_SaleDocList.Active then  GridSelectAll(DBGrid1);
end;

procedure TFSaleDocList.BBSettingClick(Sender: TObject);
begin

  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  IniFile.WriteInteger('nakllist_f', 'SHOW_ALL',RG_Show.ItemIndex);
  FreeAndNil(IniFile);
    // сохранить настройки колонок DbGrid1 в секцию  'nakllist_f'  Ini файла
 SaveColumnPosToIni(DbGrid1, 'nakllist_f');
end;

procedure TFSaleDocList.BBUnSelectAllClick(Sender: TObject);
begin
DBGrid1.SelectedRows.Clear;
end;

procedure TFSaleDocList.BBUnsetTransmitClick(Sender: TObject);
var i:integer;
begin

for i:=0 to DBGrid1.SelectedRows.Count-1 do
begin
  DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));
  with DM1.ADS_SaleDocList do
  begin
    if not (state in [dsInsert, dsEdit]) then Edit;
    FieldByName('IS_EXPORT').AsInteger:=0;
    Post;
  end;

end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do



end;

procedure TFSaleDocList.BB_Load_DocClick(Sender: TObject);
var Save_Cursor:TCursor;
begin

 if id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
  F_main.ActionConnectRemoteDBExecute(Sender);

  if   F_main.is_connect_server then
  begin
    try
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;
  // загрузка приходных накл ТНП     (219)
      if F_main.LoadDocum(219) then F_main.UpdateDocum(219);
      if F_main.LoadDocum(277) then F_main.UpdateDocum(277);  // приход с тт на тт
      if F_main.LoadDocum(163) then F_main.UpdateDocum(163);  // заказы тнп
    finally
      BBRefreshClick(Sender);
      Screen.Cursor := Save_Cursor;
      MessageDlg('Загрузка приходных накл ТНП и передаи с тт на тт выполнена!', mtInformation, [mbOk], 0);

    end;

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      F_main.ActionDisconnectRemoteDBExecute(Sender);
  end;
end;


procedure TFSaleDocList.UpLoadSverkaDocForExport;
var Save_Cursor :TCursor;
begin
  if F_main.Load_SVERKA_DOC_POS_ForExport then // загрузка вспомогательной таблицы признаков сверенности документов для торг. точки ID_TRADE_POINT для экспрота данных в основную БД
  begin
    // выгрузка признаков сверенности документов
    with Q_SVERKA_DOC_For_Export do
    begin
      Close;
      Parameters.ParamByName('d_from').Value:=D_From.DateTime;
      Parameters.ParamByName('d_to').Value:=D_To.DateTime;
      Parameters.ParamByName('ID_DOC_TYPE').Value:=id_doclisttype;
      Open;
      First;
      while not EOF do
      begin
        DataModule2.CDS_SVERKA_DOC_POS.Insert;
        DataModule2.CDS_SVERKA_DOC_POS.FieldByName('ID_NAKLCAP').asInteger:=
          FieldByName('ID_LINK_DOC_2').asInteger;

        DataModule2.CDS_SVERKA_DOC_POS.FieldByName('IS_SVERENO').asInteger:=
          FieldByName('IS_SVERENO').asInteger;

        DataModule2.CDS_SVERKA_DOC_POS.FieldByName('ID_TRADE_POINT').asInteger:=F_main.ID_TRADE_POINT;
        DataModule2.CDS_SVERKA_DOC_POS.Post;
        if ( DataModule2.CDS_SVERKA_DOC_POS.ChangeCount > 0) then
        begin
          DataModule2.CDS_SVERKA_DOC_POS.ApplyUpdates(-1);
        end;

        Next;
      end;

      Close;
    end; // with Q_SVERKA_DOC_For_Export do


    if F_main.Import_SVERKA_Doc_POS then
    begin
      Screen.Cursor := Save_Cursor;
      MessageDlg('Данные переданы на сервер успешно!', mtInformation, [mbOk], 0);

    end
    else
    begin
      Screen.Cursor := Save_Cursor;
      MessageDlg('Ошибка при передаче данных на сервер!', mtError, [mbOk], 0);

    end;


  end;   // if F_main.Load_SVERKA_DOC_POS_ForExport then
end;



procedure TFSaleDocList.BB_Send_SverkaClick(Sender: TObject);
begin
 if  id_user_remoute_DB=Unknown_code then   // подключение к удаленной БД
    F_main.ActionConnectRemoteDBExecute(Sender);
  if   F_main.is_connect_server then
  begin
// выгрузка данных о  сверенности документов в вспомогательные таблицы для экспрота данных в основную БД
// за текущий интервал  дат
    UpLoadSverkaDocForExport;

    if id_user_remoute_DB<>Unknown_code then      // отключение от удаленной БД
      F_main.ActionDisconnectRemoteDBExecute(Sender);
  end;

end;


procedure TFSaleDocList.BB_Union_InventClick(Sender: TObject);
begin
  if (id_doclisttype=206) and (DM1.ADS_SaleDocList.FieldByName('IS_SVERENO').AsInteger=1) then // инвентаризация
  begin
    MessageDlg(Format('Инвентаризация сверена - %s; Объединять нельзя!',
      [DM1.ADS_SaleDocList.FieldByName('ZATRNAME').AsString]), mtInformation, [mbOk], 0);
    Exit;
  end;
  if MessageDlg(Format('Вы уверенны в объединении инвентаризаций за %s ?',
  [DateToStr(DM1.ADS_SaleDocList.FieldByName('D').AsFloat)]),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   DM1.SP_IVNENT_UNION.Parameters.ParamValues['@D_INV']:=
            DM1.ADS_SaleDocList.FieldByName('D').AsFloat;
    DM1.SP_IVNENT_UNION.Parameters.ParamValues['@ID_DOC_TYPE']:=id_doclisttype;

   DM1.SP_IVNENT_UNION.ExecProc;
    if DM1.SP_IVNENT_UNION.Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при объединении инвентаризаций!', mtError, [mbOk], 0);
    end
    else
    begin
      FoundNakl(DM1.SP_IVNENT_UNION.Parameters.ParamValues['@ID_NAKLCAP_NEW']);
    end;

  end;
end;

procedure TFSaleDocList.CBISDELClick(Sender: TObject);
begin
  ReOpenQ;
end;

procedure TFSaleDocList.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TFSaleDocList.CheckBox2Click(Sender: TObject);
var s, s_from, s_to:string;
ft:TFieldType;
begin
 DBGrid1.DataSource.DataSet.Filtered:=CheckBox2.Checked;
 s:= Trim(Edit1.Text);
 if CheckBox2.Checked then
 begin
  if s<>'' then
  begin
   ft:=DBGrid1.DataSource.DataSet.FieldByName(CarentFieldSeach).DataType;
   if (ft=ftWideString) then
   begin
     s:='('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+s+'%') + ')';
   end
   else
   begin
    if ft=ftFloat then
    begin
      s:=StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      s_from:=FloatToStr(StrToFloat(s)-eps);
      s_to:=FloatToStr(StrToFloat(s)+eps);
      s_from:=StringReplace(s_from, ',', '.', [rfReplaceAll, rfIgnoreCase]);
      s_to:=StringReplace(s_to, ',', '.', [rfReplaceAll, rfIgnoreCase]);
      s:= '('+CarentFieldSeach+'>='+s_from+') and ('+CarentFieldSeach+'<='+s_to+')';
    end
    else
    begin
      s:= '('+CarentFieldSeach+'='''+s+''')';
    end;
   end;


    DBGrid1.DataSource.DataSet.Filter := s;



  end // if s<>'' then
  else CheckBox2.Checked:=False;
 end
 else DBGrid1.DataSource.DataSet.Filter :='';

end;

procedure TFSaleDocList.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 end;

end;

procedure TFSaleDocList.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.FieldName='NN' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('IS_EXPORT').AsInteger =0 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;

  if Field.FieldName='D' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('IS_SVERENO').AsInteger =1 then
      DBGrid1.Canvas.Font.Color := clGreen;
  end;

  if (Field.FieldName='is_final_doc') or (Field.FieldName='D') or (Field.FieldName='NN') or
  (Field.FieldName='TOT_NUM') or (Field.FieldName='TOT_SUM') or (Field.FieldName='CLIENT') then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('IS_FINAL').AsInteger=0 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;


  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TFSaleDocList.DBGrid1TitleClick(Column: TColumn);
begin
  if Column.FieldName='is_final_doc' then Exit;

 CarentFieldSeach:=Column.FieldName;
 DM1.ADS_SaleDocList.IndexFieldNames:=CarentFieldSeach;
end;

procedure TFSaleDocList.D_FromChange(Sender: TObject);
begin
 F_main.D_from.DateTime:=D_From.DateTime;
 F_main.D_to.DateTime:=D_To.DateTime;
 ReopenQ;
end;

procedure TFSaleDocList.Edit1Change(Sender: TObject);
begin
  try
   if ((not CheckBox1.Checked) and (not CheckBox2.Checked)) then
    DM1.ADS_SaleDocList.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey, loCaseInsensitive]);
  except
   ;
  end;
end;

procedure TFSaleDocList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (id_doclisttype<>200) and (id_doclisttype<>204) and (id_doclisttype<>289) and (id_doclisttype<>290) then   // продажи
  begin
    if not F_main.IS_RECEPT_TO_REGISTR_RRO then F_main.PRRO_ON_OFFClick(Owner);
  end;


end;

procedure TFSaleDocList.FormCreate(Sender: TObject);
begin
 // TForm(DBGrid1).OnMouseWheel := MouseWheel;
// id_doclisttype:=200;   // читать 157 с ini файла  надо  200    !!!!!!!!!!!!!!


  name_ini_File:=ChangeFileExt(Application.ExeName,'.ini');
  IniFile:=TIniFile.Create(name_ini_File);
  RG_Show.ItemIndex:=IniFile.ReadInteger('nakllist_f', 'SHOW_ALL',0);
  FreeAndNil(IniFile);

 CBISDEL.Checked:=False;


 D_From.Date:=F_main.D_Work.Date;
 D_To.Date:=F_main.D_Work.Date;
// ReopenQ;

    CBISDEL.Visible:=True;

  BBSearchUp.Enabled:= CheckBox1.Checked;
  BBSearchDown.Enabled := BBSearchUp.Enabled;
//  CarentFieldSeach:='D';
//  DM1.ADS_SaleDocList.IndexFieldNames:=CarentFieldSeach;





end;

procedure TFSaleDocList.FormShow(Sender: TObject);
begin
 // BBDocReport.Enabled:= not((ID_CHAR_DOC=0) or (ID_CHAR_DOC=5));
 BBDocReport.Enabled:= True;
  BB_Union_Invent.Visible:= (id_doclisttype=206);
  BB_Union_Invent.Enabled:= (RG_Show.ItemIndex=1);
  BB_Load_Doc.Visible:= (id_doclisttype = 219)
    or (id_doclisttype = 277)
    or (id_doclisttype = 163); // приход ТНП, приход передачи с тт на тт, заказы тнп

  BB_Send_Sverka.Visible:= (id_doclisttype =219) or (id_doclisttype = 277);

    // запретить редакрировать документы продажи
  if F_Main.EDIT_DOC_ENABLE=0 then
  begin
    BBEditDoc.Visible:= not ((id_doclisttype = 200)
      or (id_doclisttype = 204)
      or (id_doclisttype = 289)
      or (id_doclisttype = 290));
    BBDelDoc.Visible:=BBEditDoc.Visible;
  end;


 // BBAddDoc.Visible:= (id_doclisttype<>219);
 // BBEditDoc.Visible:= (id_doclisttype<>219);
 // BBDelDoc.Visible:= (id_doclisttype<>219);
  ReopenQ;
  CarentFieldSeach:='D';
  DM1.ADS_SaleDocList.IndexFieldNames:=CarentFieldSeach;

  ReadColumnPosFromIni(DbGrid1, 'SaleDocList');
  Edit1.SetFocus;
  if search_id_naklcap<>-1 then
  begin
    v_ID_NAKLCAP:= search_id_naklcap;

    FoundNakl(v_ID_NAKLCAP);
    BBEditDocClick(Sender);
  end;


end;

end.
