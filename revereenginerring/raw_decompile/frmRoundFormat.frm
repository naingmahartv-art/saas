VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmRoundFormat
  Caption = "Round Format - ( for Buy )"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 11535
  ClientHeight = 10545
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdBuy
    Caption = "t0,f pm&&if; okdY odrf;qnf;rnf."
    Left = 6840
    Top = 2475
    Width = 3795
    Height = 465
    TabIndex = 8
    BeginProperty Font
      Name = "WinHaka"
      Size = 12
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdAgent
    Caption = "..."
    Left = 10680
    Top = 870
    Width = 345
    Height = 315
    TabIndex = 4
  End
  Begin VB.TextBox txtSrNo
    Left = 6870
    Top = 1230
    Width = 1035
    Height = 375
    Enabled = 0   'False
    TabIndex = 3
    Locked = -1  'True
    BeginProperty Font
      Name = "Arial"
      Size = 9
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtAmount
    Left = 8760
    Top = 1230
    Width = 1875
    Height = 375
    Enabled = 0   'False
    TabIndex = 2
    Locked = -1  'True
    BeginProperty Font
      Name = "Arial"
      Size = 9
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtAgentName
    Left = 6870
    Top = 810
    Width = 3765
    Height = 375
    TabIndex = 1
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin MSFlexGridLib.MSFlexGrid MSFle
    Left = 90
    Top = 135
    Width = 5460
    Height = 10230
    TabIndex = 0
    OleObjectBlob = "frmRoundFormat.frx":0000
  End
  Begin VB.Label Label1
    Caption = "udk,fpm;vS,f"
    Left = 5850
    Top = 870
    Width = 1095
    Height = 255
    TabIndex = 7
    BeginProperty Font
      Name = "WinHaka"
      Size = 12
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label5
    Caption = ",m,DeHygwf"
    Left = 5850
    Top = 1290
    Width = 1095
    Height = 255
    TabIndex = 6
    BeginProperty Font
      Name = "WinHaka"
      Size = 12
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label6
    Caption = "aiGyrmP"
    Left = 7980
    Top = 1320
    Width = 795
    Height = 255
    TabIndex = 5
    BeginProperty Font
      Name = "WinHaka"
      Size = 12
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmRoundFormat"

