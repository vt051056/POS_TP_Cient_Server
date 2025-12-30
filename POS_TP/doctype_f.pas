unit doctype_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,ADODB,System.UITypes,
  Data.DB;

type
  TF_doctype = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    CBSetEdit: TCheckBox;
    BBDelete: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BBDeleteClick(Sender: TObject);
    procedure CBSetEditClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CarentColumn:Tcolumn;
    ID_CHAR_DOC:longint;
    procedure FoundRec(v_ID_REC:longint);
  end;

var

  ID_Doc_type_select,DocID_CLI_D,DocID_CLI_K, id_Form_Prn, ID_KATEG_CLI,
  ID_KATEG_CLI_K, ID_LINK_DOC, ID_LINK_CH_DOC, ID_PROV_CASE_select    :longint;
  Stavka_NDS_doc_select:extended;
  Doc_type_select,DocCLI_D,DocCLI_K,DocSch_d,DocSch_k, KATEG_CLI,
  KATEG_CLI_K, LINK_NAMEDOC:string;
  
  F_doctype: TF_doctype;
  function  F_doctypeDlg(vID_CHAR_DOC:longint):integer;

implementation
 uses UDataModule1, Users_f, myfuncs, grtov_f, docchar_f;
 // , sch_f, client_f,kateg_cli_f,
 // Naklist_f, inv_f, abonplata_f, tovoper_gr_f, sel_char_doc, doctypeView;
{$R *.dfm}


function  F_doctypeDlg(vID_CHAR_DOC:longint):integer;
begin
 F_doctype:=TF_doctype.Create(Application);
 with F_doctype do
 begin
  try
   ID_CHAR_DOC:=vID_CHAR_DOC;
   result:=ShowModal;
  finally
   Free;
   F_doctype:= nil;
  end;
 end;
end;

procedure TF_doctype.FormCreate(Sender: TObject);
begin

 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CarentColumn:=nil;

 CBSetEdit.Enabled:=True;
 CBSetEdit.Checked:=False;



 if CBSetEdit.Checked then
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
  end
  else
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  end;
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=CBSetEdit.Checked;


end;

procedure TF_doctype.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSDocType.State in [dsInsert,DsEdit] then DM1.ADODSDocType.Post;
   ID_Doc_type_select:=DM1.ADODSDocType.FieldByName('ID_DOC_TYPE').Asinteger;
   id_Form_Prn:=DM1.ADODSDocType.FieldByName('FORM_PRN').Asinteger;
   Doc_Type_select:=DM1.ADODSDocType.FieldByName('NAMEDOC').AsString;
   DocID_CLI_D:=DM1.ADODSDocType.FieldByName('ID_CLI_D').Asinteger;
   DocCLI_D:=DM1.ADODSDocType.FieldByName('CLI_D').AsString;
   DocID_CLI_K:=DM1.ADODSDocType.FieldByName('ID_CLI_K').Asinteger;
   DocCLI_K:=DM1.ADODSDocType.FieldByName('CLI_K').AsString;
   DocSch_K:=DM1.ADODSDocType.FieldByName('ID_SCH_K').AsString;
   DocSch_D:=DM1.ADODSDocType.FieldByName('ID_SCH_D').AsString;
   ID_CHAR_DOC_select:=DM1.ADODSDocType.FieldByName('ID_CHAR_DOC').Asinteger;
   Stavka_NDS_doc_select:=DM1.ADODSDocType.FieldByName('NDS_PER').AsFloat;
   ID_LINK_DOC:=DM1.ADODSDocType.FieldByName('ID_LINK_DOC').Asinteger;
   ID_LINK_CH_DOC:=DM1.ADODSDocType.FieldByName('ID_LINK_CH_DOC').Asinteger;
   ID_PROV_CASE_select:=DM1.ADODSDocType.FieldByName('ID_PROV_CASE').AsInteger;
  end
  else
  begin
   if DM1.ADODSDocType.State in [dsInsert,DsEdit] then DM1.ADODSDocType.Cancel;
   ID_Doc_type_select:=Unknown_code;
   Doc_Type_select:=Unknown_str;
   DocID_CLI_D:=Unknown_code;
   DocCLI_D:=Unknown_str;
   DocID_CLI_K:=Unknown_code;
   DocCLI_K:=Unknown_str;
   DocSch_K:=Unknown_str;
   DocSch_D:=Unknown_str;
   ID_CHAR_DOC_select:=Unknown_code;
   Stavka_NDS_doc_select:=0;
   ID_LINK_DOC:=Unknown_code;
   ID_LINK_CH_DOC:=Unknown_code;
   ID_PROV_CASE_select:=Unknown_code;
  end;

  DM1.ADODSDocType.Active:=False;
 end;
end;

procedure TF_doctype.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSDocType.DataSet.DisableControls;
 with DM1.DSDocType.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('NAMEDOC').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.DSDocType.DataSet.EnableControls;
end;

procedure TF_doctype.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSDocType.DataSet.DisableControls;
 with DM1.DSDocType.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('NAMEDOC').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.DSDocType.DataSet.EnableControls;

end;

procedure TF_doctype.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSDocType.DataSet).Locate('NAMEDOC',Edit1.Text,[loPartialKey]);
end;

procedure TF_doctype.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_doctype.BBRefreshClick(Sender: TObject);
var carrent_ID_DOC_TYPE:longint;
begin
 with DM1.DSDocType.DataSet do
begin
 carrent_ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
 FoundRec(carrent_ID_DOC_TYPE);
end;
end;

procedure TF_doctype.FoundRec(v_ID_REC:longint);
begin
with DM1.DSDocType.DataSet do
begin
 Disablecontrols;
 Close;

 if ID_CHAR_DOC=-1 then
begin
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_FROM').Value:=-1;
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_TO').Value:=1000;
end
else
begin
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_FROM').Value:=ID_CHAR_DOC;
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_TO').Value:=ID_CHAR_DOC;
end;

 Open;
 locate('ID_DOC_TYPE', v_ID_REC, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_doctype.FormShow(Sender: TObject);
begin
DM1.ADODSDocType.Active:=False;
if ID_CHAR_DOC=-1 then
begin
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_FROM').Value:=-1;
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_TO').Value:=1000;
end
else
begin
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_FROM').Value:=ID_CHAR_DOC;
 DM1.ADODSDocType.Parameters.ParamByName('ID_CHAR_TO').Value:=ID_CHAR_DOC;
end;
DM1.ADODSDocType.Active:=True;
Edit1.SetFocus;
end;

procedure TF_doctype.DBGrid1EditButtonClick(Sender: TObject);
var ID_CH_DOC, search_ID_DOC_TYPE: integer;
begin
{
if CBSetEdit.Checked then
begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   if State in [dsInsert,dsEdit] then Post;
   BBRefreshClick(Sender);
  end;
 if CarentColumn.FieldName='ID_SCH_D' then
 begin
 if F_SchDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_SCH_D.ReadOnly:=False;
   Edit;
   FieldByName('ID_SCH_D').asString:=ID_sch_select;
   Post;
   DM1.ADODSDocTypeID_SCH_D.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='ID_SCH_K' then
 begin
 if F_SchDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_SCH_K.ReadOnly:=False;
   Edit;
   FieldByName('ID_SCH_K').asString:=ID_sch_select;
   Post;
   DM1.ADODSDocTypeID_SCH_K.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='CLI_D' then
 begin
 if F_clientDlg(-1,'')= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_CLI_D.ReadOnly:=False;
   Edit;
   FieldByName('ID_CLI_D').asInteger:=ID_Client_select;
   Post;
   DM1.ADODSDocTypeID_CLI_D.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='CLI_K' then
 begin
 if F_clientDlg(-1,'')= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_CLI_K.ReadOnly:=False;
   Edit;
   FieldByName('ID_CLI_K').asInteger:=ID_Client_select;
   Post;
   DM1.ADODSDocTypeID_CLI_K.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='CHAR_DOC' then
 begin
 if F_DOC_CHARDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_CHAR_DOC.ReadOnly:=False;
   Edit;
   FieldByName('ID_CHAR_DOC').asInteger:=ID_CHAR_DOC_select;
   Post;
   DM1.ADODSDocTypeID_CHAR_DOC.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='GRUPTOV' then
 begin
 if F_grtovDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_GRTOV.ReadOnly:=False;
   Edit;
   FieldByName('ID_GRTOV').asInteger:=ID_grtov_select;
   Post;
   DM1.ADODSDocTypeID_GRTOV.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;

 if CarentColumn.FieldName='KATEGOR' then
 begin
 if F_kateg_cliDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_KATEG_CLI.ReadOnly:=False;
   Edit;
   FieldByName('ID_KATEG_CLI').asInteger:=ID_kateg_cli_select;
   Post;
   DM1.ADODSDocTypeID_KATEG_CLI.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;


 if CarentColumn.FieldName='KATEGOR_K' then
 begin
 if F_kateg_cliDlg= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_KATEG_CLI_K.ReadOnly:=False;
   Edit;
   FieldByName('ID_KATEG_CLI_K').asInteger:=ID_kateg_cli_select;
   Post;
   DM1.ADODSDocTypeID_KATEG_CLI_K.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;


 if CarentColumn.FieldName='SUPPL' then
 begin
 if F_clientDlg(-1,'')= mrOk then
 begin
  with TADOdataSet(DM1.DSDocType.DataSet) do
  begin
   DM1.ADODSDocTypeID_SUPPL.ReadOnly:=False;
   Edit;
   FieldByName('ID_SUPPL').asInteger:=ID_Client_select;
   Post;
   DM1.ADODSDocTypeID_SUPPL.ReadOnly:=True;
   FoundRec(FieldByName('ID_DOC_TYPE').asinteger);
  end;
 end;
 end;



 if CarentColumn.FieldName='LINK_NAMEDOC' then
 begin
  search_ID_DOC_TYPE:=TADOdataSet(DM1.DSDocType.DataSet).FieldByName('ID_DOC_TYPE').asinteger;
  if F_Select_Char_doc(ID_CH_DOC)=mrOk then
  begin
   if F_doctypeViewDlg(ID_CH_DOC)=mrOk then
   begin
    dm1.SP_SET_LINK_DOC.Parameters.ParamValues['@ID_DOC_TYPE']:=search_ID_DOC_TYPE;
    dm1.SP_SET_LINK_DOC.Parameters.ParamValues['@ID_LINK_DOC']:=ID_Doc_type_select;
    dm1.SP_SET_LINK_DOC.Parameters.ParamValues['@ID_LINK_CH_DOC']:=ID_CH_DOC;
    dm1.SP_SET_LINK_DOC.ExecProc;
    if dm1.SP_SET_LINK_DOC.Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при изменении ссылки на связанный документ!', mtError,
      [mbOk], 0);
    end
    else
    begin
     FoundRec(search_ID_DOC_TYPE);
    end;

   end;  // if F_doctypeViewDlg(ID_CH_DOC)=mrOk then
  end;  //  if F_Select_Char_doc(ID_CH_DOC)=mrOk then


 end; //  if CarentColumn.FieldName='SUPPL' then







end; //if CBSetEdit.Checked then
 }
end;

procedure TF_doctype.DBGrid1CellClick(Column: TColumn);
begin
CarentColumn:=Column;
end;

procedure TF_doctype.BBDeleteClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
with DM1.ADODSDocType do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_DOC_TYPE').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_DOC_TYPE').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_DOC_TYPE').AsInteger;
 DM1.SP_DELETE_DOCTYPE.Parameters.ParamValues['@ID_DOC_TYPE']:=carrent_ID;
 DM1.SP_DELETE_DOCTYPE.ExecProc;
 if DM1.SP_DELETE_DOCTYPE.Parameters.ParamValues['@ER']=0
 then
  begin
   if pred_ID=carrent_ID then // удаляем 1-ю
    FoundRec(next_ID)
   else
    if next_ID=carrent_ID then // удаляем последнюю
     FoundRec(pred_ID)
    else FoundRec(pred_ID);

  end
 else MessageDlg('Ошибка при удалении документа!', mtError,
      [mbOk], 0);

 Enablecontrols;
end;


end;

procedure TF_doctype.CBSetEditClick(Sender: TObject);
begin
  if CBSetEdit.Checked then
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
  end
  else
  begin
   DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  end;
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=CBSetEdit.Checked;

end;

procedure TF_doctype.BitBtn1Click(Sender: TObject);
begin
   if DM1.ADODSDocType.State in [dsInsert,DsEdit] then DM1.ADODSDocType.Post;
   ID_Doc_type_select:=DM1.ADODSDocType.FieldByName('ID_DOC_TYPE').Asinteger;
   Doc_Type_select:=DM1.ADODSDocType.FieldByName('NAMEDOC').AsString;
   DocID_CLI_D:=DM1.ADODSDocType.FieldByName('ID_CLI_D').Asinteger;
   DocCLI_D:=DM1.ADODSDocType.FieldByName('CLI_D').AsString;
   DocID_CLI_K:=DM1.ADODSDocType.FieldByName('ID_CLI_K').Asinteger;
   DocCLI_K:=DM1.ADODSDocType.FieldByName('CLI_K').AsString;
   DocSch_K:=DM1.ADODSDocType.FieldByName('ID_SCH_K').AsString;
   DocSch_D:=DM1.ADODSDocType.FieldByName('ID_SCH_D').AsString;
   ID_CHAR_DOC_select:=DM1.ADODSDocType.FieldByName('ID_CHAR_DOC').Asinteger;
   Stavka_NDS_doc_select:=DM1.ADODSDocType.FieldByName('NDS_PER').AsFloat;
    id_Form_Prn:=DM1.ADODSDocType.FieldByName('FORM_PRN').Asinteger;
    ID_KATEG_CLI:=DM1.ADODSDocType.FieldByName('ID_KATEG_CLI').Asinteger;
    KATEG_CLI:=DM1.ADODSDocType.FieldByName('KATEGOR').AsString;
    ID_KATEG_CLI_K:=DM1.ADODSDocType.FieldByName('ID_KATEG_CLI_K').Asinteger;
    KATEG_CLI_K:=DM1.ADODSDocType.FieldByName('KATEGOR_K').AsString;
    ID_LINK_DOC:=DM1.ADODSDocType.FieldByName('ID_LINK_DOC').Asinteger;
    ID_LINK_CH_DOC:=DM1.ADODSDocType.FieldByName('ID_LINK_CH_DOC').Asinteger;
    LINK_NAMEDOC:=  DM1.ADODSDocType.FieldByName('LINK_NAMEDOC').AsString;
    ID_PROV_CASE_select:=DM1.ADODSDocType.FieldByName('ID_PROV_CASE').AsInteger;
    {
    case ID_CHAR_DOC of
    0,1,2,3: F_NaklistDlg(-1,-1);
    4:  F_InvDlg;
    5: F_AbonListDlg(-1) ;
    6,7: F_Tov_oper_Gr_ListDlg(-1) ;
    8: F_NaklistDlg(-1,-1);  // заказы
    end;
     }

end;

procedure TF_doctype.DBGrid1DblClick(Sender: TObject);
begin
 BitBtn1Click(Sender);
end;

end.
