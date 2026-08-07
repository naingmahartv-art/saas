VERSION 5.00
Begin VB.Form frmBook
  Caption = "Advance Commission"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  KeyPreview = -1  'True
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 12450
  ClientHeight = 8595
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdSearch
    Caption = "Se&arch (F8)"
    Left = 10740
    Top = 3990
    Width = 1110
    Height = 435
    TabIndex = 208
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtSrNo
    Left = 9570
    Top = 2610
    Width = 1305
    Height = 345
    TabIndex = 207
    Locked = -1  'True
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save (F1)"
    Left = 9570
    Top = 3990
    Width = 1140
    Height = 435
    TabIndex = 206
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtTotal
    ForeColor = &H80000002&
    Left = 9630
    Top = 7650
    Width = 1875
    Height = 405
    Text = "0"
    TabIndex = 204
    Alignment = 2 'Center
    BeginProperty Font
      Name = "Times"
      Size = 14.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdClose
    Caption = "Cl&ose (F4)"
    Left = 10740
    Top = 5100
    Width = 1110
    Height = 435
    TabIndex = 2
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtCustomer
    Left = 9570
    Top = 3150
    Width = 2325
    Height = 345
    TabIndex = 0
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
  Begin VB.CommandButton cmdCustomer
    Caption = "--"
    Left = 11910
    Top = 3150
    Width = 285
    Height = 345
    TabIndex = 1
  End
  Begin VB.TextBox txtCom
    Index = 99
    ForeColor = &H80&
    Left = 6360
    Top = 8040
    Width = 1245
    Height = 360
    TabIndex = 202
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 98
    ForeColor = &H80&
    Left = 6360
    Top = 7710
    Width = 1245
    Height = 360
    TabIndex = 201
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 97
    ForeColor = &H80&
    Left = 6360
    Top = 7380
    Width = 1245
    Height = 360
    TabIndex = 200
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 96
    ForeColor = &H80&
    Left = 6360
    Top = 7050
    Width = 1245
    Height = 360
    TabIndex = 199
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 95
    ForeColor = &H80&
    Left = 6360
    Top = 6720
    Width = 1245
    Height = 360
    TabIndex = 198
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 94
    ForeColor = &H80&
    Left = 6360
    Top = 6390
    Width = 1245
    Height = 360
    TabIndex = 197
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 93
    ForeColor = &H80&
    Left = 6360
    Top = 6060
    Width = 1245
    Height = 360
    TabIndex = 196
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 92
    ForeColor = &H80&
    Left = 6360
    Top = 5730
    Width = 1245
    Height = 360
    TabIndex = 195
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 91
    ForeColor = &H80&
    Left = 6360
    Top = 5400
    Width = 1245
    Height = 360
    TabIndex = 194
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 90
    ForeColor = &H80&
    Left = 6360
    Top = 5070
    Width = 1245
    Height = 360
    TabIndex = 193
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 89
    ForeColor = &H80&
    Left = 6360
    Top = 4740
    Width = 1245
    Height = 360
    TabIndex = 192
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 88
    ForeColor = &H80&
    Left = 6360
    Top = 4410
    Width = 1245
    Height = 360
    TabIndex = 191
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 87
    ForeColor = &H80&
    Left = 6360
    Top = 4080
    Width = 1245
    Height = 360
    TabIndex = 190
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 86
    ForeColor = &H80&
    Left = 6360
    Top = 3750
    Width = 1245
    Height = 360
    TabIndex = 189
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 85
    ForeColor = &H80&
    Left = 6360
    Top = 3420
    Width = 1245
    Height = 360
    TabIndex = 188
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 84
    ForeColor = &H80&
    Left = 6360
    Top = 3090
    Width = 1245
    Height = 360
    TabIndex = 187
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 83
    ForeColor = &H80&
    Left = 6360
    Top = 2760
    Width = 1245
    Height = 360
    TabIndex = 186
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 82
    ForeColor = &H80&
    Left = 6360
    Top = 2430
    Width = 1245
    Height = 360
    TabIndex = 185
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 81
    ForeColor = &H80&
    Left = 6360
    Top = 2100
    Width = 1245
    Height = 360
    TabIndex = 184
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 80
    ForeColor = &H80&
    Left = 6360
    Top = 1770
    Width = 1245
    Height = 360
    TabIndex = 183
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 79
    ForeColor = &H80&
    Left = 6360
    Top = 1440
    Width = 1245
    Height = 360
    TabIndex = 182
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 78
    ForeColor = &H80&
    Left = 6360
    Top = 1110
    Width = 1245
    Height = 360
    TabIndex = 181
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 77
    ForeColor = &H80&
    Left = 6360
    Top = 780
    Width = 1245
    Height = 360
    TabIndex = 180
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 76
    ForeColor = &H80&
    Left = 6360
    Top = 450
    Width = 1245
    Height = 360
    TabIndex = 179
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 75
    ForeColor = &H80&
    Left = 6360
    Top = 120
    Width = 1245
    Height = 360
    TabIndex = 178
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 74
    ForeColor = &H80&
    Left = 4500
    Top = 8040
    Width = 1215
    Height = 360
    TabIndex = 177
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 73
    ForeColor = &H80&
    Left = 4500
    Top = 7710
    Width = 1215
    Height = 360
    TabIndex = 176
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 72
    ForeColor = &H80&
    Left = 4500
    Top = 7380
    Width = 1215
    Height = 360
    TabIndex = 175
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 71
    ForeColor = &H80&
    Left = 4500
    Top = 7050
    Width = 1215
    Height = 360
    TabIndex = 174
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 70
    ForeColor = &H80&
    Left = 4500
    Top = 6720
    Width = 1215
    Height = 360
    TabIndex = 173
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 69
    ForeColor = &H80&
    Left = 4500
    Top = 6390
    Width = 1215
    Height = 360
    TabIndex = 172
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 68
    ForeColor = &H80&
    Left = 4500
    Top = 6060
    Width = 1215
    Height = 360
    TabIndex = 171
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 67
    ForeColor = &H80&
    Left = 4500
    Top = 5730
    Width = 1215
    Height = 360
    TabIndex = 170
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 66
    ForeColor = &H80&
    Left = 4500
    Top = 5400
    Width = 1215
    Height = 360
    TabIndex = 169
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 65
    ForeColor = &H80&
    Left = 4500
    Top = 5070
    Width = 1215
    Height = 360
    TabIndex = 168
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 64
    ForeColor = &H80&
    Left = 4500
    Top = 4740
    Width = 1215
    Height = 360
    TabIndex = 167
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 63
    ForeColor = &H80&
    Left = 4500
    Top = 4410
    Width = 1215
    Height = 360
    TabIndex = 166
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 62
    ForeColor = &H80&
    Left = 4500
    Top = 4080
    Width = 1215
    Height = 360
    TabIndex = 165
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 61
    ForeColor = &H80&
    Left = 4500
    Top = 3750
    Width = 1215
    Height = 360
    TabIndex = 164
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 60
    ForeColor = &H80&
    Left = 4500
    Top = 3420
    Width = 1215
    Height = 360
    TabIndex = 163
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 59
    ForeColor = &H80&
    Left = 4500
    Top = 3090
    Width = 1215
    Height = 360
    TabIndex = 162
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 58
    ForeColor = &H80&
    Left = 4500
    Top = 2760
    Width = 1215
    Height = 360
    TabIndex = 161
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 57
    ForeColor = &H80&
    Left = 4500
    Top = 2430
    Width = 1215
    Height = 360
    TabIndex = 160
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 56
    ForeColor = &H80&
    Left = 4500
    Top = 2100
    Width = 1215
    Height = 360
    TabIndex = 159
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 55
    ForeColor = &H80&
    Left = 4500
    Top = 1770
    Width = 1215
    Height = 360
    TabIndex = 158
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 54
    ForeColor = &H80&
    Left = 4500
    Top = 1440
    Width = 1215
    Height = 360
    TabIndex = 157
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 53
    ForeColor = &H80&
    Left = 4500
    Top = 1110
    Width = 1215
    Height = 360
    TabIndex = 156
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 52
    ForeColor = &H80&
    Left = 4500
    Top = 780
    Width = 1215
    Height = 360
    TabIndex = 155
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 51
    ForeColor = &H80&
    Left = 4500
    Top = 450
    Width = 1215
    Height = 360
    TabIndex = 154
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 50
    ForeColor = &H80&
    Left = 4500
    Top = 120
    Width = 1215
    Height = 360
    TabIndex = 153
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 49
    ForeColor = &H80&
    Left = 2670
    Top = 8040
    Width = 1245
    Height = 360
    TabIndex = 152
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 48
    ForeColor = &H80&
    Left = 2670
    Top = 7710
    Width = 1245
    Height = 360
    TabIndex = 151
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 47
    ForeColor = &H80&
    Left = 2670
    Top = 7380
    Width = 1245
    Height = 360
    TabIndex = 150
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 46
    ForeColor = &H80&
    Left = 2670
    Top = 7050
    Width = 1245
    Height = 360
    TabIndex = 149
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 45
    ForeColor = &H80&
    Left = 2670
    Top = 6720
    Width = 1245
    Height = 360
    TabIndex = 148
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 44
    ForeColor = &H80&
    Left = 2670
    Top = 6390
    Width = 1245
    Height = 360
    TabIndex = 147
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 43
    ForeColor = &H80&
    Left = 2670
    Top = 6060
    Width = 1245
    Height = 360
    TabIndex = 146
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 42
    ForeColor = &H80&
    Left = 2670
    Top = 5730
    Width = 1245
    Height = 360
    TabIndex = 145
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 41
    ForeColor = &H80&
    Left = 2670
    Top = 5400
    Width = 1245
    Height = 360
    TabIndex = 144
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 40
    ForeColor = &H80&
    Left = 2670
    Top = 5070
    Width = 1245
    Height = 360
    TabIndex = 143
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 39
    ForeColor = &H80&
    Left = 2670
    Top = 4740
    Width = 1245
    Height = 360
    TabIndex = 142
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 38
    ForeColor = &H80&
    Left = 2670
    Top = 4410
    Width = 1245
    Height = 360
    TabIndex = 141
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 37
    ForeColor = &H80&
    Left = 2670
    Top = 4080
    Width = 1245
    Height = 360
    TabIndex = 140
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 36
    ForeColor = &H80&
    Left = 2670
    Top = 3750
    Width = 1245
    Height = 360
    TabIndex = 139
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 35
    ForeColor = &H80&
    Left = 2670
    Top = 3420
    Width = 1245
    Height = 360
    TabIndex = 138
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 34
    ForeColor = &H80&
    Left = 2670
    Top = 3090
    Width = 1245
    Height = 360
    TabIndex = 137
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 33
    ForeColor = &H80&
    Left = 2670
    Top = 2760
    Width = 1245
    Height = 360
    TabIndex = 136
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 32
    ForeColor = &H80&
    Left = 2670
    Top = 2430
    Width = 1245
    Height = 360
    TabIndex = 135
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 31
    ForeColor = &H80&
    Left = 2670
    Top = 2100
    Width = 1245
    Height = 360
    TabIndex = 134
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 30
    ForeColor = &H80&
    Left = 2670
    Top = 1770
    Width = 1245
    Height = 360
    TabIndex = 133
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 29
    ForeColor = &H80&
    Left = 2670
    Top = 1440
    Width = 1245
    Height = 360
    TabIndex = 132
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 28
    ForeColor = &H80&
    Left = 2670
    Top = 1110
    Width = 1245
    Height = 360
    TabIndex = 131
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 27
    ForeColor = &H80&
    Left = 2670
    Top = 780
    Width = 1245
    Height = 360
    TabIndex = 130
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 26
    ForeColor = &H80&
    Left = 2670
    Top = 450
    Width = 1245
    Height = 360
    TabIndex = 129
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 25
    ForeColor = &H80&
    Left = 2670
    Top = 120
    Width = 1245
    Height = 360
    TabIndex = 128
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 24
    ForeColor = &H80&
    Left = 780
    Top = 8040
    Width = 1245
    Height = 360
    TabIndex = 127
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 23
    ForeColor = &H80&
    Left = 780
    Top = 7710
    Width = 1245
    Height = 360
    TabIndex = 126
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 22
    ForeColor = &H80&
    Left = 780
    Top = 7380
    Width = 1245
    Height = 360
    TabIndex = 125
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 21
    ForeColor = &H80&
    Left = 780
    Top = 7050
    Width = 1245
    Height = 360
    TabIndex = 124
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 20
    ForeColor = &H80&
    Left = 780
    Top = 6720
    Width = 1245
    Height = 360
    TabIndex = 123
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 19
    ForeColor = &H80&
    Left = 780
    Top = 6390
    Width = 1245
    Height = 360
    TabIndex = 122
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 18
    ForeColor = &H80&
    Left = 780
    Top = 6060
    Width = 1245
    Height = 360
    TabIndex = 121
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 17
    ForeColor = &H80&
    Left = 780
    Top = 5730
    Width = 1245
    Height = 360
    TabIndex = 120
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 16
    ForeColor = &H80&
    Left = 780
    Top = 5400
    Width = 1245
    Height = 360
    TabIndex = 119
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 15
    ForeColor = &H80&
    Left = 780
    Top = 5070
    Width = 1245
    Height = 360
    TabIndex = 118
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 14
    ForeColor = &H80&
    Left = 780
    Top = 4740
    Width = 1245
    Height = 360
    TabIndex = 117
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 13
    ForeColor = &H80&
    Left = 780
    Top = 4410
    Width = 1245
    Height = 360
    TabIndex = 116
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 12
    ForeColor = &H80&
    Left = 780
    Top = 4080
    Width = 1245
    Height = 360
    TabIndex = 115
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 11
    ForeColor = &H80&
    Left = 780
    Top = 3750
    Width = 1245
    Height = 360
    TabIndex = 114
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 10
    ForeColor = &H80&
    Left = 780
    Top = 3420
    Width = 1245
    Height = 360
    TabIndex = 113
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 9
    ForeColor = &H80&
    Left = 780
    Top = 3090
    Width = 1245
    Height = 360
    TabIndex = 112
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 8
    ForeColor = &H80&
    Left = 780
    Top = 2760
    Width = 1245
    Height = 360
    TabIndex = 111
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 7
    ForeColor = &H80&
    Left = 780
    Top = 2430
    Width = 1245
    Height = 360
    TabIndex = 110
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 6
    ForeColor = &H80&
    Left = 780
    Top = 2100
    Width = 1245
    Height = 360
    TabIndex = 109
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 5
    ForeColor = &H80&
    Left = 780
    Top = 1770
    Width = 1245
    Height = 360
    TabIndex = 108
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 4
    ForeColor = &H80&
    Left = 780
    Top = 1440
    Width = 1245
    Height = 360
    TabIndex = 107
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 3
    ForeColor = &H80&
    Left = 780
    Top = 1110
    Width = 1245
    Height = 360
    TabIndex = 106
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 2
    ForeColor = &H80&
    Left = 780
    Top = 780
    Width = 1245
    Height = 360
    TabIndex = 105
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 1
    ForeColor = &H80&
    Left = 780
    Top = 450
    Width = 1245
    Height = 360
    TabIndex = 5
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txtCom
    Index = 0
    ForeColor = &H80&
    Left = 780
    Top = 120
    Width = 1245
    Height = 360
    TabIndex = 4
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.Label Label12
    Caption = "Total Amount"
    Index = 1
    Left = 8430
    Top = 7770
    Width = 1140
    Height = 240
    TabIndex = 205
    AutoSize = -1  'True
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label12
    Caption = "Customer Name"
    Index = 0
    Left = 8370
    Top = 3210
    Width = 1170
    Height = 240
    TabIndex = 203
    AutoSize = -1  'True
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
  Begin VB.Label Label1
    Caption = "99"
    Index = 99
    Left = 5880
    Top = 8100
    Width = 285
    Height = 255
    TabIndex = 104
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "98"
    Index = 98
    Left = 5880
    Top = 7763
    Width = 285
    Height = 255
    TabIndex = 103
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "97"
    Index = 97
    Left = 5880
    Top = 7432
    Width = 285
    Height = 255
    TabIndex = 102
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "96"
    Index = 96
    Left = 5880
    Top = 7101
    Width = 285
    Height = 255
    TabIndex = 101
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "95"
    Index = 95
    Left = 5880
    Top = 6770
    Width = 285
    Height = 255
    TabIndex = 100
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "94"
    Index = 94
    Left = 5880
    Top = 6439
    Width = 285
    Height = 255
    TabIndex = 99
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "93"
    Index = 93
    Left = 5880
    Top = 6108
    Width = 285
    Height = 255
    TabIndex = 98
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "92"
    Index = 92
    Left = 5880
    Top = 5777
    Width = 285
    Height = 255
    TabIndex = 97
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "91"
    Index = 91
    Left = 5880
    Top = 5446
    Width = 285
    Height = 255
    TabIndex = 96
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "90"
    Index = 90
    Left = 5880
    Top = 5115
    Width = 285
    Height = 255
    TabIndex = 95
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "89"
    Index = 89
    Left = 5880
    Top = 4784
    Width = 285
    Height = 255
    TabIndex = 94
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "88"
    Index = 88
    Left = 5880
    Top = 4453
    Width = 285
    Height = 255
    TabIndex = 93
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "87"
    Index = 87
    Left = 5880
    Top = 4122
    Width = 285
    Height = 255
    TabIndex = 92
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "86"
    Index = 86
    Left = 5880
    Top = 3791
    Width = 285
    Height = 255
    TabIndex = 91
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "85"
    Index = 85
    Left = 5880
    Top = 3460
    Width = 285
    Height = 255
    TabIndex = 90
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "84"
    Index = 84
    Left = 5880
    Top = 3129
    Width = 285
    Height = 255
    TabIndex = 89
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "83"
    Index = 83
    Left = 5880
    Top = 2798
    Width = 285
    Height = 255
    TabIndex = 88
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "82"
    Index = 82
    Left = 5880
    Top = 2467
    Width = 285
    Height = 255
    TabIndex = 87
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "81"
    Index = 81
    Left = 5880
    Top = 2136
    Width = 285
    Height = 255
    TabIndex = 86
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "80"
    Index = 80
    Left = 5880
    Top = 1805
    Width = 285
    Height = 255
    TabIndex = 85
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "79"
    Index = 79
    Left = 5880
    Top = 1474
    Width = 285
    Height = 255
    TabIndex = 84
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "78"
    Index = 78
    Left = 5880
    Top = 1143
    Width = 285
    Height = 255
    TabIndex = 83
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "77"
    Index = 77
    Left = 5880
    Top = 812
    Width = 285
    Height = 255
    TabIndex = 82
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "76"
    Index = 76
    Left = 5880
    Top = 481
    Width = 285
    Height = 255
    TabIndex = 81
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "75"
    Index = 75
    Left = 5880
    Top = 150
    Width = 285
    Height = 255
    TabIndex = 80
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "74"
    Index = 74
    Left = 4110
    Top = 8100
    Width = 285
    Height = 255
    TabIndex = 79
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "73"
    Index = 73
    Left = 4110
    Top = 7763
    Width = 285
    Height = 255
    TabIndex = 78
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "72"
    Index = 72
    Left = 4110
    Top = 7432
    Width = 285
    Height = 255
    TabIndex = 77
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "71"
    Index = 71
    Left = 4110
    Top = 7101
    Width = 285
    Height = 255
    TabIndex = 76
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "70"
    Index = 70
    Left = 4110
    Top = 6770
    Width = 285
    Height = 255
    TabIndex = 75
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "69"
    Index = 69
    Left = 4110
    Top = 6439
    Width = 285
    Height = 255
    TabIndex = 74
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "68"
    Index = 68
    Left = 4110
    Top = 6108
    Width = 285
    Height = 255
    TabIndex = 73
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "67"
    Index = 67
    Left = 4110
    Top = 5777
    Width = 285
    Height = 255
    TabIndex = 72
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "66"
    Index = 66
    Left = 4110
    Top = 5446
    Width = 285
    Height = 255
    TabIndex = 71
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "65"
    Index = 65
    Left = 4110
    Top = 5115
    Width = 285
    Height = 255
    TabIndex = 70
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "64"
    Index = 64
    Left = 4110
    Top = 4784
    Width = 285
    Height = 255
    TabIndex = 69
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "63"
    Index = 63
    Left = 4110
    Top = 4453
    Width = 285
    Height = 255
    TabIndex = 68
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "62"
    Index = 62
    Left = 4110
    Top = 4122
    Width = 285
    Height = 255
    TabIndex = 67
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "61"
    Index = 61
    Left = 4110
    Top = 3791
    Width = 285
    Height = 255
    TabIndex = 66
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "60"
    Index = 60
    Left = 4110
    Top = 3460
    Width = 285
    Height = 255
    TabIndex = 65
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "59"
    Index = 59
    Left = 4110
    Top = 3129
    Width = 285
    Height = 255
    TabIndex = 64
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "58"
    Index = 58
    Left = 4110
    Top = 2798
    Width = 285
    Height = 255
    TabIndex = 63
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "57"
    Index = 57
    Left = 4110
    Top = 2467
    Width = 285
    Height = 255
    TabIndex = 62
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "56"
    Index = 56
    Left = 4110
    Top = 2136
    Width = 285
    Height = 255
    TabIndex = 61
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "55"
    Index = 55
    Left = 4110
    Top = 1805
    Width = 285
    Height = 255
    TabIndex = 60
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "54"
    Index = 54
    Left = 4110
    Top = 1474
    Width = 285
    Height = 255
    TabIndex = 59
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "53"
    Index = 53
    Left = 4110
    Top = 1143
    Width = 285
    Height = 255
    TabIndex = 58
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "52"
    Index = 52
    Left = 4110
    Top = 812
    Width = 285
    Height = 255
    TabIndex = 57
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "51"
    Index = 51
    Left = 4110
    Top = 481
    Width = 285
    Height = 255
    TabIndex = 56
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "50"
    Index = 50
    Left = 4110
    Top = 150
    Width = 285
    Height = 255
    TabIndex = 55
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "49"
    Index = 49
    Left = 2220
    Top = 8100
    Width = 285
    Height = 255
    TabIndex = 54
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "48"
    Index = 48
    Left = 2220
    Top = 7763
    Width = 285
    Height = 255
    TabIndex = 53
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "47"
    Index = 47
    Left = 2220
    Top = 7432
    Width = 285
    Height = 255
    TabIndex = 52
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "46"
    Index = 46
    Left = 2220
    Top = 7101
    Width = 285
    Height = 255
    TabIndex = 51
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "45"
    Index = 45
    Left = 2220
    Top = 6770
    Width = 285
    Height = 255
    TabIndex = 50
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "44"
    Index = 44
    Left = 2220
    Top = 6439
    Width = 285
    Height = 255
    TabIndex = 49
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "43"
    Index = 43
    Left = 2220
    Top = 6108
    Width = 285
    Height = 255
    TabIndex = 48
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "42"
    Index = 42
    Left = 2220
    Top = 5777
    Width = 285
    Height = 255
    TabIndex = 47
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "41"
    Index = 41
    Left = 2220
    Top = 5446
    Width = 285
    Height = 255
    TabIndex = 46
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "40"
    Index = 40
    Left = 2220
    Top = 5115
    Width = 285
    Height = 255
    TabIndex = 45
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "39"
    Index = 39
    Left = 2220
    Top = 4784
    Width = 285
    Height = 255
    TabIndex = 44
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "38"
    Index = 38
    Left = 2220
    Top = 4453
    Width = 285
    Height = 255
    TabIndex = 43
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "37"
    Index = 37
    Left = 2220
    Top = 4122
    Width = 285
    Height = 255
    TabIndex = 42
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "36"
    Index = 36
    Left = 2220
    Top = 3791
    Width = 285
    Height = 255
    TabIndex = 41
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "35"
    Index = 35
    Left = 2220
    Top = 3460
    Width = 285
    Height = 255
    TabIndex = 40
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "34"
    Index = 34
    Left = 2220
    Top = 3129
    Width = 285
    Height = 255
    TabIndex = 39
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "33"
    Index = 33
    Left = 2220
    Top = 2798
    Width = 285
    Height = 255
    TabIndex = 38
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "32"
    Index = 32
    Left = 2220
    Top = 2467
    Width = 285
    Height = 255
    TabIndex = 37
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "31"
    Index = 31
    Left = 2220
    Top = 2136
    Width = 285
    Height = 255
    TabIndex = 36
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "30"
    Index = 30
    Left = 2220
    Top = 1805
    Width = 285
    Height = 255
    TabIndex = 35
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "29"
    Index = 29
    Left = 2220
    Top = 1474
    Width = 285
    Height = 255
    TabIndex = 34
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "28"
    Index = 28
    Left = 2220
    Top = 1143
    Width = 285
    Height = 255
    TabIndex = 33
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "27"
    Index = 27
    Left = 2220
    Top = 812
    Width = 285
    Height = 255
    TabIndex = 32
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "26"
    Index = 26
    Left = 2220
    Top = 481
    Width = 285
    Height = 255
    TabIndex = 31
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "25"
    Index = 25
    Left = 2220
    Top = 150
    Width = 285
    Height = 255
    TabIndex = 30
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "24"
    Index = 24
    Left = 390
    Top = 8100
    Width = 285
    Height = 255
    TabIndex = 29
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "23"
    Index = 23
    Left = 390
    Top = 7763
    Width = 285
    Height = 255
    TabIndex = 28
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "22"
    Index = 22
    Left = 390
    Top = 7432
    Width = 285
    Height = 255
    TabIndex = 27
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "21"
    Index = 21
    Left = 390
    Top = 7101
    Width = 285
    Height = 255
    TabIndex = 26
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "20"
    Index = 20
    Left = 390
    Top = 6770
    Width = 285
    Height = 255
    TabIndex = 25
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "19"
    Index = 19
    Left = 390
    Top = 6439
    Width = 285
    Height = 255
    TabIndex = 24
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "18"
    Index = 18
    Left = 390
    Top = 6108
    Width = 285
    Height = 255
    TabIndex = 23
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "17"
    Index = 17
    Left = 390
    Top = 5777
    Width = 285
    Height = 255
    TabIndex = 22
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "16"
    Index = 16
    Left = 390
    Top = 5446
    Width = 285
    Height = 255
    TabIndex = 21
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "15"
    Index = 15
    Left = 390
    Top = 5115
    Width = 285
    Height = 255
    TabIndex = 20
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "14"
    Index = 14
    Left = 390
    Top = 4784
    Width = 285
    Height = 255
    TabIndex = 19
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "13"
    Index = 13
    Left = 390
    Top = 4453
    Width = 285
    Height = 255
    TabIndex = 18
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "12"
    Index = 12
    Left = 390
    Top = 4122
    Width = 285
    Height = 255
    TabIndex = 17
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "11"
    Index = 11
    Left = 390
    Top = 3791
    Width = 285
    Height = 255
    TabIndex = 16
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "10"
    Index = 10
    Left = 390
    Top = 3460
    Width = 285
    Height = 255
    TabIndex = 15
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "09"
    Index = 9
    Left = 390
    Top = 3129
    Width = 285
    Height = 255
    TabIndex = 14
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "08"
    Index = 8
    Left = 390
    Top = 2798
    Width = 285
    Height = 255
    TabIndex = 13
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "07"
    Index = 7
    Left = 390
    Top = 2467
    Width = 285
    Height = 255
    TabIndex = 12
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "06"
    Index = 6
    Left = 390
    Top = 2136
    Width = 285
    Height = 255
    TabIndex = 11
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "05"
    Index = 5
    Left = 390
    Top = 1805
    Width = 285
    Height = 255
    TabIndex = 10
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "04"
    Index = 4
    Left = 390
    Top = 1474
    Width = 285
    Height = 255
    TabIndex = 9
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "03"
    Index = 3
    Left = 390
    Top = 1143
    Width = 285
    Height = 255
    TabIndex = 8
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "02"
    Index = 2
    Left = 390
    Top = 812
    Width = 285
    Height = 255
    TabIndex = 7
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "01"
    Index = 1
    Left = 390
    Top = 481
    Width = 285
    Height = 255
    TabIndex = 6
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "00"
    Index = 0
    Left = 390
    Top = 150
    Width = 285
    Height = 255
    TabIndex = 3
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmBook"


Private Sub Form_Load() '450140
  loc_00450140: push ebp
  loc_00450141: mov ebp, esp
  loc_00450143: sub esp, 0000000Ch
  loc_00450146: push 00403B36h ; __vbaExceptHandler
  loc_0045014B: mov eax, fs:[00000000h]
  loc_00450151: push eax
  loc_00450152: mov fs:[00000000h], esp
  loc_00450159: sub esp, 00000018h
  loc_0045015C: push ebx
  loc_0045015D: push esi
  loc_0045015E: push edi
  loc_0045015F: mov var_C, esp
  loc_00450162: mov var_8, 00401330h
  loc_00450169: mov esi, Me
  loc_0045016C: mov eax, esi
  loc_0045016E: and eax, 00000001h
  loc_00450171: mov var_4, eax
  loc_00450174: and esi, FFFFFFFEh
  loc_00450177: push esi
  loc_00450178: mov Me, esi
  loc_0045017B: mov ecx, [esi]
  loc_0045017D: call [ecx+00000004h]
  loc_00450180: mov edx, [esi]
  loc_00450182: xor ebx, ebx
  loc_00450184: push esi
  loc_00450185: mov var_18, ebx
  loc_00450188: mov var_1C, ebx
  loc_0045018B: call [edx+00000300h]
  loc_00450191: push eax
  loc_00450192: lea eax, var_1C
  loc_00450195: push eax
  loc_00450196: call [004010A0h] ; __vbaObjSet
  loc_0045019C: mov ecx, [esi]
  loc_0045019E: lea edx, var_18
  loc_004501A1: push edx
  loc_004501A2: push esi
  loc_004501A3: mov edi, eax
  loc_004501A5: call [ecx+0000072Ch]
  loc_004501AB: mov ecx, var_18
  loc_004501AE: mov eax, [edi]
  loc_004501B0: push ecx
  loc_004501B1: push edi
  loc_004501B2: call [eax+000000A4h]
  loc_004501B8: cmp eax, ebx
  loc_004501BA: fnclex
  loc_004501BC: jge 004501D0h
  loc_004501BE: push 000000A4h
  loc_004501C3: push 0041E5E8h
  loc_004501C8: push edi
  loc_004501C9: push eax
  loc_004501CA: call [00401074h] ; __vbaHresultCheckObj
  loc_004501D0: lea ecx, var_18
  loc_004501D3: call [004012ACh] ; __vbaFreeStr
  loc_004501D9: lea ecx, var_1C
  loc_004501DC: call [004012B0h] ; __vbaFreeObj
  loc_004501E2: mov var_4, ebx
  loc_004501E5: push 00450200h
  loc_004501EA: jmp 004501FFh
  loc_004501EC: lea ecx, var_18
  loc_004501EF: call [004012ACh] ; __vbaFreeStr
  loc_004501F5: lea ecx, var_1C
  loc_004501F8: call [004012B0h] ; __vbaFreeObj
  loc_004501FE: ret
  loc_004501FF: ret
  loc_00450200: mov eax, Me
  loc_00450203: push eax
  loc_00450204: mov edx, [eax]
  loc_00450206: call [edx+00000008h]
  loc_00450209: mov eax, var_4
  loc_0045020C: mov ecx, var_14
  loc_0045020F: pop edi
  loc_00450210: pop esi
  loc_00450211: mov fs:[00000000h], ecx
  loc_00450218: pop ebx
  loc_00450219: mov esp, ebp
  loc_0045021B: pop ebp
  loc_0045021C: retn 0004h
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer) '44FE50
  loc_0044FE50: push ebp
  loc_0044FE51: mov ebp, esp
  loc_0044FE53: sub esp, 0000000Ch
  loc_0044FE56: push 00403B36h ; __vbaExceptHandler
  loc_0044FE5B: mov eax, fs:[00000000h]
  loc_0044FE61: push eax
  loc_0044FE62: mov fs:[00000000h], esp
  loc_0044FE69: sub esp, 000000A8h
  loc_0044FE6F: push ebx
  loc_0044FE70: push esi
  loc_0044FE71: push edi
  loc_0044FE72: mov var_C, esp
  loc_0044FE75: mov var_8, 00401320h
  loc_0044FE7C: mov esi, Me
  loc_0044FE7F: mov eax, esi
  loc_0044FE81: and eax, 00000001h
  loc_0044FE84: mov var_4, eax
  loc_0044FE87: and esi, FFFFFFFEh
  loc_0044FE8A: push esi
  loc_0044FE8B: mov Me, esi
  loc_0044FE8E: mov ecx, [esi]
  loc_0044FE90: call [ecx+00000004h]
  loc_0044FE93: mov edx, KeyCode
  loc_0044FE96: xor ebx, ebx
  loc_0044FE98: mov ecx, 00000070h
  loc_0044FE9D: mov var_18, ebx
  loc_0044FEA0: mov di, [edx]
  loc_0044FEA3: mov var_1C, ebx
  loc_0044FEA6: mov var_2C, ebx
  loc_0044FEA9: mov var_3C, ebx
  loc_0044FEAC: mov var_4C, ebx
  loc_0044FEAF: mov var_5C, ebx
  loc_0044FEB2: mov var_6C, ebx
  loc_0044FEB5: call [00401124h] ; __vbaI2I4
  loc_0044FEBB: cmp di, ax
  loc_0044FEBE: jnz 0045005Bh
  loc_0044FEC4: mov eax, [esi]
  loc_0044FEC6: push esi
  loc_0044FEC7: call [eax+00000310h]
  loc_0044FECD: lea ecx, var_1C
  loc_0044FED0: push eax
  loc_0044FED1: push ecx
  loc_0044FED2: call [004010A0h] ; __vbaObjSet
  loc_0044FED8: mov edi, eax
  loc_0044FEDA: lea eax, var_18
  loc_0044FEDD: push eax
  loc_0044FEDE: push edi
  loc_0044FEDF: mov edx, [edi]
  loc_0044FEE1: call [edx+000000A0h]
  loc_0044FEE7: cmp eax, ebx
  loc_0044FEE9: fnclex
  loc_0044FEEB: jge 0044FEFFh
  loc_0044FEED: push 000000A0h
  loc_0044FEF2: push 0041E5E8h
  loc_0044FEF7: push edi
  loc_0044FEF8: push eax
  loc_0044FEF9: call [00401074h] ; __vbaHresultCheckObj
  loc_0044FEFF: mov eax, var_18
  loc_0044FF02: lea ecx, var_2C
  loc_0044FF05: lea edx, var_3C
  loc_0044FF08: push ecx
  loc_0044FF09: push edx
  loc_0044FF0A: mov var_18, ebx
  loc_0044FF0D: mov var_24, eax
  loc_0044FF10: mov var_2C, 00000008h
  loc_0044FF17: call [004010D4h] ; rtcTrimVar
  loc_0044FF1D: lea eax, var_3C
  loc_0044FF20: lea ecx, var_6C
  loc_0044FF23: push eax
  loc_0044FF24: push ecx
  loc_0044FF25: mov var_64, 0041E5D4h
  loc_0044FF2C: mov var_6C, 00008008h
  loc_0044FF33: call [00401110h] ; __vbaVarTstEq
  loc_0044FF39: lea ecx, var_1C
  loc_0044FF3C: mov edi, eax
  loc_0044FF3E: call [004012B0h] ; __vbaFreeObj
  loc_0044FF44: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_0044FF4A: lea edx, var_3C
  loc_0044FF4D: lea eax, var_2C
  loc_0044FF50: push edx
  loc_0044FF51: push eax
  loc_0044FF52: push 00000002h
  loc_0044FF54: call ebx
  loc_0044FF56: add esp, 0000000Ch
  loc_0044FF59: test di, di
  loc_0044FF5C: jz 0044FFCAh
  loc_0044FF5E: mov ecx, 80020004h
  loc_0044FF63: mov eax, 0000000Ah
  loc_0044FF68: mov var_54, ecx
  loc_0044FF6B: mov var_44, ecx
  loc_0044FF6E: mov var_34, ecx
  loc_0044FF71: lea edx, var_6C
  loc_0044FF74: lea ecx, var_2C
  loc_0044FF77: mov var_5C, eax
  loc_0044FF7A: mov var_4C, eax
  loc_0044FF7D: mov var_3C, eax
  loc_0044FF80: mov var_64, 0041EA5Ch ; "Cann't Save Successfully."
  loc_0044FF87: mov var_6C, 00000008h
  loc_0044FF8E: call [00401240h] ; __vbaVarDup
  loc_0044FF94: lea ecx, var_5C
  loc_0044FF97: lea edx, var_4C
  loc_0044FF9A: push ecx
  loc_0044FF9B: lea eax, var_3C
  loc_0044FF9E: push edx
  loc_0044FF9F: push eax
  loc_0044FFA0: lea ecx, var_2C
  loc_0044FFA3: push 00000010h
  loc_0044FFA5: push ecx
  loc_0044FFA6: call [004010A4h] ; rtcMsgBox
  loc_0044FFAC: lea edx, var_5C
  loc_0044FFAF: lea eax, var_4C
  loc_0044FFB2: push edx
  loc_0044FFB3: lea ecx, var_3C
  loc_0044FFB6: push eax
  loc_0044FFB7: lea edx, var_2C
  loc_0044FFBA: push ecx
  loc_0044FFBB: push edx
  loc_0044FFBC: push 00000004h
  loc_0044FFBE: call ebx
  loc_0044FFC0: add esp, 00000014h
  loc_0044FFC3: xor ebx, ebx
  loc_0044FFC5: jmp 004500E0h
  loc_0044FFCA: mov eax, [esi]
  loc_0044FFCC: push esi
  loc_0044FFCD: call [eax+00000730h]
  loc_0044FFD3: mov ecx, [esi]
  loc_0044FFD5: push esi
  loc_0044FFD6: call [ecx+00000310h]
  loc_0044FFDC: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0044FFE2: lea edx, var_1C
  loc_0044FFE5: push eax
  loc_0044FFE6: push edx
  loc_0044FFE7: call ebx
  loc_0044FFE9: mov edi, eax
  loc_0044FFEB: push 0041E5D4h
  loc_0044FFF0: push edi
  loc_0044FFF1: mov eax, [edi]
  loc_0044FFF3: call [eax+000000A4h]
  loc_0044FFF9: test eax, eax
  loc_0044FFFB: fnclex
  loc_0044FFFD: jge 00450011h
  loc_0044FFFF: push 000000A4h
  loc_00450004: push 0041E5E8h
  loc_00450009: push edi
  loc_0045000A: push eax
  loc_0045000B: call [00401074h] ; __vbaHresultCheckObj
  loc_00450011: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00450017: lea ecx, var_1C
  loc_0045001A: call edi
  loc_0045001C: mov ecx, [esi]
  loc_0045001E: push esi
  loc_0045001F: call [ecx+00000310h]
  loc_00450025: lea edx, var_1C
  loc_00450028: push eax
  loc_00450029: push edx
  loc_0045002A: call ebx
  loc_0045002C: mov esi, eax
  loc_0045002E: push esi
  loc_0045002F: mov eax, [esi]
  loc_00450031: call [eax+00000204h]
  loc_00450037: test eax, eax
  loc_00450039: fnclex
  loc_0045003B: jge 0045004Fh
  loc_0045003D: push 00000204h
  loc_00450042: push 0041E5E8h
  loc_00450047: push esi
  loc_00450048: push eax
  loc_00450049: call [00401074h] ; __vbaHresultCheckObj
  loc_0045004F: lea ecx, var_1C
  loc_00450052: call edi
  loc_00450054: xor ebx, ebx
  loc_00450056: jmp 004500E0h
  loc_0045005B: mov ecx, 00000073h
  loc_00450060: call [00401124h] ; __vbaI2I4
  loc_00450066: cmp di, ax
  loc_00450069: jnz 004500C7h
  loc_0045006B: cmp [0061B394h], ebx
  loc_00450071: jnz 00450083h
  loc_00450073: push 0061B394h
  loc_00450078: push 0041E4A0h
  loc_0045007D: call [004011DCh] ; __vbaNew2
  loc_00450083: mov edi, [0061B394h]
  loc_00450089: lea ecx, var_1C
  loc_0045008C: push esi
  loc_0045008D: push ecx
  loc_0045008E: mov edx, [edi]
  loc_00450090: mov var_BC, edx
  loc_00450096: call [004010B8h] ; __vbaObjSetAddref
  loc_0045009C: mov edx, var_BC
  loc_004500A2: push eax
  loc_004500A3: push edi
  loc_004500A4: call [edx+00000010h]
  loc_004500A7: cmp eax, ebx
  loc_004500A9: fnclex
  loc_004500AB: jge 004500BCh
  loc_004500AD: push 00000010h
  loc_004500AF: push 0041E490h
  loc_004500B4: push edi
  loc_004500B5: push eax
  loc_004500B6: call [00401074h] ; __vbaHresultCheckObj
  loc_004500BC: lea ecx, var_1C
  loc_004500BF: call [004012B0h] ; __vbaFreeObj
  loc_004500C5: jmp 004500E0h
  loc_004500C7: mov ecx, 00000077h
  loc_004500CC: call [00401124h] ; __vbaI2I4
  loc_004500D2: cmp di, ax
  loc_004500D5: jnz 004500E0h
  loc_004500D7: mov eax, [esi]
  loc_004500D9: push esi
  loc_004500DA: call [eax+00000704h]
  loc_004500E0: mov var_4, ebx
  loc_004500E3: push 00450119h
  loc_004500E8: jmp 00450118h
  loc_004500EA: lea ecx, var_18
  loc_004500ED: call [004012ACh] ; __vbaFreeStr
  loc_004500F3: lea ecx, var_1C
  loc_004500F6: call [004012B0h] ; __vbaFreeObj
  loc_004500FC: lea ecx, var_5C
  loc_004500FF: lea edx, var_4C
  loc_00450102: push ecx
  loc_00450103: lea eax, var_3C
  loc_00450106: push edx
  loc_00450107: lea ecx, var_2C
  loc_0045010A: push eax
  loc_0045010B: push ecx
  loc_0045010C: push 00000004h
  loc_0045010E: call [00401038h] ; __vbaFreeVarList
  loc_00450114: add esp, 00000014h
  loc_00450117: ret
  loc_00450118: ret
  loc_00450119: mov eax, Me
  loc_0045011C: push eax
  loc_0045011D: mov edx, [eax]
  loc_0045011F: call [edx+00000008h]
  loc_00450122: mov eax, var_4
  loc_00450125: mov ecx, var_14
  loc_00450128: pop edi
  loc_00450129: pop esi
  loc_0045012A: mov fs:[00000000h], ecx
  loc_00450131: pop ebx
  loc_00450132: mov esp, ebp
  loc_00450134: pop ebp
  loc_00450135: retn 000Ch
End Sub

Private Sub txtCom_KeyPress(KeyAscii As Integer) '450220
  loc_00450220: push ebp
  loc_00450221: mov ebp, esp
  loc_00450223: sub esp, 00000018h
  loc_00450226: push 00403B36h ; __vbaExceptHandler
  loc_0045022B: mov eax, fs:[00000000h]
  loc_00450231: push eax
  loc_00450232: mov fs:[00000000h], esp
  loc_00450239: mov eax, 000000CCh
  loc_0045023E: call 00403B30h ; __vbaChkstk
  loc_00450243: push ebx
  loc_00450244: push esi
  loc_00450245: push edi
  loc_00450246: mov var_18, esp
  loc_00450249: mov var_14, 00401340h ; "'"
  loc_00450250: mov eax, Me
  loc_00450253: and eax, 00000001h
  loc_00450256: mov var_10, eax
  loc_00450259: mov ecx, Me
  loc_0045025C: and ecx, FFFFFFFEh
  loc_0045025F: mov Me, ecx
  loc_00450262: mov var_C, 00000000h
  loc_00450269: mov edx, Me
  loc_0045026C: mov eax, [edx]
  loc_0045026E: mov ecx, Me
  loc_00450271: push ecx
  loc_00450272: call [eax+00000004h]
  loc_00450275: mov var_4, 00000001h
  loc_0045027C: mov var_4, 00000002h
  loc_00450283: push FFFFFFFFh
  loc_00450285: call [004010A8h] ; __vbaOnError
  loc_0045028B: mov var_4, 00000003h
  loc_00450292: mov edx, 0041EA94h ; "0123456789."
  loc_00450297: lea ecx, var_24
  loc_0045029A: call [004011ECh] ; __vbaStrCopy
  loc_004502A0: mov var_4, 00000004h
  loc_004502A7: mov edx, var_24
  loc_004502AA: mov var_84, edx
  loc_004502B0: mov var_8C, 00000008h
  loc_004502BA: mov eax, arg_10
  loc_004502BD: movsx ecx, [eax]
  loc_004502C0: push ecx
  loc_004502C1: lea edx, var_3C
  loc_004502C4: push edx
  loc_004502C5: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004502CB: mov var_94, 00000000h
  loc_004502D5: mov var_9C, 00008002h
  loc_004502DF: mov eax, arg_10
  loc_004502E2: xor ecx, ecx
  loc_004502E4: cmp [eax], 0008h
  loc_004502E8: setz cl
  loc_004502EB: neg ecx
  loc_004502ED: mov var_A4, cx
  loc_004502F4: mov var_AC, 0000000Bh
  loc_004502FE: mov edx, arg_10
  loc_00450301: xor eax, eax
  loc_00450303: cmp [edx], 000Dh
  loc_00450307: setz al
  loc_0045030A: neg eax
  loc_0045030C: mov var_B4, ax
  loc_00450313: mov var_BC, 0000000Bh
  loc_0045031D: push 00000001h
  loc_0045031F: lea ecx, var_8C
  loc_00450325: push ecx
  loc_00450326: lea edx, var_3C
  loc_00450329: push edx
  loc_0045032A: push 00000000h
  loc_0045032C: lea eax, var_4C
  loc_0045032F: push eax
  loc_00450330: call [004011A8h] ; __vbaInStrVar
  loc_00450336: push eax
  loc_00450337: lea ecx, var_9C
  loc_0045033D: push ecx
  loc_0045033E: lea edx, var_5C
  loc_00450341: push edx
  loc_00450342: call [00401050h] ; __vbaVarCmpNe
  loc_00450348: push eax
  loc_00450349: lea eax, var_AC
  loc_0045034F: push eax
  loc_00450350: lea ecx, var_6C
  loc_00450353: push ecx
  loc_00450354: call [0040112Ch] ; __vbaVarOr
  loc_0045035A: push eax
  loc_0045035B: lea edx, var_BC
  loc_00450361: push edx
  loc_00450362: lea eax, var_7C
  loc_00450365: push eax
  loc_00450366: call [0040112Ch] ; __vbaVarOr
  loc_0045036C: push eax
  loc_0045036D: call [004010E0h] ; __vbaBoolVarNull
  loc_00450373: mov var_C0, ax
  loc_0045037A: lea ecx, var_BC
  loc_00450380: push ecx
  loc_00450381: lea edx, var_AC
  loc_00450387: push edx
  loc_00450388: lea eax, var_4C
  loc_0045038B: push eax
  loc_0045038C: lea ecx, var_3C
  loc_0045038F: push ecx
  loc_00450390: push 00000004h
  loc_00450392: call [00401038h] ; __vbaFreeVarList
  loc_00450398: add esp, 00000014h
  loc_0045039B: movsx edx, var_C0
  loc_004503A2: test edx, edx
  loc_004503A4: jz 00450570h
  loc_004503AA: mov var_4, 00000005h
  loc_004503B1: mov eax, arg_10
  loc_004503B4: mov ecx, arg_10
  loc_004503B7: mov dx, [ecx]
  loc_004503BA: mov [eax], dx
  loc_004503BD: mov var_4, 00000006h
  loc_004503C4: mov eax, arg_10
  loc_004503C7: cmp [eax], 000Dh
  loc_004503CB: jnz 0045056Eh
  loc_004503D1: mov var_4, 00000007h
  loc_004503D8: mov ecx, KeyAscii
  loc_004503DB: cmp [ecx], 0063h
  loc_004503DF: jnz 00450470h
  loc_004503E5: mov var_4, 00000008h
  loc_004503EC: mov edx, Me
  loc_004503EF: mov eax, [edx]
  loc_004503F1: mov ecx, Me
  loc_004503F4: push ecx
  loc_004503F5: call [eax+00000304h]
  loc_004503FB: push eax
  loc_004503FC: lea edx, var_28
  loc_004503FF: push edx
  loc_00450400: call [004010A0h] ; __vbaObjSet
  loc_00450406: mov var_C0, eax
  loc_0045040C: mov eax, var_C0
  loc_00450412: mov ecx, [eax]
  loc_00450414: mov edx, var_C0
  loc_0045041A: push edx
  loc_0045041B: call [ecx+000001A4h]
  loc_00450421: fnclex
  loc_00450423: mov var_C4, eax
  loc_00450429: cmp var_C4, 00000000h
  loc_00450430: jge 00450458h
  loc_00450432: push 000001A4h
  loc_00450437: push 0041EAACh
  loc_0045043C: mov eax, var_C0
  loc_00450442: push eax
  loc_00450443: mov ecx, var_C4
  loc_00450449: push ecx
  loc_0045044A: call [00401074h] ; __vbaHresultCheckObj
  loc_00450450: mov var_E4, eax
  loc_00450456: jmp 00450462h
  loc_00450458: mov var_E4, 00000000h
  loc_00450462: lea ecx, var_28
  loc_00450465: call [004012B0h] ; __vbaFreeObj
  loc_0045046B: jmp 0045056Eh
  loc_00450470: mov var_4, 0000000Ah
  loc_00450477: mov edx, Me
  loc_0045047A: mov eax, [edx]
  loc_0045047C: mov ecx, Me
  loc_0045047F: push ecx
  loc_00450480: call [eax+00000318h]
  loc_00450486: push eax
  loc_00450487: lea edx, var_28
  loc_0045048A: push edx
  loc_0045048B: call [004010A0h] ; __vbaObjSet
  loc_00450491: mov var_C0, eax
  loc_00450497: lea eax, var_2C
  loc_0045049A: push eax
  loc_0045049B: mov ecx, KeyAscii
  loc_0045049E: mov dx, [ecx]
  loc_004504A1: add dx, 0001h
  loc_004504A5: jo 004505ECh
  loc_004504AB: push edx
  loc_004504AC: mov eax, var_C0
  loc_004504B2: mov ecx, [eax]
  loc_004504B4: mov edx, var_C0
  loc_004504BA: push edx
  loc_004504BB: call [ecx+00000040h]
  loc_004504BE: fnclex
  loc_004504C0: mov var_C4, eax
  loc_004504C6: cmp var_C4, 00000000h
  loc_004504CD: jge 004504F2h
  loc_004504CF: push 00000040h
  loc_004504D1: push 0041E5D8h
  loc_004504D6: mov eax, var_C0
  loc_004504DC: push eax
  loc_004504DD: mov ecx, var_C4
  loc_004504E3: push ecx
  loc_004504E4: call [00401074h] ; __vbaHresultCheckObj
  loc_004504EA: mov var_E8, eax
  loc_004504F0: jmp 004504FCh
  loc_004504F2: mov var_E8, 00000000h
  loc_004504FC: mov edx, var_2C
  loc_004504FF: mov var_C8, edx
  loc_00450505: mov eax, var_C8
  loc_0045050B: mov ecx, [eax]
  loc_0045050D: mov edx, var_C8
  loc_00450513: push edx
  loc_00450514: call [ecx+00000204h]
  loc_0045051A: fnclex
  loc_0045051C: mov var_CC, eax
  loc_00450522: cmp var_CC, 00000000h
  loc_00450529: jge 00450551h
  loc_0045052B: push 00000204h
  loc_00450530: push 0041E5E8h
  loc_00450535: mov eax, var_C8
  loc_0045053B: push eax
  loc_0045053C: mov ecx, var_CC
  loc_00450542: push ecx
  loc_00450543: call [00401074h] ; __vbaHresultCheckObj
  loc_00450549: mov var_EC, eax
  loc_0045054F: jmp 0045055Bh
  loc_00450551: mov var_EC, 00000000h
  loc_0045055B: lea edx, var_2C
  loc_0045055E: push edx
  loc_0045055F: lea eax, var_28
  loc_00450562: push eax
  loc_00450563: push 00000002h
  loc_00450565: call [00401040h] ; __vbaFreeObjList
  loc_0045056B: add esp, 0000000Ch
  loc_0045056E: jmp 0045057Fh
  loc_00450570: mov var_4, 0000000Eh
  loc_00450577: mov ecx, arg_10
  loc_0045057A: mov [ecx], 0000h
  loc_0045057F: mov var_10, 00000000h
  loc_00450586: push 004505CAh
  loc_0045058B: jmp 004505C0h
  loc_0045058D: lea edx, var_2C
  loc_00450590: push edx
  loc_00450591: lea eax, var_28
  loc_00450594: push eax
  loc_00450595: push 00000002h
  loc_00450597: call [00401040h] ; __vbaFreeObjList
  loc_0045059D: add esp, 0000000Ch
  loc_004505A0: lea ecx, var_7C
  loc_004505A3: push ecx
  loc_004505A4: lea edx, var_6C
  loc_004505A7: push edx
  loc_004505A8: lea eax, var_5C
  loc_004505AB: push eax
  loc_004505AC: lea ecx, var_4C
  loc_004505AF: push ecx
  loc_004505B0: lea edx, var_3C
  loc_004505B3: push edx
  loc_004505B4: push 00000005h
  loc_004505B6: call [00401038h] ; __vbaFreeVarList
  loc_004505BC: add esp, 00000018h
  loc_004505BF: ret
  loc_004505C0: lea ecx, var_24
  loc_004505C3: call [004012ACh] ; __vbaFreeStr
  loc_004505C9: ret
  loc_004505CA: mov eax, Me
  loc_004505CD: mov ecx, [eax]
  loc_004505CF: mov edx, Me
  loc_004505D2: push edx
  loc_004505D3: call [ecx+00000008h]
  loc_004505D6: mov eax, var_10
  loc_004505D9: mov ecx, var_20
  loc_004505DC: mov fs:[00000000h], ecx
  loc_004505E3: pop edi
  loc_004505E4: pop esi
  loc_004505E5: pop ebx
  loc_004505E6: mov esp, ebp
  loc_004505E8: pop ebp
  loc_004505E9: retn 000Ch
End Sub

Private Sub txtCom_LostFocus(arg_C) '450600
  loc_00450600: push ebp
  loc_00450601: mov ebp, esp
  loc_00450603: sub esp, 0000000Ch
  loc_00450606: push 00403B36h ; __vbaExceptHandler
  loc_0045060B: mov eax, fs:[00000000h]
  loc_00450611: push eax
  loc_00450612: mov fs:[00000000h], esp
  loc_00450619: sub esp, 00000084h
  loc_0045061F: push ebx
  loc_00450620: push esi
  loc_00450621: push edi
  loc_00450622: mov var_C, esp
  loc_00450625: mov var_8, 004013A0h
  loc_0045062C: mov ebx, Me
  loc_0045062F: mov eax, ebx
  loc_00450631: and eax, 00000001h
  loc_00450634: mov var_4, eax
  loc_00450637: and ebx, FFFFFFFEh
  loc_0045063A: push ebx
  loc_0045063B: mov Me, ebx
  loc_0045063E: mov ecx, [ebx]
  loc_00450640: call [ecx+00000004h]
  loc_00450643: mov edx, [ebx]
  loc_00450645: xor edi, edi
  loc_00450647: push ebx
  loc_00450648: mov var_20, edi
  loc_0045064B: mov var_24, edi
  loc_0045064E: mov var_28, edi
  loc_00450651: mov var_2C, edi
  loc_00450654: mov var_3C, edi
  loc_00450657: mov var_4C, edi
  loc_0045065A: mov var_5C, edi
  loc_0045065D: mov var_6C, edi
  loc_00450660: call [edx+00000308h]
  loc_00450666: push eax
  loc_00450667: lea eax, var_28
  loc_0045066A: push eax
  loc_0045066B: call [004010A0h] ; __vbaObjSet
  loc_00450671: mov esi, eax
  loc_00450673: push edi
  loc_00450674: mov edx, [esi]
  loc_00450676: mov var_98, edx
  loc_0045067C: call [00401008h] ; __vbaStrI2
  loc_00450682: mov edx, eax
  loc_00450684: lea ecx, var_20
  loc_00450687: call [00401270h] ; __vbaStrMove
  loc_0045068D: mov ecx, var_98
  loc_00450693: push eax
  loc_00450694: push esi
  loc_00450695: call [ecx+000000A4h]
  loc_0045069B: test eax, eax
  loc_0045069D: fnclex
  loc_0045069F: jge 004506B7h
  loc_004506A1: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004506A7: push 000000A4h
  loc_004506AC: push 0041E5E8h
  loc_004506B1: push esi
  loc_004506B2: push eax
  loc_004506B3: call edi
  loc_004506B5: jmp 004506BDh
  loc_004506B7: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004506BD: lea ecx, var_20
  loc_004506C0: call [004012ACh] ; __vbaFreeStr
  loc_004506C6: lea ecx, var_28
  loc_004506C9: call [004012B0h] ; __vbaFreeObj
  loc_004506CF: mov edx, arg_C
  loc_004506D2: mov var_84, 00000001h
  loc_004506DC: mov var_18, 00000000h
  loc_004506E3: mov ax, [edx]
  loc_004506E6: mov var_88, ax
  loc_004506ED: mov cx, var_88
  loc_004506F4: cmp var_18, cx
  loc_004506F8: jg 00450930h
  loc_004506FE: mov edx, [ebx]
  loc_00450700: push ebx
  loc_00450701: call [edx+00000318h]
  loc_00450707: push eax
  loc_00450708: lea eax, var_28
  loc_0045070B: push eax
  loc_0045070C: call [004010A0h] ; __vbaObjSet
  loc_00450712: mov esi, eax
  loc_00450714: mov eax, var_18
  loc_00450717: lea edx, var_2C
  loc_0045071A: mov ecx, [esi]
  loc_0045071C: push edx
  loc_0045071D: push eax
  loc_0045071E: push esi
  loc_0045071F: call [ecx+00000040h]
  loc_00450722: test eax, eax
  loc_00450724: fnclex
  loc_00450726: jge 00450733h
  loc_00450728: push 00000040h
  loc_0045072A: push 0041E5D8h
  loc_0045072F: push esi
  loc_00450730: push eax
  loc_00450731: call edi
  loc_00450733: mov eax, var_2C
  loc_00450736: lea edx, var_20
  loc_00450739: push edx
  loc_0045073A: push eax
  loc_0045073B: mov ecx, [eax]
  loc_0045073D: mov esi, eax
  loc_0045073F: call [ecx+000000A0h]
  loc_00450745: test eax, eax
  loc_00450747: fnclex
  loc_00450749: jge 00450759h
  loc_0045074B: push 000000A0h
  loc_00450750: push 0041E5E8h
  loc_00450755: push esi
  loc_00450756: push eax
  loc_00450757: call edi
  loc_00450759: mov eax, var_20
  loc_0045075C: lea ecx, var_4C
  loc_0045075F: mov var_34, eax
  loc_00450762: lea eax, var_3C
  loc_00450765: push eax
  loc_00450766: push ecx
  loc_00450767: mov var_20, 00000000h
  loc_0045076E: mov var_3C, 00000008h
  loc_00450775: call [004010D4h] ; rtcTrimVar
  loc_0045077B: lea edx, var_4C
  loc_0045077E: lea eax, var_6C
  loc_00450781: push edx
  loc_00450782: push eax
  loc_00450783: mov var_64, 0041E5D4h
  loc_0045078A: mov var_6C, 00008008h
  loc_00450791: call [00401110h] ; __vbaVarTstEq
  loc_00450797: lea ecx, var_2C
  loc_0045079A: lea edx, var_28
  loc_0045079D: push ecx
  loc_0045079E: push edx
  loc_0045079F: push 00000002h
  loc_004507A1: mov esi, eax
  loc_004507A3: call [00401040h] ; __vbaFreeObjList
  loc_004507A9: lea eax, var_4C
  loc_004507AC: lea ecx, var_3C
  loc_004507AF: push eax
  loc_004507B0: push ecx
  loc_004507B1: push 00000002h
  loc_004507B3: call [00401038h] ; __vbaFreeVarList
  loc_004507B9: add esp, 00000018h
  loc_004507BC: test si, si
  loc_004507BF: jz 004507CDh
  loc_004507C1: mov var_1C, 00000000h
  loc_004507C8: jmp 00450851h
  loc_004507CD: mov edx, [ebx]
  loc_004507CF: push ebx
  loc_004507D0: call [edx+00000318h]
  loc_004507D6: push eax
  loc_004507D7: lea eax, var_28
  loc_004507DA: push eax
  loc_004507DB: call [004010A0h] ; __vbaObjSet
  loc_004507E1: mov esi, eax
  loc_004507E3: mov eax, var_18
  loc_004507E6: lea edx, var_2C
  loc_004507E9: mov ecx, [esi]
  loc_004507EB: push edx
  loc_004507EC: push eax
  loc_004507ED: push esi
  loc_004507EE: call [ecx+00000040h]
  loc_004507F1: test eax, eax
  loc_004507F3: fnclex
  loc_004507F5: jge 00450802h
  loc_004507F7: push 00000040h
  loc_004507F9: push 0041E5D8h
  loc_004507FE: push esi
  loc_004507FF: push eax
  loc_00450800: call edi
  loc_00450802: mov eax, var_2C
  loc_00450805: lea edx, var_20
  loc_00450808: push edx
  loc_00450809: push eax
  loc_0045080A: mov ecx, [eax]
  loc_0045080C: mov esi, eax
  loc_0045080E: call [ecx+000000A0h]
  loc_00450814: test eax, eax
  loc_00450816: fnclex
  loc_00450818: jge 00450828h
  loc_0045081A: push 000000A0h
  loc_0045081F: push 0041E5E8h
  loc_00450824: push esi
  loc_00450825: push eax
  loc_00450826: call edi
  loc_00450828: mov eax, var_20
  loc_0045082B: push eax
  loc_0045082C: call [00401114h] ; __vbaR4Str
  loc_00450832: fstp real4 ptr var_1C
  loc_00450835: lea ecx, var_20
  loc_00450838: call [004012ACh] ; __vbaFreeStr
  loc_0045083E: lea ecx, var_2C
  loc_00450841: lea edx, var_28
  loc_00450844: push ecx
  loc_00450845: push edx
  loc_00450846: push 00000002h
  loc_00450848: call [00401040h] ; __vbaFreeObjList
  loc_0045084E: add esp, 0000000Ch
  loc_00450851: mov eax, [ebx]
  loc_00450853: push ebx
  loc_00450854: call [eax+00000308h]
  loc_0045085A: mov edi, [004010A0h] ; __vbaObjSet
  loc_00450860: lea ecx, var_2C
  loc_00450863: push eax
  loc_00450864: push ecx
  loc_00450865: call edi
  loc_00450867: mov edx, [ebx]
  loc_00450869: push ebx
  loc_0045086A: mov esi, eax
  loc_0045086C: call [edx+00000308h]
  loc_00450872: push eax
  loc_00450873: lea eax, var_28
  loc_00450876: push eax
  loc_00450877: call edi
  loc_00450879: mov edi, eax
  loc_0045087B: lea edx, var_20
  loc_0045087E: push edx
  loc_0045087F: push edi
  loc_00450880: mov ecx, [edi]
  loc_00450882: call [ecx+000000A0h]
  loc_00450888: test eax, eax
  loc_0045088A: fnclex
  loc_0045088C: jge 004508A0h
  loc_0045088E: push 000000A0h
  loc_00450893: push 0041E5E8h
  loc_00450898: push edi
  loc_00450899: push eax
  loc_0045089A: call [00401074h] ; __vbaHresultCheckObj
  loc_004508A0: fld real4 ptr var_1C
  loc_004508A3: mov edi, [esi]
  loc_004508A5: call [00401228h] ; __vbaFpCy
  loc_004508AB: push edx
  loc_004508AC: push eax
  loc_004508AD: mov eax, var_20
  loc_004508B0: push eax
  loc_004508B1: call [004010C4h] ; __vbaCyStr
  loc_004508B7: push edx
  loc_004508B8: push eax
  loc_004508B9: call [004010ACh] ; __vbaCyAdd
  loc_004508BF: push edx
  loc_004508C0: push eax
  loc_004508C1: call [004012A4h] ; __vbaStrCy
  loc_004508C7: mov edx, eax
  loc_004508C9: lea ecx, var_24
  loc_004508CC: call [00401270h] ; __vbaStrMove
  loc_004508D2: push eax
  loc_004508D3: push esi
  loc_004508D4: call [edi+000000A4h]
  loc_004508DA: test eax, eax
  loc_004508DC: fnclex
  loc_004508DE: jge 004508F2h
  loc_004508E0: push 000000A4h
  loc_004508E5: push 0041E5E8h
  loc_004508EA: push esi
  loc_004508EB: push eax
  loc_004508EC: call [00401074h] ; __vbaHresultCheckObj
  loc_004508F2: lea ecx, var_24
  loc_004508F5: lea edx, var_20
  loc_004508F8: push ecx
  loc_004508F9: push edx
  loc_004508FA: push 00000002h
  loc_004508FC: call [004011FCh] ; __vbaFreeStrList
  loc_00450902: lea eax, var_2C
  loc_00450905: lea ecx, var_28
  loc_00450908: push eax
  loc_00450909: push ecx
  loc_0045090A: push 00000002h
  loc_0045090C: call [00401040h] ; __vbaFreeObjList
  loc_00450912: mov dx, var_84
  loc_00450919: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0045091F: add esp, 00000018h
  loc_00450922: add dx, var_18
  loc_00450926: jo 00450997h
  loc_00450928: mov var_18, edx
  loc_0045092B: jmp 004506EDh
  loc_00450930: mov var_4, 00000000h
  loc_00450937: fwait
  loc_00450938: push 00450978h
  loc_0045093D: jmp 00450977h
  loc_0045093F: lea eax, var_24
  loc_00450942: lea ecx, var_20
  loc_00450945: push eax
  loc_00450946: push ecx
  loc_00450947: push 00000002h
  loc_00450949: call [004011FCh] ; __vbaFreeStrList
  loc_0045094F: lea edx, var_2C
  loc_00450952: lea eax, var_28
  loc_00450955: push edx
  loc_00450956: push eax
  loc_00450957: push 00000002h
  loc_00450959: call [00401040h] ; __vbaFreeObjList
  loc_0045095F: lea ecx, var_5C
  loc_00450962: lea edx, var_4C
  loc_00450965: push ecx
  loc_00450966: lea eax, var_3C
  loc_00450969: push edx
  loc_0045096A: push eax
  loc_0045096B: push 00000003h
  loc_0045096D: call [00401038h] ; __vbaFreeVarList
  loc_00450973: add esp, 00000028h
  loc_00450976: ret
  loc_00450977: ret
  loc_00450978: mov eax, Me
  loc_0045097B: push eax
  loc_0045097C: mov ecx, [eax]
  loc_0045097E: call [ecx+00000008h]
  loc_00450981: mov eax, var_4
  loc_00450984: mov ecx, var_14
  loc_00450987: pop edi
  loc_00450988: pop esi
  loc_00450989: mov fs:[00000000h], ecx
  loc_00450990: pop ebx
  loc_00450991: mov esp, ebp
  loc_00450993: pop ebp
  loc_00450994: retn 0008h
End Sub

Private Sub txtCustomer_KeyPress(KeyAscii As Integer) '4509A0
  loc_004509A0: push ebp
  loc_004509A1: mov ebp, esp
  loc_004509A3: sub esp, 0000000Ch
  loc_004509A6: push 00403B36h ; __vbaExceptHandler
  loc_004509AB: mov eax, fs:[00000000h]
  loc_004509B1: push eax
  loc_004509B2: mov fs:[00000000h], esp
  loc_004509B9: sub esp, 00000014h
  loc_004509BC: push ebx
  loc_004509BD: push esi
  loc_004509BE: push edi
  loc_004509BF: mov var_C, esp
  loc_004509C2: mov var_8, 004013B0h
  loc_004509C9: mov esi, Me
  loc_004509CC: mov eax, esi
  loc_004509CE: and eax, 00000001h
  loc_004509D1: mov var_4, eax
  loc_004509D4: and esi, FFFFFFFEh
  loc_004509D7: push esi
  loc_004509D8: mov Me, esi
  loc_004509DB: mov ecx, [esi]
  loc_004509DD: call [ecx+00000004h]
  loc_004509E0: mov edx, KeyAscii
  loc_004509E3: xor edi, edi
  loc_004509E5: mov var_18, edi
  loc_004509E8: cmp [edx], 000Dh
  loc_004509EC: jnz 00450A2Eh
  loc_004509EE: mov eax, [esi]
  loc_004509F0: push esi
  loc_004509F1: call [eax+00000308h]
  loc_004509F7: lea ecx, var_18
  loc_004509FA: push eax
  loc_004509FB: push ecx
  loc_004509FC: call [004010A0h] ; __vbaObjSet
  loc_00450A02: mov esi, eax
  loc_00450A04: push esi
  loc_00450A05: mov edx, [esi]
  loc_00450A07: call [edx+00000204h]
  loc_00450A0D: cmp eax, edi
  loc_00450A0F: fnclex
  loc_00450A11: jge 00450A25h
  loc_00450A13: push 00000204h
  loc_00450A18: push 0041E5E8h
  loc_00450A1D: push esi
  loc_00450A1E: push eax
  loc_00450A1F: call [00401074h] ; __vbaHresultCheckObj
  loc_00450A25: lea ecx, var_18
  loc_00450A28: call [004012B0h] ; __vbaFreeObj
  loc_00450A2E: mov var_4, edi
  loc_00450A31: push 00450A43h
  loc_00450A36: jmp 00450A42h
  loc_00450A38: lea ecx, var_18
  loc_00450A3B: call [004012B0h] ; __vbaFreeObj
  loc_00450A41: ret
  loc_00450A42: ret
  loc_00450A43: mov eax, Me
  loc_00450A46: push eax
  loc_00450A47: mov ecx, [eax]
  loc_00450A49: call [ecx+00000008h]
  loc_00450A4C: mov eax, var_4
  loc_00450A4F: mov ecx, var_14
  loc_00450A52: pop edi
  loc_00450A53: pop esi
  loc_00450A54: mov fs:[00000000h], ecx
  loc_00450A5B: pop ebx
  loc_00450A5C: mov esp, ebp
  loc_00450A5E: pop ebp
  loc_00450A5F: retn 0008h
End Sub

Private Sub txtCustomer_LostFocus() '450A70
  loc_00450A70: push ebp
  loc_00450A71: mov ebp, esp
  loc_00450A73: sub esp, 0000000Ch
  loc_00450A76: push 00403B36h ; __vbaExceptHandler
  loc_00450A7B: mov eax, fs:[00000000h]
  loc_00450A81: push eax
  loc_00450A82: mov fs:[00000000h], esp
  loc_00450A89: sub esp, 000000E0h
  loc_00450A8F: push ebx
  loc_00450A90: push esi
  loc_00450A91: push edi
  loc_00450A92: mov var_C, esp
  loc_00450A95: mov var_8, 004013C0h
  loc_00450A9C: mov esi, Me
  loc_00450A9F: mov eax, esi
  loc_00450AA1: and eax, 00000001h
  loc_00450AA4: mov var_4, eax
  loc_00450AA7: and esi, FFFFFFFEh
  loc_00450AAA: push esi
  loc_00450AAB: mov Me, esi
  loc_00450AAE: mov ecx, [esi]
  loc_00450AB0: call [ecx+00000004h]
  loc_00450AB3: mov edx, [esi]
  loc_00450AB5: xor ebx, ebx
  loc_00450AB7: push esi
  loc_00450AB8: mov var_18, ebx
  loc_00450ABB: mov var_1C, ebx
  loc_00450ABE: mov var_20, ebx
  loc_00450AC1: mov var_24, ebx
  loc_00450AC4: mov var_28, ebx
  loc_00450AC7: mov var_2C, ebx
  loc_00450ACA: mov var_3C, ebx
  loc_00450ACD: mov var_4C, ebx
  loc_00450AD0: mov var_5C, ebx
  loc_00450AD3: mov var_6C, ebx
  loc_00450AD6: mov var_7C, ebx
  loc_00450AD9: mov var_8C, ebx
  loc_00450ADF: mov var_9C, ebx
  loc_00450AE5: mov var_AC, ebx
  loc_00450AEB: mov var_BC, ebx
  loc_00450AF1: mov var_C0, ebx
  loc_00450AF7: mov var_C4, ebx
  loc_00450AFD: call [edx+00000310h]
  loc_00450B03: push eax
  loc_00450B04: lea eax, var_24
  loc_00450B07: push eax
  loc_00450B08: call [004010A0h] ; __vbaObjSet
  loc_00450B0E: mov edi, eax
  loc_00450B10: lea edx, var_1C
  loc_00450B13: push edx
  loc_00450B14: push edi
  loc_00450B15: mov ecx, [edi]
  loc_00450B17: call [ecx+000000A0h]
  loc_00450B1D: cmp eax, ebx
  loc_00450B1F: fnclex
  loc_00450B21: jge 00450B35h
  loc_00450B23: push 000000A0h
  loc_00450B28: push 0041E5E8h
  loc_00450B2D: push edi
  loc_00450B2E: push eax
  loc_00450B2F: call [00401074h] ; __vbaHresultCheckObj
  loc_00450B35: mov eax, var_1C
  loc_00450B38: push eax
  loc_00450B39: push 0041E5D4h
  loc_00450B3E: call [0040110Ch] ; __vbaStrCmp
  loc_00450B44: mov edi, eax
  loc_00450B46: lea ecx, var_1C
  loc_00450B49: neg edi
  loc_00450B4B: sbb edi, edi
  loc_00450B4D: inc edi
  loc_00450B4E: neg edi
  loc_00450B50: call [004012ACh] ; __vbaFreeStr
  loc_00450B56: lea ecx, var_24
  loc_00450B59: call [004012B0h] ; __vbaFreeObj
  loc_00450B5F: cmp di, bx
  loc_00450B62: jnz 00451044h
  loc_00450B68: mov ecx, [esi]
  loc_00450B6A: push esi
  loc_00450B6B: call [ecx+00000310h]
  loc_00450B71: lea edx, var_24
  loc_00450B74: push eax
  loc_00450B75: push edx
  loc_00450B76: call [004010A0h] ; __vbaObjSet
  loc_00450B7C: mov edi, eax
  loc_00450B7E: lea ecx, var_1C
  loc_00450B81: push ecx
  loc_00450B82: push edi
  loc_00450B83: mov eax, [edi]
  loc_00450B85: call [eax+000000A0h]
  loc_00450B8B: cmp eax, ebx
  loc_00450B8D: fnclex
  loc_00450B8F: jge 00450BA3h
  loc_00450B91: push 000000A0h
  loc_00450B96: push 0041E5E8h
  loc_00450B9B: push edi
  loc_00450B9C: push eax
  loc_00450B9D: call [00401074h] ; __vbaHresultCheckObj
  loc_00450BA3: mov eax, var_1C
  loc_00450BA6: lea edx, var_3C
  loc_00450BA9: mov var_34, eax
  loc_00450BAC: lea eax, var_4C
  loc_00450BAF: mov edi, 00000008h
  loc_00450BB4: push edx
  loc_00450BB5: push eax
  loc_00450BB6: mov var_1C, ebx
  loc_00450BB9: mov var_3C, edi
  loc_00450BBC: call [004010D4h] ; rtcTrimVar
  loc_00450BC2: mov edx, [0061A13Ch]
  loc_00450BC8: mov var_74, 0041EAC0h ; "Select * From AgentThai WHERE AgentName='"
  loc_00450BCF: mov var_7C, edi
  loc_00450BD2: mov var_84, 0041E890h ; "'"
  loc_00450BDC: mov var_8C, edi
  loc_00450BE2: mov edi, [edx]
  loc_00450BE4: lea edx, var_28
  loc_00450BE7: mov ecx, 0000000Ah
  loc_00450BEC: push edx
  loc_00450BED: mov var_AC, ecx
  loc_00450BF3: sub esp, 00000010h
  loc_00450BF6: mov eax, 80020004h
  loc_00450BFB: mov edx, esp
  loc_00450BFD: mov var_A4, eax
  loc_00450C03: sub esp, 00000010h
  loc_00450C06: mov [edx], ecx
  loc_00450C08: mov ecx, var_B8
  loc_00450C0E: mov [edx+00000004h], ecx
  loc_00450C11: mov ecx, esp
  loc_00450C13: sub esp, 00000010h
  loc_00450C16: mov [edx+00000008h], eax
  loc_00450C19: mov eax, var_B0
  loc_00450C1F: mov [edx+0000000Ch], eax
  loc_00450C22: mov edx, var_AC
  loc_00450C28: mov eax, var_A8
  loc_00450C2E: mov [ecx], edx
  loc_00450C30: mov edx, var_A4
  loc_00450C36: mov [ecx+00000004h], eax
  loc_00450C39: mov eax, var_A0
  loc_00450C3F: mov [ecx+00000008h], edx
  loc_00450C42: mov edx, var_98
  loc_00450C48: mov [ecx+0000000Ch], eax
  loc_00450C4B: mov ecx, esp
  loc_00450C4D: mov eax, 00000003h
  loc_00450C52: mov [ecx], eax
  loc_00450C54: mov eax, 00000004h
  loc_00450C59: mov [ecx+00000004h], edx
  loc_00450C5C: lea edx, var_4C
  loc_00450C5F: mov [ecx+00000008h], eax
  loc_00450C62: mov eax, var_90
  loc_00450C68: mov [ecx+0000000Ch], eax
  loc_00450C6B: lea ecx, var_7C
  loc_00450C6E: push ecx
  loc_00450C6F: lea eax, var_5C
  loc_00450C72: push edx
  loc_00450C73: push eax
  loc_00450C74: call [004011B4h] ; __vbaVarCat
  loc_00450C7A: lea ecx, var_8C
  loc_00450C80: push eax
  loc_00450C81: lea edx, var_6C
  loc_00450C84: push ecx
  loc_00450C85: push edx
  loc_00450C86: call [004011B4h] ; __vbaVarCat
  loc_00450C8C: push eax
  loc_00450C8D: lea eax, var_20
  loc_00450C90: push eax
  loc_00450C91: call [004011B0h] ; __vbaStrVarVal
  loc_00450C97: mov ecx, [0061A13Ch]
  loc_00450C9D: push eax
  loc_00450C9E: push ecx
  loc_00450C9F: call [edi+000000BCh]
  loc_00450CA5: cmp eax, ebx
  loc_00450CA7: fnclex
  loc_00450CA9: jge 00450CC3h
  loc_00450CAB: mov edx, [0061A13Ch]
  loc_00450CB1: push 000000BCh
  loc_00450CB6: push 0041E928h
  loc_00450CBB: push edx
  loc_00450CBC: push eax
  loc_00450CBD: call [00401074h] ; __vbaHresultCheckObj
  loc_00450CC3: mov eax, var_28
  loc_00450CC6: mov edi, [004010A0h] ; __vbaObjSet
  loc_00450CCC: push eax
  loc_00450CCD: lea eax, var_18
  loc_00450CD0: push eax
  loc_00450CD1: mov var_28, ebx
  loc_00450CD4: call edi
  loc_00450CD6: lea ecx, var_20
  loc_00450CD9: call [004012ACh] ; __vbaFreeStr
  loc_00450CDF: lea ecx, var_24
  loc_00450CE2: call [004012B0h] ; __vbaFreeObj
  loc_00450CE8: lea ecx, var_6C
  loc_00450CEB: lea edx, var_5C
  loc_00450CEE: push ecx
  loc_00450CEF: lea eax, var_4C
  loc_00450CF2: push edx
  loc_00450CF3: lea ecx, var_3C
  loc_00450CF6: push eax
  loc_00450CF7: push ecx
  loc_00450CF8: push 00000004h
  loc_00450CFA: call [00401038h] ; __vbaFreeVarList
  loc_00450D00: mov eax, var_18
  loc_00450D03: add esp, 00000014h
  loc_00450D06: lea ecx, var_C0
  loc_00450D0C: mov edx, [eax]
  loc_00450D0E: push ecx
  loc_00450D0F: push eax
  loc_00450D10: call [edx+00000020h]
  loc_00450D13: cmp eax, ebx
  loc_00450D15: fnclex
  loc_00450D17: jge 00450D2Bh
  loc_00450D19: mov edx, var_18
  loc_00450D1C: push 00000020h
  loc_00450D1E: push 0041E938h
  loc_00450D23: push edx
  loc_00450D24: push eax
  loc_00450D25: call [00401074h] ; __vbaHresultCheckObj
  loc_00450D2B: mov eax, var_18
  loc_00450D2E: lea edx, var_C4
  loc_00450D34: push edx
  loc_00450D35: push eax
  loc_00450D36: mov ecx, [eax]
  loc_00450D38: call [ecx+00000034h]
  loc_00450D3B: cmp eax, ebx
  loc_00450D3D: fnclex
  loc_00450D3F: jge 00450D53h
  loc_00450D41: mov ecx, var_18
  loc_00450D44: push 00000034h
  loc_00450D46: push 0041E938h
  loc_00450D4B: push ecx
  loc_00450D4C: push eax
  loc_00450D4D: call [00401074h] ; __vbaHresultCheckObj
  loc_00450D53: xor edx, edx
  loc_00450D55: cmp var_C4, bx
  loc_00450D5C: mov ecx, [esi]
  loc_00450D5E: push esi
  loc_00450D5F: setz dl
  loc_00450D62: xor eax, eax
  loc_00450D64: cmp var_C0, bx
  loc_00450D6B: setz al
  loc_00450D6E: or edx, eax
  loc_00450D70: jz 00450F21h
  loc_00450D76: call [ecx+00000310h]
  loc_00450D7C: lea edx, var_2C
  loc_00450D7F: push eax
  loc_00450D80: push edx
  loc_00450D81: call edi
  loc_00450D83: mov var_D4, eax
  loc_00450D89: mov eax, var_18
  loc_00450D8C: lea edx, var_24
  loc_00450D8F: mov ecx, [eax]
  loc_00450D91: push edx
  loc_00450D92: push eax
  loc_00450D93: call [ecx+000000B4h]
  loc_00450D99: cmp eax, ebx
  loc_00450D9B: fnclex
  loc_00450D9D: jge 00450DB4h
  loc_00450D9F: mov ecx, var_18
  loc_00450DA2: push 000000B4h
  loc_00450DA7: push 0041E938h
  loc_00450DAC: push ecx
  loc_00450DAD: push eax
  loc_00450DAE: call [00401074h] ; __vbaHresultCheckObj
  loc_00450DB4: lea edi, var_28
  loc_00450DB7: mov eax, var_24
  loc_00450DBA: push edi
  loc_00450DBB: mov ecx, 00000008h
  loc_00450DC0: sub esp, 00000010h
  loc_00450DC3: mov var_7C, ecx
  loc_00450DC6: mov edi, esp
  loc_00450DC8: mov var_74, 0041EB18h ; "AgentName"
  loc_00450DCF: mov edx, [eax]
  loc_00450DD1: push eax
  loc_00450DD2: mov [edi], ecx
  loc_00450DD4: mov ecx, var_78
  loc_00450DD7: mov var_CC, eax
  loc_00450DDD: mov [edi+00000004h], ecx
  loc_00450DE0: mov ecx, var_74
  loc_00450DE3: mov [edi+00000008h], ecx
  loc_00450DE6: mov ecx, var_70
  loc_00450DE9: mov [edi+0000000Ch], ecx
  loc_00450DEC: call [edx+00000030h]
  loc_00450DEF: cmp eax, ebx
  loc_00450DF1: fnclex
  loc_00450DF3: jge 00450E0Ah
  loc_00450DF5: mov edx, var_CC
  loc_00450DFB: push 00000030h
  loc_00450DFD: push 0041EA14h ; "S"
  loc_00450E02: push edx
  loc_00450E03: push eax
  loc_00450E04: call [00401074h] ; __vbaHresultCheckObj
  loc_00450E0A: mov eax, var_28
  loc_00450E0D: lea ecx, var_4C
  loc_00450E10: mov var_34, eax
  loc_00450E13: lea eax, var_3C
  loc_00450E16: push eax
  loc_00450E17: push ecx
  loc_00450E18: mov var_28, ebx
  loc_00450E1B: mov var_3C, 00000009h
  loc_00450E22: call [004010D4h] ; rtcTrimVar
  loc_00450E28: mov edx, var_D4
  loc_00450E2E: lea eax, var_4C
  loc_00450E31: lea ecx, var_1C
  loc_00450E34: push eax
  loc_00450E35: mov edi, [edx]
  loc_00450E37: push ecx
  loc_00450E38: call [004011B0h] ; __vbaStrVarVal
  loc_00450E3E: mov edx, edi
  loc_00450E40: mov edi, var_D4
  loc_00450E46: push eax
  loc_00450E47: push edi
  loc_00450E48: call [edx+000000A4h]
  loc_00450E4E: cmp eax, ebx
  loc_00450E50: fnclex
  loc_00450E52: jge 00450E66h
  loc_00450E54: push 000000A4h
  loc_00450E59: push 0041E5E8h
  loc_00450E5E: push edi
  loc_00450E5F: push eax
  loc_00450E60: call [00401074h] ; __vbaHresultCheckObj
  loc_00450E66: lea ecx, var_1C
  loc_00450E69: call [004012ACh] ; __vbaFreeStr
  loc_00450E6F: lea eax, var_2C
  loc_00450E72: lea ecx, var_24
  loc_00450E75: push eax
  loc_00450E76: push ecx
  loc_00450E77: push 00000002h
  loc_00450E79: call [00401040h] ; __vbaFreeObjList
  loc_00450E7F: mov edi, [00401038h] ; __vbaFreeVarList
  loc_00450E85: lea edx, var_4C
  loc_00450E88: lea eax, var_3C
  loc_00450E8B: push edx
  loc_00450E8C: push eax
  loc_00450E8D: push 00000002h
  loc_00450E8F: call edi
  loc_00450E91: mov ecx, [esi]
  loc_00450E93: add esp, 00000018h
  loc_00450E96: push esi
  loc_00450E97: call [ecx+00000310h]
  loc_00450E9D: lea edx, var_24
  loc_00450EA0: push eax
  loc_00450EA1: push edx
  loc_00450EA2: call [004010A0h] ; __vbaObjSet
  loc_00450EA8: mov esi, eax
  loc_00450EAA: lea ecx, var_1C
  loc_00450EAD: push ecx
  loc_00450EAE: push esi
  loc_00450EAF: mov eax, [esi]
  loc_00450EB1: call [eax+000000A0h]
  loc_00450EB7: cmp eax, ebx
  loc_00450EB9: fnclex
  loc_00450EBB: jge 00450ECFh
  loc_00450EBD: push 000000A0h
  loc_00450EC2: push 0041E5E8h
  loc_00450EC7: push esi
  loc_00450EC8: push eax
  loc_00450EC9: call [00401074h] ; __vbaHresultCheckObj
  loc_00450ECF: mov eax, var_1C
  loc_00450ED2: lea edx, var_3C
  loc_00450ED5: mov var_34, eax
  loc_00450ED8: lea eax, var_4C
  loc_00450EDB: push edx
  loc_00450EDC: push eax
  loc_00450EDD: mov var_1C, ebx
  loc_00450EE0: mov var_3C, 00000008h
  loc_00450EE7: call [004010D4h] ; rtcTrimVar
  loc_00450EED: lea ecx, var_4C
  loc_00450EF0: push ecx
  loc_00450EF1: call [00401028h] ; __vbaStrVarMove
  loc_00450EF7: mov edx, eax
  loc_00450EF9: mov ecx, 0061A0B8h
  loc_00450EFE: call [00401270h] ; __vbaStrMove
  loc_00450F04: lea ecx, var_24
  loc_00450F07: call [004012B0h] ; __vbaFreeObj
  loc_00450F0D: lea edx, var_4C
  loc_00450F10: lea eax, var_3C
  loc_00450F13: push edx
  loc_00450F14: push eax
  loc_00450F15: push 00000002h
  loc_00450F17: call edi
  loc_00450F19: add esp, 0000000Ch
  loc_00450F1C: jmp 00451006h
  loc_00450F21: call [ecx+00000310h]
  loc_00450F27: lea edx, var_24
  loc_00450F2A: push eax
  loc_00450F2B: push edx
  loc_00450F2C: call edi
  loc_00450F2E: mov edi, eax
  loc_00450F30: push 0041E5D4h
  loc_00450F35: push edi
  loc_00450F36: mov eax, [edi]
  loc_00450F38: call [eax+000000A4h]
  loc_00450F3E: cmp eax, ebx
  loc_00450F40: fnclex
  loc_00450F42: jge 00450F56h
  loc_00450F44: push 000000A4h
  loc_00450F49: push 0041E5E8h
  loc_00450F4E: push edi
  loc_00450F4F: push eax
  loc_00450F50: call [00401074h] ; __vbaHresultCheckObj
  loc_00450F56: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00450F5C: lea ecx, var_24
  loc_00450F5F: call edi
  loc_00450F61: mov ecx, [esi]
  loc_00450F63: push esi
  loc_00450F64: call [ecx+00000310h]
  loc_00450F6A: lea edx, var_24
  loc_00450F6D: push eax
  loc_00450F6E: push edx
  loc_00450F6F: call [004010A0h] ; __vbaObjSet
  loc_00450F75: mov esi, eax
  loc_00450F77: push esi
  loc_00450F78: mov eax, [esi]
  loc_00450F7A: call [eax+00000204h]
  loc_00450F80: cmp eax, ebx
  loc_00450F82: fnclex
  loc_00450F84: jge 00450F98h
  loc_00450F86: push 00000204h
  loc_00450F8B: push 0041E5E8h
  loc_00450F90: push esi
  loc_00450F91: push eax
  loc_00450F92: call [00401074h] ; __vbaHresultCheckObj
  loc_00450F98: lea ecx, var_24
  loc_00450F9B: call edi
  loc_00450F9D: mov ecx, 80020004h
  loc_00450FA2: mov eax, 0000000Ah
  loc_00450FA7: mov var_64, ecx
  loc_00450FAA: mov var_54, ecx
  loc_00450FAD: mov var_44, ecx
  loc_00450FB0: lea edx, var_7C
  loc_00450FB3: lea ecx, var_3C
  loc_00450FB6: mov var_6C, eax
  loc_00450FB9: mov var_5C, eax
  loc_00450FBC: mov var_4C, eax
  loc_00450FBF: mov var_74, 0041EB30h ; "AgentName Not Found!"
  loc_00450FC6: mov var_7C, 00000008h
  loc_00450FCD: call [00401240h] ; __vbaVarDup
  loc_00450FD3: lea ecx, var_6C
  loc_00450FD6: lea edx, var_5C
  loc_00450FD9: push ecx
  loc_00450FDA: lea eax, var_4C
  loc_00450FDD: push edx
  loc_00450FDE: push eax
  loc_00450FDF: lea ecx, var_3C
  loc_00450FE2: push 00000010h
  loc_00450FE4: push ecx
  loc_00450FE5: call [004010A4h] ; rtcMsgBox
  loc_00450FEB: lea edx, var_6C
  loc_00450FEE: lea eax, var_5C
  loc_00450FF1: push edx
  loc_00450FF2: lea ecx, var_4C
  loc_00450FF5: push eax
  loc_00450FF6: lea edx, var_3C
  loc_00450FF9: push ecx
  loc_00450FFA: push edx
  loc_00450FFB: push 00000004h
  loc_00450FFD: call [00401038h] ; __vbaFreeVarList
  loc_00451003: add esp, 00000014h
  loc_00451006: mov eax, var_18
  loc_00451009: push eax
  loc_0045100A: mov ecx, [eax]
  loc_0045100C: call [ecx+000000C4h]
  loc_00451012: cmp eax, ebx
  loc_00451014: fnclex
  loc_00451016: jge 0045102Dh
  loc_00451018: mov edx, var_18
  loc_0045101B: push 000000C4h
  loc_00451020: push 0041E938h
  loc_00451025: push edx
  loc_00451026: push eax
  loc_00451027: call [00401074h] ; __vbaHresultCheckObj
  loc_0045102D: push 0041E938h
  loc_00451032: push ebx
  loc_00451033: call [00401274h] ; __vbaCastObj
  loc_00451039: push eax
  loc_0045103A: lea eax, var_18
  loc_0045103D: push eax
  loc_0045103E: call [004010A0h] ; __vbaObjSet
  loc_00451044: mov var_4, ebx
  loc_00451047: push 00451098h
  loc_0045104C: jmp 0045108Eh
  loc_0045104E: lea ecx, var_20
  loc_00451051: lea edx, var_1C
  loc_00451054: push ecx
  loc_00451055: push edx
  loc_00451056: push 00000002h
  loc_00451058: call [004011FCh] ; __vbaFreeStrList
  loc_0045105E: lea eax, var_2C
  loc_00451061: lea ecx, var_28
  loc_00451064: push eax
  loc_00451065: lea edx, var_24
  loc_00451068: push ecx
  loc_00451069: push edx
  loc_0045106A: push 00000003h
  loc_0045106C: call [00401040h] ; __vbaFreeObjList
  loc_00451072: lea eax, var_6C
  loc_00451075: lea ecx, var_5C
  loc_00451078: push eax
  loc_00451079: lea edx, var_4C
  loc_0045107C: push ecx
  loc_0045107D: lea eax, var_3C
  loc_00451080: push edx
  loc_00451081: push eax
  loc_00451082: push 00000004h
  loc_00451084: call [00401038h] ; __vbaFreeVarList
  loc_0045108A: add esp, 00000030h
  loc_0045108D: ret
  loc_0045108E: lea ecx, var_18
  loc_00451091: call [004012B0h] ; __vbaFreeObj
  loc_00451097: ret
  loc_00451098: mov eax, Me
  loc_0045109B: push eax
  loc_0045109C: mov ecx, [eax]
  loc_0045109E: call [ecx+00000008h]
  loc_004510A1: mov eax, var_4
  loc_004510A4: mov ecx, var_14
  loc_004510A7: pop edi
  loc_004510A8: pop esi
  loc_004510A9: mov fs:[00000000h], ecx
  loc_004510B0: pop ebx
  loc_004510B1: mov esp, ebp
  loc_004510B3: pop ebp
  loc_004510B4: retn 0004h
End Sub

Private Sub cmdSearch_Click() '44FDE0
  loc_0044FDE0: push ebp
  loc_0044FDE1: mov ebp, esp
  loc_0044FDE3: sub esp, 0000000Ch
  loc_0044FDE6: push 00403B36h ; __vbaExceptHandler
  loc_0044FDEB: mov eax, fs:[00000000h]
  loc_0044FDF1: push eax
  loc_0044FDF2: mov fs:[00000000h], esp
  loc_0044FDF9: sub esp, 00000008h
  loc_0044FDFC: push ebx
  loc_0044FDFD: push esi
  loc_0044FDFE: push edi
  loc_0044FDFF: mov var_C, esp
  loc_0044FE02: mov var_8, 00401318h
  loc_0044FE09: mov esi, Me
  loc_0044FE0C: mov eax, esi
  loc_0044FE0E: and eax, 00000001h
  loc_0044FE11: mov var_4, eax
  loc_0044FE14: and esi, FFFFFFFEh
  loc_0044FE17: push esi
  loc_0044FE18: mov Me, esi
  loc_0044FE1B: mov ecx, [esi]
  loc_0044FE1D: call [ecx+00000004h]
  loc_0044FE20: mov edx, [esi]
  loc_0044FE22: push esi
  loc_0044FE23: call [edx+00000704h]
  loc_0044FE29: mov var_4, 00000000h
  loc_0044FE30: mov eax, Me
  loc_0044FE33: push eax
  loc_0044FE34: mov ecx, [eax]
  loc_0044FE36: call [ecx+00000008h]
  loc_0044FE39: mov eax, var_4
  loc_0044FE3C: mov ecx, var_14
  loc_0044FE3F: pop edi
  loc_0044FE40: pop esi
  loc_0044FE41: mov fs:[00000000h], ecx
  loc_0044FE48: pop ebx
  loc_0044FE49: mov esp, ebp
  loc_0044FE4B: pop ebp
  loc_0044FE4C: retn 0004h
End Sub

Private Sub cmdClose_Click() '44EC00
  loc_0044EC00: push ebp
  loc_0044EC01: mov ebp, esp
  loc_0044EC03: sub esp, 0000000Ch
  loc_0044EC06: push 00403B36h ; __vbaExceptHandler
  loc_0044EC0B: mov eax, fs:[00000000h]
  loc_0044EC11: push eax
  loc_0044EC12: mov fs:[00000000h], esp
  loc_0044EC19: sub esp, 00000018h
  loc_0044EC1C: push ebx
  loc_0044EC1D: push esi
  loc_0044EC1E: push edi
  loc_0044EC1F: mov var_C, esp
  loc_0044EC22: mov var_8, 004012E0h
  loc_0044EC29: mov edi, Me
  loc_0044EC2C: mov eax, edi
  loc_0044EC2E: and eax, 00000001h
  loc_0044EC31: mov var_4, eax
  loc_0044EC34: and edi, FFFFFFFEh
  loc_0044EC37: push edi
  loc_0044EC38: mov Me, edi
  loc_0044EC3B: mov ecx, [edi]
  loc_0044EC3D: call [ecx+00000004h]
  loc_0044EC40: mov eax, [0061B394h]
  loc_0044EC45: xor ebx, ebx
  loc_0044EC47: cmp eax, ebx
  loc_0044EC49: mov var_18, ebx
  loc_0044EC4C: jnz 0044EC5Eh
  loc_0044EC4E: push 0061B394h
  loc_0044EC53: push 0041E4A0h
  loc_0044EC58: call [004011DCh] ; __vbaNew2
  loc_0044EC5E: mov esi, [0061B394h]
  loc_0044EC64: lea eax, var_18
  loc_0044EC67: push edi
  loc_0044EC68: push eax
  loc_0044EC69: mov edx, [esi]
  loc_0044EC6B: mov var_2C, edx
  loc_0044EC6E: call [004010B8h] ; __vbaObjSetAddref
  loc_0044EC74: mov ecx, var_2C
  loc_0044EC77: push eax
  loc_0044EC78: push esi
  loc_0044EC79: call [ecx+00000010h]
  loc_0044EC7C: cmp eax, ebx
  loc_0044EC7E: fnclex
  loc_0044EC80: jge 0044EC91h
  loc_0044EC82: push 00000010h
  loc_0044EC84: push 0041E490h
  loc_0044EC89: push esi
  loc_0044EC8A: push eax
  loc_0044EC8B: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EC91: lea ecx, var_18
  loc_0044EC94: call [004012B0h] ; __vbaFreeObj
  loc_0044EC9A: mov var_4, ebx
  loc_0044EC9D: push 0044ECAFh
  loc_0044ECA2: jmp 0044ECAEh
  loc_0044ECA4: lea ecx, var_18
  loc_0044ECA7: call [004012B0h] ; __vbaFreeObj
  loc_0044ECAD: ret
  loc_0044ECAE: ret
  loc_0044ECAF: mov eax, Me
  loc_0044ECB2: push eax
  loc_0044ECB3: mov edx, [eax]
  loc_0044ECB5: call [edx+00000008h]
  loc_0044ECB8: mov eax, var_4
  loc_0044ECBB: mov ecx, var_14
  loc_0044ECBE: pop edi
  loc_0044ECBF: pop esi
  loc_0044ECC0: mov fs:[00000000h], ecx
  loc_0044ECC7: pop ebx
  loc_0044ECC8: mov esp, ebp
  loc_0044ECCA: pop ebp
  loc_0044ECCB: retn 0004h
End Sub

Private Sub cmdSave_Click() '44FD70
  loc_0044FD70: push ebp
  loc_0044FD71: mov ebp, esp
  loc_0044FD73: sub esp, 0000000Ch
  loc_0044FD76: push 00403B36h ; __vbaExceptHandler
  loc_0044FD7B: mov eax, fs:[00000000h]
  loc_0044FD81: push eax
  loc_0044FD82: mov fs:[00000000h], esp
  loc_0044FD89: sub esp, 00000008h
  loc_0044FD8C: push ebx
  loc_0044FD8D: push esi
  loc_0044FD8E: push edi
  loc_0044FD8F: mov var_C, esp
  loc_0044FD92: mov var_8, 00401310h
  loc_0044FD99: mov esi, Me
  loc_0044FD9C: mov eax, esi
  loc_0044FD9E: and eax, 00000001h
  loc_0044FDA1: mov var_4, eax
  loc_0044FDA4: and esi, FFFFFFFEh
  loc_0044FDA7: push esi
  loc_0044FDA8: mov Me, esi
  loc_0044FDAB: mov ecx, [esi]
  loc_0044FDAD: call [ecx+00000004h]
  loc_0044FDB0: mov edx, [esi]
  loc_0044FDB2: push esi
  loc_0044FDB3: call [edx+00000730h]
  loc_0044FDB9: mov var_4, 00000000h
  loc_0044FDC0: mov eax, Me
  loc_0044FDC3: push eax
  loc_0044FDC4: mov ecx, [eax]
  loc_0044FDC6: call [ecx+00000008h]
  loc_0044FDC9: mov eax, var_4
  loc_0044FDCC: mov ecx, var_14
  loc_0044FDCF: pop edi
  loc_0044FDD0: pop esi
  loc_0044FDD1: mov fs:[00000000h], ecx
  loc_0044FDD8: pop ebx
  loc_0044FDD9: mov esp, ebp
  loc_0044FDDB: pop ebp
  loc_0044FDDC: retn 0004h
End Sub

Private Sub cmdCustomer_Click() '44ECD0
  loc_0044ECD0: push ebp
  loc_0044ECD1: mov ebp, esp
  loc_0044ECD3: sub esp, 0000000Ch
  loc_0044ECD6: push 00403B36h ; __vbaExceptHandler
  loc_0044ECDB: mov eax, fs:[00000000h]
  loc_0044ECE1: push eax
  loc_0044ECE2: mov fs:[00000000h], esp
  loc_0044ECE9: sub esp, 00000058h
  loc_0044ECEC: push ebx
  loc_0044ECED: push esi
  loc_0044ECEE: push edi
  loc_0044ECEF: mov var_C, esp
  loc_0044ECF2: mov var_8, 004012F0h
  loc_0044ECF9: mov eax, Me
  loc_0044ECFC: mov ecx, eax
  loc_0044ECFE: and ecx, 00000001h
  loc_0044ED01: mov var_4, ecx
  loc_0044ED04: and al, FEh
  loc_0044ED06: push eax
  loc_0044ED07: mov Me, eax
  loc_0044ED0A: mov edx, [eax]
  loc_0044ED0C: call [edx+00000004h]
  loc_0044ED0F: xor esi, esi
  loc_0044ED11: mov edx, 0041E5D4h
  loc_0044ED16: mov ecx, 0061A0A0h
  loc_0044ED1B: mov var_18, esi
  loc_0044ED1E: mov var_1C, esi
  loc_0044ED21: mov var_2C, esi
  loc_0044ED24: mov var_3C, esi
  loc_0044ED27: mov var_4C, esi
  loc_0044ED2A: mov var_5C, esi
  loc_0044ED2D: call [004011ECh] ; __vbaStrCopy
  loc_0044ED33: cmp [0061A11Ch], esi
  loc_0044ED39: jnz 0044ED4Bh
  loc_0044ED3B: push 0061A11Ch
  loc_0044ED40: push 004069CCh
  loc_0044ED45: call [004011DCh] ; __vbaNew2
  loc_0044ED4B: sub esp, 00000010h
  loc_0044ED4E: mov ecx, 0000000Ah
  loc_0044ED53: mov ebx, esp
  loc_0044ED55: mov var_5C, ecx
  loc_0044ED58: mov eax, 80020004h
  loc_0044ED5D: sub esp, 00000010h
  loc_0044ED60: mov [ebx], ecx
  loc_0044ED62: mov ecx, var_58
  loc_0044ED65: mov var_54, eax
  loc_0044ED68: mov esi, [0061A11Ch]
  loc_0044ED6E: mov [ebx+00000004h], ecx
  loc_0044ED71: mov var_4C, 00000002h
  loc_0044ED78: mov ecx, esp
  loc_0044ED7A: mov edx, 00000001h
  loc_0044ED7F: mov [ebx+00000008h], eax
  loc_0044ED82: mov eax, var_50
  loc_0044ED85: mov var_44, edx
  loc_0044ED88: mov edi, [esi]
  loc_0044ED8A: mov [ebx+0000000Ch], eax
  loc_0044ED8D: mov eax, var_4C
  loc_0044ED90: mov [ecx], eax
  loc_0044ED92: mov eax, var_48
  loc_0044ED95: push esi
  loc_0044ED96: mov [ecx+00000004h], eax
  loc_0044ED99: mov [ecx+00000008h], edx
  loc_0044ED9C: mov edx, var_40
  loc_0044ED9F: mov [ecx+0000000Ch], edx
  loc_0044EDA2: call [edi+000002B0h]
  loc_0044EDA8: test eax, eax
  loc_0044EDAA: fnclex
  loc_0044EDAC: jge 0044EDC0h
  loc_0044EDAE: push 000002B0h
  loc_0044EDB3: push 0041E6D0h
  loc_0044EDB8: push esi
  loc_0044EDB9: push eax
  loc_0044EDBA: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EDC0: mov edi, [004010D4h] ; rtcTrimVar
  loc_0044EDC6: lea eax, var_4C
  loc_0044EDC9: lea ecx, var_2C
  loc_0044EDCC: mov ebx, 00004008h
  loc_0044EDD1: push eax
  loc_0044EDD2: push ecx
  loc_0044EDD3: mov var_44, 0061A0B8h
  loc_0044EDDA: mov var_4C, ebx
  loc_0044EDDD: call edi
  loc_0044EDDF: lea edx, var_2C
  loc_0044EDE2: lea eax, var_5C
  loc_0044EDE5: push edx
  loc_0044EDE6: push eax
  loc_0044EDE7: mov var_54, 0041E5D4h
  loc_0044EDEE: mov var_5C, 00008008h
  loc_0044EDF5: call [00401218h] ; __vbaVarTstNe
  loc_0044EDFB: lea ecx, var_2C
  loc_0044EDFE: mov si, ax
  loc_0044EE01: call [00401020h] ; __vbaFreeVar
  loc_0044EE07: test si, si
  loc_0044EE0A: jz 0044EE84h
  loc_0044EE0C: mov eax, Me
  loc_0044EE0F: push eax
  loc_0044EE10: mov ecx, [eax]
  loc_0044EE12: call [ecx+00000310h]
  loc_0044EE18: lea edx, var_1C
  loc_0044EE1B: push eax
  loc_0044EE1C: push edx
  loc_0044EE1D: call [004010A0h] ; __vbaObjSet
  loc_0044EE23: mov esi, eax
  loc_0044EE25: lea eax, var_4C
  loc_0044EE28: lea ecx, var_2C
  loc_0044EE2B: push eax
  loc_0044EE2C: push ecx
  loc_0044EE2D: mov var_44, 0061A0B8h
  loc_0044EE34: mov var_4C, ebx
  loc_0044EE37: call edi
  loc_0044EE39: mov edi, [esi]
  loc_0044EE3B: lea edx, var_2C
  loc_0044EE3E: lea eax, var_18
  loc_0044EE41: push edx
  loc_0044EE42: push eax
  loc_0044EE43: call [004011B0h] ; __vbaStrVarVal
  loc_0044EE49: push eax
  loc_0044EE4A: push esi
  loc_0044EE4B: call [edi+000000A4h]
  loc_0044EE51: test eax, eax
  loc_0044EE53: fnclex
  loc_0044EE55: jge 0044EE69h
  loc_0044EE57: push 000000A4h
  loc_0044EE5C: push 0041E5E8h
  loc_0044EE61: push esi
  loc_0044EE62: push eax
  loc_0044EE63: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EE69: lea ecx, var_18
  loc_0044EE6C: call [004012ACh] ; __vbaFreeStr
  loc_0044EE72: lea ecx, var_1C
  loc_0044EE75: call [004012B0h] ; __vbaFreeObj
  loc_0044EE7B: lea ecx, var_2C
  loc_0044EE7E: call [00401020h] ; __vbaFreeVar
  loc_0044EE84: mov var_4, 00000000h
  loc_0044EE8B: push 0044EEB9h
  loc_0044EE90: jmp 0044EEB8h
  loc_0044EE92: lea ecx, var_18
  loc_0044EE95: call [004012ACh] ; __vbaFreeStr
  loc_0044EE9B: lea ecx, var_1C
  loc_0044EE9E: call [004012B0h] ; __vbaFreeObj
  loc_0044EEA4: lea ecx, var_3C
  loc_0044EEA7: lea edx, var_2C
  loc_0044EEAA: push ecx
  loc_0044EEAB: push edx
  loc_0044EEAC: push 00000002h
  loc_0044EEAE: call [00401038h] ; __vbaFreeVarList
  loc_0044EEB4: add esp, 0000000Ch
  loc_0044EEB7: ret
  loc_0044EEB8: ret
  loc_0044EEB9: mov eax, Me
  loc_0044EEBC: push eax
  loc_0044EEBD: mov ecx, [eax]
  loc_0044EEBF: call [ecx+00000008h]
  loc_0044EEC2: mov eax, var_4
  loc_0044EEC5: mov ecx, var_14
  loc_0044EEC8: pop edi
  loc_0044EEC9: pop esi
  loc_0044EECA: mov fs:[00000000h], ecx
  loc_0044EED1: pop ebx
  loc_0044EED2: mov esp, ebp
  loc_0044EED4: pop ebp
  loc_0044EED5: retn 0004h
End Sub

Private Sub Proc_1_10_44EA90() '44EA90
  loc_0044EA90: push ebp
  loc_0044EA91: mov ebp, esp
  loc_0044EA93: sub esp, 00000008h
  loc_0044EA96: push 00403B36h ; __vbaExceptHandler
  loc_0044EA9B: mov eax, fs:[00000000h]
  loc_0044EAA1: push eax
  loc_0044EAA2: mov fs:[00000000h], esp
  loc_0044EAA9: sub esp, 0000002Ch
  loc_0044EAAC: push ebx
  loc_0044EAAD: push esi
  loc_0044EAAE: push edi
  loc_0044EAAF: mov var_8, esp
  loc_0044EAB2: mov var_4, 004012D0h
  loc_0044EAB9: mov ebx, Me
  loc_0044EABC: xor edi, edi
  loc_0044EABE: mov var_18, edi
  loc_0044EAC1: mov var_1C, edi
  loc_0044EAC4: mov var_20, edi
  loc_0044EAC7: mov eax, 00000063h
  loc_0044EACC: cmp di, ax
  loc_0044EACF: jg 0044EB5Eh
  loc_0044EAD5: mov eax, [ebx]
  loc_0044EAD7: push ebx
  loc_0044EAD8: call [eax+00000318h]
  loc_0044EADE: lea ecx, var_1C
  loc_0044EAE1: push eax
  loc_0044EAE2: push ecx
  loc_0044EAE3: call [004010A0h] ; __vbaObjSet
  loc_0044EAE9: mov esi, eax
  loc_0044EAEB: lea eax, var_20
  loc_0044EAEE: push eax
  loc_0044EAEF: push edi
  loc_0044EAF0: mov edx, [esi]
  loc_0044EAF2: push esi
  loc_0044EAF3: call [edx+00000040h]
  loc_0044EAF6: test eax, eax
  loc_0044EAF8: fnclex
  loc_0044EAFA: jge 0044EB0Bh
  loc_0044EAFC: push 00000040h
  loc_0044EAFE: push 0041E5D8h
  loc_0044EB03: push esi
  loc_0044EB04: push eax
  loc_0044EB05: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EB0B: mov eax, var_20
  loc_0044EB0E: push 0041E5D4h
  loc_0044EB13: push eax
  loc_0044EB14: mov esi, eax
  loc_0044EB16: mov ecx, [eax]
  loc_0044EB18: call [ecx+000000A4h]
  loc_0044EB1E: test eax, eax
  loc_0044EB20: fnclex
  loc_0044EB22: jge 0044EB36h
  loc_0044EB24: push 000000A4h
  loc_0044EB29: push 0041E5E8h
  loc_0044EB2E: push esi
  loc_0044EB2F: push eax
  loc_0044EB30: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EB36: lea edx, var_20
  loc_0044EB39: lea eax, var_1C
  loc_0044EB3C: push edx
  loc_0044EB3D: push eax
  loc_0044EB3E: push 00000002h
  loc_0044EB40: call [00401040h] ; __vbaFreeObjList
  loc_0044EB46: mov eax, 00000001h
  loc_0044EB4B: add esp, 0000000Ch
  loc_0044EB4E: add ax, di
  loc_0044EB51: jo 0044EBF5h
  loc_0044EB57: mov edi, eax
  loc_0044EB59: jmp 0044EAC7h
  loc_0044EB5E: mov ecx, [ebx]
  loc_0044EB60: push ebx
  loc_0044EB61: call [ecx+00000308h]
  loc_0044EB67: lea edx, var_1C
  loc_0044EB6A: push eax
  loc_0044EB6B: push edx
  loc_0044EB6C: call [004010A0h] ; __vbaObjSet
  loc_0044EB72: mov esi, eax
  loc_0044EB74: push 00000000h
  loc_0044EB76: mov edi, [esi]
  loc_0044EB78: call [00401008h] ; __vbaStrI2
  loc_0044EB7E: mov edx, eax
  loc_0044EB80: lea ecx, var_18
  loc_0044EB83: call [00401270h] ; __vbaStrMove
  loc_0044EB89: push eax
  loc_0044EB8A: push esi
  loc_0044EB8B: call [edi+000000A4h]
  loc_0044EB91: test eax, eax
  loc_0044EB93: fnclex
  loc_0044EB95: jge 0044EBA9h
  loc_0044EB97: push 000000A4h
  loc_0044EB9C: push 0041E5E8h
  loc_0044EBA1: push esi
  loc_0044EBA2: push eax
  loc_0044EBA3: call [00401074h] ; __vbaHresultCheckObj
  loc_0044EBA9: lea ecx, var_18
  loc_0044EBAC: call [004012ACh] ; __vbaFreeStr
  loc_0044EBB2: lea ecx, var_1C
  loc_0044EBB5: call [004012B0h] ; __vbaFreeObj
  loc_0044EBBB: push 0044EBE0h
  loc_0044EBC0: jmp 0044EBDFh
  loc_0044EBC2: lea ecx, var_18
  loc_0044EBC5: call [004012ACh] ; __vbaFreeStr
  loc_0044EBCB: lea eax, var_20
  loc_0044EBCE: lea ecx, var_1C
  loc_0044EBD1: push eax
  loc_0044EBD2: push ecx
  loc_0044EBD3: push 00000002h
  loc_0044EBD5: call [00401040h] ; __vbaFreeObjList
  loc_0044EBDB: add esp, 0000000Ch
  loc_0044EBDE: ret
  loc_0044EBDF: ret
  loc_0044EBE0: mov ecx, var_10
  loc_0044EBE3: pop edi
  loc_0044EBE4: pop esi
  loc_0044EBE5: xor eax, eax
  loc_0044EBE7: mov fs:[00000000h], ecx
  loc_0044EBEE: pop ebx
  loc_0044EBEF: mov esp, ebp
  loc_0044EBF1: pop ebp
  loc_0044EBF2: retn 0004h
End Sub

Private Sub Proc_1_11_44EEE0() '44EEE0
  loc_0044EEE0: push ebp
  loc_0044EEE1: mov ebp, esp
  loc_0044EEE3: sub esp, 00000008h
  loc_0044EEE6: push 00403B36h ; __vbaExceptHandler
  loc_0044EEEB: mov eax, fs:[00000000h]
  loc_0044EEF1: push eax
  loc_0044EEF2: mov fs:[00000000h], esp
  loc_0044EEF9: sub esp, 000001B4h
  loc_0044EEFF: push ebx
  loc_0044EF00: push esi
  loc_0044EF01: push edi
  loc_0044EF02: mov var_8, esp
  loc_0044EF05: mov var_4, 00401300h
  loc_0044EF0C: mov ecx, 0000000Ah
  loc_0044EF11: xor esi, esi
  loc_0044EF13: mov eax, 80020004h
  loc_0044EF18: mov var_A8, ecx
  loc_0044EF1E: mov var_98, ecx
  loc_0044EF24: mov var_88, ecx
  loc_0044EF2A: mov var_78, ecx
  loc_0044EF2D: mov var_68, ecx
  loc_0044EF30: mov var_58, ecx
  loc_0044EF33: lea edx, var_D8
  loc_0044EF39: lea ecx, var_48
  loc_0044EF3C: mov var_14, esi
  loc_0044EF3F: mov var_18, esi
  loc_0044EF42: mov var_1C, esi
  loc_0044EF45: mov var_20, esi
  loc_0044EF48: mov var_24, esi
  loc_0044EF4B: mov var_28, esi
  loc_0044EF4E: mov var_2C, esi
  loc_0044EF51: mov var_30, esi
  loc_0044EF54: mov var_34, esi
  loc_0044EF57: mov var_38, esi
  loc_0044EF5A: mov var_48, esi
  loc_0044EF5D: mov var_B8, esi
  loc_0044EF63: mov var_C8, esi
  loc_0044EF69: mov var_E8, esi
  loc_0044EF6F: mov var_F8, esi
  loc_0044EF75: mov var_108, esi
  loc_0044EF7B: mov var_118, esi
  loc_0044EF81: mov var_128, esi
  loc_0044EF87: mov var_138, esi
  loc_0044EF8D: mov var_148, esi
  loc_0044EF93: mov var_158, esi
  loc_0044EF99: mov var_168, esi
  loc_0044EF9F: mov var_16C, esi
  loc_0044EFA5: mov var_170, esi
  loc_0044EFAB: mov var_A0, eax
  loc_0044EFB1: mov var_90, eax
  loc_0044EFB7: mov var_80, eax
  loc_0044EFBA: mov var_70, eax
  loc_0044EFBD: mov var_60, eax
  loc_0044EFC0: mov var_50, eax
  loc_0044EFC3: mov var_D0, 0041E7F0h ; "Enter SrNo"
  loc_0044EFCD: mov var_D8, 00000008h
  loc_0044EFD7: call [00401240h] ; __vbaVarDup
  loc_0044EFDD: lea eax, var_A8
  loc_0044EFE3: lea ecx, var_98
  loc_0044EFE9: push eax
  loc_0044EFEA: lea edx, var_88
  loc_0044EFF0: push ecx
  loc_0044EFF1: lea eax, var_78
  loc_0044EFF4: push edx
  loc_0044EFF5: lea ecx, var_68
  loc_0044EFF8: push eax
  loc_0044EFF9: lea edx, var_58
  loc_0044EFFC: push ecx
  loc_0044EFFD: lea eax, var_48
  loc_0044F000: push edx
  loc_0044F001: push eax
  loc_0044F002: call [004010B0h] ; rtcInputBox
  loc_0044F008: mov edx, eax
  loc_0044F00A: lea ecx, var_14
  loc_0044F00D: call [00401270h] ; __vbaStrMove
  loc_0044F013: lea ecx, var_A8
  loc_0044F019: lea edx, var_98
  loc_0044F01F: push ecx
  loc_0044F020: lea eax, var_88
  loc_0044F026: push edx
  loc_0044F027: lea ecx, var_78
  loc_0044F02A: push eax
  loc_0044F02B: lea edx, var_68
  loc_0044F02E: push ecx
  loc_0044F02F: lea eax, var_58
  loc_0044F032: push edx
  loc_0044F033: lea ecx, var_48
  loc_0044F036: push eax
  loc_0044F037: push ecx
  loc_0044F038: push 00000007h
  loc_0044F03A: call [00401038h] ; __vbaFreeVarList
  loc_0044F040: mov ebx, [004010D4h] ; rtcTrimVar
  loc_0044F046: add esp, 00000020h
  loc_0044F049: lea eax, var_D8
  loc_0044F04F: lea ecx, var_48
  loc_0044F052: lea edx, var_14
  loc_0044F055: mov edi, 00004008h
  loc_0044F05A: push eax
  loc_0044F05B: push ecx
  loc_0044F05C: mov var_D0, edx
  loc_0044F062: mov var_D8, edi
  loc_0044F068: call ebx
  loc_0044F06A: lea edx, var_48
  loc_0044F06D: lea eax, var_E8
  loc_0044F073: push edx
  loc_0044F074: push eax
  loc_0044F075: mov var_E0, 0041E5D4h
  loc_0044F07F: mov var_E8, 00008008h
  loc_0044F089: call [00401110h] ; __vbaVarTstEq
  loc_0044F08F: lea ecx, var_48
  loc_0044F092: mov var_174, ax
  loc_0044F099: call [00401020h] ; __vbaFreeVar
  loc_0044F09F: cmp var_174, si
  loc_0044F0A6: jnz 0044FCAEh
  loc_0044F0AC: mov eax, Me
  loc_0044F0AF: push eax
  loc_0044F0B0: mov ecx, [eax]
  loc_0044F0B2: call [ecx+000006F8h]
  loc_0044F0B8: lea eax, var_D8
  loc_0044F0BE: lea ecx, var_48
  loc_0044F0C1: lea edx, var_14
  loc_0044F0C4: push eax
  loc_0044F0C5: push ecx
  loc_0044F0C6: mov var_D0, edx
  loc_0044F0CC: mov var_D8, edi
  loc_0044F0D2: call ebx
  loc_0044F0D4: lea edx, var_108
  loc_0044F0DA: lea eax, var_78
  loc_0044F0DD: push edx
  loc_0044F0DE: push eax
  loc_0044F0DF: mov var_100, 0061A05Ch
  loc_0044F0E9: mov var_108, edi
  loc_0044F0EF: call ebx
  loc_0044F0F1: lea ecx, var_128
  loc_0044F0F7: lea edx, var_A8
  loc_0044F0FD: push ecx
  loc_0044F0FE: push edx
  loc_0044F0FF: mov var_120, 0061A060h
  loc_0044F109: mov var_128, edi
  loc_0044F10F: call ebx
  loc_0044F111: mov esi, 00000008h
  loc_0044F116: mov var_E0, 0041E80Ch ; "Select * From LG Where SrNo="
  loc_0044F120: mov var_E8, esi
  loc_0044F126: mov var_F8, esi
  loc_0044F12C: mov var_118, esi
  loc_0044F132: mov var_138, esi
  loc_0044F138: mov esi, [0061A13Ch]
  loc_0044F13E: mov var_F0, 0041E84Ch ; " AND OnCount='"
  loc_0044F148: mov var_110, 0041E870h ; "' and AMPM='"
  loc_0044F152: mov var_130, 0041E890h ; "'"
  loc_0044F15C: mov ebx, [esi]
  loc_0044F15E: lea esi, var_24
  loc_0044F161: push esi
  loc_0044F162: mov ecx, 0000000Ah
  loc_0044F167: sub esp, 00000010h
  loc_0044F16A: mov var_158, ecx
  loc_0044F170: mov esi, esp
  loc_0044F172: mov eax, 80020004h
  loc_0044F177: mov edx, eax
  loc_0044F179: sub esp, 00000010h
  loc_0044F17C: mov [esi], ecx
  loc_0044F17E: mov ecx, var_164
  loc_0044F184: mov [esi+00000004h], ecx
  loc_0044F187: mov ecx, esp
  loc_0044F189: sub esp, 00000010h
  loc_0044F18C: mov [esi+00000008h], eax
  loc_0044F18F: mov eax, var_15C
  loc_0044F195: mov [esi+0000000Ch], eax
  loc_0044F198: mov eax, var_158
  loc_0044F19E: mov [ecx], eax
  loc_0044F1A0: mov eax, var_154
  loc_0044F1A6: mov esi, [004011B4h] ; __vbaVarCat
  loc_0044F1AC: mov [ecx+00000004h], eax
  loc_0044F1AF: mov eax, 00000003h
  loc_0044F1B4: mov [ecx+00000008h], edx
  loc_0044F1B7: mov edx, var_14C
  loc_0044F1BD: mov [ecx+0000000Ch], edx
  loc_0044F1C0: mov edx, var_144
  loc_0044F1C6: mov ecx, esp
  loc_0044F1C8: mov [ecx], eax
  loc_0044F1CA: mov eax, 00000004h
  loc_0044F1CF: mov [ecx+00000004h], edx
  loc_0044F1D2: lea edx, var_48
  loc_0044F1D5: mov [ecx+00000008h], eax
  loc_0044F1D8: mov eax, var_13C
  loc_0044F1DE: mov [ecx+0000000Ch], eax
  loc_0044F1E1: lea ecx, var_E8
  loc_0044F1E7: push ecx
  loc_0044F1E8: lea eax, var_58
  loc_0044F1EB: push edx
  loc_0044F1EC: push eax
  loc_0044F1ED: call __vbaVarCat
  loc_0044F1EF: lea ecx, var_F8
  loc_0044F1F5: push eax
  loc_0044F1F6: push ecx
  loc_0044F1F7: lea edx, var_68
  loc_0044F1FA: push edx
  loc_0044F1FB: call __vbaVarCat
  loc_0044F1FD: push eax
  loc_0044F1FE: lea eax, var_78
  loc_0044F201: lea ecx, var_88
  loc_0044F207: push eax
  loc_0044F208: push ecx
  loc_0044F209: call __vbaVarCat
  loc_0044F20B: push eax
  loc_0044F20C: lea edx, var_118
  loc_0044F212: lea eax, var_98
  loc_0044F218: push edx
  loc_0044F219: push eax
  loc_0044F21A: call __vbaVarCat
  loc_0044F21C: lea ecx, var_A8
  loc_0044F222: push eax
  loc_0044F223: lea edx, var_B8
  loc_0044F229: push ecx
  loc_0044F22A: push edx
  loc_0044F22B: call __vbaVarCat
  loc_0044F22D: push eax
  loc_0044F22E: lea eax, var_138
  loc_0044F234: lea ecx, var_C8
  loc_0044F23A: push eax
  loc_0044F23B: push ecx
  loc_0044F23C: call __vbaVarCat
  loc_0044F23E: lea edx, var_18
  loc_0044F241: push eax
  loc_0044F242: push edx
  loc_0044F243: call [004011B0h] ; __vbaStrVarVal
  loc_0044F249: push eax
  loc_0044F24A: mov eax, [0061A13Ch]
  loc_0044F24F: push eax
  loc_0044F250: call [ebx+000000BCh]
  loc_0044F256: test eax, eax
  loc_0044F258: fnclex
  loc_0044F25A: jge 0044F274h
  loc_0044F25C: mov ecx, [0061A13Ch]
  loc_0044F262: push 000000BCh
  loc_0044F267: push 0041E928h
  loc_0044F26C: push ecx
  loc_0044F26D: push eax
  loc_0044F26E: call [00401074h] ; __vbaHresultCheckObj
  loc_0044F274: mov edx, Me
  loc_0044F277: mov eax, var_24
  loc_0044F27A: push eax
  loc_0044F27B: lea ebx, [edx+00000034h]
  loc_0044F27E: push ebx
  loc_0044F27F: call [004010B8h] ; __vbaObjSetAddref
  loc_0044F285: lea ecx, var_18
  loc_0044F288: call [004012ACh] ; __vbaFreeStr
  loc_0044F28E: lea ecx, var_24
  loc_0044F291: call [004012B0h] ; __vbaFreeObj
  loc_0044F297: lea ecx, var_C8
  loc_0044F29D: lea edx, var_B8
  loc_0044F2A3: push ecx
  loc_0044F2A4: lea eax, var_A8
  loc_0044F2AA: push edx
  loc_0044F2AB: lea ecx, var_98
  loc_0044F2B1: push eax
  loc_0044F2B2: lea edx, var_88
  loc_0044F2B8: push ecx
  loc_0044F2B9: lea eax, var_78
  loc_0044F2BC: push edx
  loc_0044F2BD: lea ecx, var_68
  loc_0044F2C0: push eax
  loc_0044F2C1: lea edx, var_58
  loc_0044F2C4: push ecx
  loc_0044F2C5: lea eax, var_48
  loc_0044F2C8: push edx
  loc_0044F2C9: push eax
  loc_0044F2CA: push 00000009h
  loc_0044F2CC: call [00401038h] ; __vbaFreeVarList
  loc_0044F2D2: mov eax, [ebx]
  loc_0044F2D4: add esp, 00000028h
  loc_0044F2D7: lea edx, var_16C
  loc_0044F2DD: mov ecx, [eax]
  loc_0044F2DF: push edx
  loc_0044F2E0: push eax
  loc_0044F2E1: call [ecx+00000020h]
  loc_0044F2E4: test eax, eax
  loc_0044F2E6: fnclex
  loc_0044F2E8: jge 0044F2FBh
  loc_0044F2EA: mov ecx, [ebx]
  loc_0044F2EC: push 00000020h
  loc_0044F2EE: push 0041E938h
  loc_0044F2F3: push ecx
  loc_0044F2F4: push eax
  loc_0044F2F5: call [00401074h] ; __vbaHresultCheckObj
  loc_0044F2FB: mov eax, [ebx]
  loc_0044F2FD: lea ecx, var_170
  loc_0044F303: push ecx
  loc_0044F304: push eax
  loc_0044F305: mov edx, [eax]
  loc_0044F307: call [edx+00000034h]
  loc_0044F30A: test eax, eax
  loc_0044F30C: fnclex
  loc_0044F30E: jge 0044F321h
  loc_0044F310: mov edx, [ebx]
  loc_0044F312: push 00000034h
  loc_0044F314: push 0041E938h
  loc_0044F319: push edx
  loc_0044F31A: push eax
  loc_0044F31B: call [00401074h] ; __vbaHresultCheckObj
  loc_0044F321: xor eax, eax
  loc_0044F323: cmp var_170, ax
  loc_0044F32A: setz al
  loc_0044F32D: xor ecx, ecx
  loc_0044F32F: cmp var_16C, cx
  loc_0044F336: setz cl
  loc_0044F339: or eax, ecx
  loc_0044F33B: jz 0044FBF4h
  loc_0044F341: mov eax, [ebx]
  loc_0044F343: push eax
  loc_0044F344: mov edx, [eax]
  loc_0044F346: call [edx+000000C4h]
  loc_0044F34C: test eax, eax
  loc_0044F34E: fnclex
  loc_0044F350: jge 0044F366h
  loc_0044F352: mov ecx, [ebx]
  loc_0044F354: push 000000C4h
  loc_0044F359: push 0041E938h
  loc_0044F35E: push ecx
  loc_0044F35F: push eax
  loc_0044F360: call [00401074h] ; __vbaHresultCheckObj
  loc_0044F366: push 0041E938h
  loc_0044F36B: push 00000000h
  loc_0044F36D: call [00401274h] ; __vbaCastObj
  loc_0044F373: lea edx, var_24
  loc_0044F376: push eax
  loc_0044F377: push edx
  loc_0044F378: call [004010A0h] ; __vbaObjSet
  loc_0044F37E: push eax
  loc_0044F37F: push ebx
  loc_0044F380: call [004010B8h] ; __vbaObjSetAddref
  loc_0044F386: lea ecx, var_24
  loc_0044F389: call [004012B0h] ; __vbaFreeObj
  loc_0044F38F: mov eax, Me
  loc_0044F392: push eax
  loc_0044F393: mov ecx, [eax]
  loc_0044F395: call [ecx+00000300h]
  loc_0044F39B: lea edx, var_24
  loc_0044F39E: push eax
  loc_0044F39F: push edx
  loc_0044F3A0: call [004010A0h] ; __vbaObjSet
  loc_0044F3A6: lea ecx, var_D8
  loc_0044F3AC: mov ebx, eax
  loc_0044F3AE: lea edx, var_48
  loc_0044F3B1: lea eax, var_14
  loc_0044F3B4: push ecx
  loc_0044F3B5: push edx
  loc_0044F3B6: mov var_174, ebx
  loc_0044F3BC: mov var_D0, eax
  loc_0044F3C2: mov var_D8, edi
  loc_0044F3C8: call [004010D4h] ; rtcTrimVar
  loc_0044F3CE: mov ebx, [ebx]
  loc_0044F3D0: lea eax, var_48
  loc_0044F3D3: lea ecx, var_18
  loc_0044F3D6: push eax
  loc_0044F3D7: push ecx
  loc_0044F3D8: call [004011B0h] ; __vbaStrVarVal
  loc_0044F3DE: mov edx, ebx
  loc_0044F3E0: mov ebx, var_174
  loc_0044F3E6: push eax
  loc_0044F3E7: push ebx
  loc_0044F3E8: call [edx+000000A4h]
  loc_0044F3EE: test eax, eax
  loc_0044F3F0: fnclex
  loc_0044F3F2: jge 0044F406h
  loc_0044F3F4: push 000000A4h
  loc_0044F3F9: push 0041E5E8h
  loc_0044F3FE: push ebx
  loc_0044F3FF: push eax
  loc_0044F400: call [00401074h] ; __vbaHresultCheckObj
  loc_0044F406: lea ecx, var_18
  loc_0044F409: call [004012ACh] ; __vbaFreeStr
  loc_0044F40F: lea ecx, var_24
  loc_0044F412: call [004012B0h] ; __vbaFreeObj
  loc_0044F418: lea ecx, var_48
  loc_0044F41B: call [00401020h] ; __vbaFreeVar
  loc_0044F421: mov ebx, [004010D4h] ; rtcTrimVar
  loc_0044F427: lea ecx, var_D8
  loc_0044F42D: lea edx, var_48
  loc_0044F430: lea eax, var_14
  loc_0044F433: push ecx
  loc_0044F434: push edx
  loc_0044F435: mov var_D0, eax
  loc_0044F43B: mov var_D8, edi
  loc_0044F441: call ebx
  loc_0044F443: lea eax, var_108
  loc_0044F449: lea ecx, var_78
  loc_0044F44C: push eax
  loc_0044F44D: push ecx
  loc_0044F44E: mov var_100, 0061A05Ch
  loc_0044F458: mov var_108, edi
  loc_0044F45E: call ebx
  loc_0044F460: lea edx, var_128
  loc_0044F466: lea eax, var_A8
  loc_0044F46C: push edx
  loc_0044F46D: push eax
  loc_0044F46E: mov var_120, 0061A060h
  loc_0044F478: mov var_128, edi
  loc_0044F47E: call ebx
  loc_0044F480: lea ebx, var_24
  loc_0044F483: mov ecx, 0000000Ah
  loc_0044F488: push ebx
  loc_0044F489: mov var_158, ecx
  loc_0044F48F: sub esp, 00000010h
  loc_0044F492: mov eax, 80020004h
  loc_0044F497: mov ebx, esp
  loc_0044F499: mov edx, eax
  loc_0044F49B: sub esp, 00000010h
  loc_0044F49E: mov edi, 00000008h
  loc_0044F4A3: mov [ebx], ecx
  loc_0044F4A5: mov ecx, var_164
  loc_0044F4AB: mov var_E8, edi
  loc_0044F4B1: mov var_F8, edi
  loc_0044F4B7: mov [ebx+00000004h], ecx
  loc_0044F4BA: mov ecx, esp
  loc_0044F4BC: sub esp, 00000010h
  loc_0044F4BF: mov var_118, edi
  loc_0044F4C5: mov [ebx+00000008h], eax
  loc_0044F4C8: mov eax, var_15C
  loc_0044F4CE: mov var_138, edi
  loc_0044F4D4: mov edi, [0061A13Ch]
  loc_0044F4DA: mov [ebx+0000000Ch], eax
  loc_0044F4DD: mov eax, var_158
  loc_0044F4E3: mov [ecx], eax
  loc_0044F4E5: mov eax, var_154
  loc_0044F4EB: mov var_E0, 0041E970h ; "Select Agentname as Name,Num1,Value as TAmount From LGDetail Where SrNo="
  loc_0044F4F5: mov var_F0, 0041E84Ch ; " AND OnCount='"
  loc_0044F4FF: mov [ecx+00000004h], eax
  loc_0044F502: mov eax, 00000003h
  loc_0044F507: mov var_110, 0041E870h ; "' and AMPM='"
  loc_0044F511: mov var_130, 0041E890h ; "'"
  loc_0044F51B: mov [ecx+00000008h], edx
  loc_0044F51E: mov edx, var_14C
  loc_0044F524: mov edi, [edi]
  loc_0044F526: mov [ecx+0000000Ch], edx
  loc_0044F529: mov edx, var_144
  loc_0044F52F: mov ecx, esp
  loc_0044F531: mov [ecx], eax
  loc_0044F533: mov eax, 00000004h
  loc_0044F538: mov [ecx+00000004h], edx
  loc_0044F53B: lea edx, var_48
  loc_0044F53E: mov [ecx+00000008h], eax
  loc_0044F541: mov eax, var_13C
  loc_0044F547: mov [ecx+0000000Ch], eax
  loc_0044F54A: lea ecx, var_E8
  loc_0044F550: push ecx
  loc_0044F551: lea eax, var_58
  loc_0044F554: push edx
  loc_0044F555: push eax
  loc_0044F556: call __vbaVarCat
  loc_0044F558: push eax
  loc_0044F559: lea ecx, var_F8
  loc_0044F55F: lea edx, var_68
  loc_0044F562: push ecx
  loc_0044F563: push edx
  loc_0044F564: call __vbaVarCat
  loc_0044F566: push eax
  loc_0044F567: lea eax, var_78
  loc_0044F56A: lea ecx, var_88
  loc_0044F570: push eax
  loc_0044F571: push ecx
  loc_0044F572: call __vbaVarCat
  loc_0044F574: push eax
  loc_0044F575: lea edx, var_118
  loc_0044F57B: lea eax, var_98
  loc_0044F581: push edx
  loc_0044F582: push eax
  loc_0044F583: call __vbaVarCat
  loc_0044F585: lea ecx, var_A8
  loc_0044F58B: push eax
  loc_0044F58C: lea edx, var_B8
  loc_0044F592: push ecx
  loc_0044F593: push edx
  loc_0044F594: call __vbaVarCat
  loc_0044F596: push eax
  loc_0044F597: lea eax, var_138
  loc_0044F59D: lea ecx, var_C8
  loc_0044F5A3: push eax
  loc_0044F5A4: push ecx
  loc_0044F5A5: call __vbaVarCat
  loc_0044F5A7: lea edx, var_18
  loc_0044F5AA: push eax
  loc_0044F5AB: push edx
  loc_0044F5AC: call [004011B0h] ; __vbaStrVarVal
  loc_0044F5B2: push eax
  loc_0044F5B3: mov eax, [0061A13Ch]
  loc_0044F5B8: push eax
  loc_0044F5B9: call [edi+000000BCh]
  loc_0044F5BF: test eax, eax
  loc_0044F5C1: fnclex
  loc_0044F5C3: jge 0044F5E1h
  loc_0044F5C5: mov ecx, [0061A13Ch]
  loc_0044F5CB: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0044F5D1: push 000000BCh
  loc_0044F5D6: push 0041E928h
  loc_0044F5DB: push ecx
  loc_0044F5DC: push eax
  loc_0044F5DD: call edi
  loc_0044F5DF: jmp 0044F5E7h
  loc_0044F5E1: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0044F5E7: mov eax, Me
  loc_0044F5EA: mov edx, var_24
  loc_0044F5ED: push edx
  loc_0044F5EE: lea ebx, [eax+00000034h]
  loc_0044F5F1: push ebx
  loc_0044F5F2: call [004010B8h] ; __vbaObjSetAddref
  loc_0044F5F8: lea ecx, var_18
  loc_0044F5FB: call [004012ACh] ; __vbaFreeStr
  loc_0044F601: lea ecx, var_24
  loc_0044F604: call [004012B0h] ; __vbaFreeObj
  loc_0044F60A: lea ecx, var_C8
  loc_0044F610: lea edx, var_B8
  loc_0044F616: push ecx
  loc_0044F617: lea eax, var_A8
  loc_0044F61D: push edx
  loc_0044F61E: lea ecx, var_98
  loc_0044F624: push eax
  loc_0044F625: lea edx, var_88
  loc_0044F62B: push ecx
  loc_0044F62C: lea eax, var_78
  loc_0044F62F: push edx
  loc_0044F630: lea ecx, var_68
  loc_0044F633: push eax
  loc_0044F634: lea edx, var_58
  loc_0044F637: push ecx
  loc_0044F638: lea eax, var_48
  loc_0044F63B: push edx
  loc_0044F63C: push eax
  loc_0044F63D: push 00000009h
  loc_0044F63F: call [00401038h] ; __vbaFreeVarList
  loc_0044F645: add esp, 00000028h
  loc_0044F648: mov eax, [ebx]
  loc_0044F64A: lea edx, var_16C
  loc_0044F650: push edx
  loc_0044F651: push eax
  loc_0044F652: mov ecx, [eax]
  loc_0044F654: call [ecx+00000034h]
  loc_0044F657: test eax, eax
  loc_0044F659: fnclex
  loc_0044F65B: jge 0044F66Ah
  loc_0044F65D: mov ecx, [ebx]
  loc_0044F65F: push 00000034h
  loc_0044F661: push 0041E938h
  loc_0044F666: push ecx
  loc_0044F667: push eax
  loc_0044F668: call edi
  loc_0044F66A: cmp var_16C, 0000h
  loc_0044F672: jnz 0044FB9Fh
  loc_0044F678: mov eax, Me
  loc_0044F67B: push eax
  loc_0044F67C: mov edx, [eax]
  loc_0044F67E: call [edx+00000310h]
  loc_0044F684: push eax
  loc_0044F685: lea eax, var_2C
  loc_0044F688: push eax
  loc_0044F689: call [004010A0h] ; __vbaObjSet
  loc_0044F68F: mov esi, eax
  loc_0044F691: mov eax, [ebx]
  loc_0044F693: lea edx, var_24
  loc_0044F696: mov ecx, [eax]
  loc_0044F698: push edx
  loc_0044F699: push eax
  loc_0044F69A: call [ecx+000000B4h]
  loc_0044F6A0: test eax, eax
  loc_0044F6A2: fnclex
  loc_0044F6A4: jge 0044F6B6h
  loc_0044F6A6: mov ecx, [ebx]
  loc_0044F6A8: push 000000B4h
  loc_0044F6AD: push 0041E938h
  loc_0044F6B2: push ecx
  loc_0044F6B3: push eax
  loc_0044F6B4: call edi
  loc_0044F6B6: lea ebx, var_28
  loc_0044F6B9: mov eax, var_24
  loc_0044F6BC: push ebx
  loc_0044F6BD: mov ecx, 00000008h
  loc_0044F6C2: sub esp, 00000010h
  loc_0044F6C5: mov var_D8, ecx
  loc_0044F6CB: mov ebx, esp
  loc_0044F6CD: mov var_D0, 0041EA08h ; "Name"
  loc_0044F6D7: mov edx, [eax]
  loc_0044F6D9: push eax
  loc_0044F6DA: mov [ebx], ecx
  loc_0044F6DC: mov ecx, var_D4
  loc_0044F6E2: mov var_178, eax
  loc_0044F6E8: mov [ebx+00000004h], ecx
  loc_0044F6EB: mov ecx, var_D0
  loc_0044F6F1: mov [ebx+00000008h], ecx
  loc_0044F6F4: mov ecx, var_CC
  loc_0044F6FA: mov [ebx+0000000Ch], ecx
  loc_0044F6FD: call [edx+00000030h]
  loc_0044F700: test eax, eax
  loc_0044F702: fnclex
  loc_0044F704: jge 0044F717h
  loc_0044F706: mov edx, var_178
  loc_0044F70C: push 00000030h
  loc_0044F70E: push 0041EA14h ; "S"
  loc_0044F713: push edx
  loc_0044F714: push eax
  loc_0044F715: call edi
  loc_0044F717: mov eax, var_28
  loc_0044F71A: lea ecx, var_58
  loc_0044F71D: mov var_40, eax
  loc_0044F720: lea eax, var_48
  loc_0044F723: push eax
  loc_0044F724: push ecx
  loc_0044F725: mov var_28, 00000000h
  loc_0044F72C: mov var_48, 00000009h
  loc_0044F733: call [004010D4h] ; rtcTrimVar
  loc_0044F739: mov ebx, [esi]
  loc_0044F73B: lea edx, var_58
  loc_0044F73E: lea eax, var_18
  loc_0044F741: push edx
  loc_0044F742: push eax
  loc_0044F743: call [004011B0h] ; __vbaStrVarVal
  loc_0044F749: push eax
  loc_0044F74A: push esi
  loc_0044F74B: call [ebx+000000A4h]
  loc_0044F751: test eax, eax
  loc_0044F753: fnclex
  loc_0044F755: jge 0044F765h
  loc_0044F757: push 000000A4h
  loc_0044F75C: push 0041E5E8h
  loc_0044F761: push esi
  loc_0044F762: push eax
  loc_0044F763: call edi
  loc_0044F765: lea ecx, var_18
  loc_0044F768: call [004012ACh] ; __vbaFreeStr
  loc_0044F76E: lea ecx, var_2C
  loc_0044F771: lea edx, var_24
  loc_0044F774: push ecx
  loc_0044F775: push edx
  loc_0044F776: push 00000002h
  loc_0044F778: call [00401040h] ; __vbaFreeObjList
  loc_0044F77E: lea eax, var_58
  loc_0044F781: lea ecx, var_48
  loc_0044F784: push eax
  loc_0044F785: push ecx
  loc_0044F786: push 00000002h
  loc_0044F788: call [00401038h] ; __vbaFreeVarList
  loc_0044F78E: mov ebx, Me
  loc_0044F791: add esp, 00000018h
  loc_0044F794: mov edx, [ebx]
  loc_0044F796: push ebx
  loc_0044F797: call [edx+00000318h]
  loc_0044F79D: push eax
  loc_0044F79E: lea eax, var_34
  loc_0044F7A1: push eax
  loc_0044F7A2: call [004010A0h] ; __vbaObjSet
  loc_0044F7A8: add ebx, 00000034h
  loc_0044F7AB: mov var_19C, eax
  loc_0044F7B1: lea edx, var_2C
  loc_0044F7B4: mov eax, [ebx]
  loc_0044F7B6: push edx
  loc_0044F7B7: push eax
  loc_0044F7B8: mov ecx, [eax]
  loc_0044F7BA: call [ecx+000000B4h]
  loc_0044F7C0: test eax, eax
  loc_0044F7C2: fnclex
  loc_0044F7C4: jge 0044F7D6h
  loc_0044F7C6: mov ecx, [ebx]
  loc_0044F7C8: push 000000B4h
  loc_0044F7CD: push 0041E938h
  loc_0044F7D2: push ecx
  loc_0044F7D3: push eax
  loc_0044F7D4: call edi
  loc_0044F7D6: lea esi, var_30
  loc_0044F7D9: mov eax, var_2C
  loc_0044F7DC: push esi
  loc_0044F7DD: mov ecx, 00000008h
  loc_0044F7E2: sub esp, 00000010h
  loc_0044F7E5: mov var_E8, ecx
  loc_0044F7EB: mov esi, esp
  loc_0044F7ED: mov var_E0, 0041EA3Ch ; "Num1"
  loc_0044F7F7: mov edx, [eax]
  loc_0044F7F9: push eax
  loc_0044F7FA: mov [esi], ecx
  loc_0044F7FC: mov ecx, var_E4
  loc_0044F802: mov var_18C, eax
  loc_0044F808: mov [esi+00000004h], ecx
  loc_0044F80B: mov ecx, var_E0
  loc_0044F811: mov [esi+00000008h], ecx
  loc_0044F814: mov ecx, var_DC
  loc_0044F81A: mov [esi+0000000Ch], ecx
  loc_0044F81D: call [edx+00000030h]
  loc_0044F820: test eax, eax
  loc_0044F822: fnclex
  loc_0044F824: jge 0044F837h
  loc_0044F826: mov edx, var_18C
  loc_0044F82C: push 00000030h
  loc_0044F82E: push 0041EA14h ; "S"
  loc_0044F833: push edx
  loc_0044F834: push eax
  loc_0044F835: call edi
  loc_0044F837: mov eax, var_30
  loc_0044F83A: lea edx, var_48
  loc_0044F83D: push edx
  loc_0044F83E: push eax
  loc_0044F83F: mov ecx, [eax]
  loc_0044F841: mov esi, eax
  loc_0044F843: call [ecx+00000044h]
  loc_0044F846: test eax, eax
  loc_0044F848: fnclex
  loc_0044F84A: jge 0044F857h
  loc_0044F84C: push 00000044h
  loc_0044F84E: push 0041EA48h
  loc_0044F853: push esi
  loc_0044F854: push eax
  loc_0044F855: call edi
  loc_0044F857: mov eax, var_19C
  loc_0044F85D: lea ecx, var_38
  loc_0044F860: lea edx, var_48
  loc_0044F863: push ecx
  loc_0044F864: mov esi, [eax]
  loc_0044F866: push edx
  loc_0044F867: call [004011C0h] ; __vbaI2Var
  loc_0044F86D: mov var_1BC, esi
  loc_0044F873: mov esi, var_19C
  loc_0044F879: push eax
  loc_0044F87A: mov eax, var_1BC
  loc_0044F880: push esi
  loc_0044F881: call [eax+00000040h]
  loc_0044F884: test eax, eax
  loc_0044F886: fnclex
  loc_0044F888: jge 0044F895h
  loc_0044F88A: push 00000040h
  loc_0044F88C: push 0041E5D8h
  loc_0044F891: push esi
  loc_0044F892: push eax
  loc_0044F893: call edi
  loc_0044F895: mov ecx, var_38
  loc_0044F898: mov eax, [ebx]
  loc_0044F89A: mov var_1A4, ecx
  loc_0044F8A0: lea ecx, var_24
  loc_0044F8A3: mov edx, [eax]
  loc_0044F8A5: push ecx
  loc_0044F8A6: push eax
  loc_0044F8A7: call [edx+000000B4h]
  loc_0044F8AD: test eax, eax
  loc_0044F8AF: fnclex
  loc_0044F8B1: jge 0044F8C3h
  loc_0044F8B3: mov edx, [ebx]
  loc_0044F8B5: push 000000B4h
  loc_0044F8BA: push 0041E938h
  loc_0044F8BF: push edx
  loc_0044F8C0: push eax
  loc_0044F8C1: call edi
  loc_0044F8C3: lea esi, var_28
  loc_0044F8C6: mov eax, var_24
  loc_0044F8C9: push esi
  loc_0044F8CA: mov ecx, 00000008h
  loc_0044F8CF: sub esp, 00000010h
  loc_0044F8D2: mov var_D8, ecx
  loc_0044F8D8: mov esi, esp
  loc_0044F8DA: mov var_D0, 0041EA28h ; "TAmount"
  loc_0044F8E4: mov edx, [eax]
  loc_0044F8E6: push eax
  loc_0044F8E7: mov [esi], ecx
  loc_0044F8E9: mov ecx, var_D4
  loc_0044F8EF: mov var_178, eax
  loc_0044F8F5: mov [esi+00000004h], ecx
  loc_0044F8F8: mov ecx, var_D0
  loc_0044F8FE: mov [esi+00000008h], ecx
  loc_0044F901: mov ecx, var_CC
  loc_0044F907: mov [esi+0000000Ch], ecx
  loc_0044F90A: call [edx+00000030h]
  loc_0044F90D: test eax, eax
  loc_0044F90F: fnclex
  loc_0044F911: jge 0044F924h
  loc_0044F913: mov edx, var_178
  loc_0044F919: push 00000030h
  loc_0044F91B: push 0041EA14h ; "S"
  loc_0044F920: push edx
  loc_0044F921: push eax
  loc_0044F922: call edi
  loc_0044F924: mov eax, var_28
  loc_0044F927: lea edx, var_58
  loc_0044F92A: push edx
  loc_0044F92B: push eax
  loc_0044F92C: mov ecx, [eax]
  loc_0044F92E: mov esi, eax
  loc_0044F930: call [ecx+00000044h]
  loc_0044F933: test eax, eax
  loc_0044F935: fnclex
  loc_0044F937: jge 0044F944h
  loc_0044F939: push 00000044h
  loc_0044F93B: push 0041EA48h
  loc_0044F940: push esi
  loc_0044F941: push eax
  loc_0044F942: call edi
  loc_0044F944: mov eax, var_1A4
  loc_0044F94A: lea ecx, var_58
  loc_0044F94D: push ecx
  loc_0044F94E: mov esi, [eax]
  loc_0044F950: call [00401028h] ; __vbaStrVarMove
  loc_0044F956: mov edx, eax
  loc_0044F958: lea ecx, var_18
  loc_0044F95B: call [00401270h] ; __vbaStrMove
  loc_0044F961: mov edx, esi
  loc_0044F963: mov esi, var_1A4
  loc_0044F969: push eax
  loc_0044F96A: push esi
  loc_0044F96B: call [edx+000000A4h]
  loc_0044F971: test eax, eax
  loc_0044F973: fnclex
  loc_0044F975: jge 0044F985h
  loc_0044F977: push 000000A4h
  loc_0044F97C: push 0041E5E8h
  loc_0044F981: push esi
  loc_0044F982: push eax
  loc_0044F983: call edi
  loc_0044F985: lea ecx, var_18
  loc_0044F988: call [004012ACh] ; __vbaFreeStr
  loc_0044F98E: lea eax, var_38
  loc_0044F991: lea ecx, var_28
  loc_0044F994: push eax
  loc_0044F995: lea edx, var_34
  loc_0044F998: push ecx
  loc_0044F999: lea eax, var_30
  loc_0044F99C: push edx
  loc_0044F99D: lea ecx, var_2C
  loc_0044F9A0: push eax
  loc_0044F9A1: lea edx, var_24
  loc_0044F9A4: push ecx
  loc_0044F9A5: push edx
  loc_0044F9A6: push 00000006h
  loc_0044F9A8: call [00401040h] ; __vbaFreeObjList
  loc_0044F9AE: lea eax, var_58
  loc_0044F9B1: lea ecx, var_48
  loc_0044F9B4: push eax
  loc_0044F9B5: push ecx
  loc_0044F9B6: push 00000002h
  loc_0044F9B8: call [00401038h] ; __vbaFreeVarList
  loc_0044F9BE: mov esi, Me
  loc_0044F9C1: add esp, 00000028h
  loc_0044F9C4: mov edx, [esi]
  loc_0044F9C6: push esi
  loc_0044F9C7: call [edx+00000308h]
  loc_0044F9CD: push eax
  loc_0044F9CE: lea eax, var_30
  loc_0044F9D1: push eax
  loc_0044F9D2: call [004010A0h] ; __vbaObjSet
  loc_0044F9D8: mov ecx, [esi]
  loc_0044F9DA: push esi
  loc_0044F9DB: mov var_190, eax
  loc_0044F9E1: call [ecx+00000308h]
  loc_0044F9E7: lea edx, var_2C
  loc_0044F9EA: push eax
  loc_0044F9EB: push edx
  loc_0044F9EC: call [004010A0h] ; __vbaObjSet
  loc_0044F9F2: mov esi, eax
  loc_0044F9F4: lea ecx, var_18
  loc_0044F9F7: push ecx
  loc_0044F9F8: push esi
  loc_0044F9F9: mov eax, [esi]
  loc_0044F9FB: call [eax+000000A0h]
  loc_0044FA01: test eax, eax
  loc_0044FA03: fnclex
  loc_0044FA05: jge 0044FA15h
  loc_0044FA07: push 000000A0h
  loc_0044FA0C: push 0041E5E8h
  loc_0044FA11: push esi
  loc_0044FA12: push eax
  loc_0044FA13: call edi
  loc_0044FA15: mov eax, var_18
  loc_0044FA18: lea ecx, var_24
  loc_0044FA1B: mov var_50, eax
  loc_0044FA1E: mov eax, [ebx]
  loc_0044FA20: mov var_18, 00000000h
  loc_0044FA27: mov var_58, 00000008h
  loc_0044FA2E: mov edx, [eax]
  loc_0044FA30: push ecx
  loc_0044FA31: push eax
  loc_0044FA32: call [edx+000000B4h]
  loc_0044FA38: test eax, eax
  loc_0044FA3A: fnclex
  loc_0044FA3C: jge 0044FA4Eh
  loc_0044FA3E: mov edx, [ebx]
  loc_0044FA40: push 000000B4h
  loc_0044FA45: push 0041E938h
  loc_0044FA4A: push edx
  loc_0044FA4B: push eax
  loc_0044FA4C: call edi
  loc_0044FA4E: lea esi, var_28
  loc_0044FA51: mov eax, var_24
  loc_0044FA54: push esi
  loc_0044FA55: mov ecx, 00000008h
  loc_0044FA5A: sub esp, 00000010h
  loc_0044FA5D: mov var_D8, ecx
  loc_0044FA63: mov esi, esp
  loc_0044FA65: mov var_D0, 0041EA28h ; "TAmount"
  loc_0044FA6F: mov edx, [eax]
  loc_0044FA71: push eax
  loc_0044FA72: mov [esi], ecx
  loc_0044FA74: mov ecx, var_D4
  loc_0044FA7A: mov var_180, eax
  loc_0044FA80: mov [esi+00000004h], ecx
  loc_0044FA83: mov ecx, var_D0
  loc_0044FA89: mov [esi+00000008h], ecx
  loc_0044FA8C: mov ecx, var_CC
  loc_0044FA92: mov [esi+0000000Ch], ecx
  loc_0044FA95: call [edx+00000030h]
  loc_0044FA98: test eax, eax
  loc_0044FA9A: fnclex
  loc_0044FA9C: jge 0044FAAFh
  loc_0044FA9E: mov edx, var_180
  loc_0044FAA4: push 00000030h
  loc_0044FAA6: push 0041EA14h ; "S"
  loc_0044FAAB: push edx
  loc_0044FAAC: push eax
  loc_0044FAAD: call edi
  loc_0044FAAF: mov eax, var_28
  loc_0044FAB2: lea edx, var_48
  loc_0044FAB5: push edx
  loc_0044FAB6: push eax
  loc_0044FAB7: mov ecx, [eax]
  loc_0044FAB9: mov esi, eax
  loc_0044FABB: call [ecx+00000044h]
  loc_0044FABE: test eax, eax
  loc_0044FAC0: fnclex
  loc_0044FAC2: jge 0044FACFh
  loc_0044FAC4: push 00000044h
  loc_0044FAC6: push 0041EA48h
  loc_0044FACB: push esi
  loc_0044FACC: push eax
  loc_0044FACD: call edi
  loc_0044FACF: mov eax, var_190
  loc_0044FAD5: lea ecx, var_58
  loc_0044FAD8: lea edx, var_48
  loc_0044FADB: push ecx
  loc_0044FADC: mov esi, [eax]
  loc_0044FADE: lea eax, var_68
  loc_0044FAE1: push edx
  loc_0044FAE2: push eax
  loc_0044FAE3: call [00401234h] ; __vbaVarAdd
  loc_0044FAE9: lea ecx, var_1C
  loc_0044FAEC: push eax
  loc_0044FAED: push ecx
  loc_0044FAEE: call [004011B0h] ; __vbaStrVarVal
  loc_0044FAF4: push eax
  loc_0044FAF5: call [004012B4h] ; rtcR8ValFromBstr
  loc_0044FAFB: sub esp, 00000008h
  loc_0044FAFE: fstp real8 ptr [esp]
  loc_0044FB01: call [00401144h] ; __vbaStrR8
  loc_0044FB07: mov edx, eax
  loc_0044FB09: lea ecx, var_20
  loc_0044FB0C: call [00401270h] ; __vbaStrMove
  loc_0044FB12: mov edx, esi
  loc_0044FB14: mov esi, var_190
  loc_0044FB1A: push eax
  loc_0044FB1B: push esi
  loc_0044FB1C: call [edx+000000A4h]
  loc_0044FB22: test eax, eax
  loc_0044FB24: fnclex
  loc_0044FB26: jge 0044FB36h
  loc_0044FB28: push 000000A4h
  loc_0044FB2D: push 0041E5E8h
  loc_0044FB32: push esi
  loc_0044FB33: push eax
  loc_0044FB34: call edi
  loc_0044FB36: lea eax, var_20
  loc_0044FB39: lea ecx, var_1C
  loc_0044FB3C: push eax
  loc_0044FB3D: push ecx
  loc_0044FB3E: push 00000002h
  loc_0044FB40: call [004011FCh] ; __vbaFreeStrList
  loc_0044FB46: lea edx, var_30
  loc_0044FB49: lea eax, var_2C
  loc_0044FB4C: push edx
  loc_0044FB4D: lea ecx, var_28
  loc_0044FB50: push eax
  loc_0044FB51: lea edx, var_24
  loc_0044FB54: push ecx
  loc_0044FB55: push edx
  loc_0044FB56: push 00000004h
  loc_0044FB58: call [00401040h] ; __vbaFreeObjList
  loc_0044FB5E: lea eax, var_68
  loc_0044FB61: lea ecx, var_48
  loc_0044FB64: push eax
  loc_0044FB65: lea edx, var_58
  loc_0044FB68: push ecx
  loc_0044FB69: push edx
  loc_0044FB6A: push 00000003h
  loc_0044FB6C: call [00401038h] ; __vbaFreeVarList
  loc_0044FB72: mov eax, [ebx]
  loc_0044FB74: add esp, 00000030h
  loc_0044FB77: mov ecx, [eax]
  loc_0044FB79: push eax
  loc_0044FB7A: call [ecx+000000ECh]
  loc_0044FB80: test eax, eax
  loc_0044FB82: fnclex
  loc_0044FB84: jge 0044F648h
  loc_0044FB8A: mov edx, [ebx]
  loc_0044FB8C: push 000000ECh
  loc_0044FB91: push 0041E938h
  loc_0044FB96: push edx
  loc_0044FB97: push eax
  loc_0044FB98: call edi
  loc_0044FB9A: jmp 0044F648h
  loc_0044FB9F: mov eax, [ebx]
  loc_0044FBA1: push eax
  loc_0044FBA2: mov ecx, [eax]
  loc_0044FBA4: call [ecx+000000C4h]
  loc_0044FBAA: test eax, eax
  loc_0044FBAC: fnclex
  loc_0044FBAE: jge 0044FBC0h
  loc_0044FBB0: mov edx, [ebx]
  loc_0044FBB2: push 000000C4h
  loc_0044FBB7: push 0041E938h
  loc_0044FBBC: push edx
  loc_0044FBBD: push eax
  loc_0044FBBE: call edi
  loc_0044FBC0: push 0041E938h
  loc_0044FBC5: push 00000000h
  loc_0044FBC7: call [00401274h] ; __vbaCastObj
  loc_0044FBCD: push eax
  loc_0044FBCE: lea eax, var_24
  loc_0044FBD1: push eax
  loc_0044FBD2: call [004010A0h] ; __vbaObjSet
  loc_0044FBD8: push eax
  loc_0044FBD9: push ebx
  loc_0044FBDA: call [004010B8h] ; __vbaObjSetAddref
  loc_0044FBE0: lea ecx, var_24
  loc_0044FBE3: call [004012B0h] ; __vbaFreeObj
  loc_0044FBE9: fwait
  loc_0044FBEA: push 0044FD33h
  loc_0044FBEF: jmp 0044FD29h
  loc_0044FBF4: mov ecx, 80020004h
  loc_0044FBF9: mov eax, 0000000Ah
  loc_0044FBFE: mov var_70, ecx
  loc_0044FC01: mov var_60, ecx
  loc_0044FC04: mov var_50, ecx
  loc_0044FC07: lea edx, var_D8
  loc_0044FC0D: lea ecx, var_48
  loc_0044FC10: mov var_78, eax
  loc_0044FC13: mov var_68, eax
  loc_0044FC16: mov var_58, eax
  loc_0044FC19: mov var_D0, 0041E94Ch ; "SrNo Not Found!"
  loc_0044FC23: mov var_D8, 00000008h
  loc_0044FC2D: call [00401240h] ; __vbaVarDup
  loc_0044FC33: lea ecx, var_78
  loc_0044FC36: lea edx, var_68
  loc_0044FC39: push ecx
  loc_0044FC3A: lea eax, var_58
  loc_0044FC3D: push edx
  loc_0044FC3E: push eax
  loc_0044FC3F: lea ecx, var_48
  loc_0044FC42: push 00000030h
  loc_0044FC44: push ecx
  loc_0044FC45: call [004010A4h] ; rtcMsgBox
  loc_0044FC4B: lea edx, var_78
  loc_0044FC4E: lea eax, var_68
  loc_0044FC51: push edx
  loc_0044FC52: lea ecx, var_58
  loc_0044FC55: push eax
  loc_0044FC56: lea edx, var_48
  loc_0044FC59: push ecx
  loc_0044FC5A: push edx
  loc_0044FC5B: push 00000004h
  loc_0044FC5D: call [00401038h] ; __vbaFreeVarList
  loc_0044FC63: mov eax, Me
  loc_0044FC66: add esp, 00000014h
  loc_0044FC69: mov ecx, [eax]
  loc_0044FC6B: push eax
  loc_0044FC6C: call [ecx+00000310h]
  loc_0044FC72: lea edx, var_24
  loc_0044FC75: push eax
  loc_0044FC76: push edx
  loc_0044FC77: call [004010A0h] ; __vbaObjSet
  loc_0044FC7D: mov esi, eax
  loc_0044FC7F: push 0041E5D4h
  loc_0044FC84: push esi
  loc_0044FC85: mov eax, [esi]
  loc_0044FC87: call [eax+000000A4h]
  loc_0044FC8D: test eax, eax
  loc_0044FC8F: fnclex
  loc_0044FC91: jge 0044FCA5h
  loc_0044FC93: push 000000A4h
  loc_0044FC98: push 0041E5E8h
  loc_0044FC9D: push esi
  loc_0044FC9E: push eax
  loc_0044FC9F: call [00401074h] ; __vbaHresultCheckObj
  loc_0044FCA5: lea ecx, var_24
  loc_0044FCA8: call [004012B0h] ; __vbaFreeObj
  loc_0044FCAE: fwait
  loc_0044FCAF: push 0044FD33h
  loc_0044FCB4: jmp 0044FD29h
  loc_0044FCB6: lea ecx, var_20
  loc_0044FCB9: lea edx, var_1C
  loc_0044FCBC: push ecx
  loc_0044FCBD: lea eax, var_18
  loc_0044FCC0: push edx
  loc_0044FCC1: push eax
  loc_0044FCC2: push 00000003h
  loc_0044FCC4: call [004011FCh] ; __vbaFreeStrList
  loc_0044FCCA: lea ecx, var_38
  loc_0044FCCD: lea edx, var_34
  loc_0044FCD0: push ecx
  loc_0044FCD1: lea eax, var_30
  loc_0044FCD4: push edx
  loc_0044FCD5: lea ecx, var_2C
  loc_0044FCD8: push eax
  loc_0044FCD9: lea edx, var_28
  loc_0044FCDC: push ecx
  loc_0044FCDD: lea eax, var_24
  loc_0044FCE0: push edx
  loc_0044FCE1: push eax
  loc_0044FCE2: push 00000006h
  loc_0044FCE4: call [00401040h] ; __vbaFreeObjList
  loc_0044FCEA: lea ecx, var_C8
  loc_0044FCF0: lea edx, var_B8
  loc_0044FCF6: push ecx
  loc_0044FCF7: lea eax, var_A8
  loc_0044FCFD: push edx
  loc_0044FCFE: lea ecx, var_98
  loc_0044FD04: push eax
  loc_0044FD05: lea edx, var_88
  loc_0044FD0B: push ecx
  loc_0044FD0C: lea eax, var_78
  loc_0044FD0F: push edx
  loc_0044FD10: lea ecx, var_68
  loc_0044FD13: push eax
  loc_0044FD14: lea edx, var_58
  loc_0044FD17: push ecx
  loc_0044FD18: lea eax, var_48
  loc_0044FD1B: push edx
  loc_0044FD1C: push eax
  loc_0044FD1D: push 00000009h
  loc_0044FD1F: call [00401038h] ; __vbaFreeVarList
  loc_0044FD25: add esp, 00000054h
  loc_0044FD28: ret
  loc_0044FD29: lea ecx, var_14
  loc_0044FD2C: call [004012ACh] ; __vbaFreeStr
  loc_0044FD32: ret
  loc_0044FD33: mov ecx, var_10
  loc_0044FD36: pop edi
  loc_0044FD37: pop esi
  loc_0044FD38: xor eax, eax
  loc_0044FD3A: mov fs:[00000000h], ecx
  loc_0044FD41: pop ebx
  loc_0044FD42: mov esp, ebp
  loc_0044FD44: pop ebp
  loc_0044FD45: retn 0004h
End Sub

Private Sub Proc_1_12_44FD50() '44FD50
  loc_0044FD50: mov eax, var_4
  loc_0044FD54: push eax
  loc_0044FD55: mov ecx, [eax]
  loc_0044FD57: call [ecx+000006F8h]
  loc_0044FD5D: xor eax, eax
  loc_0044FD5F: retn 0004h
End Sub

Private Sub Proc_1_13_4510C0(arg_C) '4510C0
  loc_004510C0: push ebp
  loc_004510C1: mov ebp, esp
  loc_004510C3: sub esp, 0000000Ch
  loc_004510C6: push 00403B36h ; __vbaExceptHandler
  loc_004510CB: mov eax, fs:[00000000h]
  loc_004510D1: push eax
  loc_004510D2: mov fs:[00000000h], esp
  loc_004510D9: sub esp, 00000158h
  loc_004510DF: push ebx
  loc_004510E0: push esi
  loc_004510E1: push edi
  loc_004510E2: mov var_C, esp
  loc_004510E5: mov var_8, 004013D0h
  loc_004510EC: mov eax, arg_C
  loc_004510EF: mov edi, [004010D4h] ; rtcTrimVar
  loc_004510F5: lea ecx, var_B8
  loc_004510FB: lea edx, var_38
  loc_004510FE: xor esi, esi
  loc_00451100: mov ebx, 00004008h
  loc_00451105: push ecx
  loc_00451106: push edx
  loc_00451107: mov var_18, esi
  loc_0045110A: mov var_1C, esi
  loc_0045110D: mov var_20, esi
  loc_00451110: mov var_24, esi
  loc_00451113: mov var_28, esi
  loc_00451116: mov var_38, esi
  loc_00451119: mov var_48, esi
  loc_0045111C: mov var_58, esi
  loc_0045111F: mov var_68, esi
  loc_00451122: mov var_78, esi
  loc_00451125: mov var_88, esi
  loc_0045112B: mov var_98, esi
  loc_00451131: mov var_A8, esi
  loc_00451137: mov var_C8, esi
  loc_0045113D: mov var_D8, esi
  loc_00451143: mov var_E8, esi
  loc_00451149: mov var_F8, esi
  loc_0045114F: mov var_108, esi
  loc_00451155: mov var_13C, esi
  loc_0045115B: mov var_140, esi
  loc_00451161: mov [eax], esi
  loc_00451163: mov var_B0, 0061A05Ch
  loc_0045116D: mov var_B8, ebx
  loc_00451173: call edi
  loc_00451175: lea eax, var_E8
  loc_0045117B: lea ecx, var_68
  loc_0045117E: push eax
  loc_0045117F: push ecx
  loc_00451180: mov var_E0, 0061A060h
  loc_0045118A: mov var_E8, ebx
  loc_00451190: call edi
  loc_00451192: lea edx, var_108
  loc_00451198: lea eax, var_98
  loc_0045119E: push edx
  loc_0045119F: push eax
  loc_004511A0: mov var_100, 0061A130h
  loc_004511AA: mov var_108, 00004011h
  loc_004511B4: call edi
  loc_004511B6: mov edi, 00000008h
  loc_004511BB: mov var_C0, 0041EB60h ; "Select Max(SrNo) as MaxNo From LG WHERE OnCount='"
  loc_004511C5: mov var_C8, edi
  loc_004511CB: mov var_D8, edi
  loc_004511D1: mov var_F8, edi
  loc_004511D7: mov edi, [0061A13Ch]
  loc_004511DD: mov var_D0, 0041E870h ; "' and AMPM='"
  loc_004511E7: mov var_F0, 0041EBC8h ; "' And MachineID="
  loc_004511F1: mov ebx, [edi]
  loc_004511F3: lea edi, var_24
  loc_004511F6: push edi
  loc_004511F7: mov ecx, 0000000Ah
  loc_004511FC: sub esp, 00000010h
  loc_004511FF: mov var_128, ecx
  loc_00451205: mov edi, esp
  loc_00451207: mov eax, 80020004h
  loc_0045120C: mov edx, eax
  loc_0045120E: sub esp, 00000010h
  loc_00451211: mov [edi], ecx
  loc_00451213: mov ecx, var_134
  loc_00451219: mov [edi+00000004h], ecx
  loc_0045121C: mov ecx, esp
  loc_0045121E: mov [edi+00000008h], eax
  loc_00451221: mov eax, var_12C
  loc_00451227: mov [edi+0000000Ch], eax
  loc_0045122A: mov eax, var_128
  loc_00451230: mov [ecx], eax
  loc_00451232: mov eax, var_124
  loc_00451238: mov [ecx+00000004h], eax
  loc_0045123B: mov [ecx+00000008h], edx
  loc_0045123E: mov edx, var_11C
  loc_00451244: sub esp, 00000010h
  loc_00451247: mov [ecx+0000000Ch], edx
  loc_0045124A: mov edx, var_114
  loc_00451250: mov ecx, esp
  loc_00451252: mov eax, 00000003h
  loc_00451257: mov edi, [004011B4h] ; __vbaVarCat
  loc_0045125D: mov [ecx], eax
  loc_0045125F: mov eax, 00000004h
  loc_00451264: mov [ecx+00000004h], edx
  loc_00451267: lea edx, var_38
  loc_0045126A: mov [ecx+00000008h], eax
  loc_0045126D: mov eax, var_10C
  loc_00451273: mov [ecx+0000000Ch], eax
  loc_00451276: lea ecx, var_C8
  loc_0045127C: push ecx
  loc_0045127D: lea eax, var_48
  loc_00451280: push edx
  loc_00451281: push eax
  loc_00451282: call edi
  loc_00451284: lea ecx, var_D8
  loc_0045128A: push eax
  loc_0045128B: lea edx, var_58
  loc_0045128E: push ecx
  loc_0045128F: push edx
  loc_00451290: call edi
  loc_00451292: push eax
  loc_00451293: lea eax, var_68
  loc_00451296: lea ecx, var_78
  loc_00451299: push eax
  loc_0045129A: push ecx
  loc_0045129B: call edi
  loc_0045129D: push eax
  loc_0045129E: lea edx, var_F8
  loc_004512A4: lea eax, var_88
  loc_004512AA: push edx
  loc_004512AB: push eax
  loc_004512AC: call edi
  loc_004512AE: lea ecx, var_98
  loc_004512B4: push eax
  loc_004512B5: lea edx, var_A8
  loc_004512BB: push ecx
  loc_004512BC: push edx
  loc_004512BD: call edi
  loc_004512BF: push eax
  loc_004512C0: lea eax, var_20
  loc_004512C3: push eax
  loc_004512C4: call [004011B0h] ; __vbaStrVarVal
  loc_004512CA: mov ecx, [0061A13Ch]
  loc_004512D0: push eax
  loc_004512D1: push ecx
  loc_004512D2: call [ebx+000000BCh]
  loc_004512D8: cmp eax, esi
  loc_004512DA: fnclex
  loc_004512DC: jge 004512FAh
  loc_004512DE: mov edx, [0061A13Ch]
  loc_004512E4: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004512EA: push 000000BCh
  loc_004512EF: push 0041E928h
  loc_004512F4: push edx
  loc_004512F5: push eax
  loc_004512F6: call edi
  loc_004512F8: jmp 00451300h
  loc_004512FA: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00451300: mov eax, var_24
  loc_00451303: mov var_24, esi
  loc_00451306: push eax
  loc_00451307: lea eax, var_1C
  loc_0045130A: push eax
  loc_0045130B: call [004010A0h] ; __vbaObjSet
  loc_00451311: lea ecx, var_20
  loc_00451314: call [004012ACh] ; __vbaFreeStr
  loc_0045131A: lea ecx, var_A8
  loc_00451320: lea edx, var_98
  loc_00451326: push ecx
  loc_00451327: lea eax, var_88
  loc_0045132D: push edx
  loc_0045132E: lea ecx, var_78
  loc_00451331: push eax
  loc_00451332: lea edx, var_68
  loc_00451335: push ecx
  loc_00451336: lea eax, var_58
  loc_00451339: push edx
  loc_0045133A: lea ecx, var_48
  loc_0045133D: push eax
  loc_0045133E: lea edx, var_38
  loc_00451341: push ecx
  loc_00451342: push edx
  loc_00451343: push 00000008h
  loc_00451345: call [00401038h] ; __vbaFreeVarList
  loc_0045134B: mov eax, var_1C
  loc_0045134E: add esp, 00000024h
  loc_00451351: lea edx, var_13C
  loc_00451357: mov ecx, [eax]
  loc_00451359: push edx
  loc_0045135A: push eax
  loc_0045135B: call [ecx+00000020h]
  loc_0045135E: cmp eax, esi
  loc_00451360: fnclex
  loc_00451362: jge 00451372h
  loc_00451364: mov ecx, var_1C
  loc_00451367: push 00000020h
  loc_00451369: push 0041E938h
  loc_0045136E: push ecx
  loc_0045136F: push eax
  loc_00451370: call edi
  loc_00451372: mov eax, var_1C
  loc_00451375: lea ecx, var_140
  loc_0045137B: push ecx
  loc_0045137C: push eax
  loc_0045137D: mov edx, [eax]
  loc_0045137F: call [edx+00000034h]
  loc_00451382: cmp eax, esi
  loc_00451384: fnclex
  loc_00451386: jge 00451396h
  loc_00451388: mov edx, var_1C
  loc_0045138B: push 00000034h
  loc_0045138D: push 0041E938h
  loc_00451392: push edx
  loc_00451393: push eax
  loc_00451394: call edi
  loc_00451396: xor eax, eax
  loc_00451398: cmp var_140, si
  loc_0045139F: setz al
  loc_004513A2: xor ecx, ecx
  loc_004513A4: cmp var_13C, si
  loc_004513AB: setz cl
  loc_004513AE: or eax, ecx
  loc_004513B0: jz 00451651h
  loc_004513B6: mov eax, var_1C
  loc_004513B9: lea ecx, var_24
  loc_004513BC: push ecx
  loc_004513BD: push eax
  loc_004513BE: mov edx, [eax]
  loc_004513C0: call [edx+000000B4h]
  loc_004513C6: cmp eax, esi
  loc_004513C8: fnclex
  loc_004513CA: jge 004513DDh
  loc_004513CC: mov edx, var_1C
  loc_004513CF: push 000000B4h
  loc_004513D4: push 0041E938h
  loc_004513D9: push edx
  loc_004513DA: push eax
  loc_004513DB: call edi
  loc_004513DD: lea ebx, var_28
  loc_004513E0: mov eax, var_24
  loc_004513E3: push ebx
  loc_004513E4: mov edx, 00000008h
  loc_004513E9: sub esp, 00000010h
  loc_004513EC: mov var_B8, edx
  loc_004513F2: mov ebx, esp
  loc_004513F4: mov ecx, 0041EBF0h ; "MaxNo"
  loc_004513F9: mov var_B0, ecx
  loc_004513FF: mov edi, [eax]
  loc_00451401: mov [ebx], edx
  loc_00451403: mov edx, var_B4
  loc_00451409: push eax
  loc_0045140A: mov var_148, eax
  loc_00451410: mov [ebx+00000004h], edx
  loc_00451413: mov [ebx+00000008h], ecx
  loc_00451416: mov ecx, var_AC
  loc_0045141C: mov [ebx+0000000Ch], ecx
  loc_0045141F: call [edi+00000030h]
  loc_00451422: cmp eax, esi
  loc_00451424: fnclex
  loc_00451426: jge 0045143Dh
  loc_00451428: mov edx, var_148
  loc_0045142E: push 00000030h
  loc_00451430: push 0041EA14h ; "S"
  loc_00451435: push edx
  loc_00451436: push eax
  loc_00451437: call [00401074h] ; __vbaHresultCheckObj
  loc_0045143D: mov eax, var_28
  loc_00451440: mov var_28, esi
  loc_00451443: mov var_30, eax
  loc_00451446: lea eax, var_38
  loc_00451449: push eax
  loc_0045144A: mov var_38, 00000009h
  loc_00451451: call [00401118h] ; rtcIsNull
  loc_00451457: lea ecx, var_24
  loc_0045145A: mov di, ax
  loc_0045145D: call [004012B0h] ; __vbaFreeObj
  loc_00451463: lea ecx, var_38
  loc_00451466: call [00401020h] ; __vbaFreeVar
  loc_0045146C: cmp di, si
  loc_0045146F: jz 0045153Ah
  loc_00451475: mov esi, [00401154h] ; __vbaUI1I2
  loc_0045147B: mov bl, [0061A130h]
  loc_00451481: mov ecx, 00000001h
  loc_00451486: call __vbaUI1I2
  loc_00451488: cmp bl, al
  loc_0045148A: jnz 00451493h
  loc_0045148C: push 00000001h
  loc_0045148E: jmp 004516FDh
  loc_00451493: mov ecx, 00000002h
  loc_00451498: call __vbaUI1I2
  loc_0045149A: cmp bl, al
  loc_0045149C: jnz 004514A8h
  loc_0045149E: push 000007D0h
  loc_004514A3: jmp 004516FDh
  loc_004514A8: mov ecx, 00000003h
  loc_004514AD: call __vbaUI1I2
  loc_004514AF: cmp bl, al
  loc_004514B1: jnz 004514BDh
  loc_004514B3: push 00000BB8h
  loc_004514B8: jmp 004516FDh
  loc_004514BD: mov ecx, 00000004h
  loc_004514C2: call __vbaUI1I2
  loc_004514C4: cmp bl, al
  loc_004514C6: jnz 004514D2h
  loc_004514C8: push 00000FA0h
  loc_004514CD: jmp 004516FDh
  loc_004514D2: mov ecx, 00000005h
  loc_004514D7: call __vbaUI1I2
  loc_004514D9: cmp bl, al
  loc_004514DB: jnz 004514E7h
  loc_004514DD: push 00001388h
  loc_004514E2: jmp 004516FDh
  loc_004514E7: mov ecx, 00000006h
  loc_004514EC: call __vbaUI1I2
  loc_004514EE: cmp bl, al
  loc_004514F0: jnz 004514FCh
  loc_004514F2: push 00001770h
  loc_004514F7: jmp 004516FDh
  loc_004514FC: mov ecx, 00000007h
  loc_00451501: call __vbaUI1I2
  loc_00451503: cmp bl, al
  loc_00451505: jnz 00451511h
  loc_00451507: push 00001B58h
  loc_0045150C: jmp 004516FDh
  loc_00451511: mov ecx, 00000008h
  loc_00451516: call __vbaUI1I2
  loc_00451518: cmp bl, al
  loc_0045151A: jnz 00451526h
  loc_0045151C: push 00001F40h
  loc_00451521: jmp 004516FDh
  loc_00451526: mov ecx, 00000009h
  loc_0045152B: call __vbaUI1I2
  loc_0045152D: cmp bl, al
  loc_0045152F: jnz 0045170Eh
  loc_00451535: jmp 004516F8h
  loc_0045153A: mov eax, var_1C
  loc_0045153D: lea edx, var_24
  loc_00451540: push edx
  loc_00451541: push eax
  loc_00451542: mov ecx, [eax]
  loc_00451544: call [ecx+000000B4h]
  loc_0045154A: cmp eax, esi
  loc_0045154C: fnclex
  loc_0045154E: jge 00451565h
  loc_00451550: mov ecx, var_1C
  loc_00451553: push 000000B4h
  loc_00451558: push 0041E938h
  loc_0045155D: push ecx
  loc_0045155E: push eax
  loc_0045155F: call [00401074h] ; __vbaHresultCheckObj
  loc_00451565: lea ebx, var_28
  loc_00451568: mov eax, var_24
  loc_0045156B: push ebx
  loc_0045156C: mov edx, 00000008h
  loc_00451571: sub esp, 00000010h
  loc_00451574: mov var_B8, edx
  loc_0045157A: mov ebx, esp
  loc_0045157C: mov ecx, 0041EBF0h ; "MaxNo"
  loc_00451581: mov var_B0, ecx
  loc_00451587: mov edi, [eax]
  loc_00451589: mov [ebx], edx
  loc_0045158B: mov edx, var_B4
  loc_00451591: push eax
  loc_00451592: mov var_148, eax
  loc_00451598: mov [ebx+00000004h], edx
  loc_0045159B: mov [ebx+00000008h], ecx
  loc_0045159E: mov ecx, var_AC
  loc_004515A4: mov [ebx+0000000Ch], ecx
  loc_004515A7: call [edi+00000030h]
  loc_004515AA: cmp eax, esi
  loc_004515AC: fnclex
  loc_004515AE: jge 004515C5h
  loc_004515B0: mov edx, var_148
  loc_004515B6: push 00000030h
  loc_004515B8: push 0041EA14h ; "S"
  loc_004515BD: push edx
  loc_004515BE: push eax
  loc_004515BF: call [00401074h] ; __vbaHresultCheckObj
  loc_004515C5: mov eax, var_28
  loc_004515C8: lea edx, var_38
  loc_004515CB: push edx
  loc_004515CC: push eax
  loc_004515CD: mov ecx, [eax]
  loc_004515CF: mov edi, eax
  loc_004515D1: call [ecx+00000044h]
  loc_004515D4: cmp eax, esi
  loc_004515D6: fnclex
  loc_004515D8: jge 004515E9h
  loc_004515DA: push 00000044h
  loc_004515DC: push 0041EA48h
  loc_004515E1: push edi
  loc_004515E2: push eax
  loc_004515E3: call [00401074h] ; __vbaHresultCheckObj
  loc_004515E9: lea eax, var_38
  loc_004515EC: lea ecx, var_C8
  loc_004515F2: push eax
  loc_004515F3: lea edx, var_48
  loc_004515F6: push ecx
  loc_004515F7: push edx
  loc_004515F8: mov var_C0, 00000001h
  loc_00451602: mov var_C8, 00000002h
  loc_0045160C: call [00401234h] ; __vbaVarAdd
  loc_00451612: push eax
  loc_00451613: call [00401028h] ; __vbaStrVarMove
  loc_00451619: mov edx, eax
  loc_0045161B: lea ecx, var_18
  loc_0045161E: call [00401270h] ; __vbaStrMove
  loc_00451624: lea eax, var_28
  loc_00451627: lea ecx, var_24
  loc_0045162A: push eax
  loc_0045162B: push ecx
  loc_0045162C: push 00000002h
  loc_0045162E: call [00401040h] ; __vbaFreeObjList
  loc_00451634: lea edx, var_48
  loc_00451637: lea eax, var_38
  loc_0045163A: push edx
  loc_0045163B: push eax
  loc_0045163C: push 00000002h
  loc_0045163E: call [00401038h] ; __vbaFreeVarList
  loc_00451644: add esp, 00000018h
  loc_00451647: push 0045177Ch
  loc_0045164C: jmp 00451772h
  loc_00451651: mov esi, [00401154h] ; __vbaUI1I2
  loc_00451657: mov bl, [0061A130h]
  loc_0045165D: mov ecx, 00000001h
  loc_00451662: call __vbaUI1I2
  loc_00451664: cmp bl, al
  loc_00451666: jnz 0045166Fh
  loc_00451668: push 00000001h
  loc_0045166A: jmp 004516FDh
  loc_0045166F: mov ecx, 00000002h
  loc_00451674: call __vbaUI1I2
  loc_00451676: cmp bl, al
  loc_00451678: jnz 00451681h
  loc_0045167A: push 000007D0h
  loc_0045167F: jmp 004516FDh
  loc_00451681: mov ecx, 00000003h
  loc_00451686: call __vbaUI1I2
  loc_00451688: cmp bl, al
  loc_0045168A: jnz 00451693h
  loc_0045168C: push 00000BB8h
  loc_00451691: jmp 004516FDh
  loc_00451693: mov ecx, 00000004h
  loc_00451698: call __vbaUI1I2
  loc_0045169A: cmp bl, al
  loc_0045169C: jnz 004516A5h
  loc_0045169E: push 00000FA0h
  loc_004516A3: jmp 004516FDh
  loc_004516A5: mov ecx, 00000005h
  loc_004516AA: call __vbaUI1I2
  loc_004516AC: cmp bl, al
  loc_004516AE: jnz 004516B7h
  loc_004516B0: push 00001388h
  loc_004516B5: jmp 004516FDh
  loc_004516B7: mov ecx, 00000006h
  loc_004516BC: call __vbaUI1I2
  loc_004516BE: cmp bl, al
  loc_004516C0: jnz 004516C9h
  loc_004516C2: push 00001770h
  loc_004516C7: jmp 004516FDh
  loc_004516C9: mov ecx, 00000007h
  loc_004516CE: call __vbaUI1I2
  loc_004516D0: cmp bl, al
  loc_004516D2: jnz 004516DBh
  loc_004516D4: push 00001B58h
  loc_004516D9: jmp 004516FDh
  loc_004516DB: mov ecx, 00000008h
  loc_004516E0: call __vbaUI1I2
  loc_004516E2: cmp bl, al
  loc_004516E4: jnz 004516EDh
  loc_004516E6: push 00001F40h
  loc_004516EB: jmp 004516FDh
  loc_004516ED: mov ecx, 00000009h
  loc_004516F2: call __vbaUI1I2
  loc_004516F4: cmp bl, al
  loc_004516F6: jnz 0045170Eh
  loc_004516F8: push 00002328h
  loc_004516FD: call [00401008h] ; __vbaStrI2
  loc_00451703: mov edx, eax
  loc_00451705: lea ecx, var_18
  loc_00451708: call [00401270h] ; __vbaStrMove
  loc_0045170E: push 0045177Ch
  loc_00451713: jmp 00451772h
  loc_00451715: test var_4, 04h
  loc_00451719: jz 00451724h
  loc_0045171B: lea ecx, var_18
  loc_0045171E: call [004012ACh] ; __vbaFreeStr
  loc_00451724: lea ecx, var_20
  loc_00451727: call [004012ACh] ; __vbaFreeStr
  loc_0045172D: lea ecx, var_28
  loc_00451730: lea edx, var_24
  loc_00451733: push ecx
  loc_00451734: push edx
  loc_00451735: push 00000002h
  loc_00451737: call [00401040h] ; __vbaFreeObjList
  loc_0045173D: lea eax, var_A8
  loc_00451743: lea ecx, var_98
  loc_00451749: push eax
  loc_0045174A: lea edx, var_88
  loc_00451750: push ecx
  loc_00451751: lea eax, var_78
  loc_00451754: push edx
  loc_00451755: lea ecx, var_68
  loc_00451758: push eax
  loc_00451759: lea edx, var_58
  loc_0045175C: push ecx
  loc_0045175D: lea eax, var_48
  loc_00451760: push edx
  loc_00451761: lea ecx, var_38
  loc_00451764: push eax
  loc_00451765: push ecx
  loc_00451766: push 00000008h
  loc_00451768: call [00401038h] ; __vbaFreeVarList
  loc_0045176E: add esp, 00000030h
  loc_00451771: ret
  loc_00451772: lea ecx, var_1C
  loc_00451775: call [004012B0h] ; __vbaFreeObj
  loc_0045177B: ret
  loc_0045177C: mov edx, arg_C
  loc_0045177F: mov eax, var_18
  loc_00451782: mov ecx, var_14
  loc_00451785: pop edi
  loc_00451786: mov [edx], eax
  loc_00451788: pop esi
  loc_00451789: xor eax, eax
  loc_0045178B: mov fs:[00000000h], ecx
  loc_00451792: pop ebx
  loc_00451793: mov esp, ebp
  loc_00451795: pop ebp
  loc_00451796: retn 0008h
End Sub

Private Sub Proc_1_14_4517A0() '4517A0
  loc_004517A0: push ebp
  loc_004517A1: mov ebp, esp
  loc_004517A3: sub esp, 00000008h
  loc_004517A6: push 00403B36h ; __vbaExceptHandler
  loc_004517AB: mov eax, fs:[00000000h]
  loc_004517B1: push eax
  loc_004517B2: mov fs:[00000000h], esp
  loc_004517B9: sub esp, 00000190h
  loc_004517BF: push ebx
  loc_004517C0: push esi
  loc_004517C1: push edi
  loc_004517C2: mov var_8, esp
  loc_004517C5: mov var_4, 004013E0h
  loc_004517CC: mov edi, Me
  loc_004517CF: xor esi, esi
  loc_004517D1: push edi
  loc_004517D2: mov var_14, esi
  loc_004517D5: mov eax, [edi]
  loc_004517D7: mov var_24, esi
  loc_004517DA: mov var_28, esi
  loc_004517DD: mov var_2C, esi
  loc_004517E0: mov var_3C, esi
  loc_004517E3: mov var_40, esi
  loc_004517E6: mov var_48, esi
  loc_004517E9: mov var_4C, esi
  loc_004517EC: mov var_5C, esi
  loc_004517EF: mov var_6C, esi
  loc_004517F2: mov var_70, esi
  loc_004517F5: mov var_74, esi
  loc_004517F8: mov var_78, esi
  loc_004517FB: mov var_7C, esi
  loc_004517FE: mov var_80, esi
  loc_00451801: mov var_84, esi
  loc_00451807: mov var_94, esi
  loc_0045180D: mov var_A4, esi
  loc_00451813: mov var_B4, esi
  loc_00451819: mov var_C4, esi
  loc_0045181F: mov var_D4, esi
  loc_00451825: mov var_E4, esi
  loc_0045182B: mov var_F4, esi
  loc_00451831: mov var_104, esi
  loc_00451837: mov var_114, esi
  loc_0045183D: mov var_124, esi
  loc_00451843: mov var_134, esi
  loc_00451849: mov var_144, esi
  loc_0045184F: mov var_168, esi
  loc_00451855: mov var_178, esi
  loc_0045185B: call [eax+00000310h]
  loc_00451861: lea ecx, var_80
  loc_00451864: push eax
  loc_00451865: push ecx
  loc_00451866: call [004010A0h] ; __vbaObjSet
  loc_0045186C: mov ebx, eax
  loc_0045186E: lea eax, var_70
  loc_00451871: push eax
  loc_00451872: push ebx
  loc_00451873: mov edx, [ebx]
  loc_00451875: call [edx+000000A0h]
  loc_0045187B: cmp eax, esi
  loc_0045187D: fnclex
  loc_0045187F: jge 00451893h
  loc_00451881: push 000000A0h
  loc_00451886: push 0041E5E8h
  loc_0045188B: push ebx
  loc_0045188C: push eax
  loc_0045188D: call [00401074h] ; __vbaHresultCheckObj
  loc_00451893: mov eax, var_70
  loc_00451896: mov ebx, [004010D4h] ; rtcTrimVar
  loc_0045189C: lea ecx, var_94
  loc_004518A2: lea edx, var_A4
  loc_004518A8: push ecx
  loc_004518A9: push edx
  loc_004518AA: mov var_70, esi
  loc_004518AD: mov var_8C, eax
  loc_004518B3: mov var_94, 00000008h
  loc_004518BD: call ebx
  loc_004518BF: lea eax, var_A4
  loc_004518C5: lea ecx, var_104
  loc_004518CB: push eax
  loc_004518CC: push ecx
  loc_004518CD: mov var_FC, 0041E5D4h
  loc_004518D7: mov var_104, 00008008h
  loc_004518E1: call [00401110h] ; __vbaVarTstEq
  loc_004518E7: lea ecx, var_80
  loc_004518EA: mov var_150, ax
  loc_004518F1: call [004012B0h] ; __vbaFreeObj
  loc_004518F7: lea edx, var_A4
  loc_004518FD: lea eax, var_94
  loc_00451903: push edx
  loc_00451904: push eax
  loc_00451905: push 00000002h
  loc_00451907: call [00401038h] ; __vbaFreeVarList
  loc_0045190D: add esp, 0000000Ch
  loc_00451910: cmp var_150, si
  loc_00451917: jz 004519C6h
  loc_0045191D: mov ecx, 0000000Ah
  loc_00451922: mov eax, 80020004h
  loc_00451927: mov var_C4, ecx
  loc_0045192D: mov var_B4, ecx
  loc_00451933: mov var_A4, ecx
  loc_00451939: lea edx, var_104
  loc_0045193F: lea ecx, var_94
  loc_00451945: mov var_BC, eax
  loc_0045194B: mov var_AC, eax
  loc_00451951: mov var_9C, eax
  loc_00451957: mov var_FC, 0041EC00h ; "Cann't Save Successfully. Please Agent Name!"
  loc_00451961: mov var_104, 00000008h
  loc_0045196B: call [00401240h] ; __vbaVarDup
  loc_00451971: lea ecx, var_C4
  loc_00451977: lea edx, var_B4
  loc_0045197D: push ecx
  loc_0045197E: lea eax, var_A4
  loc_00451984: push edx
  loc_00451985: push eax
  loc_00451986: lea ecx, var_94
  loc_0045198C: push 00000030h
  loc_0045198E: push ecx
  loc_0045198F: call [004010A4h] ; rtcMsgBox
  loc_00451995: lea edx, var_C4
  loc_0045199B: lea eax, var_B4
  loc_004519A1: push edx
  loc_004519A2: lea ecx, var_A4
  loc_004519A8: push eax
  loc_004519A9: lea edx, var_94
  loc_004519AF: push ecx
  loc_004519B0: push edx
  loc_004519B1: push 00000004h
  loc_004519B3: call [00401038h] ; __vbaFreeVarList
  loc_004519B9: add esp, 00000014h
  loc_004519BC: push 00453125h
  loc_004519C1: jmp 004530C7h
  loc_004519C6: mov eax, [edi]
  loc_004519C8: push edi
  loc_004519C9: call [eax+00000300h]
  loc_004519CF: lea ecx, var_80
  loc_004519D2: push eax
  loc_004519D3: push ecx
  loc_004519D4: call [004010A0h] ; __vbaObjSet
  loc_004519DA: mov edi, eax
  loc_004519DC: lea eax, var_70
  loc_004519DF: push eax
  loc_004519E0: push edi
  loc_004519E1: mov edx, [edi]
  loc_004519E3: call [edx+000000A0h]
  loc_004519E9: cmp eax, esi
  loc_004519EB: fnclex
  loc_004519ED: jge 00451A01h
  loc_004519EF: push 000000A0h
  loc_004519F4: push 0041E5E8h
  loc_004519F9: push edi
  loc_004519FA: push eax
  loc_004519FB: call [00401074h] ; __vbaHresultCheckObj
  loc_00451A01: mov ecx, var_70
  loc_00451A04: push 0041EC6Ch ; "Delete * From LG WHERE SrNo="
  loc_00451A09: push ecx
  loc_00451A0A: call [004011F4h] ; __vbaI4Str
  loc_00451A10: push eax
  loc_00451A11: call [00401018h] ; __vbaStrI4
  loc_00451A17: mov esi, [00401270h] ; __vbaStrMove
  loc_00451A1D: mov edx, eax
  loc_00451A1F: lea ecx, var_74
  loc_00451A22: call __vbaStrMove
  loc_00451A24: mov edi, [00401054h] ; __vbaStrCat
  loc_00451A2A: push eax
  loc_00451A2B: call edi
  loc_00451A2D: mov edx, eax
  loc_00451A2F: lea ecx, var_78
  loc_00451A32: call __vbaStrMove
  loc_00451A34: push eax
  loc_00451A35: push 0041ECACh ; " And OnCount='"
  loc_00451A3A: call edi
  loc_00451A3C: mov var_9C, eax
  loc_00451A42: lea edx, var_104
  loc_00451A48: lea eax, var_94
  loc_00451A4E: mov esi, 00004008h
  loc_00451A53: push edx
  loc_00451A54: push eax
  loc_00451A55: mov var_A4, 00000008h
  loc_00451A5F: mov var_FC, 0061A05Ch
  loc_00451A69: mov var_104, esi
  loc_00451A6F: call ebx
  loc_00451A71: lea ecx, var_124
  loc_00451A77: lea edx, var_D4
  loc_00451A7D: push ecx
  loc_00451A7E: push edx
  loc_00451A7F: mov var_10C, 0041ECD0h ; "' And AMPM='"
  loc_00451A89: mov var_114, 00000008h
  loc_00451A93: mov var_11C, 0061A060h
  loc_00451A9D: mov var_124, esi
  loc_00451AA3: call ebx
  loc_00451AA5: mov eax, [0061A13Ch]
  loc_00451AAA: mov edx, var_140
  loc_00451AB0: sub esp, 00000010h
  loc_00451AB3: mov var_12C, 0041E890h ; "'"
  loc_00451ABD: mov var_134, 00000008h
  loc_00451AC7: mov ebx, [eax]
  loc_00451AC9: mov ecx, esp
  loc_00451ACB: mov eax, 0000000Ah
  loc_00451AD0: mov esi, [004011B4h] ; __vbaVarCat
  loc_00451AD6: mov [ecx], eax
  loc_00451AD8: mov eax, 80020004h
  loc_00451ADD: mov [ecx+00000004h], edx
  loc_00451AE0: lea edx, var_94
  loc_00451AE6: mov [ecx+00000008h], eax
  loc_00451AE9: mov eax, var_138
  loc_00451AEF: mov [ecx+0000000Ch], eax
  loc_00451AF2: lea ecx, var_A4
  loc_00451AF8: push ecx
  loc_00451AF9: lea eax, var_B4
  loc_00451AFF: push edx
  loc_00451B00: push eax
  loc_00451B01: call __vbaVarCat
  loc_00451B03: lea ecx, var_114
  loc_00451B09: push eax
  loc_00451B0A: lea edx, var_C4
  loc_00451B10: push ecx
  loc_00451B11: push edx
  loc_00451B12: call __vbaVarCat
  loc_00451B14: push eax
  loc_00451B15: lea eax, var_D4
  loc_00451B1B: lea ecx, var_E4
  loc_00451B21: push eax
  loc_00451B22: push ecx
  loc_00451B23: call __vbaVarCat
  loc_00451B25: push eax
  loc_00451B26: lea edx, var_134
  loc_00451B2C: lea eax, var_F4
  loc_00451B32: push edx
  loc_00451B33: push eax
  loc_00451B34: call __vbaVarCat
  loc_00451B36: lea ecx, var_7C
  loc_00451B39: push eax
  loc_00451B3A: push ecx
  loc_00451B3B: call [004011B0h] ; __vbaStrVarVal
  loc_00451B41: mov edx, [0061A13Ch]
  loc_00451B47: push eax
  loc_00451B48: push edx
  loc_00451B49: call [ebx+0000005Ch]
  loc_00451B4C: test eax, eax
  loc_00451B4E: fnclex
  loc_00451B50: jge 00451B67h
  loc_00451B52: mov ecx, [0061A13Ch]
  loc_00451B58: push 0000005Ch
  loc_00451B5A: push 0041E928h
  loc_00451B5F: push ecx
  loc_00451B60: push eax
  loc_00451B61: call [00401074h] ; __vbaHresultCheckObj
  loc_00451B67: lea edx, var_7C
  loc_00451B6A: lea eax, var_78
  loc_00451B6D: push edx
  loc_00451B6E: lea ecx, var_74
  loc_00451B71: push eax
  loc_00451B72: lea edx, var_70
  loc_00451B75: push ecx
  loc_00451B76: push edx
  loc_00451B77: push 00000004h
  loc_00451B79: call [004011FCh] ; __vbaFreeStrList
  loc_00451B7F: add esp, 00000014h
  loc_00451B82: lea ecx, var_80
  loc_00451B85: call [004012B0h] ; __vbaFreeObj
  loc_00451B8B: lea eax, var_F4
  loc_00451B91: lea ecx, var_E4
  loc_00451B97: push eax
  loc_00451B98: lea edx, var_D4
  loc_00451B9E: push ecx
  loc_00451B9F: lea eax, var_C4
  loc_00451BA5: push edx
  loc_00451BA6: lea ecx, var_B4
  loc_00451BAC: push eax
  loc_00451BAD: lea edx, var_94
  loc_00451BB3: push ecx
  loc_00451BB4: lea eax, var_A4
  loc_00451BBA: push edx
  loc_00451BBB: push eax
  loc_00451BBC: push 00000007h
  loc_00451BBE: call [00401038h] ; __vbaFreeVarList
  loc_00451BC4: mov eax, Me
  loc_00451BC7: add esp, 00000020h
  loc_00451BCA: mov ecx, [eax]
  loc_00451BCC: push eax
  loc_00451BCD: call [ecx+00000300h]
  loc_00451BD3: lea edx, var_80
  loc_00451BD6: push eax
  loc_00451BD7: push edx
  loc_00451BD8: call [004010A0h] ; __vbaObjSet
  loc_00451BDE: mov ebx, eax
  loc_00451BE0: lea ecx, var_70
  loc_00451BE3: push ecx
  loc_00451BE4: push ebx
  loc_00451BE5: mov eax, [ebx]
  loc_00451BE7: call [eax+000000A0h]
  loc_00451BED: test eax, eax
  loc_00451BEF: fnclex
  loc_00451BF1: jge 00451C05h
  loc_00451BF3: push 000000A0h
  loc_00451BF8: push 0041E5E8h
  loc_00451BFD: push ebx
  loc_00451BFE: push eax
  loc_00451BFF: call [00401074h] ; __vbaHresultCheckObj
  loc_00451C05: mov edx, var_70
  loc_00451C08: push 0041ECF0h ; "Delete * From LGDetail WHERE SrNo="
  loc_00451C0D: push edx
  loc_00451C0E: call [004011F4h] ; __vbaI4Str
  loc_00451C14: push eax
  loc_00451C15: call [00401018h] ; __vbaStrI4
  loc_00451C1B: mov ebx, [00401270h] ; __vbaStrMove
  loc_00451C21: mov edx, eax
  loc_00451C23: lea ecx, var_74
  loc_00451C26: call ebx
  loc_00451C28: push eax
  loc_00451C29: call edi
  loc_00451C2B: mov edx, eax
  loc_00451C2D: lea ecx, var_78
  loc_00451C30: call ebx
  loc_00451C32: push eax
  loc_00451C33: push 0041ECACh ; " And OnCount='"
  loc_00451C38: call edi
  loc_00451C3A: mov edi, [004010D4h] ; rtcTrimVar
  loc_00451C40: mov var_9C, eax
  loc_00451C46: lea eax, var_104
  loc_00451C4C: lea ecx, var_94
  loc_00451C52: mov ebx, 00000008h
  loc_00451C57: push eax
  loc_00451C58: push ecx
  loc_00451C59: mov var_A4, ebx
  loc_00451C5F: mov var_FC, 0061A05Ch
  loc_00451C69: mov var_104, 00004008h
  loc_00451C73: call edi
  loc_00451C75: lea edx, var_124
  loc_00451C7B: lea eax, var_D4
  loc_00451C81: push edx
  loc_00451C82: push eax
  loc_00451C83: mov var_10C, 0041ECD0h ; "' And AMPM='"
  loc_00451C8D: mov var_114, ebx
  loc_00451C93: mov var_11C, 0061A060h
  loc_00451C9D: mov var_124, 00004008h
  loc_00451CA7: call edi
  loc_00451CA9: mov ecx, [0061A13Ch]
  loc_00451CAF: sub esp, 00000010h
  loc_00451CB2: mov edx, esp
  loc_00451CB4: mov eax, 0000000Ah
  loc_00451CB9: mov var_12C, 0041E890h ; "'"
  loc_00451CC3: mov var_134, ebx
  loc_00451CC9: mov edi, [ecx]
  loc_00451CCB: mov ecx, var_138
  loc_00451CD1: mov [edx], eax
  loc_00451CD3: mov eax, var_140
  loc_00451CD9: mov [edx+00000004h], eax
  loc_00451CDC: mov eax, 80020004h
  loc_00451CE1: mov [edx+00000008h], eax
  loc_00451CE4: lea eax, var_94
  loc_00451CEA: mov [edx+0000000Ch], ecx
  loc_00451CED: lea edx, var_A4
  loc_00451CF3: push edx
  loc_00451CF4: lea ecx, var_B4
  loc_00451CFA: push eax
  loc_00451CFB: push ecx
  loc_00451CFC: call __vbaVarCat
  loc_00451CFE: push eax
  loc_00451CFF: lea edx, var_114
  loc_00451D05: lea eax, var_C4
  loc_00451D0B: push edx
  loc_00451D0C: push eax
  loc_00451D0D: call __vbaVarCat
  loc_00451D0F: lea ecx, var_D4
  loc_00451D15: push eax
  loc_00451D16: lea edx, var_E4
  loc_00451D1C: push ecx
  loc_00451D1D: push edx
  loc_00451D1E: call __vbaVarCat
  loc_00451D20: push eax
  loc_00451D21: lea eax, var_134
  loc_00451D27: lea ecx, var_F4
  loc_00451D2D: push eax
  loc_00451D2E: push ecx
  loc_00451D2F: call __vbaVarCat
  loc_00451D31: lea edx, var_7C
  loc_00451D34: push eax
  loc_00451D35: push edx
  loc_00451D36: call [004011B0h] ; __vbaStrVarVal
  loc_00451D3C: push eax
  loc_00451D3D: mov eax, [0061A13Ch]
  loc_00451D42: push eax
  loc_00451D43: call [edi+0000005Ch]
  loc_00451D46: test eax, eax
  loc_00451D48: fnclex
  loc_00451D4A: jge 00451D61h
  loc_00451D4C: mov ecx, [0061A13Ch]
  loc_00451D52: push 0000005Ch
  loc_00451D54: push 0041E928h
  loc_00451D59: push ecx
  loc_00451D5A: push eax
  loc_00451D5B: call [00401074h] ; __vbaHresultCheckObj
  loc_00451D61: lea edx, var_7C
  loc_00451D64: lea eax, var_78
  loc_00451D67: push edx
  loc_00451D68: lea ecx, var_74
  loc_00451D6B: push eax
  loc_00451D6C: lea edx, var_70
  loc_00451D6F: push ecx
  loc_00451D70: push edx
  loc_00451D71: push 00000004h
  loc_00451D73: call [004011FCh] ; __vbaFreeStrList
  loc_00451D79: add esp, 00000014h
  loc_00451D7C: lea ecx, var_80
  loc_00451D7F: call [004012B0h] ; __vbaFreeObj
  loc_00451D85: lea eax, var_F4
  loc_00451D8B: lea ecx, var_E4
  loc_00451D91: push eax
  loc_00451D92: lea edx, var_D4
  loc_00451D98: push ecx
  loc_00451D99: lea eax, var_C4
  loc_00451D9F: push edx
  loc_00451DA0: lea ecx, var_B4
  loc_00451DA6: push eax
  loc_00451DA7: lea edx, var_94
  loc_00451DAD: push ecx
  loc_00451DAE: lea eax, var_A4
  loc_00451DB4: push edx
  loc_00451DB5: push eax
  loc_00451DB6: push 00000007h
  loc_00451DB8: call [00401038h] ; __vbaFreeVarList
  loc_00451DBE: add esp, 00000020h
  loc_00451DC1: lea ebx, var_80
  loc_00451DC4: mov ecx, 0000000Ah
  loc_00451DC9: mov eax, 80020004h
  loc_00451DCE: push ebx
  loc_00451DCF: mov var_124, ecx
  loc_00451DD5: sub esp, 00000010h
  loc_00451DD8: mov esi, ecx
  loc_00451DDA: mov ebx, esp
  loc_00451DDC: sub esp, 00000010h
  loc_00451DDF: mov var_11C, eax
  loc_00451DE5: mov edx, eax
  loc_00451DE7: mov [ebx], ecx
  loc_00451DE9: mov ecx, var_120
  loc_00451DEF: mov var_10C, edx
  loc_00451DF5: mov var_104, 00000003h
  loc_00451DFF: mov [ebx+00000004h], ecx
  loc_00451E02: mov ecx, esp
  loc_00451E04: sub esp, 00000010h
  loc_00451E07: mov edi, [0061A13Ch]
  loc_00451E0D: mov [ebx+00000008h], eax
  loc_00451E10: mov eax, var_118
  loc_00451E16: mov var_FC, 00000002h
  loc_00451E20: mov var_114, esi
  loc_00451E26: mov [ebx+0000000Ch], eax
  loc_00451E29: mov eax, var_110
  loc_00451E2F: mov [ecx], esi
  loc_00451E31: mov edi, [edi]
  loc_00451E33: mov [ecx+00000004h], eax
  loc_00451E36: mov eax, esp
  loc_00451E38: push 0041ED3Ch ; "Select * From LG"
  loc_00451E3D: mov [ecx+00000008h], edx
  loc_00451E40: mov edx, var_108
  loc_00451E46: mov [ecx+0000000Ch], edx
  loc_00451E49: mov ecx, var_104
  loc_00451E4F: mov edx, var_100
  loc_00451E55: mov [eax], ecx
  loc_00451E57: mov ecx, var_FC
  loc_00451E5D: mov [eax+00000004h], edx
  loc_00451E60: mov edx, var_F8
  loc_00451E66: mov [eax+00000008h], ecx
  loc_00451E69: mov [eax+0000000Ch], edx
  loc_00451E6C: mov eax, [0061A13Ch]
  loc_00451E71: push eax
  loc_00451E72: call [edi+000000BCh]
  loc_00451E78: test eax, eax
  loc_00451E7A: fnclex
  loc_00451E7C: jge 00451E96h
  loc_00451E7E: mov ecx, [0061A13Ch]
  loc_00451E84: push 000000BCh
  loc_00451E89: push 0041E928h
  loc_00451E8E: push ecx
  loc_00451E8F: push eax
  loc_00451E90: call [00401074h] ; __vbaHresultCheckObj
  loc_00451E96: mov eax, var_80
  loc_00451E99: mov edi, [004010A0h] ; __vbaObjSet
  loc_00451E9F: lea edx, var_40
  loc_00451EA2: push eax
  loc_00451EA3: push edx
  loc_00451EA4: mov var_80, 00000000h
  loc_00451EAB: call edi
  loc_00451EAD: lea ebx, var_80
  loc_00451EB0: mov ecx, 0000000Ah
  loc_00451EB5: push ebx
  loc_00451EB6: mov var_124, ecx
  loc_00451EBC: sub esp, 00000010h
  loc_00451EBF: mov var_114, ecx
  loc_00451EC5: mov ebx, esp
  loc_00451EC7: mov eax, 80020004h
  loc_00451ECC: mov var_11C, eax
  loc_00451ED2: mov edx, eax
  loc_00451ED4: mov [ebx], ecx
  loc_00451ED6: mov ecx, var_120
  loc_00451EDC: sub esp, 00000010h
  loc_00451EDF: mov var_10C, edx
  loc_00451EE5: mov [ebx+00000004h], ecx
  loc_00451EE8: mov ecx, esp
  loc_00451EEA: sub esp, 00000010h
  loc_00451EED: mov var_104, 00000003h
  loc_00451EF7: mov [ebx+00000008h], eax
  loc_00451EFA: mov eax, var_118
  loc_00451F00: mov esi, [0061A13Ch]
  loc_00451F06: mov var_FC, 00000002h
  loc_00451F10: mov [ebx+0000000Ch], eax
  loc_00451F13: mov eax, var_114
  loc_00451F19: mov [ecx], eax
  loc_00451F1B: mov eax, var_110
  loc_00451F21: mov esi, [esi]
  loc_00451F23: mov [ecx+00000004h], eax
  loc_00451F26: mov eax, esp
  loc_00451F28: push 0041ED64h ; "Select * From LGDetail"
  loc_00451F2D: mov [ecx+00000008h], edx
  loc_00451F30: mov edx, var_108
  loc_00451F36: mov [ecx+0000000Ch], edx
  loc_00451F39: mov ecx, var_104
  loc_00451F3F: mov edx, var_100
  loc_00451F45: mov [eax], ecx
  loc_00451F47: mov ecx, var_FC
  loc_00451F4D: mov [eax+00000004h], edx
  loc_00451F50: mov edx, var_F8
  loc_00451F56: mov [eax+00000008h], ecx
  loc_00451F59: mov [eax+0000000Ch], edx
  loc_00451F5C: mov eax, [0061A13Ch]
  loc_00451F61: push eax
  loc_00451F62: call [esi+000000BCh]
  loc_00451F68: xor esi, esi
  loc_00451F6A: cmp eax, esi
  loc_00451F6C: fnclex
  loc_00451F6E: jge 00451F8Ch
  loc_00451F70: mov ecx, [0061A13Ch]
  loc_00451F76: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00451F7C: push 000000BCh
  loc_00451F81: push 0041E928h
  loc_00451F86: push ecx
  loc_00451F87: push eax
  loc_00451F88: call ebx
  loc_00451F8A: jmp 00451F92h
  loc_00451F8C: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00451F92: mov eax, var_80
  loc_00451F95: lea edx, var_48
  loc_00451F98: push eax
  loc_00451F99: push edx
  loc_00451F9A: mov var_80, esi
  loc_00451F9D: call edi
  loc_00451F9F: mov eax, 00000002h
  loc_00451FA4: lea ecx, var_114
  loc_00451FAA: mov var_104, eax
  loc_00451FB0: mov var_114, eax
  loc_00451FB6: mov var_124, eax
  loc_00451FBC: lea eax, var_104
  loc_00451FC2: push eax
  loc_00451FC3: lea edx, var_124
  loc_00451FC9: push ecx
  loc_00451FCA: lea eax, var_178
  loc_00451FD0: push edx
  loc_00451FD1: lea ecx, var_168
  loc_00451FD7: push eax
  loc_00451FD8: lea edx, var_24
  loc_00451FDB: push ecx
  loc_00451FDC: push edx
  loc_00451FDD: mov var_FC, 00000001h
  loc_00451FE7: mov var_10C, 00000063h
  loc_00451FF1: mov var_11C, esi
  loc_00451FF7: call [00401098h] ; __vbaVarForInit
  loc_00451FFD: test eax, eax
  loc_00451FFF: jz 00452ED5h
  loc_00452005: mov eax, Me
  loc_00452008: push eax
  loc_00452009: mov ecx, [eax]
  loc_0045200B: call [ecx+00000318h]
  loc_00452011: lea edx, var_80
  loc_00452014: push eax
  loc_00452015: push edx
  loc_00452016: call edi
  loc_00452018: mov esi, eax
  loc_0045201A: lea eax, var_84
  loc_00452020: lea ecx, var_24
  loc_00452023: push eax
  loc_00452024: mov edi, [esi]
  loc_00452026: push ecx
  loc_00452027: call [004011C0h] ; __vbaI2Var
  loc_0045202D: push eax
  loc_0045202E: push esi
  loc_0045202F: call [edi+00000040h]
  loc_00452032: test eax, eax
  loc_00452034: fnclex
  loc_00452036: jge 00452043h
  loc_00452038: push 00000040h
  loc_0045203A: push 0041E5D8h
  loc_0045203F: push esi
  loc_00452040: push eax
  loc_00452041: call ebx
  loc_00452043: mov eax, var_84
  loc_00452049: lea ecx, var_70
  loc_0045204C: push ecx
  loc_0045204D: push eax
  loc_0045204E: mov edx, [eax]
  loc_00452050: mov esi, eax
  loc_00452052: call [edx+000000A0h]
  loc_00452058: test eax, eax
  loc_0045205A: fnclex
  loc_0045205C: jge 0045206Ch
  loc_0045205E: push 000000A0h
  loc_00452063: push 0041E5E8h
  loc_00452068: push esi
  loc_00452069: push eax
  loc_0045206A: call ebx
  loc_0045206C: mov edx, var_70
  loc_0045206F: push edx
  loc_00452070: push 0041E5D4h
  loc_00452075: call [0040110Ch] ; __vbaStrCmp
  loc_0045207B: mov esi, eax
  loc_0045207D: lea ecx, var_70
  loc_00452080: neg esi
  loc_00452082: sbb esi, esi
  loc_00452084: neg esi
  loc_00452086: neg esi
  loc_00452088: call [004012ACh] ; __vbaFreeStr
  loc_0045208E: lea eax, var_84
  loc_00452094: lea ecx, var_80
  loc_00452097: push eax
  loc_00452098: push ecx
  loc_00452099: push 00000002h
  loc_0045209B: call [00401040h] ; __vbaFreeObjList
  loc_004520A1: add esp, 0000000Ch
  loc_004520A4: test si, si
  loc_004520A7: jz 00452EACh
  loc_004520AD: mov eax, var_40
  loc_004520B0: push eax
  loc_004520B1: mov edx, [eax]
  loc_004520B3: call [edx+000000C0h]
  loc_004520B9: test eax, eax
  loc_004520BB: fnclex
  loc_004520BD: jge 004520D4h
  loc_004520BF: mov ecx, var_40
  loc_004520C2: push 000000C0h
  loc_004520C7: push 0041E938h
  loc_004520CC: push ecx
  loc_004520CD: push eax
  loc_004520CE: call [00401074h] ; __vbaHresultCheckObj
  loc_004520D4: mov ebx, var_24
  loc_004520D7: sub esp, 00000010h
  loc_004520DA: mov edi, esp
  loc_004520DC: sub esp, 00000010h
  loc_004520DF: mov edx, var_40
  loc_004520E2: mov ecx, 00000008h
  loc_004520E7: mov [edi], ebx
  loc_004520E9: mov ebx, var_20
  loc_004520EC: mov var_104, ecx
  loc_004520F2: mov eax, 0041ED98h ; "AgentID"
  loc_004520F7: mov [edi+00000004h], ebx
  loc_004520FA: mov ebx, var_1C
  loc_004520FD: mov var_FC, eax
  loc_00452103: mov esi, [edx]
  loc_00452105: mov [edi+00000008h], ebx
  loc_00452108: mov ebx, var_18
  loc_0045210B: mov [edi+0000000Ch], ebx
  loc_0045210E: mov edi, esp
  loc_00452110: push edx
  loc_00452111: mov [edi], ecx
  loc_00452113: mov ecx, var_100
  loc_00452119: mov [edi+00000004h], ecx
  loc_0045211C: mov [edi+00000008h], eax
  loc_0045211F: mov eax, var_F8
  loc_00452125: mov [edi+0000000Ch], eax
  loc_00452128: call [esi+00000128h]
  loc_0045212E: test eax, eax
  loc_00452130: fnclex
  loc_00452132: jge 00452149h
  loc_00452134: mov ecx, var_40
  loc_00452137: push 00000128h
  loc_0045213C: push 0041E938h
  loc_00452141: push ecx
  loc_00452142: push eax
  loc_00452143: call [00401074h] ; __vbaHresultCheckObj
  loc_00452149: mov eax, Me
  loc_0045214C: push eax
  loc_0045214D: mov edx, [eax]
  loc_0045214F: call [edx+00000310h]
  loc_00452155: push eax
  loc_00452156: lea eax, var_80
  loc_00452159: push eax
  loc_0045215A: call [004010A0h] ; __vbaObjSet
  loc_00452160: mov esi, eax
  loc_00452162: lea edx, var_70
  loc_00452165: push edx
  loc_00452166: push esi
  loc_00452167: mov ecx, [esi]
  loc_00452169: call [ecx+000000A0h]
  loc_0045216F: test eax, eax
  loc_00452171: fnclex
  loc_00452173: jge 00452187h
  loc_00452175: push 000000A0h
  loc_0045217A: push 0041E5E8h
  loc_0045217F: push esi
  loc_00452180: push eax
  loc_00452181: call [00401074h] ; __vbaHresultCheckObj
  loc_00452187: sub esp, 00000010h
  loc_0045218A: mov eax, var_70
  loc_0045218D: mov ebx, esp
  loc_0045218F: mov ecx, 00000008h
  loc_00452194: mov var_94, ecx
  loc_0045219A: mov esi, ecx
  loc_0045219C: mov [ebx], ecx
  loc_0045219E: mov ecx, var_90
  loc_004521A4: sub esp, 00000010h
  loc_004521A7: mov var_8C, eax
  loc_004521AD: mov [ebx+00000004h], ecx
  loc_004521B0: mov edi, var_40
  loc_004521B3: mov ecx, esp
  loc_004521B5: mov edx, 0041EB18h ; "AgentName"
  loc_004521BA: mov [ebx+00000008h], eax
  loc_004521BD: mov eax, var_88
  loc_004521C3: mov var_70, 00000000h
  loc_004521CA: mov var_FC, edx
  loc_004521D0: mov [ebx+0000000Ch], eax
  loc_004521D3: mov eax, var_100
  loc_004521D9: mov [ecx], esi
  loc_004521DB: mov var_104, esi
  loc_004521E1: mov edi, [edi]
  loc_004521E3: mov [ecx+00000004h], eax
  loc_004521E6: mov eax, var_40
  loc_004521E9: push eax
  loc_004521EA: mov [ecx+00000008h], edx
  loc_004521ED: mov edx, var_F8
  loc_004521F3: mov [ecx+0000000Ch], edx
  loc_004521F6: call [edi+00000128h]
  loc_004521FC: test eax, eax
  loc_004521FE: fnclex
  loc_00452200: jge 00452217h
  loc_00452202: mov ecx, var_40
  loc_00452205: push 00000128h
  loc_0045220A: push 0041E938h
  loc_0045220F: push ecx
  loc_00452210: push eax
  loc_00452211: call [00401074h] ; __vbaHresultCheckObj
  loc_00452217: lea ecx, var_80
  loc_0045221A: call [004012B0h] ; __vbaFreeObj
  loc_00452220: lea ecx, var_94
  loc_00452226: call [00401020h] ; __vbaFreeVar
  loc_0045222C: sub esp, 00000010h
  loc_0045222F: mov eax, [0061A05Ch]
  loc_00452234: mov ebx, esp
  loc_00452236: mov ecx, 00000008h
  loc_0045223B: mov var_114, ecx
  loc_00452241: mov esi, ecx
  loc_00452243: mov [ebx], ecx
  loc_00452245: mov ecx, var_110
  loc_0045224B: sub esp, 00000010h
  loc_0045224E: mov var_10C, eax
  loc_00452254: mov [ebx+00000004h], ecx
  loc_00452257: mov edi, var_40
  loc_0045225A: mov ecx, esp
  loc_0045225C: mov edx, 0041EDACh ; "OnCount"
  loc_00452261: mov [ebx+00000008h], eax
  loc_00452264: mov eax, var_108
  loc_0045226A: mov var_FC, edx
  loc_00452270: mov var_104, esi
  loc_00452276: mov edi, [edi]
  loc_00452278: mov [ebx+0000000Ch], eax
  loc_0045227B: mov eax, var_100
  loc_00452281: mov [ecx], esi
  loc_00452283: mov [ecx+00000004h], eax
  loc_00452286: mov eax, var_40
  loc_00452289: push eax
  loc_0045228A: mov [ecx+00000008h], edx
  loc_0045228D: mov edx, var_F8
  loc_00452293: mov [ecx+0000000Ch], edx
  loc_00452296: call [edi+00000128h]
  loc_0045229C: test eax, eax
  loc_0045229E: fnclex
  loc_004522A0: jge 004522B7h
  loc_004522A2: mov ecx, var_40
  loc_004522A5: push 00000128h
  loc_004522AA: push 0041E938h
  loc_004522AF: push ecx
  loc_004522B0: push eax
  loc_004522B1: call [00401074h] ; __vbaHresultCheckObj
  loc_004522B7: mov dl, [0061A130h]
  loc_004522BD: sub esp, 00000010h
  loc_004522C0: mov ebx, esp
  loc_004522C2: mov eax, 00000011h
  loc_004522C7: mov var_114, eax
  loc_004522CD: mov var_10C, dl
  loc_004522D3: mov [ebx], eax
  loc_004522D5: mov eax, var_110
  loc_004522DB: sub esp, 00000010h
  loc_004522DE: mov esi, var_40
  loc_004522E1: mov [ebx+00000004h], eax
  loc_004522E4: mov eax, var_10C
  loc_004522EA: mov edx, 00000008h
  loc_004522EF: mov ecx, 0041EDC0h ; "MachineID"
  loc_004522F4: mov [ebx+00000008h], eax
  loc_004522F7: mov eax, var_108
  loc_004522FD: mov var_104, edx
  loc_00452303: mov var_FC, ecx
  loc_00452309: mov [ebx+0000000Ch], eax
  loc_0045230C: mov eax, esp
  loc_0045230E: mov edi, [esi]
  loc_00452310: push esi
  loc_00452311: mov [eax], edx
  loc_00452313: mov edx, var_100
  loc_00452319: mov [eax+00000004h], edx
  loc_0045231C: mov [eax+00000008h], ecx
  loc_0045231F: mov ecx, var_F8
  loc_00452325: mov [eax+0000000Ch], ecx
  loc_00452328: call [edi+00000128h]
  loc_0045232E: test eax, eax
  loc_00452330: fnclex
  loc_00452332: jge 00452349h
  loc_00452334: mov edx, var_40
  loc_00452337: push 00000128h
  loc_0045233C: push 0041E938h
  loc_00452341: push edx
  loc_00452342: push eax
  loc_00452343: call [00401074h] ; __vbaHresultCheckObj
  loc_00452349: mov eax, Me
  loc_0045234C: push eax
  loc_0045234D: mov ecx, [eax]
  loc_0045234F: call [ecx+00000300h]
  loc_00452355: lea edx, var_80
  loc_00452358: push eax
  loc_00452359: push edx
  loc_0045235A: call [004010A0h] ; __vbaObjSet
  loc_00452360: mov esi, eax
  loc_00452362: lea ecx, var_70
  loc_00452365: push ecx
  loc_00452366: push esi
  loc_00452367: mov eax, [esi]
  loc_00452369: call [eax+000000A0h]
  loc_0045236F: test eax, eax
  loc_00452371: fnclex
  loc_00452373: jge 00452387h
  loc_00452375: push 000000A0h
  loc_0045237A: push 0041E5E8h
  loc_0045237F: push esi
  loc_00452380: push eax
  loc_00452381: call [00401074h] ; __vbaHresultCheckObj
  loc_00452387: mov edx, var_70
  loc_0045238A: push edx
  loc_0045238B: call [004011F4h] ; __vbaI4Str
  loc_00452391: sub esp, 00000010h
  loc_00452394: mov ecx, 00000003h
  loc_00452399: mov ebx, esp
  loc_0045239B: mov var_114, ecx
  loc_004523A1: sub esp, 00000010h
  loc_004523A4: mov var_10C, eax
  loc_004523AA: mov [ebx], ecx
  loc_004523AC: mov ecx, var_110
  loc_004523B2: mov edi, var_40
  loc_004523B5: mov esi, 00000008h
  loc_004523BA: mov [ebx+00000004h], ecx
  loc_004523BD: mov ecx, esp
  loc_004523BF: mov edx, 0041EDD8h ; "SrNo"
  loc_004523C4: mov var_104, esi
  loc_004523CA: mov [ebx+00000008h], eax
  loc_004523CD: mov eax, var_108
  loc_004523D3: mov var_FC, edx
  loc_004523D9: mov edi, [edi]
  loc_004523DB: mov [ebx+0000000Ch], eax
  loc_004523DE: mov eax, var_100
  loc_004523E4: mov [ecx], esi
  loc_004523E6: mov [ecx+00000004h], eax
  loc_004523E9: mov eax, var_40
  loc_004523EC: push eax
  loc_004523ED: mov [ecx+00000008h], edx
  loc_004523F0: mov edx, var_F8
  loc_004523F6: mov [ecx+0000000Ch], edx
  loc_004523F9: call [edi+00000128h]
  loc_004523FF: test eax, eax
  loc_00452401: fnclex
  loc_00452403: jge 0045241Ah
  loc_00452405: mov ecx, var_40
  loc_00452408: push 00000128h
  loc_0045240D: push 0041E938h
  loc_00452412: push ecx
  loc_00452413: push eax
  loc_00452414: call [00401074h] ; __vbaHresultCheckObj
  loc_0045241A: lea ecx, var_70
  loc_0045241D: call [004012ACh] ; __vbaFreeStr
  loc_00452423: lea ecx, var_80
  loc_00452426: call [004012B0h] ; __vbaFreeObj
  loc_0045242C: lea edx, var_104
  loc_00452432: lea eax, var_94
  loc_00452438: push edx
  loc_00452439: push eax
  loc_0045243A: mov var_FC, 0061A060h
  loc_00452444: mov var_104, 00004008h
  loc_0045244E: call [004010D4h] ; rtcTrimVar
  loc_00452454: mov ebx, var_94
  loc_0045245A: sub esp, 00000010h
  loc_0045245D: mov edi, esp
  loc_0045245F: sub esp, 00000010h
  loc_00452462: mov edx, var_40
  loc_00452465: mov ecx, 00000008h
  loc_0045246A: mov [edi], ebx
  loc_0045246C: mov ebx, var_90
  loc_00452472: mov var_114, ecx
  loc_00452478: mov eax, 0041EDE8h ; "AMPM"
  loc_0045247D: mov [edi+00000004h], ebx
  loc_00452480: mov ebx, var_8C
  loc_00452486: mov var_10C, eax
  loc_0045248C: mov esi, [edx]
  loc_0045248E: mov [edi+00000008h], ebx
  loc_00452491: mov ebx, var_88
  loc_00452497: mov [edi+0000000Ch], ebx
  loc_0045249A: mov edi, esp
  loc_0045249C: push edx
  loc_0045249D: mov [edi], ecx
  loc_0045249F: mov ecx, var_110
  loc_004524A5: mov [edi+00000004h], ecx
  loc_004524A8: mov [edi+00000008h], eax
  loc_004524AB: mov eax, var_108
  loc_004524B1: mov [edi+0000000Ch], eax
  loc_004524B4: call [esi+00000128h]
  loc_004524BA: test eax, eax
  loc_004524BC: fnclex
  loc_004524BE: jge 004524D9h
  loc_004524C0: mov ecx, var_40
  loc_004524C3: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004524C9: push 00000128h
  loc_004524CE: push 0041E938h
  loc_004524D3: push ecx
  loc_004524D4: push eax
  loc_004524D5: call edi
  loc_004524D7: jmp 004524DFh
  loc_004524D9: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004524DF: lea ecx, var_94
  loc_004524E5: call [00401020h] ; __vbaFreeVar
  loc_004524EB: lea edx, var_24
  loc_004524EE: push edx
  loc_004524EF: call [0040127Ch] ; __vbaStrVarCopy
  loc_004524F5: mov esi, [00401270h] ; __vbaStrMove
  loc_004524FB: mov edx, eax
  loc_004524FD: lea ecx, var_28
  loc_00452500: call __vbaStrMove
  loc_00452502: mov eax, var_28
  loc_00452505: push eax
  loc_00452506: call [0040102Ch] ; __vbaLenBstr
  loc_0045250C: cmp eax, 00000001h
  loc_0045250F: jnz 00452527h
  loc_00452511: mov ecx, var_28
  loc_00452514: push 0041EDF8h
  loc_00452519: push ecx
  loc_0045251A: call [00401054h] ; __vbaStrCat
  loc_00452520: mov edx, eax
  loc_00452522: lea ecx, var_28
  loc_00452525: call __vbaStrMove
  loc_00452527: mov eax, Me
  loc_0045252A: push eax
  loc_0045252B: mov edx, [eax]
  loc_0045252D: call [edx+00000318h]
  loc_00452533: push eax
  loc_00452534: lea eax, var_80
  loc_00452537: push eax
  loc_00452538: call [004010A0h] ; __vbaObjSet
  loc_0045253E: lea ecx, var_84
  loc_00452544: mov esi, eax
  loc_00452546: lea edx, var_24
  loc_00452549: push ecx
  loc_0045254A: mov ebx, [esi]
  loc_0045254C: push edx
  loc_0045254D: call [004011C0h] ; __vbaI2Var
  loc_00452553: push eax
  loc_00452554: push esi
  loc_00452555: call [ebx+00000040h]
  loc_00452558: test eax, eax
  loc_0045255A: fnclex
  loc_0045255C: jge 00452569h
  loc_0045255E: push 00000040h
  loc_00452560: push 0041E5D8h
  loc_00452565: push esi
  loc_00452566: push eax
  loc_00452567: call edi
  loc_00452569: mov eax, var_84
  loc_0045256F: lea edx, var_70
  loc_00452572: push edx
  loc_00452573: push eax
  loc_00452574: mov ecx, [eax]
  loc_00452576: mov esi, eax
  loc_00452578: call [ecx+000000A0h]
  loc_0045257E: test eax, eax
  loc_00452580: fnclex
  loc_00452582: jge 00452592h
  loc_00452584: push 000000A0h
  loc_00452589: push 0041E5E8h
  loc_0045258E: push esi
  loc_0045258F: push eax
  loc_00452590: call edi
  loc_00452592: mov eax, var_28
  loc_00452595: mov ecx, var_70
  loc_00452598: push eax
  loc_00452599: push ecx
  loc_0045259A: call [00401054h] ; __vbaStrCat
  loc_004525A0: sub esp, 00000010h
  loc_004525A3: mov ecx, 00000008h
  loc_004525A8: mov ebx, esp
  loc_004525AA: mov var_94, ecx
  loc_004525B0: mov esi, ecx
  loc_004525B2: sub esp, 00000010h
  loc_004525B5: mov [ebx], ecx
  loc_004525B7: mov ecx, var_90
  loc_004525BD: mov var_8C, eax
  loc_004525C3: mov edi, var_40
  loc_004525C6: mov [ebx+00000004h], ecx
  loc_004525C9: mov ecx, esp
  loc_004525CB: mov edx, 0041EE00h ; "Num"
  loc_004525D0: mov var_104, esi
  loc_004525D6: mov [ebx+00000008h], eax
  loc_004525D9: mov eax, var_88
  loc_004525DF: mov var_FC, edx
  loc_004525E5: mov edi, [edi]
  loc_004525E7: mov [ebx+0000000Ch], eax
  loc_004525EA: mov eax, var_100
  loc_004525F0: mov [ecx], esi
  loc_004525F2: mov [ecx+00000004h], eax
  loc_004525F5: mov eax, var_40
  loc_004525F8: push eax
  loc_004525F9: mov [ecx+00000008h], edx
  loc_004525FC: mov edx, var_F8
  loc_00452602: mov [ecx+0000000Ch], edx
  loc_00452605: call [edi+00000128h]
  loc_0045260B: test eax, eax
  loc_0045260D: fnclex
  loc_0045260F: jge 00452626h
  loc_00452611: mov ecx, var_40
  loc_00452614: push 00000128h
  loc_00452619: push 0041E938h
  loc_0045261E: push ecx
  loc_0045261F: push eax
  loc_00452620: call [00401074h] ; __vbaHresultCheckObj
  loc_00452626: lea ecx, var_70
  loc_00452629: call [004012ACh] ; __vbaFreeStr
  loc_0045262F: lea edx, var_84
  loc_00452635: lea eax, var_80
  loc_00452638: push edx
  loc_00452639: push eax
  loc_0045263A: push 00000002h
  loc_0045263C: call [00401040h] ; __vbaFreeObjList
  loc_00452642: add esp, 0000000Ch
  loc_00452645: lea ecx, var_94
  loc_0045264B: call [00401020h] ; __vbaFreeVar
  loc_00452651: mov eax, var_48
  loc_00452654: push eax
  loc_00452655: mov ecx, [eax]
  loc_00452657: call [ecx+000000C0h]
  loc_0045265D: test eax, eax
  loc_0045265F: fnclex
  loc_00452661: jge 00452678h
  loc_00452663: mov edx, var_48
  loc_00452666: push 000000C0h
  loc_0045266B: push 0041E938h
  loc_00452670: push edx
  loc_00452671: push eax
  loc_00452672: call [00401074h] ; __vbaHresultCheckObj
  loc_00452678: sub esp, 00000010h
  loc_0045267B: mov eax, [0061A05Ch]
  loc_00452680: mov ebx, esp
  loc_00452682: mov ecx, 00000008h
  loc_00452687: mov var_114, ecx
  loc_0045268D: mov esi, ecx
  loc_0045268F: mov [ebx], ecx
  loc_00452691: mov ecx, var_110
  loc_00452697: sub esp, 00000010h
  loc_0045269A: mov var_10C, eax
  loc_004526A0: mov [ebx+00000004h], ecx
  loc_004526A3: mov edi, var_48
  loc_004526A6: mov ecx, esp
  loc_004526A8: mov edx, 0041EDACh ; "OnCount"
  loc_004526AD: mov [ebx+00000008h], eax
  loc_004526B0: mov eax, var_108
  loc_004526B6: mov var_FC, edx
  loc_004526BC: mov var_104, esi
  loc_004526C2: mov edi, [edi]
  loc_004526C4: mov [ebx+0000000Ch], eax
  loc_004526C7: mov eax, var_100
  loc_004526CD: mov [ecx], esi
  loc_004526CF: mov [ecx+00000004h], eax
  loc_004526D2: mov eax, var_48
  loc_004526D5: push eax
  loc_004526D6: mov [ecx+00000008h], edx
  loc_004526D9: mov edx, var_F8
  loc_004526DF: mov [ecx+0000000Ch], edx
  loc_004526E2: call [edi+00000128h]
  loc_004526E8: test eax, eax
  loc_004526EA: fnclex
  loc_004526EC: jge 00452703h
  loc_004526EE: mov ecx, var_48
  loc_004526F1: push 00000128h
  loc_004526F6: push 0041E938h
  loc_004526FB: push ecx
  loc_004526FC: push eax
  loc_004526FD: call [00401074h] ; __vbaHresultCheckObj
  loc_00452703: mov ebx, var_24
  loc_00452706: sub esp, 00000010h
  loc_00452709: mov edi, esp
  loc_0045270B: sub esp, 00000010h
  loc_0045270E: mov edx, var_48
  loc_00452711: mov ecx, 00000008h
  loc_00452716: mov [edi], ebx
  loc_00452718: mov ebx, var_20
  loc_0045271B: mov var_104, ecx
  loc_00452721: mov eax, 0041ED98h ; "AgentID"
  loc_00452726: mov [edi+00000004h], ebx
  loc_00452729: mov ebx, var_1C
  loc_0045272C: mov var_FC, eax
  loc_00452732: mov esi, [edx]
  loc_00452734: mov [edi+00000008h], ebx
  loc_00452737: mov ebx, var_18
  loc_0045273A: mov [edi+0000000Ch], ebx
  loc_0045273D: mov edi, esp
  loc_0045273F: push edx
  loc_00452740: mov [edi], ecx
  loc_00452742: mov ecx, var_100
  loc_00452748: mov [edi+00000004h], ecx
  loc_0045274B: mov [edi+00000008h], eax
  loc_0045274E: mov eax, var_F8
  loc_00452754: mov [edi+0000000Ch], eax
  loc_00452757: call [esi+00000128h]
  loc_0045275D: test eax, eax
  loc_0045275F: fnclex
  loc_00452761: jge 00452778h
  loc_00452763: mov ecx, var_48
  loc_00452766: push 00000128h
  loc_0045276B: push 0041E938h
  loc_00452770: push ecx
  loc_00452771: push eax
  loc_00452772: call [00401074h] ; __vbaHresultCheckObj
  loc_00452778: mov eax, Me
  loc_0045277B: push eax
  loc_0045277C: mov edx, [eax]
  loc_0045277E: call [edx+00000310h]
  loc_00452784: push eax
  loc_00452785: lea eax, var_80
  loc_00452788: push eax
  loc_00452789: call [004010A0h] ; __vbaObjSet
  loc_0045278F: mov esi, eax
  loc_00452791: lea edx, var_70
  loc_00452794: push edx
  loc_00452795: push esi
  loc_00452796: mov ecx, [esi]
  loc_00452798: call [ecx+000000A0h]
  loc_0045279E: test eax, eax
  loc_004527A0: fnclex
  loc_004527A2: jge 004527B6h
  loc_004527A4: push 000000A0h
  loc_004527A9: push 0041E5E8h
  loc_004527AE: push esi
  loc_004527AF: push eax
  loc_004527B0: call [00401074h] ; __vbaHresultCheckObj
  loc_004527B6: mov eax, var_70
  loc_004527B9: lea ecx, var_A4
  loc_004527BF: mov var_8C, eax
  loc_004527C5: lea eax, var_94
  loc_004527CB: push eax
  loc_004527CC: push ecx
  loc_004527CD: mov var_70, 00000000h
  loc_004527D4: mov var_94, 00000008h
  loc_004527DE: call [004010D4h] ; rtcTrimVar
  loc_004527E4: mov ebx, var_A4
  loc_004527EA: sub esp, 00000010h
  loc_004527ED: mov edi, esp
  loc_004527EF: sub esp, 00000010h
  loc_004527F2: mov edx, var_48
  loc_004527F5: mov ecx, 00000008h
  loc_004527FA: mov [edi], ebx
  loc_004527FC: mov ebx, var_A0
  loc_00452802: mov var_104, ecx
  loc_00452808: mov eax, 0041EB18h ; "AgentName"
  loc_0045280D: mov [edi+00000004h], ebx
  loc_00452810: mov ebx, var_9C
  loc_00452816: mov var_FC, eax
  loc_0045281C: mov esi, [edx]
  loc_0045281E: mov [edi+00000008h], ebx
  loc_00452821: mov ebx, var_98
  loc_00452827: mov [edi+0000000Ch], ebx
  loc_0045282A: mov edi, esp
  loc_0045282C: push edx
  loc_0045282D: mov [edi], ecx
  loc_0045282F: mov ecx, var_100
  loc_00452835: mov [edi+00000004h], ecx
  loc_00452838: mov [edi+00000008h], eax
  loc_0045283B: mov eax, var_F8
  loc_00452841: mov [edi+0000000Ch], eax
  loc_00452844: call [esi+00000128h]
  loc_0045284A: test eax, eax
  loc_0045284C: fnclex
  loc_0045284E: jge 00452865h
  loc_00452850: mov ecx, var_48
  loc_00452853: push 00000128h
  loc_00452858: push 0041E938h
  loc_0045285D: push ecx
  loc_0045285E: push eax
  loc_0045285F: call [00401074h] ; __vbaHresultCheckObj
  loc_00452865: lea ecx, var_80
  loc_00452868: call [004012B0h] ; __vbaFreeObj
  loc_0045286E: lea edx, var_A4
  loc_00452874: lea eax, var_94
  loc_0045287A: push edx
  loc_0045287B: push eax
  loc_0045287C: push 00000002h
  loc_0045287E: call [00401038h] ; __vbaFreeVarList
  loc_00452884: mov eax, Me
  loc_00452887: add esp, 0000000Ch
  loc_0045288A: mov ecx, [eax]
  loc_0045288C: push eax
  loc_0045288D: call [ecx+00000300h]
  loc_00452893: lea edx, var_80
  loc_00452896: push eax
  loc_00452897: push edx
  loc_00452898: call [004010A0h] ; __vbaObjSet
  loc_0045289E: mov esi, eax
  loc_004528A0: lea ecx, var_70
  loc_004528A3: push ecx
  loc_004528A4: push esi
  loc_004528A5: mov eax, [esi]
  loc_004528A7: call [eax+000000A0h]
  loc_004528AD: test eax, eax
  loc_004528AF: fnclex
  loc_004528B1: jge 004528C5h
  loc_004528B3: push 000000A0h
  loc_004528B8: push 0041E5E8h
  loc_004528BD: push esi
  loc_004528BE: push eax
  loc_004528BF: call [00401074h] ; __vbaHresultCheckObj
  loc_004528C5: mov edx, var_70
  loc_004528C8: push edx
  loc_004528C9: call [004011F4h] ; __vbaI4Str
  loc_004528CF: sub esp, 00000010h
  loc_004528D2: mov ecx, 00000003h
  loc_004528D7: mov ebx, esp
  loc_004528D9: mov var_114, ecx
  loc_004528DF: sub esp, 00000010h
  loc_004528E2: mov var_10C, eax
  loc_004528E8: mov [ebx], ecx
  loc_004528EA: mov ecx, var_110
  loc_004528F0: mov edi, var_48
  loc_004528F3: mov esi, 00000008h
  loc_004528F8: mov [ebx+00000004h], ecx
  loc_004528FB: mov ecx, esp
  loc_004528FD: mov edx, 0041EDD8h ; "SrNo"
  loc_00452902: mov var_104, esi
  loc_00452908: mov [ebx+00000008h], eax
  loc_0045290B: mov eax, var_108
  loc_00452911: mov var_FC, edx
  loc_00452917: mov edi, [edi]
  loc_00452919: mov [ebx+0000000Ch], eax
  loc_0045291C: mov eax, var_100
  loc_00452922: mov [ecx], esi
  loc_00452924: mov [ecx+00000004h], eax
  loc_00452927: mov eax, var_48
  loc_0045292A: push eax
  loc_0045292B: mov [ecx+00000008h], edx
  loc_0045292E: mov edx, var_F8
  loc_00452934: mov [ecx+0000000Ch], edx
  loc_00452937: call [edi+00000128h]
  loc_0045293D: test eax, eax
  loc_0045293F: fnclex
  loc_00452941: jge 0045295Ch
  loc_00452943: mov ecx, var_48
  loc_00452946: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0045294C: push 00000128h
  loc_00452951: push 0041E938h
  loc_00452956: push ecx
  loc_00452957: push eax
  loc_00452958: call edi
  loc_0045295A: jmp 00452962h
  loc_0045295C: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00452962: lea ecx, var_70
  loc_00452965: call [004012ACh] ; __vbaFreeStr
  loc_0045296B: lea ecx, var_80
  loc_0045296E: call [004012B0h] ; __vbaFreeObj
  loc_00452974: mov eax, Me
  loc_00452977: mov edx, var_28
  loc_0045297A: push eax
  loc_0045297B: mov var_FC, edx
  loc_00452981: mov ecx, [eax]
  loc_00452983: mov var_104, 00000008h
  loc_0045298D: call [ecx+00000318h]
  loc_00452993: lea edx, var_80
  loc_00452996: push eax
  loc_00452997: push edx
  loc_00452998: call [004010A0h] ; __vbaObjSet
  loc_0045299E: mov esi, eax
  loc_004529A0: lea eax, var_84
  loc_004529A6: lea ecx, var_24
  loc_004529A9: push eax
  loc_004529AA: mov ebx, [esi]
  loc_004529AC: push ecx
  loc_004529AD: call [004011C0h] ; __vbaI2Var
  loc_004529B3: push eax
  loc_004529B4: push esi
  loc_004529B5: call [ebx+00000040h]
  loc_004529B8: test eax, eax
  loc_004529BA: fnclex
  loc_004529BC: jge 004529C9h
  loc_004529BE: push 00000040h
  loc_004529C0: push 0041E5D8h
  loc_004529C5: push esi
  loc_004529C6: push eax
  loc_004529C7: call edi
  loc_004529C9: mov eax, var_84
  loc_004529CF: lea ecx, var_70
  loc_004529D2: push ecx
  loc_004529D3: push eax
  loc_004529D4: mov edx, [eax]
  loc_004529D6: mov esi, eax
  loc_004529D8: call [edx+000000A0h]
  loc_004529DE: test eax, eax
  loc_004529E0: fnclex
  loc_004529E2: jge 004529F2h
  loc_004529E4: push 000000A0h
  loc_004529E9: push 0041E5E8h
  loc_004529EE: push esi
  loc_004529EF: push eax
  loc_004529F0: call edi
  loc_004529F2: mov eax, var_70
  loc_004529F5: mov esi, [004010D4h] ; rtcTrimVar
  loc_004529FB: mov var_8C, eax
  loc_00452A01: lea edx, var_94
  loc_00452A07: lea eax, var_A4
  loc_00452A0D: mov ebx, 00000008h
  loc_00452A12: push edx
  loc_00452A13: push eax
  loc_00452A14: mov var_70, 00000000h
  loc_00452A1B: mov var_94, ebx
  loc_00452A21: call rtcTrimVar
  loc_00452A23: mov ecx, var_48
  loc_00452A26: mov var_10C, 0041EE00h ; "Num"
  loc_00452A30: mov var_114, ebx
  loc_00452A36: lea edx, var_104
  loc_00452A3C: mov ebx, [ecx]
  loc_00452A3E: lea eax, var_A4
  loc_00452A44: push edx
  loc_00452A45: lea ecx, var_B4
  loc_00452A4B: push eax
  loc_00452A4C: push ecx
  loc_00452A4D: call [004011B4h] ; __vbaVarCat
  loc_00452A53: mov ecx, [eax]
  loc_00452A55: sub esp, 00000010h
  loc_00452A58: mov edx, esp
  loc_00452A5A: sub esp, 00000010h
  loc_00452A5D: mov [edx], ecx
  loc_00452A5F: mov ecx, [eax+00000004h]
  loc_00452A62: mov [edx+00000004h], ecx
  loc_00452A65: mov ecx, [eax+00000008h]
  loc_00452A68: mov eax, [eax+0000000Ch]
  loc_00452A6B: mov [edx+00000008h], ecx
  loc_00452A6E: mov ecx, esp
  loc_00452A70: mov [edx+0000000Ch], eax
  loc_00452A73: mov edx, var_114
  loc_00452A79: mov eax, var_110
  loc_00452A7F: mov [ecx], edx
  loc_00452A81: mov edx, var_10C
  loc_00452A87: mov [ecx+00000004h], eax
  loc_00452A8A: mov eax, var_108
  loc_00452A90: mov [ecx+00000008h], edx
  loc_00452A93: mov [ecx+0000000Ch], eax
  loc_00452A96: mov ecx, var_48
  loc_00452A99: push ecx
  loc_00452A9A: call [ebx+00000128h]
  loc_00452AA0: test eax, eax
  loc_00452AA2: fnclex
  loc_00452AA4: jge 00452AB7h
  loc_00452AA6: mov edx, var_48
  loc_00452AA9: push 00000128h
  loc_00452AAE: push 0041E938h
  loc_00452AB3: push edx
  loc_00452AB4: push eax
  loc_00452AB5: call edi
  loc_00452AB7: lea eax, var_84
  loc_00452ABD: lea ecx, var_80
  loc_00452AC0: push eax
  loc_00452AC1: push ecx
  loc_00452AC2: push 00000002h
  loc_00452AC4: call [00401040h] ; __vbaFreeObjList
  loc_00452ACA: lea edx, var_B4
  loc_00452AD0: lea eax, var_A4
  loc_00452AD6: push edx
  loc_00452AD7: lea ecx, var_94
  loc_00452ADD: push eax
  loc_00452ADE: push ecx
  loc_00452ADF: push 00000003h
  loc_00452AE1: call [00401038h] ; __vbaFreeVarList
  loc_00452AE7: add esp, 0000001Ch
  loc_00452AEA: lea eax, var_104
  loc_00452AF0: lea ecx, var_94
  loc_00452AF6: lea edx, var_28
  loc_00452AF9: push eax
  loc_00452AFA: push ecx
  loc_00452AFB: mov var_FC, edx
  loc_00452B01: mov var_104, 00004008h
  loc_00452B0B: call rtcTrimVar
  loc_00452B0D: mov ebx, var_94
  loc_00452B13: sub esp, 00000010h
  loc_00452B16: mov edi, esp
  loc_00452B18: sub esp, 00000010h
  loc_00452B1B: mov edx, var_48
  loc_00452B1E: mov ecx, 00000008h
  loc_00452B23: mov [edi], ebx
  loc_00452B25: mov ebx, var_90
  loc_00452B2B: mov var_114, ecx
  loc_00452B31: mov eax, 0041EA3Ch ; "Num1"
  loc_00452B36: mov [edi+00000004h], ebx
  loc_00452B39: mov ebx, var_8C
  loc_00452B3F: mov var_10C, eax
  loc_00452B45: mov esi, [edx]
  loc_00452B47: mov [edi+00000008h], ebx
  loc_00452B4A: mov ebx, var_88
  loc_00452B50: mov [edi+0000000Ch], ebx
  loc_00452B53: mov edi, esp
  loc_00452B55: push edx
  loc_00452B56: mov [edi], ecx
  loc_00452B58: mov ecx, var_110
  loc_00452B5E: mov [edi+00000004h], ecx
  loc_00452B61: mov [edi+00000008h], eax
  loc_00452B64: mov eax, var_108
  loc_00452B6A: mov [edi+0000000Ch], eax
  loc_00452B6D: call [esi+00000128h]
  loc_00452B73: test eax, eax
  loc_00452B75: fnclex
  loc_00452B77: jge 00452B92h
  loc_00452B79: mov ecx, var_48
  loc_00452B7C: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00452B82: push 00000128h
  loc_00452B87: push 0041E938h
  loc_00452B8C: push ecx
  loc_00452B8D: push eax
  loc_00452B8E: call edi
  loc_00452B90: jmp 00452B98h
  loc_00452B92: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00452B98: lea ecx, var_94
  loc_00452B9E: call [00401020h] ; __vbaFreeVar
  loc_00452BA4: mov eax, Me
  loc_00452BA7: push eax
  loc_00452BA8: mov edx, [eax]
  loc_00452BAA: call [edx+00000318h]
  loc_00452BB0: push eax
  loc_00452BB1: lea eax, var_80
  loc_00452BB4: push eax
  loc_00452BB5: call [004010A0h] ; __vbaObjSet
  loc_00452BBB: lea ecx, var_84
  loc_00452BC1: mov esi, eax
  loc_00452BC3: lea edx, var_24
  loc_00452BC6: push ecx
  loc_00452BC7: mov ebx, [esi]
  loc_00452BC9: push edx
  loc_00452BCA: call [004011C0h] ; __vbaI2Var
  loc_00452BD0: push eax
  loc_00452BD1: push esi
  loc_00452BD2: call [ebx+00000040h]
  loc_00452BD5: test eax, eax
  loc_00452BD7: fnclex
  loc_00452BD9: jge 00452BE6h
  loc_00452BDB: push 00000040h
  loc_00452BDD: push 0041E5D8h
  loc_00452BE2: push esi
  loc_00452BE3: push eax
  loc_00452BE4: call edi
  loc_00452BE6: mov eax, var_84
  loc_00452BEC: lea edx, var_70
  loc_00452BEF: push edx
  loc_00452BF0: push eax
  loc_00452BF1: mov ecx, [eax]
  loc_00452BF3: mov esi, eax
  loc_00452BF5: call [ecx+000000A0h]
  loc_00452BFB: test eax, eax
  loc_00452BFD: fnclex
  loc_00452BFF: jge 00452C0Fh
  loc_00452C01: push 000000A0h
  loc_00452C06: push 0041E5E8h
  loc_00452C0B: push esi
  loc_00452C0C: push eax
  loc_00452C0D: call edi
  loc_00452C0F: mov eax, var_70
  loc_00452C12: lea ecx, var_A4
  loc_00452C18: mov var_8C, eax
  loc_00452C1E: lea eax, var_94
  loc_00452C24: push eax
  loc_00452C25: push ecx
  loc_00452C26: mov var_70, 00000000h
  loc_00452C2D: mov var_94, 00000008h
  loc_00452C37: call [004010D4h] ; rtcTrimVar
  loc_00452C3D: mov ebx, var_A4
  loc_00452C43: sub esp, 00000010h
  loc_00452C46: mov edi, esp
  loc_00452C48: sub esp, 00000010h
  loc_00452C4B: mov edx, var_48
  loc_00452C4E: mov ecx, 00000008h
  loc_00452C53: mov [edi], ebx
  loc_00452C55: mov ebx, var_A0
  loc_00452C5B: mov var_104, ecx
  loc_00452C61: mov eax, 0041EE0Ch ; "Value"
  loc_00452C66: mov [edi+00000004h], ebx
  loc_00452C69: mov ebx, var_9C
  loc_00452C6F: mov var_FC, eax
  loc_00452C75: mov esi, [edx]
  loc_00452C77: mov [edi+00000008h], ebx
  loc_00452C7A: mov ebx, var_98
  loc_00452C80: mov [edi+0000000Ch], ebx
  loc_00452C83: mov edi, esp
  loc_00452C85: push edx
  loc_00452C86: mov [edi], ecx
  loc_00452C88: mov ecx, var_100
  loc_00452C8E: mov [edi+00000004h], ecx
  loc_00452C91: mov [edi+00000008h], eax
  loc_00452C94: mov eax, var_F8
  loc_00452C9A: mov [edi+0000000Ch], eax
  loc_00452C9D: call [esi+00000128h]
  loc_00452CA3: test eax, eax
  loc_00452CA5: fnclex
  loc_00452CA7: jge 00452CBEh
  loc_00452CA9: mov ecx, var_48
  loc_00452CAC: push 00000128h
  loc_00452CB1: push 0041E938h
  loc_00452CB6: push ecx
  loc_00452CB7: push eax
  loc_00452CB8: call [00401074h] ; __vbaHresultCheckObj
  loc_00452CBE: lea edx, var_84
  loc_00452CC4: lea eax, var_80
  loc_00452CC7: push edx
  loc_00452CC8: push eax
  loc_00452CC9: push 00000002h
  loc_00452CCB: call [00401040h] ; __vbaFreeObjList
  loc_00452CD1: lea ecx, var_A4
  loc_00452CD7: lea edx, var_94
  loc_00452CDD: push ecx
  loc_00452CDE: push edx
  loc_00452CDF: push 00000002h
  loc_00452CE1: call [00401038h] ; __vbaFreeVarList
  loc_00452CE7: add esp, 00000018h
  loc_00452CEA: lea eax, var_104
  loc_00452CF0: lea ecx, var_94
  loc_00452CF6: mov var_FC, 0061A130h
  loc_00452D00: push eax
  loc_00452D01: push ecx
  loc_00452D02: mov var_104, 00004011h
  loc_00452D0C: call [004010D4h] ; rtcTrimVar
  loc_00452D12: mov ebx, var_94
  loc_00452D18: sub esp, 00000010h
  loc_00452D1B: mov edi, esp
  loc_00452D1D: sub esp, 00000010h
  loc_00452D20: mov edx, var_48
  loc_00452D23: mov ecx, 00000008h
  loc_00452D28: mov [edi], ebx
  loc_00452D2A: mov ebx, var_90
  loc_00452D30: mov var_114, ecx
  loc_00452D36: mov eax, 0041EDC0h ; "MachineID"
  loc_00452D3B: mov [edi+00000004h], ebx
  loc_00452D3E: mov ebx, var_8C
  loc_00452D44: mov var_10C, eax
  loc_00452D4A: mov esi, [edx]
  loc_00452D4C: mov [edi+00000008h], ebx
  loc_00452D4F: mov ebx, var_88
  loc_00452D55: mov [edi+0000000Ch], ebx
  loc_00452D58: mov edi, esp
  loc_00452D5A: push edx
  loc_00452D5B: mov [edi], ecx
  loc_00452D5D: mov ecx, var_110
  loc_00452D63: mov [edi+00000004h], ecx
  loc_00452D66: mov [edi+00000008h], eax
  loc_00452D69: mov eax, var_108
  loc_00452D6F: mov [edi+0000000Ch], eax
  loc_00452D72: call [esi+00000128h]
  loc_00452D78: test eax, eax
  loc_00452D7A: fnclex
  loc_00452D7C: jge 00452D93h
  loc_00452D7E: mov ecx, var_48
  loc_00452D81: push 00000128h
  loc_00452D86: push 0041E938h
  loc_00452D8B: push ecx
  loc_00452D8C: push eax
  loc_00452D8D: call [00401074h] ; __vbaHresultCheckObj
  loc_00452D93: lea ecx, var_94
  loc_00452D99: call [00401020h] ; __vbaFreeVar
  loc_00452D9F: lea edx, var_104
  loc_00452DA5: lea eax, var_94
  loc_00452DAB: push edx
  loc_00452DAC: push eax
  loc_00452DAD: mov var_FC, 0061A060h
  loc_00452DB7: mov var_104, 00004008h
  loc_00452DC1: call [004010D4h] ; rtcTrimVar
  loc_00452DC7: mov ebx, var_94
  loc_00452DCD: sub esp, 00000010h
  loc_00452DD0: mov edi, esp
  loc_00452DD2: sub esp, 00000010h
  loc_00452DD5: mov edx, var_48
  loc_00452DD8: mov ecx, 00000008h
  loc_00452DDD: mov [edi], ebx
  loc_00452DDF: mov ebx, var_90
  loc_00452DE5: mov var_114, ecx
  loc_00452DEB: mov eax, 0041EDE8h ; "AMPM"
  loc_00452DF0: mov [edi+00000004h], ebx
  loc_00452DF3: mov ebx, var_8C
  loc_00452DF9: mov var_10C, eax
  loc_00452DFF: mov esi, [edx]
  loc_00452E01: mov [edi+00000008h], ebx
  loc_00452E04: mov ebx, var_88
  loc_00452E0A: mov [edi+0000000Ch], ebx
  loc_00452E0D: mov edi, esp
  loc_00452E0F: push edx
  loc_00452E10: mov [edi], ecx
  loc_00452E12: mov ecx, var_110
  loc_00452E18: mov [edi+00000004h], ecx
  loc_00452E1B: mov [edi+00000008h], eax
  loc_00452E1E: mov eax, var_108
  loc_00452E24: mov [edi+0000000Ch], eax
  loc_00452E27: call [esi+00000128h]
  loc_00452E2D: test eax, eax
  loc_00452E2F: fnclex
  loc_00452E31: jge 00452E4Ch
  loc_00452E33: mov ecx, var_48
  loc_00452E36: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00452E3C: push 00000128h
  loc_00452E41: push 0041E938h
  loc_00452E46: push ecx
  loc_00452E47: push eax
  loc_00452E48: call __vbaHresultCheckObj
  loc_00452E4A: jmp 00452E52h
  loc_00452E4C: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00452E52: lea ecx, var_94
  loc_00452E58: call [00401020h] ; __vbaFreeVar
  loc_00452E5E: mov eax, var_48
  loc_00452E61: push 00000000h
  loc_00452E63: push 00000001h
  loc_00452E65: push eax
  loc_00452E66: mov edx, [eax]
  loc_00452E68: call [edx+00000164h]
  loc_00452E6E: test eax, eax
  loc_00452E70: fnclex
  loc_00452E72: jge 00452E85h
  loc_00452E74: mov ecx, var_48
  loc_00452E77: push 00000164h
  loc_00452E7C: push 0041E938h
  loc_00452E81: push ecx
  loc_00452E82: push eax
  loc_00452E83: call __vbaHresultCheckObj
  loc_00452E85: mov eax, var_40
  loc_00452E88: push 00000000h
  loc_00452E8A: push 00000001h
  loc_00452E8C: push eax
  loc_00452E8D: mov edx, [eax]
  loc_00452E8F: call [edx+00000164h]
  loc_00452E95: test eax, eax
  loc_00452E97: fnclex
  loc_00452E99: jge 00452EACh
  loc_00452E9B: mov ecx, var_40
  loc_00452E9E: push 00000164h
  loc_00452EA3: push 0041E938h
  loc_00452EA8: push ecx
  loc_00452EA9: push eax
  loc_00452EAA: call __vbaHresultCheckObj
  loc_00452EAC: lea edx, var_178
  loc_00452EB2: lea eax, var_168
  loc_00452EB8: push edx
  loc_00452EB9: lea ecx, var_24
  loc_00452EBC: push eax
  loc_00452EBD: push ecx
  loc_00452EBE: call [0040129Ch] ; __vbaVarForNext
  loc_00452EC4: mov edi, [004010A0h] ; __vbaObjSet
  loc_00452ECA: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00452ED0: jmp 00451FFDh
  loc_00452ED5: mov eax, var_40
  loc_00452ED8: push eax
  loc_00452ED9: mov edx, [eax]
  loc_00452EDB: call [edx+000000C4h]
  loc_00452EE1: test eax, eax
  loc_00452EE3: fnclex
  loc_00452EE5: jge 00452EF8h
  loc_00452EE7: mov ecx, var_40
  loc_00452EEA: push 000000C4h
  loc_00452EEF: push 0041E938h
  loc_00452EF4: push ecx
  loc_00452EF5: push eax
  loc_00452EF6: call ebx
  loc_00452EF8: push 0041E938h
  loc_00452EFD: push 00000000h
  loc_00452EFF: call [00401274h] ; __vbaCastObj
  loc_00452F05: lea edx, var_40
  loc_00452F08: push eax
  loc_00452F09: push edx
  loc_00452F0A: call edi
  loc_00452F0C: mov esi, Me
  loc_00452F0F: push esi
  loc_00452F10: mov eax, [esi]
  loc_00452F12: call [eax+000006F8h]
  loc_00452F18: mov ecx, [esi]
  loc_00452F1A: push esi
  loc_00452F1B: call [ecx+00000308h]
  loc_00452F21: lea edx, var_80
  loc_00452F24: push eax
  loc_00452F25: push edx
  loc_00452F26: call edi
  loc_00452F28: mov ebx, [eax]
  loc_00452F2A: push 00000000h
  loc_00452F2C: mov var_148, eax
  loc_00452F32: call [00401008h] ; __vbaStrI2
  loc_00452F38: mov edx, eax
  loc_00452F3A: lea ecx, var_70
  loc_00452F3D: call [00401270h] ; __vbaStrMove
  loc_00452F43: mov var_1A0, ebx
  loc_00452F49: mov ebx, var_148
  loc_00452F4F: push eax
  loc_00452F50: mov eax, var_1A0
  loc_00452F56: push ebx
  loc_00452F57: call [eax+000000A4h]
  loc_00452F5D: test eax, eax
  loc_00452F5F: fnclex
  loc_00452F61: jge 00452F75h
  loc_00452F63: push 000000A4h
  loc_00452F68: push 0041E5E8h
  loc_00452F6D: push ebx
  loc_00452F6E: push eax
  loc_00452F6F: call [00401074h] ; __vbaHresultCheckObj
  loc_00452F75: lea ecx, var_70
  loc_00452F78: call [004012ACh] ; __vbaFreeStr
  loc_00452F7E: lea ecx, var_80
  loc_00452F81: call [004012B0h] ; __vbaFreeObj
  loc_00452F87: mov ecx, [esi]
  loc_00452F89: push esi
  loc_00452F8A: call [ecx+00000300h]
  loc_00452F90: lea edx, var_80
  loc_00452F93: push eax
  loc_00452F94: push edx
  loc_00452F95: call edi
  loc_00452F97: lea ecx, var_70
  loc_00452F9A: mov ebx, eax
  loc_00452F9C: mov eax, [esi]
  loc_00452F9E: push ecx
  loc_00452F9F: push esi
  loc_00452FA0: call [eax+0000072Ch]
  loc_00452FA6: mov eax, var_70
  loc_00452FA9: mov edx, [ebx]
  loc_00452FAB: push eax
  loc_00452FAC: push ebx
  loc_00452FAD: call [edx+000000A4h]
  loc_00452FB3: test eax, eax
  loc_00452FB5: fnclex
  loc_00452FB7: jge 00452FCBh
  loc_00452FB9: push 000000A4h
  loc_00452FBE: push 0041E5E8h
  loc_00452FC3: push ebx
  loc_00452FC4: push eax
  loc_00452FC5: call [00401074h] ; __vbaHresultCheckObj
  loc_00452FCB: lea ecx, var_70
  loc_00452FCE: call [004012ACh] ; __vbaFreeStr
  loc_00452FD4: lea ecx, var_80
  loc_00452FD7: call [004012B0h] ; __vbaFreeObj
  loc_00452FDD: mov ecx, [esi]
  loc_00452FDF: push esi
  loc_00452FE0: call [ecx+00000310h]
  loc_00452FE6: lea edx, var_80
  loc_00452FE9: push eax
  loc_00452FEA: push edx
  loc_00452FEB: call edi
  loc_00452FED: mov ebx, eax
  loc_00452FEF: push 0041E5D4h
  loc_00452FF4: push ebx
  loc_00452FF5: mov eax, [ebx]
  loc_00452FF7: call [eax+000000A4h]
  loc_00452FFD: test eax, eax
  loc_00452FFF: fnclex
  loc_00453001: jge 00453015h
  loc_00453003: push 000000A4h
  loc_00453008: push 0041E5E8h
  loc_0045300D: push ebx
  loc_0045300E: push eax
  loc_0045300F: call [00401074h] ; __vbaHresultCheckObj
  loc_00453015: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0045301B: lea ecx, var_80
  loc_0045301E: call ebx
  loc_00453020: mov ecx, [esi]
  loc_00453022: push esi
  loc_00453023: call [ecx+00000310h]
  loc_00453029: lea edx, var_80
  loc_0045302C: push eax
  loc_0045302D: push edx
  loc_0045302E: call edi
  loc_00453030: mov esi, eax
  loc_00453032: push esi
  loc_00453033: mov eax, [esi]
  loc_00453035: call [eax+00000204h]
  loc_0045303B: test eax, eax
  loc_0045303D: fnclex
  loc_0045303F: jge 00453053h
  loc_00453041: push 00000204h
  loc_00453046: push 0041E5E8h
  loc_0045304B: push esi
  loc_0045304C: push eax
  loc_0045304D: call [00401074h] ; __vbaHresultCheckObj
  loc_00453053: lea ecx, var_80
  loc_00453056: call ebx
  loc_00453058: push 00453125h
  loc_0045305D: jmp 004530C7h
  loc_0045305F: lea ecx, var_7C
  loc_00453062: lea edx, var_78
  loc_00453065: push ecx
  loc_00453066: lea eax, var_74
  loc_00453069: push edx
  loc_0045306A: lea ecx, var_70
  loc_0045306D: push eax
  loc_0045306E: push ecx
  loc_0045306F: push 00000004h
  loc_00453071: call [004011FCh] ; __vbaFreeStrList
  loc_00453077: lea edx, var_84
  loc_0045307D: lea eax, var_80
  loc_00453080: push edx
  loc_00453081: push eax
  loc_00453082: push 00000002h
  loc_00453084: call [00401040h] ; __vbaFreeObjList
  loc_0045308A: lea ecx, var_F4
  loc_00453090: lea edx, var_E4
  loc_00453096: push ecx
  loc_00453097: lea eax, var_D4
  loc_0045309D: push edx
  loc_0045309E: lea ecx, var_C4
  loc_004530A4: push eax
  loc_004530A5: lea edx, var_B4
  loc_004530AB: push ecx
  loc_004530AC: lea eax, var_A4
  loc_004530B2: push edx
  loc_004530B3: lea ecx, var_94
  loc_004530B9: push eax
  loc_004530BA: push ecx
  loc_004530BB: push 00000007h
  loc_004530BD: call [00401038h] ; __vbaFreeVarList
  loc_004530C3: add esp, 00000040h
  loc_004530C6: ret
  loc_004530C7: lea edx, var_178
  loc_004530CD: lea eax, var_168
  loc_004530D3: push edx
  loc_004530D4: push eax
  loc_004530D5: push 00000002h
  loc_004530D7: call [00401038h] ; __vbaFreeVarList
  loc_004530DD: mov edi, [004012ACh] ; __vbaFreeStr
  loc_004530E3: add esp, 0000000Ch
  loc_004530E6: lea ecx, var_14
  loc_004530E9: call edi
  loc_004530EB: mov esi, [00401020h] ; __vbaFreeVar
  loc_004530F1: lea ecx, var_24
  loc_004530F4: call __vbaFreeVar
  loc_004530F6: lea ecx, var_28
  loc_004530F9: call edi
  loc_004530FB: lea ecx, var_2C
  loc_004530FE: call edi
  loc_00453100: lea ecx, var_3C
  loc_00453103: call __vbaFreeVar
  loc_00453105: mov edi, [004012B0h] ; __vbaFreeObj
  loc_0045310B: lea ecx, var_40
  loc_0045310E: call edi
  loc_00453110: lea ecx, var_48
  loc_00453113: call edi
  loc_00453115: lea ecx, var_4C
  loc_00453118: call edi
  loc_0045311A: lea ecx, var_5C
  loc_0045311D: call __vbaFreeVar
  loc_0045311F: lea ecx, var_6C
  loc_00453122: call __vbaFreeVar
  loc_00453124: ret
  loc_00453125: mov ecx, var_10
  loc_00453128: pop edi
  loc_00453129: pop esi
  loc_0045312A: xor eax, eax
  loc_0045312C: mov fs:[00000000h], ecx
  loc_00453133: pop ebx
  loc_00453134: mov esp, ebp
  loc_00453136: pop ebp
  loc_00453137: retn 0004h
End Sub
