program row2sql;

uses
  Vcl.Forms,
  uFrmMain in 'src\uFrmMain.pas' {frmMain},
  HtmlParser_XE3UP in 'src\utils\HtmlParser_XE3UP.pas',
  uCharSplit in 'src\utils\uCharSplit.pas',
  uPaserUtils in 'src\utils\uPaserUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
