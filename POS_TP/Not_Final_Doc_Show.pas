unit Not_Final_Doc_Show;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TF_Not_Final_Doc_Show = class(TForm)
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    DBNavigator2: TDBNavigator;
    BB_Del_Not_Final_Doc: TBitBtn;
    BB_Del_All_Not_Final_Doc: TBitBtn;
    BB_FindDoc: TBitBtn;
    procedure BB_Del_Not_Final_DocClick(Sender: TObject);
    procedure BB_Del_All_Not_Final_DocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BB_FindDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Not_Final_Doc_Show: TF_Not_Final_Doc_Show;

  function F_Not_Final_Doc_Show_Dlg():integer;

implementation
uses UMainForm, UDataModule1, USERS_F, DateUtils, USaleDocList;

{$R *.dfm}


function F_Not_Final_Doc_Show_Dlg():integer;
begin
 F_Not_Final_Doc_Show:=TF_Not_Final_Doc_Show.Create(Application);
 with F_Not_Final_Doc_Show do
 begin
  try
   result:=ShowModal;
  finally
   FreeAndNil(F_Not_Final_Doc_Show);
  end;
 end;
end;

procedure TF_Not_Final_Doc_Show.BB_Del_All_Not_Final_DocClick(Sender: TObject);
begin
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=-1;
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_USER').Value:=id_user_select;
 F_Main.ADOCommandDeleteNotFinalDoc.Execute;
 F_main.Q_NotFinalDoc.Close;
 F_main.Q_NotFinalDoc.Open;
end;

procedure TF_Not_Final_Doc_Show.BB_Del_Not_Final_DocClick(Sender: TObject);
begin

 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_NAKLCAP').Value:=
  F_Main.Q_NotFinalDoc.FieldByName('ID_NAKLCAP').AsInteger;
 F_Main.ADOCommandDeleteNotFinalDoc.Parameters.ParamByName('ID_USER').Value:=id_user_select;
 F_Main.ADOCommandDeleteNotFinalDoc.Execute;
 F_main.Q_NotFinalDoc.Close;
 F_main.Q_NotFinalDoc.Open;

end;





procedure TF_Not_Final_Doc_Show.BB_FindDocClick(Sender: TObject);
begin
  FSaleDocList_dlg(F_main.Q_NotFinalDoc.FieldByName('ID_DOC_TYPE').AsInteger,
    F_main.Q_NotFinalDoc.FieldByName('ID_NAKLCAP').AsInteger);
  F_main.Q_NotFinalDoc.Close;
  F_main.Q_NotFinalDoc.Open;
end;

procedure TF_Not_Final_Doc_Show.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  F_main.Q_NotFinalDoc.Close;
end;

procedure TF_Not_Final_Doc_Show.FormCreate(Sender: TObject);
begin
 if not F_main.Q_NotFinalDoc.Active then  F_main.Q_NotFinalDoc.Open;
end;

end.
