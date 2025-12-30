unit TovReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.ExtCtrls;

type
  TF_TovReport = class(TForm)
    QTovProdaga: TADOQuery;
    DS_QTovReport: TDataSource;
    QTovProdagaGRUPTOV: TWideStringField;
    QTovProdagaID_GRTOV: TIntegerField;
    QTovProdagaNAME: TWideStringField;
    QTovProdagaID_TOV: TIntegerField;
    QTovProdagaS_REAL: TFloatField;
    QTovProdagaS_UCHET: TFloatField;
    QTovProdagacena_real: TFloatField;
    QTovProdagacena_uchet: TFloatField;
    QTovProdagaSN_TOV: TFloatField;
    QTovProdagaucenka: TFloatField;
    QTovOborot: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BBClose: TBitBtn;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    QTovOborotGRUPTOV: TWideStringField;
    QTovOborotNAME: TWideStringField;
    QTovOborotEDIZM: TWideStringField;
    QTovOborotN_0: TFloatField;
    QTovOborotN_D_VENDOR_0: TFloatField;
    QTovOborotN_D_PRVO_0: TFloatField;
    QTovOborotN_D_BUYER_0: TFloatField;
    QTovOborotN_K_BUYER_0: TFloatField;
    QTovOborotN_K_VENDOR_0: TFloatField;
    QTovOborotN_K_PRVO_0: TFloatField;
    QTovOborotN_1: TFloatField;
    QTovOborotN_D_VENDOR: TFloatField;
    QTovOborotN_D_PRVO: TFloatField;
    QTovOborotN_D_BUYER: TFloatField;
    QTovOborotN_K_BUYER: TFloatField;
    QTovOborotN_K_VENDOR: TFloatField;
    QTovOborotN_K_PRVO: TFloatField;
    QTovOborotN_2: TFloatField;
    QTovOborotID_TOV: TIntegerField;
    procedure BBCloseClick(Sender: TObject);
    procedure QTovProdagaCalcFields(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    CarentFieldSeach:string;
  end;

var
  F_TovReport: TF_TovReport;

  function  F_TovReportDlg(v_rep:integer):integer;

implementation

{$R *.dfm}

uses  UMainForm, UDataModule1, USERS_F, myfuncs;

function  F_TovReportDlg(v_rep:integer):integer;
var Save_Cursor:TCursor;
begin
 F_TovReport:=TF_TovReport.Create(Application);
 with F_TovReport do
 begin
  try
    Save_Cursor:=Screen.Cursor;
    Screen.Cursor := crSQLWait;
    case v_rep of
    1:
    begin
      with QTovProdaga do
      begin
        DisableControls;
        Close;
        Parameters.ParamByName('ID_USER').Value:=id_user_select;
        Parameters.ParamByName('D_From').Value:=F_main.D_From.DateTime;
        Parameters.ParamByName('D_To').Value:=F_main.D_To.DateTime;
        Open;
        EnableControls;
      end;
      DS_QTovReport.DataSet:=QTovProdaga;
    end;
    2:
    begin
      with QTovOborot do
      begin
        DisableControls;
        Close;
        Parameters.ParamByName('D_From').Value:=F_main.D_From.DateTime;
        Parameters.ParamByName('D_To').Value:=F_main.D_To.DateTime;
        Open;
        EnableControls;
      end;
      DS_QTovReport.DataSet:=QTovOborot;
    end;

    end;
   
    Screen.Cursor := Save_Cursor;
   result:=ShowModal;
  finally
   FreeAndNil(F_TovReport);
  end;
 end;
end;



procedure TF_TovReport.BBCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TF_TovReport.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DS_QTovReport.DataSet.DisableControls;
 with DS_QTovReport.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DS_QTovReport.DataSet.EnableControls;

end;

procedure TF_TovReport.BBSearchUpClick(Sender: TObject);

var is_found:boolean;
begin
 DS_QTovReport.DataSet.DisableControls;
 with DS_QTovReport.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DS_QTovReport.DataSet.EnableControls;
end;

procedure TF_TovReport.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_TovReport.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin

 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 end;

  // закрасим ячейку используя стандартный метод:
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State)
end;

procedure TF_TovReport.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
  TADODataSet(DS_QTovReport.DataSet).Sort:=CarentFieldSeach + ' ASC';
end;

procedure TF_TovReport.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TADOdataSet(DS_QTovReport.DataSet).Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_TovReport.QTovProdagaCalcFields(DataSet: TDataSet);
begin
with DataSet do
begin
  if FieldByName('SN_TOV').AsFloat>Eps then
  begin
    QTovProdagacena_real.Value:=FieldByName('S_REAL').AsFloat/FieldByName('SN_TOV').AsFloat;
    QTovProdagacena_uchet.Value:=FieldByName('S_UCHET').AsFloat/FieldByName('SN_TOV').AsFloat;
  end
  else
  begin
    QTovProdagacena_real.Value:=0;
    QTovProdagacena_uchet.Value:=0;
  end;

  QTovProdagaucenka.Value:=FieldByName('S_UCHET').AsFloat-FieldByName('S_REAL').AsFloat;
end; // with QTovReport do
end;


end.
