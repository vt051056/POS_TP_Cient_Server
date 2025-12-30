unit Invent_Confirm_Dlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TF_Invent_Confirm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    E_TOT_SUM: TEdit;
    E_TOT_NUM: TEdit;
    QUsers: TADOQuery;
    CB_1: TComboBox;
    CB_2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    BB_CANCEL: TBitBtn;
    BB_OK: TBitBtn;
    Command_ConfirmInvent: TADOCommand;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_NAKLCAP: longint;
    is_confirm_1,is_confirm_2 :boolean;
  end;

var
  F_Invent_Confirm: TF_Invent_Confirm;

  function F_Invent_Confirm_Dlg(vID_NAKLCAP: longint; vTOT_SUM, vTOT_NUM:extended):integer;
const C_CB_TEXT='Выбор из списка';
implementation

{$R *.dfm}
uses  USERS_F, UDataModule1;


function F_Invent_Confirm_Dlg(vID_NAKLCAP: longint; vTOT_SUM, vTOT_NUM:extended):integer;
begin
 F_Invent_Confirm:=TF_Invent_Confirm.Create(Application);
 with F_Invent_Confirm do
 begin
  ID_NAKLCAP:=vID_NAKLCAP;
  E_TOT_SUM.Text:=Format('%8.2f', [vTOT_SUM]);
  E_TOT_NUM.Text:=Format('%8.2f', [vTOT_NUM]);
  try
    result:=ShowModal;
  finally
   FreeAndNil(F_Invent_Confirm);
  end;
 end;
end;

procedure TF_Invent_Confirm.BitBtn1Click(Sender: TObject);
begin
  if CB_1.Text=C_CB_TEXT then
  begin
     MessageDlg('Не выбран продавец!', mtError, [mbOk], 0);
     CB_1.SetFocus;
     Exit;
  end;

  is_confirm_1:=True;
  BitBtn1.Caption:=BitBtn1.Caption+' - Подтверждено';
  BitBtn1.Enabled:=False;
  BB_OK.Enabled:= is_confirm_1 and is_confirm_2;
end;

procedure TF_Invent_Confirm.BitBtn2Click(Sender: TObject);
begin
  if CB_2.Text=C_CB_TEXT then
  begin
     MessageDlg('Не выбран продавец!', mtError, [mbOk], 0);
     CB_2.SetFocus;
     Exit;
  end;
  is_confirm_2:=True;
  BitBtn2.Caption:=BitBtn2.Caption+' - Подтверждено';
  BitBtn2.Enabled:=False;
  BB_OK.Enabled:= is_confirm_1 and is_confirm_2;
end;

procedure TF_Invent_Confirm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modalResult=mrOk then
  begin
    Command_ConfirmInvent.Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
    Command_ConfirmInvent.Parameters.ParamByName('USER1').Value:=CB_1.Text;
    Command_ConfirmInvent.Parameters.ParamByName('USER2').Value:=CB_2.Text;
    Command_ConfirmInvent.Execute;
  end;
end;

procedure TF_Invent_Confirm.FormCreate(Sender: TObject);
begin
  is_confirm_1:=False;
  is_confirm_2:=False;
  BB_OK.Enabled:= is_confirm_1 and is_confirm_2;
  CB_1.Text:=C_CB_TEXT;
  CB_2.Text:=C_CB_TEXT;
  with QUsers do
  begin
    Close;
    Open;
    while not Eof do
    begin
      CB_1.Items.Add(FieldByName('NAME').AsString);
      CB_2.Items.Add(FieldByName('NAME').AsString);
      Next;
    end;
    Close;
  end;
end;

end.
