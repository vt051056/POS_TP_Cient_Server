unit CShPorts_TLB;

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
// File generated on 10.06.2021 12:41:18 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWow64\CShPorts.dll (1)
// LIBID: {7A8DE1BA-B5A3-4225-88AC-8063CFAB9C8A}
// LCID: 0
// Helpfile: 
// HelpString: CShPorts Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
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
  CShPortsMajorVersion = 1;
  CShPortsMinorVersion = 0;

  LIBID_CShPorts: TGUID = '{7A8DE1BA-B5A3-4225-88AC-8063CFAB9C8A}';

  IID_IKripton: TGUID = '{8B5CAE82-FB34-4FCE-A961-5344F61505C6}';
  CLASS_Kripton: TGUID = '{082F3B60-07B9-423C-AAC4-A8D5F1611E2B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IKripton = interface;
  IKriptonDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Kripton = IKripton;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  //PShortint1 = ^Shortint; {*}


// *********************************************************************//
// Interface: IKripton
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B5CAE82-FB34-4FCE-A961-5344F61505C6}
// *********************************************************************//
  IKripton = interface(IDispatch)
    ['{8B5CAE82-FB34-4FCE-A961-5344F61505C6}']
    function SendCommand(cmd: Integer; const data: WideString): Integer; safecall;
    function OpenPort(const port: WideString; speed: Integer): Integer; safecall;
    procedure ClosePort; safecall;
    function Get_Count: Integer; safecall;
    function Get_RetItem: WideString; safecall;
    function Get_Number: Integer; safecall;
    procedure Set_Number(Value: Integer); safecall;
    function Get_Error: WideString; safecall;
    function Get_Status0: Integer; safecall;
    function Get_Status1: Integer; safecall;
    function Get_Status2: Integer; safecall;
    function Get_Status3: Integer; safecall;
    function Get_Status4: Integer; safecall;
    function Get_Status5: Integer; safecall;
    function Get_StatusAll: Integer; safecall;
    procedure Set_ddd(var Param1: Shortint); safecall;
    function Run27H(LogoPrnt: Integer; NoPrntRec: Integer; NumFdPrnt: Integer; CodePrnt: Integer; 
                    BigPaper: Integer): Integer; safecall;
    function SendResolution(ix: Integer; iy: Integer): Integer; safecall;
    function SendCommandData(pix: Pointer): Integer; safecall;
    property Count: Integer read Get_Count;
    property RetItem: WideString read Get_RetItem;
    property Number: Integer read Get_Number write Set_Number;
    property Error: WideString read Get_Error;
    property Status0: Integer read Get_Status0;
    property Status1: Integer read Get_Status1;
    property Status2: Integer read Get_Status2;
    property Status3: Integer read Get_Status3;
    property Status4: Integer read Get_Status4;
    property Status5: Integer read Get_Status5;
    property StatusAll: Integer read Get_StatusAll;
    //property ddd: PShortint1 write Set_ddd;
  end;

// *********************************************************************//
// DispIntf:  IKriptonDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B5CAE82-FB34-4FCE-A961-5344F61505C6}
// *********************************************************************//
  IKriptonDisp = dispinterface
    ['{8B5CAE82-FB34-4FCE-A961-5344F61505C6}']
    function SendCommand(cmd: Integer; const data: WideString): Integer; dispid 1;
    function OpenPort(const port: WideString; speed: Integer): Integer; dispid 3;
    procedure ClosePort; dispid 4;
    property Count: Integer readonly dispid 2;
    property RetItem: WideString readonly dispid 5;
    property Number: Integer dispid 6;
    property Error: WideString readonly dispid 8;
    property Status0: Integer readonly dispid 9;
    property Status1: Integer readonly dispid 10;
    property Status2: Integer readonly dispid 11;
    property Status3: Integer readonly dispid 12;
    property Status4: Integer readonly dispid 13;
    property Status5: Integer readonly dispid 14;
    property StatusAll: Integer readonly dispid 15;
    property ddd: {NOT_OLEAUTO(PShortint1)}OleVariant writeonly dispid 7;
    function Run27H(LogoPrnt: Integer; NoPrntRec: Integer; NumFdPrnt: Integer; CodePrnt: Integer; 
                    BigPaper: Integer): Integer; dispid 16;
    function SendResolution(ix: Integer; iy: Integer): Integer; dispid 17;
    function SendCommandData(pix: {NOT_OLEAUTO(Pointer)}OleVariant): Integer; dispid 18;
  end;

// *********************************************************************//
// The Class CoKripton provides a Create and CreateRemote method to          
// create instances of the default interface IKripton exposed by              
// the CoClass Kripton. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoKripton = class
    class function Create: IKripton;
    class function CreateRemote(const MachineName: string): IKripton;
  end;

implementation

uses System.Win.ComObj;

class function CoKripton.Create: IKripton;
begin
  Result := CreateComObject(CLASS_Kripton) as IKripton;
end;

class function CoKripton.CreateRemote(const MachineName: string): IKripton;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Kripton) as IKripton;
end;

end.
