unit APScale_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 25.06.2019 16:01:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWow64\AP.DLL (1)
// LIBID: {DFDB33C7-2556-4AD8-889C-ED4E3EEB2232}
// LCID: 0
// Helpfile: 
// HelpString: AP, AD, DB Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: TypeInfo 'APScale' changed to 'APScale_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  APScaleMajorVersion = 1;
  APScaleMinorVersion = 0;

  LIBID_APScale: TGUID = '{DFDB33C7-2556-4AD8-889C-ED4E3EEB2232}';

  IID_IAPScale: TGUID = '{6DC66951-817C-4450-ACD3-2DD11A4ECFDC}';
  DIID_IAPScaleEvents: TGUID = '{D9F1AD0C-D99F-4220-A7A8-B7661886AC60}';
  CLASS_APScale_: TGUID = '{285675A4-C05B-4CDB-A74A-F8868F7F5350}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAPScale = interface;
  IAPScaleDisp = dispinterface;
  IAPScaleEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  APScale_ = IAPScale;


// *********************************************************************//
// Interface: IAPScale
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6DC66951-817C-4450-ACD3-2DD11A4ECFDC}
// *********************************************************************//
  IAPScale = interface(IDispatch)
    ['{6DC66951-817C-4450-ACD3-2DD11A4ECFDC}']
    procedure Connect(const Port: WideString); safecall;
    procedure DisConnect; safecall;
    function Get_Data: OleVariant; safecall;
    property Data: OleVariant read Get_Data;
  end;

// *********************************************************************//
// DispIntf:  IAPScaleDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6DC66951-817C-4450-ACD3-2DD11A4ECFDC}
// *********************************************************************//
  IAPScaleDisp = dispinterface
    ['{6DC66951-817C-4450-ACD3-2DD11A4ECFDC}']
    procedure Connect(const Port: WideString); dispid 1;
    procedure DisConnect; dispid 3;
    property Data: OleVariant readonly dispid 6;
  end;

// *********************************************************************//
// DispIntf:  IAPScaleEvents
// Flags:     (4096) Dispatchable
// GUID:      {D9F1AD0C-D99F-4220-A7A8-B7661886AC60}
// *********************************************************************//
  IAPScaleEvents = dispinterface
    ['{D9F1AD0C-D99F-4220-A7A8-B7661886AC60}']
  end;

// *********************************************************************//
// The Class CoAPScale_ provides a Create and CreateRemote method to          
// create instances of the default interface IAPScale exposed by              
// the CoClass APScale_. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAPScale_ = class
    class function Create: IAPScale;
    class function CreateRemote(const MachineName: string): IAPScale;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAPScale
// Help String      : APScale Object
// Default Interface: IAPScale
// Def. Intf. DISP? : No
// Event   Interface: IAPScaleEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAPScale = class(TOleServer)
  private
    FIntf: IAPScale;
    function GetDefaultInterface: IAPScale;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Data: OleVariant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAPScale);
    procedure Disconnect; override;
    procedure Connect1(const Port: WideString);
    procedure DisConnect1;
    property DefaultInterface: IAPScale read GetDefaultInterface;
    property Data: OleVariant read Get_Data;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoAPScale_.Create: IAPScale;
begin
  Result := CreateComObject(CLASS_APScale_) as IAPScale;
end;

class function CoAPScale_.CreateRemote(const MachineName: string): IAPScale;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_APScale_) as IAPScale;
end;

procedure TAPScale.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{285675A4-C05B-4CDB-A74A-F8868F7F5350}';
    IntfIID:   '{6DC66951-817C-4450-ACD3-2DD11A4ECFDC}';
    EventIID:  '{D9F1AD0C-D99F-4220-A7A8-B7661886AC60}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAPScale.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IAPScale;
  end;
end;

procedure TAPScale.ConnectTo(svrIntf: IAPScale);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TAPScale.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TAPScale.GetDefaultInterface: IAPScale;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAPScale.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TAPScale.Destroy;
begin
  inherited Destroy;
end;

procedure TAPScale.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
  end; {case DispID}
end;

function TAPScale.Get_Data: OleVariant;
begin
  Result := DefaultInterface.Data;
end;

procedure TAPScale.Connect1(const Port: WideString);
begin
  DefaultInterface.Connect(Port);
end;

procedure TAPScale.DisConnect1;
begin
  DefaultInterface.DisConnect;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TAPScale]);
end;

end.
