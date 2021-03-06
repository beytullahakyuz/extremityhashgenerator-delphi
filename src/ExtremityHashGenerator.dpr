program ExtremityHashGenerator;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uFunctions in 'uFunctions.pas',
  uTextGenerator in 'uTextGenerator.pas' {Form2},
  uCalculating in 'uCalculating.pas' {frmCalculation},
  uLanguage in 'uLanguage.pas',
  uExport in 'uExport.pas' {frmExport},
  uAbout in 'uAbout.pas' {frmAbout},
  Vcl.Styles.OwnerDrawFix in 'Vcl.Styles.OwnerDrawFix.pas',
  Vcl.Styles.Utils.SystemMenu in 'Vcl.Styles.Utils.SystemMenu.pas',
  Vcl.Styles.Utils.SysStyleHook in 'Vcl.Styles.Utils.SysStyleHook.pas',
  Vcl.Styles.Utils.SysControls in 'Vcl.Styles.Utils.SysControls.pas',
  Vcl.Styles.Utils.StdCtrls in 'Vcl.Styles.Utils.StdCtrls.pas',
  Vcl.Styles.Utils.ComCtrls in 'Vcl.Styles.Utils.ComCtrls.pas',
  Vcl.Styles.Utils.Forms in 'Vcl.Styles.Utils.Forms.pas',
  Vcl.Styles.Utils.Menus in 'Vcl.Styles.Utils.Menus.pas',
  Vcl.Styles.Utils.ScreenTips in 'Vcl.Styles.Utils.ScreenTips.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
