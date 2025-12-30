unit USERS_WORK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, System.UITypes;

type
  TF_users_work = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BBRefresh: TBitBtn;
    BBDelDoc: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure BBDelDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Reopen_Q(v_ID:longint);
  end;

var


  F_users_work: TF_users_work;
  function  F_users_workDlg:integer;

implementation
 uses UDataModule1,DB;
{$R *.dfm}


function  F_users_workDlg:integer;
begin
 F_users_work:=TF_users_work.Create(Application);
 with F_users_work do
 begin
  try
   result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_users_work.FormCreate(Sender: TObject);
begin
 DM1.Q_USER_CONNECT.Open;
end;

procedure TF_users_work.Reopen_Q(v_ID:longint);
begin
 with DM1.Q_USER_CONNECT do
 begin
  Disablecontrols;
  Close;
  Open;
  locate('ID_USER', v_ID, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_users_work.BBRefreshClick(Sender: TObject);
begin
 Reopen_Q(DM1.Q_USER_CONNECT.FieldByName('ID_USER').AsInteger);
end;

procedure TF_users_work.BBDelDocClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
if MessageDlg('Вы действительно хотите удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 with DM1.Q_USER_CONNECT do
 begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_USER').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_USER').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_USER').AsInteger;

 DM1.SP_DELETE_USER_CONNECT.Parameters.ParamValues['@ID_USER']:=carrent_ID;

 DM1.SP_DELETE_USER_CONNECT.ExecProc;
 if DM1.SP_DELETE_USER_CONNECT.Parameters.ParamValues['@ER']=0
 then
  begin
   if pred_ID=carrent_ID then // удаляем 1-ю
    Reopen_Q(next_ID)
   else
    if next_ID=carrent_ID then // удаляем последнюю
     Reopen_Q(pred_ID)
    else Reopen_Q(pred_ID);
  end
 else MessageDlg('Ошибка при удалении записи!', mtError,
      [mbOk], 0);
 Enablecontrols;


 end;
end;

end;

end.
