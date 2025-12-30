unit Assemb_POS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Tabs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.Win.ADODB;

type
  TF_Assemb_POS = class(TForm)
    Notebook1: TNotebook;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    DBNavigator2: TDBNavigator;
    BBRefreshNorm: TBitBtn;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBNavigator3: TDBNavigator;
    DTPFrom: TDateTimePicker;
    DTPTo: TDateTimePicker;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    SBAddIngr: TSpeedButton;
    SBDeIIngr: TSpeedButton;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    TabSet1: TTabSet;
    DS_PRODUCT_POS: TDataSource;
    QPRODUCT_POS: TADOQuery;
    DS_NORM_ASSEMB_POS: TDataSource;
    QNORM_ASSEMB_POS: TADOQuery;
    QPRODUCT_POSID_PROD: TIntegerField;
    QPRODUCT_POSID_TOV: TIntegerField;
    QPRODUCT_POSGRUPTOV: TWideStringField;
    QPRODUCT_POSNAME: TWideStringField;
    QPRODUCT_POSEDIZM: TWideStringField;
    QPRODUCT_POSN_SYR_MINUS: TFloatField;
    QPRODUCT_POSN_SYR_PLUS: TFloatField;
    QPRODUCT_POSN_GOT_MINUS: TFloatField;
    QPRODUCT_POSN_GOT_PLUS: TFloatField;
    QPRODUCT_POSN_SUH_MINUS: TFloatField;
    QPRODUCT_POSN_SUH_PLUS: TFloatField;
    QNORM_ASSEMB_POSID_PROD: TIntegerField;
    QNORM_ASSEMB_POSID_TOV: TIntegerField;
    QNORM_ASSEMB_POSGRUPTOV: TWideStringField;
    QNORM_ASSEMB_POSNAME: TWideStringField;
    QNORM_ASSEMB_POSNORMA: TFloatField;
    QNORM_ASSEMB_POSEDIZM: TWideStringField;
    QNORM_ASSEMB_POSID_NORM: TIntegerField;
    DS_FARSH_DAY_POS: TDataSource;
    SP_ADD_FARSH_DAY_POS: TADOStoredProc;
    QFARSH_DAY_POS: TADOQuery;
    QFARSH_DAY_POSPROD_NAME: TWideStringField;
    QFARSH_DAY_POSID_SER: TAutoIncField;
    QFARSH_DAY_POSID_PROD: TIntegerField;
    QFARSH_DAY_POSDATE_P: TDateTimeField;
    QFARSH_DAY_POSN_PREPARE: TFloatField;
    QFARSH_DAY_POSDATE_V: TDateTimeField;
    QFARSH_DAY_POSN_GOT: TFloatField;
    QFARSH_DAY_POSSEBEST: TFloatField;
    QFARSH_DAY_POSID_DOC_GOT: TIntegerField;
    QFARSH_DAY_POSID_DOC_INGR: TIntegerField;
    GroupBox5: TGroupBox;
    SBDelProd: TSpeedButton;
    SBGetIngrDay: TSpeedButton;
    BBEditProd: TBitBtn;
    SBAddProd: TSpeedButton;
    GroupBox6: TGroupBox;
    SBDelDocs: TSpeedButton;
    SBEditGot: TSpeedButton;
    BBCalcSebest: TBitBtn;
    SP_GET_INGR_CONS_POS: TADOStoredProc;
    DS_INGR_CONS_POS: TDataSource;
    SP_DELETE_FARSH_DAY_POS: TADOStoredProc;
    SBReplaceIngr: TSpeedButton;
    SP_REPLACE_INGR_CONS_POS: TADOStoredProc;
    QINGR_CONS_POS: TADOQuery;
    QINGR_CONS_POSGRUPTOV: TWideStringField;
    QINGR_CONS_POSNAME: TWideStringField;
    QINGR_CONS_POSEDIZM: TWideStringField;
    QINGR_CONS_POSID_INGR: TAutoIncField;
    QINGR_CONS_POSID_SER: TIntegerField;
    QINGR_CONS_POSID_TOV: TIntegerField;
    QINGR_CONS_POSN_NORM: TFloatField;
    QINGR_CONS_POSN_FACT: TFloatField;
    QINGR_CONS_POSPRICE: TFloatField;
    QINGR_CONS_POSID_GRTOV: TIntegerField;
    SBReplNEHVAT: TSpeedButton;
    QFARSH_DAY_POSIS_CALC_SEBEST: TIntegerField;
    SBEditIngr: TSpeedButton;
    SP_DELETE_INGR_CONS_POS: TADOStoredProc;
    QFARSH_DAY_POSEDIZM: TWideStringField;
    SP_EDIT_FARSH_DAY_POS: TADOStoredProc;
    ADOCommandSetSebest: TADOCommand;
    BBCreateDocs: TBitBtn;
    SP_CREATE_DOC_PRVO_POS: TADOStoredProc;
    SP_DELETE_DOC_PRVO_POS: TADOStoredProc;
    BBUnSelectAll: TBitBtn;
    BBSelectAll: TBitBtn;
    BBUnsetTransmit: TBitBtn;
    BBRefresh_FarshDay: TBitBtn;
    ADOCommand_Expotr_Ser__null: TADOCommand;
    QFARSH_DAY_POSIS_EXPORT_GOT: TIntegerField;
    QFARSH_DAY_POSIS_EXPORT_INGR: TIntegerField;
    QFARSH_DAY_POScalc: TStringField;
    QFARSH_DAY_POSdoc: TStringField;
    QFARSH_DAY_POSexport: TStringField;
    DBGrid3: TDBGrid;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BBRefresh: TBitBtn;
    DBGrid1: TDBGrid;
    QINGR_CONS_POSOSTATOK: TFloatField;
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QPRODUCT_POSAfterScroll(DataSet: TDataSet);
    procedure TabSet1Click(Sender: TObject);
    procedure SBAddProdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBRefresh_FarshDayClick(Sender: TObject);
    procedure SBGetIngrDayClick(Sender: TObject);
    procedure QFARSH_DAY_POSAfterScroll(DataSet: TDataSet);
    procedure QFARSH_DAY_POSBeforeInsert(DataSet: TDataSet);
    procedure BBEditProdClick(Sender: TObject);
    procedure SBDelProdClick(Sender: TObject);
    procedure SP_REPLACE_INGR_CONS_POSBeforeInsert(DataSet: TDataSet);
    procedure SBAddIngrClick(Sender: TObject);
    procedure SBDeIIngrClick(Sender: TObject);
    procedure SBEditGotClick(Sender: TObject);
    procedure BBCalcSebestClick(Sender: TObject);
    procedure BBCreateDocsClick(Sender: TObject);
    procedure SBDelDocsClick(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure BBUnSelectAllClick(Sender: TObject);
    procedure BBUnsetTransmitClick(Sender: TObject);
    procedure DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure QFARSH_DAY_POSCalcFields(DataSet: TDataSet);
    procedure DTPFromChange(Sender: TObject);
    procedure DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_PROD_Carrent:longint;

    procedure ReopenPRODUCT_POS(ID_PROD:longint);
    procedure ReopenNORM_ASSEMB_POS(ID_PROD, ID_NORM:longint);
    procedure Reopen_FARSH_DAY_POS(ID_SER:longint);
    procedure Reopen_INGR_CONS_POS(ID_INGR:longint);
    function ValidIngr():boolean;
    procedure CalcSebest();
  end;

var
  F_Assemb_POS: TF_Assemb_POS;

  function  F_Assemb_POS_Dlg(D_Work:TDateTime):integer;

implementation
uses UDataModule1, myfuncs, users_f, UMainForm, Inp_Prod_POS, DateUtils, Inp_Ingr_POS, Inp_Got_POS;
{$R *.dfm}

function  F_Assemb_POS_Dlg(D_Work:TDateTime):integer;
begin
 F_Assemb_POS:=TF_Assemb_POS.Create(Application);
 with F_Assemb_POS do
 begin
  try
    DTPFrom.DateTime:=D_Work;
    DTPTo.DateTime:=D_Work;


    //  F_main.ID_TRADE_POINT;
      //  F_main.NAME_TRADE_POINT;
    result:=ShowModal;
  finally
   Free;
   F_Assemb_POS:=nil;
  end;
 end;
end;

function TF_Assemb_POS.ValidIngr():boolean;
begin
  result:=True;
  with QINGR_CONS_POS do
  begin
    Disablecontrols;
    First;
    while not Eof do
    begin
      if (FieldByName('N_FACT').AsFloat>Eps) and (FieldByName('PRICE').AsFloat<Eps) then
      begin
        MessageDlg('Не задана цена ингредиента!', mtError, [mbOk], 0);
        result:=False;
        Enablecontrols;
        exit;
      end;

      Next;
    end;  // while not Eof do
    Enablecontrols;
  end; //   with QINGR_CONS_POS do


end;

procedure TF_Assemb_POS.CalcSebest();
var sumIngr, sebest:extended;
begin
  if QFARSH_DAY_POS.FieldByName('N_GOT').AsFloat>Eps then
  begin
    if ValidIngr() then
    begin

      with QINGR_CONS_POS do
      begin
        Disablecontrols;
        sumIngr:=0.0;
        First;
        while not Eof do
        begin
          if FieldByName('N_FACT').AsFloat>Eps then
            sumIngr:=sumIngr+ FieldByName('N_FACT').AsFloat*FieldByName('PRICE').AsFloat;
          Next;
        end;  // while not Eof do
        Enablecontrols;
        sebest:=sumIngr/QFARSH_DAY_POS.FieldByName('N_GOT').AsFloat;
        ADOCommandSetSebest.Parameters.ParamByName('ID_SER').Value:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
        ADOCommandSetSebest.Parameters.ParamByName('SEBEST').Value:=sebest;
        ADOCommandSetSebest.Execute;
        Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
        MessageDlg('Расчет себестоимости выполнен!', mtInformation, [mbOk], 0);
      end; //   with QINGR_CONS_POS do


    end;
  end
  else   MessageDlg('Кол-во готовго продукции должно быть больше нуля!', mtError, [mbOk], 0);

end;

procedure TF_Assemb_POS.DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
{
  if Field.FieldName='PROD_NAME' then
  begin
    if QFARSH_DAY_POS.FieldByName('IS_CALC_SEBEST').AsInteger=0 then
      DBGrid3.Canvas.Font.Color := clRed
    else  DBGrid3.Canvas.Font.Color := clGreen;
  end;
  }
  if Field.FieldName='PROD_NAME' then
  begin
    if (QFARSH_DAY_POS.FieldByName('ID_DOC_INGR').AsInteger=-1)
    and (QFARSH_DAY_POS.FieldByName('IS_CALC_SEBEST').AsInteger=0) then
      DBGrid3.Canvas.Font.Color := clRed
    else
     begin
      if (QFARSH_DAY_POS.FieldByName('ID_DOC_INGR').AsInteger<>-1)
      and (QFARSH_DAY_POS.FieldByName('IS_CALC_SEBEST').AsInteger=1)  then
       DBGrid3.Canvas.Font.Color := clGreen
       else   DBGrid3.Canvas.Font.Color := clBlue;
     end;
  end;

  DBGrid3.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_Assemb_POS.DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
if Field.FieldName='NAME' then
  begin
    if (QINGR_CONS_POS.FieldByName('OSTATOK').AsFloat<=0) then
      DBGrid4.Canvas.Font.Color := clRed

  end;

  DBGrid4.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_Assemb_POS.DTPFromChange(Sender: TObject);
begin
  Reopen_FARSH_DAY_POS(-1);
end;

procedure TF_Assemb_POS.BBCalcSebestClick(Sender: TObject);
begin
  CalcSebest();
end;

procedure TF_Assemb_POS.BBCreateDocsClick(Sender: TObject);
begin
if MessageDlg('Вы уверены, что нужно создать документы на для текущей продукции?'+
' Будут удалены ранее сделанные', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  if QFARSH_DAY_POS.FieldByName('IS_CALC_SEBEST').AsInteger=1 then
  begin
    SP_CREATE_DOC_PRVO_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_CREATE_DOC_PRVO_POS.Parameters.ParamValues['@ID_TRADE_POINT']:=F_main.ID_TRADE_POINT;;
    SP_CREATE_DOC_PRVO_POS.Parameters.ParamValues['@ID_SER']:=
      QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
    SP_CREATE_DOC_PRVO_POS.ExecProc;
    if SP_CREATE_DOC_PRVO_POS.Parameters.ParamValues['@ER']<>0 then
      MessageDlg('Ошибка при создании документов на продукцию!', mtError, [mbOk], 0)
    else  MessageDlg('Документы на продукцию сделаны!', mtInformation, [mbOk], 0);
    Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
  end
  else   MessageDlg('Не сделан расчет себестоимости! Документы создать нельзя!', mtError, [mbOk], 0);
end;

end;

procedure TF_Assemb_POS.BBEditProdClick(Sender: TObject);

var vDATE_P:TDatetime; var vN_PREPARE:extended; var vID_PROD :longint;

begin

if MessageDlg('Вы уверены, что нужно изменить данные о запускаемой продукции?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin

  vDATE_P:=QFARSH_DAY_POS.FieldByName('DATE_P').AsFloat;
  vN_PREPARE:=QFARSH_DAY_POS.FieldByName('N_PREPARE').AsFloat;
  vID_PROD:=QFARSH_DAY_POS.FieldByName('ID_PROD').AsInteger;
  if F_Inp_Prod_POS_Dlg(vDATE_P, vN_PREPARE, vID_PROD )=mrOk  then
  begin
   // удалить изменяемую и вставить новую
    SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ID_SER']:=
      QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
    SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_DELETE_FARSH_DAY_POS.ExecProc;
    if SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ER']=0 then
    begin
      // вставить новую
      SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ID_PROD']:=vID_PROD;
      SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@DATE_P']:=vDATE_P;
      SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@N_PREPARE']:=vN_PREPARE;
      SP_ADD_FARSH_DAY_POS.ExecProc;
      if SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ER']=0 then
      begin
        Reopen_FARSH_DAY_POS(SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ID_SER_NEW']);
      end
      else
        MessageDlg('Ошибка при добавлении продукции!', mtError, [mbOk], 0);
    end
    else
      MessageDlg('Ошибка при удалении продукции!', mtError, [mbOk], 0);
  end;  // if F_Inp_Prod_POS_Dlg(vDATE_P, vN_PREPARE, vID_PROD )=mrOk  then
end;// if MessageDlg('Вы уверены, ч

end;

procedure TF_Assemb_POS.BBRefreshClick(Sender: TObject);
begin
ID_PROD_Carrent:= QPRODUCT_POS.FieldByName('ID_PROD').AsInteger;
ReopenPRODUCT_POS(ID_PROD_Carrent);
end;

procedure TF_Assemb_POS.ReopenPRODUCT_POS(ID_PROD:longint);
begin
  with QPRODUCT_POS do
  begin
    Close;
    Open;
    First;
    if ID_PROD <>-1 then
      Locate('ID_PROD',ID_PROD,[loCaseInsensitive]);
  end;  // with QPRODUCT_POS do

end;


procedure TF_Assemb_POS.Reopen_INGR_CONS_POS(ID_INGR:longint);
begin
  with QINGR_CONS_POS do
  begin
    Close;
    Parameters.ParamByName('ID_SER').Value:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
    Open;
    first;
    if ID_INGR <>-1 then
      Locate('ID_INGR',ID_INGR,[loCaseInsensitive]);
  end;  // with QINGR_CONS_POS do

end;  // procedure TF_Assemb_POS.Reopen_INGR_CONS_POS(ID_INGR:longint);

procedure TF_Assemb_POS.Reopen_FARSH_DAY_POS(ID_SER:longint);
var D_Start_period:TDatetime; D_End_period:TDatetime;
begin
D_Start_period:=StartOfTheDay(DTPFrom.DateTime);
D_End_period:=EndOfTheDay(DTPTo.DateTime);

  with QFARSH_DAY_POS do
  begin
    Close;
    Parameters.ParamByName('D_FROM').Value:=D_Start_period;
    Parameters.ParamByName('D_TO').Value:=D_End_period;
    Open;
    if ID_SER <>-1 then
      Locate('ID_SER',ID_SER,[loCaseInsensitive]);
  end;  // with QFARSH_DAY_POS do

  Reopen_INGR_CONS_POS(-1);

end;  // procedure TF_Assemb_POS.Reopen_FARSH_DAY_POS(ID_SER:longint);


procedure TF_Assemb_POS.SBAddIngrClick(Sender: TObject);
var vN_FACT_Source:extended; vID_TOV_INGR_Dest:longint;
var vN_FACT_Dest: extended;
 mode:integer;
 s:string;
begin
mode:=TSpeedButton(Sender).Tag;

case mode of
  0: s:= 'Вы уверены, что нужно добавить ингредиент?';
  1:  s:= 'Вы уверены, что нужно редактировать ингредиент?';
  2:  s:= 'Вы уверены, что нужно редактировать ингредиент с добавлением нового?';
  3:  s:= 'Вы уверены, что нужно заменить ингредиент другим c обнулением фактического кол-ва?';
end;

if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin


//mode 0 - вставка нового; 1 - редактирование текущего; 2 - редактирование со вставкой; 3 - полная замена текущего
vN_FACT_Source:=QINGR_CONS_POS.FieldByName('N_FACT').AsFloat;

  if  F_Inp_Ingr_POS_Dlg(mode, QINGR_CONS_POS.FieldByName('ID_GRTOV').AsInteger,
     QINGR_CONS_POS.FieldByName('GRUPTOV').AsString,
    QINGR_CONS_POS.FieldByName('NAME').AsString,
    QINGR_CONS_POS.FieldByName('EDIZM').AsString,
    QINGR_CONS_POS.FieldByName('N_NORM').AsFloat,
    vN_FACT_Source,

    vID_TOV_INGR_Dest, vN_FACT_Dest)=mrOk then
  begin
    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@MODE']:=mode;
    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ID_SER']:=QINGR_CONS_POS.FieldByName('ID_SER').AsInteger;

    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ID_INGR_SOURCE']:=QINGR_CONS_POS.FieldByName('ID_INGR').AsInteger;
    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@N_FACT_SOURCE']:=vN_FACT_Source;

    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ID_TOV_DEST']:=vID_TOV_INGR_Dest;
    SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@N_FACT_DEST']:=vN_FACT_Dest;

    SP_REPLACE_INGR_CONS_POS.ExecProc;
    if SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ER']=0 then
    begin
     Reopen_INGR_CONS_POS(SP_REPLACE_INGR_CONS_POS.Parameters.ParamValues['@ID_INGR_NEW']);
    end
    else  MessageDlg('Ошибка при норировании продукции!', mtError, [mbOk], 0);
  end;


  Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);


end;  // if MessageDlg('Вы уверены, что нужно нормировать


end;

procedure TF_Assemb_POS.SBAddProdClick(Sender: TObject);
 var vDATE_P:TDatetime; var vN_PREPARE:extended; var vID_PROD :longint;

begin
    vDATE_P:=StartOfTheDay(DTPFrom.DateTime);
    vDATE_P:=IncHour(vDATE_P, 4) ;


if F_Inp_Prod_POS_Dlg(vDATE_P, vN_PREPARE, vID_PROD )=mrOk  then
begin
  SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ID_USER']:=id_user_select;
  SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ID_PROD']:=vID_PROD;
  SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@DATE_P']:=vDATE_P;
  SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@N_PREPARE']:=vN_PREPARE;
  SP_ADD_FARSH_DAY_POS.ExecProc;
  if SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ER']=0 then
  begin
    Reopen_FARSH_DAY_POS(SP_ADD_FARSH_DAY_POS.Parameters.ParamValues['@ID_SER_NEW']);
  end
  else
    MessageDlg('Ошибка при добавлении продукции!', mtError, [mbOk], 0);

end;

end;

procedure TF_Assemb_POS.SBDeIIngrClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
if MessageDlg('Вы уверены, что нужно удалить ингредиент?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  with QINGR_CONS_POS do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID_INGR').AsInteger;
    prior;
    pred_ID:=FieldByName('ID_INGR').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID_INGR').AsInteger;



    SP_DELETE_INGR_CONS_POS.Parameters.ParamValues['@ID_INGR']:=carrent_ID;
    SP_DELETE_INGR_CONS_POS.Parameters.ParamValues['@ID_USER']:=id_user_select;
    SP_DELETE_INGR_CONS_POS.ExecProc;
    if SP_DELETE_INGR_CONS_POS.Parameters.ParamValues['@ER']=0 then
    begin

      if pred_ID=carrent_ID then // удаляем 1-ю
       Reopen_INGR_CONS_POS(next_ID)
     else
      if next_ID=carrent_ID then // удаляем последнюю
      begin
         Reopen_INGR_CONS_POS(pred_ID);

      end
      else Reopen_INGR_CONS_POS(pred_ID);



    end
    else
      MessageDlg('Ошибка при удалении ингредиента!', mtError, [mbOk], 0);

      EnableControls;
   end; // with QINGR_CONS_POS do
   Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
 end;

end;

procedure TF_Assemb_POS.SBDelDocsClick(Sender: TObject);
begin
if MessageDlg('Вы уверены, что нужно удалить документы на для текущей продукции?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  SP_DELETE_DOC_PRVO_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
  SP_DELETE_DOC_PRVO_POS.Parameters.ParamValues['@ID_SER']:=
    QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
  SP_DELETE_DOC_PRVO_POS.ExecProc;
  if SP_DELETE_DOC_PRVO_POS.Parameters.ParamValues['@ER']<>0 then
    MessageDlg('Ошибка при удалении документов на продукцию!', mtError, [mbOk], 0)
  else  MessageDlg('Документы на продукцию удалены!', mtInformation, [mbOk], 0);
  Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
end;
end;

procedure TF_Assemb_POS.SBDelProdClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
if MessageDlg('Вы уверены, что нужно удалить запускаемую продукцию?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  with QFARSH_DAY_POS do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID_SER').AsInteger;
    prior;
    pred_ID:=FieldByName('ID_SER').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID_SER').AsInteger;



    SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ID_SER']:=carrent_ID;
    SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_DELETE_FARSH_DAY_POS.ExecProc;
    if SP_DELETE_FARSH_DAY_POS.Parameters.ParamValues['@ER']=0 then
    begin

      if pred_ID=carrent_ID then // удаляем 1-ю
       Reopen_FARSH_DAY_POS(next_ID)
     else
      if next_ID=carrent_ID then // удаляем последнюю
      begin
         Reopen_FARSH_DAY_POS(pred_ID);
         Reopen_INGR_CONS_POS(-1);
      end
      else Reopen_FARSH_DAY_POS(pred_ID);



    end
    else
      MessageDlg('Ошибка при удалении продукции!', mtError, [mbOk], 0);

      EnableControls;
   end; // with QFARSH_DAY_POS do
 end;
end;

procedure TF_Assemb_POS.SBGetIngrDayClick(Sender: TObject);
begin
if MessageDlg('Вы уверены, что нужно нормировать запускаемую продукцию? При этом будут удалены замены ингредиентов.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin

  SP_GET_INGR_CONS_POS.Parameters.ParamValues['@ID_SER']:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
  SP_GET_INGR_CONS_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
  SP_GET_INGR_CONS_POS.ExecProc;
  if SP_GET_INGR_CONS_POS.Parameters.ParamValues['@ER']=0 then
  begin
   Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
  end
  else  MessageDlg('Ошибка при норировании продукции!', mtError, [mbOk], 0);
end;  // if MessageDlg('Вы уверены, что нужно нормировать
end;

procedure TF_Assemb_POS.SBEditGotClick(Sender: TObject);
var date_v:TdateTime;
N_GOT:extended;
begin

 date_v := QFARSH_DAY_POS.FieldByName('DATE_V').AsFloat;
 N_GOT :=QFARSH_DAY_POS.FieldByName('N_GOT').AsFloat;
if F_Inp_Got_POS_Dlg( QFARSH_DAY_POS.FieldByName('PROD_NAME').AsString,
  QFARSH_DAY_POS.FieldByName('EDIZM').AsString,
 date_v,N_GOT) =mrOk then
begin
  SP_EDIT_FARSH_DAY_POS.Parameters.ParamValues['@ID_SER']:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
  SP_EDIT_FARSH_DAY_POS.Parameters.ParamValues['@N_GOT']:=N_GOT;
  SP_EDIT_FARSH_DAY_POS.Parameters.ParamValues['@DATE_V']:=date_v;
  SP_EDIT_FARSH_DAY_POS.Parameters.ParamValues['@ID_USER']:=ID_user_select;
  SP_EDIT_FARSH_DAY_POS.ExecProc;
  if SP_EDIT_FARSH_DAY_POS.Parameters.ParamValues['@ER']=0 then
  begin
   Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
  end
  else  MessageDlg('Ошибка при изменении продукции!', mtError, [mbOk], 0);
end;


end;

procedure TF_Assemb_POS.SP_REPLACE_INGR_CONS_POSBeforeInsert(DataSet: TDataSet);
begin
  QINGR_CONS_POS.Cancel;
  Abort;
end;

procedure TF_Assemb_POS.TabSet1Click(Sender: TObject);
begin
 Notebook1.PageIndex:=TabSet1.TabIndex;
end;

// procedure TF_Assemb_POS.ReopenPRODUCT_POS(ID_PROD:longint);


procedure TF_Assemb_POS.BBRefresh_FarshDayClick(Sender: TObject);
begin
   Reopen_FARSH_DAY_POS(QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger);
end;

procedure TF_Assemb_POS.BBSelectAllClick(Sender: TObject);
begin
if QFARSH_DAY_POS.Active then  GridSelectAll(DBGrid3);
end;

procedure TF_Assemb_POS.BBUnSelectAllClick(Sender: TObject);
begin
DBGrid3.SelectedRows.Clear;
end;

procedure TF_Assemb_POS.BBUnsetTransmitClick(Sender: TObject);
var i:integer;
v_ID_SER :longint;
begin
v_ID_SER:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
for i:=0 to DBGrid3.SelectedRows.Count-1 do
begin
  DBGrid3.DataSource.DataSet.GotoBookmark((DBGrid3.SelectedRows.Items[i]));

  // снять отметку о экспорте  отмеченной продукции

    with ADOCommand_Expotr_Ser__null do
    begin
      Parameters.ParamByName('ID_SER').Value:=QFARSH_DAY_POS.FieldByName('ID_SER').AsInteger;
      Execute;
    end;   //    with DM1.ADOCommand_Expotr_null do

end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do
DBGrid3.SelectedRows.Clear;


Reopen_FARSH_DAY_POS(v_ID_SER);
MessageDlg('Признак передачи данных на сервер снят!', mtInformation, [mbOk], 0);

end;

procedure TF_Assemb_POS.FormCreate(Sender: TObject);
begin
  DTPFrom.DateTime:= StartOfTheDay(Date());
  DTPTo.DateTime:=EndOfTheDay(DTPFrom.DateTime);

end;

procedure TF_Assemb_POS.FormShow(Sender: TObject);
begin
  ReopenPRODUCT_POS(-1);
  Reopen_FARSH_DAY_POS(-1);
  TabSet1.TabIndex := 1;
  Notebook1.PageIndex:=TabSet1.TabIndex;
end;

procedure TF_Assemb_POS.QFARSH_DAY_POSAfterScroll(DataSet: TDataSet);
begin
  Reopen_INGR_CONS_POS(-1);
end;

procedure TF_Assemb_POS.QFARSH_DAY_POSBeforeInsert(DataSet: TDataSet);
begin
  QFARSH_DAY_POS.Cancel;
  Abort;
end;

procedure TF_Assemb_POS.QFARSH_DAY_POSCalcFields(DataSet: TDataSet);
begin
if QFARSH_DAY_POSIS_CALC_SEBEST.Value=0 then QFARSH_DAY_POScalc.Value:='Нет'
else QFARSH_DAY_POScalc.Value:='Да';
if QFARSH_DAY_POSID_DOC_GOT.Value=-1 then QFARSH_DAY_POSdoc.Value:='Нет'
else QFARSH_DAY_POSdoc.Value:='Да';
if QFARSH_DAY_POSIS_EXPORT_GOT.Value=0 then QFARSH_DAY_POSexport.Value:='Нет'
else QFARSH_DAY_POSexport.Value:='Да';
end;

procedure TF_Assemb_POS.QPRODUCT_POSAfterScroll(DataSet: TDataSet);
begin
  ReopenNORM_ASSEMB_POS(QPRODUCT_POS.FieldByName('ID_PROD').AsInteger, -1);
end;

procedure TF_Assemb_POS.ReopenNORM_ASSEMB_POS(ID_PROD, ID_NORM:longint);
begin
  with QNORM_ASSEMB_POS do
  begin
    Close;
    Parameters.ParamByName('ID_PROD').Value:=ID_PROD;
    Open;
    First;
    if ID_NORM <>-1 then
      Locate('ID_NORM',ID_NORM,[loCaseInsensitive]);
  end;  // with QNORM_ASSEMB_POS do

end;  // procedure TF_Assemb_POS.ReopenNORM_ASSEMB_POS(ID_PROD, ID_NORM:longint);


end.
