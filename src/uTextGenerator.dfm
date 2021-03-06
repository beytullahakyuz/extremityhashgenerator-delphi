object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Text Hash Generator'
  ClientHeight = 413
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    607
    413)
  PixelsPerInch = 96
  TextHeight = 13
  object lbltext: TLabel
    Left = 8
    Top = 16
    Width = 58
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Text:'
  end
  object lblmd2: TLabel
    Left = 8
    Top = 50
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'MD2 Hash Value:'
  end
  object lblmd4: TLabel
    Left = 8
    Top = 82
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'MD4 Hash Value:'
  end
  object lblmd5: TLabel
    Left = 8
    Top = 114
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'MD5 Hash Value:'
  end
  object lblsha1: TLabel
    Left = 8
    Top = 146
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SHA1 Hash Value:'
  end
  object lblcrc16: TLabel
    Left = 8
    Top = 354
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'CRC16 Hash Value:'
  end
  object lblcrc32: TLabel
    Left = 8
    Top = 382
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'CRC32 Hash Value:'
  end
  object lblsha2_224: TLabel
    Left = 8
    Top = 176
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SHA2/224 Hash Value:'
  end
  object lblsha2_256: TLabel
    Left = 8
    Top = 205
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SHA2/256 Hash Value:'
  end
  object lblsha2_384: TLabel
    Left = 8
    Top = 235
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SHA2/384 Hash Value:'
  end
  object lblsha2_512: TLabel
    Left = 8
    Top = 264
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'SHA2/512 Hash Value:'
  end
  object lblsha2_512224: TLabel
    Left = 8
    Top = 294
    Width = 140
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SHA2-512/224 Hash Value:'
  end
  object lblsha2_512256: TLabel
    Left = 8
    Top = 323
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'SHA2-512/256 Hash Value:'
  end
  object edittext: TEdit
    Left = 72
    Top = 13
    Width = 522
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = edittextChange
    ExplicitWidth = 383
  end
  object editmd2: TEdit
    Left = 164
    Top = 47
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 1
  end
  object editmd4: TEdit
    Left = 164
    Top = 79
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object editmd5: TEdit
    Left = 164
    Top = 111
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 3
  end
  object editsha1: TEdit
    Left = 164
    Top = 143
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 4
  end
  object editcrc16: TEdit
    Left = 164
    Top = 351
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 5
  end
  object editcrc32: TEdit
    Left = 164
    Top = 379
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 6
  end
  object editsha2_224: TEdit
    Left = 164
    Top = 173
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 7
  end
  object editsha2_256: TEdit
    Left = 164
    Top = 202
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 8
  end
  object editsha2_384: TEdit
    Left = 164
    Top = 232
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 9
  end
  object editsha2_512: TEdit
    Left = 164
    Top = 261
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 10
  end
  object editsha2_512224: TEdit
    Left = 164
    Top = 291
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 11
  end
  object editsha2_512256: TEdit
    Left = 164
    Top = 320
    Width = 430
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 12
  end
end
