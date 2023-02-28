program AppSincAMV;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  System.SysUtils,
  untApplication in 'untApplication.pas' {frmAplication},
  CalDAV in 'CalDAV.pas',
  TZDB in 'TZDB.pas',
  untClasseSync in 'untClasseSync.pas';

{$R *.res}

var
  HprevHist : HWND;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SyncAMV Agenda';

  HprevHist := FindWindow(Nil, PChar('SyncAMV Agenda'));
  if HprevHist = 0 then
  begin
   Application.ShowMainForm := False;
   Application.CreateForm(TfrmAplication, frmAplication);

   frmAplication.apontamento();
   frmAplication.PopularPaineis();

   if UpperCase(ParamStr(1)) = 'AUTO=SIM' then
     frmAplication.SpeedButton1Click(frmAplication.SpeedButton1);

  end
  else
    ShowMessage('SyncAMV Agenda ja esta aberto em seu computador.');

  Application.CreateForm(TfrmAplication, frmAplication);
  Application.Run;
end.
