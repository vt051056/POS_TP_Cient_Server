unit Smeny_Docs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.Win.ADODB, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TF_Smeny_Docs = class(TForm)
    Panel1: TPanel;
    ADOTable_SHIFTS: TADOTable;
    DS_ADOTable_SHIFTS: TDataSource;
    ADOCommandDeleteShifts: TADOCommand;
    Panel2: TPanel;
    BBGetShifts: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    D_From: TDateTimePicker;
    D_To: TDateTimePicker;
    T_From: TDateTimePicker;
    T_To: TDateTimePicker;
    Panel3: TPanel;
    ADOTable_SHIFTSID_USER: TIntegerField;
    ADOTable_SHIFTSShiftId: TIntegerField;
    ADOTable_SHIFTSOpenShiftFiscalNum: TWideStringField;
    ADOTable_SHIFTSCloseShiftFiscalNum: TWideStringField;
    ADOTable_SHIFTSOpened: TDateTimeField;
    ADOTable_SHIFTSOpenName: TWideStringField;
    ADOTable_SHIFTSOpenSubjectKeyId: TWideStringField;
    ADOTable_SHIFTSClosed: TDateTimeField;
    ADOTable_SHIFTSCloseName: TWideStringField;
    ADOTable_SHIFTSCloseSubjectKeyId: TWideStringField;
    ADOTable_SHIFTSZRepFiscalNum: TWideStringField;
    BBGetZRep: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Tb_SHIFTS_DOCUMS_RRO: TADOTable;
    Tb_SHIFTS_DOCUMS_RROID_USER: TIntegerField;
    Tb_SHIFTS_DOCUMS_RRONumFiscal: TWideStringField;
    Tb_SHIFTS_DOCUMS_RRONumLocal: TIntegerField;
    Tb_SHIFTS_DOCUMS_RRODocDateTime: TDateTimeField;
    Tb_SHIFTS_DOCUMS_RRODocClass: TWideStringField;
    Tb_SHIFTS_DOCUMS_RROCheckDocType: TWideStringField;
    Tb_SHIFTS_DOCUMS_RROCheckDocSubType: TWideStringField;
    Tb_SHIFTS_DOCUMS_RRORevoked: TIntegerField;
    Tb_SHIFTS_DOCUMS_RROStorned: TIntegerField;
    ADOCommandDeleteTb_SHIFTS_DOCUMS_RRO: TADOCommand;
    Tb_SHIFTS_DOCUM_DETAIL_RRO: TADOTable;
    ADOCommandDeleteTb_SHIFTS_DOCUM_DETAIL_RRO: TADOCommand;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel9: TPanel;
    DBGrid4: TDBGrid;
    Tb_SHIFTS_DOCUM_DETAIL_RROID_USER: TIntegerField;
    Tb_SHIFTS_DOCUM_DETAIL_RRONumFiscal: TWideStringField;
    Tb_SHIFTS_DOCUM_DETAIL_RRODocDateTime: TDateTimeField;
    Tb_SHIFTS_DOCUM_DETAIL_RROSumDoc: TFloatField;
    Tb_SHIFTS_DOCUM_DETAIL_RROID_NAKLCAP: TIntegerField;
    Tb_SHIFTS_DOCUM_DETAIL_RRODocSubType: TWideStringField;
    Q_Doc_Uchet: TADOQuery;
    Q_Doc_UchetTOT_SUM: TFloatField;
    Q_Doc_UchetID_NAKLCAP: TAutoIncField;
    Q_Doc_UchetID_DOC_TYPE: TIntegerField;
    Q_Doc_UchetIS_REGISTER_RRO: TIntegerField;
    Q_Doc_UchetID_NUM_FISCAL_KASSA: TWideStringField;
    Q_Doc_UchetNAMEDOC: TWideStringField;
    Q_Doc_UchetD_CREATE: TDateTimeField;
    Q_Doc_UchetNumFiscal: TWideStringField;
    Q_Doc_UchetDocDateTime: TDateTimeField;
    DS_Q_Doc_Uchet: TDataSource;
    Panel10: TPanel;
    DBNavigator4: TDBNavigator;
    BBRepairAll: TBitBtn;
    Q_Doc_UchetNumLocal: TWideStringField;
    Q_Doc_UchetID_LINK_DOC: TIntegerField;
    Tb_SHIFTS_DOCUM_DETAIL_RRONumLocal: TWideStringField;
    QDocPrototypeCaption: TADOQuery;
    BBGetDocList: TBitBtn;
    LabelError: TLabel;
    BBRepairCurrent: TBitBtn;
    BBMoveNotRegDocToOpenShift: TBitBtn;
    ADOCommandUpdateD_Create: TADOCommand;
    BBMoveAllNotRegDocToOpenShift: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BBGetShiftsClick(Sender: TObject);
    procedure BBGetZRepClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BBGetDocListClick(Sender: TObject);
    procedure DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BBRepairAllClick(Sender: TObject);
    procedure ADOTable_SHIFTSAfterScroll(DataSet: TDataSet);
    procedure BBRepairCurrentClick(Sender: TObject);
    procedure BBMoveNotRegDocToOpenShiftClick(Sender: TObject);
    procedure BBMoveAllNotRegDocToOpenShiftClick(Sender: TObject);
  private
    { Private declarations }
    // заполнить табл детальной инфо о зарегистрированных документах
    procedure DataCheckToTb;
     // исправить данные о регистрации документа в налоговой
    procedure RepairCurrentDoc;
    procedure RepairGo;
    procedure Repair_RRO_DATA_TO_NAKLCAP(vID_NAKLCAP, IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
 CHECK_NUMLOCAL, CHECK_NUMFISCAL, ORDERDATETIME, QRCODE_REG:string; ID_NAKLCAP_PROTOTYPE:longInt);
    procedure MoveNotRegDocToOpenShift;
  public
    { Public declarations }
  end;

var
  F_Smeny_Docs: TF_Smeny_Docs;
  function F_Smeny_Docs_Dlg():integer;
implementation

{$R *.dfm}
uses UMainForm, DateUtils, USERS_F, UDataModule1, myfuncs, ComObj, MSXML;

function F_Smeny_Docs_Dlg():integer;
begin
 F_Smeny_Docs:=TF_Smeny_Docs.Create(Application);
 try
   with F_Smeny_Docs do
   begin
      result:=ShowModal;
   end;
 finally
   FreeAndNil(F_Smeny_Docs);
 end;
end;

// заполнить табл детальной инфо о зарегистрированных документах
procedure TF_Smeny_Docs.DataCheckToTb;
 var DataCheck :widestring;
  NumFiscal, s :String;
  DocDateTime:TDateTime;
  vID_NAKLCAP:longint;
  SumDoc:extended;
  xml:IXMLDOMDocument;
  d, m, y, h, mi, sec, ip:integer;
  DOCTYPE:string;
  DocSubType:string;
  DocClass:string;
  exists_error:boolean;
begin
  Tb_SHIFTS_DOCUM_DETAIL_RRO.Close;
  ADOCommandDeleteTb_SHIFTS_DOCUM_DETAIL_RRO.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
  ADOCommandDeleteTb_SHIFTS_DOCUM_DETAIL_RRO.Execute;
  Tb_SHIFTS_DOCUM_DETAIL_RRO.Open;
  Tb_SHIFTS_DOCUM_DETAIL_RRO.DisableControls;
  // запрос чека с фискального с сервера
   with Tb_SHIFTS_DOCUMS_RRO do
   begin
    First;
     while not Eof do
     begin
      DOCTYPE:=Tb_SHIFTS_DOCUMS_RRO.FieldByName('CheckDocType').AsString;
      DocClass:=Tb_SHIFTS_DOCUMS_RRO.FieldByName('DocClass').AsString;
      if (DOCTYPE='SaleGoods') and (DocClass='Check') then
      begin
    // запрос чека с фискального с сервера
        DataCheck:='';
        F_Main.GetCheck(False, False, Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumFiscal').AsString, DataCheck );

        try
          xml := CreateOleObject('Microsoft.XMLDOM') as IXMLDOMDocument;
          xml.async := False;
          xml.loadXML(DataCheck);
          if xml.parseError.errorCode <> 0 then
            raise Exception.Create('XML Load error:' + xml.parseError.reason);
          s:=xml.selectSingleNode('/CHECK/CHECKHEAD/COMMENT').text;
          ip:=Pos('#',s);
          vID_NAKLCAP:=StrToInt(Copy(s,ip+1, s.Length-ip+2));
          DocSubType:=Copy(s,1, ip-1);
          NumFiscal:=Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumFiscal').AsString;
          s:=xml.selectSingleNode('/CHECK/CHECKTOTAL/SUM').text;
          s:=StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
          SumDoc:=StrToFloat(s);
          s:=xml.selectSingleNode('/CHECK/CHECKHEAD/ORDERDATE').text;
          d:=StrToInt(s.SubString(0, 2));
          m:=StrToInt(s.SubString(2, 2));
          y:=StrToInt(s.SubString(4, 4));
          s:=xml.selectSingleNode('/CHECK/CHECKHEAD/ORDERTIME').text;
          h:=StrToInt(s.SubString(0, 2));
          mi:=StrToInt(s.SubString(2, 2));
          sec:=StrToInt(s.SubString(4, 2));
          DocDateTime:=EncodeDateTime(y, m, d, h, mi, sec,0);

          Tb_SHIFTS_DOCUM_DETAIL_RRO.Insert;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('ID_USER').AsInteger:=ID_user_select;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('NumFiscal').AsString:=Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumFiscal').AsString;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('NumLocal').AsString:=IntToStr(Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumLocal').AsInteger);
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('DocDateTime').AsFloat:=DocDateTime;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('SumDoc').AsFloat:=SumDoc;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('ID_NAKLCAP').AsInteger:=vID_NAKLCAP;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.FieldByName('DocSubType').AsString:= DocSubType;
          Tb_SHIFTS_DOCUM_DETAIL_RRO.Post;

        except
         // MessageDlg('Ошибка получения детальной информации о документе!', mtError, [mbOk], 0);

        end;

      end;
      Next;
     end;
   end;
   Tb_SHIFTS_DOCUM_DETAIL_RRO.EnableControls;
   with Q_Doc_Uchet do
   begin
    DisableControls;
    Close;
    Parameters.ParamByName('d_from').Value:=  ADOTable_SHIFTS.FieldByName('Opened').AsFloat;
    if ADOTable_SHIFTS.FieldByName('Closed').AsFloat=0 then
        Parameters.ParamByName('d_to').Value:=Now
    else  Parameters.ParamByName('d_to').Value:=ADOTable_SHIFTS.FieldByName('Closed').AsFloat;
    Parameters.ParamByName('ID_NUM_FISCAL_KASSA').Value:=IntToStr(F_Main.ID_NUM_FISCAL_KASSA);
    Parameters.ParamByName('ID_USER').Value:=ID_user_select;
    Open;
    First;
    exists_error:=False;
    while not Eof do
    begin
      if ((FieldByName('IS_REGISTER_RRO').AsInteger =0)  //не зарегистрирована
        and  (FieldByName('NumFiscal').AsString =''))
        or ((FieldByName('IS_REGISTER_RRO').AsInteger =0)  // зарегистрирована но нет инфо у нас
        and  (FieldByName('NumFiscal').AsString <>''))
      then
      begin
        exists_error:=True;
        break
      end;
      Next;
    end;
    First;
    EnableControls;

   end;

   if exists_error then  LabelError.Caption:='Есть ошибки фискальной регистрации!'
   else LabelError.Caption:='';


end;


procedure TF_Smeny_Docs.DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.FieldName='NAMEDOC' then
  begin
    if (DBGrid4.DataSource.DataSet.FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (DBGrid4.DataSource.DataSet.FieldByName('NumFiscal').AsString ='')
    then  DBGrid4.Canvas.Font.Color := clRed;      //не зарегистрирована
    if (DBGrid4.DataSource.DataSet.FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (DBGrid4.DataSource.DataSet.FieldByName('NumFiscal').AsString <>'')
    then  DBGrid4.Canvas.Font.Color := clBlue;      // зарегистрирована

  end;


  DBGrid4.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_Smeny_Docs.ADOTable_SHIFTSAfterScroll(DataSet: TDataSet);
begin
  Q_Doc_Uchet.Close;
  BBRepairCurrent.Enabled:= False;
  BBRepairAll.Enabled:=BBRepairCurrent.Enabled;
  BBMoveNotRegDocToOpenShift.Enabled:=BBRepairCurrent.Enabled;
  BBMoveAllNotRegDocToOpenShift.Enabled:=BBMoveNotRegDocToOpenShift.Enabled;

end;

procedure TF_Smeny_Docs.BBGetDocListClick(Sender: TObject);
var vDocs :  TDocuments;
count_Docs, i:integer;
var Save_Cursor:TCursor;
begin
// получить документы смены по идентификатору смены
  LabelError.Caption:='';
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Tb_SHIFTS_DOCUMS_RRO.Close;
  ADOCommandDeleteTb_SHIFTS_DOCUMS_RRO.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
  ADOCommandDeleteTb_SHIFTS_DOCUMS_RRO.Execute;
  Tb_SHIFTS_DOCUMS_RRO.Open;
  Tb_SHIFTS_DOCUMS_RRO.DisableControls;
  SetLength(vDocs,0);
  F_main.GetDocumentsShift(False, ADOTable_SHIFTS.FieldByName('ShiftId').asInteger, vDocs);
  count_Docs:=Length(vDocs);
   for i := 0 to count_Docs-1 do
   begin

        {
               type TDocumentItem = record
              NumFiscal: string; // Фіскальний номер документа
              NumLocal: int64;  // Локальний номер документа
              DocDateTime:string; // Дата і час операції, зафіксованої документом
              DocClass:string;  // Клас документа (“Check”, “ZRep”)
              CheckDocType:string; // Тип чека (“SaleGoods”, …)
              CheckDocSubType:string; // Розширений тип чека (“CheckGoods”, …)
              Revoked:boolean; // Ознака відкликаного документа
              Storned:boolean; // Ознака сторнованого документа
            end;  }


     Tb_SHIFTS_DOCUMS_RRO.Insert;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('ID_USER').AsInteger:=ID_user_select;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumFiscal').AsString:=vDocs[i].NumFiscal;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('NumLocal').AsInteger:=vDocs[i].NumLocal;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('DocDateTime').AsFloat:=vDocs[i].DocDateTime;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('DocClass').AsString:=vDocs[i].DocClass;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('CheckDocType').AsString:=vDocs[i].CheckDocType;
     Tb_SHIFTS_DOCUMS_RRO.FieldByName('CheckDocSubType').AsString:=vDocs[i].CheckDocSubType;
     if (vDocs[i].Revoked) then  Tb_SHIFTS_DOCUMS_RRO.FieldByName('Revoked').AsInteger:=1
     else Tb_SHIFTS_DOCUMS_RRO.FieldByName('Revoked').AsInteger:=0;
     if (vDocs[i].Storned) then  Tb_SHIFTS_DOCUMS_RRO.FieldByName('Storned').AsInteger:=1
     else Tb_SHIFTS_DOCUMS_RRO.FieldByName('Storned').AsInteger:=0;

     Tb_SHIFTS_DOCUMS_RRO.Post;
   end;
   Tb_SHIFTS_DOCUMS_RRO.EnableControls;


     // заполнить табл детальной инфо о зарегистрированных документах
  DataCheckToTb;

   Screen.Cursor := Save_Cursor;
   MessageDlg('Загрузка документов выполнена!', mtInformation, [mbOk], 0);

  // BBRepairCurrent.Enabled:= (ADOTable_SHIFTS.FieldByName('closed').AsFloat<0.0001) and (Q_Doc_Uchet.RecordCount>0);
  BBRepairCurrent.Enabled:= (Q_Doc_Uchet.RecordCount>0);
  BBRepairAll.Enabled:=BBRepairCurrent.Enabled;

  BBMoveNotRegDocToOpenShift.Enabled:=(ADOTable_SHIFTS.FieldByName('closed').AsFloat>0.0001);
  BBMoveAllNotRegDocToOpenShift.Enabled:= BBMoveNotRegDocToOpenShift.Enabled;
end;

procedure TF_Smeny_Docs.BBGetShiftsClick(Sender: TObject);
var vShifts :  TShifts;
count_Shifts, i:integer;
begin
  ADOTable_SHIFTS.Close;
  ADOTable_SHIFTS.Filter :='';
  ADOCommandDeleteShifts.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
  ADOCommandDeleteShifts.Execute;
  ADOTable_SHIFTS.Open;
  ADOTable_SHIFTS.DisableControls;
   // перечень смен за период
   SetLength(vShifts,0);
   F_Main.Shifts(False, D_From.DateTime, D_To.DateTime, vShifts);
   count_Shifts:=Length(vShifts);
   for i := 0 to count_Shifts-1 do
   begin
     ADOTable_SHIFTS.Insert;
     ADOTable_SHIFTS.FieldByName('ID_USER').AsInteger:=ID_user_select;
     ADOTable_SHIFTS.FieldByName('ShiftId').AsInteger:=vShifts[i].ShiftId;
     ADOTable_SHIFTS.FieldByName('OpenShiftFiscalNum').AsString:=vShifts[i].OpenShiftFiscalNum;
     ADOTable_SHIFTS.FieldByName('CloseShiftFiscalNum').AsString:=vShifts[i].CloseShiftFiscalNum;
     ADOTable_SHIFTS.FieldByName('Opened').AsFloat:=vShifts[i].Opened;
     ADOTable_SHIFTS.FieldByName('OpenName').AsString:=vShifts[i].OpenName;
     ADOTable_SHIFTS.FieldByName('OpenSubjectKeyId').AsString:=vShifts[i].OpenSubjectKeyId;
     ADOTable_SHIFTS.FieldByName('Closed').AsFloat:=vShifts[i].Closed;
     ADOTable_SHIFTS.FieldByName('CloseName').AsString:=vShifts[i].CloseName;
     ADOTable_SHIFTS.FieldByName('CloseSubjectKeyId').AsString:=vShifts[i].CloseSubjectKeyId;
     ADOTable_SHIFTS.FieldByName('ZRepFiscalNum').AsString:=vShifts[i].ZRepFiscalNum;
     ADOTable_SHIFTS.Post;
   end;
   ADOTable_SHIFTS.Filtered:=True;
   ADOTable_SHIFTS.Filter := '(ID_USER= ' + IntToStr(ID_user_select) + ')';
   ADOTable_SHIFTS.EnableControls;

  BBGetDocList.Enabled:= (ADOTable_SHIFTS.RecordCount>0);
  BBRepairCurrent.Enabled:= False;
  BBRepairAll.Enabled:= BBRepairCurrent.Enabled;
  BBMoveNotRegDocToOpenShift.Enabled:= BBRepairCurrent.Enabled;
  BBMoveAllNotRegDocToOpenShift.Enabled:=BBMoveNotRegDocToOpenShift.Enabled;

end;

procedure TF_Smeny_Docs.BBGetZRepClick(Sender: TObject);
begin
  if ADOTable_SHIFTS.RecordCount>0 then
  begin
   F_main.ZRepNumFiscal:=ADOTable_SHIFTS.FieldByName('ZRepFiscalNum').AsString;
   if F_main.ZRepNumFiscal<>'' then F_main.GetZRep(False)
   else  MessageDlg('Смена не закрыта Z-отчета нет', mtError, [mbOk], 0);
  end;
end;

procedure TF_Smeny_Docs.MoveNotRegDocToOpenShift;
begin
  with Q_Doc_Uchet do
  begin
    if (FieldByName('IS_REGISTER_RRO').AsInteger =0) and  (FieldByName('NumFiscal').AsString ='') then        //не зарегистрирована - отправить данные для регистрации в налоговую
    begin
      ADOCommandUpdateD_Create.Parameters.ParamByName('ID_NAKLCAP').Value:=
        Q_Doc_Uchet.FieldByName('ID_NAKLCAP').AsInteger;
      ADOCommandUpdateD_Create.Execute;
    end;
  end;
end;

procedure TF_Smeny_Docs.BBMoveNotRegDocToOpenShiftClick(Sender: TObject);
begin
// перенос незарегистрированного RRO документа  на открытую смену
  MoveNotRegDocToOpenShift;
  BBGetDocListClick(Sender);
end;


procedure TF_Smeny_Docs.BBMoveAllNotRegDocToOpenShiftClick(Sender: TObject);
begin
// перенос всех незарегистрированных RRO документов  на открытую смену
  with Q_Doc_Uchet do
  begin
    First;
    while not EOF do
    begin
      MoveNotRegDocToOpenShift;
      Next;
    end;
  end;
  BBGetDocListClick(Sender);
end;

// исправить данные о регистрации документа в налоговой
procedure TF_Smeny_Docs.Repair_RRO_DATA_TO_NAKLCAP(vID_NAKLCAP, IS_CAN_REGISTRED_RRO, IS_REGISTER_RRO:integer;
 CHECK_NUMLOCAL, CHECK_NUMFISCAL, ORDERDATETIME, QRCODE_REG:string; ID_NAKLCAP_PROTOTYPE:longInt);
begin
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP']:=vID_NAKLCAP;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NAKLCAP_PROTOTYPE']:=ID_NAKLCAP_PROTOTYPE;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=IS_CAN_REGISTRED_RRO;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@IS_REGISTER_RRO']:=IS_REGISTER_RRO;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_CLI_RRO']:= F_main.ID_CLI_FISCAL;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ID_NUM_FISCAL_KASSA']:= F_main.ID_NUM_FISCAL_KASSA;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMLOCAL']:=CHECK_NUMLOCAL;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@CHECK_NUMFISCAL']:=CHECK_NUMFISCAL;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ORDERDATETIME']:=ORDERDATETIME;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@QRCODE_REG']:=QRCODE_REG;
  DM1.SP_SET_RRO_DATA_TO_NAKLCAP.ExecProc;
  if DM1.SP_SET_RRO_DATA_TO_NAKLCAP.Parameters.ParamValues['@ER']<>0  then
  begin
   MessageDlg('Ошибка при сохранении регистрации РРО!', mtError,  [mbOk], 0);
  end;

end;

procedure TF_Smeny_Docs.RepairCurrentDoc;
var  NumFiscal,  NumLocal, OrderDateTime, QRCode:string;
begin
 with Q_Doc_Uchet do
  begin

    if (FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (FieldByName('NumFiscal').AsString ='')
      and (ADOTable_SHIFTS.FieldByName('closed').AsFloat<0.0001) and (Q_Doc_Uchet.RecordCount>0)
      then        //не зарегистрирована - отправить данные для регистрации в налоговую
      begin
        if (FieldByName('ID_DOC_TYPE').AsInteger = 289) or (FieldByName('ID_DOC_TYPE').AsInteger = 290) then
        begin
        // регистрация внесения и изъятия кассы
          if F_main.RegisterKassa_In_Out_RRO(False, (FieldByName('ID_DOC_TYPE').AsInteger=289),
          FieldByName('ID_NAKLCAP').AsInteger,
          FieldByName('TOT_SUM').AsFloat,
            NumFiscal,  NumLocal, OrderDateTime) then
          begin
            Repair_RRO_DATA_TO_NAKLCAP( FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
              NumLocal, NumFiscal, OrderDateTime, '', -1);
          end;
        end
        else
        begin
          // регистрация продажи и возврата
          QDocPrototypeCaption.Close;
          QDocPrototypeCaption.Parameters.ParamByName('ID_NAKLCAP').Value:=FieldByName('ID_LINK_DOC').AsInteger;
          QDocPrototypeCaption.Open;
          if F_Main.RegisterCheck_RRO(0,
            FieldByName('ID_NAKLCAP').AsInteger, QRCode, NumFiscal, NumLocal, OrderDateTime,
             (FieldByName('ID_DOC_TYPE').AsInteger=200),
             QDocPrototypeCaption.FieldByName('CHECK_NUMFISCAL').AsString)
          then
          begin
            Repair_RRO_DATA_TO_NAKLCAP(FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
             NumLocal, NumFiscal, OrderDateTime, QRCode,
             FieldByName('ID_LINK_DOC').AsInteger);

          end;
          QDocPrototypeCaption.Close;
        end;

      end;

      if (FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (FieldByName('NumFiscal').AsString <>'')
      then        // зарегистрирована в налоговой но у нас нет отметки о регистрации - нужно поставить
      begin
        Repair_RRO_DATA_TO_NAKLCAP(FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
        FieldByName('NumLocal').AsString, FieldByName('NumFiscal').AsString,
        DateToISO8601(FieldByName('DocDateTime').AsFloat,True), '',
        FieldByName('ID_LINK_DOC').AsInteger);

      end;
  end;
end;

procedure TF_Smeny_Docs.RepairGo;
//var  NumFiscal,  NumLocal, OrderDateTime, QRCode:string;
begin
// Исправить ошибки фискализации
  with Q_Doc_Uchet do
  begin
    First;
    while not Eof do
    begin
      RepairCurrentDoc;
      (*
      if (FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (FieldByName('NumFiscal').AsString ='')
      then        //не зарегистрирована - отправить данные для регистрации в налоговую
      begin
        if (FieldByName('ID_DOC_TYPE').AsInteger = 289) or (FieldByName('ID_DOC_TYPE').AsInteger = 290) then
        begin
        // регистрация внесения и изъятия кассы
          if F_main.RegisterKassa_In_Out_RRO(False, (FieldByName('ID_DOC_TYPE').AsInteger=289),
          FieldByName('ID_NAKLCAP').AsInteger,
          FieldByName('TOT_SUM').AsFloat,
            NumFiscal,  NumLocal, OrderDateTime) then
          begin
            Repair_RRO_DATA_TO_NAKLCAP( FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
              NumLocal, NumFiscal, OrderDateTime, '', -1);
          end;
        end
        else
        begin
          // регистрация продажи и возврата
          QDocPrototypeCaption.Close;
          QDocPrototypeCaption.Parameters.ParamByName('ID_NAKLCAP').Value:=FieldByName('ID_LINK_DOC').AsInteger;
          QDocPrototypeCaption.Open;
          if F_Main.RegisterCheck_RRO(0,
            FieldByName('ID_NAKLCAP').AsInteger, QRCode, NumFiscal, NumLocal, OrderDateTime,
             (FieldByName('ID_DOC_TYPE').AsInteger=200),
             QDocPrototypeCaption.FieldByName('CHECK_NUMFISCAL').AsString)
          then
          begin
            Repair_RRO_DATA_TO_NAKLCAP(FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
             NumLocal, NumFiscal, OrderDateTime, QRCode,
             FieldByName('ID_LINK_DOC').AsInteger);

          end;
          QDocPrototypeCaption.Close;
        end;

      end;

      if (FieldByName('IS_REGISTER_RRO').AsInteger =0)
      and  (FieldByName('NumFiscal').AsString <>'')
      then        // зарегистрирована в налоговой но у нас нет отметки о регистрации - нужно поставить
      begin
        Repair_RRO_DATA_TO_NAKLCAP(FieldByName('ID_NAKLCAP').AsInteger, 1, 1,
        FieldByName('NumLocal').AsString, FieldByName('NumFiscal').AsString,
        DateToISO8601(FieldByName('DocDateTime').AsFloat,True), '',
        FieldByName('ID_LINK_DOC').AsInteger);

      end;
       *)
      Next;
    end;
  end;
end;


procedure TF_Smeny_Docs.BBRepairAllClick(Sender: TObject);
begin
  BBRepairAll.Enabled:=False;
  RepairGo;
  BBGetDocListClick(Sender);
  BBRepairAll.Enabled:=True;
end;

procedure TF_Smeny_Docs.BBRepairCurrentClick(Sender: TObject);
begin
  BBRepairCurrent.Enabled:=False;
  RepairCurrentDoc;
  BBGetDocListClick(Sender);
  BBRepairCurrent.Enabled:=True;
end;



procedure TF_Smeny_Docs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ADOTable_SHIFTS.Close;
  Tb_SHIFTS_DOCUMS_RRO.Close;
  Tb_SHIFTS_DOCUM_DETAIL_RRO.Close;

end;

procedure TF_Smeny_Docs.FormCreate(Sender: TObject);
begin
  D_From.DateTime:=F_Main.D_From.DateTime;
  D_To.DateTime:=F_Main.D_To.DateTime;
  LabelError.Caption:='';

  BBGetDocList.Enabled:= False; //(F_Main.IS_shift_Opened=1);
  BBRepairCurrent.Enabled:= False;
  BBRepairAll.Enabled:=BBRepairCurrent.Enabled;
  BBMoveNotRegDocToOpenShift.Enabled:=BBRepairCurrent.Enabled;
  BBMoveAllNotRegDocToOpenShift.Enabled:=BBMoveNotRegDocToOpenShift.Enabled;
end;



procedure TF_Smeny_Docs.FormShow(Sender: TObject);
begin

   BBGetShiftsClick(Sender);
end;

end.
