unit Inp_Got_POS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TF_Inp_Got_POS = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    DTPGotDay: TDateTimePicker;
    DTPGotTime: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    E_N_GOT: TEdit;
    E_TOV: TEdit;
    E_Edizm: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DTPGotDayExit(Sender: TObject);
    procedure DTPGotTimeExit(Sender: TObject);
    procedure DTPGotTimeChange(Sender: TObject);
    procedure DTPGotDayChange(Sender: TObject);
  private
    { Private declarations }
  public
    N_GOT:extended;
    { Public declarations }
  end;

var
  F_Inp_Got_POS: TF_Inp_Got_POS;
function  F_Inp_Got_POS_Dlg( vTov: string; vEdizm:string; var vDATE_V:TDatetime; var vN_GOT:extended ):integer;

implementation
 uses  myfuncs;
{$R *.dfm}

function  F_Inp_Got_POS_Dlg(  vTov: string; vEdizm:string; var vDATE_V:TDatetime; var vN_GOT:extended ):integer;
begin
 F_Inp_Got_POS:=TF_Inp_Got_POS.Create(Application);
 with F_Inp_Got_POS do
 begin
  try
    DTPGotDay.DateTime:=vDATE_V;
    DTPGotTime.Time:=DTPGotDay.Time;

    N_GOT:=vN_GOT;
    E_N_GOT.Text:=FloatToStr(N_GOT);

    E_TOV.Text:= vTov;
    E_Edizm.Text:= vEdizm;
    result:=ShowModal;
    if result=mrOk then
    begin
     vDATE_V:=DTPGotDay.Datetime;
     vN_GOT := N_GOT;

    end
    else
    begin
     vDATE_V:=0;
     vN_GOT := 0;

    end
  finally
   Free;
   F_Inp_Got_POS:=nil;
  end;
 end;
end;

procedure TF_Inp_Got_POS.DTPGotDayChange(Sender: TObject);
begin
 DTPGotDay.Time:=DTPGotTime.Time;
end;

procedure TF_Inp_Got_POS.DTPGotDayExit(Sender: TObject);
begin
 DTPGotDay.Time:=DTPGotTime.Time;
end;

procedure TF_Inp_Got_POS.DTPGotTimeChange(Sender: TObject);
begin
 DTPGotDay.Time:=DTPGotTime.Time;
end;

procedure TF_Inp_Got_POS.DTPGotTimeExit(Sender: TObject);
begin
 DTPGotDay.Time:=DTPGotTime.Time;
end;

procedure TF_Inp_Got_POS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if modalResult=mrOk then
  begin
     try
      N_GOT:=StrToFloat(E_N_GOT.Text);

      if N_GOT<Eps then
      begin
        MessageDlg('Количество должно быть больше нуля!', mtError,[mbOk], 0);
        E_N_GOT.SetFocus;
        CanClose:=False;
      end;
     except
      MessageDlg('Количество не число!', mtError,[mbOk], 0);
      E_N_GOT.SetFocus;
      CanClose:=False;
     end;

  end;
end;

end.
