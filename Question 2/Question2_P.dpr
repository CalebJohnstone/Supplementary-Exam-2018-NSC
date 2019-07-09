program Question2_P;

uses
  Forms,
  Question2_U in 'Question2_U.pas' {frmQ2},
  Star_U in 'Star_U.pas' {$R *.res};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TfrmQ2, frmQ2);
  Application.Run;
end.
