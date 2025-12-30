unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPosApi, Data.DB,
  Data.Win.ADODB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ADO_TERMINAL_RESP: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TerminaleResponce(a :string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure test;
    procedure PrintResponse(handle: POS_HANDLE);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



{    // рабочая
function StrOemToAnsi(const S_source : String) : String;
var
  Len,i : Integer;
  S: array[0..255] of char;
begin
  for i := 0 to Length(S) do  S[i]:=#0;

  Len := Length(S_source);
  OemToCharBuffW(PAnsiChar(@S_source[1]),@S, Len);
  Result:=S;
end;

  }

function StrOemToAnsi(const S_source : String) : String;
const
  BUF_SZ = 255;
var
  i : Integer;

  uniBuf: array [0..BUF_SZ - 1] of WideChar;
begin
  MultiByteToWideChar(CP_ACP,     // кодовая страница CP_OEMCP=OEM code page(для DOS->WinUni), CP_ACP=ANSI code page (для DOS->DosUni)
                      0,            // параметры
                      PAnsiChar(@S_source[1]),       // исходная строка
                      BUF_SZ,       // и ее длина
                      uniBuf,       // unicode-буфер
                      BUF_SZ);    // и его размер

  Result:=uniBuf;
end;





procedure TForm1.Button2Click(Sender: TObject);
var S_source, S_dect:string;
var S: array[0..255] of char;
  Len, Len1 : Integer;
begin
  S_source:='獭彧楴汴e䓯U䓷U';
  S_dect:=StrOemToAnsi(S_source);
 //  Len := Length(S_source);
 // OemToCharBuffW(PAnsiChar(@S_source[1]),@S, Len);

 // Len1 := Length(S);
   Edit1.Text:= S_dect;
  S_source:='쿎샋샒';
 //  Len := Length(S_source);
//  OemToCharBuffW(PAnsiChar(@S_source[1]),@S, Len);

//  Len1 := Length(S);
 // S_dect:=StrOemToAnsi(S_source);
 S_dect:=StrOemToAnsi(S_source);
   Edit2.Text:= S_dect;


end;



procedure TForm1.TerminaleResponce(a :string);
   begin
    with ADO_TERMINAL_RESP do
      begin
      open;
      insert;

      fieldbyname('responce').AsString := a;
           post;
           close;
      end;
   end;

procedure TForm1.PrintResponse(handle: POS_HANDLE);
var
par: array[0..20] of char;
val: array[0..10240] of char;
res: ByteBool;
s1,s2:string;
i:integer;

begin

//for i := 0 to Length(par) do  par[i]:=#0;
//for i := 0 to Length(val) do  val[i]:=#0;

  if (pos_get_first(handle, @par[0], sizeof(par), @val[0], sizeof(val)) = true) then
  begin
    repeat

   // CharToOem(val, val); { Decode ANS->OEM before console output. }
 // s1 := WideStringToString(par, 866  );
 //  s2 := WideStringToString(val, 866  );

 // Memo1.Lines.Add(Format('%s = %s', [string(par), string(val) ]));
 s1:='';
 s2:='';

 s1:=StrOemToAnsi(string(par));
  s2:=StrOemToAnsi(String(val));
// Memo1.Lines.Add(Format('%s = "%s"', [string(par), string(val)]));
     Memo1.Lines.Add(Format('%s = %s', [s1, s2]));
     TerminaleResponce(Format('%s = %s', [s1, s2]));
    // Writeln(Format('%s = "%s"', [string(par), string(val)]));

 //   for i := 0 to Length(par) do  par[i]:=#0;
 //   for i := 0 to Length(val) do  val[i]:=#0;

    res := pos_get_next(handle, @par[0], sizeof(par), @val[0], sizeof(val));
    until (res = false);
  end;

  Memo1.Lines.Add('');
end;

procedure TForm1.test;
var
handle: POS_HANDLE;
loop: ByteBool;
resp: integer;
timeout: integer;

val: array[0..10240] of char;

s1,s2:string;
r:boolean;

begin
  Memo1.Clear;

  handle := POS_NONE;
  If not pos_open(handle, PAnsiChar('COM9')) then
  begin

    Memo1.Lines.Add('Can not open port!');
    TerminaleResponce('Can not open port!');
    Exit;
  end;

  pos_set(handle, POS_AMOUNT, PAnsiChar('10')); { 1.00 }
  pos_set(handle, POS_CURRENCY, PAnsiChar('980')); { UAH }

  if not pos_send(handle, ACTION_PAYMENT) then
  begin
    Memo1.Lines.Add('Can not send request!');
    TerminaleResponce('Can not send request!');

  Exit;
  end;


  loop := true;
  timeout := 180000; { 3 min }
  while (loop) do begin
    resp := pos_receive(handle, timeout);

    case (resp) of
      RESP_TIMEOUT:
        begin
          Memo1.Lines.Add('TIMEOUT');
          TerminaleResponce('TIMEOUT');
        end;
      RESP_BREAK:
        begin
          Memo1.Lines.Add('BREAK');
          TerminaleResponce('BREAK');
          loop := false;
        end;
      RESP_CONFIRM:
        begin
          Memo1.Lines.Add('CONFIRMED');
          TerminaleResponce('CONFIRMED');
          pos_get(handle, POS_TRANS_CODE,  @val[0], sizeof(val));

               s1:='POS_TRANS_CODE_on_CONFIRM';
               s2:='';
               s2:=StrOemToAnsi(String(val));
               TerminaleResponce(Format('%s = %s', [s1, s2]));





          loop := false;
        end;

      RESP_DECLINE:
        begin
          Memo1.Lines.Add('DECLINED');
          TerminaleResponce('DECLINED');
          PrintResponse(handle);
          loop := false;
        end;
      RESP_MESSAGE:
        begin
          Memo1.Lines.Add('MESSAGE');
          TerminaleResponce('MESSAGE');

          PrintResponse(handle);
        end;
      RESP_IDENTIFIER:
        begin
          Memo1.Lines.Add('IDENTIFIER');
          TerminaleResponce('IDENTIFIER');


          PrintResponse(handle);
        end;



    end;  //  case (resp) of



  end; // while (loop) do begin



  if not pos_send(handle, ACTION_STATUS) then
  begin
    Memo1.Lines.Add('Can not send request ACTION_STATUS!');
    TerminaleResponce('Can not send request ACTION_STATUS!');

  Exit;
  end;




  pos_Close(handle);

end;





procedure TForm1.Button1Click(Sender: TObject);
begin
test;

end;

end.
