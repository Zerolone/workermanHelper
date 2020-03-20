unit ClientFunction;

interface

uses IniFiles, SysUtils, StrUtils, Classes, Windows;

procedure SaveIni(Datatext, header: string);
function GetIni(header: string): string;
procedure Log(LogStr: string);


//�滻ͼƬ
function CatchPic(OldStr: Ansistring; PicStringList: TStringList): TStringList;

//����ַ�������
function CheckString(CheckStr: string; MaxLen: Integer): string;

//////////////////////////////////
//���ã������滻�ַ���          //
//������strSource   Դ�ַ���    //
//������regex       ������ʽ  //
//���ߣ�Zerolone                //
//����ʱ�䣺2007-06-30          //
//////////////////////////////////
//function MRegeReplace(strSource: string; strRegex: string; strReplace: string): string;


implementation

uses Main,

  //ShowMessage�õ�
  Dialogs
  ;

{
var
  FPath: string;
}

procedure SaveIni(Datatext, header: string);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setting.ini');
  ServerIni.WriteString('Catch', header, Datatext);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

function GetIni(header: string): string;
var
  ServerName: string;
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setting.ini');
  ServerName := ServerIni.ReadString('Catch', header, header);

  ServerIni.Free;
  result := ServerName;
end;

procedure Log(LogStr: string);
var
  F: textfile;
  FileName: string;
begin
//  if (MainForm.chkLog.Checked) then
  begin
    FileName := 'Log.log';

    assignfile(F, FileName);
    //    if FileExists(FileName) then
    Append(F);
    //    else
    //      ReWrite(F);

    Writeln(F, FormatDateTime('yyyy-mm-dd hh:mm:ss', now) + '|' + LogStr);
    closefile(F);
  end;
end;

function CatchPic(OldStr: Ansistring; PicStringList: TStringList): TStringList;
var
  OldStrLen, CutStringLen, s: Integer;
  CutString: string;
begin
  //����<IMG
  OldStrLen := Length(OldStr) + 1;
  CutString := '<IMG';
  CutStringLen := Length(CutString);
  s := pos(CutString, OldStr);
  if s = 0 then
    result := PicStringList
  else
  begin
    OldStr := RightStr(OldStr, OldStrLen - s - CutStringLen);

    //����src="
    OldStrLen := Length(OldStr) + 1;
    CutString := 'SRC="';
    CutStringLen := Length(CutString);
    s := pos(CutString, OldStr);
    if s = 0 then
      result := PicStringList
    else
    begin
      OldStr := RightStr(OldStr, OldStrLen - s - CutStringLen);

      //����ͼƬ "
      OldStrLen := Length(OldStr) + 1;
      CutString := '"';
      CutStringLen := Length(CutString);
      s := pos(CutString, OldStr);
      if s = 0 then
        result := PicStringList
      else
      begin
        {
          if ImgList = '' then
            ImgList := LeftStr(OldStr, s - 1)
          else
            begin
              ImgList := ImgList + '|' + LeftStr(OldStr, s - 1);
            end;
            }
        PicStringList.Add(LeftStr(OldStr, s - 1));
        OldStr := RightStr(OldStr, OldStrLen - s - CutStringLen);
        result := CatchPic(OldStr, PicStringList);
      end;
    end;
  end;
end;

function CheckString(CheckStr: string; MaxLen: Integer): string;
var CheckStrLen: Integer;
begin
  CheckStrLen := Length(CheckStr);
  if CheckStrLen > MaxLen then
    result := LeftStr(CheckStr, MaxLen)
  else
    result := CheckStr;
end;

{
function MRegeReplace(strSource: string; strRegex: string; strReplace: string): string;
var
  strTmp: string;
  RegexReplace:TPerlRegEx;
begin
  strTmp := strSource;
  RegexReplace := TPerlRegEx.Create();
  RegexReplace.Regex := strRegex;
  RegexReplace.Replacement := strReplace;
  RegexReplace.Subject := strTmp;
  RegexReplace.ReplaceAll;
  strTmp := RegexReplace.Subject;

    //RegexReplace := TPerlRegEx.Create(nil);
    //RegexReplace.Regex := '<div class="tagad">[\s\S]*?</div>';
    //RegexReplace.Replacement := '';
    //RegexReplace.Subject := strTmp;
    //RegexReplace.ReplaceAll;
    //strTmp := RegexReplace.Subject;

  result := strTmp;
end;
}

end.

