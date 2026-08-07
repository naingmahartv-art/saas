VERSION 5.00
Begin VB.Form frmAdvCom
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
  Begin VB.OptionButton optPurchase
    Caption = "&Buy"
    Left = 10320
    Top = 2610
    Width = 1245
    Height = 255
    TabIndex = 206
  End
  Begin VB.OptionButton optSale
    Caption = "&Sale"
    Left = 9570
    Top = 2610
    Width = 705
    Height = 255
    TabIndex = 205
    Value = 255
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
    Caption = "Cl&ose ( F4 )"
    Left = 9630
    Top = 4005
    Width = 1215
    Height = 345
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
    Width = 2115
    Height = 315
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
    Caption = "F2"
    Left = 11730
    Top = 3150
    Width = 375
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
    TabIndex = 207
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
    Top = 3240
    Width = 1140
    Height = 210
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

Attribute VB_Name = "frmAdvCom"


Private Sub cmdCustomer_Click() '5C8E00
  loc_005C8E00: push ebp
  loc_005C8E01: mov ebp, esp
  loc_005C8E03: sub esp, 0000000Ch
  loc_005C8E06: push 00403B36h ; __vbaExceptHandler
  loc_005C8E0B: mov eax, fs:[00000000h]
  loc_005C8E11: push eax
  loc_005C8E12: mov fs:[00000000h], esp
  loc_005C8E19: sub esp, 00000058h
  loc_005C8E1C: push ebx
  loc_005C8E1D: push esi
  loc_005C8E1E: push edi
  loc_005C8E1F: mov var_C, esp
  loc_005C8E22: mov var_8, 00403048h
  loc_005C8E29: mov edi, Me
  loc_005C8E2C: mov eax, edi
  loc_005C8E2E: and eax, 00000001h
  loc_005C8E31: mov var_4, eax
  loc_005C8E34: and edi, FFFFFFFEh
  loc_005C8E37: push edi
  loc_005C8E38: mov Me, edi
  loc_005C8E3B: mov ecx, [edi]
  loc_005C8E3D: call [ecx+00000004h]
  loc_005C8E40: xor esi, esi
  loc_005C8E42: mov edx, 0041E5D4h
  loc_005C8E47: mov ecx, 0061A0A0h
  loc_005C8E4C: mov var_18, esi
  loc_005C8E4F: mov var_1C, esi
  loc_005C8E52: mov var_2C, esi
  loc_005C8E55: mov var_3C, esi
  loc_005C8E58: mov var_4C, esi
  loc_005C8E5B: mov var_5C, esi
  loc_005C8E5E: call [004011ECh] ; __vbaStrCopy
  loc_005C8E64: cmp [0061A11Ch], esi
  loc_005C8E6A: jnz 005C8E7Ch
  loc_005C8E6C: push 0061A11Ch
  loc_005C8E71: push 004069CCh
  loc_005C8E76: call [004011DCh] ; __vbaNew2
  loc_005C8E7C: sub esp, 00000010h
  loc_005C8E7F: mov ecx, 0000000Ah
  loc_005C8E84: mov ebx, esp
  loc_005C8E86: mov var_5C, ecx
  loc_005C8E89: mov eax, 80020004h
  loc_005C8E8E: sub esp, 00000010h
  loc_005C8E91: mov [ebx], ecx
  loc_005C8E93: mov ecx, var_58
  loc_005C8E96: mov var_54, eax
  loc_005C8E99: mov esi, [0061A11Ch]
  loc_005C8E9F: mov [ebx+00000004h], ecx
  loc_005C8EA2: mov var_4C, 00000002h
  loc_005C8EA9: mov ecx, esp
  loc_005C8EAB: mov var_44, 00000001h
  loc_005C8EB2: mov [ebx+00000008h], eax
  loc_005C8EB5: mov eax, var_50
  loc_005C8EB8: mov edx, [esi]
  loc_005C8EBA: push esi
  loc_005C8EBB: mov [ebx+0000000Ch], eax
  loc_005C8EBE: mov eax, var_4C
  loc_005C8EC1: mov [ecx], eax
  loc_005C8EC3: mov eax, var_48
  loc_005C8EC6: mov [ecx+00000004h], eax
  loc_005C8EC9: mov eax, var_44
  loc_005C8ECC: mov [ecx+00000008h], eax
  loc_005C8ECF: mov eax, var_40
  loc_005C8ED2: mov [ecx+0000000Ch], eax
  loc_005C8ED5: call [edx+000002B0h]
  loc_005C8EDB: test eax, eax
  loc_005C8EDD: fnclex
  loc_005C8EDF: jge 005C8EF3h
  loc_005C8EE1: push 000002B0h
  loc_005C8EE6: push 0041E6D0h
  loc_005C8EEB: push esi
  loc_005C8EEC: push eax
  loc_005C8EED: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8EF3: mov ebx, [004010D4h] ; rtcTrimVar
  loc_005C8EF9: lea ecx, var_4C
  loc_005C8EFC: lea edx, var_2C
  loc_005C8EFF: push ecx
  loc_005C8F00: push edx
  loc_005C8F01: mov var_44, 0061A0B8h
  loc_005C8F08: mov var_4C, 00004008h
  loc_005C8F0F: call ebx
  loc_005C8F11: lea eax, var_2C
  loc_005C8F14: lea ecx, var_5C
  loc_005C8F17: push eax
  loc_005C8F18: push ecx
  loc_005C8F19: mov var_54, 0041E5D4h
  loc_005C8F20: mov var_5C, 00008008h
  loc_005C8F27: call [00401218h] ; __vbaVarTstNe
  loc_005C8F2D: lea ecx, var_2C
  loc_005C8F30: mov si, ax
  loc_005C8F33: call [00401020h] ; __vbaFreeVar
  loc_005C8F39: test si, si
  loc_005C8F3C: jz 005C8FC4h
  loc_005C8F42: mov edx, [edi]
  loc_005C8F44: push edi
  loc_005C8F45: call [edx+00000704h]
  loc_005C8F4B: mov eax, [edi]
  loc_005C8F4D: push edi
  loc_005C8F4E: call [eax+0000030Ch]
  loc_005C8F54: lea ecx, var_1C
  loc_005C8F57: push eax
  loc_005C8F58: push ecx
  loc_005C8F59: call [004010A0h] ; __vbaObjSet
  loc_005C8F5F: mov esi, eax
  loc_005C8F61: lea edx, var_4C
  loc_005C8F64: lea eax, var_2C
  loc_005C8F67: push edx
  loc_005C8F68: push eax
  loc_005C8F69: mov var_44, 0061A0B8h
  loc_005C8F70: mov var_4C, 00004008h
  loc_005C8F77: call ebx
  loc_005C8F79: mov edi, [esi]
  loc_005C8F7B: lea ecx, var_2C
  loc_005C8F7E: lea edx, var_18
  loc_005C8F81: push ecx
  loc_005C8F82: push edx
  loc_005C8F83: call [004011B0h] ; __vbaStrVarVal
  loc_005C8F89: push eax
  loc_005C8F8A: push esi
  loc_005C8F8B: call [edi+000000A4h]
  loc_005C8F91: test eax, eax
  loc_005C8F93: fnclex
  loc_005C8F95: jge 005C8FA9h
  loc_005C8F97: push 000000A4h
  loc_005C8F9C: push 0041E5E8h
  loc_005C8FA1: push esi
  loc_005C8FA2: push eax
  loc_005C8FA3: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8FA9: lea ecx, var_18
  loc_005C8FAC: call [004012ACh] ; __vbaFreeStr
  loc_005C8FB2: lea ecx, var_1C
  loc_005C8FB5: call [004012B0h] ; __vbaFreeObj
  loc_005C8FBB: lea ecx, var_2C
  loc_005C8FBE: call [00401020h] ; __vbaFreeVar
  loc_005C8FC4: mov var_4, 00000000h
  loc_005C8FCB: push 005C8FF9h
  loc_005C8FD0: jmp 005C8FF8h
  loc_005C8FD2: lea ecx, var_18
  loc_005C8FD5: call [004012ACh] ; __vbaFreeStr
  loc_005C8FDB: lea ecx, var_1C
  loc_005C8FDE: call [004012B0h] ; __vbaFreeObj
  loc_005C8FE4: lea eax, var_3C
  loc_005C8FE7: lea ecx, var_2C
  loc_005C8FEA: push eax
  loc_005C8FEB: push ecx
  loc_005C8FEC: push 00000002h
  loc_005C8FEE: call [00401038h] ; __vbaFreeVarList
  loc_005C8FF4: add esp, 0000000Ch
  loc_005C8FF7: ret
  loc_005C8FF8: ret
  loc_005C8FF9: mov eax, Me
  loc_005C8FFC: push eax
  loc_005C8FFD: mov edx, [eax]
  loc_005C8FFF: call [edx+00000008h]
  loc_005C9002: mov eax, var_4
  loc_005C9005: mov ecx, var_14
  loc_005C9008: pop edi
  loc_005C9009: pop esi
  loc_005C900A: mov fs:[00000000h], ecx
  loc_005C9011: pop ebx
  loc_005C9012: mov esp, ebp
  loc_005C9014: pop ebp
  loc_005C9015: retn 0004h
End Sub

Private Sub txtCustomer_KeyPress(KeyAscii As Integer) '5CAAD0
  loc_005CAAD0: push ebp
  loc_005CAAD1: mov ebp, esp
  loc_005CAAD3: sub esp, 0000000Ch
  loc_005CAAD6: push 00403B36h ; __vbaExceptHandler
  loc_005CAADB: mov eax, fs:[00000000h]
  loc_005CAAE1: push eax
  loc_005CAAE2: mov fs:[00000000h], esp
  loc_005CAAE9: sub esp, 0000003Ch
  loc_005CAAEC: push ebx
  loc_005CAAED: push esi
  loc_005CAAEE: push edi
  loc_005CAAEF: mov var_C, esp
  loc_005CAAF2: mov var_8, 00403088h
  loc_005CAAF9: mov esi, Me
  loc_005CAAFC: mov eax, esi
  loc_005CAAFE: and eax, 00000001h
  loc_005CAB01: mov var_4, eax
  loc_005CAB04: and esi, FFFFFFFEh
  loc_005CAB07: push esi
  loc_005CAB08: mov Me, esi
  loc_005CAB0B: mov ecx, [esi]
  loc_005CAB0D: call [ecx+00000004h]
  loc_005CAB10: mov edx, KeyAscii
  loc_005CAB13: xor eax, eax
  loc_005CAB15: mov var_18, eax
  loc_005CAB18: mov var_1C, eax
  loc_005CAB1B: cmp [edx], 000Dh
  loc_005CAB1F: mov var_2C, eax
  loc_005CAB22: mov var_3C, eax
  loc_005CAB25: jnz 005CAC02h
  loc_005CAB2B: mov eax, [esi]
  loc_005CAB2D: push esi
  loc_005CAB2E: call [eax+0000030Ch]
  loc_005CAB34: mov ebx, [004010A0h] ; __vbaObjSet
  loc_005CAB3A: lea ecx, var_1C
  loc_005CAB3D: push eax
  loc_005CAB3E: push ecx
  loc_005CAB3F: call ebx
  loc_005CAB41: mov edi, eax
  loc_005CAB43: lea eax, var_18
  loc_005CAB46: push eax
  loc_005CAB47: push edi
  loc_005CAB48: mov edx, [edi]
  loc_005CAB4A: call [edx+000000A0h]
  loc_005CAB50: test eax, eax
  loc_005CAB52: fnclex
  loc_005CAB54: jge 005CAB68h
  loc_005CAB56: push 000000A0h
  loc_005CAB5B: push 0041E5E8h
  loc_005CAB60: push edi
  loc_005CAB61: push eax
  loc_005CAB62: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAB68: mov eax, var_18
  loc_005CAB6B: lea ecx, var_2C
  loc_005CAB6E: lea edx, var_3C
  loc_005CAB71: push ecx
  loc_005CAB72: push edx
  loc_005CAB73: mov var_18, 00000000h
  loc_005CAB7A: mov var_24, eax
  loc_005CAB7D: mov var_2C, 00000008h
  loc_005CAB84: call [004010D4h] ; rtcTrimVar
  loc_005CAB8A: lea eax, var_3C
  loc_005CAB8D: push eax
  loc_005CAB8E: call [00401028h] ; __vbaStrVarMove
  loc_005CAB94: mov edx, eax
  loc_005CAB96: mov ecx, 0061A0B8h
  loc_005CAB9B: call [00401270h] ; __vbaStrMove
  loc_005CABA1: mov edi, [004012B0h] ; __vbaFreeObj
  loc_005CABA7: lea ecx, var_1C
  loc_005CABAA: call edi
  loc_005CABAC: lea ecx, var_3C
  loc_005CABAF: lea edx, var_2C
  loc_005CABB2: push ecx
  loc_005CABB3: push edx
  loc_005CABB4: push 00000002h
  loc_005CABB6: call [00401038h] ; __vbaFreeVarList
  loc_005CABBC: mov eax, [esi]
  loc_005CABBE: add esp, 0000000Ch
  loc_005CABC1: push esi
  loc_005CABC2: call [eax+00000704h]
  loc_005CABC8: mov ecx, [esi]
  loc_005CABCA: push esi
  loc_005CABCB: call [ecx+00000304h]
  loc_005CABD1: lea edx, var_1C
  loc_005CABD4: push eax
  loc_005CABD5: push edx
  loc_005CABD6: call ebx
  loc_005CABD8: mov esi, eax
  loc_005CABDA: push esi
  loc_005CABDB: mov eax, [esi]
  loc_005CABDD: call [eax+00000204h]
  loc_005CABE3: test eax, eax
  loc_005CABE5: fnclex
  loc_005CABE7: jge 005CABFBh
  loc_005CABE9: push 00000204h
  loc_005CABEE: push 0041E5E8h
  loc_005CABF3: push esi
  loc_005CABF4: push eax
  loc_005CABF5: call [00401074h] ; __vbaHresultCheckObj
  loc_005CABFB: lea ecx, var_1C
  loc_005CABFE: call edi
  loc_005CAC00: xor eax, eax
  loc_005CAC02: mov var_4, eax
  loc_005CAC05: push 005CAC33h
  loc_005CAC0A: jmp 005CAC32h
  loc_005CAC0C: lea ecx, var_18
  loc_005CAC0F: call [004012ACh] ; __vbaFreeStr
  loc_005CAC15: lea ecx, var_1C
  loc_005CAC18: call [004012B0h] ; __vbaFreeObj
  loc_005CAC1E: lea ecx, var_3C
  loc_005CAC21: lea edx, var_2C
  loc_005CAC24: push ecx
  loc_005CAC25: push edx
  loc_005CAC26: push 00000002h
  loc_005CAC28: call [00401038h] ; __vbaFreeVarList
  loc_005CAC2E: add esp, 0000000Ch
  loc_005CAC31: ret
  loc_005CAC32: ret
  loc_005CAC33: mov eax, Me
  loc_005CAC36: push eax
  loc_005CAC37: mov ecx, [eax]
  loc_005CAC39: call [ecx+00000008h]
  loc_005CAC3C: mov eax, var_4
  loc_005CAC3F: mov ecx, var_14
  loc_005CAC42: pop edi
  loc_005CAC43: pop esi
  loc_005CAC44: mov fs:[00000000h], ecx
  loc_005CAC4B: pop ebx
  loc_005CAC4C: mov esp, ebp
  loc_005CAC4E: pop ebp
  loc_005CAC4F: retn 0008h
End Sub

Private Sub txtCustomer_LostFocus() '5CAC60
  loc_005CAC60: push ebp
  loc_005CAC61: mov ebp, esp
  loc_005CAC63: sub esp, 0000000Ch
  loc_005CAC66: push 00403B36h ; __vbaExceptHandler
  loc_005CAC6B: mov eax, fs:[00000000h]
  loc_005CAC71: push eax
  loc_005CAC72: mov fs:[00000000h], esp
  loc_005CAC79: sub esp, 000000E0h
  loc_005CAC7F: push ebx
  loc_005CAC80: push esi
  loc_005CAC81: push edi
  loc_005CAC82: mov var_C, esp
  loc_005CAC85: mov var_8, 00403098h
  loc_005CAC8C: mov esi, Me
  loc_005CAC8F: mov eax, esi
  loc_005CAC91: and eax, 00000001h
  loc_005CAC94: mov var_4, eax
  loc_005CAC97: and esi, FFFFFFFEh
  loc_005CAC9A: push esi
  loc_005CAC9B: mov Me, esi
  loc_005CAC9E: mov ecx, [esi]
  loc_005CACA0: call [ecx+00000004h]
  loc_005CACA3: mov edx, [esi]
  loc_005CACA5: xor ebx, ebx
  loc_005CACA7: push esi
  loc_005CACA8: mov var_18, ebx
  loc_005CACAB: mov var_1C, ebx
  loc_005CACAE: mov var_20, ebx
  loc_005CACB1: mov var_24, ebx
  loc_005CACB4: mov var_28, ebx
  loc_005CACB7: mov var_2C, ebx
  loc_005CACBA: mov var_3C, ebx
  loc_005CACBD: mov var_4C, ebx
  loc_005CACC0: mov var_5C, ebx
  loc_005CACC3: mov var_6C, ebx
  loc_005CACC6: mov var_7C, ebx
  loc_005CACC9: mov var_8C, ebx
  loc_005CACCF: mov var_9C, ebx
  loc_005CACD5: mov var_AC, ebx
  loc_005CACDB: mov var_BC, ebx
  loc_005CACE1: mov var_C0, ebx
  loc_005CACE7: mov var_C4, ebx
  loc_005CACED: call [edx+0000030Ch]
  loc_005CACF3: push eax
  loc_005CACF4: lea eax, var_24
  loc_005CACF7: push eax
  loc_005CACF8: call [004010A0h] ; __vbaObjSet
  loc_005CACFE: mov edi, eax
  loc_005CAD00: lea edx, var_1C
  loc_005CAD03: push edx
  loc_005CAD04: push edi
  loc_005CAD05: mov ecx, [edi]
  loc_005CAD07: call [ecx+000000A0h]
  loc_005CAD0D: cmp eax, ebx
  loc_005CAD0F: fnclex
  loc_005CAD11: jge 005CAD25h
  loc_005CAD13: push 000000A0h
  loc_005CAD18: push 0041E5E8h
  loc_005CAD1D: push edi
  loc_005CAD1E: push eax
  loc_005CAD1F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAD25: mov eax, var_1C
  loc_005CAD28: push eax
  loc_005CAD29: push 0041E5D4h
  loc_005CAD2E: call [0040110Ch] ; __vbaStrCmp
  loc_005CAD34: mov edi, eax
  loc_005CAD36: lea ecx, var_1C
  loc_005CAD39: neg edi
  loc_005CAD3B: sbb edi, edi
  loc_005CAD3D: inc edi
  loc_005CAD3E: neg edi
  loc_005CAD40: call [004012ACh] ; __vbaFreeStr
  loc_005CAD46: lea ecx, var_24
  loc_005CAD49: call [004012B0h] ; __vbaFreeObj
  loc_005CAD4F: cmp di, bx
  loc_005CAD52: jnz 005CB242h
  loc_005CAD58: mov ecx, [esi]
  loc_005CAD5A: push esi
  loc_005CAD5B: call [ecx+0000030Ch]
  loc_005CAD61: lea edx, var_24
  loc_005CAD64: push eax
  loc_005CAD65: push edx
  loc_005CAD66: call [004010A0h] ; __vbaObjSet
  loc_005CAD6C: mov edi, eax
  loc_005CAD6E: lea ecx, var_1C
  loc_005CAD71: push ecx
  loc_005CAD72: push edi
  loc_005CAD73: mov eax, [edi]
  loc_005CAD75: call [eax+000000A0h]
  loc_005CAD7B: cmp eax, ebx
  loc_005CAD7D: fnclex
  loc_005CAD7F: jge 005CAD93h
  loc_005CAD81: push 000000A0h
  loc_005CAD86: push 0041E5E8h
  loc_005CAD8B: push edi
  loc_005CAD8C: push eax
  loc_005CAD8D: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAD93: mov eax, var_1C
  loc_005CAD96: lea edx, var_3C
  loc_005CAD99: mov var_34, eax
  loc_005CAD9C: lea eax, var_4C
  loc_005CAD9F: mov edi, 00000008h
  loc_005CADA4: push edx
  loc_005CADA5: push eax
  loc_005CADA6: mov var_1C, ebx
  loc_005CADA9: mov var_3C, edi
  loc_005CADAC: call [004010D4h] ; rtcTrimVar
  loc_005CADB2: mov edx, [0061A13Ch]
  loc_005CADB8: mov var_74, 0041EAC0h ; "Select * From AgentThai WHERE AgentName='"
  loc_005CADBF: mov var_7C, edi
  loc_005CADC2: mov var_84, 0041E890h ; "'"
  loc_005CADCC: mov var_8C, edi
  loc_005CADD2: mov edi, [edx]
  loc_005CADD4: lea edx, var_28
  loc_005CADD7: mov ecx, 0000000Ah
  loc_005CADDC: push edx
  loc_005CADDD: mov var_AC, ecx
  loc_005CADE3: sub esp, 00000010h
  loc_005CADE6: mov eax, 80020004h
  loc_005CADEB: mov edx, esp
  loc_005CADED: mov var_A4, eax
  loc_005CADF3: sub esp, 00000010h
  loc_005CADF6: mov [edx], ecx
  loc_005CADF8: mov ecx, var_B8
  loc_005CADFE: mov [edx+00000004h], ecx
  loc_005CAE01: mov ecx, esp
  loc_005CAE03: sub esp, 00000010h
  loc_005CAE06: mov [edx+00000008h], eax
  loc_005CAE09: mov eax, var_B0
  loc_005CAE0F: mov [edx+0000000Ch], eax
  loc_005CAE12: mov edx, var_AC
  loc_005CAE18: mov eax, var_A8
  loc_005CAE1E: mov [ecx], edx
  loc_005CAE20: mov edx, var_A4
  loc_005CAE26: mov [ecx+00000004h], eax
  loc_005CAE29: mov eax, var_A0
  loc_005CAE2F: mov [ecx+00000008h], edx
  loc_005CAE32: mov edx, var_98
  loc_005CAE38: mov [ecx+0000000Ch], eax
  loc_005CAE3B: mov ecx, esp
  loc_005CAE3D: mov eax, 00000003h
  loc_005CAE42: mov [ecx], eax
  loc_005CAE44: mov eax, 00000004h
  loc_005CAE49: mov [ecx+00000004h], edx
  loc_005CAE4C: lea edx, var_4C
  loc_005CAE4F: mov [ecx+00000008h], eax
  loc_005CAE52: mov eax, var_90
  loc_005CAE58: mov [ecx+0000000Ch], eax
  loc_005CAE5B: lea ecx, var_7C
  loc_005CAE5E: push ecx
  loc_005CAE5F: lea eax, var_5C
  loc_005CAE62: push edx
  loc_005CAE63: push eax
  loc_005CAE64: call [004011B4h] ; __vbaVarCat
  loc_005CAE6A: lea ecx, var_8C
  loc_005CAE70: push eax
  loc_005CAE71: lea edx, var_6C
  loc_005CAE74: push ecx
  loc_005CAE75: push edx
  loc_005CAE76: call [004011B4h] ; __vbaVarCat
  loc_005CAE7C: push eax
  loc_005CAE7D: lea eax, var_20
  loc_005CAE80: push eax
  loc_005CAE81: call [004011B0h] ; __vbaStrVarVal
  loc_005CAE87: mov ecx, [0061A13Ch]
  loc_005CAE8D: push eax
  loc_005CAE8E: push ecx
  loc_005CAE8F: call [edi+000000BCh]
  loc_005CAE95: cmp eax, ebx
  loc_005CAE97: fnclex
  loc_005CAE99: jge 005CAEB3h
  loc_005CAE9B: mov edx, [0061A13Ch]
  loc_005CAEA1: push 000000BCh
  loc_005CAEA6: push 0041E928h
  loc_005CAEAB: push edx
  loc_005CAEAC: push eax
  loc_005CAEAD: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAEB3: mov eax, var_28
  loc_005CAEB6: mov edi, [004010A0h] ; __vbaObjSet
  loc_005CAEBC: push eax
  loc_005CAEBD: lea eax, var_18
  loc_005CAEC0: push eax
  loc_005CAEC1: mov var_28, ebx
  loc_005CAEC4: call edi
  loc_005CAEC6: lea ecx, var_20
  loc_005CAEC9: call [004012ACh] ; __vbaFreeStr
  loc_005CAECF: lea ecx, var_24
  loc_005CAED2: call [004012B0h] ; __vbaFreeObj
  loc_005CAED8: lea ecx, var_6C
  loc_005CAEDB: lea edx, var_5C
  loc_005CAEDE: push ecx
  loc_005CAEDF: lea eax, var_4C
  loc_005CAEE2: push edx
  loc_005CAEE3: lea ecx, var_3C
  loc_005CAEE6: push eax
  loc_005CAEE7: push ecx
  loc_005CAEE8: push 00000004h
  loc_005CAEEA: call [00401038h] ; __vbaFreeVarList
  loc_005CAEF0: mov eax, var_18
  loc_005CAEF3: add esp, 00000014h
  loc_005CAEF6: lea ecx, var_C0
  loc_005CAEFC: mov edx, [eax]
  loc_005CAEFE: push ecx
  loc_005CAEFF: push eax
  loc_005CAF00: call [edx+00000020h]
  loc_005CAF03: cmp eax, ebx
  loc_005CAF05: fnclex
  loc_005CAF07: jge 005CAF1Bh
  loc_005CAF09: mov edx, var_18
  loc_005CAF0C: push 00000020h
  loc_005CAF0E: push 0041E938h
  loc_005CAF13: push edx
  loc_005CAF14: push eax
  loc_005CAF15: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAF1B: mov eax, var_18
  loc_005CAF1E: lea edx, var_C4
  loc_005CAF24: push edx
  loc_005CAF25: push eax
  loc_005CAF26: mov ecx, [eax]
  loc_005CAF28: call [ecx+00000034h]
  loc_005CAF2B: cmp eax, ebx
  loc_005CAF2D: fnclex
  loc_005CAF2F: jge 005CAF43h
  loc_005CAF31: mov ecx, var_18
  loc_005CAF34: push 00000034h
  loc_005CAF36: push 0041E938h
  loc_005CAF3B: push ecx
  loc_005CAF3C: push eax
  loc_005CAF3D: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAF43: xor edx, edx
  loc_005CAF45: cmp var_C4, bx
  loc_005CAF4C: setz dl
  loc_005CAF4F: xor eax, eax
  loc_005CAF51: cmp var_C0, bx
  loc_005CAF58: setz al
  loc_005CAF5B: or edx, eax
  loc_005CAF5D: jz 005CB11Ch
  loc_005CAF63: mov ecx, [esi]
  loc_005CAF65: push esi
  loc_005CAF66: call [ecx+0000030Ch]
  loc_005CAF6C: lea edx, var_2C
  loc_005CAF6F: push eax
  loc_005CAF70: push edx
  loc_005CAF71: call edi
  loc_005CAF73: mov var_D4, eax
  loc_005CAF79: mov eax, var_18
  loc_005CAF7C: lea edx, var_24
  loc_005CAF7F: mov ecx, [eax]
  loc_005CAF81: push edx
  loc_005CAF82: push eax
  loc_005CAF83: call [ecx+000000B4h]
  loc_005CAF89: cmp eax, ebx
  loc_005CAF8B: fnclex
  loc_005CAF8D: jge 005CAFA4h
  loc_005CAF8F: mov ecx, var_18
  loc_005CAF92: push 000000B4h
  loc_005CAF97: push 0041E938h
  loc_005CAF9C: push ecx
  loc_005CAF9D: push eax
  loc_005CAF9E: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAFA4: lea edi, var_28
  loc_005CAFA7: mov eax, var_24
  loc_005CAFAA: push edi
  loc_005CAFAB: mov ecx, 00000008h
  loc_005CAFB0: sub esp, 00000010h
  loc_005CAFB3: mov var_7C, ecx
  loc_005CAFB6: mov edi, esp
  loc_005CAFB8: mov var_74, 0041EB18h ; "AgentName"
  loc_005CAFBF: mov edx, [eax]
  loc_005CAFC1: push eax
  loc_005CAFC2: mov [edi], ecx
  loc_005CAFC4: mov ecx, var_78
  loc_005CAFC7: mov var_CC, eax
  loc_005CAFCD: mov [edi+00000004h], ecx
  loc_005CAFD0: mov ecx, var_74
  loc_005CAFD3: mov [edi+00000008h], ecx
  loc_005CAFD6: mov ecx, var_70
  loc_005CAFD9: mov [edi+0000000Ch], ecx
  loc_005CAFDC: call [edx+00000030h]
  loc_005CAFDF: cmp eax, ebx
  loc_005CAFE1: fnclex
  loc_005CAFE3: jge 005CAFFAh
  loc_005CAFE5: mov edx, var_CC
  loc_005CAFEB: push 00000030h
  loc_005CAFED: push 0041EA14h ; "S"
  loc_005CAFF2: push edx
  loc_005CAFF3: push eax
  loc_005CAFF4: call [00401074h] ; __vbaHresultCheckObj
  loc_005CAFFA: mov eax, var_28
  loc_005CAFFD: lea ecx, var_4C
  loc_005CB000: mov var_34, eax
  loc_005CB003: lea eax, var_3C
  loc_005CB006: push eax
  loc_005CB007: push ecx
  loc_005CB008: mov var_28, ebx
  loc_005CB00B: mov var_3C, 00000009h
  loc_005CB012: call [004010D4h] ; rtcTrimVar
  loc_005CB018: mov edx, var_D4
  loc_005CB01E: lea eax, var_4C
  loc_005CB021: lea ecx, var_1C
  loc_005CB024: push eax
  loc_005CB025: mov edi, [edx]
  loc_005CB027: push ecx
  loc_005CB028: call [004011B0h] ; __vbaStrVarVal
  loc_005CB02E: mov edx, edi
  loc_005CB030: mov edi, var_D4
  loc_005CB036: push eax
  loc_005CB037: push edi
  loc_005CB038: call [edx+000000A4h]
  loc_005CB03E: cmp eax, ebx
  loc_005CB040: fnclex
  loc_005CB042: jge 005CB056h
  loc_005CB044: push 000000A4h
  loc_005CB049: push 0041E5E8h
  loc_005CB04E: push edi
  loc_005CB04F: push eax
  loc_005CB050: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB056: lea ecx, var_1C
  loc_005CB059: call [004012ACh] ; __vbaFreeStr
  loc_005CB05F: lea eax, var_2C
  loc_005CB062: lea ecx, var_24
  loc_005CB065: push eax
  loc_005CB066: push ecx
  loc_005CB067: push 00000002h
  loc_005CB069: call [00401040h] ; __vbaFreeObjList
  loc_005CB06F: lea edx, var_4C
  loc_005CB072: lea eax, var_3C
  loc_005CB075: push edx
  loc_005CB076: push eax
  loc_005CB077: push 00000002h
  loc_005CB079: call [00401038h] ; __vbaFreeVarList
  loc_005CB07F: mov ecx, [esi]
  loc_005CB081: add esp, 00000018h
  loc_005CB084: push esi
  loc_005CB085: call [ecx+0000030Ch]
  loc_005CB08B: lea edx, var_24
  loc_005CB08E: push eax
  loc_005CB08F: push edx
  loc_005CB090: call [004010A0h] ; __vbaObjSet
  loc_005CB096: mov edi, eax
  loc_005CB098: lea ecx, var_1C
  loc_005CB09B: push ecx
  loc_005CB09C: push edi
  loc_005CB09D: mov eax, [edi]
  loc_005CB09F: call [eax+000000A0h]
  loc_005CB0A5: cmp eax, ebx
  loc_005CB0A7: fnclex
  loc_005CB0A9: jge 005CB0BDh
  loc_005CB0AB: push 000000A0h
  loc_005CB0B0: push 0041E5E8h
  loc_005CB0B5: push edi
  loc_005CB0B6: push eax
  loc_005CB0B7: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB0BD: mov eax, var_1C
  loc_005CB0C0: lea edx, var_3C
  loc_005CB0C3: mov var_34, eax
  loc_005CB0C6: lea eax, var_4C
  loc_005CB0C9: push edx
  loc_005CB0CA: push eax
  loc_005CB0CB: mov var_1C, ebx
  loc_005CB0CE: mov var_3C, 00000008h
  loc_005CB0D5: call [004010D4h] ; rtcTrimVar
  loc_005CB0DB: lea ecx, var_4C
  loc_005CB0DE: push ecx
  loc_005CB0DF: call [00401028h] ; __vbaStrVarMove
  loc_005CB0E5: mov edx, eax
  loc_005CB0E7: mov ecx, 0061A0B8h
  loc_005CB0EC: call [00401270h] ; __vbaStrMove
  loc_005CB0F2: lea ecx, var_24
  loc_005CB0F5: call [004012B0h] ; __vbaFreeObj
  loc_005CB0FB: lea edx, var_4C
  loc_005CB0FE: lea eax, var_3C
  loc_005CB101: push edx
  loc_005CB102: push eax
  loc_005CB103: push 00000002h
  loc_005CB105: call [00401038h] ; __vbaFreeVarList
  loc_005CB10B: mov ecx, [esi]
  loc_005CB10D: add esp, 0000000Ch
  loc_005CB110: push esi
  loc_005CB111: call [ecx+00000704h]
  loc_005CB117: jmp 005CB204h
  loc_005CB11C: mov edx, [esi]
  loc_005CB11E: push esi
  loc_005CB11F: call [edx+0000030Ch]
  loc_005CB125: push eax
  loc_005CB126: lea eax, var_24
  loc_005CB129: push eax
  loc_005CB12A: call edi
  loc_005CB12C: mov edi, eax
  loc_005CB12E: push 0041E5D4h
  loc_005CB133: push edi
  loc_005CB134: mov ecx, [edi]
  loc_005CB136: call [ecx+000000A4h]
  loc_005CB13C: cmp eax, ebx
  loc_005CB13E: fnclex
  loc_005CB140: jge 005CB154h
  loc_005CB142: push 000000A4h
  loc_005CB147: push 0041E5E8h
  loc_005CB14C: push edi
  loc_005CB14D: push eax
  loc_005CB14E: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB154: mov edi, [004012B0h] ; __vbaFreeObj
  loc_005CB15A: lea ecx, var_24
  loc_005CB15D: call edi
  loc_005CB15F: mov edx, [esi]
  loc_005CB161: push esi
  loc_005CB162: call [edx+0000030Ch]
  loc_005CB168: push eax
  loc_005CB169: lea eax, var_24
  loc_005CB16C: push eax
  loc_005CB16D: call [004010A0h] ; __vbaObjSet
  loc_005CB173: mov esi, eax
  loc_005CB175: push esi
  loc_005CB176: mov ecx, [esi]
  loc_005CB178: call [ecx+00000204h]
  loc_005CB17E: cmp eax, ebx
  loc_005CB180: fnclex
  loc_005CB182: jge 005CB196h
  loc_005CB184: push 00000204h
  loc_005CB189: push 0041E5E8h
  loc_005CB18E: push esi
  loc_005CB18F: push eax
  loc_005CB190: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB196: lea ecx, var_24
  loc_005CB199: call edi
  loc_005CB19B: mov ecx, 80020004h
  loc_005CB1A0: mov eax, 0000000Ah
  loc_005CB1A5: mov var_64, ecx
  loc_005CB1A8: mov var_54, ecx
  loc_005CB1AB: mov var_44, ecx
  loc_005CB1AE: lea edx, var_7C
  loc_005CB1B1: lea ecx, var_3C
  loc_005CB1B4: mov var_6C, eax
  loc_005CB1B7: mov var_5C, eax
  loc_005CB1BA: mov var_4C, eax
  loc_005CB1BD: mov var_74, 0041EB30h ; "AgentName Not Found!"
  loc_005CB1C4: mov var_7C, 00000008h
  loc_005CB1CB: call [00401240h] ; __vbaVarDup
  loc_005CB1D1: lea edx, var_6C
  loc_005CB1D4: lea eax, var_5C
  loc_005CB1D7: push edx
  loc_005CB1D8: lea ecx, var_4C
  loc_005CB1DB: push eax
  loc_005CB1DC: push ecx
  loc_005CB1DD: lea edx, var_3C
  loc_005CB1E0: push 00000010h
  loc_005CB1E2: push edx
  loc_005CB1E3: call [004010A4h] ; rtcMsgBox
  loc_005CB1E9: lea eax, var_6C
  loc_005CB1EC: lea ecx, var_5C
  loc_005CB1EF: push eax
  loc_005CB1F0: lea edx, var_4C
  loc_005CB1F3: push ecx
  loc_005CB1F4: lea eax, var_3C
  loc_005CB1F7: push edx
  loc_005CB1F8: push eax
  loc_005CB1F9: push 00000004h
  loc_005CB1FB: call [00401038h] ; __vbaFreeVarList
  loc_005CB201: add esp, 00000014h
  loc_005CB204: mov eax, var_18
  loc_005CB207: push eax
  loc_005CB208: mov ecx, [eax]
  loc_005CB20A: call [ecx+000000C4h]
  loc_005CB210: cmp eax, ebx
  loc_005CB212: fnclex
  loc_005CB214: jge 005CB22Bh
  loc_005CB216: mov edx, var_18
  loc_005CB219: push 000000C4h
  loc_005CB21E: push 0041E938h
  loc_005CB223: push edx
  loc_005CB224: push eax
  loc_005CB225: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB22B: push 0041E938h
  loc_005CB230: push ebx
  loc_005CB231: call [00401274h] ; __vbaCastObj
  loc_005CB237: push eax
  loc_005CB238: lea eax, var_18
  loc_005CB23B: push eax
  loc_005CB23C: call [004010A0h] ; __vbaObjSet
  loc_005CB242: mov var_4, ebx
  loc_005CB245: push 005CB296h
  loc_005CB24A: jmp 005CB28Ch
  loc_005CB24C: lea ecx, var_20
  loc_005CB24F: lea edx, var_1C
  loc_005CB252: push ecx
  loc_005CB253: push edx
  loc_005CB254: push 00000002h
  loc_005CB256: call [004011FCh] ; __vbaFreeStrList
  loc_005CB25C: lea eax, var_2C
  loc_005CB25F: lea ecx, var_28
  loc_005CB262: push eax
  loc_005CB263: lea edx, var_24
  loc_005CB266: push ecx
  loc_005CB267: push edx
  loc_005CB268: push 00000003h
  loc_005CB26A: call [00401040h] ; __vbaFreeObjList
  loc_005CB270: lea eax, var_6C
  loc_005CB273: lea ecx, var_5C
  loc_005CB276: push eax
  loc_005CB277: lea edx, var_4C
  loc_005CB27A: push ecx
  loc_005CB27B: lea eax, var_3C
  loc_005CB27E: push edx
  loc_005CB27F: push eax
  loc_005CB280: push 00000004h
  loc_005CB282: call [00401038h] ; __vbaFreeVarList
  loc_005CB288: add esp, 00000030h
  loc_005CB28B: ret
  loc_005CB28C: lea ecx, var_18
  loc_005CB28F: call [004012B0h] ; __vbaFreeObj
  loc_005CB295: ret
  loc_005CB296: mov eax, Me
  loc_005CB299: push eax
  loc_005CB29A: mov ecx, [eax]
  loc_005CB29C: call [ecx+00000008h]
  loc_005CB29F: mov eax, var_4
  loc_005CB2A2: mov ecx, var_14
  loc_005CB2A5: pop edi
  loc_005CB2A6: pop esi
  loc_005CB2A7: mov fs:[00000000h], ecx
  loc_005CB2AE: pop ebx
  loc_005CB2AF: mov esp, ebp
  loc_005CB2B1: pop ebp
  loc_005CB2B2: retn 0004h
End Sub

Private Sub cmdClose_Click() '5C8D30
  loc_005C8D30: push ebp
  loc_005C8D31: mov ebp, esp
  loc_005C8D33: sub esp, 0000000Ch
  loc_005C8D36: push 00403B36h ; __vbaExceptHandler
  loc_005C8D3B: mov eax, fs:[00000000h]
  loc_005C8D41: push eax
  loc_005C8D42: mov fs:[00000000h], esp
  loc_005C8D49: sub esp, 00000018h
  loc_005C8D4C: push ebx
  loc_005C8D4D: push esi
  loc_005C8D4E: push edi
  loc_005C8D4F: mov var_C, esp
  loc_005C8D52: mov var_8, 00403038h
  loc_005C8D59: mov edi, Me
  loc_005C8D5C: mov eax, edi
  loc_005C8D5E: and eax, 00000001h
  loc_005C8D61: mov var_4, eax
  loc_005C8D64: and edi, FFFFFFFEh
  loc_005C8D67: push edi
  loc_005C8D68: mov Me, edi
  loc_005C8D6B: mov ecx, [edi]
  loc_005C8D6D: call [ecx+00000004h]
  loc_005C8D70: mov eax, [0061B394h]
  loc_005C8D75: xor ebx, ebx
  loc_005C8D77: cmp eax, ebx
  loc_005C8D79: mov var_18, ebx
  loc_005C8D7C: jnz 005C8D8Eh
  loc_005C8D7E: push 0061B394h
  loc_005C8D83: push 0041E4A0h
  loc_005C8D88: call [004011DCh] ; __vbaNew2
  loc_005C8D8E: mov esi, [0061B394h]
  loc_005C8D94: lea eax, var_18
  loc_005C8D97: push edi
  loc_005C8D98: push eax
  loc_005C8D99: mov edx, [esi]
  loc_005C8D9B: mov var_2C, edx
  loc_005C8D9E: call [004010B8h] ; __vbaObjSetAddref
  loc_005C8DA4: mov ecx, var_2C
  loc_005C8DA7: push eax
  loc_005C8DA8: push esi
  loc_005C8DA9: call [ecx+00000010h]
  loc_005C8DAC: cmp eax, ebx
  loc_005C8DAE: fnclex
  loc_005C8DB0: jge 005C8DC1h
  loc_005C8DB2: push 00000010h
  loc_005C8DB4: push 0041E490h
  loc_005C8DB9: push esi
  loc_005C8DBA: push eax
  loc_005C8DBB: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8DC1: lea ecx, var_18
  loc_005C8DC4: call [004012B0h] ; __vbaFreeObj
  loc_005C8DCA: mov var_4, ebx
  loc_005C8DCD: push 005C8DDFh
  loc_005C8DD2: jmp 005C8DDEh
  loc_005C8DD4: lea ecx, var_18
  loc_005C8DD7: call [004012B0h] ; __vbaFreeObj
  loc_005C8DDD: ret
  loc_005C8DDE: ret
  loc_005C8DDF: mov eax, Me
  loc_005C8DE2: push eax
  loc_005C8DE3: mov edx, [eax]
  loc_005C8DE5: call [edx+00000008h]
  loc_005C8DE8: mov eax, var_4
  loc_005C8DEB: mov ecx, var_14
  loc_005C8DEE: pop edi
  loc_005C8DEF: pop esi
  loc_005C8DF0: mov fs:[00000000h], ecx
  loc_005C8DF7: pop ebx
  loc_005C8DF8: mov esp, ebp
  loc_005C8DFA: pop ebp
  loc_005C8DFB: retn 0004h
End Sub

Private Sub Form_Load() '5CA170
  loc_005CA170: push ebp
  loc_005CA171: mov ebp, esp
  loc_005CA173: sub esp, 0000000Ch
  loc_005CA176: push 00403B36h ; __vbaExceptHandler
  loc_005CA17B: mov eax, fs:[00000000h]
  loc_005CA181: push eax
  loc_005CA182: mov fs:[00000000h], esp
  loc_005CA189: sub esp, 0000014Ch
  loc_005CA18F: push ebx
  loc_005CA190: push esi
  loc_005CA191: push edi
  loc_005CA192: mov var_C, esp
  loc_005CA195: mov var_8, 00403078h
  loc_005CA19C: mov eax, Me
  loc_005CA19F: mov ecx, eax
  loc_005CA1A1: and ecx, 00000001h
  loc_005CA1A4: mov var_4, ecx
  loc_005CA1A7: and al, FEh
  loc_005CA1A9: push eax
  loc_005CA1AA: mov Me, eax
  loc_005CA1AD: mov edx, [eax]
  loc_005CA1AF: call [edx+00000004h]
  loc_005CA1B2: mov edi, [004010D4h] ; rtcTrimVar
  loc_005CA1B8: lea eax, var_9C
  loc_005CA1BE: xor esi, esi
  loc_005CA1C0: lea ecx, var_3C
  loc_005CA1C3: mov ebx, 00004008h
  loc_005CA1C8: push eax
  loc_005CA1C9: mov var_9C, esi
  loc_005CA1CF: push ecx
  loc_005CA1D0: mov var_18, esi
  loc_005CA1D3: mov var_1C, esi
  loc_005CA1D6: mov var_20, esi
  loc_005CA1D9: mov var_24, esi
  loc_005CA1DC: mov var_28, esi
  loc_005CA1DF: mov var_2C, esi
  loc_005CA1E2: mov var_3C, esi
  loc_005CA1E5: mov var_4C, esi
  loc_005CA1E8: mov var_5C, esi
  loc_005CA1EB: mov var_6C, esi
  loc_005CA1EE: mov var_7C, esi
  loc_005CA1F1: mov var_8C, esi
  loc_005CA1F7: mov var_AC, esi
  loc_005CA1FD: mov var_BC, esi
  loc_005CA203: mov var_CC, esi
  loc_005CA209: mov var_DC, esi
  loc_005CA20F: mov var_110, esi
  loc_005CA215: mov var_114, esi
  loc_005CA21B: mov var_94, 0061A05Ch
  loc_005CA225: mov var_9C, ebx
  loc_005CA22B: call edi
  loc_005CA22D: lea edx, var_CC
  loc_005CA233: lea eax, var_6C
  loc_005CA236: push edx
  loc_005CA237: push eax
  loc_005CA238: mov var_C4, 0061A060h
  loc_005CA242: mov var_CC, ebx
  loc_005CA248: call edi
  loc_005CA24A: mov edi, 00000008h
  loc_005CA24F: mov var_A4, 00420954h ; "Select * From LuckyNo Where OnDate=#"
  loc_005CA259: mov var_AC, edi
  loc_005CA25F: mov var_BC, edi
  loc_005CA265: mov var_DC, edi
  loc_005CA26B: mov edi, [0061A13Ch]
  loc_005CA271: mov var_B4, 004209A4h ; "# And AMPM='"
  loc_005CA27B: mov var_D4, 0041E890h ; "'"
  loc_005CA285: mov ebx, [edi]
  loc_005CA287: lea edi, var_20
  loc_005CA28A: push edi
  loc_005CA28B: mov ecx, 0000000Ah
  loc_005CA290: sub esp, 00000010h
  loc_005CA293: mov var_FC, ecx
  loc_005CA299: mov edi, esp
  loc_005CA29B: mov eax, 80020004h
  loc_005CA2A0: mov edx, eax
  loc_005CA2A2: sub esp, 00000010h
  loc_005CA2A5: mov [edi], ecx
  loc_005CA2A7: mov ecx, var_108
  loc_005CA2AD: mov [edi+00000004h], ecx
  loc_005CA2B0: mov ecx, esp
  loc_005CA2B2: mov [edi+00000008h], eax
  loc_005CA2B5: mov eax, var_100
  loc_005CA2BB: mov [edi+0000000Ch], eax
  loc_005CA2BE: mov eax, var_FC
  loc_005CA2C4: mov [ecx], eax
  loc_005CA2C6: mov eax, var_F8
  loc_005CA2CC: mov [ecx+00000004h], eax
  loc_005CA2CF: mov [ecx+00000008h], edx
  loc_005CA2D2: mov edx, var_F0
  loc_005CA2D8: sub esp, 00000010h
  loc_005CA2DB: mov [ecx+0000000Ch], edx
  loc_005CA2DE: mov edx, var_E8
  loc_005CA2E4: mov ecx, esp
  loc_005CA2E6: mov eax, 00000003h
  loc_005CA2EB: mov edi, [004011B4h] ; __vbaVarCat
  loc_005CA2F1: mov [ecx], eax
  loc_005CA2F3: mov eax, 00000004h
  loc_005CA2F8: mov [ecx+00000004h], edx
  loc_005CA2FB: lea edx, var_3C
  loc_005CA2FE: mov [ecx+00000008h], eax
  loc_005CA301: mov eax, var_E0
  loc_005CA307: mov [ecx+0000000Ch], eax
  loc_005CA30A: lea ecx, var_AC
  loc_005CA310: push ecx
  loc_005CA311: lea eax, var_4C
  loc_005CA314: push edx
  loc_005CA315: push eax
  loc_005CA316: call edi
  loc_005CA318: lea ecx, var_BC
  loc_005CA31E: push eax
  loc_005CA31F: lea edx, var_5C
  loc_005CA322: push ecx
  loc_005CA323: push edx
  loc_005CA324: call edi
  loc_005CA326: push eax
  loc_005CA327: lea eax, var_6C
  loc_005CA32A: lea ecx, var_7C
  loc_005CA32D: push eax
  loc_005CA32E: push ecx
  loc_005CA32F: call edi
  loc_005CA331: push eax
  loc_005CA332: lea edx, var_DC
  loc_005CA338: lea eax, var_8C
  loc_005CA33E: push edx
  loc_005CA33F: push eax
  loc_005CA340: call edi
  loc_005CA342: lea ecx, var_1C
  loc_005CA345: push eax
  loc_005CA346: push ecx
  loc_005CA347: call [004011B0h] ; __vbaStrVarVal
  loc_005CA34D: mov edx, [0061A13Ch]
  loc_005CA353: push eax
  loc_005CA354: push edx
  loc_005CA355: call [ebx+000000BCh]
  loc_005CA35B: cmp eax, esi
  loc_005CA35D: fnclex
  loc_005CA35F: jge 005CA37Dh
  loc_005CA361: mov ecx, [0061A13Ch]
  loc_005CA367: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005CA36D: push 000000BCh
  loc_005CA372: push 0041E928h
  loc_005CA377: push ecx
  loc_005CA378: push eax
  loc_005CA379: call edi
  loc_005CA37B: jmp 005CA383h
  loc_005CA37D: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005CA383: mov eax, var_20
  loc_005CA386: lea edx, var_18
  loc_005CA389: push eax
  loc_005CA38A: push edx
  loc_005CA38B: mov var_20, esi
  loc_005CA38E: call [004010A0h] ; __vbaObjSet
  loc_005CA394: lea ecx, var_1C
  loc_005CA397: call [004012ACh] ; __vbaFreeStr
  loc_005CA39D: lea eax, var_8C
  loc_005CA3A3: lea ecx, var_7C
  loc_005CA3A6: push eax
  loc_005CA3A7: lea edx, var_6C
  loc_005CA3AA: push ecx
  loc_005CA3AB: lea eax, var_5C
  loc_005CA3AE: push edx
  loc_005CA3AF: lea ecx, var_4C
  loc_005CA3B2: push eax
  loc_005CA3B3: lea edx, var_3C
  loc_005CA3B6: push ecx
  loc_005CA3B7: push edx
  loc_005CA3B8: push 00000006h
  loc_005CA3BA: call [00401038h] ; __vbaFreeVarList
  loc_005CA3C0: mov eax, var_18
  loc_005CA3C3: add esp, 0000001Ch
  loc_005CA3C6: lea edx, var_110
  loc_005CA3CC: mov ecx, [eax]
  loc_005CA3CE: push edx
  loc_005CA3CF: push eax
  loc_005CA3D0: call [ecx+00000020h]
  loc_005CA3D3: cmp eax, esi
  loc_005CA3D5: fnclex
  loc_005CA3D7: jge 005CA3E7h
  loc_005CA3D9: mov ecx, var_18
  loc_005CA3DC: push 00000020h
  loc_005CA3DE: push 0041E938h
  loc_005CA3E3: push ecx
  loc_005CA3E4: push eax
  loc_005CA3E5: call edi
  loc_005CA3E7: mov eax, var_18
  loc_005CA3EA: lea ecx, var_114
  loc_005CA3F0: push ecx
  loc_005CA3F1: push eax
  loc_005CA3F2: mov edx, [eax]
  loc_005CA3F4: call [edx+00000034h]
  loc_005CA3F7: cmp eax, esi
  loc_005CA3F9: fnclex
  loc_005CA3FB: jge 005CA40Bh
  loc_005CA3FD: mov edx, var_18
  loc_005CA400: push 00000034h
  loc_005CA402: push 0041E938h
  loc_005CA407: push edx
  loc_005CA408: push eax
  loc_005CA409: call edi
  loc_005CA40B: mov eax, var_18
  loc_005CA40E: lea edx, var_20
  loc_005CA411: push edx
  loc_005CA412: push eax
  loc_005CA413: mov ecx, [eax]
  loc_005CA415: call [ecx+000000B4h]
  loc_005CA41B: cmp eax, esi
  loc_005CA41D: fnclex
  loc_005CA41F: jge 005CA432h
  loc_005CA421: mov ecx, var_18
  loc_005CA424: push 000000B4h
  loc_005CA429: push 0041E938h
  loc_005CA42E: push ecx
  loc_005CA42F: push eax
  loc_005CA430: call edi
  loc_005CA432: lea ebx, var_24
  loc_005CA435: mov eax, var_20
  loc_005CA438: push ebx
  loc_005CA439: mov ecx, 00000008h
  loc_005CA43E: sub esp, 00000010h
  loc_005CA441: mov var_9C, ecx
  loc_005CA447: mov ebx, esp
  loc_005CA449: mov var_94, 004209C4h ; "LNo"
  loc_005CA453: mov edx, [eax]
  loc_005CA455: push eax
  loc_005CA456: mov [ebx], ecx
  loc_005CA458: mov ecx, var_98
  loc_005CA45E: mov var_124, eax
  loc_005CA464: mov [ebx+00000004h], ecx
  loc_005CA467: mov ecx, var_94
  loc_005CA46D: mov [ebx+00000008h], ecx
  loc_005CA470: mov ecx, var_90
  loc_005CA476: mov [ebx+0000000Ch], ecx
  loc_005CA479: call [edx+00000030h]
  loc_005CA47C: cmp eax, esi
  loc_005CA47E: fnclex
  loc_005CA480: jge 005CA493h
  loc_005CA482: mov edx, var_124
  loc_005CA488: push 00000030h
  loc_005CA48A: push 0041EA14h ; "S"
  loc_005CA48F: push edx
  loc_005CA490: push eax
  loc_005CA491: call edi
  loc_005CA493: mov eax, var_24
  loc_005CA496: mov var_24, esi
  loc_005CA499: mov var_34, eax
  loc_005CA49C: lea eax, var_3C
  loc_005CA49F: push eax
  loc_005CA4A0: mov var_3C, 00000009h
  loc_005CA4A7: call [00401118h] ; rtcIsNull
  loc_005CA4AD: mov ecx, var_114
  loc_005CA4B3: mov edx, var_110
  loc_005CA4B9: mov bx, ax
  loc_005CA4BC: and ecx, edx
  loc_005CA4BE: not ebx
  loc_005CA4C0: not ecx
  loc_005CA4C2: and ebx, ecx
  loc_005CA4C4: lea ecx, var_20
  loc_005CA4C7: call [004012B0h] ; __vbaFreeObj
  loc_005CA4CD: lea ecx, var_3C
  loc_005CA4D0: call [00401020h] ; __vbaFreeVar
  loc_005CA4D6: cmp bx, si
  loc_005CA4D9: jz 005CAA18h
  loc_005CA4DF: mov eax, Me
  loc_005CA4E2: push eax
  loc_005CA4E3: mov edx, [eax]
  loc_005CA4E5: call [edx+00000314h]
  loc_005CA4EB: push eax
  loc_005CA4EC: lea eax, var_28
  loc_005CA4EF: push eax
  loc_005CA4F0: call [004010A0h] ; __vbaObjSet
  loc_005CA4F6: mov var_12C, eax
  loc_005CA4FC: mov eax, var_18
  loc_005CA4FF: lea edx, var_20
  loc_005CA502: mov ecx, [eax]
  loc_005CA504: push edx
  loc_005CA505: push eax
  loc_005CA506: call [ecx+000000B4h]
  loc_005CA50C: cmp eax, esi
  loc_005CA50E: fnclex
  loc_005CA510: jge 005CA523h
  loc_005CA512: mov ecx, var_18
  loc_005CA515: push 000000B4h
  loc_005CA51A: push 0041E938h
  loc_005CA51F: push ecx
  loc_005CA520: push eax
  loc_005CA521: call edi
  loc_005CA523: lea ebx, var_24
  loc_005CA526: mov eax, var_20
  loc_005CA529: push ebx
  loc_005CA52A: mov ecx, 00000008h
  loc_005CA52F: sub esp, 00000010h
  loc_005CA532: mov var_9C, ecx
  loc_005CA538: mov ebx, esp
  loc_005CA53A: mov var_94, 004209C4h ; "LNo"
  loc_005CA544: mov edx, [eax]
  loc_005CA546: push eax
  loc_005CA547: mov [ebx], ecx
  loc_005CA549: mov ecx, var_98
  loc_005CA54F: mov var_11C, eax
  loc_005CA555: mov [ebx+00000004h], ecx
  loc_005CA558: mov ecx, var_94
  loc_005CA55E: mov [ebx+00000008h], ecx
  loc_005CA561: mov ecx, var_90
  loc_005CA567: mov [ebx+0000000Ch], ecx
  loc_005CA56A: call [edx+00000030h]
  loc_005CA56D: cmp eax, esi
  loc_005CA56F: fnclex
  loc_005CA571: jge 005CA584h
  loc_005CA573: mov edx, var_11C
  loc_005CA579: push 00000030h
  loc_005CA57B: push 0041EA14h ; "S"
  loc_005CA580: push edx
  loc_005CA581: push eax
  loc_005CA582: call edi
  loc_005CA584: mov eax, var_24
  loc_005CA587: lea edx, var_3C
  loc_005CA58A: push edx
  loc_005CA58B: push eax
  loc_005CA58C: mov ecx, [eax]
  loc_005CA58E: mov ebx, eax
  loc_005CA590: call [ecx+00000044h]
  loc_005CA593: cmp eax, esi
  loc_005CA595: fnclex
  loc_005CA597: jge 005CA5A4h
  loc_005CA599: push 00000044h
  loc_005CA59B: push 0041EA48h
  loc_005CA5A0: push ebx
  loc_005CA5A1: push eax
  loc_005CA5A2: call edi
  loc_005CA5A4: mov eax, var_12C
  loc_005CA5AA: lea ecx, var_2C
  loc_005CA5AD: lea edx, var_3C
  loc_005CA5B0: push ecx
  loc_005CA5B1: mov ebx, [eax]
  loc_005CA5B3: push edx
  loc_005CA5B4: call [004011C0h] ; __vbaI2Var
  loc_005CA5BA: mov var_14C, ebx
  loc_005CA5C0: mov ebx, var_12C
  loc_005CA5C6: push eax
  loc_005CA5C7: mov eax, var_14C
  loc_005CA5CD: push ebx
  loc_005CA5CE: call [eax+00000040h]
  loc_005CA5D1: cmp eax, esi
  loc_005CA5D3: fnclex
  loc_005CA5D5: jge 005CA5E2h
  loc_005CA5D7: push 00000040h
  loc_005CA5D9: push 0041E5D8h
  loc_005CA5DE: push ebx
  loc_005CA5DF: push eax
  loc_005CA5E0: call edi
  loc_005CA5E2: mov eax, var_2C
  loc_005CA5E5: push FFFFFFFFh
  loc_005CA5E7: push eax
  loc_005CA5E8: mov ebx, eax
  loc_005CA5EA: mov ecx, [eax]
  loc_005CA5EC: call [ecx+000000BCh]
  loc_005CA5F2: cmp eax, esi
  loc_005CA5F4: fnclex
  loc_005CA5F6: jge 005CA606h
  loc_005CA5F8: push 000000BCh
  loc_005CA5FD: push 0041E5E8h
  loc_005CA602: push ebx
  loc_005CA603: push eax
  loc_005CA604: call edi
  loc_005CA606: lea edx, var_2C
  loc_005CA609: lea eax, var_28
  loc_005CA60C: push edx
  loc_005CA60D: lea ecx, var_24
  loc_005CA610: push eax
  loc_005CA611: lea edx, var_20
  loc_005CA614: push ecx
  loc_005CA615: push edx
  loc_005CA616: push 00000004h
  loc_005CA618: call [00401040h] ; __vbaFreeObjList
  loc_005CA61E: add esp, 00000014h
  loc_005CA621: lea ecx, var_3C
  loc_005CA624: call [00401020h] ; __vbaFreeVar
  loc_005CA62A: mov eax, var_18
  loc_005CA62D: lea edx, var_20
  loc_005CA630: push edx
  loc_005CA631: push eax
  loc_005CA632: mov ecx, [eax]
  loc_005CA634: call [ecx+000000B4h]
  loc_005CA63A: cmp eax, esi
  loc_005CA63C: fnclex
  loc_005CA63E: jge 005CA651h
  loc_005CA640: mov ecx, var_18
  loc_005CA643: push 000000B4h
  loc_005CA648: push 0041E938h
  loc_005CA64D: push ecx
  loc_005CA64E: push eax
  loc_005CA64F: call edi
  loc_005CA651: lea ebx, var_24
  loc_005CA654: mov eax, var_20
  loc_005CA657: push ebx
  loc_005CA658: mov ecx, 00000008h
  loc_005CA65D: sub esp, 00000010h
  loc_005CA660: mov var_9C, ecx
  loc_005CA666: mov ebx, esp
  loc_005CA668: mov var_94, 004209C4h ; "LNo"
  loc_005CA672: mov edx, [eax]
  loc_005CA674: push eax
  loc_005CA675: mov [ebx], ecx
  loc_005CA677: mov ecx, var_98
  loc_005CA67D: mov var_11C, eax
  loc_005CA683: mov [ebx+00000004h], ecx
  loc_005CA686: mov ecx, var_94
  loc_005CA68C: mov [ebx+00000008h], ecx
  loc_005CA68F: mov ecx, var_90
  loc_005CA695: mov [ebx+0000000Ch], ecx
  loc_005CA698: call [edx+00000030h]
  loc_005CA69B: cmp eax, esi
  loc_005CA69D: fnclex
  loc_005CA69F: jge 005CA6B2h
  loc_005CA6A1: mov edx, var_11C
  loc_005CA6A7: push 00000030h
  loc_005CA6A9: push 0041EA14h ; "S"
  loc_005CA6AE: push edx
  loc_005CA6AF: push eax
  loc_005CA6B0: call edi
  loc_005CA6B2: mov eax, var_24
  loc_005CA6B5: lea edx, var_3C
  loc_005CA6B8: push edx
  loc_005CA6B9: push eax
  loc_005CA6BA: mov ecx, [eax]
  loc_005CA6BC: mov ebx, eax
  loc_005CA6BE: call [ecx+00000044h]
  loc_005CA6C1: cmp eax, esi
  loc_005CA6C3: fnclex
  loc_005CA6C5: jge 005CA6D2h
  loc_005CA6C7: push 00000044h
  loc_005CA6C9: push 0041EA48h
  loc_005CA6CE: push ebx
  loc_005CA6CF: push eax
  loc_005CA6D0: call edi
  loc_005CA6D2: mov eax, Me
  loc_005CA6D5: push eax
  loc_005CA6D6: mov ecx, [eax]
  loc_005CA6D8: call [ecx+00000314h]
  loc_005CA6DE: lea edx, var_28
  loc_005CA6E1: push eax
  loc_005CA6E2: push edx
  loc_005CA6E3: call [004010A0h] ; __vbaObjSet
  loc_005CA6E9: mov ebx, [eax]
  loc_005CA6EB: mov var_12C, eax
  loc_005CA6F1: lea eax, var_2C
  loc_005CA6F4: lea ecx, var_3C
  loc_005CA6F7: push eax
  loc_005CA6F8: push ecx
  loc_005CA6F9: call [004011C0h] ; __vbaI2Var
  loc_005CA6FF: mov edx, ebx
  loc_005CA701: mov ebx, var_12C
  loc_005CA707: push eax
  loc_005CA708: push ebx
  loc_005CA709: call [edx+00000040h]
  loc_005CA70C: cmp eax, esi
  loc_005CA70E: fnclex
  loc_005CA710: jge 005CA71Dh
  loc_005CA712: push 00000040h
  loc_005CA714: push 0041E5D8h
  loc_005CA719: push ebx
  loc_005CA71A: push eax
  loc_005CA71B: call edi
  loc_005CA71D: mov eax, var_2C
  loc_005CA720: push 41400000h
  loc_005CA725: push eax
  loc_005CA726: mov ebx, eax
  loc_005CA728: mov ecx, [eax]
  loc_005CA72A: call [ecx+000000B4h]
  loc_005CA730: cmp eax, esi
  loc_005CA732: fnclex
  loc_005CA734: jge 005CA744h
  loc_005CA736: push 000000B4h
  loc_005CA73B: push 0041E5E8h
  loc_005CA740: push ebx
  loc_005CA741: push eax
  loc_005CA742: call edi
  loc_005CA744: lea edx, var_2C
  loc_005CA747: lea eax, var_28
  loc_005CA74A: push edx
  loc_005CA74B: lea ecx, var_24
  loc_005CA74E: push eax
  loc_005CA74F: lea edx, var_20
  loc_005CA752: push ecx
  loc_005CA753: push edx
  loc_005CA754: push 00000004h
  loc_005CA756: call [00401040h] ; __vbaFreeObjList
  loc_005CA75C: add esp, 00000014h
  loc_005CA75F: lea ecx, var_3C
  loc_005CA762: call [00401020h] ; __vbaFreeVar
  loc_005CA768: mov eax, Me
  loc_005CA76B: push eax
  loc_005CA76C: mov ecx, [eax]
  loc_005CA76E: call [ecx+00000314h]
  loc_005CA774: lea edx, var_28
  loc_005CA777: push eax
  loc_005CA778: push edx
  loc_005CA779: call [004010A0h] ; __vbaObjSet
  loc_005CA77F: mov var_12C, eax
  loc_005CA785: mov eax, var_18
  loc_005CA788: lea edx, var_20
  loc_005CA78B: mov ecx, [eax]
  loc_005CA78D: push edx
  loc_005CA78E: push eax
  loc_005CA78F: call [ecx+000000B4h]
  loc_005CA795: cmp eax, esi
  loc_005CA797: fnclex
  loc_005CA799: jge 005CA7ACh
  loc_005CA79B: mov ecx, var_18
  loc_005CA79E: push 000000B4h
  loc_005CA7A3: push 0041E938h
  loc_005CA7A8: push ecx
  loc_005CA7A9: push eax
  loc_005CA7AA: call edi
  loc_005CA7AC: lea ebx, var_24
  loc_005CA7AF: mov eax, var_20
  loc_005CA7B2: push ebx
  loc_005CA7B3: mov ecx, 00000008h
  loc_005CA7B8: sub esp, 00000010h
  loc_005CA7BB: mov var_9C, ecx
  loc_005CA7C1: mov ebx, esp
  loc_005CA7C3: mov var_94, 004209C4h ; "LNo"
  loc_005CA7CD: mov edx, [eax]
  loc_005CA7CF: push eax
  loc_005CA7D0: mov [ebx], ecx
  loc_005CA7D2: mov ecx, var_98
  loc_005CA7D8: mov var_11C, eax
  loc_005CA7DE: mov [ebx+00000004h], ecx
  loc_005CA7E1: mov ecx, var_94
  loc_005CA7E7: mov [ebx+00000008h], ecx
  loc_005CA7EA: mov ecx, var_90
  loc_005CA7F0: mov [ebx+0000000Ch], ecx
  loc_005CA7F3: call [edx+00000030h]
  loc_005CA7F6: cmp eax, esi
  loc_005CA7F8: fnclex
  loc_005CA7FA: jge 005CA80Dh
  loc_005CA7FC: mov edx, var_11C
  loc_005CA802: push 00000030h
  loc_005CA804: push 0041EA14h ; "S"
  loc_005CA809: push edx
  loc_005CA80A: push eax
  loc_005CA80B: call edi
  loc_005CA80D: mov eax, var_24
  loc_005CA810: lea edx, var_3C
  loc_005CA813: push edx
  loc_005CA814: push eax
  loc_005CA815: mov ecx, [eax]
  loc_005CA817: mov ebx, eax
  loc_005CA819: call [ecx+00000044h]
  loc_005CA81C: cmp eax, esi
  loc_005CA81E: fnclex
  loc_005CA820: jge 005CA82Dh
  loc_005CA822: push 00000044h
  loc_005CA824: push 0041EA48h
  loc_005CA829: push ebx
  loc_005CA82A: push eax
  loc_005CA82B: call edi
  loc_005CA82D: mov eax, var_12C
  loc_005CA833: lea ecx, var_2C
  loc_005CA836: lea edx, var_3C
  loc_005CA839: push ecx
  loc_005CA83A: mov ebx, [eax]
  loc_005CA83C: push edx
  loc_005CA83D: call [004011C0h] ; __vbaI2Var
  loc_005CA843: mov var_154, ebx
  loc_005CA849: mov ebx, var_12C
  loc_005CA84F: push eax
  loc_005CA850: mov eax, var_154
  loc_005CA856: push ebx
  loc_005CA857: call [eax+00000040h]
  loc_005CA85A: cmp eax, esi
  loc_005CA85C: fnclex
  loc_005CA85E: jge 005CA86Bh
  loc_005CA860: push 00000040h
  loc_005CA862: push 0041E5D8h
  loc_005CA867: push ebx
  loc_005CA868: push eax
  loc_005CA869: call edi
  loc_005CA86B: mov eax, var_2C
  loc_005CA86E: push 0000000Fh
  loc_005CA870: mov var_134, eax
  loc_005CA876: mov ebx, [eax]
  loc_005CA878: call [00401030h] ; rtcQBColor
  loc_005CA87E: mov ecx, ebx
  loc_005CA880: mov ebx, var_134
  loc_005CA886: push eax
  loc_005CA887: push ebx
  loc_005CA888: call [ecx+00000064h]
  loc_005CA88B: cmp eax, esi
  loc_005CA88D: fnclex
  loc_005CA88F: jge 005CA89Ch
  loc_005CA891: push 00000064h
  loc_005CA893: push 0041E5E8h
  loc_005CA898: push ebx
  loc_005CA899: push eax
  loc_005CA89A: call edi
  loc_005CA89C: lea edx, var_2C
  loc_005CA89F: lea eax, var_28
  loc_005CA8A2: push edx
  loc_005CA8A3: lea ecx, var_24
  loc_005CA8A6: push eax
  loc_005CA8A7: lea edx, var_20
  loc_005CA8AA: push ecx
  loc_005CA8AB: push edx
  loc_005CA8AC: push 00000004h
  loc_005CA8AE: call [00401040h] ; __vbaFreeObjList
  loc_005CA8B4: add esp, 00000014h
  loc_005CA8B7: lea ecx, var_3C
  loc_005CA8BA: call [00401020h] ; __vbaFreeVar
  loc_005CA8C0: mov eax, Me
  loc_005CA8C3: push eax
  loc_005CA8C4: mov ecx, [eax]
  loc_005CA8C6: call [ecx+00000314h]
  loc_005CA8CC: lea edx, var_28
  loc_005CA8CF: push eax
  loc_005CA8D0: push edx
  loc_005CA8D1: call [004010A0h] ; __vbaObjSet
  loc_005CA8D7: mov var_12C, eax
  loc_005CA8DD: mov eax, var_18
  loc_005CA8E0: lea edx, var_20
  loc_005CA8E3: mov ecx, [eax]
  loc_005CA8E5: push edx
  loc_005CA8E6: push eax
  loc_005CA8E7: call [ecx+000000B4h]
  loc_005CA8ED: cmp eax, esi
  loc_005CA8EF: fnclex
  loc_005CA8F1: jge 005CA904h
  loc_005CA8F3: mov ecx, var_18
  loc_005CA8F6: push 000000B4h
  loc_005CA8FB: push 0041E938h
  loc_005CA900: push ecx
  loc_005CA901: push eax
  loc_005CA902: call edi
  loc_005CA904: lea ebx, var_24
  loc_005CA907: mov eax, var_20
  loc_005CA90A: push ebx
  loc_005CA90B: mov ecx, 00000008h
  loc_005CA910: sub esp, 00000010h
  loc_005CA913: mov var_9C, ecx
  loc_005CA919: mov ebx, esp
  loc_005CA91B: mov var_94, 004209C4h ; "LNo"
  loc_005CA925: mov edx, [eax]
  loc_005CA927: push eax
  loc_005CA928: mov [ebx], ecx
  loc_005CA92A: mov ecx, var_98
  loc_005CA930: mov var_11C, eax
  loc_005CA936: mov [ebx+00000004h], ecx
  loc_005CA939: mov ecx, var_94
  loc_005CA93F: mov [ebx+00000008h], ecx
  loc_005CA942: mov ecx, var_90
  loc_005CA948: mov [ebx+0000000Ch], ecx
  loc_005CA94B: call [edx+00000030h]
  loc_005CA94E: cmp eax, esi
  loc_005CA950: fnclex
  loc_005CA952: jge 005CA965h
  loc_005CA954: mov edx, var_11C
  loc_005CA95A: push 00000030h
  loc_005CA95C: push 0041EA14h ; "S"
  loc_005CA961: push edx
  loc_005CA962: push eax
  loc_005CA963: call edi
  loc_005CA965: mov eax, var_24
  loc_005CA968: lea edx, var_3C
  loc_005CA96B: push edx
  loc_005CA96C: push eax
  loc_005CA96D: mov ecx, [eax]
  loc_005CA96F: mov ebx, eax
  loc_005CA971: call [ecx+00000044h]
  loc_005CA974: cmp eax, esi
  loc_005CA976: fnclex
  loc_005CA978: jge 005CA985h
  loc_005CA97A: push 00000044h
  loc_005CA97C: push 0041EA48h
  loc_005CA981: push ebx
  loc_005CA982: push eax
  loc_005CA983: call edi
  loc_005CA985: mov eax, var_12C
  loc_005CA98B: lea ecx, var_2C
  loc_005CA98E: lea edx, var_3C
  loc_005CA991: push ecx
  loc_005CA992: mov ebx, [eax]
  loc_005CA994: push edx
  loc_005CA995: call [004011C0h] ; __vbaI2Var
  loc_005CA99B: mov var_15C, ebx
  loc_005CA9A1: mov ebx, var_12C
  loc_005CA9A7: push eax
  loc_005CA9A8: mov eax, var_15C
  loc_005CA9AE: push ebx
  loc_005CA9AF: call [eax+00000040h]
  loc_005CA9B2: cmp eax, esi
  loc_005CA9B4: fnclex
  loc_005CA9B6: jge 005CA9C3h
  loc_005CA9B8: push 00000040h
  loc_005CA9BA: push 0041E5D8h
  loc_005CA9BF: push ebx
  loc_005CA9C0: push eax
  loc_005CA9C1: call edi
  loc_005CA9C3: mov eax, var_2C
  loc_005CA9C6: push 00000006h
  loc_005CA9C8: mov var_134, eax
  loc_005CA9CE: mov ebx, [eax]
  loc_005CA9D0: call [00401030h] ; rtcQBColor
  loc_005CA9D6: mov ecx, ebx
  loc_005CA9D8: mov ebx, var_134
  loc_005CA9DE: push eax
  loc_005CA9DF: push ebx
  loc_005CA9E0: call [ecx+0000005Ch]
  loc_005CA9E3: cmp eax, esi
  loc_005CA9E5: fnclex
  loc_005CA9E7: jge 005CA9F4h
  loc_005CA9E9: push 0000005Ch
  loc_005CA9EB: push 0041E5E8h
  loc_005CA9F0: push ebx
  loc_005CA9F1: push eax
  loc_005CA9F2: call edi
  loc_005CA9F4: lea edx, var_2C
  loc_005CA9F7: lea eax, var_28
  loc_005CA9FA: push edx
  loc_005CA9FB: lea ecx, var_24
  loc_005CA9FE: push eax
  loc_005CA9FF: lea edx, var_20
  loc_005CAA02: push ecx
  loc_005CAA03: push edx
  loc_005CAA04: push 00000004h
  loc_005CAA06: call [00401040h] ; __vbaFreeObjList
  loc_005CAA0C: add esp, 00000014h
  loc_005CAA0F: lea ecx, var_3C
  loc_005CAA12: call [00401020h] ; __vbaFreeVar
  loc_005CAA18: mov eax, var_18
  loc_005CAA1B: push eax
  loc_005CAA1C: mov ecx, [eax]
  loc_005CAA1E: call [ecx+000000C4h]
  loc_005CAA24: cmp eax, esi
  loc_005CAA26: fnclex
  loc_005CAA28: jge 005CAA3Bh
  loc_005CAA2A: mov edx, var_18
  loc_005CAA2D: push 000000C4h
  loc_005CAA32: push 0041E938h
  loc_005CAA37: push edx
  loc_005CAA38: push eax
  loc_005CAA39: call edi
  loc_005CAA3B: push 0041E938h
  loc_005CAA40: push esi
  loc_005CAA41: call [00401274h] ; __vbaCastObj
  loc_005CAA47: push eax
  loc_005CAA48: lea eax, var_18
  loc_005CAA4B: push eax
  loc_005CAA4C: call [004010A0h] ; __vbaObjSet
  loc_005CAA52: mov var_4, esi
  loc_005CAA55: fwait
  loc_005CAA56: push 005CAAAFh
  loc_005CAA5B: jmp 005CAAA5h
  loc_005CAA5D: lea ecx, var_1C
  loc_005CAA60: call [004012ACh] ; __vbaFreeStr
  loc_005CAA66: lea ecx, var_2C
  loc_005CAA69: lea edx, var_28
  loc_005CAA6C: push ecx
  loc_005CAA6D: lea eax, var_24
  loc_005CAA70: push edx
  loc_005CAA71: lea ecx, var_20
  loc_005CAA74: push eax
  loc_005CAA75: push ecx
  loc_005CAA76: push 00000004h
  loc_005CAA78: call [00401040h] ; __vbaFreeObjList
  loc_005CAA7E: lea edx, var_8C
  loc_005CAA84: lea eax, var_7C
  loc_005CAA87: push edx
  loc_005CAA88: lea ecx, var_6C
  loc_005CAA8B: push eax
  loc_005CAA8C: lea edx, var_5C
  loc_005CAA8F: push ecx
  loc_005CAA90: lea eax, var_4C
  loc_005CAA93: push edx
  loc_005CAA94: lea ecx, var_3C
  loc_005CAA97: push eax
  loc_005CAA98: push ecx
  loc_005CAA99: push 00000006h
  loc_005CAA9B: call [00401038h] ; __vbaFreeVarList
  loc_005CAAA1: add esp, 00000030h
  loc_005CAAA4: ret
  loc_005CAAA5: lea ecx, var_18
  loc_005CAAA8: call [004012B0h] ; __vbaFreeObj
  loc_005CAAAE: ret
  loc_005CAAAF: mov eax, Me
  loc_005CAAB2: push eax
  loc_005CAAB3: mov edx, [eax]
  loc_005CAAB5: call [edx+00000008h]
  loc_005CAAB8: mov eax, var_4
  loc_005CAABB: mov ecx, var_14
  loc_005CAABE: pop edi
  loc_005CAABF: pop esi
  loc_005CAAC0: mov fs:[00000000h], ecx
  loc_005CAAC7: pop ebx
  loc_005CAAC8: mov esp, ebp
  loc_005CAACA: pop ebp
  loc_005CAACB: retn 0004h
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer) '5C9ED0
  loc_005C9ED0: push ebp
  loc_005C9ED1: mov ebp, esp
  loc_005C9ED3: sub esp, 0000000Ch
  loc_005C9ED6: push 00403B36h ; __vbaExceptHandler
  loc_005C9EDB: mov eax, fs:[00000000h]
  loc_005C9EE1: push eax
  loc_005C9EE2: mov fs:[00000000h], esp
  loc_005C9EE9: sub esp, 00000060h
  loc_005C9EEC: push ebx
  loc_005C9EED: push esi
  loc_005C9EEE: push edi
  loc_005C9EEF: mov var_C, esp
  loc_005C9EF2: mov var_8, 00403068h
  loc_005C9EF9: mov esi, Me
  loc_005C9EFC: mov eax, esi
  loc_005C9EFE: and eax, 00000001h
  loc_005C9F01: mov var_4, eax
  loc_005C9F04: and esi, FFFFFFFEh
  loc_005C9F07: push esi
  loc_005C9F08: mov Me, esi
  loc_005C9F0B: mov ecx, [esi]
  loc_005C9F0D: call [ecx+00000004h]
  loc_005C9F10: mov edx, KeyCode
  loc_005C9F13: xor ebx, ebx
  loc_005C9F15: mov ecx, 00000071h
  loc_005C9F1A: mov var_18, ebx
  loc_005C9F1D: mov di, [edx]
  loc_005C9F20: mov var_1C, ebx
  loc_005C9F23: mov var_2C, ebx
  loc_005C9F26: mov var_3C, ebx
  loc_005C9F29: mov var_4C, ebx
  loc_005C9F2C: mov var_5C, ebx
  loc_005C9F2F: call [00401124h] ; __vbaI2I4
  loc_005C9F35: cmp di, ax
  loc_005C9F38: jnz 005CA0BDh
  loc_005C9F3E: mov edx, 0041E5D4h
  loc_005C9F43: mov ecx, 0061A0A0h
  loc_005C9F48: call [004011ECh] ; __vbaStrCopy
  loc_005C9F4E: cmp [0061A11Ch], ebx
  loc_005C9F54: jnz 005C9F66h
  loc_005C9F56: push 0061A11Ch
  loc_005C9F5B: push 004069CCh
  loc_005C9F60: call [004011DCh] ; __vbaNew2
  loc_005C9F66: sub esp, 00000010h
  loc_005C9F69: mov ecx, 0000000Ah
  loc_005C9F6E: mov ebx, esp
  loc_005C9F70: mov var_5C, ecx
  loc_005C9F73: mov eax, 80020004h
  loc_005C9F78: sub esp, 00000010h
  loc_005C9F7B: mov [ebx], ecx
  loc_005C9F7D: mov ecx, var_58
  loc_005C9F80: mov var_54, eax
  loc_005C9F83: mov edi, [0061A11Ch]
  loc_005C9F89: mov [ebx+00000004h], ecx
  loc_005C9F8C: mov var_4C, 00000002h
  loc_005C9F93: mov ecx, esp
  loc_005C9F95: mov var_44, 00000001h
  loc_005C9F9C: mov [ebx+00000008h], eax
  loc_005C9F9F: mov eax, var_50
  loc_005C9FA2: mov edx, [edi]
  loc_005C9FA4: push edi
  loc_005C9FA5: mov [ebx+0000000Ch], eax
  loc_005C9FA8: mov eax, var_4C
  loc_005C9FAB: mov [ecx], eax
  loc_005C9FAD: mov eax, var_48
  loc_005C9FB0: mov [ecx+00000004h], eax
  loc_005C9FB3: mov eax, var_44
  loc_005C9FB6: mov [ecx+00000008h], eax
  loc_005C9FB9: mov eax, var_40
  loc_005C9FBC: mov [ecx+0000000Ch], eax
  loc_005C9FBF: call [edx+000002B0h]
  loc_005C9FC5: test eax, eax
  loc_005C9FC7: fnclex
  loc_005C9FC9: jge 005C9FDDh
  loc_005C9FCB: push 000002B0h
  loc_005C9FD0: push 0041E6D0h
  loc_005C9FD5: push edi
  loc_005C9FD6: push eax
  loc_005C9FD7: call [00401074h] ; __vbaHresultCheckObj
  loc_005C9FDD: mov edi, [004010D4h] ; rtcTrimVar
  loc_005C9FE3: lea ecx, var_4C
  loc_005C9FE6: lea edx, var_2C
  loc_005C9FE9: push ecx
  loc_005C9FEA: push edx
  loc_005C9FEB: mov var_44, 0061A0B8h
  loc_005C9FF2: mov var_4C, 00004008h
  loc_005C9FF9: call edi
  loc_005C9FFB: lea eax, var_2C
  loc_005C9FFE: lea ecx, var_5C
  loc_005CA001: push eax
  loc_005CA002: push ecx
  loc_005CA003: mov var_54, 0041E5D4h
  loc_005CA00A: mov var_5C, 00008008h
  loc_005CA011: call [00401218h] ; __vbaVarTstNe
  loc_005CA017: lea ecx, var_2C
  loc_005CA01A: mov bx, ax
  loc_005CA01D: call [00401020h] ; __vbaFreeVar
  loc_005CA023: test bx, bx
  loc_005CA026: jz 005CA0AEh
  loc_005CA02C: mov edx, [esi]
  loc_005CA02E: push esi
  loc_005CA02F: call [edx+00000704h]
  loc_005CA035: mov eax, [esi]
  loc_005CA037: push esi
  loc_005CA038: call [eax+0000030Ch]
  loc_005CA03E: lea ecx, var_1C
  loc_005CA041: push eax
  loc_005CA042: push ecx
  loc_005CA043: call [004010A0h] ; __vbaObjSet
  loc_005CA049: mov esi, eax
  loc_005CA04B: lea edx, var_4C
  loc_005CA04E: lea eax, var_2C
  loc_005CA051: push edx
  loc_005CA052: push eax
  loc_005CA053: mov var_44, 0061A0B8h
  loc_005CA05A: mov var_4C, 00004008h
  loc_005CA061: call edi
  loc_005CA063: mov edi, [esi]
  loc_005CA065: lea ecx, var_2C
  loc_005CA068: lea edx, var_18
  loc_005CA06B: push ecx
  loc_005CA06C: push edx
  loc_005CA06D: call [004011B0h] ; __vbaStrVarVal
  loc_005CA073: push eax
  loc_005CA074: push esi
  loc_005CA075: call [edi+000000A4h]
  loc_005CA07B: test eax, eax
  loc_005CA07D: fnclex
  loc_005CA07F: jge 005CA093h
  loc_005CA081: push 000000A4h
  loc_005CA086: push 0041E5E8h
  loc_005CA08B: push esi
  loc_005CA08C: push eax
  loc_005CA08D: call [00401074h] ; __vbaHresultCheckObj
  loc_005CA093: lea ecx, var_18
  loc_005CA096: call [004012ACh] ; __vbaFreeStr
  loc_005CA09C: lea ecx, var_1C
  loc_005CA09F: call [004012B0h] ; __vbaFreeObj
  loc_005CA0A5: lea ecx, var_2C
  loc_005CA0A8: call [00401020h] ; __vbaFreeVar
  loc_005CA0AE: xor ebx, ebx
  loc_005CA0B0: mov var_4, ebx
  loc_005CA0B3: push 005CA14Ah
  loc_005CA0B8: jmp 005CA149h
  loc_005CA0BD: mov ecx, 00000073h
  loc_005CA0C2: call [00401124h] ; __vbaI2I4
  loc_005CA0C8: cmp di, ax
  loc_005CA0CB: jnz 005CA0B0h
  loc_005CA0CD: cmp [0061B394h], ebx
  loc_005CA0D3: jnz 005CA0E5h
  loc_005CA0D5: push 0061B394h
  loc_005CA0DA: push 0041E4A0h
  loc_005CA0DF: call [004011DCh] ; __vbaNew2
  loc_005CA0E5: mov edi, [0061B394h]
  loc_005CA0EB: lea eax, var_1C
  loc_005CA0EE: push esi
  loc_005CA0EF: push eax
  loc_005CA0F0: mov edx, [edi]
  loc_005CA0F2: mov var_74, edx
  loc_005CA0F5: call [004010B8h] ; __vbaObjSetAddref
  loc_005CA0FB: mov ecx, var_74
  loc_005CA0FE: push eax
  loc_005CA0FF: push edi
  loc_005CA100: call [ecx+00000010h]
  loc_005CA103: cmp eax, ebx
  loc_005CA105: fnclex
  loc_005CA107: jge 005CA118h
  loc_005CA109: push 00000010h
  loc_005CA10B: push 0041E490h
  loc_005CA110: push edi
  loc_005CA111: push eax
  loc_005CA112: call [00401074h] ; __vbaHresultCheckObj
  loc_005CA118: lea ecx, var_1C
  loc_005CA11B: call [004012B0h] ; __vbaFreeObj
  loc_005CA121: jmp 005CA0B0h
  loc_005CA123: lea ecx, var_18
  loc_005CA126: call [004012ACh] ; __vbaFreeStr
  loc_005CA12C: lea ecx, var_1C
  loc_005CA12F: call [004012B0h] ; __vbaFreeObj
  loc_005CA135: lea edx, var_3C
  loc_005CA138: lea eax, var_2C
  loc_005CA13B: push edx
  loc_005CA13C: push eax
  loc_005CA13D: push 00000002h
  loc_005CA13F: call [00401038h] ; __vbaFreeVarList
  loc_005CA145: add esp, 0000000Ch
  loc_005CA148: ret
  loc_005CA149: ret
  loc_005CA14A: mov eax, Me
  loc_005CA14D: push eax
  loc_005CA14E: mov ecx, [eax]
  loc_005CA150: call [ecx+00000008h]
  loc_005CA153: mov eax, var_4
  loc_005CA156: mov ecx, var_14
  loc_005CA159: pop edi
  loc_005CA15A: pop esi
  loc_005CA15B: mov fs:[00000000h], ecx
  loc_005CA162: pop ebx
  loc_005CA163: mov esp, ebp
  loc_005CA165: pop ebp
  loc_005CA166: retn 000Ch
End Sub

Private Sub Proc_19_6_5C8BC0() '5C8BC0
  loc_005C8BC0: push ebp
  loc_005C8BC1: mov ebp, esp
  loc_005C8BC3: sub esp, 00000008h
  loc_005C8BC6: push 00403B36h ; __vbaExceptHandler
  loc_005C8BCB: mov eax, fs:[00000000h]
  loc_005C8BD1: push eax
  loc_005C8BD2: mov fs:[00000000h], esp
  loc_005C8BD9: sub esp, 0000002Ch
  loc_005C8BDC: push ebx
  loc_005C8BDD: push esi
  loc_005C8BDE: push edi
  loc_005C8BDF: mov var_8, esp
  loc_005C8BE2: mov var_4, 00403028h
  loc_005C8BE9: mov ebx, Me
  loc_005C8BEC: xor edi, edi
  loc_005C8BEE: mov var_18, edi
  loc_005C8BF1: mov var_1C, edi
  loc_005C8BF4: mov var_20, edi
  loc_005C8BF7: mov eax, 00000063h
  loc_005C8BFC: cmp di, ax
  loc_005C8BFF: jg 005C8C8Eh
  loc_005C8C05: mov eax, [ebx]
  loc_005C8C07: push ebx
  loc_005C8C08: call [eax+00000314h]
  loc_005C8C0E: lea ecx, var_1C
  loc_005C8C11: push eax
  loc_005C8C12: push ecx
  loc_005C8C13: call [004010A0h] ; __vbaObjSet
  loc_005C8C19: mov esi, eax
  loc_005C8C1B: lea eax, var_20
  loc_005C8C1E: push eax
  loc_005C8C1F: push edi
  loc_005C8C20: mov edx, [esi]
  loc_005C8C22: push esi
  loc_005C8C23: call [edx+00000040h]
  loc_005C8C26: test eax, eax
  loc_005C8C28: fnclex
  loc_005C8C2A: jge 005C8C3Bh
  loc_005C8C2C: push 00000040h
  loc_005C8C2E: push 0041E5D8h
  loc_005C8C33: push esi
  loc_005C8C34: push eax
  loc_005C8C35: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8C3B: mov eax, var_20
  loc_005C8C3E: push 0041E5D4h
  loc_005C8C43: push eax
  loc_005C8C44: mov esi, eax
  loc_005C8C46: mov ecx, [eax]
  loc_005C8C48: call [ecx+000000A4h]
  loc_005C8C4E: test eax, eax
  loc_005C8C50: fnclex
  loc_005C8C52: jge 005C8C66h
  loc_005C8C54: push 000000A4h
  loc_005C8C59: push 0041E5E8h
  loc_005C8C5E: push esi
  loc_005C8C5F: push eax
  loc_005C8C60: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8C66: lea edx, var_20
  loc_005C8C69: lea eax, var_1C
  loc_005C8C6C: push edx
  loc_005C8C6D: push eax
  loc_005C8C6E: push 00000002h
  loc_005C8C70: call [00401040h] ; __vbaFreeObjList
  loc_005C8C76: mov eax, 00000001h
  loc_005C8C7B: add esp, 0000000Ch
  loc_005C8C7E: add ax, di
  loc_005C8C81: jo 005C8D25h
  loc_005C8C87: mov edi, eax
  loc_005C8C89: jmp 005C8BF7h
  loc_005C8C8E: mov ecx, [ebx]
  loc_005C8C90: push ebx
  loc_005C8C91: call [ecx+00000304h]
  loc_005C8C97: lea edx, var_1C
  loc_005C8C9A: push eax
  loc_005C8C9B: push edx
  loc_005C8C9C: call [004010A0h] ; __vbaObjSet
  loc_005C8CA2: mov esi, eax
  loc_005C8CA4: push 00000000h
  loc_005C8CA6: mov edi, [esi]
  loc_005C8CA8: call [00401008h] ; __vbaStrI2
  loc_005C8CAE: mov edx, eax
  loc_005C8CB0: lea ecx, var_18
  loc_005C8CB3: call [00401270h] ; __vbaStrMove
  loc_005C8CB9: push eax
  loc_005C8CBA: push esi
  loc_005C8CBB: call [edi+000000A4h]
  loc_005C8CC1: test eax, eax
  loc_005C8CC3: fnclex
  loc_005C8CC5: jge 005C8CD9h
  loc_005C8CC7: push 000000A4h
  loc_005C8CCC: push 0041E5E8h
  loc_005C8CD1: push esi
  loc_005C8CD2: push eax
  loc_005C8CD3: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8CD9: lea ecx, var_18
  loc_005C8CDC: call [004012ACh] ; __vbaFreeStr
  loc_005C8CE2: lea ecx, var_1C
  loc_005C8CE5: call [004012B0h] ; __vbaFreeObj
  loc_005C8CEB: push 005C8D10h
  loc_005C8CF0: jmp 005C8D0Fh
  loc_005C8CF2: lea ecx, var_18
  loc_005C8CF5: call [004012ACh] ; __vbaFreeStr
  loc_005C8CFB: lea eax, var_20
  loc_005C8CFE: lea ecx, var_1C
  loc_005C8D01: push eax
  loc_005C8D02: push ecx
  loc_005C8D03: push 00000002h
  loc_005C8D05: call [00401040h] ; __vbaFreeObjList
  loc_005C8D0B: add esp, 0000000Ch
  loc_005C8D0E: ret
  loc_005C8D0F: ret
  loc_005C8D10: mov ecx, var_10
  loc_005C8D13: pop edi
  loc_005C8D14: pop esi
  loc_005C8D15: xor eax, eax
  loc_005C8D17: mov fs:[00000000h], ecx
  loc_005C8D1E: pop ebx
  loc_005C8D1F: mov esp, ebp
  loc_005C8D21: pop ebp
  loc_005C8D22: retn 0004h
End Sub

Private Sub Proc_19_7_5C9020() '5C9020
  loc_005C9020: push ebp
  loc_005C9021: mov ebp, esp
  loc_005C9023: sub esp, 00000008h
  loc_005C9026: push 00403B36h ; __vbaExceptHandler
  loc_005C902B: mov eax, fs:[00000000h]
  loc_005C9031: push eax
  loc_005C9032: mov fs:[00000000h], esp
  loc_005C9039: sub esp, 000001ACh
  loc_005C903F: push ebx
  loc_005C9040: push esi
  loc_005C9041: push edi
  loc_005C9042: mov var_8, esp
  loc_005C9045: mov var_4, 00403058h
  loc_005C904C: mov edi, Me
  loc_005C904F: xor esi, esi
  loc_005C9051: push edi
  loc_005C9052: mov var_14, esi
  loc_005C9055: mov eax, [edi]
  loc_005C9057: mov var_18, esi
  loc_005C905A: mov var_1C, esi
  loc_005C905D: mov var_20, esi
  loc_005C9060: mov var_24, esi
  loc_005C9063: mov var_28, esi
  loc_005C9066: mov var_2C, esi
  loc_005C9069: mov var_30, esi
  loc_005C906C: mov var_34, esi
  loc_005C906F: mov var_44, esi
  loc_005C9072: mov var_54, esi
  loc_005C9075: mov var_64, esi
  loc_005C9078: mov var_74, esi
  loc_005C907B: mov var_84, esi
  loc_005C9081: mov var_94, esi
  loc_005C9087: mov var_A4, esi
  loc_005C908D: mov var_B4, esi
  loc_005C9093: mov var_C4, esi
  loc_005C9099: mov var_D4, esi
  loc_005C909F: mov var_E4, esi
  loc_005C90A5: mov var_F4, esi
  loc_005C90AB: mov var_104, esi
  loc_005C90B1: mov var_114, esi
  loc_005C90B7: mov var_124, esi
  loc_005C90BD: mov var_134, esi
  loc_005C90C3: mov var_168, esi
  loc_005C90C9: call [eax+000006F8h]
  loc_005C90CF: mov ecx, [edi]
  loc_005C90D1: push edi
  loc_005C90D2: call [ecx+00000300h]
  loc_005C90D8: lea edx, var_20
  loc_005C90DB: push eax
  loc_005C90DC: push edx
  loc_005C90DD: call [004010A0h] ; __vbaObjSet
  loc_005C90E3: mov edi, eax
  loc_005C90E5: lea ecx, var_168
  loc_005C90EB: push ecx
  loc_005C90EC: push edi
  loc_005C90ED: mov eax, [edi]
  loc_005C90EF: call [eax+000000E0h]
  loc_005C90F5: cmp eax, esi
  loc_005C90F7: fnclex
  loc_005C90F9: jge 005C9111h
  loc_005C90FB: push 000000E0h
  loc_005C9100: push 0041F5ECh
  loc_005C9105: push edi
  loc_005C9106: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C910C: push eax
  loc_005C910D: call edi
  loc_005C910F: jmp 005C9117h
  loc_005C9111: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C9117: xor ebx, ebx
  loc_005C9119: cmp var_168, FFFFFFh
  loc_005C9121: lea ecx, var_20
  loc_005C9124: setz bl
  loc_005C9127: neg ebx
  loc_005C9129: call [004012B0h] ; __vbaFreeObj
  loc_005C912F: cmp bx, si
  loc_005C9132: mov ebx, 00004008h
  loc_005C9137: mov var_CC, 0061A0B8h
  loc_005C9141: mov var_D4, ebx
  loc_005C9147: jz 005C97A9h
  loc_005C914D: mov esi, [004010D4h] ; rtcTrimVar
  loc_005C9153: lea edx, var_D4
  loc_005C9159: lea eax, var_44
  loc_005C915C: push edx
  loc_005C915D: push eax
  loc_005C915E: call rtcTrimVar
  loc_005C9160: lea ecx, var_104
  loc_005C9166: lea edx, var_74
  loc_005C9169: push ecx
  loc_005C916A: push edx
  loc_005C916B: mov var_FC, 0061A05Ch
  loc_005C9175: mov var_104, ebx
  loc_005C917B: call rtcTrimVar
  loc_005C917D: lea eax, var_124
  loc_005C9183: lea ecx, var_A4
  loc_005C9189: push eax
  loc_005C918A: push ecx
  loc_005C918B: mov var_11C, 0061A060h
  loc_005C9195: mov var_124, ebx
  loc_005C919B: call rtcTrimVar
  loc_005C919D: mov esi, 00000008h
  loc_005C91A2: mov var_DC, 00431CF8h ; "Select Num1,Sum(Value) as TAmount From LGDetail Where AgentName='"
  loc_005C91AC: mov var_E4, esi
  loc_005C91B2: mov var_F4, esi
  loc_005C91B8: mov var_114, esi
  loc_005C91BE: mov var_134, esi
  loc_005C91C4: mov esi, [0061A13Ch]
  loc_005C91CA: mov var_EC, 00431B24h ; "' AND OnCount='"
  loc_005C91D4: mov var_10C, 0041ECD0h ; "' And AMPM='"
  loc_005C91DE: mov var_12C, 00431B48h ; "' Group by Num1,AgentName,OnCount,AMPM"
  loc_005C91E8: mov ebx, [esi]
  loc_005C91EA: lea esi, var_20
  loc_005C91ED: push esi
  loc_005C91EE: mov ecx, 0000000Ah
  loc_005C91F3: sub esp, 00000010h
  loc_005C91F6: mov var_154, ecx
  loc_005C91FC: mov esi, esp
  loc_005C91FE: mov eax, 80020004h
  loc_005C9203: mov edx, eax
  loc_005C9205: sub esp, 00000010h
  loc_005C9208: mov [esi], ecx
  loc_005C920A: mov ecx, var_160
  loc_005C9210: mov [esi+00000004h], ecx
  loc_005C9213: mov ecx, esp
  loc_005C9215: sub esp, 00000010h
  loc_005C9218: mov [esi+00000008h], eax
  loc_005C921B: mov eax, var_158
  loc_005C9221: mov [esi+0000000Ch], eax
  loc_005C9224: mov eax, var_154
  loc_005C922A: mov [ecx], eax
  loc_005C922C: mov eax, var_150
  loc_005C9232: mov esi, [004011B4h] ; __vbaVarCat
  loc_005C9238: mov [ecx+00000004h], eax
  loc_005C923B: mov eax, 00000003h
  loc_005C9240: mov [ecx+00000008h], edx
  loc_005C9243: mov edx, var_148
  loc_005C9249: mov [ecx+0000000Ch], edx
  loc_005C924C: mov edx, var_140
  loc_005C9252: mov ecx, esp
  loc_005C9254: mov [ecx], eax
  loc_005C9256: mov eax, 00000004h
  loc_005C925B: mov [ecx+00000004h], edx
  loc_005C925E: lea edx, var_44
  loc_005C9261: mov [ecx+00000008h], eax
  loc_005C9264: mov eax, var_138
  loc_005C926A: mov [ecx+0000000Ch], eax
  loc_005C926D: lea ecx, var_E4
  loc_005C9273: push ecx
  loc_005C9274: lea eax, var_54
  loc_005C9277: push edx
  loc_005C9278: push eax
  loc_005C9279: call __vbaVarCat
  loc_005C927B: lea ecx, var_F4
  loc_005C9281: push eax
  loc_005C9282: lea edx, var_64
  loc_005C9285: push ecx
  loc_005C9286: push edx
  loc_005C9287: call __vbaVarCat
  loc_005C9289: push eax
  loc_005C928A: lea eax, var_74
  loc_005C928D: push eax
  loc_005C928E: lea ecx, var_84
  loc_005C9294: push ecx
  loc_005C9295: call __vbaVarCat
  loc_005C9297: push eax
  loc_005C9298: lea edx, var_114
  loc_005C929E: lea eax, var_94
  loc_005C92A4: push edx
  loc_005C92A5: push eax
  loc_005C92A6: call __vbaVarCat
  loc_005C92A8: lea ecx, var_A4
  loc_005C92AE: push eax
  loc_005C92AF: lea edx, var_B4
  loc_005C92B5: push ecx
  loc_005C92B6: push edx
  loc_005C92B7: call __vbaVarCat
  loc_005C92B9: push eax
  loc_005C92BA: lea eax, var_134
  loc_005C92C0: lea ecx, var_C4
  loc_005C92C6: push eax
  loc_005C92C7: push ecx
  loc_005C92C8: call __vbaVarCat
  loc_005C92CA: lea edx, var_14
  loc_005C92CD: push eax
  loc_005C92CE: push edx
  loc_005C92CF: call [004011B0h] ; __vbaStrVarVal
  loc_005C92D5: push eax
  loc_005C92D6: mov eax, [0061A13Ch]
  loc_005C92DB: push eax
  loc_005C92DC: call [ebx+000000BCh]
  loc_005C92E2: test eax, eax
  loc_005C92E4: fnclex
  loc_005C92E6: jge 005C92FCh
  loc_005C92E8: mov ecx, [0061A13Ch]
  loc_005C92EE: push 000000BCh
  loc_005C92F3: push 0041E928h
  loc_005C92F8: push ecx
  loc_005C92F9: push eax
  loc_005C92FA: call edi
  loc_005C92FC: mov esi, Me
  loc_005C92FF: mov edx, var_20
  loc_005C9302: push edx
  loc_005C9303: lea ebx, [esi+00000034h]
  loc_005C9306: push ebx
  loc_005C9307: call [004010B8h] ; __vbaObjSetAddref
  loc_005C930D: lea ecx, var_14
  loc_005C9310: call [004012ACh] ; __vbaFreeStr
  loc_005C9316: lea ecx, var_20
  loc_005C9319: call [004012B0h] ; __vbaFreeObj
  loc_005C931F: lea eax, var_C4
  loc_005C9325: lea ecx, var_B4
  loc_005C932B: push eax
  loc_005C932C: lea edx, var_A4
  loc_005C9332: push ecx
  loc_005C9333: lea eax, var_94
  loc_005C9339: push edx
  loc_005C933A: lea ecx, var_84
  loc_005C9340: push eax
  loc_005C9341: lea edx, var_74
  loc_005C9344: push ecx
  loc_005C9345: lea eax, var_64
  loc_005C9348: push edx
  loc_005C9349: lea ecx, var_54
  loc_005C934C: push eax
  loc_005C934D: lea edx, var_44
  loc_005C9350: push ecx
  loc_005C9351: push edx
  loc_005C9352: push 00000009h
  loc_005C9354: call [00401038h] ; __vbaFreeVarList
  loc_005C935A: add esp, 00000028h
  loc_005C935D: mov eax, [ebx]
  loc_005C935F: lea edx, var_168
  loc_005C9365: push edx
  loc_005C9366: push eax
  loc_005C9367: mov ecx, [eax]
  loc_005C9369: call [ecx+00000034h]
  loc_005C936C: test eax, eax
  loc_005C936E: fnclex
  loc_005C9370: jge 005C937Fh
  loc_005C9372: mov ecx, [ebx]
  loc_005C9374: push 00000034h
  loc_005C9376: push 0041E938h
  loc_005C937B: push ecx
  loc_005C937C: push eax
  loc_005C937D: call edi
  loc_005C937F: cmp var_168, 0000h
  loc_005C9387: jnz 005C978Fh
  loc_005C938D: mov edx, [esi]
  loc_005C938F: push esi
  loc_005C9390: call [edx+00000314h]
  loc_005C9396: push eax
  loc_005C9397: lea eax, var_30
  loc_005C939A: push eax
  loc_005C939B: call [004010A0h] ; __vbaObjSet
  loc_005C93A1: mov var_194, eax
  loc_005C93A7: mov eax, [ebx]
  loc_005C93A9: lea edx, var_28
  loc_005C93AC: mov ecx, [eax]
  loc_005C93AE: push edx
  loc_005C93AF: push eax
  loc_005C93B0: call [ecx+000000B4h]
  loc_005C93B6: test eax, eax
  loc_005C93B8: fnclex
  loc_005C93BA: jge 005C93CCh
  loc_005C93BC: mov ecx, [ebx]
  loc_005C93BE: push 000000B4h
  loc_005C93C3: push 0041E938h
  loc_005C93C8: push ecx
  loc_005C93C9: push eax
  loc_005C93CA: call edi
  loc_005C93CC: lea esi, var_2C
  loc_005C93CF: mov eax, var_28
  loc_005C93D2: push esi
  loc_005C93D3: mov ecx, 00000008h
  loc_005C93D8: sub esp, 00000010h
  loc_005C93DB: mov var_E4, ecx
  loc_005C93E1: mov esi, esp
  loc_005C93E3: mov var_DC, 0041EA3Ch ; "Num1"
  loc_005C93ED: mov edx, [eax]
  loc_005C93EF: push eax
  loc_005C93F0: mov [esi], ecx
  loc_005C93F2: mov ecx, var_E0
  loc_005C93F8: mov var_184, eax
  loc_005C93FE: mov [esi+00000004h], ecx
  loc_005C9401: mov ecx, var_DC
  loc_005C9407: mov [esi+00000008h], ecx
  loc_005C940A: mov ecx, var_D8
  loc_005C9410: mov [esi+0000000Ch], ecx
  loc_005C9413: call [edx+00000030h]
  loc_005C9416: test eax, eax
  loc_005C9418: fnclex
  loc_005C941A: jge 005C942Dh
  loc_005C941C: mov edx, var_184
  loc_005C9422: push 00000030h
  loc_005C9424: push 0041EA14h ; "S"
  loc_005C9429: push edx
  loc_005C942A: push eax
  loc_005C942B: call edi
  loc_005C942D: mov eax, var_2C
  loc_005C9430: lea edx, var_44
  loc_005C9433: push edx
  loc_005C9434: push eax
  loc_005C9435: mov ecx, [eax]
  loc_005C9437: mov esi, eax
  loc_005C9439: call [ecx+00000044h]
  loc_005C943C: test eax, eax
  loc_005C943E: fnclex
  loc_005C9440: jge 005C944Dh
  loc_005C9442: push 00000044h
  loc_005C9444: push 0041EA48h
  loc_005C9449: push esi
  loc_005C944A: push eax
  loc_005C944B: call edi
  loc_005C944D: mov eax, var_194
  loc_005C9453: lea ecx, var_34
  loc_005C9456: lea edx, var_44
  loc_005C9459: push ecx
  loc_005C945A: mov esi, [eax]
  loc_005C945C: push edx
  loc_005C945D: call [004011C0h] ; __vbaI2Var
  loc_005C9463: mov var_1B0, esi
  loc_005C9469: mov esi, var_194
  loc_005C946F: push eax
  loc_005C9470: mov eax, var_1B0
  loc_005C9476: push esi
  loc_005C9477: call [eax+00000040h]
  loc_005C947A: test eax, eax
  loc_005C947C: fnclex
  loc_005C947E: jge 005C948Bh
  loc_005C9480: push 00000040h
  loc_005C9482: push 0041E5D8h
  loc_005C9487: push esi
  loc_005C9488: push eax
  loc_005C9489: call edi
  loc_005C948B: mov ecx, var_34
  loc_005C948E: mov eax, [ebx]
  loc_005C9490: mov var_19C, ecx
  loc_005C9496: lea ecx, var_20
  loc_005C9499: mov edx, [eax]
  loc_005C949B: push ecx
  loc_005C949C: push eax
  loc_005C949D: call [edx+000000B4h]
  loc_005C94A3: test eax, eax
  loc_005C94A5: fnclex
  loc_005C94A7: jge 005C94B9h
  loc_005C94A9: mov edx, [ebx]
  loc_005C94AB: push 000000B4h
  loc_005C94B0: push 0041E938h
  loc_005C94B5: push edx
  loc_005C94B6: push eax
  loc_005C94B7: call edi
  loc_005C94B9: lea esi, var_24
  loc_005C94BC: mov eax, var_20
  loc_005C94BF: push esi
  loc_005C94C0: mov ecx, 00000008h
  loc_005C94C5: sub esp, 00000010h
  loc_005C94C8: mov var_D4, ecx
  loc_005C94CE: mov esi, esp
  loc_005C94D0: mov var_CC, 0041EA28h ; "TAmount"
  loc_005C94DA: mov edx, [eax]
  loc_005C94DC: push eax
  loc_005C94DD: mov [esi], ecx
  loc_005C94DF: mov ecx, var_D0
  loc_005C94E5: mov var_170, eax
  loc_005C94EB: mov [esi+00000004h], ecx
  loc_005C94EE: mov ecx, var_CC
  loc_005C94F4: mov [esi+00000008h], ecx
  loc_005C94F7: mov ecx, var_C8
  loc_005C94FD: mov [esi+0000000Ch], ecx
  loc_005C9500: call [edx+00000030h]
  loc_005C9503: test eax, eax
  loc_005C9505: fnclex
  loc_005C9507: jge 005C951Ah
  loc_005C9509: mov edx, var_170
  loc_005C950F: push 00000030h
  loc_005C9511: push 0041EA14h ; "S"
  loc_005C9516: push edx
  loc_005C9517: push eax
  loc_005C9518: call edi
  loc_005C951A: mov eax, var_24
  loc_005C951D: lea edx, var_54
  loc_005C9520: push edx
  loc_005C9521: push eax
  loc_005C9522: mov ecx, [eax]
  loc_005C9524: mov esi, eax
  loc_005C9526: call [ecx+00000044h]
  loc_005C9529: test eax, eax
  loc_005C952B: fnclex
  loc_005C952D: jge 005C953Ah
  loc_005C952F: push 00000044h
  loc_005C9531: push 0041EA48h
  loc_005C9536: push esi
  loc_005C9537: push eax
  loc_005C9538: call edi
  loc_005C953A: mov eax, var_19C
  loc_005C9540: lea ecx, var_54
  loc_005C9543: push ecx
  loc_005C9544: mov esi, [eax]
  loc_005C9546: call [00401028h] ; __vbaStrVarMove
  loc_005C954C: mov edx, eax
  loc_005C954E: lea ecx, var_14
  loc_005C9551: call [00401270h] ; __vbaStrMove
  loc_005C9557: mov edx, esi
  loc_005C9559: mov esi, var_19C
  loc_005C955F: push eax
  loc_005C9560: push esi
  loc_005C9561: call [edx+000000A4h]
  loc_005C9567: test eax, eax
  loc_005C9569: fnclex
  loc_005C956B: jge 005C957Bh
  loc_005C956D: push 000000A4h
  loc_005C9572: push 0041E5E8h
  loc_005C9577: push esi
  loc_005C9578: push eax
  loc_005C9579: call edi
  loc_005C957B: lea ecx, var_14
  loc_005C957E: call [004012ACh] ; __vbaFreeStr
  loc_005C9584: lea eax, var_34
  loc_005C9587: lea ecx, var_24
  loc_005C958A: push eax
  loc_005C958B: lea edx, var_30
  loc_005C958E: push ecx
  loc_005C958F: lea eax, var_2C
  loc_005C9592: push edx
  loc_005C9593: lea ecx, var_28
  loc_005C9596: push eax
  loc_005C9597: lea edx, var_20
  loc_005C959A: push ecx
  loc_005C959B: push edx
  loc_005C959C: push 00000006h
  loc_005C959E: call [00401040h] ; __vbaFreeObjList
  loc_005C95A4: lea eax, var_54
  loc_005C95A7: lea ecx, var_44
  loc_005C95AA: push eax
  loc_005C95AB: push ecx
  loc_005C95AC: push 00000002h
  loc_005C95AE: call [00401038h] ; __vbaFreeVarList
  loc_005C95B4: mov esi, Me
  loc_005C95B7: add esp, 00000028h
  loc_005C95BA: mov edx, [esi]
  loc_005C95BC: push esi
  loc_005C95BD: call [edx+00000304h]
  loc_005C95C3: push eax
  loc_005C95C4: lea eax, var_2C
  loc_005C95C7: push eax
  loc_005C95C8: call [004010A0h] ; __vbaObjSet
  loc_005C95CE: mov ecx, [esi]
  loc_005C95D0: push esi
  loc_005C95D1: mov var_188, eax
  loc_005C95D7: call [ecx+00000304h]
  loc_005C95DD: lea edx, var_28
  loc_005C95E0: push eax
  loc_005C95E1: push edx
  loc_005C95E2: call [004010A0h] ; __vbaObjSet
  loc_005C95E8: mov esi, eax
  loc_005C95EA: lea ecx, var_14
  loc_005C95ED: push ecx
  loc_005C95EE: push esi
  loc_005C95EF: mov eax, [esi]
  loc_005C95F1: call [eax+000000A0h]
  loc_005C95F7: test eax, eax
  loc_005C95F9: fnclex
  loc_005C95FB: jge 005C960Bh
  loc_005C95FD: push 000000A0h
  loc_005C9602: push 0041E5E8h
  loc_005C9607: push esi
  loc_005C9608: push eax
  loc_005C9609: call edi
  loc_005C960B: mov eax, var_14
  loc_005C960E: lea ecx, var_20
  loc_005C9611: mov var_4C, eax
  loc_005C9614: mov eax, [ebx]
  loc_005C9616: mov var_14, 00000000h
  loc_005C961D: mov var_54, 00000008h
  loc_005C9624: mov edx, [eax]
  loc_005C9626: push ecx
  loc_005C9627: push eax
  loc_005C9628: call [edx+000000B4h]
  loc_005C962E: test eax, eax
  loc_005C9630: fnclex
  loc_005C9632: jge 005C9644h
  loc_005C9634: mov edx, [ebx]
  loc_005C9636: push 000000B4h
  loc_005C963B: push 0041E938h
  loc_005C9640: push edx
  loc_005C9641: push eax
  loc_005C9642: call edi
  loc_005C9644: lea ebx, var_24
  loc_005C9647: mov eax, var_20
  loc_005C964A: push ebx
  loc_005C964B: mov edx, 00000008h
  loc_005C9650: sub esp, 00000010h
  loc_005C9653: mov var_D4, edx
  loc_005C9659: mov ebx, esp
  loc_005C965B: mov ecx, 0041EA28h ; "TAmount"
  loc_005C9660: mov var_CC, ecx
  loc_005C9666: mov esi, [eax]
  loc_005C9668: mov [ebx], edx
  loc_005C966A: mov edx, var_D0
  loc_005C9670: push eax
  loc_005C9671: mov var_178, eax
  loc_005C9677: mov [ebx+00000004h], edx
  loc_005C967A: mov [ebx+00000008h], ecx
  loc_005C967D: mov ecx, var_C8
  loc_005C9683: mov [ebx+0000000Ch], ecx
  loc_005C9686: call [esi+00000030h]
  loc_005C9689: test eax, eax
  loc_005C968B: fnclex
  loc_005C968D: jge 005C96A0h
  loc_005C968F: mov edx, var_178
  loc_005C9695: push 00000030h
  loc_005C9697: push 0041EA14h ; "S"
  loc_005C969C: push edx
  loc_005C969D: push eax
  loc_005C969E: call edi
  loc_005C96A0: mov eax, var_24
  loc_005C96A3: lea edx, var_44
  loc_005C96A6: push edx
  loc_005C96A7: push eax
  loc_005C96A8: mov ecx, [eax]
  loc_005C96AA: mov esi, eax
  loc_005C96AC: call [ecx+00000044h]
  loc_005C96AF: test eax, eax
  loc_005C96B1: fnclex
  loc_005C96B3: jge 005C96C0h
  loc_005C96B5: push 00000044h
  loc_005C96B7: push 0041EA48h
  loc_005C96BC: push esi
  loc_005C96BD: push eax
  loc_005C96BE: call edi
  loc_005C96C0: mov esi, var_188
  loc_005C96C6: lea eax, var_54
  loc_005C96C9: lea ecx, var_44
  loc_005C96CC: push eax
  loc_005C96CD: mov ebx, [esi]
  loc_005C96CF: lea edx, var_64
  loc_005C96D2: push ecx
  loc_005C96D3: push edx
  loc_005C96D4: call [00401234h] ; __vbaVarAdd
  loc_005C96DA: push eax
  loc_005C96DB: lea eax, var_18
  loc_005C96DE: push eax
  loc_005C96DF: call [004011B0h] ; __vbaStrVarVal
  loc_005C96E5: push eax
  loc_005C96E6: call [004012B4h] ; rtcR8ValFromBstr
  loc_005C96EC: sub esp, 00000008h
  loc_005C96EF: fstp real8 ptr [esp]
  loc_005C96F2: call [00401144h] ; __vbaStrR8
  loc_005C96F8: mov edx, eax
  loc_005C96FA: lea ecx, var_1C
  loc_005C96FD: call [00401270h] ; __vbaStrMove
  loc_005C9703: push eax
  loc_005C9704: push esi
  loc_005C9705: call [ebx+000000A4h]
  loc_005C970B: test eax, eax
  loc_005C970D: fnclex
  loc_005C970F: jge 005C971Fh
  loc_005C9711: push 000000A4h
  loc_005C9716: push 0041E5E8h
  loc_005C971B: push esi
  loc_005C971C: push eax
  loc_005C971D: call edi
  loc_005C971F: lea ecx, var_1C
  loc_005C9722: lea edx, var_18
  loc_005C9725: push ecx
  loc_005C9726: push edx
  loc_005C9727: push 00000002h
  loc_005C9729: call [004011FCh] ; __vbaFreeStrList
  loc_005C972F: lea eax, var_2C
  loc_005C9732: lea ecx, var_28
  loc_005C9735: push eax
  loc_005C9736: lea edx, var_24
  loc_005C9739: push ecx
  loc_005C973A: lea eax, var_20
  loc_005C973D: push edx
  loc_005C973E: push eax
  loc_005C973F: push 00000004h
  loc_005C9741: call [00401040h] ; __vbaFreeObjList
  loc_005C9747: lea ecx, var_64
  loc_005C974A: lea edx, var_44
  loc_005C974D: push ecx
  loc_005C974E: lea eax, var_54
  loc_005C9751: push edx
  loc_005C9752: push eax
  loc_005C9753: push 00000003h
  loc_005C9755: call [00401038h] ; __vbaFreeVarList
  loc_005C975B: mov esi, Me
  loc_005C975E: add esp, 00000030h
  loc_005C9761: mov eax, [esi+00000034h]
  loc_005C9764: lea ebx, [esi+00000034h]
  loc_005C9767: push eax
  loc_005C9768: mov ecx, [eax]
  loc_005C976A: call [ecx+000000ECh]
  loc_005C9770: test eax, eax
  loc_005C9772: fnclex
  loc_005C9774: jge 005C935Dh
  loc_005C977A: mov edx, [ebx]
  loc_005C977C: push 000000ECh
  loc_005C9781: push 0041E938h
  loc_005C9786: push edx
  loc_005C9787: push eax
  loc_005C9788: call edi
  loc_005C978A: jmp 005C935Dh
  loc_005C978F: mov eax, [ebx]
  loc_005C9791: push eax
  loc_005C9792: mov ecx, [eax]
  loc_005C9794: call [ecx+000000C4h]
  loc_005C979A: test eax, eax
  loc_005C979C: fnclex
  loc_005C979E: jge 005C9E0Ch
  loc_005C97A4: jmp 005C9DFCh
  loc_005C97A9: mov esi, [004010D4h] ; rtcTrimVar
  loc_005C97AF: lea ecx, var_D4
  loc_005C97B5: lea edx, var_44
  loc_005C97B8: push ecx
  loc_005C97B9: push edx
  loc_005C97BA: call rtcTrimVar
  loc_005C97BC: lea eax, var_104
  loc_005C97C2: lea ecx, var_74
  loc_005C97C5: push eax
  loc_005C97C6: push ecx
  loc_005C97C7: mov var_FC, 0061A05Ch
  loc_005C97D1: mov var_104, ebx
  loc_005C97D7: call rtcTrimVar
  loc_005C97D9: lea edx, var_124
  loc_005C97DF: lea eax, var_A4
  loc_005C97E5: push edx
  loc_005C97E6: push eax
  loc_005C97E7: mov var_11C, 0061A060h
  loc_005C97F1: mov var_124, ebx
  loc_005C97F7: call rtcTrimVar
  loc_005C97F9: mov esi, 00000008h
  loc_005C97FE: mov var_DC, 0042C0F0h ; "Select Num1,Sum(Value) as TAmount From LGSaleDetail Where AgentName='"
  loc_005C9808: mov var_E4, esi
  loc_005C980E: mov var_F4, esi
  loc_005C9814: mov var_114, esi
  loc_005C981A: mov var_134, esi
  loc_005C9820: mov esi, [0061A13Ch]
  loc_005C9826: mov var_EC, 00431B24h ; "' AND OnCount='"
  loc_005C9830: mov var_10C, 0041ECD0h ; "' And AMPM='"
  loc_005C983A: mov var_12C, 00431B48h ; "' Group by Num1,AgentName,OnCount,AMPM"
  loc_005C9844: mov ebx, [esi]
  loc_005C9846: lea esi, var_20
  loc_005C9849: push esi
  loc_005C984A: mov ecx, 0000000Ah
  loc_005C984F: sub esp, 00000010h
  loc_005C9852: mov var_154, ecx
  loc_005C9858: mov esi, esp
  loc_005C985A: mov eax, 80020004h
  loc_005C985F: mov edx, eax
  loc_005C9861: sub esp, 00000010h
  loc_005C9864: mov [esi], ecx
  loc_005C9866: mov ecx, var_160
  loc_005C986C: mov [esi+00000004h], ecx
  loc_005C986F: mov ecx, esp
  loc_005C9871: sub esp, 00000010h
  loc_005C9874: mov [esi+00000008h], eax
  loc_005C9877: mov eax, var_158
  loc_005C987D: mov [esi+0000000Ch], eax
  loc_005C9880: mov eax, var_154
  loc_005C9886: mov [ecx], eax
  loc_005C9888: mov eax, var_150
  loc_005C988E: mov esi, [004011B4h] ; __vbaVarCat
  loc_005C9894: mov [ecx+00000004h], eax
  loc_005C9897: mov eax, 00000003h
  loc_005C989C: mov [ecx+00000008h], edx
  loc_005C989F: mov edx, var_148
  loc_005C98A5: mov [ecx+0000000Ch], edx
  loc_005C98A8: mov edx, var_140
  loc_005C98AE: mov ecx, esp
  loc_005C98B0: mov [ecx], eax
  loc_005C98B2: mov eax, 00000004h
  loc_005C98B7: mov [ecx+00000004h], edx
  loc_005C98BA: lea edx, var_44
  loc_005C98BD: mov [ecx+00000008h], eax
  loc_005C98C0: mov eax, var_138
  loc_005C98C6: mov [ecx+0000000Ch], eax
  loc_005C98C9: lea ecx, var_E4
  loc_005C98CF: push ecx
  loc_005C98D0: lea eax, var_54
  loc_005C98D3: push edx
  loc_005C98D4: push eax
  loc_005C98D5: call __vbaVarCat
  loc_005C98D7: lea ecx, var_F4
  loc_005C98DD: push eax
  loc_005C98DE: lea edx, var_64
  loc_005C98E1: push ecx
  loc_005C98E2: push edx
  loc_005C98E3: call __vbaVarCat
  loc_005C98E5: push eax
  loc_005C98E6: lea eax, var_74
  loc_005C98E9: push eax
  loc_005C98EA: lea ecx, var_84
  loc_005C98F0: push ecx
  loc_005C98F1: call __vbaVarCat
  loc_005C98F3: push eax
  loc_005C98F4: lea edx, var_114
  loc_005C98FA: lea eax, var_94
  loc_005C9900: push edx
  loc_005C9901: push eax
  loc_005C9902: call __vbaVarCat
  loc_005C9904: lea ecx, var_A4
  loc_005C990A: push eax
  loc_005C990B: lea edx, var_B4
  loc_005C9911: push ecx
  loc_005C9912: push edx
  loc_005C9913: call __vbaVarCat
  loc_005C9915: push eax
  loc_005C9916: lea eax, var_134
  loc_005C991C: lea ecx, var_C4
  loc_005C9922: push eax
  loc_005C9923: push ecx
  loc_005C9924: call __vbaVarCat
  loc_005C9926: lea edx, var_14
  loc_005C9929: push eax
  loc_005C992A: push edx
  loc_005C992B: call [004011B0h] ; __vbaStrVarVal
  loc_005C9931: push eax
  loc_005C9932: mov eax, [0061A13Ch]
  loc_005C9937: push eax
  loc_005C9938: call [ebx+000000BCh]
  loc_005C993E: test eax, eax
  loc_005C9940: fnclex
  loc_005C9942: jge 005C9958h
  loc_005C9944: mov ecx, [0061A13Ch]
  loc_005C994A: push 000000BCh
  loc_005C994F: push 0041E928h
  loc_005C9954: push ecx
  loc_005C9955: push eax
  loc_005C9956: call edi
  loc_005C9958: mov esi, Me
  loc_005C995B: mov edx, var_20
  loc_005C995E: push edx
  loc_005C995F: lea ebx, [esi+00000034h]
  loc_005C9962: push ebx
  loc_005C9963: call [004010B8h] ; __vbaObjSetAddref
  loc_005C9969: lea ecx, var_14
  loc_005C996C: call [004012ACh] ; __vbaFreeStr
  loc_005C9972: lea ecx, var_20
  loc_005C9975: call [004012B0h] ; __vbaFreeObj
  loc_005C997B: lea eax, var_C4
  loc_005C9981: lea ecx, var_B4
  loc_005C9987: push eax
  loc_005C9988: lea edx, var_A4
  loc_005C998E: push ecx
  loc_005C998F: lea eax, var_94
  loc_005C9995: push edx
  loc_005C9996: lea ecx, var_84
  loc_005C999C: push eax
  loc_005C999D: lea edx, var_74
  loc_005C99A0: push ecx
  loc_005C99A1: lea eax, var_64
  loc_005C99A4: push edx
  loc_005C99A5: lea ecx, var_54
  loc_005C99A8: push eax
  loc_005C99A9: lea edx, var_44
  loc_005C99AC: push ecx
  loc_005C99AD: push edx
  loc_005C99AE: push 00000009h
  loc_005C99B0: call [00401038h] ; __vbaFreeVarList
  loc_005C99B6: add esp, 00000028h
  loc_005C99B9: mov eax, [ebx]
  loc_005C99BB: lea edx, var_168
  loc_005C99C1: push edx
  loc_005C99C2: push eax
  loc_005C99C3: mov ecx, [eax]
  loc_005C99C5: call [ecx+00000034h]
  loc_005C99C8: test eax, eax
  loc_005C99CA: fnclex
  loc_005C99CC: jge 005C99DBh
  loc_005C99CE: mov ecx, [ebx]
  loc_005C99D0: push 00000034h
  loc_005C99D2: push 0041E938h
  loc_005C99D7: push ecx
  loc_005C99D8: push eax
  loc_005C99D9: call edi
  loc_005C99DB: cmp var_168, 0000h
  loc_005C99E3: jnz 005C9DEBh
  loc_005C99E9: mov edx, [esi]
  loc_005C99EB: push esi
  loc_005C99EC: call [edx+00000314h]
  loc_005C99F2: push eax
  loc_005C99F3: lea eax, var_30
  loc_005C99F6: push eax
  loc_005C99F7: call [004010A0h] ; __vbaObjSet
  loc_005C99FD: mov var_194, eax
  loc_005C9A03: mov eax, [ebx]
  loc_005C9A05: lea edx, var_28
  loc_005C9A08: mov ecx, [eax]
  loc_005C9A0A: push edx
  loc_005C9A0B: push eax
  loc_005C9A0C: call [ecx+000000B4h]
  loc_005C9A12: test eax, eax
  loc_005C9A14: fnclex
  loc_005C9A16: jge 005C9A28h
  loc_005C9A18: mov ecx, [ebx]
  loc_005C9A1A: push 000000B4h
  loc_005C9A1F: push 0041E938h
  loc_005C9A24: push ecx
  loc_005C9A25: push eax
  loc_005C9A26: call edi
  loc_005C9A28: lea esi, var_2C
  loc_005C9A2B: mov eax, var_28
  loc_005C9A2E: push esi
  loc_005C9A2F: mov ecx, 00000008h
  loc_005C9A34: sub esp, 00000010h
  loc_005C9A37: mov var_E4, ecx
  loc_005C9A3D: mov esi, esp
  loc_005C9A3F: mov var_DC, 0041EA3Ch ; "Num1"
  loc_005C9A49: mov edx, [eax]
  loc_005C9A4B: push eax
  loc_005C9A4C: mov [esi], ecx
  loc_005C9A4E: mov ecx, var_E0
  loc_005C9A54: mov var_184, eax
  loc_005C9A5A: mov [esi+00000004h], ecx
  loc_005C9A5D: mov ecx, var_DC
  loc_005C9A63: mov [esi+00000008h], ecx
  loc_005C9A66: mov ecx, var_D8
  loc_005C9A6C: mov [esi+0000000Ch], ecx
  loc_005C9A6F: call [edx+00000030h]
  loc_005C9A72: test eax, eax
  loc_005C9A74: fnclex
  loc_005C9A76: jge 005C9A89h
  loc_005C9A78: mov edx, var_184
  loc_005C9A7E: push 00000030h
  loc_005C9A80: push 0041EA14h ; "S"
  loc_005C9A85: push edx
  loc_005C9A86: push eax
  loc_005C9A87: call edi
  loc_005C9A89: mov eax, var_2C
  loc_005C9A8C: lea edx, var_44
  loc_005C9A8F: push edx
  loc_005C9A90: push eax
  loc_005C9A91: mov ecx, [eax]
  loc_005C9A93: mov esi, eax
  loc_005C9A95: call [ecx+00000044h]
  loc_005C9A98: test eax, eax
  loc_005C9A9A: fnclex
  loc_005C9A9C: jge 005C9AA9h
  loc_005C9A9E: push 00000044h
  loc_005C9AA0: push 0041EA48h
  loc_005C9AA5: push esi
  loc_005C9AA6: push eax
  loc_005C9AA7: call edi
  loc_005C9AA9: mov eax, var_194
  loc_005C9AAF: lea ecx, var_34
  loc_005C9AB2: lea edx, var_44
  loc_005C9AB5: push ecx
  loc_005C9AB6: mov esi, [eax]
  loc_005C9AB8: push edx
  loc_005C9AB9: call [004011C0h] ; __vbaI2Var
  loc_005C9ABF: mov var_1B8, esi
  loc_005C9AC5: mov esi, var_194
  loc_005C9ACB: push eax
  loc_005C9ACC: mov eax, var_1B8
  loc_005C9AD2: push esi
  loc_005C9AD3: call [eax+00000040h]
  loc_005C9AD6: test eax, eax
  loc_005C9AD8: fnclex
  loc_005C9ADA: jge 005C9AE7h
  loc_005C9ADC: push 00000040h
  loc_005C9ADE: push 0041E5D8h
  loc_005C9AE3: push esi
  loc_005C9AE4: push eax
  loc_005C9AE5: call edi
  loc_005C9AE7: mov ecx, var_34
  loc_005C9AEA: mov eax, [ebx]
  loc_005C9AEC: mov var_19C, ecx
  loc_005C9AF2: lea ecx, var_20
  loc_005C9AF5: mov edx, [eax]
  loc_005C9AF7: push ecx
  loc_005C9AF8: push eax
  loc_005C9AF9: call [edx+000000B4h]
  loc_005C9AFF: test eax, eax
  loc_005C9B01: fnclex
  loc_005C9B03: jge 005C9B15h
  loc_005C9B05: mov edx, [ebx]
  loc_005C9B07: push 000000B4h
  loc_005C9B0C: push 0041E938h
  loc_005C9B11: push edx
  loc_005C9B12: push eax
  loc_005C9B13: call edi
  loc_005C9B15: lea esi, var_24
  loc_005C9B18: mov eax, var_20
  loc_005C9B1B: push esi
  loc_005C9B1C: mov ecx, 00000008h
  loc_005C9B21: sub esp, 00000010h
  loc_005C9B24: mov var_D4, ecx
  loc_005C9B2A: mov esi, esp
  loc_005C9B2C: mov var_CC, 0041EA28h ; "TAmount"
  loc_005C9B36: mov edx, [eax]
  loc_005C9B38: push eax
  loc_005C9B39: mov [esi], ecx
  loc_005C9B3B: mov ecx, var_D0
  loc_005C9B41: mov var_170, eax
  loc_005C9B47: mov [esi+00000004h], ecx
  loc_005C9B4A: mov ecx, var_CC
  loc_005C9B50: mov [esi+00000008h], ecx
  loc_005C9B53: mov ecx, var_C8
  loc_005C9B59: mov [esi+0000000Ch], ecx
  loc_005C9B5C: call [edx+00000030h]
  loc_005C9B5F: test eax, eax
  loc_005C9B61: fnclex
  loc_005C9B63: jge 005C9B76h
  loc_005C9B65: mov edx, var_170
  loc_005C9B6B: push 00000030h
  loc_005C9B6D: push 0041EA14h ; "S"
  loc_005C9B72: push edx
  loc_005C9B73: push eax
  loc_005C9B74: call edi
  loc_005C9B76: mov eax, var_24
  loc_005C9B79: lea edx, var_54
  loc_005C9B7C: push edx
  loc_005C9B7D: push eax
  loc_005C9B7E: mov ecx, [eax]
  loc_005C9B80: mov esi, eax
  loc_005C9B82: call [ecx+00000044h]
  loc_005C9B85: test eax, eax
  loc_005C9B87: fnclex
  loc_005C9B89: jge 005C9B96h
  loc_005C9B8B: push 00000044h
  loc_005C9B8D: push 0041EA48h
  loc_005C9B92: push esi
  loc_005C9B93: push eax
  loc_005C9B94: call edi
  loc_005C9B96: mov eax, var_19C
  loc_005C9B9C: lea ecx, var_54
  loc_005C9B9F: push ecx
  loc_005C9BA0: mov esi, [eax]
  loc_005C9BA2: call [00401028h] ; __vbaStrVarMove
  loc_005C9BA8: mov edx, eax
  loc_005C9BAA: lea ecx, var_14
  loc_005C9BAD: call [00401270h] ; __vbaStrMove
  loc_005C9BB3: mov edx, esi
  loc_005C9BB5: mov esi, var_19C
  loc_005C9BBB: push eax
  loc_005C9BBC: push esi
  loc_005C9BBD: call [edx+000000A4h]
  loc_005C9BC3: test eax, eax
  loc_005C9BC5: fnclex
  loc_005C9BC7: jge 005C9BD7h
  loc_005C9BC9: push 000000A4h
  loc_005C9BCE: push 0041E5E8h
  loc_005C9BD3: push esi
  loc_005C9BD4: push eax
  loc_005C9BD5: call edi
  loc_005C9BD7: lea ecx, var_14
  loc_005C9BDA: call [004012ACh] ; __vbaFreeStr
  loc_005C9BE0: lea eax, var_34
  loc_005C9BE3: lea ecx, var_24
  loc_005C9BE6: push eax
  loc_005C9BE7: lea edx, var_30
  loc_005C9BEA: push ecx
  loc_005C9BEB: lea eax, var_2C
  loc_005C9BEE: push edx
  loc_005C9BEF: lea ecx, var_28
  loc_005C9BF2: push eax
  loc_005C9BF3: lea edx, var_20
  loc_005C9BF6: push ecx
  loc_005C9BF7: push edx
  loc_005C9BF8: push 00000006h
  loc_005C9BFA: call [00401040h] ; __vbaFreeObjList
  loc_005C9C00: lea eax, var_54
  loc_005C9C03: lea ecx, var_44
  loc_005C9C06: push eax
  loc_005C9C07: push ecx
  loc_005C9C08: push 00000002h
  loc_005C9C0A: call [00401038h] ; __vbaFreeVarList
  loc_005C9C10: mov esi, Me
  loc_005C9C13: add esp, 00000028h
  loc_005C9C16: mov edx, [esi]
  loc_005C9C18: push esi
  loc_005C9C19: call [edx+00000304h]
  loc_005C9C1F: push eax
  loc_005C9C20: lea eax, var_2C
  loc_005C9C23: push eax
  loc_005C9C24: call [004010A0h] ; __vbaObjSet
  loc_005C9C2A: mov ecx, [esi]
  loc_005C9C2C: push esi
  loc_005C9C2D: mov var_188, eax
  loc_005C9C33: call [ecx+00000304h]
  loc_005C9C39: lea edx, var_28
  loc_005C9C3C: push eax
  loc_005C9C3D: push edx
  loc_005C9C3E: call [004010A0h] ; __vbaObjSet
  loc_005C9C44: mov esi, eax
  loc_005C9C46: lea ecx, var_14
  loc_005C9C49: push ecx
  loc_005C9C4A: push esi
  loc_005C9C4B: mov eax, [esi]
  loc_005C9C4D: call [eax+000000A0h]
  loc_005C9C53: test eax, eax
  loc_005C9C55: fnclex
  loc_005C9C57: jge 005C9C67h
  loc_005C9C59: push 000000A0h
  loc_005C9C5E: push 0041E5E8h
  loc_005C9C63: push esi
  loc_005C9C64: push eax
  loc_005C9C65: call edi
  loc_005C9C67: mov eax, var_14
  loc_005C9C6A: lea ecx, var_20
  loc_005C9C6D: mov var_4C, eax
  loc_005C9C70: mov eax, [ebx]
  loc_005C9C72: mov var_14, 00000000h
  loc_005C9C79: mov var_54, 00000008h
  loc_005C9C80: mov edx, [eax]
  loc_005C9C82: push ecx
  loc_005C9C83: push eax
  loc_005C9C84: call [edx+000000B4h]
  loc_005C9C8A: test eax, eax
  loc_005C9C8C: fnclex
  loc_005C9C8E: jge 005C9CA0h
  loc_005C9C90: mov edx, [ebx]
  loc_005C9C92: push 000000B4h
  loc_005C9C97: push 0041E938h
  loc_005C9C9C: push edx
  loc_005C9C9D: push eax
  loc_005C9C9E: call edi
  loc_005C9CA0: lea ebx, var_24
  loc_005C9CA3: mov eax, var_20
  loc_005C9CA6: push ebx
  loc_005C9CA7: mov edx, 00000008h
  loc_005C9CAC: sub esp, 00000010h
  loc_005C9CAF: mov var_D4, edx
  loc_005C9CB5: mov ebx, esp
  loc_005C9CB7: mov ecx, 0041EA28h ; "TAmount"
  loc_005C9CBC: mov var_CC, ecx
  loc_005C9CC2: mov esi, [eax]
  loc_005C9CC4: mov [ebx], edx
  loc_005C9CC6: mov edx, var_D0
  loc_005C9CCC: push eax
  loc_005C9CCD: mov var_178, eax
  loc_005C9CD3: mov [ebx+00000004h], edx
  loc_005C9CD6: mov [ebx+00000008h], ecx
  loc_005C9CD9: mov ecx, var_C8
  loc_005C9CDF: mov [ebx+0000000Ch], ecx
  loc_005C9CE2: call [esi+00000030h]
  loc_005C9CE5: test eax, eax
  loc_005C9CE7: fnclex
  loc_005C9CE9: jge 005C9CFCh
  loc_005C9CEB: mov edx, var_178
  loc_005C9CF1: push 00000030h
  loc_005C9CF3: push 0041EA14h ; "S"
  loc_005C9CF8: push edx
  loc_005C9CF9: push eax
  loc_005C9CFA: call edi
  loc_005C9CFC: mov eax, var_24
  loc_005C9CFF: lea edx, var_44
  loc_005C9D02: push edx
  loc_005C9D03: push eax
  loc_005C9D04: mov ecx, [eax]
  loc_005C9D06: mov esi, eax
  loc_005C9D08: call [ecx+00000044h]
  loc_005C9D0B: test eax, eax
  loc_005C9D0D: fnclex
  loc_005C9D0F: jge 005C9D1Ch
  loc_005C9D11: push 00000044h
  loc_005C9D13: push 0041EA48h
  loc_005C9D18: push esi
  loc_005C9D19: push eax
  loc_005C9D1A: call edi
  loc_005C9D1C: mov esi, var_188
  loc_005C9D22: lea eax, var_54
  loc_005C9D25: lea ecx, var_44
  loc_005C9D28: push eax
  loc_005C9D29: mov ebx, [esi]
  loc_005C9D2B: lea edx, var_64
  loc_005C9D2E: push ecx
  loc_005C9D2F: push edx
  loc_005C9D30: call [00401234h] ; __vbaVarAdd
  loc_005C9D36: push eax
  loc_005C9D37: lea eax, var_18
  loc_005C9D3A: push eax
  loc_005C9D3B: call [004011B0h] ; __vbaStrVarVal
  loc_005C9D41: push eax
  loc_005C9D42: call [004012B4h] ; rtcR8ValFromBstr
  loc_005C9D48: sub esp, 00000008h
  loc_005C9D4B: fstp real8 ptr [esp]
  loc_005C9D4E: call [00401144h] ; __vbaStrR8
  loc_005C9D54: mov edx, eax
  loc_005C9D56: lea ecx, var_1C
  loc_005C9D59: call [00401270h] ; __vbaStrMove
  loc_005C9D5F: push eax
  loc_005C9D60: push esi
  loc_005C9D61: call [ebx+000000A4h]
  loc_005C9D67: test eax, eax
  loc_005C9D69: fnclex
  loc_005C9D6B: jge 005C9D7Bh
  loc_005C9D6D: push 000000A4h
  loc_005C9D72: push 0041E5E8h
  loc_005C9D77: push esi
  loc_005C9D78: push eax
  loc_005C9D79: call edi
  loc_005C9D7B: lea ecx, var_1C
  loc_005C9D7E: lea edx, var_18
  loc_005C9D81: push ecx
  loc_005C9D82: push edx
  loc_005C9D83: push 00000002h
  loc_005C9D85: call [004011FCh] ; __vbaFreeStrList
  loc_005C9D8B: lea eax, var_2C
  loc_005C9D8E: lea ecx, var_28
  loc_005C9D91: push eax
  loc_005C9D92: lea edx, var_24
  loc_005C9D95: push ecx
  loc_005C9D96: lea eax, var_20
  loc_005C9D99: push edx
  loc_005C9D9A: push eax
  loc_005C9D9B: push 00000004h
  loc_005C9D9D: call [00401040h] ; __vbaFreeObjList
  loc_005C9DA3: lea ecx, var_64
  loc_005C9DA6: lea edx, var_44
  loc_005C9DA9: push ecx
  loc_005C9DAA: lea eax, var_54
  loc_005C9DAD: push edx
  loc_005C9DAE: push eax
  loc_005C9DAF: push 00000003h
  loc_005C9DB1: call [00401038h] ; __vbaFreeVarList
  loc_005C9DB7: mov esi, Me
  loc_005C9DBA: add esp, 00000030h
  loc_005C9DBD: mov eax, [esi+00000034h]
  loc_005C9DC0: lea ebx, [esi+00000034h]
  loc_005C9DC3: push eax
  loc_005C9DC4: mov ecx, [eax]
  loc_005C9DC6: call [ecx+000000ECh]
  loc_005C9DCC: test eax, eax
  loc_005C9DCE: fnclex
  loc_005C9DD0: jge 005C99B9h
  loc_005C9DD6: mov edx, [ebx]
  loc_005C9DD8: push 000000ECh
  loc_005C9DDD: push 0041E938h
  loc_005C9DE2: push edx
  loc_005C9DE3: push eax
  loc_005C9DE4: call edi
  loc_005C9DE6: jmp 005C99B9h
  loc_005C9DEB: mov eax, [ebx]
  loc_005C9DED: push eax
  loc_005C9DEE: mov ecx, [eax]
  loc_005C9DF0: call [ecx+000000C4h]
  loc_005C9DF6: test eax, eax
  loc_005C9DF8: fnclex
  loc_005C9DFA: jge 005C9E0Ch
  loc_005C9DFC: mov edx, [ebx]
  loc_005C9DFE: push 000000C4h
  loc_005C9E03: push 0041E938h
  loc_005C9E08: push edx
  loc_005C9E09: push eax
  loc_005C9E0A: call edi
  loc_005C9E0C: push 0041E938h
  loc_005C9E11: push 00000000h
  loc_005C9E13: call [00401274h] ; __vbaCastObj
  loc_005C9E19: push eax
  loc_005C9E1A: lea eax, var_20
  loc_005C9E1D: push eax
  loc_005C9E1E: call [004010A0h] ; __vbaObjSet
  loc_005C9E24: push eax
  loc_005C9E25: push ebx
  loc_005C9E26: call [004010B8h] ; __vbaObjSetAddref
  loc_005C9E2C: lea ecx, var_20
  loc_005C9E2F: call [004012B0h] ; __vbaFreeObj
  loc_005C9E35: fwait
  loc_005C9E36: push 005C9EB1h
  loc_005C9E3B: jmp 005C9EB0h
  loc_005C9E3D: lea ecx, var_1C
  loc_005C9E40: lea edx, var_18
  loc_005C9E43: push ecx
  loc_005C9E44: lea eax, var_14
  loc_005C9E47: push edx
  loc_005C9E48: push eax
  loc_005C9E49: push 00000003h
  loc_005C9E4B: call [004011FCh] ; __vbaFreeStrList
  loc_005C9E51: lea ecx, var_34
  loc_005C9E54: lea edx, var_30
  loc_005C9E57: push ecx
  loc_005C9E58: lea eax, var_2C
  loc_005C9E5B: push edx
  loc_005C9E5C: lea ecx, var_28
  loc_005C9E5F: push eax
  loc_005C9E60: lea edx, var_24
  loc_005C9E63: push ecx
  loc_005C9E64: lea eax, var_20
  loc_005C9E67: push edx
  loc_005C9E68: push eax
  loc_005C9E69: push 00000006h
  loc_005C9E6B: call [00401040h] ; __vbaFreeObjList
  loc_005C9E71: lea ecx, var_C4
  loc_005C9E77: lea edx, var_B4
  loc_005C9E7D: push ecx
  loc_005C9E7E: lea eax, var_A4
  loc_005C9E84: push edx
  loc_005C9E85: lea ecx, var_94
  loc_005C9E8B: push eax
  loc_005C9E8C: lea edx, var_84
  loc_005C9E92: push ecx
  loc_005C9E93: lea eax, var_74
  loc_005C9E96: push edx
  loc_005C9E97: lea ecx, var_64
  loc_005C9E9A: push eax
  loc_005C9E9B: lea edx, var_54
  loc_005C9E9E: push ecx
  loc_005C9E9F: lea eax, var_44
  loc_005C9EA2: push edx
  loc_005C9EA3: push eax
  loc_005C9EA4: push 00000009h
  loc_005C9EA6: call [00401038h] ; __vbaFreeVarList
  loc_005C9EAC: add esp, 00000054h
  loc_005C9EAF: ret
  loc_005C9EB0: ret
  loc_005C9EB1: mov ecx, var_10
  loc_005C9EB4: pop edi
  loc_005C9EB5: pop esi
  loc_005C9EB6: xor eax, eax
  loc_005C9EB8: mov fs:[00000000h], ecx
  loc_005C9EBF: pop ebx
  loc_005C9EC0: mov esp, ebp
  loc_005C9EC2: pop ebp
  loc_005C9EC3: retn 0004h
End Sub
