program POS_TP;

{$R *.dres}

uses
  Vcl.Forms,
  Windows,
  Vcl.Dialogs,
  UMainForm in 'UMainForm.pas' {F_main},
  reg_server in 'reg_server.pas' {FReg_serv},
  UDataModule1 in 'UDataModule1.pas' {DM1: TDataModule},
  myfuncs in 'myfuncs.pas',
  USERS_F in 'USERS_F.PAS' {F_users},
  USERS_WORK in 'USERS_WORK.pas' {F_users_work},
  UDocList in 'UDocList.pas' {FDocList},
  Reason_del in 'Reason_del.pas' {FReason_del},
  USaleDoc in 'USaleDoc.pas' {F_SaleDoc},
  GRTOV_F in 'GRTOV_F.PAS' {F_grtov},
  doctype_f in 'doctype_f.pas' {F_doctype},
  docchar_f in 'docchar_f.pas' {F_docchar},
  SCH_F in 'SCH_F.PAS' {F_sch},
  schtype_f in 'schtype_f.pas' {F_SchType},
  typeuch_f in 'typeuch_f.pas' {F_TypeUch},
  Login_form in 'Login_form.pas' {F_Login},
  UDataModule2 in 'UDataModule2.pas' {DataModule2: TDataModule},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  TovReport in 'TovReport.pas' {F_TovReport},
  APScale_TLB in 'APScale_TLB.pas',
  kateg_cli_f in 'kateg_cli_f.pas' {F_kateg_cli},
  CLIENT_F1 in 'CLIENT_F1.pas' {F_client_1},
  USaleDocList in 'USaleDocList.pas' {FSaleDocList},
  SettingConst in 'SettingConst.pas' {FSettingConst},
  UWithoutTovDoc in 'UWithoutTovDoc.pas' {FWithoutTovDoc},
  DocReport in 'DocReport.pas' {F_DocReport},
  Codage_CB in 'Codage_CB.pas',
  KassaReport in 'KassaReport.pas' {F_KassaReport},
  Print_Functions in 'Print_Functions.pas',
  Assemb_POS in 'Assemb_POS.pas' {F_Assemb_POS},
  Inp_Prod_POS in 'Inp_Prod_POS.pas' {F_Inp_Prod_POS},
  Inp_Ingr_POS in 'Inp_Ingr_POS.pas' {F_Inp_Ingr_POS},
  Inp_Got_POS in 'Inp_Got_POS.pas' {F_Inp_Got_POS},
  CShPorts_TLB in 'CShPorts_TLB.pas',
  lpos_vfd_lcd in 'lpos_vfd_lcd.pas',
  URestore_doc in 'URestore_doc.pas' {F_Restore_Doc},
  uPosAPI in 'uPosAPI.pas',
  Inp_EXCISE_BAR_CODE in 'Inp_EXCISE_BAR_CODE.pas' {F_Inp_EXCISE_BAR_CODE},
  U_F_in_out_Kassa in 'U_F_in_out_Kassa.pas' {F_In_Out_Kassa},
  wcrypt2 in 'wcrypt2.pas',
  DelphiZXIngQRCode in 'DelphiZXIngQRCode.pas',
  KassaReport_RRO in 'KassaReport_RRO.pas' {F_KassaReport_RRO},
  Smeny_Docs in 'Smeny_Docs.pas' {F_Smeny_Docs},
  U_InpBank_Transaction_info in 'U_InpBank_Transaction_info.pas' {FInpBank_Transaction_info},
  F_new_shtrih_code in 'F_new_shtrih_code.pas' {F_NewStrihCode},
  Invent_Confirm_Dlg in 'Invent_Confirm_Dlg.pas' {F_Invent_Confirm},
  U_Not_Sent_Doc in 'U_Not_Sent_Doc.pas' {F_Not_Sent_Doc},
  ECRCommXLib_TLB in 'ECRCommXLib_TLB.pas',
  IngenicoBaseDeviceUnit in 'IngenicoBaseDeviceUnit.pas',
  IngenicoBaseThreadUnit in 'IngenicoBaseThreadUnit.pas',
  IngenicoBPOSDeviceUnit in 'IngenicoBPOSDeviceUnit.pas',
  IngenicoBPOSPayThreadUnit in 'IngenicoBPOSPayThreadUnit.pas',
  IngenicoBPOSPinThreadUnit in 'IngenicoBPOSPinThreadUnit.pas',
  IngenicoBPOSRetThreadUnit in 'IngenicoBPOSRetThreadUnit.pas',
  IngenicoOperation in 'IngenicoOperation.pas',
  Not_Final_Doc_Show in 'Not_Final_Doc_Show.pas' {F_Not_Final_Doc_Show};

{$R *.res}
  var
 MutexHandle : THandle;
const
 MutexName = 'POS_TP_mutex';
begin

  // Пробуем открыть Mutex по имени
  MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, MutexName);
  if MutexHandle <> 0 then
  begin
   // Копия нашего приложения уже запущена - Mutex уже есть
   CloseHandle(MutexHandle);
   MessageDlg('Программа'+MutexName+' уже выполняется!', mtError, [mbOk], 0);
   halt;
  end;
  // Создание Mutex
  MutexHandle := CreateMutex(nil, false, MutexName);


  Application.Initialize;

  if  FReg_servShowModal=1 then
  begin
    Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TDataModule2, DataModule2);
  if DM1.is_connected then
    begin
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TF_main, F_main);
      Application.Run;
    end;
  end;
    // Уничтожаем наш Mutex при завершении приложения
  CloseHandle(MutexHandle);

end.
