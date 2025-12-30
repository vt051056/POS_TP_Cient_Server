unit Inp_Prod_POS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DateUtils;


type
  TF_Inp_Prod_POS = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    DTPProvodDay: TDateTimePicker;
    DTPProvodTime: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Q_PRODUCT_POS: TADOQuery;
    DS_Q_PRODUCT_POS: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Q_PRODUCT_POSID_PROD: TIntegerField;
    Q_PRODUCT_POSID_TOV: TIntegerField;
    Q_PRODUCT_POSGRUPTOV: TWideStringField;
    Q_PRODUCT_POSNAME: TWideStringField;
    Q_PRODUCT_POSEDIZM: TWideStringField;
    Q_PRODUCT_POSN_PRODANO: TFloatField;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DTPProvodDayExit(Sender: TObject);
    procedure DTPProvodTimeChange(Sender: TObject);
    procedure DTPProvodTimeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPProvodDayChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    ID_PROD:longint;
    N_PREPARE:Extended;
    D_From, D_To:TDatetime;
    CarentFieldSeach:string;
    { Public declarations }

    procedure ReOpen_Q_PRODUCT_POS;

  end;

var
  F_Inp_Prod_POS: TF_Inp_Prod_POS;



function  F_Inp_Prod_POS_Dlg(var vDATE_P:TDatetime; var vN_PREPARE:extended; var vID_PROD :longint  ):integer;


implementation
uses UDataModule1, myfuncs;
{$R *.dfm}

function  F_Inp_Prod_POS_Dlg(var vDATE_P:TDatetime; var vN_PREPARE:extended; var vID_PROD :longint  ):integer;
begin
 F_Inp_Prod_POS:=TF_Inp_Prod_POS.Create(Application);
 with F_Inp_Prod_POS do
 begin
  try
    DTPProvodDay.DateTime:=vDATE_P;
    DTPProvodTime.Time:=DTPProvodDay.Time;
    ID_PROD:=vID_PROD;
    N_PREPARE:=vN_PREPARE;
    Edit1.Text:=FloatToStr(N_PREPARE);
    result:=ShowModal;
    if result=mrOk then
    begin
     vDATE_P:=DTPProvodDay.Datetime;
     vN_PREPARE := N_PREPARE;
     vID_PROD:=ID_PROD;
    end
    else
    begin
     vDATE_P:=0;
     vN_PREPARE := 0;
     vID_PROD:=-1;
    end
  finally
   Free;
   F_Inp_Prod_POS:=nil;
  end;
 end;
end;


procedure TF_Inp_Prod_POS.FormCreate(Sender: TObject);
begin
  Edit1.Text:='0.0';
  N_PREPARE:=0;
end;

procedure TF_Inp_Prod_POS.ReOpen_Q_PRODUCT_POS;
begin
  D_From:= DateOf(DTPProvodDay.DateTime);
  D_To:=  EndOfTheDay(DTPProvodDay.DateTime);

  Q_PRODUCT_POS.Close;
  Q_PRODUCT_POS.Parameters.ParamByName('D_From').Value:=D_From;
  Q_PRODUCT_POS.Parameters.ParamByName('D_To').Value:= D_To;
  Q_PRODUCT_POS.Open;
  Q_PRODUCT_POS.First;

  if ID_PROD<>-1 then  Q_PRODUCT_POS.Locate('ID_PROD',ID_PROD,[loCaseInsensitive])
end;

procedure TF_Inp_Prod_POS.FormShow(Sender: TObject);
begin
  CarentFieldSeach:='NAME';
  ReOpen_Q_PRODUCT_POS;
end;

procedure TF_Inp_Prod_POS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modalResult=mrOk then
  begin
   DTPProvodDay.Time:=DTPProvodTime.Time;
   try
    N_PREPARE:=StrToFloat(Edit1.Text);
    ID_PROD:=Q_PRODUCT_POS.FieldByName('ID_PROD').AsInteger;
    if N_PREPARE<Eps then
    begin
      MessageDlg('Запусаемое количестоа должно быть больше нуля!', mtError,[mbOk], 0);
      Edit1.SetFocus;
      CanClose:=False;
    end;
   except
    MessageDlg('Запусаемое количестоа не число!', mtError,[mbOk], 0);
    Edit1.SetFocus;
    CanClose:=False;
   end;

  end;  // if modalResult=mrOk then
  if CanClose then Q_PRODUCT_POS.Close;
end;

procedure TF_Inp_Prod_POS.BitBtn3Click(Sender: TObject);
begin
Edit1.Text:=FloatToStr(Q_PRODUCT_POS.FieldByName('N_PRODANO').AsFloat);
end;

procedure TF_Inp_Prod_POS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TF_Inp_Prod_POS.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
 if (Field.FieldName='N_PRODANO') or (Field.FieldName='NAME')  then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('N_PRODANO').AsFloat >0 then
    begin
      DBGrid1.Canvas.Font.Color := clBlue;
      DBGrid1.Canvas.Brush.Color:=$f8efd5;
    end;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_Inp_Prod_POS.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(Q_PRODUCT_POS).IndexFieldNames:=CarentFieldSeach;

end;

procedure TF_Inp_Prod_POS.DTPProvodDayChange(Sender: TObject);
begin
  DTPProvodDay.Time:=DTPProvodTime.Time;
  ReOpen_Q_PRODUCT_POS;
end;

procedure TF_Inp_Prod_POS.DTPProvodDayExit(Sender: TObject);
begin
 DTPProvodDay.Time:=DTPProvodTime.Time;
 ReOpen_Q_PRODUCT_POS;
end;

procedure TF_Inp_Prod_POS.DTPProvodTimeChange(Sender: TObject);
begin
 DTPProvodDay.Time:=DTPProvodTime.Time;
end;

procedure TF_Inp_Prod_POS.DTPProvodTimeExit(Sender: TObject);
begin
 DTPProvodDay.Time:=DTPProvodTime.Time;
end;

procedure TF_Inp_Prod_POS.Edit2Change(Sender: TObject);
begin
  try
    Q_PRODUCT_POS.Locate(CarentFieldSeach, Edit2.Text,[loPartialKey, loCaseInsensitive]);
  except
   ;
  end;
end;

end.
