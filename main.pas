unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientFunction, StdCtrls, Menus, FileSystemWatcher, ShellAPI,
  DosCommand;

type
  TMainForm = class(TForm)
    btnInit: TButton;
    mmoLog: TMemo;
    pm1: TPopupMenu;
    mniLogClear: TMenuItem;
    FileSystemWatcher1: TFileSystemWatcher;
    btnRe: TButton;
    mmoDos: TMemo;
    btnStop: TButton;
    btnKill: TButton;
    DosCommand1: TDosCommand;
    procedure btnInitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniLogClearClick(Sender: TObject);
    procedure FileSystemWatcher1Change(FileOperation: TFileOperation;
      const FileName1, FileName2: String);
    procedure btnReClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnKillClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure sinfo(str:string);
  end;

var
  MainForm: TMainForm;

  strFolder:string;
  strFilext:string; //�ļ���׺
  strCmd   :string; //cmd

  strTmp : string;

  bolRun:Boolean;

  i:Integer;

implementation

{$R *.dfm}

procedure TMainForm.sinfo(str:string);
begin
  str:= FormatDateTime('hh:nn:ss',Now()) + ' ' + str;
  mmoLog.Lines.Add(str);

  SendMessage(mmoLog.Handle,WM_VSCROLL,SB_BOTTOM,0);
end;


procedure TMainForm.btnInitClick(Sender: TObject);
begin
  bolRun := true;
  

  try
    strFolder:=GetIni('folder');
  except
    ShowMessage('folder���ò����ڣ�');
    sinfo('folder���ò����ڣ�');
  end;

  if(strFolder = '')then
  begin
    ShowMessage('folder���������⣡');

  end;

  try
    strFilext:=GetIni('filext');
  except
    ShowMessage('filext���ò����ڣ�');
    sinfo('filext���ò����ڣ�');
  end;

  if strFilext = 'filext' then
    strFilext := '';

  sinfo('����ļ���Ϊ��' + strFolder);
  sinfo('��غ�׺Ϊ��'   + strFilext);

  FileSystemWatcher1.WatchedDir := strFolder;
  FileSystemWatcher1.Actived := true;


end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  mmoLog.Clear;
  mmoLog.PopupMenu:=pm1;
  mmoLog.ScrollBars:=ssVertical;

  mmoDos.Clear;

  bolRun:=false;
end;

procedure TMainForm.mniLogClearClick(Sender: TObject);
begin
  mmoLog.Clear
end;

procedure TMainForm.FileSystemWatcher1Change(FileOperation: TFileOperation;
  const FileName1, FileName2: String);
var ResultList:TStringList;
begin
  if strFilext = '' then
  begin
    sinfo(FileName1 + '�����仯������ȫ���ļ���������');
    btnRe.Click;
  end
  else
  begin
    ResultList := TStringList.Create;
    try
      ResultList.Delimiter := '.';
      ResultList.DelimitedText := FileName1;
      //for i:= 0 to ResultList.Count-1 do
      //begin
      //  sinfo(ResultList[i]);
      //end;

      strTmp := ResultList[ResultList.Count-1];

      if strTmp = strFilext then
      begin
        sinfo(FileName1 + '�����仯������ָ���ļ���������');
        btnRe.Click;
      end;

    except

    end;
  end;

  //sinfo(FileName1 + '�����仯��������');

  //sinfo(FileName2);
  //sinfo(FileOperation );

end;

procedure TMainForm.btnReClick(Sender: TObject);

begin

//handle := FIndwindow(nil,Exename)
//SendMessage(handle,WM_Close,0,0)

  if bolRun=True then
  begin
    try
      strCmd:=GetIni('cmd');
      sinfo('��ʼִ��'+strCmd);

      DosCommand1.Stop;
      
      DosCommand1.CommandLine := strCmd;
      DosCommand1.OutputLines:=mmoDos.Lines;

      DosCommand1.Execute; //launch format process
      DosCommand1.SendLine('', True); //equivalent to press enter key






//      DiskName := 'test';
//      DosCommand1.SendLine(DiskName, True); //enter the name of the volume



      //RunDosInMemo(strCmd, mmoDos);
      //strTmp:=GetDosOutput(strCmd);
      //mmoDos.Lines.Add(strTmp);

      //WinExec(PChar(strCmd), SW_SHOWNORMAL);

      //sw_normal

      //shellexecute(handle,nil,'cmd.exe',pchar(strCmd),nil,sw_normal);


    except
      ShowMessage('cmd���ò����ڣ�');
      sinfo('cmd���ò����ڣ�');
    end
  end;
end;


procedure TMainForm.btnStopClick(Sender: TObject);
begin
  //bolRun:=False;
  FileSystemWatcher1.Actived:=False;
end;

procedure TMainForm.btnKillClick(Sender: TObject);
Var
   wh : THandle;
begin
  strTmp := GetIni('kill');
  sinfo('kill='+strTmp);
   wh := findwindow(nil, PChar(strTmp));
   if wh<> 0 then
   begin
    PostMessage(wh, WM_CLOSE, 0, 0);
   end
   else
   begin
     sinfo('û���ҵ���Ҫ�رյĴ���');
   end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DosCommand1.Stop;
end;

end.
