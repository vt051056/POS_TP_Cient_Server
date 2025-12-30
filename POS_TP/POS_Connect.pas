unit POS_Connect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  CShPorts_TLB,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Price_Edit: TEdit;
    Price_Lbl: TLabel;
    Bonus_Edit: TEdit;
    Bonus_Lbl: TLabel;
    SaleValue_Lbl: TLabel;
    Count_Edit: TEdit;
    Count_Lbl: TLabel;
    IDTov_Edit: TEdit;
    IDTov_Lbl: TLabel;
    Panel1: TPanel;
    SaleValue_Edit: TEdit;
    Cash_Edit: TEdit;
    Cash_Lbl: TLabel;
    KripError_Edit: TEdit;
    Krip_Error: TLabel;
    TovName_Edit: TEdit;
    TovName_Lbl: TLabel;
    VoidCheck: TButton;
    OpenCheck_Btn: TButton;
    AddProduct: TButton;
    procedure Button1Click(Sender: TObject);
    procedure VoidCheckClick(Sender: TObject);
    procedure AddProductClick(Sender: TObject);
    procedure OpenCheck_BtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var coKripton : CShPorts_TLB.CoKripton;

       var krip : cshports_tlb.Kripton;

        var i :integer;

       var price, bonus, saleValue, count, id_tov, tov_name,cash, ed_izm, tmp:string;

{$R *.dfm}

procedure TForm1.AddProductClick(Sender: TObject);
begin

     price := form1.Price_Edit.Text;
count := form1.Count_edit.Text;
id_tov := form1.IDTov_Edit.Text;
tov_name := form1.TovName_Edit.Text;

ed_izm := 'шт';


        tmp :=   '000000;'+id_tov+';'+tov_name+';'+'0;1;00;'+ed_izm+';';
        krip.SendCommand($24, tmp);

         //     krip.SendCommand($24, '000000;101; Ковбаса1;0;1;00;;');
         // krip.SendCommand($24, '000000;102; Ковбаса2;0;1;00;;');
         // krip.SendCommand($24, '000000;103; Ковбаса3;0;1;00;;');





           //sale product
        tmp :=   '000000;' + id_tov + ';' + count + ';'+ price + ';' ;
        krip.SendCommand($64, tmp);


        tmp := krip.Error;
        KripError_Edit.Text := tmp;



end;

procedure TForm1.Button1Click(Sender: TObject);



       //: Extended;


begin

   //   price := form1.Price_Edit.Text;
   //   count := form1.Count_edit.Text;
   //   id_tov := form1.IDTov_Edit.Text;
   //   tov_name := form1.TovName_Edit.Text;
      cash := form1.Cash_Edit.Text;
    //  ed_izm := 'шт';

          //  coKripton :=    CShPorts_TLB.CoKripton(form1);// :=   CShPorts_TLB.CoKripton;


       // krip := coKripton.Create();



        //i :=   krip.OpenPort('COM1', 9600);

          //добавление товара

//          krip.SendCommand($24, '000000;'+id_tov+';'+tov_name+';'+'0;1;00;'+ed_izm+';');
         // krip.SendCommand($24, '000000;101; Ковбаса1;0;1;00;;');
          //krip.SendCommand($24, '000000;102; Ковбаса2;0;1;00;;');
         // krip.SendCommand($24, '000000;103; Ковбаса3;0;1;00;;');


        //open fiskal receipt
        // krip.SendCommand($63, '000000;0;1;0;');
        // tmp := krip.Error;
         //      KripError_Edit.Text := tmp;


        //sale product
        //tmp :=   '000000;' + id_tov + ';' + count + ';'+ price + ';' ;
        //tmp :=  '000000;102;1.500;65.83;';
        //krip.SendCommand($64, tmp);
        //krip.SendCommand($64, '000000;101;1.500;65.83;');
        //krip.SendCommand($64, '000000;102;1.500;65.83;');
       // krip.SendCommand($64, '000000;103;1.500;65.83;');

             //  tmp := krip.Error;
            //   KripError_Edit.Text := tmp;

          //  krip.SendCommand($64, '000000;101;1.500;65.83;');
        //krip.SendCommand($64, '000000;102;1.500;65.83;');
        //krip.SendCommand($64, '000000;103;1.500;65.83;');




                        krip.SendCommand($60, '000000;;');
                        krip.SendCommand($61, '000000;RRRRRRRRRRRR;');

         //print total
        // krip.SendCommand($6D, '000000;1;');
              //       tmp := krip.Error;
                  //                  KripError_Edit.Text := tmp;

            krip.SendCommand($6D, '000000;1;');
                     tmp := krip.Error;
                                    KripError_Edit.Text := tmp;


         //payment
         krip.SendCommand($67, '000000;0;'+cash+';');
         tmp := krip.Error;
                        KripError_Edit.Text := tmp;


           //close fiscal
        krip.SendCommand($65, '000000;0;');
        tmp := krip.Error;
        KripError_Edit.Text := tmp;


              krip.ClosePort;

end;

procedure TForm1.OpenCheck_BtnClick(Sender: TObject);
begin        coKripton :=    CShPorts_TLB.CoKripton(form1);// :=   CShPorts_TLB.CoKripton;


        krip := coKripton.Create();



        i :=   krip.OpenPort('COM1', 9600);
      //open fiskal receipt
         krip.SendCommand($63, '000000;0;1;0;');




         tmp := krip.Error;
               KripError_Edit.Text := tmp;
end;

procedure TForm1.VoidCheckClick(Sender: TObject);
begin
      krip.SendCommand($6B, '000000;0;');
end;

end.
