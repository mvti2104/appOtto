program OttoBot;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  About in 'About.pas' {frmAbout},
  u_urlOpen in 'Units\u_urlOpen.pas',
  Setup in 'Setup.pas' {frmSetup},
  BTConfig in 'Units\BTConfig.pas',
  uCombobox in 'Units\uCombobox.pas',
  uLoading in 'Units\uLoading.pas',
  AddMoves in 'AddMoves.pas' {frmAddMoves};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSetup, frmSetup);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmAddMoves, frmAddMoves);
  Application.Run;
end.

