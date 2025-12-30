unit U_InpBank_Transaction_info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Touch.Keyboard, Vcl.ExtCtrls;

type
  TFInpBank_Transaction_info = class(TForm)
    Panel1: TPanel;
    E_CODE_TRANSACTION: TEdit;
    Label5: TLabel;
    E_Card_nn: TEdit;
    E_Shadow_Card: TEdit;
    Label3: TLabel;
    CB_PaySystem: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    BB_Cancel: TBitBtn;
    BBRetry: TBitBtn;
    BB_OK: TBitBtn;
    Panel3: TPanel;
    TouchKeyboard1: TTouchKeyboard;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInpBank_Transaction_info: TFInpBank_Transaction_info;

function  FInpBank_Transaction_infoDlg(var vPaySystem, vCARD_NN, vCODE_TRANSACTION:string):integer;


implementation

{$R *.dfm}
function  FInpBank_Transaction_infoDlg(var vPaySystem, vCARD_NN, vCODE_TRANSACTION:string):integer;
var Save_Cursor:TCursor;
begin
 FInpBank_Transaction_info:=TFInpBank_Transaction_info.Create(Application);
 with FInpBank_Transaction_info do
 begin
   result:=ShowModal;
   if result=mrOk then
   begin
    vPaySystem:=Trim(CB_PaySystem.Text);
    vCARD_NN:=Trim(E_Card_nn.Text+E_Shadow_Card.Text+'M');
    vCODE_TRANSACTION:=Trim(E_CODE_TRANSACTION.Text+'M');
    if (vPaySystem<>'') and (vCARD_NN<>'') and (vCODE_TRANSACTION<>'') then
      result:=mrOk
    else  result:=mrCancel;

   end;
   FreeAndNil(FInpBank_Transaction_info);
  end;

end;

procedure TFInpBank_Transaction_info.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if modalResult=mrOk then
  if MessageDlg(Format('Введенная информация верна? Карта № %s; Таранзакция %s',
    [E_Card_nn.Text, E_CODE_TRANSACTION.Text]),
        mtInformation, [mbYes, mbNo], 0)= mrNo then CanClose:=False;
end;

procedure TFInpBank_Transaction_info.FormCreate(Sender: TObject);
begin
  CB_PaySystem.ItemIndex:=0;
  E_Card_nn.Text:='';
  E_CODE_TRANSACTION.Text:='';
end;

end.
