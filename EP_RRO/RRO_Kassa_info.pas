unit RRO_Kassa_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.ComCtrls;

type
  TF_RRO_Kassa = class(TForm)
    Panel16: TPanel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    E_NAME_KASSA: TEdit;
    E_ID_NUM_FISCAL_KASSA: TEdit;
    GroupBox7: TGroupBox;
    EClient: TEdit;
    QTT: TADOQuery;
    DS_QTT: TDataSource;
    GroupBox1: TGroupBox;
    E_TT: TEdit;
    QTTID_CLIENTS: TAutoIncField;
    QTTCLIENT: TWideStringField;
    QTTADRES: TWideStringField;
    QTTKATEGOR: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    BB_GetPrivateKeyFileName: TBitBtn;
    E_PrivateKeyFileName: TEdit;
    BB_GetCertificateFileName: TBitBtn;
    E_CertificateFileName: TEdit;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    E_Passw: TEdit;
    Label4: TLabel;
    DTP_Date_End: TDateTimePicker;
    procedure QTTAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BB_GetCertificateFileNameClick(Sender: TObject);
    procedure BB_GetPrivateKeyFileNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_TT: longint;
    ID_CLI: longint;
  end;

var
  F_RRO_Kassa: TF_RRO_Kassa;
function F_RRO_Kassa_dlg(vID_CLI: longint; vCLI: string; var vID_TT: longint; var vID_NUM_FISCAL_KASSA:int64;
var vNAME_KASSA, vCertificateFileName, vPrivateKeyFileName, vPassw:string; var vDate_end:TDateTime):integer;
implementation
uses Main_F;

{$R *.dfm}


function F_RRO_Kassa_dlg(vID_CLI: longint; vCLI: string; var vID_TT: longint; var vID_NUM_FISCAL_KASSA:int64;
var vNAME_KASSA, vCertificateFileName, vPrivateKeyFileName, vPassw:string; var vDate_end:TDateTime):integer;
begin
 F_RRO_Kassa:=TF_RRO_Kassa.Create(Application);
 with F_RRO_Kassa do
 begin
    QTT.Close;
    QTT.Open;
    ID_CLI:=vID_CLI;
    EClient.Text:=vCLI;
    ID_TT:=vID_TT;

    E_ID_NUM_FISCAL_KASSA.Text:=IntToStr(vID_NUM_FISCAL_KASSA);
    E_NAME_KASSA.Text:= vNAME_KASSA;

    E_CertificateFileName.Text:=vCertificateFileName;
    E_PrivateKeyFileName.Text:=vPrivateKeyFileName;
    E_Passw.Text:= vPassw;
    DTP_Date_End.Date:=vDate_end;



    if ID_TT<>-1 then
    begin
      QTT.Locate('ID_CLIENTS',  ID_TT, [loCaseInsensitive]);
      DBGrid1.Enabled:=False;
      DBNavigator1.Enabled:=False;
    end
    else
    begin
      QTT.First;
      DBGrid1.Enabled:=True;
      DBNavigator1.Enabled:=True;
    end;

  try
    result:=ShowModal;
    if result = mrOk then
    begin
      vID_TT:=ID_TT;
      vID_NUM_FISCAL_KASSA:=StrToInt64(E_ID_NUM_FISCAL_KASSA.Text);
      vNAME_KASSA:=E_NAME_KASSA.Text;
      vCertificateFileName:= E_CertificateFileName.Text;
      vPrivateKeyFileName:= E_PrivateKeyFileName.Text;
      vPassw:=E_Passw.Text;
      vDate_end:=DTP_Date_End.Date;
    end;
  finally
   Free;
   F_RRO_Kassa:=Nil;
  end;
 end;
end;



procedure TF_RRO_Kassa.BB_GetCertificateFileNameClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    E_CertificateFileName.Text:=OpenDialog1.FileName;
  end;
end;

procedure TF_RRO_Kassa.BB_GetPrivateKeyFileNameClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    E_PrivateKeyFileName.Text:=OpenDialog1.FileName;
  end;
end;

procedure TF_RRO_Kassa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if modalResult=mrOk then
begin
 ID_TT:=QTT.FieldByName('ID_CLIENTS').AsInteger;
end;
QTT.Close;
end;

procedure TF_RRO_Kassa.QTTAfterScroll(DataSet: TDataSet);
begin
   E_TT.Text:=QTT.FieldByName('CLIENT').AsString;
   ID_TT:=QTT.FieldByName('ID_CLIENTS').AsInteger;
end;

end.
