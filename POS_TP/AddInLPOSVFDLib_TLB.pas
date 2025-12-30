unit AddInLPOSVFDLib_TLB;

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
// File generated on 15.07.2021 16:28:46 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWow64\lposvfd.dll (1)
// LIBID: {09F0A650-1A24-42BC-8523-A4BF7F1F6332}
// LCID: 0
// Helpfile: 
// HelpString: LPOSVFD 1.0 Type Library
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
  AddInLPOSVFDLibMajorVersion = 1;
  AddInLPOSVFDLibMinorVersion = 0;

  LIBID_AddInLPOSVFDLib: TGUID = '{09F0A650-1A24-42BC-8523-A4BF7F1F6332}';

  IID_IAddInLPOSVFD: TGUID = '{9E13F83D-5FDE-475D-918F-183E61315B05}';
  IID_IInitDone: TGUID = '{AB634001-F13D-11D0-A459-004095E1DAEA}';
  IID_ILanguageExtender: TGUID = '{AB634003-F13D-11D0-A459-004095E1DAEA}';
  IID_ILocale: TGUID = '{E88A191E-8F52-4261-9FAE-FF7AA84F5D7E}';
  CLASS_AddInLPOSVFD: TGUID = '{026FFB5D-6315-44B6-B62E-2477066DD715}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAddInLPOSVFD = interface;
  IInitDone = interface;
  ILanguageExtender = interface;
  ILocale = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AddInLPOSVFD = IAddInLPOSVFD;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IAddInLPOSVFD
// Flags:     (0)
// GUID:      {9E13F83D-5FDE-475D-918F-183E61315B05}
// *********************************************************************//
  IAddInLPOSVFD = interface(IUnknown)
    ['{9E13F83D-5FDE-475D-918F-183E61315B05}']
  end;

// *********************************************************************//
// Interface: IInitDone
// Flags:     (0)
// GUID:      {AB634001-F13D-11D0-A459-004095E1DAEA}
// *********************************************************************//
  IInitDone = interface(IUnknown)
    ['{AB634001-F13D-11D0-A459-004095E1DAEA}']
    function Init(const pConnection: IDispatch): HResult; stdcall;
    function Done: HResult; stdcall;
    function GetInfo(var pInfo: PSafeArray): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ILanguageExtender
// Flags:     (0)
// GUID:      {AB634003-F13D-11D0-A459-004095E1DAEA}
// *********************************************************************//
  ILanguageExtender = interface(IUnknown)
    ['{AB634003-F13D-11D0-A459-004095E1DAEA}']
    function RegisterExtensionAs(var bstrExtensionName: WideString): HResult; stdcall;
    function GetNProps(var plProps: Integer): HResult; stdcall;
    function FindProp(const bstrPropName: WideString; var plPropNum: Integer): HResult; stdcall;
    function GetPropName(lPropNum: Integer; lPropAlias: Integer; var pbstrPropName: WideString): HResult; stdcall;
    function GetPropVal(lPropNum: Integer; var pvarPropVal: OleVariant): HResult; stdcall;
    function SetPropVal(lPropNum: Integer; const varPropVal: OleVariant): HResult; stdcall;
    function IsPropReadable(lPropNum: Integer; var pboolPropRead: Integer): HResult; stdcall;
    function IsPropWritable(lPropNum: Integer; var pboolPropWrite: Integer): HResult; stdcall;
    function GetNMethods(var plMethods: Integer): HResult; stdcall;
    function FindMethod(const bstrMethodName: WideString; var plMethodNum: Integer): HResult; stdcall;
    function GetMethodName(lMethodNum: Integer; lMethodAlias: Integer; 
                           var pbstrMethodName: WideString): HResult; stdcall;
    function GetNParams(lMethodNum: Integer; var plParams: Integer): HResult; stdcall;
    function GetParamDefValue(lMethodNum: Integer; lParamNum: Integer; 
                              var pvarParamDefValue: OleVariant): HResult; stdcall;
    function HasRetVal(lMethodNum: Integer; var pboolRetValue: Integer): HResult; stdcall;
    function CallAsProc(lMethodNum: Integer; var paParams: PSafeArray): HResult; stdcall;
    function CallAsFunc(lMethodNum: Integer; var pvarRetValue: OleVariant; var paParams: PSafeArray): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ILocale
// Flags:     (0)
// GUID:      {E88A191E-8F52-4261-9FAE-FF7AA84F5D7E}
// *********************************************************************//
  ILocale = interface(IUnknown)
    ['{E88A191E-8F52-4261-9FAE-FF7AA84F5D7E}']
    function SetLocale(const bstrLocale: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoAddInLPOSVFD provides a Create and CreateRemote method to          
// create instances of the default interface IAddInLPOSVFD exposed by              
// the CoClass AddInLPOSVFD. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAddInLPOSVFD = class
    class function Create: IAddInLPOSVFD;
    class function CreateRemote(const MachineName: string): IAddInLPOSVFD;
  end;

implementation

uses System.Win.ComObj;

class function CoAddInLPOSVFD.Create: IAddInLPOSVFD;
begin
  Result := CreateComObject(CLASS_AddInLPOSVFD) as IAddInLPOSVFD;
end;

class function CoAddInLPOSVFD.CreateRemote(const MachineName: string): IAddInLPOSVFD;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AddInLPOSVFD) as IAddInLPOSVFD;
end;

end.
