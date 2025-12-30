unit Inp_Ingr_POS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Data.DB, Vcl.DBCtrls, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids;

type
  TF_Inp_Ingr_POS = class(TForm)
    PanelSource: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    E_GRUP_Source: TEdit;
    Label2: TLabel;
    E_TOV_Source: TEdit;
    E_EDIZM_Source: TEdit;
    PanelDest: TPanel;
    DBGrid1: TDBGrid;
    Q_Ingr: TADOQuery;
    DS_Q_Ingr: TDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    E_N_FACT_Source: TEdit;
    Q_IngrID_TOV: TIntegerField;
    Q_IngrNAME: TWideStringField;
    Q_IngrEDIZM: TWideStringField;
    Q_IngrCODE: TWideStringField;
    Q_IngrID_GRTOV: TIntegerField;
    Q_IngrGRUPTOV: TWideStringField;
    Label7: TLabel;
    E_N_NORM_Source: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label5: TLabel;
    E_N_FACT_Dest: TEdit;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBAllGrTovSel: TBitBtn;
    BBGrTovSel: TBitBtn;
    DBNavigator1: TDBNavigator;
    LGrup: TLabel;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BBGrTovSelClick(Sender: TObject);
    procedure BBAllGrTovSelClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_GRTOV_source: Longint;
    SelCodeTOV_INGR: Longint;
    N_FACT_Source:extended;
    N_FACT_Dest:extended;
    mode:integer;
    CarentFieldSeach:String;
    procedure ReOpenQ_Ingr(ID_GRTOV:longint; ID_TOV:longint);
  end;

var
  F_Inp_Ingr_POS: TF_Inp_Ingr_POS;

function  F_Inp_Ingr_POS_Dlg( vmode:integer; v_ID_GRTOV_Source:longint; vGRUP_Source, vTOV_Source, vEDIZM_Source:string;
vN_NORM_Source:extended; var vN_FACT_Source:extended;
var vID_TOV_INGR_Dest:longint; var vN_FACT_Dest:extended):integer;

implementation
uses UDataModule1, myfuncs, GRTOV_F;
{$R *.dfm}
 // mode:= 0 - вставка нового; 1 - редактирование текущего; 2 - редактирование со вставкой; 3 - полная замена текущего
function  F_Inp_Ingr_POS_Dlg( vmode:integer; v_ID_GRTOV_Source:longint; vGRUP_Source, vTOV_Source, vEDIZM_Source:string;
vN_NORM_Source:extended; var vN_FACT_Source:extended;
var vID_TOV_INGR_Dest:longint; var vN_FACT_Dest:extended):integer;
begin
 F_Inp_Ingr_POS:=TF_Inp_Ingr_POS.Create(Application);
 with F_Inp_Ingr_POS do
 begin
  try
    mode:=vmode;
    E_GRUP_Source.ReadOnly:=False;
    E_GRUP_Source.Text:=vGRUP_Source;
    E_GRUP_Source.ReadOnly:=True;

    E_Tov_Source.ReadOnly:=False;
    E_Tov_Source.Text:=vTOV_Source;
    E_Tov_Source.ReadOnly:=True;

    E_EDIZM_Source.ReadOnly:=False;
    E_EDIZM_Source.Text:=vEDIZM_Source;
    E_EDIZM_Source.ReadOnly:=True;

    E_N_NORM_Source.ReadOnly:=False;
    E_N_NORM_Source.Text:=FloatToStr(vN_NORM_Source);
    E_N_NORM_Source.ReadOnly:=True;


    E_N_FACT_Source.Text:=FloatToStr(vN_FACT_Source);
    N_FACT_Source:=vN_FACT_Source;

    ID_GRTOV_source:=v_ID_GRTOV_Source;
    E_N_FACT_Dest.Text:=FloatToStr(vN_FACT_Dest);
    N_FACT_Dest:=vN_FACT_Dest;

    result:=ShowModal;
    if result =mrOk then
    begin
      vID_TOV_INGR_Dest:=SelCodeTOV_INGR;
      vN_FACT_Dest:=N_FACT_Dest;
      vN_FACT_Source:= N_FACT_Source;
    end
    else
    begin
      vID_TOV_INGR_Dest:=-1;
      vN_FACT_Dest:=0;
      vN_FACT_Source:= 0;
    end;
  finally
   Free;
   F_Inp_Ingr_POS:=nil;
  end;
 end;
end;



procedure TF_Inp_Ingr_POS.ReOpenQ_Ingr(ID_GRTOV:longint; ID_TOV:longint);
begin
  with Q_Ingr do
  begin
    Close;
    Parameters.ParamByName('ID_GRTOV').Value:=ID_GRTOV;
    Open;
    if ID_TOV<>-1 then  Locate('ID_TOV',ID_TOV,[loCaseInsensitive]);
  end;

end;



procedure TF_Inp_Ingr_POS.BBAllGrTovSelClick(Sender: TObject);
begin
  grtov_select:='Вса группы';
  ID_grtov_select:=-1;
  LGrup.Caption:='Группа '+grtov_select;
  ReOpenQ_Ingr(ID_grtov_select, -1);
end;

procedure TF_Inp_Ingr_POS.BBGrTovSelClick(Sender: TObject);
begin
 if F_grtovDlg= mrOk then
 begin
  LGrup.Caption:='Группа '+grtov_select;
  ReOpenQ_Ingr(ID_grtov_select, -1);
 end;
end;




procedure TF_Inp_Ingr_POS.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 Q_Ingr.DisableControls;
 with Q_Ingr do
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

 Q_Ingr.EnableControls;
end;

procedure TF_Inp_Ingr_POS.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 Q_Ingr.DisableControls;
 with Q_Ingr do
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

 Q_Ingr.EnableControls;

end;

procedure TF_Inp_Ingr_POS.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_Inp_Ingr_POS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TF_Inp_Ingr_POS.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(Q_Ingr).IndexFieldNames:=CarentFieldSeach;
end;

procedure TF_Inp_Ingr_POS.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  Q_Ingr.Locate(CarentFieldSeach, Edit1.Text,[loPartialKey]);
end;

procedure TF_Inp_Ingr_POS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if modalResult=mrOk then
  begin
     if mode in [0,2,3] then
     begin
     try
      N_FACT_Dest:=StrToFloat(E_N_FACT_Dest.Text);

      if N_FACT_Dest<Eps then
      begin
        MessageDlg('Количество должно быть больше нуля!', mtError,[mbOk], 0);
        E_N_FACT_Dest.SetFocus;
        CanClose:=False;
      end;

     except
      MessageDlg('Количество не число!', mtError,[mbOk], 0);
      E_N_FACT_Dest.SetFocus;
      CanClose:=False;
     end;
   end;
  if mode in [1, 2, 3] then
  begin
   try
    N_FACT_Source:=StrToFloat(E_N_FACT_Source.Text);
   {
    if N_FACT_Source<Eps then
    begin
      MessageDlg('Количество должно быть больше нуля!', mtError,[mbOk], 0);
      E_N_FACT_Source.SetFocus;
      CanClose:=False;
    end;
    }
   except
    MessageDlg('Количество не число!', mtError,[mbOk], 0);
    E_N_FACT_Source.SetFocus;
    CanClose:=False;
   end;
  end;

    SelCodeTOV_INGR:=Q_Ingr.FieldByName('ID_TOV').AsInteger;

  end;  // if modalResult=mrOk then
  if CanClose then Q_Ingr.Close;

end;

procedure TF_Inp_Ingr_POS.FormCreate(Sender: TObject);
begin
  CarentFieldSeach:='NAME';

end;

procedure TF_Inp_Ingr_POS.FormShow(Sender: TObject);
begin

  grtov_select:= E_GRUP_Source.Text;
  ID_grtov_select:=ID_GRTOV_source;
  LGrup.Caption:='Группа '+grtov_select;
  ReOpenQ_Ingr(ID_grtov_select, -1);
 // mode:= 0 - вставка нового; 1 - редактирование текущего; 2 - редактирование со вставкой; 3 - полная замена текущего
  case mode of
  0:
    begin
      PanelSource.Visible:=False;
      PanelSource.Align:=alNone;
      PanelDest.Visible:=True;
      GroupBox1.Caption:='Новый ингредиент';
      PanelDest.Align:=alClient;
    end;
  1:
    begin
      PanelSource.Visible:=True;
      E_N_FACT_Source.ReadOnly:=False;
      GroupBox2.Caption:='Изменяемый ингредиент';
      PanelSource.Align:=alClient;
      PanelDest.Visible:=False;
      PanelDest.Align:=alNone;
    end;
  2:
    begin
      PanelSource.Visible:=True;
      E_N_FACT_Source.ReadOnly:=False;
      GroupBox2.Caption:='Изменяемый ингредиент';
      PanelSource.Align:=alTop;
      PanelDest.Visible:=True;
      GroupBox1.Caption:='Новый ингредиент';
      PanelDest.Align:=alClient;
    end;


    3:
    begin
      PanelSource.Visible:=True;
      E_N_FACT_Source.ReadOnly:=True;
      GroupBox2.Caption:='Заменяемый ингредиент';
      PanelSource.Align:=alTop;
      PanelDest.Visible:=True;
      GroupBox1.Caption:='Заменяющий ингредиент';
      PanelDest.Align:=alClient;
    end;


  end;



end;

end.
