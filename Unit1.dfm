object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1074#1072#1103' '#1080#1075#1088#1072
  ClientHeight = 190
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 69
    Width = 85
    Height = 13
    Caption = #1052#1086#1103' '#1078#1080#1079#1085#1100': 1000'
  end
  object Label2: TLabel
    Left = 192
    Top = 69
    Width = 95
    Height = 13
    Caption = #1046#1080#1079#1085#1100' '#1073#1086#1089#1089#1072': 1000'
  end
  object Label3: TLabel
    Left = 239
    Top = 8
    Width = 52
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100' 0'
  end
  object Label4: TLabel
    Left = 267
    Top = 132
    Width = 62
    Height = 13
    Caption = '+50 '#1082' '#1091#1088#1086#1085#1091
  end
  object Label5: TLabel
    Left = 120
    Top = 31
    Width = 113
    Height = 25
    Caption = 'Critical Kill'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LevelBar: TProgressBar
    Left = 16
    Top = 8
    Width = 217
    Height = 17
    TabOrder = 0
  end
  object PersonHP: TProgressBar
    Left = 16
    Top = 88
    Width = 150
    Height = 17
    Max = 1000
    Position = 1000
    TabOrder = 1
  end
  object BossBar: TProgressBar
    Left = 192
    Top = 88
    Width = 150
    Height = 17
    Max = 1000
    Position = 1000
    TabOrder = 2
  end
  object BtnKill: TButton
    Left = 16
    Top = 111
    Width = 150
    Height = 34
    Caption = '100 HP'
    TabOrder = 3
    OnClick = BtnKillClick
  end
  object BtnAtack: TButton
    Left = 16
    Top = 151
    Width = 150
    Height = 25
    Caption = #1053#1072#1087#1072#1089#1090#1100
    TabOrder = 4
    OnClick = BtnAtackClick
  end
  object BtnTimeLection: TButton
    Left = 267
    Top = 151
    Width = 75
    Height = 25
    Caption = #1048#1079#1091#1095#1080#1090#1100
    TabOrder = 5
    WordWrap = True
    OnClick = BtnTimeLectionClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 192
    Top = 128
  end
end
