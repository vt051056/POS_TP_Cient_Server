unit Inp_EXCISE_BAR_CODE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Inp_EXCISE_BAR_CODE = class(TForm)
    E_EXCISE_BAR_CODE: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Inp_EXCISE_BAR_CODE: TF_Inp_EXCISE_BAR_CODE;
  function  F_Inp_EXCISE_BAR_CODE_Dlg( var EXCISE_BAR_CODE: string):integer;

implementation

{$R *.dfm}

function  F_Inp_EXCISE_BAR_CODE_Dlg( var EXCISE_BAR_CODE: string):integer;
var s_code_keyboard_layout_old:string;
begin
 F_Inp_EXCISE_BAR_CODE:=TF_Inp_EXCISE_BAR_CODE.Create(Application);
 with F_Inp_EXCISE_BAR_CODE do
 begin
  try
    // для правильного сканирования штрихкода акцизной марки с латинскими символами
    SetLength(s_code_keyboard_layout_old, KL_NAMELENGTH);
    // получить исходную раскладку 00000419-русская;  00000409-английская
    GetKeyboardLayoutName(PChar(s_code_keyboard_layout_old));
    //Переключение на английскую раскладку.
    LoadKeyboardLayout('00000409', KLF_ACTIVATE);

    result:=ShowModal;
    if result=mrOk then
    begin
     EXCISE_BAR_CODE:=Trim(E_EXCISE_BAR_CODE.Text);
    
    end
    else
    begin
     EXCISE_BAR_CODE:='';

    end
  finally
  //Переключение на исходную раскладку
    LoadKeyboardLayout(s_code_keyboard_layout_old, KLF_ACTIVATE);
   Free;
   F_Inp_EXCISE_BAR_CODE:=nil;
  end;
 end;
end;

end.
