object MainForm: TMainForm
  Left = 347
  Top = 194
  Width = 1019
  Height = 657
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnInit: TButton
    Left = 8
    Top = 8
    Width = 233
    Height = 25
    Caption = #21021#22987#21270#35835#21462'ini'
    TabOrder = 0
    OnClick = btnInitClick
  end
  object mmoLog: TMemo
    Left = 8
    Top = 40
    Width = 337
    Height = 561
    Lines.Strings = (
      'mmoLog')
    TabOrder = 1
  end
  object btnRe: TButton
    Left = 248
    Top = 8
    Width = 217
    Height = 25
    Caption = #37325#36733
    TabOrder = 2
    OnClick = btnReClick
  end
  object mmoDos: TMemo
    Left = 352
    Top = 40
    Width = 641
    Height = 561
    Lines.Strings = (
      'mmoDos')
    TabOrder = 3
  end
  object btnStop: TButton
    Left = 472
    Top = 8
    Width = 169
    Height = 25
    Caption = #20572#27490#30417#25511
    TabOrder = 4
    OnClick = btnStopClick
  end
  object btnKill: TButton
    Left = 648
    Top = 8
    Width = 193
    Height = 25
    Caption = 'btnKill'
    TabOrder = 5
    OnClick = btnKillClick
  end
  object pm1: TPopupMenu
    Left = 248
    Top = 240
    object mniLogClear: TMenuItem
      Caption = #28165#31354#26085#24535
      OnClick = mniLogClearClick
    end
  end
  object FileSystemWatcher1: TFileSystemWatcher
    Actived = False
    WatchedDir = 'D:\wwwroot\1.zerolone.com\tp5\application\'
    WatchSubTree = True
    NotifyFilters = [nfFileNameChange, nfDirNameChange, nfAttributeChange, nfSizeChange, nfWriteChange, nfAccessChange, nfCreationDateChange, nfSecurityChange]
    OnChange = FileSystemWatcher1Change
    Left = 160
    Top = 248
  end
  object DosCommand1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 640
    Top = 320
  end
end
