unit RRO_cert_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.ComCtrls;

type
  TF_RRO_Sert = class(TForm)
    OpenDialog1: TOpenDialog;
    QCli: TADOQuery;
    DS_QCli: TDataSource;
    Panel16: TPanel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    E_Passw: TEdit;
    Label3: TLabel;
    BB_GetPrivateKeyFileName: TBitBtn;
    E_PrivateKeyFileName: TEdit;
    BB_GetCertificateFileName: TBitBtn;
    E_CertificateFileName: TEdit;
    GroupBox7: TGroupBox;
    EClient: TEdit;
    QCliID_CLIENTS: TAutoIncField;
    QCliCLIENT: TWideStringField;
    QCliRS: TWideStringField;
    QCliMFO: TWideStringField;
    QCliOKPO: TWideStringField;
    QCliINN: TWideStringField;
    QCliRNN: TWideStringField;
    QCliTEL: TWideStringField;
    QCliDIRECTOR: TWideStringField;
    QCliBUHGALTER: TWideStringField;
    QCliADRES: TWideStringField;
    QCliBANK: TWideStringField;
    QCliID_KATEGOR: TIntegerField;
    QCliAUX_INFO: TWideStringField;
    QCliKATEGOR: TWideStringField;
    Label1: TLabel;
    DTP_Date_End: TDateTimePicker;
    procedure BB_GetCertificateFileNameClick(Sender: TObject);
    procedure BB_GetPrivateKeyFileNameClick(Sender: TObject);
    procedure QCliAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_CLI_Cert: longint;
  end;

var
  F_RRO_Sert: TF_RRO_Sert;
  function F_RRO_Sert_dlg(var vID_CLI_Certificate: longint; var vCertificateFileName, vPrivateKeyFileName, vPassw:string;
  var vDate_end:TDateTime):integer;
implementation
uses Main_F;

{$R *.dfm}


function F_RRO_Sert_dlg(var vID_CLI_Certificate: longint; var vCertificateFileName, vPrivateKeyFileName, vPassw:string;
var vDate_end:TDateTime):integer;
begin
 F_RRO_Sert:=TF_RRO_Sert.Create(Application);
 with F_RRO_Sert do
 begin
    QCli.Close;
    QCli.Open;
    ID_CLI_Cert:=vID_CLI_Certificate;
    E_CertificateFileName.Text:= vCertificateFileName;
    E_PrivateKeyFileName.Text:= vPrivateKeyFileName;
    E_Passw.Text:=vPassw;
    DTP_Date_End.Date:=vDate_end;


    if vID_CLI_Certificate<>-1 then
    begin

      if QCli.Locate('ID_CLIENTS', vID_CLI_Certificate, [loCaseInsensitive]) then
      begin
        DBGrid1.Enabled:=False;
        DBNavigator1.Enabled:=False;
      end;
    end
    else
    begin
      QCli.First;
      DBGrid1.Enabled:=True;
      DBNavigator1.Enabled:=True;
    end;
  try
    result:=ShowModal;
    if result = mrOk then
    begin
      vID_CLI_Certificate:=ID_CLI_Cert;
      vCertificateFileName:= E_CertificateFileName.Text;
      vPrivateKeyFileName:= E_PrivateKeyFileName.Text;
      vPassw:=E_Passw.Text;
      vDate_end:=DTP_Date_End.Date;
    end;
  finally
   Free;
   F_RRO_Sert:=Nil;
  end;
 end;
end;



procedure TF_RRO_Sert.BB_GetCertificateFileNameClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    E_CertificateFileName.Text:=OpenDialog1.FileName;
  end;
end;

procedure TF_RRO_Sert.BB_GetPrivateKeyFileNameClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    E_PrivateKeyFileName.Text:=OpenDialog1.FileName;
  end;
end;

procedure TF_RRO_Sert.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if modalResult=mrOk then
begin
 ID_CLI_Cert:=QCli.FieldByName('ID_CLIENTS').AsInteger;
end;
QCli.Close;
end;

procedure TF_RRO_Sert.QCliAfterScroll(DataSet: TDataSet);
begin
   EClient.Text:=QCli.FieldByName('CLIENT').AsString;
   ID_CLI_Cert:=QCli.FieldByName('ID_CLIENTS').AsInteger;
end;

end.
