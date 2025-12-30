unit KassaReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, uPosAPI,
  UMainForm;

type
  TF_KassaReport = class(TForm)
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
    GroupBox2: TGroupBox;
    DBText6: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    GroupBox3: TGroupBox;
    DBText9: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    DBText10: TDBText;
    Label12: TLabel;
    DBText11: TDBText;
    GroupBox4: TGroupBox;
    DBText12: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    DBText13: TDBText;
    Label15: TLabel;
    DBText14: TDBText;
    Label16: TLabel;
    DBText15: TDBText;
    Label17: TLabel;
    DBText16: TDBText;
    Label18: TLabel;
    DBText17: TDBText;
    Label19: TLabel;
    SUM_VOZVR_NAL: TDBText;
    Label20: TLabel;
    SUM_KAS: TDBText;
    Label21: TLabel;
    DBText20: TDBText;
    Label22: TLabel;
    DBText21: TDBText;
    Label23: TLabel;
    Label24: TLabel;
    DBText22: TDBText;
    DBText23: TDBText;
    Label25: TLabel;
    Label26: TLabel;
    DBText24: TDBText;
    DBText25: TDBText;
    Label27: TLabel;
    SKIDKA: TDBText;
    Label28: TLabel;
    SKIDKA_KOLBASA: TDBText;
    Label29: TLabel;
    SKIDKA_MYASO: TDBText;
    Label30: TLabel;
    SKIDKA_TNP: TDBText;
    BBClose: TBitBtn;
    Label31: TLabel;
    ZATRATY: TDBText;
    GroupBox7: TGroupBox;
    BB_Z_Report: TBitBtn;
    BB_X_Report: TBitBtn;
    BB_Open_Cash_Box_Fiscal: TBitBtn;
    GroupBox5: TGroupBox;
    E_In_Cash: TEdit;
    BB_In_Cash: TBitBtn;
    GroupBox6: TGroupBox;
    E_Out_Cash: TEdit;
    BB_Out_Cash: TBitBtn;
    GroupBox8: TGroupBox;
    BBCloseDay_Fiscal: TBitBtn;
    BBCloseDay_NotFiscal: TBitBtn;
    Memo1: TMemo;
    BB_Tov_Report: TBitBtn;
    Label32: TLabel;
    SUM_REAL_TO_PAY: TDBText;
    Label33: TLabel;
    ROUND_SUM: TDBText;
    Label34: TLabel;
    SUM_SDACHI_TO_CARD: TDBText;
    Label35: TLabel;
    SUM_VOZVR_CARD: TDBText;
    procedure BBCloseClick(Sender: TObject);
    procedure BB_Z_ReportClick(Sender: TObject);
    procedure BB_X_ReportClick(Sender: TObject);
    procedure BB_In_CashClick(Sender: TObject);
    procedure BB_Out_CashClick(Sender: TObject);
    procedure BB_Open_Cash_Box_FiscalClick(Sender: TObject);
    procedure BBCloseDay_NotFiscalClick(Sender: TObject);
    procedure BBCloseDay_FiscalClick(Sender: TObject);
    procedure BB_Tov_ReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintResponse(handle: POS_HANDLE);
    function Bank_Terminal_CloseDay(PORT:string):boolean;
  end;

var
  F_KassaReport: TF_KassaReport;

  function  F_KassaReportDlg(Z_REP:TZ_REP):integer;

implementation

{$R *.dfm}

uses  UDataModule1, USERS_F, CShPorts_TLB, Print_Functions, myfuncs;

function  F_KassaReportDlg(Z_REP:TZ_REP):integer;
var Save_Cursor:TCursor;
begin
 F_KassaReport:=TF_KassaReport.Create(Application);
 with F_KassaReport do
 begin
  Memo1.Clear;
  try
    Save_Cursor:=Screen.Cursor;
    Screen.Cursor := crSQLWait;
    with DM1.QKassaRepotr do
    begin
      DisableControls;
      Close;
      Parameters.ParamByName('ID_USER').Value:=id_user_select;
      Parameters.ParamByName('D_From').Value:=F_main.D_From.DateTime;
      Parameters.ParamByName('D_To').Value:=F_main.D_To.DateTime;
      if F_main.IS_RECEPT_TO_REGISTR_RRO then
            Parameters.ParamByName('IS_REGISTER_RRO_ONLY').Value:=1
      else Parameters.ParamByName('IS_REGISTER_RRO_ONLY').Value:=0;
      Open;
      EnableControls;

    end;
    Screen.Cursor := Save_Cursor;
   result:=ShowModal;
  finally
   FreeAndNil(F_KassaReport);
  end;
 end;
end;


procedure TF_KassaReport.PrintResponse(handle: POS_HANDLE);
var
par: array[0..20] of char;
val: array[0..10240] of char;
res: ByteBool;
s1,s2:string;
i:integer;

begin
  if (pos_get_first(handle, @par[0], sizeof(par), @val[0], sizeof(val)) = true) then
  begin
    repeat
      s1:='';
      s2:='';
      s1:=StrOemToAnsi(string(par));
      s2:=StrOemToAnsi(String(val));
      Memo1.Lines.Add(Format('%s = %s', [s1, s2]));
      res := pos_get_next(handle, @par[0], sizeof(par), @val[0], sizeof(val));
    until (res = false);
  end;

  Memo1.Lines.Add('');
end;


function TF_KassaReport.Bank_Terminal_CloseDay(PORT:string):boolean;
var
handle: POS_HANDLE;
loop: ByteBool;
resp: integer;
timeout: integer;
val: array[0..10240] of char;

s_opl, s1,s2:string;
r:boolean;

begin
//  PanelBankTerm.Height:=150;
  result:=False;
  Memo1.Clear;
  handle := POS_NONE;
  If not pos_open(handle, PAnsiChar(AnsiString(PORT))) then
  begin
    MessageDlg(Format('Не могу открыть порт терминала %s !',[PORT]), mtError, [mbOk], 0);
    Exit;
  end;


  // хост ФОП Лавреновой Т О из настроек терминала
 //  pos_set(handle, POS_PROFILE, PAnsiChar('P0001027.P0001027.V211101220111.15.5.50.5.8,12.9'));
  // хост ФОП Ермакова  из настроек терминала
  //   pos_set(handle, POS_PROFILE, PAnsiChar('P0011110.P0011110.V211101220111.15.5.50.5.8,12.9'));
  if not pos_send(handle, ACTION_CLOSE_DAY) then
  begin
    MessageDlg('Не могу передать терминалу команду закрытия дня!', mtError, [mbOk], 0);
    Exit;
  end;


  loop := true;
  timeout := 180000; { 3 min }
  while (loop) do begin
    resp := pos_receive(handle, timeout);

    case (resp) of
      RESP_TIMEOUT:
        begin
          Memo1.Lines.Add('Время ожидания истекло!');
        end; //  RESP_TIMEOUT:
      RESP_BREAK:
        begin
          Memo1.Lines.Add('Сброс');
          loop := false;
        end;   // RESP_BREAK:
      RESP_CONFIRM:
        begin
          Memo1.Lines.Add('Операция успешна!');

          result:=True;
          loop := false;
        end;  //  RESP_CONFIRM:

      RESP_DECLINE:
        begin
          Memo1.Lines.Add('Операция отклонена');
          PrintResponse(handle);
          loop := false;
        end;  //  RESP_DECLINE:
      RESP_MESSAGE:
        begin
          Memo1.Lines.Add('Сообщение');
          PrintResponse(handle);
        end;  // RESP_MESSAGE:
      RESP_IDENTIFIER:
        begin
          Memo1.Lines.Add('Идентификация');
          PrintResponse(handle);
        end;  // RESP_IDENTIFIER:
    end;  //  case (resp) of
  end; // while (loop) do begin

  pos_Close(handle);


end;


procedure TF_KassaReport.BBCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TF_KassaReport.BBCloseDay_FiscalClick(Sender: TObject);

var Save_Cursor:TCursor;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  if F_KassaReport.Bank_Terminal_CloseDay(F_Main.COM_PORT_BANK_TERM_FISCAL) then
  begin
   Screen.Cursor := Save_Cursor;
   MessageDlg('Операция закрытия дня выполнена успешно!', mtInformation,[mbOk], 0);
  end
  else
  begin
    Screen.Cursor := Save_Cursor;
    MessageDlg('Операция закрытия дня не выполнена!', mtError,[mbOk], 0);
  end;
end;

procedure TF_KassaReport.BBCloseDay_NotFiscalClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  if F_KassaReport.Bank_Terminal_CloseDay(F_Main.COM_PORT_BANK_TERM_NOT_FISCAL) then
  begin
   Screen.Cursor := Save_Cursor;
   MessageDlg('Операция закрытия дня выполнена успешно!', mtInformation,[mbOk], 0);
  end
  else
  begin
    Screen.Cursor := Save_Cursor;
    MessageDlg('Операция закрытия дня не выполнена!', mtError,[mbOk], 0);
  end;
end;

procedure TF_KassaReport.BB_In_CashClick(Sender: TObject);
var sum_val:Extended;
begin
  try
   sum_val:=StrToFloat(E_In_Cash.Text);
   Sum_Round(0.1,  sum_val);
  except
   MessageDlg('Сумма внесения не число!', mtError,[mbOk], 0);
   exit;
  end;

  In_Cash_Box_Fiscal(sum_val);

end;

procedure TF_KassaReport.BB_Out_CashClick(Sender: TObject);
var sum_val:Extended;
begin
  try

   sum_val:=(-1)*StrToFloat(E_Out_Cash.Text);
   Sum_Round(0.1,  sum_val);
  except
   MessageDlg('Сумма изъятия не число!', mtError,[mbOk], 0);
   exit;
  end;

  Out_Cash_Box_Fiscal(sum_val);
 
end;

procedure TF_KassaReport.BB_Tov_ReportClick(Sender: TObject);
begin
  Tov_Report;
end;

procedure TF_KassaReport.BB_X_ReportClick(Sender: TObject);
begin
  X_Report;
end;




procedure TF_KassaReport.BB_Z_ReportClick(Sender: TObject);
begin
if MessageDlg('Вам действительно необходимо сделать Z-отчет? Он делается в конце смены!', mtWarning,
      [mbNo, mbYes], 0)= mrYes then
begin
  Z_Report;
end;
end;


procedure TF_KassaReport.FormCreate(Sender: TObject);
begin
  if F_Main.IS_EXIST_ALCO_KASSA=1 then // есть Алкогольная касса
  begin
    BBCloseDay_NotFiscal.Visible:=True;
    BBCloseDay_Fiscal.Visible:=True;
  end
  else
  begin
    BBCloseDay_NotFiscal.Visible:=True;
    BBCloseDay_Fiscal.Visible:=False;
  end
end;

procedure TF_KassaReport.BB_Open_Cash_Box_FiscalClick(Sender: TObject);
begin
  Open_Cash_Box_Fiscal;
end;

end.
