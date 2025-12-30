unit URestore_doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TF_Restore_Doc = class(TForm)
    QNOT_SAVED_DOC: TADOQuery;
    DS_QNOT_SAVED_DOC: TDataSource;
    QNOT_SAVED_DOCNAME: TWideStringField;
    QNOT_SAVED_DOCNAMEDOC: TWideStringField;
    QNOT_SAVED_DOCCLI_D: TWideStringField;
    QNOT_SAVED_DOCCLI_K: TWideStringField;
    QNOT_SAVED_DOCNN: TWideStringField;
    QNOT_SAVED_DOCD: TDateTimeField;
    QNOT_SAVED_DOCID_USER: TIntegerField;
    QNOT_SAVED_DOCID_DOC_TYPE: TIntegerField;
    QNOT_SAVED_DOCID_CLI_D: TIntegerField;
    QNOT_SAVED_DOCID_CLI_K: TIntegerField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BBRestore: TBitBtn;
    SP_RESTORE_NOT_SAVED_DOC: TADOStoredProc;
    QNOT_SAVED_DOCID_NOT_SAVED_DOC: TAutoIncField;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBRestoreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ReopenNotSaveDoc;
  end;

var
  F_Restore_Doc: TF_Restore_Doc;

  procedure F_Restore_Doc_dlg;

implementation
uses UDataModule1, users_f, USaleDocList, UMainForm;
{$R *.dfm}

procedure F_Restore_Doc_dlg;
begin
 F_Restore_Doc:=TF_Restore_Doc.Create(Application);
 with F_Restore_Doc do
 begin
  try
    ShowModal;
  finally
   FreeAndNil(F_Restore_Doc);
  end;
 end;
end;

procedure TF_Restore_Doc.ReopenNotSaveDoc;
begin
  with QNOT_SAVED_DOC do
  begin
    Close;
    Open;
    First;
  end;
end;

procedure TF_Restore_Doc.BBRestoreClick(Sender: TObject);
var ID_DOC_TYPE_RESTORE, ID_NC_NEW_RESTORE :longint;
begin
// восстановление документа
  SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@ID_NOT_SAVED_DOC']:=
    QNOT_SAVED_DOC.FieldByName('ID_NOT_SAVED_DOC').AsInteger;
  if F_main.IS_RECEPT_TO_REGISTR_RRO then
    SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=1
  else SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@IS_CAN_REGISTRED_RRO']:=0;

  SP_RESTORE_NOT_SAVED_DOC.ExecProc;
  if SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@ER']<>0 then
  begin
    MessageDlg('Ошибка восстановления!'+SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@ER_COMMENT'], mtError,[mbOk], 0);
    ReopenNotSaveDoc;
  end
  else
  begin
    ID_DOC_TYPE_RESTORE := SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@ID_DOC_TYPE'];
    ID_NC_NEW_RESTORE := SP_RESTORE_NOT_SAVED_DOC.Parameters.ParamValues['@ID_NC_NEW'];
   // if MessageDlg('Документ восстановлен! Открыть его?', mtWarning,
   //     [mbNo, mbYes], 0)= mrYes then
  //  begin
      FSaleDocList_dlg(ID_DOC_TYPE_RESTORE, ID_NC_NEW_RESTORE );
      Close;

   // end
   // else  ReopenNotSaveDoc;
  end;

end;

procedure TF_Restore_Doc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QNOT_SAVED_DOC.Close;
end;

procedure TF_Restore_Doc.FormShow(Sender: TObject);
begin
 ReopenNotSaveDoc;
end;

end.
