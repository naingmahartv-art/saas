VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC0000F8754DA1}#2.0#0"; "C:\WINDOWS\SysWow64\MSCOMCT2.OCX"
Begin VB.Form frmOnCount
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ControlBox = 0   'False
  ClientLeft = 60
  ClientTop = 60
  ClientWidth = 4260
  ClientHeight = 1605
  StartUpPosition = 2 'CenterScreen
  Begin VB.Frame Frame2
    Left = 0
    Top = -90
    Width = 4245
    Height = 1695
    TabIndex = 4
    Begin VB.ComboBox cboTime
      Style = 2
      Left = 3210
      Top = 360
      Width = 885
      Height = 360
      TabIndex = 1
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
    Begin MSComCtl2.DTPicker cboOnCount
      Left = 1350
      Top = 360
      Width = 1845
      Height = 345
      TabIndex = 0
      OleObjectBlob = "frmOnCount.frx":0000
    End
    Begin VB.CommandButton cmdCancel
      Caption = "&Cancel"
      Left = 2310
      Top = 1080
      Width = 885
      Height = 375
      TabIndex = 3
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
    Begin VB.CommandButton cmdOk
      Caption = "&Ok"
      Left = 1410
      Top = 1080
      Width = 885
      Height = 375
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
    Begin VB.Label Label26
      Caption = "OnCount"
      Left = 180
      Top = 360
      Width = 1005
      Height = 285
      TabIndex = 5
      AutoSize = -1  'True
      BeginProperty Font
        Name = "MS Serif"
        Size = 12
        Charset = 0
        Weight = 700
        Underline = 0 'False
        Italic = 0 'False
        Strikethrough = 0 'False
      EndProperty
    End
  End
  Begin VB.ComboBox cboOnCountM
    Style = 2
    Left = 1140
    Top = 690
    Width = 2235
    Height = 330
    TabIndex = 6
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
  Begin VB.OptionButton optMyanmar
    Caption = "Myanmar"
    Left = 570
    Top = 300
    Width = 1065
    Height = 210
    TabIndex = 7
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
  Begin VB.Label Label25
    Caption = "OnCount"
    Left = 0
    Top = 720
    Width = 1080
    Height = 285
    TabIndex = 8
    AutoSize = -1  'True
    BeginProperty Font
      Name = "MS Serif"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = -1 'True
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmOnCount"


Private Sub cmdOk_Click() '5FB710
  loc_005FB710: push ebp
  loc_005FB711: mov ebp, esp
  loc_005FB713: sub esp, 0000000Ch
  loc_005FB716: push 00403B36h ; __vbaExceptHandler
  loc_005FB71B: mov eax, fs:[00000000h]
  loc_005FB721: push eax
  loc_005FB722: mov fs:[00000000h], esp
  loc_005FB729: sub esp, 00000064h
  loc_005FB72C: push ebx
  loc_005FB72D: push esi
  loc_005FB72E: push edi
  loc_005FB72F: mov var_C, esp
  loc_005FB732: mov var_8, 004033D8h
  loc_005FB739: mov esi, Me
  loc_005FB73C: mov eax, esi
  loc_005FB73E: and eax, 00000001h
  loc_005FB741: mov var_4, eax
  loc_005FB744: and esi, FFFFFFFEh
  loc_005FB747: push esi
  loc_005FB748: mov Me, esi
  loc_005FB74B: mov ecx, [esi]
  loc_005FB74D: call [ecx+00000004h]
  loc_005FB750: mov ebx, [004010D4h] ; rtcTrimVar
  loc_005FB756: lea edx, var_4C
  loc_005FB759: xor edi, edi
  loc_005FB75B: lea eax, var_2C
  loc_005FB75E: push edx
  loc_005FB75F: mov var_4C, edi
  loc_005FB762: push eax
  loc_005FB763: mov var_18, edi
  loc_005FB766: mov var_1C, edi
  loc_005FB769: mov var_2C, edi
  loc_005FB76C: mov var_3C, edi
  loc_005FB76F: mov var_5C, edi
  loc_005FB772: mov var_44, 0061A0A0h
  loc_005FB779: mov var_4C, 00004008h
  loc_005FB780: call ebx
  loc_005FB782: lea ecx, var_2C
  loc_005FB785: lea edx, var_5C
  loc_005FB788: push ecx
  loc_005FB789: push edx
  loc_005FB78A: mov var_54, 004292D8h ; "Delete"
  loc_005FB791: mov var_5C, 00008008h
  loc_005FB798: call [00401110h] ; __vbaVarTstEq
  loc_005FB79E: lea ecx, var_2C
  loc_005FB7A1: mov var_60, ax
  loc_005FB7A5: call [00401020h] ; __vbaFreeVar
  loc_005FB7AB: cmp var_60, di
  loc_005FB7AF: jz 005FB8F6h
  loc_005FB7B5: mov eax, [esi]
  loc_005FB7B7: push edi
  loc_005FB7B8: push 00000014h
  loc_005FB7BA: push esi
  loc_005FB7BB: call [eax+0000031Ch]
  loc_005FB7C1: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FB7C7: lea ecx, var_1C
  loc_005FB7CA: push eax
  loc_005FB7CB: push ecx
  loc_005FB7CC: call edi
  loc_005FB7CE: lea edx, var_2C
  loc_005FB7D1: push eax
  loc_005FB7D2: push edx
  loc_005FB7D3: call [00401140h] ; __vbaLateIdCallLd
  loc_005FB7D9: add esp, 00000010h
  loc_005FB7DC: push eax
  loc_005FB7DD: lea eax, var_3C
  loc_005FB7E0: push eax
  loc_005FB7E1: call ebx
  loc_005FB7E3: lea ecx, var_3C
  loc_005FB7E6: push ecx
  loc_005FB7E7: call [00401028h] ; __vbaStrVarMove
  loc_005FB7ED: mov edx, eax
  loc_005FB7EF: mov ecx, 0061A0A4h
  loc_005FB7F4: call [00401270h] ; __vbaStrMove
  loc_005FB7FA: lea ecx, var_1C
  loc_005FB7FD: call [004012B0h] ; __vbaFreeObj
  loc_005FB803: lea edx, var_3C
  loc_005FB806: lea eax, var_2C
  loc_005FB809: push edx
  loc_005FB80A: push eax
  loc_005FB80B: push 00000002h
  loc_005FB80D: call [00401038h] ; __vbaFreeVarList
  loc_005FB813: mov ecx, [esi]
  loc_005FB815: add esp, 0000000Ch
  loc_005FB818: push esi
  loc_005FB819: call [ecx+00000300h]
  loc_005FB81F: lea edx, var_1C
  loc_005FB822: push eax
  loc_005FB823: push edx
  loc_005FB824: call edi
  loc_005FB826: mov edi, eax
  loc_005FB828: lea ecx, var_18
  loc_005FB82B: push ecx
  loc_005FB82C: push edi
  loc_005FB82D: mov eax, [edi]
  loc_005FB82F: call [eax+000000A8h]
  loc_005FB835: test eax, eax
  loc_005FB837: fnclex
  loc_005FB839: jge 005FB84Dh
  loc_005FB83B: push 000000A8h
  loc_005FB840: push 0041F844h
  loc_005FB845: push edi
  loc_005FB846: push eax
  loc_005FB847: call [00401074h] ; __vbaHresultCheckObj
  loc_005FB84D: mov eax, var_18
  loc_005FB850: lea edx, var_2C
  loc_005FB853: mov var_24, eax
  loc_005FB856: lea eax, var_3C
  loc_005FB859: push edx
  loc_005FB85A: push eax
  loc_005FB85B: mov var_18, 00000000h
  loc_005FB862: mov var_2C, 00000008h
  loc_005FB869: call ebx
  loc_005FB86B: lea ecx, var_3C
  loc_005FB86E: push ecx
  loc_005FB86F: call [00401028h] ; __vbaStrVarMove
  loc_005FB875: mov edx, eax
  loc_005FB877: mov ecx, 0061A060h
  loc_005FB87C: call [00401270h] ; __vbaStrMove
  loc_005FB882: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005FB888: lea ecx, var_1C
  loc_005FB88B: call ebx
  loc_005FB88D: lea edx, var_3C
  loc_005FB890: lea eax, var_2C
  loc_005FB893: push edx
  loc_005FB894: push eax
  loc_005FB895: push 00000002h
  loc_005FB897: call [00401038h] ; __vbaFreeVarList
  loc_005FB89D: mov eax, [0061B394h]
  loc_005FB8A2: add esp, 0000000Ch
  loc_005FB8A5: test eax, eax
  loc_005FB8A7: jnz 005FB8B9h
  loc_005FB8A9: push 0061B394h
  loc_005FB8AE: push 0041E4A0h
  loc_005FB8B3: call [004011DCh] ; __vbaNew2
  loc_005FB8B9: mov edi, [0061B394h]
  loc_005FB8BF: lea ecx, var_1C
  loc_005FB8C2: push esi
  loc_005FB8C3: push ecx
  loc_005FB8C4: mov edx, [edi]
  loc_005FB8C6: mov var_78, edx
  loc_005FB8C9: call [004010B8h] ; __vbaObjSetAddref
  loc_005FB8CF: mov edx, var_78
  loc_005FB8D2: push eax
  loc_005FB8D3: push edi
  loc_005FB8D4: call [edx+00000010h]
  loc_005FB8D7: test eax, eax
  loc_005FB8D9: fnclex
  loc_005FB8DB: jge 005FB8ECh
  loc_005FB8DD: push 00000010h
  loc_005FB8DF: push 0041E490h
  loc_005FB8E4: push edi
  loc_005FB8E5: push eax
  loc_005FB8E6: call [00401074h] ; __vbaHresultCheckObj
  loc_005FB8EC: lea ecx, var_1C
  loc_005FB8EF: call ebx
  loc_005FB8F1: jmp 005FBAF3h
  loc_005FB8F6: mov eax, [esi]
  loc_005FB8F8: push edi
  loc_005FB8F9: push 00000014h
  loc_005FB8FB: push esi
  loc_005FB8FC: mov var_44, 0041E5D4h
  loc_005FB903: mov var_4C, 00008008h
  loc_005FB90A: call [eax+0000031Ch]
  loc_005FB910: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FB916: lea ecx, var_1C
  loc_005FB919: push eax
  loc_005FB91A: push ecx
  loc_005FB91B: call edi
  loc_005FB91D: lea edx, var_2C
  loc_005FB920: push eax
  loc_005FB921: push edx
  loc_005FB922: call [00401140h] ; __vbaLateIdCallLd
  loc_005FB928: add esp, 00000010h
  loc_005FB92B: push eax
  loc_005FB92C: lea eax, var_4C
  loc_005FB92F: push eax
  loc_005FB930: call [00401218h] ; __vbaVarTstNe
  loc_005FB936: lea ecx, var_1C
  loc_005FB939: mov var_60, ax
  loc_005FB93D: call [004012B0h] ; __vbaFreeObj
  loc_005FB943: lea ecx, var_2C
  loc_005FB946: call [00401020h] ; __vbaFreeVar
  loc_005FB94C: cmp var_60, 0000h
  loc_005FB951: jz 005FBAF3h
  loc_005FB957: mov ecx, [esi]
  loc_005FB959: push 00000000h
  loc_005FB95B: push 00000014h
  loc_005FB95D: push esi
  loc_005FB95E: call [ecx+0000031Ch]
  loc_005FB964: lea edx, var_1C
  loc_005FB967: push eax
  loc_005FB968: push edx
  loc_005FB969: call edi
  loc_005FB96B: push eax
  loc_005FB96C: lea eax, var_2C
  loc_005FB96F: push eax
  loc_005FB970: call [00401140h] ; __vbaLateIdCallLd
  loc_005FB976: add esp, 00000010h
  loc_005FB979: lea ecx, var_3C
  loc_005FB97C: push eax
  loc_005FB97D: push ecx
  loc_005FB97E: call ebx
  loc_005FB980: lea edx, var_3C
  loc_005FB983: push edx
  loc_005FB984: call [00401028h] ; __vbaStrVarMove
  loc_005FB98A: mov edx, eax
  loc_005FB98C: mov ecx, 0061A05Ch
  loc_005FB991: call [00401270h] ; __vbaStrMove
  loc_005FB997: lea ecx, var_1C
  loc_005FB99A: call [004012B0h] ; __vbaFreeObj
  loc_005FB9A0: lea eax, var_3C
  loc_005FB9A3: lea ecx, var_2C
  loc_005FB9A6: push eax
  loc_005FB9A7: push ecx
  loc_005FB9A8: push 00000002h
  loc_005FB9AA: call [00401038h] ; __vbaFreeVarList
  loc_005FB9B0: add esp, 0000000Ch
  loc_005FB9B3: mov edx, 0042BBD4h ; "Thai"
  loc_005FB9B8: mov ecx, 0061A0A0h
  loc_005FB9BD: call [004011ECh] ; __vbaStrCopy
  loc_005FB9C3: mov edx, [esi]
  loc_005FB9C5: push esi
  loc_005FB9C6: call [edx+00000300h]
  loc_005FB9CC: push eax
  loc_005FB9CD: lea eax, var_1C
  loc_005FB9D0: push eax
  loc_005FB9D1: call edi
  loc_005FB9D3: mov edi, eax
  loc_005FB9D5: lea edx, var_18
  loc_005FB9D8: push edx
  loc_005FB9D9: push edi
  loc_005FB9DA: mov ecx, [edi]
  loc_005FB9DC: call [ecx+000000A8h]
  loc_005FB9E2: test eax, eax
  loc_005FB9E4: fnclex
  loc_005FB9E6: jge 005FB9FAh
  loc_005FB9E8: push 000000A8h
  loc_005FB9ED: push 0041F844h
  loc_005FB9F2: push edi
  loc_005FB9F3: push eax
  loc_005FB9F4: call [00401074h] ; __vbaHresultCheckObj
  loc_005FB9FA: mov eax, var_18
  loc_005FB9FD: lea ecx, var_3C
  loc_005FBA00: mov var_24, eax
  loc_005FBA03: lea eax, var_2C
  loc_005FBA06: push eax
  loc_005FBA07: push ecx
  loc_005FBA08: mov var_18, 00000000h
  loc_005FBA0F: mov var_2C, 00000008h
  loc_005FBA16: call ebx
  loc_005FBA18: lea edx, var_3C
  loc_005FBA1B: push edx
  loc_005FBA1C: call [00401028h] ; __vbaStrVarMove
  loc_005FBA22: mov edx, eax
  loc_005FBA24: mov ecx, 0061A060h
  loc_005FBA29: call [00401270h] ; __vbaStrMove
  loc_005FBA2F: lea ecx, var_1C
  loc_005FBA32: call [004012B0h] ; __vbaFreeObj
  loc_005FBA38: lea eax, var_3C
  loc_005FBA3B: lea ecx, var_2C
  loc_005FBA3E: push eax
  loc_005FBA3F: push ecx
  loc_005FBA40: push 00000002h
  loc_005FBA42: call [00401038h] ; __vbaFreeVarList
  loc_005FBA48: mov edx, [esi]
  loc_005FBA4A: add esp, 0000000Ch
  loc_005FBA4D: push esi
  loc_005FBA4E: call [edx+000002B4h]
  loc_005FBA54: test eax, eax
  loc_005FBA56: fnclex
  loc_005FBA58: jge 005FBA6Ch
  loc_005FBA5A: push 000002B4h
  loc_005FBA5F: push 00424B18h
  loc_005FBA64: push esi
  loc_005FBA65: push eax
  loc_005FBA66: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBA6C: mov eax, [0061A1C8h]
  loc_005FBA71: test eax, eax
  loc_005FBA73: jnz 005FBA85h
  loc_005FBA75: push 0061A1C8h
  loc_005FBA7A: push 00419334h
  loc_005FBA7F: call [004011DCh] ; __vbaNew2
  loc_005FBA85: sub esp, 00000010h
  loc_005FBA88: mov ecx, 0000000Ah
  loc_005FBA8D: mov ebx, esp
  loc_005FBA8F: mov var_5C, ecx
  loc_005FBA92: mov var_4C, ecx
  loc_005FBA95: mov eax, 80020004h
  loc_005FBA9A: mov [ebx], ecx
  loc_005FBA9C: mov ecx, var_58
  loc_005FBA9F: mov var_54, eax
  loc_005FBAA2: mov edx, eax
  loc_005FBAA4: mov [ebx+00000004h], ecx
  loc_005FBAA7: sub esp, 00000010h
  loc_005FBAAA: mov esi, [0061A1C8h]
  loc_005FBAB0: mov ecx, esp
  loc_005FBAB2: mov [ebx+00000008h], eax
  loc_005FBAB5: mov eax, var_50
  loc_005FBAB8: mov var_44, edx
  loc_005FBABB: mov edi, [esi]
  loc_005FBABD: mov [ebx+0000000Ch], eax
  loc_005FBAC0: mov eax, var_4C
  loc_005FBAC3: mov [ecx], eax
  loc_005FBAC5: mov eax, var_48
  loc_005FBAC8: push esi
  loc_005FBAC9: mov [ecx+00000004h], eax
  loc_005FBACC: mov [ecx+00000008h], edx
  loc_005FBACF: mov edx, var_40
  loc_005FBAD2: mov [ecx+0000000Ch], edx
  loc_005FBAD5: call [edi+000002B0h]
  loc_005FBADB: test eax, eax
  loc_005FBADD: fnclex
  loc_005FBADF: jge 005FBAF3h
  loc_005FBAE1: push 000002B0h
  loc_005FBAE6: push 00423E5Ch
  loc_005FBAEB: push esi
  loc_005FBAEC: push eax
  loc_005FBAED: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBAF3: mov var_4, 00000000h
  loc_005FBAFA: push 005FBB28h
  loc_005FBAFF: jmp 005FBB27h
  loc_005FBB01: lea ecx, var_18
  loc_005FBB04: call [004012ACh] ; __vbaFreeStr
  loc_005FBB0A: lea ecx, var_1C
  loc_005FBB0D: call [004012B0h] ; __vbaFreeObj
  loc_005FBB13: lea eax, var_3C
  loc_005FBB16: lea ecx, var_2C
  loc_005FBB19: push eax
  loc_005FBB1A: push ecx
  loc_005FBB1B: push 00000002h
  loc_005FBB1D: call [00401038h] ; __vbaFreeVarList
  loc_005FBB23: add esp, 0000000Ch
  loc_005FBB26: ret
  loc_005FBB27: ret
  loc_005FBB28: mov eax, Me
  loc_005FBB2B: push eax
  loc_005FBB2C: mov edx, [eax]
  loc_005FBB2E: call [edx+00000008h]
  loc_005FBB31: mov eax, var_4
  loc_005FBB34: mov ecx, var_14
  loc_005FBB37: pop edi
  loc_005FBB38: pop esi
  loc_005FBB39: mov fs:[00000000h], ecx
  loc_005FBB40: pop ebx
  loc_005FBB41: mov esp, ebp
  loc_005FBB43: pop ebp
  loc_005FBB44: retn 0004h
End Sub

Private Sub cmdCancel_Click() '5FB6A0
  loc_005FB6A0: push ebp
  loc_005FB6A1: mov ebp, esp
  loc_005FB6A3: sub esp, 0000000Ch
  loc_005FB6A6: push 00403B36h ; __vbaExceptHandler
  loc_005FB6AB: mov eax, fs:[00000000h]
  loc_005FB6B1: push eax
  loc_005FB6B2: mov fs:[00000000h], esp
  loc_005FB6B9: sub esp, 00000008h
  loc_005FB6BC: push ebx
  loc_005FB6BD: push esi
  loc_005FB6BE: push edi
  loc_005FB6BF: mov var_C, esp
  loc_005FB6C2: mov var_8, 004033D0h
  loc_005FB6C9: mov eax, Me
  loc_005FB6CC: mov ecx, eax
  loc_005FB6CE: and ecx, 00000001h
  loc_005FB6D1: mov var_4, ecx
  loc_005FB6D4: and al, FEh
  loc_005FB6D6: push eax
  loc_005FB6D7: mov Me, eax
  loc_005FB6DA: mov edx, [eax]
  loc_005FB6DC: call [edx+00000004h]
  loc_005FB6DF: call [00401034h] ; __vbaEnd
  loc_005FB6E5: mov var_4, 00000000h
  loc_005FB6EC: mov eax, Me
  loc_005FB6EF: push eax
  loc_005FB6F0: mov ecx, [eax]
  loc_005FB6F2: call [ecx+00000008h]
  loc_005FB6F5: mov eax, var_4
  loc_005FB6F8: mov ecx, var_14
  loc_005FB6FB: pop edi
  loc_005FB6FC: pop esi
  loc_005FB6FD: mov fs:[00000000h], ecx
  loc_005FB704: pop ebx
  loc_005FB705: mov esp, ebp
  loc_005FB707: pop ebp
  loc_005FB708: retn 0004h
End Sub

Private Sub cboTime_KeyPress(KeyAscii As Integer) '5FB5D0
  loc_005FB5D0: push ebp
  loc_005FB5D1: mov ebp, esp
  loc_005FB5D3: sub esp, 0000000Ch
  loc_005FB5D6: push 00403B36h ; __vbaExceptHandler
  loc_005FB5DB: mov eax, fs:[00000000h]
  loc_005FB5E1: push eax
  loc_005FB5E2: mov fs:[00000000h], esp
  loc_005FB5E9: sub esp, 00000014h
  loc_005FB5EC: push ebx
  loc_005FB5ED: push esi
  loc_005FB5EE: push edi
  loc_005FB5EF: mov var_C, esp
  loc_005FB5F2: mov var_8, 004033C0h
  loc_005FB5F9: mov esi, Me
  loc_005FB5FC: mov eax, esi
  loc_005FB5FE: and eax, 00000001h
  loc_005FB601: mov var_4, eax
  loc_005FB604: and esi, FFFFFFFEh
  loc_005FB607: push esi
  loc_005FB608: mov Me, esi
  loc_005FB60B: mov ecx, [esi]
  loc_005FB60D: call [ecx+00000004h]
  loc_005FB610: mov edx, KeyAscii
  loc_005FB613: xor edi, edi
  loc_005FB615: mov var_18, edi
  loc_005FB618: cmp [edx], 000Dh
  loc_005FB61C: jnz 005FB65Eh
  loc_005FB61E: mov eax, [esi]
  loc_005FB620: push esi
  loc_005FB621: call [eax+00000308h]
  loc_005FB627: lea ecx, var_18
  loc_005FB62A: push eax
  loc_005FB62B: push ecx
  loc_005FB62C: call [004010A0h] ; __vbaObjSet
  loc_005FB632: mov esi, eax
  loc_005FB634: push esi
  loc_005FB635: mov edx, [esi]
  loc_005FB637: call [edx+000001A4h]
  loc_005FB63D: cmp eax, edi
  loc_005FB63F: fnclex
  loc_005FB641: jge 005FB655h
  loc_005FB643: push 000001A4h
  loc_005FB648: push 0041EAACh
  loc_005FB64D: push esi
  loc_005FB64E: push eax
  loc_005FB64F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FB655: lea ecx, var_18
  loc_005FB658: call [004012B0h] ; __vbaFreeObj
  loc_005FB65E: mov var_4, edi
  loc_005FB661: push 005FB673h
  loc_005FB666: jmp 005FB672h
  loc_005FB668: lea ecx, var_18
  loc_005FB66B: call [004012B0h] ; __vbaFreeObj
  loc_005FB671: ret
  loc_005FB672: ret
  loc_005FB673: mov eax, Me
  loc_005FB676: push eax
  loc_005FB677: mov ecx, [eax]
  loc_005FB679: call [ecx+00000008h]
  loc_005FB67C: mov eax, var_4
  loc_005FB67F: mov ecx, var_14
  loc_005FB682: pop edi
  loc_005FB683: pop esi
  loc_005FB684: mov fs:[00000000h], ecx
  loc_005FB68B: pop ebx
  loc_005FB68C: mov esp, ebp
  loc_005FB68E: pop ebp
  loc_005FB68F: retn 0008h
End Sub

Private Sub cboOnCount_KeyDown(KeyCode As Integer, Shift As Integer) '5FB500
  loc_005FB500: push ebp
  loc_005FB501: mov ebp, esp
  loc_005FB503: sub esp, 0000000Ch
  loc_005FB506: push 00403B36h ; __vbaExceptHandler
  loc_005FB50B: mov eax, fs:[00000000h]
  loc_005FB511: push eax
  loc_005FB512: mov fs:[00000000h], esp
  loc_005FB519: sub esp, 00000014h
  loc_005FB51C: push ebx
  loc_005FB51D: push esi
  loc_005FB51E: push edi
  loc_005FB51F: mov var_C, esp
  loc_005FB522: mov var_8, 004033B0h
  loc_005FB529: mov esi, Me
  loc_005FB52C: mov eax, esi
  loc_005FB52E: and eax, 00000001h
  loc_005FB531: mov var_4, eax
  loc_005FB534: and esi, FFFFFFFEh
  loc_005FB537: push esi
  loc_005FB538: mov Me, esi
  loc_005FB53B: mov ecx, [esi]
  loc_005FB53D: call [ecx+00000004h]
  loc_005FB540: mov edx, KeyCode
  loc_005FB543: xor edi, edi
  loc_005FB545: mov var_18, edi
  loc_005FB548: cmp [edx], 000Dh
  loc_005FB54C: jnz 005FB58Eh
  loc_005FB54E: mov eax, [esi]
  loc_005FB550: push esi
  loc_005FB551: call [eax+00000300h]
  loc_005FB557: lea ecx, var_18
  loc_005FB55A: push eax
  loc_005FB55B: push ecx
  loc_005FB55C: call [004010A0h] ; __vbaObjSet
  loc_005FB562: mov esi, eax
  loc_005FB564: push esi
  loc_005FB565: mov edx, [esi]
  loc_005FB567: call [edx+000001F4h]
  loc_005FB56D: cmp eax, edi
  loc_005FB56F: fnclex
  loc_005FB571: jge 005FB585h
  loc_005FB573: push 000001F4h
  loc_005FB578: push 0041F844h
  loc_005FB57D: push esi
  loc_005FB57E: push eax
  loc_005FB57F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FB585: lea ecx, var_18
  loc_005FB588: call [004012B0h] ; __vbaFreeObj
  loc_005FB58E: mov var_4, edi
  loc_005FB591: push 005FB5A3h
  loc_005FB596: jmp 005FB5A2h
  loc_005FB598: lea ecx, var_18
  loc_005FB59B: call [004012B0h] ; __vbaFreeObj
  loc_005FB5A1: ret
  loc_005FB5A2: ret
  loc_005FB5A3: mov eax, Me
  loc_005FB5A6: push eax
  loc_005FB5A7: mov ecx, [eax]
  loc_005FB5A9: call [ecx+00000008h]
  loc_005FB5AC: mov eax, var_4
  loc_005FB5AF: mov ecx, var_14
  loc_005FB5B2: pop edi
  loc_005FB5B3: pop esi
  loc_005FB5B4: mov fs:[00000000h], ecx
  loc_005FB5BB: pop ebx
  loc_005FB5BC: mov esp, ebp
  loc_005FB5BE: pop ebp
  loc_005FB5BF: retn 000Ch
End Sub

Private Sub Form_Load() '5FBB50
  loc_005FBB50: push ebp
  loc_005FBB51: mov ebp, esp
  loc_005FBB53: sub esp, 0000000Ch
  loc_005FBB56: push 00403B36h ; __vbaExceptHandler
  loc_005FBB5B: mov eax, fs:[00000000h]
  loc_005FBB61: push eax
  loc_005FBB62: mov fs:[00000000h], esp
  loc_005FBB69: sub esp, 00000064h
  loc_005FBB6C: push ebx
  loc_005FBB6D: push esi
  loc_005FBB6E: push edi
  loc_005FBB6F: mov var_C, esp
  loc_005FBB72: mov var_8, 004033E8h
  loc_005FBB79: mov esi, Me
  loc_005FBB7C: mov eax, esi
  loc_005FBB7E: and eax, 00000001h
  loc_005FBB81: mov var_4, eax
  loc_005FBB84: and esi, FFFFFFFEh
  loc_005FBB87: push esi
  loc_005FBB88: mov Me, esi
  loc_005FBB8B: mov ecx, [esi]
  loc_005FBB8D: call [ecx+00000004h]
  loc_005FBB90: lea edx, var_28
  loc_005FBB93: xor eax, eax
  loc_005FBB95: push edx
  loc_005FBB96: mov var_18, eax
  loc_005FBB99: mov var_28, eax
  loc_005FBB9C: mov var_38, eax
  loc_005FBB9F: mov var_48, eax
  loc_005FBBA2: mov var_58, eax
  loc_005FBBA5: call [00401224h] ; rtcGetDateVar
  loc_005FBBAB: lea edx, var_58
  loc_005FBBAE: lea ecx, var_38
  loc_005FBBB1: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_005FBBB8: mov var_58, 00000008h
  loc_005FBBBF: call [00401240h] ; __vbaVarDup
  loc_005FBBC5: push 00000001h
  loc_005FBBC7: lea eax, var_38
  loc_005FBBCA: push 00000001h
  loc_005FBBCC: lea ecx, var_28
  loc_005FBBCF: push eax
  loc_005FBBD0: lea edx, var_48
  loc_005FBBD3: push ecx
  loc_005FBBD4: push edx
  loc_005FBBD5: call [00401060h] ; rtcVarFromFormatVar
  loc_005FBBDB: mov ecx, var_48
  loc_005FBBDE: mov edx, var_44
  loc_005FBBE1: sub esp, 00000010h
  loc_005FBBE4: mov eax, esp
  loc_005FBBE6: push 00000014h
  loc_005FBBE8: push esi
  loc_005FBBE9: mov [eax], ecx
  loc_005FBBEB: mov ecx, var_40
  loc_005FBBEE: mov [eax+00000004h], edx
  loc_005FBBF1: mov edx, var_3C
  loc_005FBBF4: mov [eax+00000008h], ecx
  loc_005FBBF7: mov [eax+0000000Ch], edx
  loc_005FBBFA: mov eax, [esi]
  loc_005FBBFC: call [eax+0000031Ch]
  loc_005FBC02: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FBC08: lea ecx, var_18
  loc_005FBC0B: push eax
  loc_005FBC0C: push ecx
  loc_005FBC0D: call edi
  loc_005FBC0F: push eax
  loc_005FBC10: call [00401288h] ; __vbaLateIdSt
  loc_005FBC16: lea ecx, var_18
  loc_005FBC19: call [004012B0h] ; __vbaFreeObj
  loc_005FBC1F: lea edx, var_48
  loc_005FBC22: lea eax, var_38
  loc_005FBC25: push edx
  loc_005FBC26: lea ecx, var_28
  loc_005FBC29: push eax
  loc_005FBC2A: push ecx
  loc_005FBC2B: push 00000003h
  loc_005FBC2D: call [00401038h] ; __vbaFreeVarList
  loc_005FBC33: mov edx, [esi]
  loc_005FBC35: add esp, 00000010h
  loc_005FBC38: push esi
  loc_005FBC39: call [edx+00000300h]
  loc_005FBC3F: push eax
  loc_005FBC40: lea eax, var_18
  loc_005FBC43: push eax
  loc_005FBC44: call edi
  loc_005FBC46: mov ebx, eax
  loc_005FBC48: mov eax, 0000000Ah
  loc_005FBC4D: mov var_50, 80020004h
  loc_005FBC54: mov var_58, eax
  loc_005FBC57: mov ecx, [ebx]
  loc_005FBC59: sub esp, 00000010h
  loc_005FBC5C: mov edx, esp
  loc_005FBC5E: push 0042FED4h ; "09:00"
  loc_005FBC63: push ebx
  loc_005FBC64: mov [edx], eax
  loc_005FBC66: mov eax, var_54
  loc_005FBC69: mov [edx+00000004h], eax
  loc_005FBC6C: mov eax, var_50
  loc_005FBC6F: mov [edx+00000008h], eax
  loc_005FBC72: mov eax, var_4C
  loc_005FBC75: mov [edx+0000000Ch], eax
  loc_005FBC78: call [ecx+000001ECh]
  loc_005FBC7E: test eax, eax
  loc_005FBC80: fnclex
  loc_005FBC82: jge 005FBC96h
  loc_005FBC84: push 000001ECh
  loc_005FBC89: push 0041F844h
  loc_005FBC8E: push ebx
  loc_005FBC8F: push eax
  loc_005FBC90: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBC96: lea ecx, var_18
  loc_005FBC99: call [004012B0h] ; __vbaFreeObj
  loc_005FBC9F: mov ecx, [esi]
  loc_005FBCA1: push esi
  loc_005FBCA2: call [ecx+00000300h]
  loc_005FBCA8: lea edx, var_18
  loc_005FBCAB: push eax
  loc_005FBCAC: push edx
  loc_005FBCAD: call edi
  loc_005FBCAF: sub esp, 00000010h
  loc_005FBCB2: mov ebx, eax
  loc_005FBCB4: mov edx, esp
  loc_005FBCB6: mov eax, 0000000Ah
  loc_005FBCBB: mov var_58, eax
  loc_005FBCBE: mov var_50, 80020004h
  loc_005FBCC5: mov ecx, [ebx]
  loc_005FBCC7: mov [edx], eax
  loc_005FBCC9: mov eax, var_54
  loc_005FBCCC: push 0042FA2Ch ; "12:00"
  loc_005FBCD1: mov [edx+00000004h], eax
  loc_005FBCD4: mov eax, var_50
  loc_005FBCD7: push ebx
  loc_005FBCD8: mov [edx+00000008h], eax
  loc_005FBCDB: mov eax, var_4C
  loc_005FBCDE: mov [edx+0000000Ch], eax
  loc_005FBCE1: call [ecx+000001ECh]
  loc_005FBCE7: test eax, eax
  loc_005FBCE9: fnclex
  loc_005FBCEB: jge 005FBCFFh
  loc_005FBCED: push 000001ECh
  loc_005FBCF2: push 0041F844h
  loc_005FBCF7: push ebx
  loc_005FBCF8: push eax
  loc_005FBCF9: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBCFF: lea ecx, var_18
  loc_005FBD02: call [004012B0h] ; __vbaFreeObj
  loc_005FBD08: mov ecx, [esi]
  loc_005FBD0A: push esi
  loc_005FBD0B: call [ecx+00000300h]
  loc_005FBD11: lea edx, var_18
  loc_005FBD14: push eax
  loc_005FBD15: push edx
  loc_005FBD16: call edi
  loc_005FBD18: sub esp, 00000010h
  loc_005FBD1B: mov ebx, eax
  loc_005FBD1D: mov edx, esp
  loc_005FBD1F: mov eax, 0000000Ah
  loc_005FBD24: mov var_58, eax
  loc_005FBD27: mov var_50, 80020004h
  loc_005FBD2E: mov ecx, [ebx]
  loc_005FBD30: mov [edx], eax
  loc_005FBD32: mov eax, var_54
  loc_005FBD35: push 0042FA3Ch ; "04:00"
  loc_005FBD3A: mov [edx+00000004h], eax
  loc_005FBD3D: mov eax, var_50
  loc_005FBD40: push ebx
  loc_005FBD41: mov [edx+00000008h], eax
  loc_005FBD44: mov eax, var_4C
  loc_005FBD47: mov [edx+0000000Ch], eax
  loc_005FBD4A: call [ecx+000001ECh]
  loc_005FBD50: test eax, eax
  loc_005FBD52: fnclex
  loc_005FBD54: jge 005FBD68h
  loc_005FBD56: push 000001ECh
  loc_005FBD5B: push 0041F844h
  loc_005FBD60: push ebx
  loc_005FBD61: push eax
  loc_005FBD62: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBD68: lea ecx, var_18
  loc_005FBD6B: call [004012B0h] ; __vbaFreeObj
  loc_005FBD71: lea ecx, var_28
  loc_005FBD74: push ecx
  loc_005FBD75: call [0040123Ch] ; rtcGetTimeVar
  loc_005FBD7B: lea edx, var_28
  loc_005FBD7E: push 00000002h
  loc_005FBD80: lea eax, var_38
  loc_005FBD83: push edx
  loc_005FBD84: push eax
  loc_005FBD85: call [00401278h] ; rtcRightCharVar
  loc_005FBD8B: lea ecx, var_38
  loc_005FBD8E: lea edx, var_58
  loc_005FBD91: push ecx
  loc_005FBD92: push edx
  loc_005FBD93: mov var_50, 0042BBE4h ; "AM"
  loc_005FBD9A: mov var_58, 00008008h
  loc_005FBDA1: call [00401110h] ; __vbaVarTstEq
  loc_005FBDA7: mov bx, ax
  loc_005FBDAA: lea eax, var_38
  loc_005FBDAD: lea ecx, var_28
  loc_005FBDB0: push eax
  loc_005FBDB1: push ecx
  loc_005FBDB2: push 00000002h
  loc_005FBDB4: call [00401038h] ; __vbaFreeVarList
  loc_005FBDBA: mov edx, [esi]
  loc_005FBDBC: add esp, 0000000Ch
  loc_005FBDBF: test bx, bx
  loc_005FBDC2: push esi
  loc_005FBDC3: jz 005FBDE7h
  loc_005FBDC5: call [edx+00000300h]
  loc_005FBDCB: push eax
  loc_005FBDCC: lea eax, var_18
  loc_005FBDCF: push eax
  loc_005FBDD0: call edi
  loc_005FBDD2: mov esi, eax
  loc_005FBDD4: push 00000000h
  loc_005FBDD6: push esi
  loc_005FBDD7: mov ecx, [esi]
  loc_005FBDD9: call [ecx+000000F4h]
  loc_005FBDDF: test eax, eax
  loc_005FBDE1: fnclex
  loc_005FBDE3: jge 005FBE19h
  loc_005FBDE5: jmp 005FBE07h
  loc_005FBDE7: call [edx+00000300h]
  loc_005FBDED: push eax
  loc_005FBDEE: lea eax, var_18
  loc_005FBDF1: push eax
  loc_005FBDF2: call edi
  loc_005FBDF4: mov esi, eax
  loc_005FBDF6: push 00000001h
  loc_005FBDF8: push esi
  loc_005FBDF9: mov ecx, [esi]
  loc_005FBDFB: call [ecx+000000F4h]
  loc_005FBE01: test eax, eax
  loc_005FBE03: fnclex
  loc_005FBE05: jge 005FBE19h
  loc_005FBE07: push 000000F4h
  loc_005FBE0C: push 0041F844h
  loc_005FBE11: push esi
  loc_005FBE12: push eax
  loc_005FBE13: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBE19: lea ecx, var_18
  loc_005FBE1C: call [004012B0h] ; __vbaFreeObj
  loc_005FBE22: mov var_4, 00000000h
  loc_005FBE29: push 005FBE52h
  loc_005FBE2E: jmp 005FBE51h
  loc_005FBE30: lea ecx, var_18
  loc_005FBE33: call [004012B0h] ; __vbaFreeObj
  loc_005FBE39: lea edx, var_48
  loc_005FBE3C: lea eax, var_38
  loc_005FBE3F: push edx
  loc_005FBE40: lea ecx, var_28
  loc_005FBE43: push eax
  loc_005FBE44: push ecx
  loc_005FBE45: push 00000003h
  loc_005FBE47: call [00401038h] ; __vbaFreeVarList
  loc_005FBE4D: add esp, 00000010h
  loc_005FBE50: ret
  loc_005FBE51: ret
  loc_005FBE52: mov eax, Me
  loc_005FBE55: push eax
  loc_005FBE56: mov edx, [eax]
  loc_005FBE58: call [edx+00000008h]
  loc_005FBE5B: mov eax, var_4
  loc_005FBE5E: mov ecx, var_14
  loc_005FBE61: pop edi
  loc_005FBE62: pop esi
  loc_005FBE63: mov fs:[00000000h], ecx
  loc_005FBE6A: pop ebx
  loc_005FBE6B: mov esp, ebp
  loc_005FBE6D: pop ebp
  loc_005FBE6E: retn 0004h
End Sub
