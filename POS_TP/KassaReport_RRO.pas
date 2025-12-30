unit KassaReport_RRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UMainForm, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TF_KassaReport_RRO = class(TForm)
    Panel2: TPanel;
    BBGetShifts: TBitBtn;
    GroupBox5: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    D_From: TDateTimePicker;
    D_To: TDateTimePicker;
    T_From: TDateTimePicker;
    T_To: TDateTimePicker;
    DBNavigator1: TDBNavigator;
    L_Period: TLabel;
    BB_Get_LastShiftTotals: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    S_2KAT: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    S_REAL: TDBText;
    Label3: TLabel;
    SUM_UCEN: TDBText;
    Label4: TLabel;
    SUM_OPL_CARD: TDBText;
    Label5: TLabel;
    SUM_OPL_BONUS: TDBText;
    Label6: TLabel;
    SUM_NAL: TDBText;
    Label19: TLabel;
    SUM_VOZVR_NAL: TDBText;
    Label20: TLabel;
    SUM_KAS: TDBText;
    Label27: TLabel;
    SKIDKA: TDBText;
    Label28: TLabel;
    SKIDKA_KOLBASA: TDBText;
    Label29: TLabel;
    SKIDKA_MYASO: TDBText;
    Label30: TLabel;
    SKIDKA_TNP: TDBText;
    Label31: TLabel;
    ZATRATY: TDBText;
    Label32: TLabel;
    SUM_REAL_TO_PAY: TDBText;
    Label33: TLabel;
    ROUND_SUM: TDBText;
    Label34: TLabel;
    SUM_SDACHI_TO_CARD: TDBText;
    Label35: TLabel;
    SUM_VOZVR_CARD: TDBText;
    Label36: TLabel;
    KASSA_INP: TDBText;
    KASSA_OUT: TDBText;
    Label37: TLabel;
    Label38: TLabel;
    L_Vytorg: TLabel;
    Panel3: TPanel;
    Label41: TLabel;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    DBText6: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    Label16: TLabel;
    DBText15: TDBText;
    Label21: TLabel;
    DBText20: TDBText;
    Label22: TLabel;
    DBText21: TDBText;
    GroupBox4: TGroupBox;
    DBText12: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    DBText13: TDBText;
    Label15: TLabel;
    DBText14: TDBText;
    Label18: TLabel;
    DBText17: TDBText;
    Label25: TLabel;
    Label26: TLabel;
    DBText24: TDBText;
    DBText25: TDBText;
    GroupBox3: TGroupBox;
    DBText9: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    DBText10: TDBText;
    Label12: TLabel;
    DBText11: TDBText;
    Label17: TLabel;
    DBText16: TDBText;
    Label23: TLabel;
    Label24: TLabel;
    DBText22: TDBText;
    DBText23: TDBText;
    Panel5: TPanel;
    GroupBox6: TGroupBox;
    ADOTable_SHIFTS: TADOTable;
    ADOTable_SHIFTSShiftId: TIntegerField;
    ADOTable_SHIFTSOpened: TDateTimeField;
    ADOTable_SHIFTSClosed: TDateTimeField;
    ADOTable_SHIFTSZRepFiscalNum: TWideStringField;
    ADOTable_SHIFTSOpenShiftFiscalNum: TWideStringField;
    ADOTable_SHIFTSCloseShiftFiscalNum: TWideStringField;
    ADOTable_SHIFTSOpenName: TWideStringField;
    ADOTable_SHIFTSOpenSubjectKeyId: TWideStringField;
    ADOTable_SHIFTSCloseName: TWideStringField;
    ADOTable_SHIFTSCloseSubjectKeyId: TWideStringField;
    ADOTable_SHIFTSID_USER: TIntegerField;
    DS_ADOTable_SHIFTS: TDataSource;
    ADOCommandDeleteShifts: TADOCommand;
    DBGrid1: TDBGrid;
    BB_X_REP: TBitBtn;
    RG_Vid_X_REP: TRadioGroup;
    ShapePRRO: TShape;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    DBNavigator2: TDBNavigator;
    BB_Del_Not_Final_Doc: TBitBtn;
    BB_Del_All_Not_Final_Doc: TBitBtn;
    procedure BB_Get_LastShiftTotalsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBGetShiftsClick(Sender: TObject);
    procedure BB_X_REPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure T_FromChange(Sender: TObject);
    procedure T_ToExit(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ADOTable_SHIFTSAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BB_Del_Not_Final_DocClick(Sender: TObject);
    procedure BB_Del_All_Not_Final_DocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_KassaReport_RRO: TF_KassaReport_RRO;

  function F_KassaReport_RRO_Dlg():integer;

implementation

{$R *.dfm}

uses  USERS_F, UDataModule1, DateUtils;

function F_KassaReport_RRO_Dlg():integer;
begin
 F_KassaReport_RRO:=TF_KassaReport_RRO.Create(Application);
 with F_KassaReport_RRO do
 begin

  D_From.Date:=F_main.D_Work.Date;
  D_To.Date:=F_main.D_Work.Date;
  try
    if F_main.SHOW_FISCAL_REP=1 then // ѕоказывать фискальные отчеты 0-нет 1-да
    begin
      BB_Get_LastShiftTotals.Visible:=F_main.IS_RECEPT_TO_REGISTR_RRO;
      RG_Vid_X_REP.Visible:= not F_main.IS_RECEPT_TO_REGISTR_RRO;
      if F_main.IS_RECEPT_TO_REGISTR_RRO then  RG_Vid_X_REP.ItemIndex:=1
      else RG_Vid_X_REP.ItemIndex:=0;
    end
    else
    begin
      BB_Get_LastShiftTotals.Visible:=False;
      RG_Vid_X_REP.Visible:= False;
      RG_Vid_X_REP.ItemIndex:=5;
    end;
    if F_main.IS_RECEPT_TO_REGISTR_RRO then
    ShapePRRO.Brush.Color:=clRed
    else ShapePRRO.Brush.Color:=clGreen;

    L_Period.Caption:='';
    L_Vytorg.Caption:='';
   result:=ShowModal;
  finally
   FreeAndNil(F_KassaReport_RRO);
  end;
 end;
end;

procedure TF_KassaReport_RRO.ADOTable_SHIFTSAfterScroll(DataSet: TDataSet);
begin
  DBGrid1.SelectedRows.Clear;
  DBGrid1.SelectedRows.CurrentRowSelected := True;
end;

procedure TF_KassaReport_RRO.BBGetShiftsClick(Sender: TObject);
var vShifts :  TShifts;
count_Shifts, i:integer;
d1,d2:Tdatetime;
var Save_Cursor:TCursor;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  ADOTable_SHIFTS.Close;
  ADOTable_SHIFTS.Filter :='';
  ADOCommandDeleteShifts.Parameters.ParamByName('ID_USER').Value:=ID_user_select;
  ADOCommandDeleteShifts.Execute;
  ADOTable_SHIFTS.Open;
  ADOTable_SHIFTS.DisableControls;
   // перечень смен за период
   SetLength(vShifts,0);
   try
    F_Main.Shifts(False, D_From.DateTime, D_To.DateTime, vShifts);
    count_Shifts:=Length(vShifts);
   except
    count_Shifts:=0;
   end;
   if count_Shifts>0 then
   begin
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
   end
   else
   begin

      F_Main.Table_D_START_SMEN.Open;
      F_Main.Table_D_START_SMEN.First;
      d1:=F_Main.Table_D_START_SMEN.FieldByName('D_START_SMENY').AsDateTime;
      d2:=0;
      F_Main.Table_D_START_SMEN.Close;

       ADOTable_SHIFTS.Insert;
       ADOTable_SHIFTS.FieldByName('ID_USER').AsInteger:=ID_user_select;
       ADOTable_SHIFTS.FieldByName('ShiftId').AsInteger:=-1;
       ADOTable_SHIFTS.FieldByName('OpenShiftFiscalNum').AsString:='';
       ADOTable_SHIFTS.FieldByName('CloseShiftFiscalNum').AsString:='';
       ADOTable_SHIFTS.FieldByName('Opened').AsFloat:=d1;
       ADOTable_SHIFTS.FieldByName('OpenName').AsString:='';
       ADOTable_SHIFTS.FieldByName('OpenSubjectKeyId').AsString:='';
       ADOTable_SHIFTS.FieldByName('Closed').AsFloat:=d2;
       ADOTable_SHIFTS.FieldByName('CloseName').AsString:='';
       ADOTable_SHIFTS.FieldByName('CloseSubjectKeyId').AsString:='';
       ADOTable_SHIFTS.FieldByName('ZRepFiscalNum').AsString:='';
       ADOTable_SHIFTS.Post;


   end;
   ADOTable_SHIFTS.Filtered:=True;
   ADOTable_SHIFTS.Filter := '(ID_USER= ' + IntToStr(ID_user_select) + ')';
   ADOTable_SHIFTS.Last;

   ADOTable_SHIFTS.EnableControls;
   Screen.Cursor := Save_Cursor;
   L_Period.Caption:='';
   L_Vytorg.Caption:='';
end;

procedure TF_KassaReport_RRO.BB_Del_All_Not_Final_DocClick(Sender: TObject);
begin
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=-1;
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_USER').Value:=id_user_select;
 F_Main.ADOCommandDeleteNotFinalDoc.Execute;
 F_main.Q_NotFinalDoc.Close;
 F_main.Q_NotFinalDoc.Open;

end;

procedure TF_KassaReport_RRO.BB_Del_Not_Final_DocClick(Sender: TObject);
begin
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=
  F_Main.Q_NotFinalDoc.FieldByName('ID_NAKLCAP').AsInteger;
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_USER').Value:=id_user_select;
 F_Main.ADOCommandDeleteNotFinalDoc.Execute;
 F_main.Q_NotFinalDoc.Close;
 F_main.Q_NotFinalDoc.Open;
end;

procedure TF_KassaReport_RRO.BB_Get_LastShiftTotalsClick(Sender: TObject);
begin
  F_Main.LastShiftTotals(False,True);
end;

procedure TF_KassaReport_RRO.BB_X_REPClick(Sender: TObject);
var Save_Cursor:TCursor;
d1,d2:Tdatetime;
s:string;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  L_Period.Caption:='';
  L_Vytorg.Caption:='';
  with DM1.QKassaReport_RRO do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('ID_USER').Value:=id_user_select;
    Parameters.ParamByName('IS_REGISTER_RRO').Value:=RG_Vid_X_REP.ItemIndex;
    if RG_Vid_X_REP.ItemIndex<=2 then
    begin
      d1:=ADOTable_SHIFTS.FieldByName('Opened').AsFloat;
      d2:=ADOTable_SHIFTS.FieldByName('Closed').AsFloat;
    end
    else
    begin
      d1:=D_From.DateTime;
      d2:=D_To.DateTime;
    end;

    if d2=0 then d2:=Now;


    Parameters.ParamByName('D_From').Value:=d1;
    Parameters.ParamByName('D_To').Value:=d2;
    L_Period.Caption:=Format(RG_Vid_X_REP.Items[RG_Vid_X_REP.ItemIndex]+' (операции за период с %s по %s)', [DateTimeToStr(d1),DateTimeToStr(d2)]);
    Open;
    L_Vytorg.Caption:=Format('%.2f',[
     FieldByName('SUM_OPL_CARD').AsFloat+
     FieldByName('SUM_NAL').AsFloat-
     FieldByName('SUM_VOZVR_NAL').AsFloat-
     FieldByName('SUM_VOZVR_CARD').AsFloat
        ]);
    EnableControls;
  end;
  Screen.Cursor := Save_Cursor;


end;

procedure TF_KassaReport_RRO.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.SelectedRows.Clear;
  DBGrid1.SelectedRows.CurrentRowSelected := True;
end;

procedure TF_KassaReport_RRO.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if (DBgrid1.SelectedRows.CurrentRowSelected) or (gdSelected in State) then
  begin
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.Brush.Color :=   $f8efd5;// Photoshop  d5eff8
  end;

  if Field.FieldName='Closed' then
  begin

    if DBGrid1.DataSource.DataSet.FieldByName('Closed').AsFloat<>0 then
      DBGrid1.Canvas.Font.Color := clRed;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_KassaReport_RRO.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM1.QKassaReport_RRO.Close;
  ADOTable_SHIFTS.Close;
  F_main.Q_NotFinalDoc.Close;
end;

procedure TF_KassaReport_RRO.FormCreate(Sender: TObject);
begin
  if not F_main.Q_NotFinalDoc.Active then  F_main.Q_NotFinalDoc.Open;
end;

procedure TF_KassaReport_RRO.FormShow(Sender: TObject);
begin
  if F_main.RRO_ENABLED=1 then  BBGetShiftsClick(Sender)
  else
  begin
    RG_Vid_X_REP.ItemIndex:=5;
    BB_Get_LastShiftTotals.Visible:=False;
    RG_Vid_X_REP.Visible:=False;
  end;
  BB_X_REPClick(Sender);
end;

procedure TF_KassaReport_RRO.T_FromChange(Sender: TObject);
begin
D_From.Time:=T_From.Time;
end;

procedure TF_KassaReport_RRO.T_ToExit(Sender: TObject);
begin
D_To.Time:=T_To.Time;
end;

end.
