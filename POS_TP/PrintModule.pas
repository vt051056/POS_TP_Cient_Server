unit PrintModule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Printers, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    //procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

     var
 f: TextFile;
 product, count, price:string;
// b: string;
 cancelThreadId:integer;
 threadId       : LongWord;
{begin
    {Printer.BeginDoc;
  Printer.Canvas.TextOut(0,0,'1-Place any text here');

  Printer.EndDoc;
                Printer.BeginDoc;

  Printer.Canvas.TextOut(0,0,'2-Place any text here');
  Printer.EndDoc;}
begin
  //PrintDialog1.Execute;

  if PrintDialog1.Execute  then
   begin
          // Start a cancel print dilaog as a separate thread!
      //:=
      // beginThread(nil,  0, Addr(CancelDialog), nil, 0, threadId);
//    Printer.Canvas.Font := Memo1.Font;
//    Printer.EndDoc;
      Printer.BeginDoc;
        Printer.Canvas.TextOut(0,0,'ÕŒ¬Œ∆¿ÕŒ¬— »… Ãﬂ—Œ ŒÃ¡»Õ¿“');
        Printer.Canvas.TextOut(0,25,'-----------------------------------------------');
      Printer.EndDoc;

      with ADOQuery1 do
      begin
        Close;
        Open;
        First;
        AssignPrn(f);
        while not EOF do
        begin
          product:=FieldByName('CLIENT').AsString;
          count:=FieldByName('ADRES').AsString;
          price:= chr(VK_TAB)+' - 123,123';
          //a:=FieldByName('CLIENT').AsString;
          Next;
          //AssignPrn(f);
          try
             Rewrite(f);

             WriteLn(f, product);//Memo1.Text)
             WriteLn(f, count, price);
             //WriteLn(f, '01234567890123456789012345678');
             //WriteLn(f, '-----------------------------------------------');
          finally
             //CloseFile(f);
          end;
        end;
        CloseFile(f);
            //WriteLn(f, '_____________________________');
      end;
        Printer.BeginDoc;
          Printer.Canvas.TextOut(0,0,'-------------------------------------------------');

          Printer.Canvas.Font.Size := 14;
          //Printer.Canvas.Font.Name := 'Arial';

          Printer.Canvas.TextOut(0,25,'—”ÃÃ¿');
          Printer.Canvas.Font.Style := [fsBold];
//          Printer.Canvas.Font.Style := [];
          Printer.Canvas.TextOut(200, 25,'123.123');

          Printer.Canvas.Font.Size := 8;
//          Printer.Canvas.Font.Name := 'Tahoma';
          Printer.Canvas.Font.Style := [];
          Printer.Canvas.TextOut(0,72,'-------------------------------------------------');

          Printer.Canvas.Font.Size := 8;
  //        Printer.Canvas.Font.Name := 'Tahoma';
          Printer.Canvas.TextOut(0,100,'ƒ≈Õ‹√»     ' + price);

          //Printer.Canvas.TextOut(0,100,'-------------------------------------------------');
          Printer.Canvas.Font.Size := 8;
          //Printer.Canvas.Font.Name := 'Arial';
          Printer.Canvas.TextOut(0,125,'—ƒ¿◊¿');
          //Printer.Canvas.MoveTo(10, 125);
          Printer.Canvas.TextOut(200,125, '123.123');

          Printer.Canvas.Font.Style := [];
          Printer.Canvas.TextOut(0,150,'-------------------------------------------------');

          Printer.Canvas.TextOut(0,175,'’‡È Á‡‚Ê‰Ë ·Û‰Â ÒÏ‡˜ÌÓ!');
          Printer.Canvas.TextOut(0,200,'___________________________________');
//          Printer.Canvas.TextOut(0,200,'*************************************');
        Printer.EndDoc;
  end;


//    AssignPrn(f);
//      try
//       Rewrite(f);
//       WriteLn(f, a)//Memo1.Text)
//       finally
//      CloseFile(f);
//      end;
//    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

 ADOQuery1.Close;
     ADOQuery1.Open;
end;



end.
