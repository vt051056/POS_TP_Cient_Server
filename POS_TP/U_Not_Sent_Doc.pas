unit U_Not_Sent_Doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TF_Not_Sent_Doc = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BB_SetFilter: TBitBtn;
    E_Filter_str: TEdit;
    BB_UnSetFilter: TBitBtn;
    Label1: TLabel;
    BB_Set_Is_Export_gezwungen: TBitBtn;
    Command_Set_Is_Export_gezwungen: TADOCommand;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BB_SetFilterClick(Sender: TObject);
    procedure BB_UnSetFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BB_Set_Is_Export_gezwungenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CarentFieldSeach:string;
  end;

var
  F_Not_Sent_Doc: TF_Not_Sent_Doc;
  function F_Not_Sent_Doc_dlg:integer;

implementation
uses UMainForm, DateUtils;
{$R *.dfm}

function F_Not_Sent_Doc_dlg:integer;
begin
 F_Not_Sent_Doc:=TF_Not_Sent_Doc.Create(Application);
 with F_Not_Sent_Doc do
 begin
  try
    result:=ShowModal;
  finally
   FreeAndNil(F_Not_Sent_Doc);
  end;
 end;
end;


procedure TF_Not_Sent_Doc.BB_SetFilterClick(Sender: TObject);
var sf:string;
begin
 F_main.Q_Not_Sent_Docs.Filtered:=False;
 //sf:='('+CarentFieldSeach+'= ''' + E_Filter_str.Text + ''')';
 if CarentFieldSeach='D_DOC' then
 sf:='('+CarentFieldSeach+' = ' + E_Filter_str.Text+ ')'
 else
 sf:= '('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+E_Filter_str.Text+'%') + ')';
 F_main.Q_Not_Sent_Docs.Filter := sf;
 F_main.Q_Not_Sent_Docs.Filtered:=True;
  Label1.Caption:='Фильтр установлен';
end;

procedure TF_Not_Sent_Doc.BB_Set_Is_Export_gezwungenClick(Sender: TObject);
begin
 with F_main.Q_Not_Sent_Docs do
  begin
    First;
    while not Eof do
    begin
      Command_Set_Is_Export_gezwungen.Parameters.ParamByName('ID_DOC_TYPE').Value:=
        FieldByName('ID_DOC_TYPE').AsInteger;
      Command_Set_Is_Export_gezwungen.Parameters.ParamByName('D_FROM').Value:=
        DateOf(FieldByName('D_DOC').AsDateTime);
      Command_Set_Is_Export_gezwungen.Parameters.ParamByName('D_TO').Value:=
        EndOfTheDay(FieldByName('D_DOC').AsDateTime);
      Command_Set_Is_Export_gezwungen.Execute;

      Next;
    end;


    Close;
    Parameters.ParamByName('d').Value:=F_main.D_Work.DateTime-1;
    Open;
    BB_UnSetFilterClick(Sender);
  end;
end;

procedure TF_Not_Sent_Doc.BB_UnSetFilterClick(Sender: TObject);
begin
 F_main.Q_Not_Sent_Docs.Filtered:=False;
 Label1.Caption:='Фильтр не установлен';
end;

procedure TF_Not_Sent_Doc.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 end;
end;

procedure TF_Not_Sent_Doc.DBGrid1TitleClick(Column: TColumn);
begin
  if (Column.FieldName='COUNT_DOC') or (Column.FieldName='ID_DOC_TYPE') then Exit;

  CarentFieldSeach:=Column.FieldName;
  TADODataSet(F_main.Q_Not_Sent_Docs).IndexFieldNames:=CarentFieldSeach;
end;

procedure TF_Not_Sent_Doc.FormShow(Sender: TObject);
begin
  CarentFieldSeach:='NAMEDOC';
  TADODataSet(F_main.Q_Not_Sent_Docs).IndexFieldNames:=CarentFieldSeach;
  E_Filter_str.Text:=F_main.Q_Not_Sent_Docs.FieldByName(CarentFieldSeach).AsString;
  Label1.Caption:='Фильтр не установлен';
end;

end.
