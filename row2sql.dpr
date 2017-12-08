program row2sql;

uses
  Vcl.Forms,
  uFrmMain in 'src\uFrmMain.pas' {frmMain},
  uCharSplit in '..\delphiutils\src\utils\uCharSplit.pas',
  uSqlUtils in '..\delphiutils\src\utils\uSqlUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
