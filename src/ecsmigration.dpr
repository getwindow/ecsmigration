program ecsmigration;

{$R *.dres}

uses
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitMessage in 'UnitMessage.pas' {frmMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmMessage, frmMessage);
  Application.RegisterFormFamily('SplitPane', [TfrmMain]);
  Application.Run;
end.
