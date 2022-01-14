object frmCalculation: TfrmCalculation
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Calculating... Please wait.'
  ClientHeight = 190
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object labelfilecount: TLabel
    Left = 8
    Top = 16
    Width = 66
    Height = 13
    AutoSize = False
    Caption = 'File count:'
  end
  object lblstatus: TLabel
    Left = 8
    Top = 144
    Width = 377
    Height = 13
    AutoSize = False
    Caption = 'Status:'
  end
  object labelcalchash: TLabel
    Left = 8
    Top = 112
    Width = 122
    Height = 13
    AutoSize = False
    Caption = 'Calculated hash value:'
  end
  object labelfilename: TLabel
    Left = 8
    Top = 48
    Width = 66
    Height = 13
    AutoSize = False
    Caption = 'File name:'
  end
  object labeldirectory: TLabel
    Left = 8
    Top = 80
    Width = 66
    Height = 13
    AutoSize = False
    Caption = 'Directory:'
  end
  object lblfilecount: TLabel
    Left = 80
    Top = 16
    Width = 137
    Height = 13
    AutoSize = False
  end
  object lblfilename: TLabel
    Left = 80
    Top = 48
    Width = 305
    Height = 13
    AutoSize = False
  end
  object lbldirectory: TLabel
    Left = 80
    Top = 80
    Width = 305
    Height = 13
    AutoSize = False
  end
  object lblcalchash: TLabel
    Left = 136
    Top = 112
    Width = 249
    Height = 13
    AutoSize = False
  end
  object progress1: TProgressBar
    Left = 8
    Top = 163
    Width = 377
    Height = 17
    Step = 1
    TabOrder = 0
  end
  object btncancel: TButton
    Left = 310
    Top = 11
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancel'
    ImageIndex = 3
    Images = Form1.ImageList1
    TabOrder = 1
    TabStop = False
    OnMouseUp = btncancelMouseUp
  end
  object btnminimize: TButton
    Left = 230
    Top = 11
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Minimize'
    ImageIndex = 5
    Images = Form1.ImageList1
    TabOrder = 2
    TabStop = False
    OnMouseUp = btnminimizeMouseUp
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 384
    Top = 176
  end
end
