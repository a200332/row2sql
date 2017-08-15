object frmMain: TfrmMain
  Left = 192
  Top = 103
  Caption = 'frmMain'
  ClientHeight = 594
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter4: TSplitter
    Left = 0
    Top = 277
    Width = 809
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 22
    ExplicitWidth = 336
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 809
    Height = 22
    ButtonHeight = 20
    ButtonWidth = 31
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = '10'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object cbxURL: TComboBox
      Left = 8
      Top = 0
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object ToolButton6: TToolButton
      Left = 169
      Top = 0
      Caption = 'open'
      ImageIndex = 11
      OnClick = miOpenClick
    end
    object ToolButton3: TToolButton
      Left = 200
      Top = 0
      Caption = 'go'
      ImageIndex = 6
      OnClick = miSqlClick
    end
    object ToolButton8: TToolButton
      Left = 231
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object cbxStop: TCheckBox
      Left = 239
      Top = 0
      Width = 44
      Height = 20
      Caption = #20572#27490
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 283
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object rbInsert: TRadioButton
      Left = 291
      Top = 0
      Width = 52
      Height = 20
      Caption = 'insert'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rbDel: TRadioButton
      Left = 343
      Top = 0
      Width = 42
      Height = 20
      Caption = 'del'
      TabOrder = 3
    end
    object rbUpdate: TRadioButton
      Left = 385
      Top = 0
      Width = 52
      Height = 20
      Caption = 'update'
      TabOrder = 4
    end
    object ToolButton2: TToolButton
      Left = 437
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object Label4: TLabel
      Left = 445
      Top = 0
      Width = 24
      Height = 20
      Caption = #34920#21517
    end
    object edtTable: TEdit
      Left = 469
      Top = 0
      Width = 124
      Height = 20
      TabOrder = 5
      Text = 'a_cartype_raw'
    end
  end
  object memoCtx: TMemo
    Left = 0
    Top = 44
    Width = 809
    Height = 233
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitTop = 22
    ExplicitHeight = 255
  end
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 809
    Height = 295
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 352
      Top = 1
      Height = 293
      Align = alRight
      ExplicitLeft = 696
      ExplicitTop = 184
      ExplicitHeight = 100
    end
    object memoLog: TMemo
      Left = 1
      Top = 1
      Width = 351
      Height = 293
      Align = alClient
      ScrollBars = ssHorizontal
      TabOrder = 0
    end
    object memoRst: TMemo
      Left = 355
      Top = 1
      Width = 453
      Height = 293
      Align = alRight
      ScrollBars = ssHorizontal
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 575
    Width = 809
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 22
    Width = 809
    Height = 22
    ButtonHeight = 18
    Caption = 'ToolBar2'
    TabOrder = 4
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 30
      Height = 18
      Caption = 'where'
    end
    object edtWhereCols: TEdit
      Left = 38
      Top = 0
      Width = 137
      Height = 18
      TabOrder = 1
    end
    object ToolButton5: TToolButton
      Left = 175
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object Label2: TLabel
      Left = 183
      Top = 0
      Width = 30
      Height = 18
      Caption = 'delete'
    end
    object edtRmFilds: TEdit
      Left = 213
      Top = 0
      Width = 123
      Height = 18
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 86
    Top = 41
    object N1: TMenuItem
      Caption = #25991#20214'(F)'
      object miOpen: TMenuItem
        Caption = 'open'
        OnClick = miOpenClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miSql: TMenuItem
        Caption = 'carInsSql'
        OnClick = miSqlClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object nExit: TMenuItem
        Caption = 'exit'
      end
    end
    object H1: TMenuItem
      Caption = #24110#21161'(H)'
      object A1: TMenuItem
        Caption = #20851#20110'(A)'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 160
    object N4: TMenuItem
      Caption = #25171#24320
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #35835#21462
      OnClick = N5Click
    end
  end
end
