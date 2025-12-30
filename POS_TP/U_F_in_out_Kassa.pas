unit U_F_in_out_Kassa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_In_Out_Kassa = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    sum_IN_OUT:extended;
    isIn :boolean;
    vIS_ALCOGOL:integer;
  end;

var
  F_In_Out_Kassa: TF_In_Out_Kassa;

  function  F_In_Out_KassaDlg( vIS_ALCOGOL_CHECK: integer; is_In:boolean; var sumInOut:extended):integer;

implementation
uses UMainForm, myFuncs;

{$R *.dfm}
function  F_In_Out_KassaDlg( vIS_ALCOGOL_CHECK: integer; is_In:boolean; var sumInOut:extended):integer;
begin
 F_In_Out_Kassa:=TF_In_Out_Kassa.Create(Application);
 with F_In_Out_Kassa do
 begin
  try
   if is_In then Label1.Caption:='Сумма внесения в кассу'
   else Label1.Caption:='Сумма изъятия из кассы';
   isIn:=is_In;
   vIS_ALCOGOL:=vIS_ALCOGOL_CHECK;
   if vIS_ALCOGOL =1 then
    Label2.Caption:=Format('Сумма расчетного остатка в кассе %8.2f!',[F_main.ostat_kassy_ALCOGOL])
   else Label2.Caption:=Format('Сумма расчетного остатка в кассе %8.2f!',[F_main.ostat_kassy]);
   sum_IN_OUT:=sumInOut;
   Edit1.Text:=FloatToStr(sum_IN_OUT);
   result:=ShowModal;
   if result=mrOk then  sumInOut:=sum_IN_OUT;

  finally

   FreeAndNil(F_In_Out_Kassa);
  end;
 end;
end;

procedure TF_In_Out_Kassa.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key='.' then Key:=',';
  if Not (Key in ['0'..'9', #8,',',#45])then Key:=#0;
end;

procedure TF_In_Out_Kassa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  try
    sum_IN_OUT:=StrToFloat(Trim(Edit1.Text));
    if not isIn then  // проверка на изьятие не более остатка
    begin
      if vIS_ALCOGOL=1 then
      begin
        if (sum_IN_OUT-F_main.ostat_kassy_ALCOGOL)>Eps then
        begin
          MessageDlg(Format('Сумма более расчетного остатка в кассе %8.2f!',[F_main.ostat_kassy_ALCOGOL]), mtError, [mbOk], 0);
          Edit1.SetFocus;
          CanClose:=False;
        end;
      end
      else
      begin
        if (sum_IN_OUT-F_main.ostat_kassy)>Eps then
        begin
          MessageDlg(Format('Сумма более расчетного остатка в кассе %8.2f!',[F_main.ostat_kassy]), mtError, [mbOk], 0);
          Edit1.SetFocus;
          CanClose:=False;
        end;
      end;


    end;


  except
     MessageDlg('Сумма не число!', mtError, [mbOk], 0);
     Edit1.SetFocus;
     CanClose:=False;
  end;

end;

end.
