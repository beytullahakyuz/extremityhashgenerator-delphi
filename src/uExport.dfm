object frmExport: TfrmExport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Save Wizard'
  ClientHeight = 184
  ClientWidth = 447
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 425
    Height = 129
    Caption = 'Export Location && Save Settings'
    TabOrder = 0
    object labellocation: TLabel
      Left = 3
      Top = 32
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Location:'
    end
    object labelcharset: TLabel
      Left = 3
      Top = 65
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Charset:'
    end
    object labelsavetype: TLabel
      Left = 3
      Top = 98
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Save Type:'
    end
    object editpath: TEdit
      Left = 80
      Top = 29
      Width = 292
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnbrowse: TButton
      Left = 383
      Top = 27
      Width = 30
      Height = 25
      Cursor = crHandPoint
      Caption = '...'
      TabOrder = 1
      OnMouseUp = btnbrowseMouseUp
    end
    object radiosaveall: TRadioButton
      Left = 80
      Top = 97
      Width = 106
      Height = 17
      Caption = 'Save All'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object radiocheckeditems: TRadioButton
      Left = 211
      Top = 97
      Width = 161
      Height = 17
      Caption = 'Save Checked Items'
      TabOrder = 3
    end
    object combocharset: TComboBox
      Left = 80
      Top = 62
      Width = 292
      Height = 22
      Style = csOwnerDrawVariable
      TabOrder = 4
      Items.Strings = (
        'big5 (Chinese Traditional - Big5)'
        'euc-kr (Korean - EUC)'
        'iso-8859-1 (Western Alphabet - ISO)'
        'iso-8859-2 (Central European Alphabet - ISO)'
        'iso-8859-3 (Latin 3 Alphabet - ISO)'
        'iso-8859-4 (Baltic Alphabet - ISO)'
        'iso-8859-5 (Cyrillic Alphabet - ISO)'
        'iso-8859-6 (Arabic Alphabet - ISO)'
        'iso-8859-7 (Greek Alphabet - ISO)'
        'iso-8859-8 (Hebrew Alphabet - ISO)'
        'koi8-r (Cyrillic Alphabet - KOI8-R)'
        'shift-jis (Japanese - Shift-JIS)'
        'x-euc (Japanese - EUC)'
        'utf-8 (Universal Alphabet - UTF-8)')
    end
  end
  object btnsave: TButton
    Left = 277
    Top = 150
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 27
    Images = Form1.ImageList1
    ParentFont = False
    TabOrder = 1
    OnMouseUp = btnsaveMouseUp
  end
  object btncancel: TButton
    Left = 358
    Top = 150
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancel'
    ImageIndex = 3
    Images = Form1.ImageList1
    TabOrder = 2
    OnClick = btncancelClick
  end
  object savedialog: TSaveDialog
    Left = 416
  end
end
