unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ToolWin, Menus, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Generics.Collections;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton10: TToolButton;
    cbxStop: TCheckBox;
    memoCtx: TMemo;
    Panel1: TPanel;
    memoLog: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    miOpen: TMenuItem;
    N2: TMenuItem;
    nExit: TMenuItem;
    H1: TMenuItem;
    A1: TMenuItem;
    StatusBar1: TStatusBar;
    Splitter4: TSplitter;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    miSql: TMenuItem;
    N3: TMenuItem;
    cbxURL: TComboBox;
    OpenDialog1: TOpenDialog;
    memoRst: TMemo;
    Splitter1: TSplitter;
    ToolButton1: TToolButton;
    rbInsert: TRadioButton;
    rbDel: TRadioButton;
    rbUpdate: TRadioButton;
    ToolButton2: TToolButton;
    edtTable: TEdit;
    edtRmFilds: TEdit;
    edtWhereCols: TEdit;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolBar2: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure miSqlClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FLogStrs: TStrings;
    { Private declarations }
    procedure addLog(const S: string);
    procedure addLogMod(const S: string; const nmod: integer);
    procedure setStatus(const S: string; const setCap: boolean=false;
      const tmSleep: integer=0);
    class function getAppFileName(const S: string): string; static;
    function  doStopSql(const S: string): Boolean;
    //procedure addLog(const S: string);
    //procedure addLogMod(const S: string; const nmod: integer);
    //class function getAppSubFile(const dir, S: string): string; static;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses StrUtils, uPaserUtils;

{$R *.dfm}

procedure TfrmMain.addLogMod(const S: string; const nmod: integer);
begin
  memoLog.Tag := memoLog.Tag + 1;
  if (memoLog.Tag mod 100 = 0) then begin
    Application.ProcessMessages;
  end;
  if (memoLog.Tag mod nmod = 0) then begin
    self.setStatus(IntToStr(memoLog.Tag)+'/'+s);
  end else if (memoLog.Tag mod 1000 = 0) then begin
    memolog.Lines.BeginUpdate;
    try
      memoLog.Lines.AddStrings(FLogStrs);
      FLogStrs.Clear;
    finally
      memolog.Lines.BeginUpdate;
    end;
  end else begin
    FLogStrs.Add(S);
  end;
end;

procedure TfrmMain.addLog(const S: string);
begin
  addLogMod(s, 10);
end;

procedure TfrmMain.setStatus(const S: string; const setCap: boolean; const tmSleep: integer);
begin
  StatusBar1.Tag := StatusBar1.Tag + 1;
  StatusBar1.Panels[0].Text := S;
  if setCap then begin
    caption := S;
  end;
  sleep(tmSleep);
  if (StatusBar1.Tag mod 100 = 0) then begin
    Application.ProcessMessages;
  end;
end;

class function TfrmMain.getAppFileName(const S: string): string;
begin
  Result := ExtractFilePath(Application.exeName) + S;
end;

procedure TfrmMain.miOpenClick(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  PopupMenu1.Popup(pt.X, pt.Y);
end;

{class function TfrmMain.getAppSubFile(const dir, S: string): string;
begin
  Result := getAppFilename( dir + '\' + S);
end;}

{procedure TfrmMain.addLogMod(const S: string; const nmod: integer);
begin
  memoLog.Tag := memoLog.Tag + 1;
  if (memoLog.Tag mod 100 = 0) then begin
    Application.ProcessMessages;
  end;
  if (memoLog.Tag mod nmod = 0) then begin
    self.setStatus(IntToStr(memoLog.Tag)+'/'+s);
  //end else if (memoLog.Tag mod 1000 = 0) then begin
    memoLog.Lines.Add(S);
  end;
end;}

{procedure TfrmMain.addLog(const S: string);
begin
  addLogMod(s, 10);
end;}

procedure TfrmMain.miSqlClick(Sender: TObject);
var s: string;
begin
  memoLog.Tag := 0;
  StatusBar1.Tag := 0;
  Screen.Cursor := crHourGlass;
  memoRst.lines.beginUpdate;
  try
    if rbInsert.Checked then begin
      TPaserUtils.getInsertSqlOfStrs(memoCtx.Lines, edtTable.Text,
        memoRst.Lines, doStopSql);
    end else if rbUpdate.Checked then begin
      s := edtTable.Text;
      if s.StartsWith('a_cartype') then begin
        TPaserUtils.getUpdateSqlOfStrs(memoCtx.Lines, edtTable.Text, 'rawid',
          memoRst.Lines, 'carTypeId', doStopSql);
      end else begin
        TPaserUtils.getUpdateSqlOfStrs(memoCtx.Lines, edtTable.Text,
          edtWhereCols.Text, memoRst.Lines, edtRmFilds.Text, doStopSql);
      end;
    end;
  finally
    memoRst.lines.endUpdate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.N4Click(Sender: TObject);

  function isExistIt(const S: string): boolean;
  var i: integer;
  begin
    Result := false;
    for I := 0 to self.cbxURL.Items.Count - 1 do begin
      if SameText(S, cbxURL.Items[I]) then begin
        Result := true;
        cbxurl.ItemIndex := I;
        break;
      end;
    end;
  end;

var s: string;
begin
  if OpenDialog1.Execute then begin
    s := OpenDialog1.FileName;
    if not isExistIt(s) then begin
      if self.cbxURL.Items.Count > 10 then begin
        cbxURL.Items.Delete(cbxURL.Items.Count-1);
      end;
      cbxURL.Items.Insert(0, S);
      cbxurl.ItemIndex := 0;  //cbxURL.Items.Count-1;
    end;
  end;
end;

procedure TfrmMain.N5Click(Sender: TObject);
  procedure load(S: string; strs: TStrings);
  begin
    S := StringReplace(S, #10, '', []);
    S := StringReplace(S, #13, '', []);
    strs.LoadFromFile(S, TEncoding.UTF8);
  end;
begin
  memoLog.Tag := 0;
  StatusBar1.Tag := 0;
  Screen.Cursor := crHourGlass;
  MemoCtx.lines.beginUpdate;
  try
    load(cbxURL.Text, MemoCtx.Lines);
    cbxURL.Items.SaveToFile(getAppFileName('lastfile.txt'), TEncoding.UTF8);
  finally
    MemoCtx.lines.endUpdate;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmMain.doStopSql(const S: string): Boolean;
begin
  //addLogMod(S, 100);
  //self.setStatus(IntToStr(memoLog.Tag)+'/'+s);
  addLog(S);
  if cbxStop.checked then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FLogStrs := TStringList.Create;
  OpenDialog1.InitialDir := self.getAppFileName('');
  if FileExists(getAppFileName('lastfile.txt')) then begin
    cbxURL.Items.LoadFromFile(getAppFileName('lastfile.txt'), TEncoding.UTF8);
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FLogStrs.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  self.WindowState := wsMaximized;
end;

end.
