unit UnitMain;

{
  Migration Assistant v1.0.0 - Main Form

  The MIT License (MIT)
  Copyright (c) 2012 Guangzhou Cloudstrust Software Development Co., Ltd
  http://cloudstrust.com/

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.ListBox,
  FMX.Gestures, FMX.TabControl, FMX.Ani, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.IdAntiFreeze, IdDNSResolver,
  FMX.Edit, FMX.Memo, IdGlobal, IdExplicitTLSClientServerBase, IdFTP, Data.DB,
  Data.SqlExpr;

const
  MAX_STEP = 5;

type
  TfrmMain = class(TForm)
    styleMain: TStyleBook;
    loMain: TLayout;
    loMenu: TLayout;
    lbMenu: TListBox;
    lbiStep1: TMetropolisUIListBoxItem;
    lbiStep2: TMetropolisUIListBoxItem;
    lbiStep3: TMetropolisUIListBoxItem;
    lbiStep4: TMetropolisUIListBoxItem;
    loMenuHeader: TLayout;
    laMenuTitle: TLabel;
    loSteps: TLayout;
    tcSteps: TTabControl;
    tiStep1: TTabItem;
    tiStep2: TTabItem;
    tiStep3: TTabItem;
    tiStep4: TTabItem;
    sbStep1: TVertScrollBox;
    loStep1Header: TLayout;
    imgStep1Icon: TImageControl;
    loStep1Title: TLayout;
    laStep1Title: TLabel;
    laStep1SubTitle: TLabel;
    laText1_1: TLabel;
    sbStep2: TVertScrollBox;
    loStep2Header: TLayout;
    imgStep2Icon: TImageControl;
    loStep2Title: TLayout;
    laStep2Title: TLabel;
    laStep2SubTitle: TLabel;
    sbStep3: TVertScrollBox;
    loStep3Header: TLayout;
    imgStep3Icon: TImageControl;
    loStep3Title: TLayout;
    laStep3Title: TLabel;
    laStep3SubTitle: TLabel;
    sbStep4: TVertScrollBox;
    loStep4Header: TLayout;
    imgStep4Icon: TImageControl;
    loStep4Title: TLayout;
    laStep4Title: TLabel;
    laStep4SubTitle: TLabel;
    loToolbar: TLayout;
    ppToolbar: TPopup;
    ppToolbarAnimation: TFloatAnimation;
    tbMain: TToolBar;
    btnMinimize: TButton;
    btnAbout: TButton;
    btnClose: TButton;
    loProgress: TLayout;
    aniProgress: TAniIndicator;
    lbiStep5: TMetropolisUIListBoxItem;
    tiStep5: TTabItem;
    sbStep5: TVertScrollBox;
    loStep5Header: TLayout;
    imgStep5Icon: TImageControl;
    loStep5Title: TLayout;
    laStep5Title: TLabel;
    laStep5SubTitle: TLabel;
    laText5_1: TLabel;
    laText1_2: TLabel;
    laText1_3: TLabel;
    laText1_4: TLabel;
    laText1_5: TLabel;
    laText1_6: TLabel;
    laText1_7: TLabel;
    laText1_8: TLabel;
    laText1_9: TLabel;
    laText1_10: TLabel;
    laText1_11: TLabel;
    laText1_12: TLabel;
    laText1_13: TLabel;
    laText1_14: TLabel;
    laText1_15: TLabel;
    pnStep1Navigation: TPanel;
    btnStep1Next: TButton;
    pnStep2Navigation: TPanel;
    btnStep2Prev: TButton;
    btnStep2Next: TButton;
    http: TIdHTTP;
    sbMain: THorzScrollBox;
    tmrDeferredInit: TTimer;
    pbDownload: TProgressBar;
    laServerAddress: TLabel;
    laMysqlUsername: TLabel;
    laMysqlDatabase: TLabel;
    laFtpPassword: TLabel;
    laFtpUsername: TLabel;
    edServerAddress: TEdit;
    edMysqlPassword: TEdit;
    edMysqlDatabase: TEdit;
    edMysqlUsername: TEdit;
    edFtpUsername: TEdit;
    edFtpPassword: TEdit;
    laMysqlPassword: TLabel;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    PasswordEditButton1: TPasswordEditButton;
    ClearEditButton3: TClearEditButton;
    ClearEditButton4: TClearEditButton;
    PasswordEditButton2: TPasswordEditButton;
    laText3_1: TLabel;
    laText3_3: TLabel;
    laText3_2: TLabel;
    laText3_5: TLabel;
    laText3_4: TLabel;
    laText4_1: TLabel;
    mmLogs: TMemo;
    laText5_6: TLabel;
    laText5_5: TLabel;
    laText5_2: TLabel;
    laText5_3: TLabel;
    laText5_4: TLabel;
    pbMigration: TProgressBar;
    pnFinish: TPanel;
    btnFinish: TButton;
    ftp: TIdFTP;
    tmrDeferredLog: TTimer;
    mmSqlDumpScript: TMemo;
    tmrCheckDbDump: TTimer;
    mmListFileScript: TMemo;
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ToolbarCloseButtonClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbiStep1Click(Sender: TObject);
    procedure btnStep1NextClick(Sender: TObject);
    procedure btnStep2PrevClick(Sender: TObject);
    procedure btnStep2NextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure httpRedirect(Sender: TObject; var dest: string;
      var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
    procedure tmrDeferredInitTimer(Sender: TObject);
    procedure httpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure httpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure httpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnFinishClick(Sender: TObject);
    procedure tmrDeferredLogTimer(Sender: TObject);
    procedure tmrCheckDbDumpTimer(Sender: TObject);
    procedure ftpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure ftpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure ftpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    FGestureOrigin: TPointF;
    FGestureInProgress: Boolean;
    FAntiFreeze: TIdAntiFreeze;
    currentStep: integer;
    FtpFileCount: integer;
    FtpFileTotal: integer;
    FtpFileLogs: TStringList;

    { Private declarations }
    procedure ShowToolbar(AShow: Boolean);

    procedure SetIcon(const step: integer; const prefix: string);
    procedure SwitchStepIcon(const oldStep, newStep: integer);
    procedure InitStepIcons;
    procedure InitStepTitles;
    procedure LoadStep(const step: integer);
    procedure StartProgress;
    procedure StopProgress;

    procedure DownloadResources;
    procedure SetDownloadDescription(desc: string);
    procedure SetDownloadProgress(progress: Int64; max: Int64 = -1);

    procedure InstallResources;
    procedure ConfigServices;

    procedure StartLogging;
    procedure StopLogging;

    procedure StartCheckDbDump;
    procedure StopCheckDbDump;

    procedure DumpRestore;
    procedure DoMigration;

    procedure FtpDownloadRecursive(var ftp: TIdFtp; remote, local: string);
    procedure FtpDownloadList(var ftp: TIdFtp; files: TStringList; local: string);
    procedure DisconnectAll;

    function GetFtpRoot: string;

    procedure Cleanup;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses UnitMessage, Windows, ShellAPI, TLHelp32, IdHashMessageDigest, IdFTPList, IdGlobalProtocols;

const
  WAMP_ROOT = 'C:\wamp\';
  WAMP_CONF = WAMP_ROOT + 'wampmanager.conf';
  WAMP_EXE = WAMP_ROOT + 'wampmanager.exe';
  APACHE_CONF = WAMP_ROOT + 'bin\apache\apache2.2.22\conf\httpd.conf';
  WWW_ROOT = WAMP_ROOT + 'www\';
  WWW_DEFAULT_FILE1 = WWW_ROOT + 'index.php';
  WWW_DEFAULT_FILE2 = WWW_ROOT + 'testmysql.php';
  FTP_CONF1 = 'C:\Program Files\FileZilla Server\FileZilla Server.xml';
  FTP_CONF2 = 'C:\Program Files (x86)\FileZilla Server\FileZilla Server.xml';
  FTP_EXE1 = 'C:\Program Files\FileZilla Server\FileZilla Server.exe';
  FTP_EXE2 = 'C:\Program Files (x86)\FileZilla Server\FileZilla Server.exe';
  MYSQL_EXE = WAMP_ROOT + 'bin\mysql\mysql5.5.24\bin\mysql.exe';
  MYSQLDUMP_EXE = WAMP_ROOT + 'bin\mysql\mysql5.5.24\bin\mysqldump.exe';

  FTP_LOG_FILE = WWW_ROOT + '_migration_logs.php';
  FTP_LIST_SCRIPT_FILE = '_migration_list.php';
  DB_ROOT_SCRIPT_FILE = WWW_ROOT + '_migration_chroot.php';
  DB_DUMP_SCRIPT_FILE = '_migration_dump.php';
  DB_DUMP_FILE = WWW_ROOT + '_migration_db.sql';

var
  //local filename for resources
  vcredist, wampserver, filezilla: string;
  //external ip address
  external_ipaddr: string;
  //root directory in ftp, "/" or "public_html", "www", "wwwroot", etc
  ftp_root: string;

/////////////////////// Utilities ///////////////////////
//determine 64 bits OS
function Is64Bits: Boolean;
type
  TIsWow64Process = function(
    Handle: THandle;
    var Res: BOOL
  ): BOOL; stdcall;
var
  IsWow64Result: BOOL;
  IsWow64Process: TIsWow64Process;
begin
  IsWow64Process := GetProcAddress(
    GetModuleHandle('kernel32'), 'IsWow64Process'
  );
  if Assigned(IsWow64Process) then
  begin
    if not IsWow64Process(GetCurrentProcess, IsWow64Result) then
      raise Exception.Create('Bad process handle');
    Result := IsWow64Result;
  end
  else
    Result := False;
end;

//execute and wait for terminating
function ExecAppWait(Handle: Integer; AppName, Params: string; Mode: Integer): Boolean;
var
  // Structure containing and receiving info about application to start
  ShellExInfo: TShellExecuteInfo;
begin
  FillChar(ShellExInfo, SizeOf(ShellExInfo), 0);
  with ShellExInfo do begin
    cbSize := SizeOf(ShellExInfo);
    fMask := see_Mask_NoCloseProcess;
    Wnd := Handle;
    lpFile := PChar(AppName);
    lpParameters := PChar(Params);
    nShow := Mode;
  end;
  Result := ShellExecuteEx(@ShellExInfo);

  if Result then
    while WaitForSingleObject(ShellExInfo.HProcess, 100) = WAIT_TIMEOUT do
    begin
      Application.ProcessMessages;
      if Application.Terminated then Break;
    end;
end;

//find process
function FindProcess(AFileName: string): boolean;
var
  hSnapshot: THandle;
  lppe: TProcessEntry32;
  Found: Boolean;
begin
  Result :=False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  lppe.dwSize := SizeOf(TProcessEntry32);
  Found := Process32First(hSnapshot, lppe);
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile))=UpperCase(AFileName)) or (UpperCase(lppe.szExeFile )=UpperCase(AFileName))) then
    begin
      Result :=True;
    end;
    Found := Process32Next(hSnapshot, lppe);
  end;
end;

//get system temp directory
function GetTempDirectory: string;
var
  arr: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, arr);
  result := arr;
end;

//generate md5 hash
function MD5(const Input: String): String;
var
  md5: TIdHashMessageDigest5; //md5 engine
begin
  //initialize md5 engine
  md5 := TIdHashMessageDigest5.Create;

  Result := md5.HashStringAsHex(Input);

  md5.Destroy;
end;

//download all files in the list
procedure TfrmMain.FtpDownloadList(var ftp: TIdFtp; files: TStringList;
  local: string);
var
  root, filename: string;
  I: Integer;
begin
  self.FtpFileTotal := files.Count;

  root := self.GetFtpRoot;
  if not self.ftp.Connected then
    ftp.Connect;

  for I := 0 to files.Count - 1 do
  begin
    filename := local + StringReplace(files[I], '/', '\', [rfReplaceAll]);
    try
      self.FtpFileLogs.Add(TimeToStr(now) + ' 正在快速同步文件“'+ExtractFilename(filename)+'”');
      ForceDirectories(ExtractFilePath(filename));
      ftp.Get(root + files[I], filename, true, false); //overwrite, don't resume
      inc(self.FtpFileCount);
    except

    end;
  end;
end;

//download all files recursively, don't need files list
//usage: FtpDownloadRecursive(ftp, '/', 'c:\test\'); //absolute paths
procedure TfrmMain.FtpDownloadRecursive(var ftp: TIdFtp; remote, local: string);
var
  count: Integer;
  I: Integer;
  dirs: TStringList;
begin
  try
    self.FtpFileLogs.Add(TimeToStr(now) + ' 正在同步文件夹“'+remote+'”');
    ftp.ChangeDir(remote);
    ForceDirectories(local);
    ftp.List;

    count := ftp.DirectoryListing.Count;
    dirs := TStringList.Create;

    for I := 0 to count - 1 do
    begin
      //file
      if ftp.DirectoryListing[I].ItemType = ditFile then
      begin
        self.FtpFileLogs.Add(TimeToStr(now) + ' 正在同步文件“'+ftp.DirectoryListing[I].FileName+'”');
        ftp.Get(remote + ftp.DirectoryListing[I].FileName,
                local + ftp.DirectoryListing[I].FileName, true, false); //overwrite, don't resume
        inc(self.FtpFileCount);
      end;

      //dir
      if (ftp.DirectoryListing[I].ItemType = ditDirectory)
     and (ftp.DirectoryListing[I].FileName <> '.')
     and (ftp.DirectoryListing[I].FileName <> '..') then
      begin
        dirs.Add(ftp.DirectoryListing[I].FileName);
      end;
    end;

    for I := 0 to dirs.Count - 1 do
    begin
      FtpDownloadRecursive(ftp, remote + dirs[I] + '/',
                     local + dirs[I] + '\');
    end;

    dirs.Free;
  except

  end;
end;

procedure TfrmMain.ftpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  self.SetDownloadProgress(AWorkCount);
end;

procedure TfrmMain.ftpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  self.SetDownloadProgress(0, AWorkCountMax);
end;

procedure TfrmMain.ftpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  self.SetDownloadProgress(-1);
end;

function TfrmMain.GetFtpRoot: string;
var
  I: integer;
begin
  if ftp_root <> '' then
  begin
    result := ftp_root;
    exit;
  end;

  self.ftp.Host := self.edServerAddress.Text;
  self.ftp.Username := self.edFtpUsername.Text;
  self.ftp.Password := self.edFtpPassword.Text;
  self.ftp.Connect;
  self.ftp.List;

  result := '/';
  for I := 0 to self.ftp.DirectoryListing.Count - 1 do
  begin
    if self.ftp.DirectoryListing[I].FileName = 'public_html' then
    begin
      result := '/public_html';
      break;
    end
    else if self.ftp.DirectoryListing[I].FileName = 'www' then
    begin
      result := '/www';
      break;
    end
    else if self.ftp.DirectoryListing[I].FileName = 'wwwroot' then
    begin
      result := '/wwwroot';
      break;
    end;
  end;

  //don't close connection
  ftp_root := result;
end;

/////////////////////// Main Form ///////////////////////
procedure TfrmMain.httpRedirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
begin
  Handled := true;
end;

procedure TfrmMain.httpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  self.SetDownloadProgress(AWorkCount);
end;

procedure TfrmMain.httpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  self.SetDownloadProgress(0, AWorkCountMax);
end;

procedure TfrmMain.httpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  self.SetDownloadProgress(-1);
end;

procedure TfrmMain.InitStepIcons;
var
  I: Integer;
begin
  for I := 1 to MAX_STEP do
    self.SetIcon(I, 'color');
end;

procedure TfrmMain.InitStepTitles;
var
  I: Integer;
  laTitle, laSubTitle: TLabel;
  lbi: TMetropolisUIListBoxItem;
begin
  for I := 1 to MAX_STEP do
  begin
    laTitle := self.FindComponent('laStep'+IntToStr(I)+'Title') as TLabel;
    laSubTitle := self.FindComponent('laStep'+IntToStr(I)+'SubTitle') as TLabel;
    lbi := self.FindComponent('lbiStep'+IntToStr(I)) as TMetropolisUIListBoxItem;
    laTitle.Text := lbi.Title;
    laSubTitle.Text := lbi.SubTitle;
  end;
end;

procedure TfrmMain.InstallResources;
begin
  //check exist
  if FileExists(WAMP_EXE) and (FileExists(FTP_EXE1) or FileExists(FTP_EXE2)) then
    exit;

  if not FileExists(vcredist) then
  begin
    MessageDlg('错误', 'VC动态链接库下载失败，请重试！', '确定');
    raise Exception.Create('Unable to find resource.');
  end;

  if not FileExists(wampserver) then
  begin
    MessageDlg('错误', 'WampServer下载失败，请重试！', '确定');
    raise Exception.Create('Unable to find resource.');
  end;

  if not FileExists(filezilla) then
  begin
    MessageDlg('错误', 'FileZilla Server下载失败，请重试！', '确定');
    raise Exception.Create('Unable to find resource.');
  end;

  self.TopMost := true;
  //execute vcredist installer
  self.lbiStep3.Description := '正在安装VC动态链接库，请稍候……';
  ExecAppWait(self.Handle, vcredist, '/q', SW_SHOWMINIMIZED);

  //execute wampserver installer
  self.lbiStep3.Description := '正在安装WampServer，请稍候……';
  ExecAppWait(self.Handle, wampserver, '/silent', SW_SHOWMINIMIZED);

  self.lbiStep3.Description := '正在安装FileZilla Server，请稍候……';
  ExecAppWait(self.Handle, filezilla, '/S', SW_SHOWMINIMIZED);

  //kill interface
  ExecAppWait(self.Handle, 'TASKKILL', '/F /IM "Filezilla Server Interface.exe"', SW_SHOWMINIMIZED);

  self.lbiStep3.Description := '';
  self.TopMost := false;
end;

procedure TfrmMain.lbiStep1Click(Sender: TObject);
begin
  self.lbMenu.ItemIndex := currentStep - 1;
end;

procedure TfrmMain.LoadStep(const step: integer);
begin
  self.lbMenu.ItemIndex := step - 1;
  tcSteps.TabIndex := step - 1;

  self.SwitchStepIcon(currentStep, step);
  currentStep := step;

  self.pbDownload.Parent := self.FindComponent('lbiStep'+IntToStr(step)) as TFmxObject;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
var
  msg: string;
begin
  msg := '软件版本：1.0.0'#13#10
       + '基础类库：OSS (Open Storage Services) Delphi SDK v1.0.0'#13#10
       + '软件授权：MIT许可证 (The MIT License)'#13#10
       + '软件开发：广州云信软件开发有限公司 http://cloudstrust.com'#13#10
       + '联系方式：menway@gmail.com';

  MessageDlg('关于 '+self.Caption, msg, '确定');
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.MainForm.Close;
end;

procedure TfrmMain.btnFinishClick(Sender: TObject);
begin
  Application.MainForm.Close;
end;

procedure TfrmMain.btnMinimizeClick(Sender: TObject);
begin
  Application.MainForm.WindowState := TWindowState.wsMinimized;
end;

procedure TfrmMain.btnStep1NextClick(Sender: TObject);
begin
  self.LoadStep(2);

  //remote mysql connection popup
  MessageDlg('关于远程数据库连接 (Remote MySQL Connection)',
             '友情提示：如果您在原服务器开通了远程数据库连接功能，则可以显著加快原有数据库的迁移速度。'#13#10
           + '如果您需要开启远程数据连接功能，请与原服务器的网站托管商联系咨询详细的设置方法。'#13#10#13#10
           + '请放心，即便您没有在原服务器开通远程数据库连接功能，本软件也可以通过脚本方式迁移您的数据库。',
             '确定');
end;

procedure TfrmMain.btnStep2NextClick(Sender: TObject);
begin
  //validation...
  if (self.edServerAddress.Text = '')
  or (self.edMysqlDatabase.Text = '')
  or (self.edMysqlUsername.Text = '')
  or (self.edFtpUsername.Text = '')
   then
  begin
    MessageDlg('错误', '请填写所有的必要项。', '确定');
    exit;
  end;

  try
    self.LoadStep(3);
    //step 3:
    self.StartProgress;
    self.DownloadResources;
    self.InstallResources;
    self.ConfigServices;

    self.LoadStep(4);
    //step 4:
    self.DumpRestore;
    self.DoMigration;

    //step 5:
    self.Cleanup;
    self.StopProgress;
    self.LoadStep(5);

  except on e: Exception do
    begin
      MessageDlg('提示', '当前操作由于用户指令或内部命令而终止，请尝试重新运行应用程序。', '确定');
      Application.MainForm.Close;
    end;
  end;
end;

procedure TfrmMain.btnStep2PrevClick(Sender: TObject);
begin
  self.LoadStep(1);
end;

procedure TfrmMain.Cleanup;
var
  f: TStringList;
  found: boolean;
  target: string;
  I: integer;
begin
  //delete log file
  if FileExists(FTP_LOG_FILE) then
    DeleteFile(FTP_LOG_FILE);

  //restore default index file
  if FileExists(APACHE_CONF) then
  begin
    f := TStringList.Create;
    f.LoadFromFile(APACHE_CONF);
    found := false;
    target := ExtractFilename(FTP_LOG_FILE);
    for I := 0 to f.Count - 1 do
    begin
      if pos(target, f[I]) <> 0 then
      begin
        f[I] := StringReplace(f[I], target+' ', '', [rfReplaceAll]);
        found := true;
        break;
      end;
    end;
    if found then
      f.SaveToFile(APACHE_CONF);

    f.Free;
  end;
end;

procedure TfrmMain.ConfigServices;
var
  f: TStringList;
  s, users: string;
  found: boolean;
  I: Integer;
  tcp: TIdTcpClient;
  target: string;
begin
  self.lbiStep3.Description := '正在设置账号信息，请稍候……';

  f := TStringList.Create;

  //config wampserver language to Chinese
  if FileExists(WAMP_CONF) then
  begin
    f.LoadFromFile(WAMP_CONF);
    found := false;
    for I := 0 to f.Count - 1 do
    begin
      if pos('language = ', f[I]) <> 0 then
      begin
        f[I] := 'language = "chinese"';
        found := true;
      end;
      if pos('status = ', f[I]) <> 0 then
      begin
        f[I] := 'status = "online"';
      end;
    end;
    if not found then
      f.Insert(1, 'language = "chinese"');
    f.SaveToFile(WAMP_CONF);
  end;

  //overwrite default index file
  if FileExists(APACHE_CONF) then
  begin
    f.LoadFromFile(APACHE_CONF);
    target := ExtractFilename(FTP_LOG_FILE);
    for I := 0 to f.Count - 1 do
    begin
      if (pos('index.php', f[I]) <> 0) and (pos(target, f[I]) = 0) then
      begin
        f[I] := StringReplace(f[I], 'index.php', target + ' index.php', [rfReplaceAll]);
      end;
      if pos('onlineoffline tag', f[I]) <> 0 then
      begin
        f[I+1] := 'Order Allow,Deny';
        f[I+2] := 'Allow from all';
        f[I+3] := '';
      end;
    end;
    f.SaveToFile(APACHE_CONF);
  end;

  //remove default files under www folder
  if FileExists(WWW_DEFAULT_FILE1) then
    DeleteFile(WWW_DEFAULT_FILE1);
  if FileExists(WWW_DEFAULT_FILE2) then
    DeleteFile(WWW_DEFAULT_FILE2);

  //create inital page content
  f.Clear;
  f.Add('<!doctype html>');
  f.Add('<html>');
  f.Add('<head>');
  f.Add('<title>'+self.laMenuTitle.Text+'</title>');
  f.Add('<meta http-equiv="refresh" content="1" />');
  f.Add('</head>');
  f.Add('<body>');
  f.Add('<h1>数据迁移日志</h1>');
  f.Add('<hr>');
  f.Add('</body>');
  f.Add('</html>');
  f.SaveToFile(FTP_LOG_FILE);

  //config ftp user
  found := true;
  I := 0;
  if FileExists(FTP_CONF1) then
  begin
    f.LoadFromFile(FTP_CONF1);
    I := 1;
  end
  else if FileExists(FTP_CONF2) then
  begin
    f.LoadFromFile(FTP_CONF2);
    I := 2;
  end
  else
    found := false;

  if found then
  begin
    s := f.Text;
    if pos('<Users>', s) = 0 then
    begin
      users :='<Users>'
            + ' <User Name="'+self.edFtpUsername.Text+'">'
            + '  <Option Name="Pass">'+lowercase(MD5(self.edFtpPassword.Text))+'</Option>'
            + '  <Permissions>'
            + '   <Permission Dir="'+WWW_ROOT+'">'
            + '    <Option Name="FileRead">1</Option>'
            + '    <Option Name="FileWrite">1</Option>'
            + '    <Option Name="FileDelete">1</Option>'
            + '    <Option Name="FileAppend">1</Option>'
            + '    <Option Name="DirCreate">1</Option>'
            + '    <Option Name="DirDelete">1</Option>'
            + '    <Option Name="DirList">1</Option>'
            + '    <Option Name="DirSubdirs">1</Option>'
            + '    <Option Name="IsHome">1</Option>'
            + '    <Option Name="AutoCreate">0</Option>'
            + '   </Permission>'
            + '  </Permissions>'
            + ' </User>'
            + '</Users>';

      s := StringReplace(s, '</FileZillaServer>', users+'</FileZillaServer>', [rfReplaceAll]);
      f.Text := s;
      if I = 1 then
        f.SaveToFile(FTP_CONF1)
      else if I = 2 then
        f.SaveToFile(FTP_CONF2);
    end;
  end;

  //create database, and change mysql root's username and password
  f.Clear;
  f.Add('<?php');
  f.Add('$db = @mysql_connect("localhost", "root", "");');
  f.Add('if ($db) {');
  f.Add('  mysql_select_db("mysql", $db);');
  f.Add('  mysql_query("update user set password=PASSWORD('''+self.edMysqlPassword.Text+'''), user='''+self.edMysqlUsername.Text+''' where user=''root''");');
  f.Add('  mysql_query("flush privileges");');
  f.Add('}');
  f.Add('$db = @mysql_connect("localhost", "'+self.edMysqlUsername.Text+'", "'+self.edMysqlPassword.Text+'");');
  f.Add('mysql_query("CREATE DATABASE `'+self.edMysqlDatabase.Text+'` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci", $db);');
  f.Add('unlink("'+ExtractFilename(DB_ROOT_SCRIPT_FILE)+'");');
  f.Add('?>');
  f.SaveToFile(DB_ROOT_SCRIPT_FILE);

  f.Free;

  self.lbiStep3.Description := '正在启动服务，请稍候……';

  //WampServer already running?
  if not FindProcess('wampmanager.exe') then
  begin
    //start WampServer
    ShellExecute(self.Handle, 'open', WAMP_EXE, nil, nil, SW_SHOWNORMAL);
  end;

  //reload FileZilla Server config
  //FileZilla CLI ref: http://wiki.filezilla-project.org/Command-line_arguments_(Server)
  if FileExists(FTP_EXE1) then
    ShellExecute(self.Handle, 'open', FTP_EXE1, '/reload-config', nil, SW_SHOWNORMAL)
  else if FileExists(FTP_EXE2) then
    ShellExecute(self.Handle, 'open', FTP_EXE2, '/reload-config', nil, SW_SHOWNORMAL);

  //wait until both http and mysql services are ready
  tcp := TIdTcpClient.Create(self);
  tcp.Host := 'localhost';
  tcp.ConnectTimeout := 5000; //5 seconds
  tcp.Port := 80; //http port
  while true do
  begin
    try
      tcp.Connect;
      break;
    except

    end;
  end;
  tcp.Free;

  tcp := TIdTcpClient.Create(self);
  tcp.Host := 'localhost';
  tcp.ConnectTimeout := 5000; //5 seconds
  tcp.Port := 3306; //mysql port
  while true do
  begin
    try
      tcp.Connect;
      break;
    except

    end;
  end;
  tcp.Free;

  //apply mysql setting
  self.http.Get('http://localhost/'+ExtractFilename(DB_ROOT_SCRIPT_FILE));

  self.lbiStep3.Description := '';
end;

procedure TfrmMain.DownloadResources;
var
  url, html, bits, vurl, furl, wurl: string;
  fs: TFileStream;

  function GetLinkAddressWithKeywords(html: string; q: array of string): string;
  var
    p: Integer;
    link: string;
    matched: boolean;
    I: Integer;
  begin
    result := '';
    //get all links
    p := Pos('<a ', html);
    while p <> 0 do
    begin
      delete(html, 1, p-1);
      p := Pos('</a>', html);
      if p = 0 then
      begin
        p := Pos('<a ', html);
        continue;
      end;
      link := copy(html, 1, p-1);
      delete(html, 1, p+3);
      matched := true;
      //match all?
      for I := Low(q) to High(q) do
        if pos(lowercase(q[I]), lowercase(link)) = 0 then
        begin
          matched := false;
          break;
        end;
      if matched then
      begin
        p := pos('href="', link);
        delete(link, 1, p+5);
        p := pos('"', link);
        link := copy(link, 1, p-1);
        result := link;
        exit;
      end;
      p := Pos('<a ', html);
    end;
  end;

begin
  //step 1: determine bits
  if Is64Bits then
  begin
    bits := '64 bits';
    vcredist := GetTempDirectory + 'vcredist-installer.exe';
    wampserver := GetTempDirectory + 'wampserver-installer-64bits.exe';
    filezilla := GetTempDirectory + 'filezilla-installer.exe';
  end
  else
  begin
    bits := '32 bits';
    vcredist := GetTempDirectory + 'vcredist-installer.exe';
    wampserver := GetTempDirectory + 'wampserver-installer-32bits.exe';
    filezilla := GetTempDirectory + 'filezilla-installer.exe';
  end;

  //step 2: check exists
  if FileExists(vcredist) and FileExists(wampserver) and FileExists(filezilla) then
    exit;

  //step 3: get resource homepage
  url := 'http://cache.cloudstrust.com';
  html := self.http.Get(url);

  //step 4: get resource link
  vurl := url + GetLinkAddressWithKeywords(html, ['vcredist']);
  wurl := url + GetLinkAddressWithKeywords(html, ['wampserver', bits]);
  furl := url + GetLinkAddressWithKeywords(html, ['filezilla']);

  //step 5: download resource files
  fs := TFileStream.Create(vcredist, fmCreate);
  self.SetDownloadDescription('正在下载VC动态链接库，请稍候……');
  self.http.Get(vurl, fs);
  fs.Free;

  fs := TFileStream.Create(wampserver, fmCreate);
  self.SetDownloadDescription('正在下载WampServer，请稍候……');
  self.http.Get(wurl, fs);
  fs.Free;

  fs := TFileStream.Create(filezilla, fmCreate);
  self.SetDownloadDescription('正在下载FileZilla Server，请稍候……');
  self.http.Get(furl, fs);
  fs.Free;
end;

procedure TfrmMain.DumpRestore;
const
  placeholder_params = '{parameters}';
  placeholder_unlink = '{unlink}';
var
  tcp: TIdTcpClient;
  remote: boolean;
  params, unlink: string;
  script: string;
  root: string;
  f: TStringList;
  fs: TFileStream;
begin
  self.lbiStep4.Description := '正在尝试远程数据库连接，请稍候……';

  //test remote mysql
  remote := false;
  tcp := TIdTcpClient.Create(self);
  tcp.Host := self.edServerAddress.Text;
  tcp.ConnectTimeout := 5000; //5 seconds
  tcp.Port := 3306; //http port
  try
    tcp.Connect;
    remote := true;
  except

  end;
  tcp.Free;

  if remote then
  begin
    self.lbiStep4.Description := '正在通过远程数据库连接下载数据库，请稍候……';

    //call mysqladmin
    params := MYSQLDUMP_EXE
            + ' --host='+self.edServerAddress.Text
            + ' --user='+self.edMysqlUsername.Text
            + ' --password='+self.edMysqlPassword.Text
            + ' --add-locks --add-drop-table --lock-tables'
            + ' --database '+self.edMysqlDatabase.Text
            + ' > '+DB_DUMP_FILE;

    self.StartCheckDbDump;
    ExecAppWait(self.Handle, 'cmd.exe', '/c ' + params, SW_SHOWMINIMIZED);
  end
  else
  begin
    self.lbiStep4.Description := '正在通过脚本方式下载数据库，请稍候……';

    //use php script to dump
    script := self.mmSqlDumpScript.Text;
    params := '$db_host = "localhost";'#13#10
            + '$db_user = "'+self.edMysqlUsername.Text+'";'#13#10
            + '$db_pass = "'+self.edMysqlPassword.Text+'";'#13#10
            + '$db_name = "'+self.edMysqlDatabase.Text+'";'#13#10
            + '$db_file = "'+ExtractFilename(DB_DUMP_FILE)+'";';

    unlink := 'unlink("'+DB_DUMP_SCRIPT_FILE+'");';

    script := StringReplace(script, placeholder_params, params, [rfReplaceAll]);
    script := StringReplace(script, placeholder_unlink, unlink, [rfReplaceAll]);

    //save script
    f := TStringList.Create;
    f.Text := script;
    f.SaveToFile(GetTempDirectory + DB_DUMP_SCRIPT_FILE);

    //upload to server
    root := self.GetFtpRoot;
    if not ftp.Connected then
      ftp.Connect;
    self.ftp.Put(GetTempDirectory + DB_DUMP_SCRIPT_FILE, root + DB_DUMP_SCRIPT_FILE);
    self.ftp.Disconnect;

    //run script
    self.http.Get('http://'+self.edServerAddress.Text+'/'+DB_DUMP_SCRIPT_FILE);

    //download and delete dump file
    fs := TFileStream.Create(DB_DUMP_FILE, fmCreate);
    self.StartCheckDbDump;
    self.ftp.Connect;
    self.ftp.Get(root + ExtractFilename(DB_DUMP_FILE), fs, false); //overwrite, don't resume
    fs.Free;
    self.ftp.Delete(root + ExtractFilename(DB_DUMP_FILE));
    self.ftp.Disconnect;
  end;

  self.StopCheckDbDump;

  //restore database
  self.lbiStep4.Description := '正在导入数据库，请稍候……';
  params := MYSQL_EXE
          + ' --host=localhost'
          + ' --user='+self.edMysqlUsername.Text
          + ' --password='+self.edMysqlPassword.Text
          + ' --default-character-set=utf8'
          + ' --database '+self.edMysqlDatabase.Text
          + ' < '+DB_DUMP_FILE;

  ExecAppWait(self.Handle, 'cmd.exe', '/c ' + params, SW_SHOWMINIMIZED);

  //delete dump file
  if FileExists(DB_DUMP_FILE) then
    DeleteFile(DB_DUMP_FILE);

  self.lbiStep4.Description := '';
end;

procedure TfrmMain.StopCheckDbDump;
begin
  self.tmrCheckDbDump.Enabled := false;
end;

procedure TfrmMain.StopLogging;
begin
  self.tmrDeferredLog.Enabled := false;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  WindowState := TWindowState.wsMaximized;
  tbMain.BringToFront;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    self.DisconnectAll;

    self.FAntiFreeze.Free;
    self.FtpFileLogs.Free;
  except

  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  self.FAntiFreeze := TIdAntiFreeze.Create(self);
  self.FAntiFreeze.IdleTimeOut := 100;
  self.FAntiFreeze.Active := true;

  //UI initialization
  self.InitStepTitles;
  self.InitStepIcons;

  currentStep := 0;
  self.LoadStep(1);

  self.tmrDeferredInit.Enabled := true;

  vcredist := '';
  wampserver := '';
  filezilla := '';
  ftp_root := '';

  external_ipaddr := '';

  self.FtpFileLogs := TStringList.Create;
end;

procedure TfrmMain.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  DX, DY : Single;
begin
  if EventInfo.GestureID = igiPan then
  begin
    if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags)
      and ((Sender = ppToolbar)
        or (EventInfo.Location.Y > (ClientHeight - 70))) then
    begin
      FGestureOrigin := EventInfo.Location;
      FGestureInProgress := True;
    end;

    if FGestureInProgress and (TInteractiveGestureFlag.gfEnd in EventInfo.Flags) then
    begin
      FGestureInProgress := False;
      DX := EventInfo.Location.X - FGestureOrigin.X;
      DY := EventInfo.Location.Y - FGestureOrigin.Y;
      if (Abs(DY) > Abs(DX)) then
        ShowToolbar(DY < 0);
    end;
  end
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkEscape then
    ShowToolbar(not ppToolbar.IsOpen);
end;

procedure TfrmMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Button = TMouseButton.mbRight then
    ShowToolbar(True)
  else
    ShowToolbar(False);
end;

procedure TfrmMain.SetDownloadDescription(desc: string);
begin
  self.lbiStep3.Description := desc;
end;

procedure TfrmMain.SetDownloadProgress(progress, max: Int64);
begin
  if (progress = 0) and (max <> -1) then
  begin
    //start download
    self.pbDownload.Min := 0;
    self.pbDownload.Max := max;
    self.pbDownload.Value := 0;
    self.pbDownload.Visible := true;
  end
  else
  if progress = -1 then
  begin
    //finish download
    self.pbDownload.Value := self.pbDownload.Max;
    self.pbDownload.Visible := false;
    self.SetDownloadDescription('');
  end
  else
  begin
    //downloading...
    self.pbDownload.Value := progress;
  end;

end;

procedure TfrmMain.SetIcon(const step: integer; const prefix: string);
var
  comp: TComponent;
  lbi: TMetropolisUIListBoxItem;
  img: TResourceStream;
begin
  comp := self.FindComponent('lbiStep'+IntToStr(step));
  if (Assigned(comp)) and (comp is TMetropolisUIListBoxItem) then
  begin
    //load icon from resource
    lbi := comp as TMetropolisUIListBoxItem;
    img := TResourceStream.Create(hInstance, prefix+IntToStr(step), RT_RCDATA);
    lbi.Icon.LoadFromStream(img);
    img.Free;
  end;
end;

procedure TfrmMain.ShowToolbar(AShow: Boolean);
begin
  ppToolbar.Width := ClientWidth;
  ppToolbar.PlacementRectangle.Rect := TRectF.Create(0, ClientHeight-ppToolbar.Height, ClientWidth-1, ClientHeight-1);
  ppToolbarAnimation.StartValue := ppToolbar.Height;
  ppToolbarAnimation.StopValue := 0;

  ppToolbar.IsOpen := AShow;
end;

procedure TfrmMain.StartCheckDbDump;
begin
  self.tmrCheckDbDump.Enabled := true;
end;

procedure TfrmMain.StartLogging;
begin
  self.tmrDeferredLog.Enabled := true;
end;

procedure TfrmMain.DisconnectAll;
begin
  if self.ftp.Connected then
    self.ftp.Disconnect;
  if self.http.Connected then
    self.http.Disconnect;
end;

procedure TfrmMain.DoMigration;
const
  placeholder_unlink = '{unlink}';
var
  root, unlink: string;
  files: TStringList;
begin
  self.lbiStep4.Description := '正在同步文件，请稍候……';

  self.FtpFileCount := 0;
  self.FtpFileTotal := -1;
  self.FtpFileLogs.Clear;
  self.mmLogs.Lines.Clear;

  root := self.GetFtpRoot;
  if not ftp.Connected then
    ftp.Connect;

  //try to get files list
  unlink := 'unlink("'+FTP_LIST_SCRIPT_FILE+'");';
  self.mmListFileScript.Text := StringReplace(self.mmListFileScript.Text, placeholder_unlink, unlink, [rfReplaceAll]);
  self.mmListFileScript.Lines.SaveToFile(GetTempDirectory + FTP_LIST_SCRIPT_FILE);
  self.ftp.Put(GetTempDirectory + FTP_LIST_SCRIPT_FILE, root + FTP_LIST_SCRIPT_FILE);

  //run script
  files := TStringList.Create;
  files.Text := self.http.Get('http://'+self.edServerAddress.Text+'/'+FTP_LIST_SCRIPT_FILE);
  if (files.Count >=2) and (files[0] = 'BEGIN') and (files[files.Count - 1] = 'END') then
  begin
    files.Delete(0);
    files.Delete(files.Count - 1);
    if files.IndexOf(FTP_LIST_SCRIPT_FILE) <> -1 then
      files.Delete(files.IndexOf(FTP_LIST_SCRIPT_FILE));

    self.StartLogging;
    self.FtpDownloadList(self.ftp, files, WWW_ROOT);
    self.StopLogging;
  end
  else
  begin
    self.StartLogging;
    FtpDownloadRecursive(self.ftp, root, WWW_ROOT);
    self.StopLogging;
  end;
  files.Free;

  self.lbiStep4.Description := '';
end;

procedure TfrmMain.StartProgress;
begin
  self.aniProgress.Enabled := true;
  self.aniProgress.Visible := true;
end;

procedure TfrmMain.StopProgress;
begin
  self.aniProgress.Visible := false;
  self.aniProgress.Enabled := false;
end;

procedure TfrmMain.SwitchStepIcon(const oldStep, newStep: integer);
begin
  //old
  SetIcon(oldStep, 'color');

  //new
  SetIcon(newStep, 'gray');
end;

procedure TfrmMain.tmrCheckDbDumpTimer(Sender: TObject);
begin
  self.tmrCheckDbDump.Enabled := false;

  if FileExists(DB_DUMP_FILE) then
  begin
    self.lbiStep4.Description := '已接收数据库文件：'+ IntToStr(FileSizeByName(DB_DUMP_FILE)) + '字节';
  end;

  self.tmrCheckDbDump.Enabled := true;
end;

procedure TfrmMain.tmrDeferredInitTimer(Sender: TObject);
const
  keyword = 'http://www.123cha.com/ip/?q=';
  placeholder = '{ip_addr}';
var
  html: string;
  p, i, j: integer;
  name: string;
  comp: TComponent;
  la: TLabel;
begin
  self.tmrDeferredInit.Enabled := false;

  //resolve externl ip address
  html := self.http.Get('http://www.123cha.com');
  p := pos(keyword, html);
  if p <> 0 then
  begin
    delete(html, 1, p+length(keyword)-1);
    p := pos(' ', html);
    if p <> 0 then
    begin
      external_ipaddr := copy(html, 1, p-1);
      //translate external ip address
      for I := 1 to 5 do
        for J := 1 to 20 do
        begin
          name := 'laText'+IntToStr(I)+'_'+IntToStr(J);
          comp := self.FindComponent(name);
          if Assigned(comp) then
          begin
            la := comp as TLabel;
            p := pos(placeholder, la.Text);
            if p <> 0 then
              la.Text := StringReplace(la.Text, placeholder, external_ipaddr, [rfReplaceAll]);
          end;
        end;
    end;
  end;

end;

procedure TfrmMain.tmrDeferredLogTimer(Sender: TObject);
var
  f: TStringList;
  count: integer;
  I: Integer;
begin
  self.tmrDeferredLog.Enabled := false;
  count := self.FtpFileLogs.Count;
  //display on menu
  if self.FtpFileTotal = -1 then
    self.lbiStep4.Description := '正在同步文件，请稍候（'+IntToStr(self.FtpFileCount)+'）……'
  else
    self.lbiStep4.Description := '正在同步文件，请稍候（'+IntToStr(self.FtpFileCount)+'/'+IntToStr(self.FtpFileTotal)+'）……';

  //display on screen
  self.mmLogs.Lines.Clear;
  if self.FtpFileTotal = -1 then
    self.mmLogs.Lines.Add('当前已同步文件数：'+IntToStr(self.FtpFileCount))
  else
    self.mmLogs.Lines.Add('当前已同步文件数：'+IntToStr(self.FtpFileCount)+'，总共：'+IntToStr(self.FtpFileTotal));
  self.mmLogs.Lines.Add('');
  self.mmLogs.Lines.Add('最新同步状态：');
  for I := count - 12 to count - 1 do
    if I >= 0 then
      self.mmLogs.Lines.Add(self.FtpFileLogs[I]);

  //generate php file
  f := TStringList.Create;
  f.Add('<!doctype html>');
  f.Add('<html>');
  f.Add('<head>');
  f.Add('<title>'+self.laMenuTitle.Text+'</title>');
  f.Add('<meta http-equiv="refresh" content="5" />');
  f.Add('</head>');
  f.Add('<body>');
  f.Add('<h1>数据迁移日志</h1>');
  f.Add('<hr>');
  if self.FtpFileTotal = -1 then
    f.Add('<h2>当前已同步文件数：'+IntToStr(self.FtpFileCount)+'</h2>')
  else
    f.Add('<h2>当前已同步文件数：'+IntToStr(self.FtpFileCount)+'，总共：'+IntToStr(self.FtpFileTotal)+'</h2>');
  f.Add('<br />');
  f.Add('最新同步状态：<br />');
  for I := count - 12 to count - 1 do
    if I >= 0 then
      f.Add(self.FtpFileLogs[I]+'<br />');
  f.Add('</body>');
  f.Add('</html>');
  f.SaveToFile(FTP_LOG_FILE);

  self.tmrDeferredLog.Enabled := true;
end;

procedure TfrmMain.ToolbarCloseButtonClick(Sender: TObject);
begin
  Close;
end;

end.
