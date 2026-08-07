VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC0000F8754DA1}#2.0#0"; "C:\WINDOWS\SysWow64\MSCOMCT2.OCX"
Begin VB.Form frmTwoDate
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ControlBox = 0   'False
  ClientLeft = 60
  ClientTop = 60
  ClientWidth = 3825
  ClientHeight = 1995
  StartUpPosition = 1 'CenterOwner
  Begin VB.Frame Frame2
    Left = 0
    Top = -90
    Width = 3825
    Height = 2100
    TabIndex = 3
    Begin MSComCtl2.DTPicker cboDate1
      Left = 1575
      Top = 675
      Width = 1965
      Height = 345
      TabIndex = 0
      OleObjectBlob = "frmTwoDate.frx":0000
    End
    Begin VB.CommandButton cmdCancel
      Caption = "&Cancel"
      Left = 2250
      Top = 1620
      Width = 825
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
    Begin VB.CommandButton cmdOk
      Caption = "&Ok"
      Left = 1410
      Top = 1620
      Width = 825
      Height = 345
      TabIndex = 1
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
    Begin MSComCtl2.DTPicker cboDate2
      Left = 1575
      Top = 1080
      Width = 1965
      Height = 345
      TabIndex = 8
      OleObjectBlob = "frmTwoDate.frx":00B8
    End
    Begin VB.Line Line1
      X1 = 225
      Y1 = 405
      X2 = 3375
      Y2 = 405
    End
    Begin VB.Label Label2
      Caption = "&&ufESpf&&uftMum;&&Sd pm&&if;rsm; zsufypfNcif;"
      ForeColor = &H800000&
      Left = 225
      Top = 180
      Width = 3570
      Height = 375
      TabIndex = 10
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
    Begin VB.Label Label1
      Caption = "End Date"
      Left = 405
      Top = 1080
      Width = 855
      Height = 240
      TabIndex = 9
      AutoSize = -1  'True
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
    Begin VB.Label Label26
      Caption = "Start Date"
      Left = 405
      Top = 675
      Width = 945
      Height = 240
      TabIndex = 4
      AutoSize = -1  'True
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
  Begin VB.ComboBox cboOnCountM
    Style = 2
    Left = 1140
    Top = 690
    Width = 2235
    Height = 330
    TabIndex = 5
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
  Begin VB.Label Label25
    Caption = "OnCount"
    Left = 0
    Top = 720
    Width = 1080
    Height = 285
    TabIndex = 7
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

Attribute VB_Name = "frmTwoDate"


Private Sub cboDate1_KeyUp(KeyCode As Integer, Shift As Integer) '4B0EE0
  loc_004B0EE0: push ebp
  loc_004B0EE1: mov ebp, esp
  loc_004B0EE3: sub esp, 0000000Ch
  loc_004B0EE6: push 00403B36h ; __vbaExceptHandler
  loc_004B0EEB: mov eax, fs:[00000000h]
  loc_004B0EF1: push eax
  loc_004B0EF2: mov fs:[00000000h], esp
  loc_004B0EF9: sub esp, 00000014h
  loc_004B0EFC: push ebx
  loc_004B0EFD: push esi
  loc_004B0EFE: push edi
  loc_004B0EFF: mov var_C, esp
  loc_004B0F02: mov var_8, 00401B58h
  loc_004B0F09: mov esi, Me
  loc_004B0F0C: mov eax, esi
  loc_004B0F0E: and eax, 00000001h
  loc_004B0F11: mov var_4, eax
  loc_004B0F14: and esi, FFFFFFFEh
  loc_004B0F17: push esi
  loc_004B0F18: mov Me, esi
  loc_004B0F1B: mov ecx, [esi]
  loc_004B0F1D: call [ecx+00000004h]
  loc_004B0F20: mov edx, KeyCode
  loc_004B0F23: xor edi, edi
  loc_004B0F25: mov var_18, edi
  loc_004B0F28: cmp [edx], 000Dh
  loc_004B0F2C: jnz 004B0F6Eh
  loc_004B0F2E: mov eax, [esi]
  loc_004B0F30: push esi
  loc_004B0F31: call [eax+00000304h]
  loc_004B0F37: lea ecx, var_18
  loc_004B0F3A: push eax
  loc_004B0F3B: push ecx
  loc_004B0F3C: call [004010A0h] ; __vbaObjSet
  loc_004B0F42: mov esi, eax
  loc_004B0F44: push esi
  loc_004B0F45: mov edx, [esi]
  loc_004B0F47: call [edx+000001A4h]
  loc_004B0F4D: cmp eax, edi
  loc_004B0F4F: fnclex
  loc_004B0F51: jge 004B0F65h
  loc_004B0F53: push 000001A4h
  loc_004B0F58: push 0041EAACh
  loc_004B0F5D: push esi
  loc_004B0F5E: push eax
  loc_004B0F5F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0F65: lea ecx, var_18
  loc_004B0F68: call [004012B0h] ; __vbaFreeObj
  loc_004B0F6E: mov var_4, edi
  loc_004B0F71: push 004B0F83h
  loc_004B0F76: jmp 004B0F82h
  loc_004B0F78: lea ecx, var_18
  loc_004B0F7B: call [004012B0h] ; __vbaFreeObj
  loc_004B0F81: ret
  loc_004B0F82: ret
  loc_004B0F83: mov eax, Me
  loc_004B0F86: push eax
  loc_004B0F87: mov ecx, [eax]
  loc_004B0F89: call [ecx+00000008h]
  loc_004B0F8C: mov eax, var_4
  loc_004B0F8F: mov ecx, var_14
  loc_004B0F92: pop edi
  loc_004B0F93: pop esi
  loc_004B0F94: mov fs:[00000000h], ecx
  loc_004B0F9B: pop ebx
  loc_004B0F9C: mov esp, ebp
  loc_004B0F9E: pop ebp
  loc_004B0F9F: retn 000Ch
End Sub

Private Sub Form_Load() '4B18E0
  loc_004B18E0: push ebp
  loc_004B18E1: mov ebp, esp
  loc_004B18E3: sub esp, 0000000Ch
  loc_004B18E6: push 00403B36h ; __vbaExceptHandler
  loc_004B18EB: mov eax, fs:[00000000h]
  loc_004B18F1: push eax
  loc_004B18F2: mov fs:[00000000h], esp
  loc_004B18F9: sub esp, 0000005Ch
  loc_004B18FC: push ebx
  loc_004B18FD: push esi
  loc_004B18FE: push edi
  loc_004B18FF: mov var_C, esp
  loc_004B1902: mov var_8, 00401B88h
  loc_004B1909: mov esi, Me
  loc_004B190C: mov eax, esi
  loc_004B190E: and eax, 00000001h
  loc_004B1911: mov var_4, eax
  loc_004B1914: and esi, FFFFFFFEh
  loc_004B1917: push esi
  loc_004B1918: mov Me, esi
  loc_004B191B: mov ecx, [esi]
  loc_004B191D: call [ecx+00000004h]
  loc_004B1920: mov ebx, [00401224h] ; rtcGetDateVar
  loc_004B1926: lea edx, var_28
  loc_004B1929: xor edi, edi
  loc_004B192B: push edx
  loc_004B192C: mov var_18, edi
  loc_004B192F: mov var_28, edi
  loc_004B1932: mov var_38, edi
  loc_004B1935: mov var_48, edi
  loc_004B1938: mov var_58, edi
  loc_004B193B: call ebx
  loc_004B193D: lea edx, var_58
  loc_004B1940: lea ecx, var_38
  loc_004B1943: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_004B194A: mov var_58, 00000008h
  loc_004B1951: call [00401240h] ; __vbaVarDup
  loc_004B1957: push 00000001h
  loc_004B1959: lea eax, var_38
  loc_004B195C: push 00000001h
  loc_004B195E: lea ecx, var_28
  loc_004B1961: push eax
  loc_004B1962: lea edx, var_48
  loc_004B1965: push ecx
  loc_004B1966: push edx
  loc_004B1967: call [00401060h] ; rtcVarFromFormatVar
  loc_004B196D: mov ecx, var_48
  loc_004B1970: mov edx, var_44
  loc_004B1973: sub esp, 00000010h
  loc_004B1976: mov eax, esp
  loc_004B1978: push 00000014h
  loc_004B197A: push esi
  loc_004B197B: mov [eax], ecx
  loc_004B197D: mov ecx, var_40
  loc_004B1980: mov [eax+00000004h], edx
  loc_004B1983: mov edx, var_3C
  loc_004B1986: mov [eax+00000008h], ecx
  loc_004B1989: mov [eax+0000000Ch], edx
  loc_004B198C: mov eax, [esi]
  loc_004B198E: call [eax+00000324h]
  loc_004B1994: lea ecx, var_18
  loc_004B1997: push eax
  loc_004B1998: push ecx
  loc_004B1999: call [004010A0h] ; __vbaObjSet
  loc_004B199F: push eax
  loc_004B19A0: call [00401288h] ; __vbaLateIdSt
  loc_004B19A6: lea ecx, var_18
  loc_004B19A9: call [004012B0h] ; __vbaFreeObj
  loc_004B19AF: lea edx, var_48
  loc_004B19B2: lea eax, var_38
  loc_004B19B5: push edx
  loc_004B19B6: lea ecx, var_28
  loc_004B19B9: push eax
  loc_004B19BA: push ecx
  loc_004B19BB: push 00000003h
  loc_004B19BD: call [00401038h] ; __vbaFreeVarList
  loc_004B19C3: add esp, 00000010h
  loc_004B19C6: lea edx, var_28
  loc_004B19C9: push edx
  loc_004B19CA: call ebx
  loc_004B19CC: lea edx, var_58
  loc_004B19CF: lea ecx, var_38
  loc_004B19D2: mov var_50, 0041FB8Ch ; "dd-MMM-yyyy"
  loc_004B19D9: mov var_58, 00000008h
  loc_004B19E0: call [00401240h] ; __vbaVarDup
  loc_004B19E6: push 00000001h
  loc_004B19E8: lea eax, var_38
  loc_004B19EB: push 00000001h
  loc_004B19ED: push eax
  loc_004B19EE: lea ecx, var_28
  loc_004B19F1: lea edx, var_48
  loc_004B19F4: push ecx
  loc_004B19F5: push edx
  loc_004B19F6: call [00401060h] ; rtcVarFromFormatVar
  loc_004B19FC: mov ecx, var_48
  loc_004B19FF: mov edx, var_44
  loc_004B1A02: sub esp, 00000010h
  loc_004B1A05: mov eax, esp
  loc_004B1A07: push 00000014h
  loc_004B1A09: push esi
  loc_004B1A0A: mov [eax], ecx
  loc_004B1A0C: mov ecx, var_40
  loc_004B1A0F: mov [eax+00000004h], edx
  loc_004B1A12: mov edx, var_3C
  loc_004B1A15: mov [eax+00000008h], ecx
  loc_004B1A18: mov [eax+0000000Ch], edx
  loc_004B1A1B: mov eax, [esi]
  loc_004B1A1D: call [eax+00000328h]
  loc_004B1A23: lea ecx, var_18
  loc_004B1A26: push eax
  loc_004B1A27: push ecx
  loc_004B1A28: call [004010A0h] ; __vbaObjSet
  loc_004B1A2E: push eax
  loc_004B1A2F: call [00401288h] ; __vbaLateIdSt
  loc_004B1A35: lea ecx, var_18
  loc_004B1A38: call [004012B0h] ; __vbaFreeObj
  loc_004B1A3E: lea edx, var_48
  loc_004B1A41: lea eax, var_38
  loc_004B1A44: push edx
  loc_004B1A45: lea ecx, var_28
  loc_004B1A48: push eax
  loc_004B1A49: push ecx
  loc_004B1A4A: push 00000003h
  loc_004B1A4C: call [00401038h] ; __vbaFreeVarList
  loc_004B1A52: add esp, 00000010h
  loc_004B1A55: mov var_4, edi
  loc_004B1A58: push 004B1A81h
  loc_004B1A5D: jmp 004B1A80h
  loc_004B1A5F: lea ecx, var_18
  loc_004B1A62: call [004012B0h] ; __vbaFreeObj
  loc_004B1A68: lea edx, var_48
  loc_004B1A6B: lea eax, var_38
  loc_004B1A6E: push edx
  loc_004B1A6F: lea ecx, var_28
  loc_004B1A72: push eax
  loc_004B1A73: push ecx
  loc_004B1A74: push 00000003h
  loc_004B1A76: call [00401038h] ; __vbaFreeVarList
  loc_004B1A7C: add esp, 00000010h
  loc_004B1A7F: ret
  loc_004B1A80: ret
  loc_004B1A81: mov eax, Me
  loc_004B1A84: push eax
  loc_004B1A85: mov edx, [eax]
  loc_004B1A87: call [edx+00000008h]
  loc_004B1A8A: mov eax, var_4
  loc_004B1A8D: mov ecx, var_14
  loc_004B1A90: pop edi
  loc_004B1A91: pop esi
  loc_004B1A92: mov fs:[00000000h], ecx
  loc_004B1A99: pop ebx
  loc_004B1A9A: mov esp, ebp
  loc_004B1A9C: pop ebp
  loc_004B1A9D: retn 0004h
End Sub

Private Sub cmdCancel_Click() '4B0FB0
  loc_004B0FB0: push ebp
  loc_004B0FB1: mov ebp, esp
  loc_004B0FB3: sub esp, 0000000Ch
  loc_004B0FB6: push 00403B36h ; __vbaExceptHandler
  loc_004B0FBB: mov eax, fs:[00000000h]
  loc_004B0FC1: push eax
  loc_004B0FC2: mov fs:[00000000h], esp
  loc_004B0FC9: sub esp, 00000018h
  loc_004B0FCC: push ebx
  loc_004B0FCD: push esi
  loc_004B0FCE: push edi
  loc_004B0FCF: mov var_C, esp
  loc_004B0FD2: mov var_8, 00401B68h
  loc_004B0FD9: mov edi, Me
  loc_004B0FDC: mov eax, edi
  loc_004B0FDE: and eax, 00000001h
  loc_004B0FE1: mov var_4, eax
  loc_004B0FE4: and edi, FFFFFFFEh
  loc_004B0FE7: push edi
  loc_004B0FE8: mov Me, edi
  loc_004B0FEB: mov ecx, [edi]
  loc_004B0FED: call [ecx+00000004h]
  loc_004B0FF0: mov eax, [0061B394h]
  loc_004B0FF5: xor ebx, ebx
  loc_004B0FF7: cmp eax, ebx
  loc_004B0FF9: mov var_18, ebx
  loc_004B0FFC: jnz 004B100Eh
  loc_004B0FFE: push 0061B394h
  loc_004B1003: push 0041E4A0h
  loc_004B1008: call [004011DCh] ; __vbaNew2
  loc_004B100E: mov esi, [0061B394h]
  loc_004B1014: lea eax, var_18
  loc_004B1017: push edi
  loc_004B1018: push eax
  loc_004B1019: mov edx, [esi]
  loc_004B101B: mov var_2C, edx
  loc_004B101E: call [004010B8h] ; __vbaObjSetAddref
  loc_004B1024: mov ecx, var_2C
  loc_004B1027: push eax
  loc_004B1028: push esi
  loc_004B1029: call [ecx+00000010h]
  loc_004B102C: cmp eax, ebx
  loc_004B102E: fnclex
  loc_004B1030: jge 004B1041h
  loc_004B1032: push 00000010h
  loc_004B1034: push 0041E490h
  loc_004B1039: push esi
  loc_004B103A: push eax
  loc_004B103B: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1041: lea ecx, var_18
  loc_004B1044: call [004012B0h] ; __vbaFreeObj
  loc_004B104A: mov var_4, ebx
  loc_004B104D: push 004B105Fh
  loc_004B1052: jmp 004B105Eh
  loc_004B1054: lea ecx, var_18
  loc_004B1057: call [004012B0h] ; __vbaFreeObj
  loc_004B105D: ret
  loc_004B105E: ret
  loc_004B105F: mov eax, Me
  loc_004B1062: push eax
  loc_004B1063: mov edx, [eax]
  loc_004B1065: call [edx+00000008h]
  loc_004B1068: mov eax, var_4
  loc_004B106B: mov ecx, var_14
  loc_004B106E: pop edi
  loc_004B106F: pop esi
  loc_004B1070: mov fs:[00000000h], ecx
  loc_004B1077: pop ebx
  loc_004B1078: mov esp, ebp
  loc_004B107A: pop ebp
  loc_004B107B: retn 0004h
End Sub

Private Sub cmdOk_Click() '4B1080
  loc_004B1080: push ebp
  loc_004B1081: mov ebp, esp
  loc_004B1083: sub esp, 0000000Ch
  loc_004B1086: push 00403B36h ; __vbaExceptHandler
  loc_004B108B: mov eax, fs:[00000000h]
  loc_004B1091: push eax
  loc_004B1092: mov fs:[00000000h], esp
  loc_004B1099: sub esp, 000000CCh
  loc_004B109F: push ebx
  loc_004B10A0: push esi
  loc_004B10A1: push edi
  loc_004B10A2: mov var_C, esp
  loc_004B10A5: mov var_8, 00401B78h
  loc_004B10AC: mov edi, Me
  loc_004B10AF: mov eax, edi
  loc_004B10B1: and eax, 00000001h
  loc_004B10B4: mov var_4, eax
  loc_004B10B7: and edi, FFFFFFFEh
  loc_004B10BA: push edi
  loc_004B10BB: mov Me, edi
  loc_004B10BE: mov ecx, [edi]
  loc_004B10C0: call [ecx+00000004h]
  loc_004B10C3: xor esi, esi
  loc_004B10C5: mov ecx, 0000000Ah
  loc_004B10CA: mov var_48, esi
  loc_004B10CD: mov var_58, esi
  loc_004B10D0: mov var_68, esi
  loc_004B10D3: mov eax, 80020004h
  loc_004B10D8: mov var_68, ecx
  loc_004B10DB: mov var_58, ecx
  loc_004B10DE: mov var_48, ecx
  loc_004B10E1: mov var_78, esi
  loc_004B10E4: lea edx, var_78
  loc_004B10E7: lea ecx, var_38
  loc_004B10EA: mov var_1C, esi
  loc_004B10ED: mov var_18, esi
  loc_004B10F0: mov var_20, esi
  loc_004B10F3: mov var_24, esi
  loc_004B10F6: mov var_28, esi
  loc_004B10F9: mov var_38, esi
  loc_004B10FC: mov var_88, esi
  loc_004B1102: mov var_98, esi
  loc_004B1108: mov var_A8, esi
  loc_004B110E: mov var_60, eax
  loc_004B1111: mov var_50, eax
  loc_004B1114: mov var_40, eax
  loc_004B1117: mov var_70, 004247C4h ; "Are you sure to delete data?"
  loc_004B111E: mov var_78, 00000008h
  loc_004B1125: call [00401240h] ; __vbaVarDup
  loc_004B112B: lea edx, var_68
  loc_004B112E: lea eax, var_58
  loc_004B1131: push edx
  loc_004B1132: lea ecx, var_48
  loc_004B1135: push eax
  loc_004B1136: push ecx
  loc_004B1137: lea edx, var_38
  loc_004B113A: push 00000114h
  loc_004B113F: push edx
  loc_004B1140: call [004010A4h] ; rtcMsgBox
  loc_004B1146: xor ecx, ecx
  loc_004B1148: cmp eax, 00000006h
  loc_004B114B: setz cl
  loc_004B114E: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_004B1154: lea edx, var_68
  loc_004B1157: neg ecx
  loc_004B1159: mov var_AC, cx
  loc_004B1160: lea eax, var_58
  loc_004B1163: push edx
  loc_004B1164: lea ecx, var_48
  loc_004B1167: push eax
  loc_004B1168: lea edx, var_38
  loc_004B116B: push ecx
  loc_004B116C: push edx
  loc_004B116D: push 00000004h
  loc_004B116F: call ebx
  loc_004B1171: add esp, 00000014h
  loc_004B1174: cmp var_AC, si
  loc_004B117B: jz 004B186Ah
  loc_004B1181: mov eax, [edi]
  loc_004B1183: push esi
  loc_004B1184: push 00000014h
  loc_004B1186: push edi
  loc_004B1187: call [eax+00000328h]
  loc_004B118D: lea ecx, var_28
  loc_004B1190: push eax
  loc_004B1191: push ecx
  loc_004B1192: call [004010A0h] ; __vbaObjSet
  loc_004B1198: lea edx, var_38
  loc_004B119B: push eax
  loc_004B119C: push edx
  loc_004B119D: call [00401140h] ; __vbaLateIdCallLd
  loc_004B11A3: add esp, 00000010h
  loc_004B11A6: push eax
  loc_004B11A7: call [004011B8h] ; __vbaDateVar
  loc_004B11AD: mov eax, [edi]
  loc_004B11AF: push esi
  loc_004B11B0: fstp real8 ptr var_C0
  loc_004B11B6: push 00000014h
  loc_004B11B8: push edi
  loc_004B11B9: mov var_B8, esi
  loc_004B11BF: mov var_B4, 3FF00000h
  loc_004B11C9: call [eax+00000324h]
  loc_004B11CF: lea ecx, var_24
  loc_004B11D2: push eax
  loc_004B11D3: push ecx
  loc_004B11D4: call [004010A0h] ; __vbaObjSet
  loc_004B11DA: lea edx, var_48
  loc_004B11DD: push eax
  loc_004B11DE: push edx
  loc_004B11DF: call [00401140h] ; __vbaLateIdCallLd
  loc_004B11E5: add esp, 00000010h
  loc_004B11E8: push eax
  loc_004B11E9: call [004011B8h] ; __vbaDateVar
  loc_004B11EF: fstp real8 ptr var_1C
  loc_004B11F2: lea eax, var_28
  loc_004B11F5: lea ecx, var_24
  loc_004B11F8: push eax
  loc_004B11F9: push ecx
  loc_004B11FA: push 00000002h
  loc_004B11FC: call [00401040h] ; __vbaFreeObjList
  loc_004B1202: lea edx, var_48
  loc_004B1205: lea eax, var_38
  loc_004B1208: push edx
  loc_004B1209: push eax
  loc_004B120A: push 00000002h
  loc_004B120C: call ebx
  loc_004B120E: mov edi, var_9C
  loc_004B1214: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B121A: add esp, 00000018h
  loc_004B121D: fld real8 ptr var_1C
  loc_004B1220: fcomp real8 ptr var_C0
  loc_004B1226: fnstsw ax
  loc_004B1228: test ah, 41h
  loc_004B122B: jz 004B17B1h
  loc_004B1231: lea edx, var_78
  loc_004B1234: lea eax, var_38
  loc_004B1237: lea ecx, var_1C
  loc_004B123A: push edx
  loc_004B123B: push eax
  loc_004B123C: mov ebx, 80020004h
  loc_004B1241: mov var_A8, 0000000Ah
  loc_004B124B: mov var_80, 00424804h ; "Delete From LuckyNo WHERE Ondate=#"
  loc_004B1252: mov var_88, 00000008h
  loc_004B125C: mov var_70, ecx
  loc_004B125F: mov var_78, 00004007h
  loc_004B1266: call [004010D4h] ; rtcTrimVar
  loc_004B126C: mov ecx, [0061A13Ch]
  loc_004B1272: sub esp, 00000010h
  loc_004B1275: mov var_90, 004216BCh ; "#"
  loc_004B127F: mov var_98, 00000008h
  loc_004B1289: mov edx, [ecx]
  loc_004B128B: mov ecx, var_A8
  loc_004B1291: mov eax, esp
  loc_004B1293: mov var_CC, edx
  loc_004B1299: mov [eax], ecx
  loc_004B129B: mov ecx, var_A4
  loc_004B12A1: mov [eax+00000004h], ecx
  loc_004B12A4: lea ecx, var_38
  loc_004B12A7: mov [eax+00000008h], ebx
  loc_004B12AA: mov [eax+0000000Ch], edi
  loc_004B12AD: lea eax, var_88
  loc_004B12B3: push eax
  loc_004B12B4: lea eax, var_48
  loc_004B12B7: push ecx
  loc_004B12B8: push eax
  loc_004B12B9: call __vbaVarCat
  loc_004B12BB: lea ecx, var_98
  loc_004B12C1: push eax
  loc_004B12C2: lea edx, var_58
  loc_004B12C5: push ecx
  loc_004B12C6: push edx
  loc_004B12C7: call __vbaVarCat
  loc_004B12C9: push eax
  loc_004B12CA: lea eax, var_20
  loc_004B12CD: push eax
  loc_004B12CE: call [004011B0h] ; __vbaStrVarVal
  loc_004B12D4: mov ecx, [0061A13Ch]
  loc_004B12DA: mov edx, var_CC
  loc_004B12E0: push eax
  loc_004B12E1: push ecx
  loc_004B12E2: call [edx+0000005Ch]
  loc_004B12E5: test eax, eax
  loc_004B12E7: fnclex
  loc_004B12E9: jge 004B1300h
  loc_004B12EB: mov ecx, [0061A13Ch]
  loc_004B12F1: push 0000005Ch
  loc_004B12F3: push 0041E928h
  loc_004B12F8: push ecx
  loc_004B12F9: push eax
  loc_004B12FA: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1300: lea ecx, var_20
  loc_004B1303: call [004012ACh] ; __vbaFreeStr
  loc_004B1309: lea edx, var_58
  loc_004B130C: lea eax, var_48
  loc_004B130F: push edx
  loc_004B1310: lea ecx, var_38
  loc_004B1313: push eax
  loc_004B1314: push ecx
  loc_004B1315: push 00000003h
  loc_004B1317: call [00401038h] ; __vbaFreeVarList
  loc_004B131D: add esp, 00000010h
  loc_004B1320: lea eax, var_78
  loc_004B1323: lea ecx, var_38
  loc_004B1326: lea edx, var_1C
  loc_004B1329: push eax
  loc_004B132A: push ecx
  loc_004B132B: mov ebx, 80020004h
  loc_004B1330: mov var_80, 00424850h ; "Delete From LG WHERE OnCount='"
  loc_004B1337: mov var_88, 00000008h
  loc_004B1341: mov var_70, edx
  loc_004B1344: mov var_78, 00004007h
  loc_004B134B: call [004010D4h] ; rtcTrimVar
  loc_004B1351: sub esp, 00000010h
  loc_004B1354: mov eax, 0000000Ah
  loc_004B1359: mov ecx, esp
  loc_004B135B: mov edx, [0061A13Ch]
  loc_004B1361: mov var_90, 0041E890h ; "'"
  loc_004B136B: mov var_98, 00000008h
  loc_004B1375: mov [ecx], eax
  loc_004B1377: mov eax, var_A4
  loc_004B137D: mov edx, [edx]
  loc_004B137F: mov [ecx+00000004h], eax
  loc_004B1382: lea eax, var_38
  loc_004B1385: mov var_D0, edx
  loc_004B138B: mov [ecx+00000008h], ebx
  loc_004B138E: mov [ecx+0000000Ch], edi
  loc_004B1391: lea ecx, var_88
  loc_004B1397: push ecx
  loc_004B1398: lea ecx, var_48
  loc_004B139B: push eax
  loc_004B139C: push ecx
  loc_004B139D: call __vbaVarCat
  loc_004B139F: push eax
  loc_004B13A0: lea edx, var_98
  loc_004B13A6: lea eax, var_58
  loc_004B13A9: push edx
  loc_004B13AA: push eax
  loc_004B13AB: call __vbaVarCat
  loc_004B13AD: lea ecx, var_20
  loc_004B13B0: push eax
  loc_004B13B1: push ecx
  loc_004B13B2: call [004011B0h] ; __vbaStrVarVal
  loc_004B13B8: mov edx, [0061A13Ch]
  loc_004B13BE: push eax
  loc_004B13BF: mov eax, var_D0
  loc_004B13C5: push edx
  loc_004B13C6: call [eax+0000005Ch]
  loc_004B13C9: test eax, eax
  loc_004B13CB: fnclex
  loc_004B13CD: jge 004B13E4h
  loc_004B13CF: mov ecx, [0061A13Ch]
  loc_004B13D5: push 0000005Ch
  loc_004B13D7: push 0041E928h
  loc_004B13DC: push ecx
  loc_004B13DD: push eax
  loc_004B13DE: call [00401074h] ; __vbaHresultCheckObj
  loc_004B13E4: lea ecx, var_20
  loc_004B13E7: call [004012ACh] ; __vbaFreeStr
  loc_004B13ED: lea edx, var_58
  loc_004B13F0: lea eax, var_48
  loc_004B13F3: push edx
  loc_004B13F4: lea ecx, var_38
  loc_004B13F7: push eax
  loc_004B13F8: push ecx
  loc_004B13F9: push 00000003h
  loc_004B13FB: call [00401038h] ; __vbaFreeVarList
  loc_004B1401: add esp, 00000010h
  loc_004B1404: lea eax, var_78
  loc_004B1407: lea ecx, var_38
  loc_004B140A: lea edx, var_1C
  loc_004B140D: push eax
  loc_004B140E: push ecx
  loc_004B140F: mov ebx, 80020004h
  loc_004B1414: mov var_80, 00424894h ; "Delete From LGDetail WHERE OnCount='"
  loc_004B141B: mov var_88, 00000008h
  loc_004B1425: mov var_70, edx
  loc_004B1428: mov var_78, 00004007h
  loc_004B142F: call [004010D4h] ; rtcTrimVar
  loc_004B1435: sub esp, 00000010h
  loc_004B1438: mov eax, 0000000Ah
  loc_004B143D: mov ecx, esp
  loc_004B143F: mov edx, [0061A13Ch]
  loc_004B1445: mov var_90, 0041E890h ; "'"
  loc_004B144F: mov var_98, 00000008h
  loc_004B1459: mov [ecx], eax
  loc_004B145B: mov eax, var_A4
  loc_004B1461: mov edx, [edx]
  loc_004B1463: mov [ecx+00000004h], eax
  loc_004B1466: lea eax, var_38
  loc_004B1469: mov var_D4, edx
  loc_004B146F: mov [ecx+00000008h], ebx
  loc_004B1472: mov [ecx+0000000Ch], edi
  loc_004B1475: lea ecx, var_88
  loc_004B147B: push ecx
  loc_004B147C: lea ecx, var_48
  loc_004B147F: push eax
  loc_004B1480: push ecx
  loc_004B1481: call __vbaVarCat
  loc_004B1483: push eax
  loc_004B1484: lea edx, var_98
  loc_004B148A: lea eax, var_58
  loc_004B148D: push edx
  loc_004B148E: push eax
  loc_004B148F: call __vbaVarCat
  loc_004B1491: lea ecx, var_20
  loc_004B1494: push eax
  loc_004B1495: push ecx
  loc_004B1496: call [004011B0h] ; __vbaStrVarVal
  loc_004B149C: mov edx, [0061A13Ch]
  loc_004B14A2: push eax
  loc_004B14A3: mov eax, var_D4
  loc_004B14A9: push edx
  loc_004B14AA: call [eax+0000005Ch]
  loc_004B14AD: test eax, eax
  loc_004B14AF: fnclex
  loc_004B14B1: jge 004B14C8h
  loc_004B14B3: mov ecx, [0061A13Ch]
  loc_004B14B9: push 0000005Ch
  loc_004B14BB: push 0041E928h
  loc_004B14C0: push ecx
  loc_004B14C1: push eax
  loc_004B14C2: call [00401074h] ; __vbaHresultCheckObj
  loc_004B14C8: lea ecx, var_20
  loc_004B14CB: call [004012ACh] ; __vbaFreeStr
  loc_004B14D1: lea edx, var_58
  loc_004B14D4: lea eax, var_48
  loc_004B14D7: push edx
  loc_004B14D8: lea ecx, var_38
  loc_004B14DB: push eax
  loc_004B14DC: push ecx
  loc_004B14DD: push 00000003h
  loc_004B14DF: call [00401038h] ; __vbaFreeVarList
  loc_004B14E5: add esp, 00000010h
  loc_004B14E8: lea eax, var_78
  loc_004B14EB: lea ecx, var_38
  loc_004B14EE: lea edx, var_1C
  loc_004B14F1: push eax
  loc_004B14F2: push ecx
  loc_004B14F3: mov ebx, 80020004h
  loc_004B14F8: mov var_80, 004248E4h ; "Delete From LGSale WHERE OnCount='"
  loc_004B14FF: mov var_88, 00000008h
  loc_004B1509: mov var_70, edx
  loc_004B150C: mov var_78, 00004007h
  loc_004B1513: call [004010D4h] ; rtcTrimVar
  loc_004B1519: sub esp, 00000010h
  loc_004B151C: mov eax, 0000000Ah
  loc_004B1521: mov ecx, esp
  loc_004B1523: mov edx, [0061A13Ch]
  loc_004B1529: mov var_90, 0041E890h ; "'"
  loc_004B1533: mov var_98, 00000008h
  loc_004B153D: mov [ecx], eax
  loc_004B153F: mov eax, var_A4
  loc_004B1545: mov edx, [edx]
  loc_004B1547: mov [ecx+00000004h], eax
  loc_004B154A: lea eax, var_38
  loc_004B154D: mov var_D8, edx
  loc_004B1553: mov [ecx+00000008h], ebx
  loc_004B1556: mov [ecx+0000000Ch], edi
  loc_004B1559: lea ecx, var_88
  loc_004B155F: push ecx
  loc_004B1560: lea ecx, var_48
  loc_004B1563: push eax
  loc_004B1564: push ecx
  loc_004B1565: call __vbaVarCat
  loc_004B1567: push eax
  loc_004B1568: lea edx, var_98
  loc_004B156E: lea eax, var_58
  loc_004B1571: push edx
  loc_004B1572: push eax
  loc_004B1573: call __vbaVarCat
  loc_004B1575: lea ecx, var_20
  loc_004B1578: push eax
  loc_004B1579: push ecx
  loc_004B157A: call [004011B0h] ; __vbaStrVarVal
  loc_004B1580: mov edx, [0061A13Ch]
  loc_004B1586: push eax
  loc_004B1587: mov eax, var_D8
  loc_004B158D: push edx
  loc_004B158E: call [eax+0000005Ch]
  loc_004B1591: test eax, eax
  loc_004B1593: fnclex
  loc_004B1595: jge 004B15ACh
  loc_004B1597: mov ecx, [0061A13Ch]
  loc_004B159D: push 0000005Ch
  loc_004B159F: push 0041E928h
  loc_004B15A4: push ecx
  loc_004B15A5: push eax
  loc_004B15A6: call [00401074h] ; __vbaHresultCheckObj
  loc_004B15AC: lea ecx, var_20
  loc_004B15AF: call [004012ACh] ; __vbaFreeStr
  loc_004B15B5: lea edx, var_58
  loc_004B15B8: lea eax, var_48
  loc_004B15BB: push edx
  loc_004B15BC: lea ecx, var_38
  loc_004B15BF: push eax
  loc_004B15C0: push ecx
  loc_004B15C1: push 00000003h
  loc_004B15C3: call [00401038h] ; __vbaFreeVarList
  loc_004B15C9: add esp, 00000010h
  loc_004B15CC: lea eax, var_78
  loc_004B15CF: lea ecx, var_38
  loc_004B15D2: lea edx, var_1C
  loc_004B15D5: push eax
  loc_004B15D6: push ecx
  loc_004B15D7: mov ebx, 80020004h
  loc_004B15DC: mov var_80, 00424930h ; "Delete From LGSaleDetail WHERE OnCount='"
  loc_004B15E3: mov var_88, 00000008h
  loc_004B15ED: mov var_70, edx
  loc_004B15F0: mov var_78, 00004007h
  loc_004B15F7: call [004010D4h] ; rtcTrimVar
  loc_004B15FD: sub esp, 00000010h
  loc_004B1600: mov eax, 0000000Ah
  loc_004B1605: mov ecx, esp
  loc_004B1607: mov edx, [0061A13Ch]
  loc_004B160D: mov var_90, 0041E890h ; "'"
  loc_004B1617: mov var_98, 00000008h
  loc_004B1621: mov [ecx], eax
  loc_004B1623: mov eax, var_A4
  loc_004B1629: mov edx, [edx]
  loc_004B162B: mov [ecx+00000004h], eax
  loc_004B162E: lea eax, var_38
  loc_004B1631: mov var_DC, edx
  loc_004B1637: mov [ecx+00000008h], ebx
  loc_004B163A: mov [ecx+0000000Ch], edi
  loc_004B163D: lea ecx, var_88
  loc_004B1643: push ecx
  loc_004B1644: lea ecx, var_48
  loc_004B1647: push eax
  loc_004B1648: push ecx
  loc_004B1649: call __vbaVarCat
  loc_004B164B: push eax
  loc_004B164C: lea edx, var_98
  loc_004B1652: lea eax, var_58
  loc_004B1655: push edx
  loc_004B1656: push eax
  loc_004B1657: call __vbaVarCat
  loc_004B1659: lea ecx, var_20
  loc_004B165C: push eax
  loc_004B165D: push ecx
  loc_004B165E: call [004011B0h] ; __vbaStrVarVal
  loc_004B1664: mov edx, [0061A13Ch]
  loc_004B166A: push eax
  loc_004B166B: mov eax, var_DC
  loc_004B1671: push edx
  loc_004B1672: call [eax+0000005Ch]
  loc_004B1675: test eax, eax
  loc_004B1677: fnclex
  loc_004B1679: jge 004B1690h
  loc_004B167B: mov ecx, [0061A13Ch]
  loc_004B1681: push 0000005Ch
  loc_004B1683: push 0041E928h
  loc_004B1688: push ecx
  loc_004B1689: push eax
  loc_004B168A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1690: lea ecx, var_20
  loc_004B1693: call [004012ACh] ; __vbaFreeStr
  loc_004B1699: lea edx, var_58
  loc_004B169C: lea eax, var_48
  loc_004B169F: push edx
  loc_004B16A0: lea ecx, var_38
  loc_004B16A3: push eax
  loc_004B16A4: push ecx
  loc_004B16A5: push 00000003h
  loc_004B16A7: call [00401038h] ; __vbaFreeVarList
  loc_004B16AD: add esp, 00000010h
  loc_004B16B0: lea eax, var_78
  loc_004B16B3: lea ecx, var_38
  loc_004B16B6: lea edx, var_1C
  loc_004B16B9: push eax
  loc_004B16BA: push ecx
  loc_004B16BB: mov ebx, 80020004h
  loc_004B16C0: mov var_80, 004249A4h ; "Delete From TotalPLG Where OnCount='"
  loc_004B16C7: mov var_88, 00000008h
  loc_004B16D1: mov var_70, edx
  loc_004B16D4: mov var_78, 00004007h
  loc_004B16DB: call [004010D4h] ; rtcTrimVar
  loc_004B16E1: sub esp, 00000010h
  loc_004B16E4: mov eax, 0000000Ah
  loc_004B16E9: mov ecx, esp
  loc_004B16EB: mov edx, [0061A13Ch]
  loc_004B16F1: mov var_90, 0041E890h ; "'"
  loc_004B16FB: mov var_98, 00000008h
  loc_004B1705: mov [ecx], eax
  loc_004B1707: mov eax, var_A4
  loc_004B170D: mov edx, [edx]
  loc_004B170F: mov [ecx+00000004h], eax
  loc_004B1712: lea eax, var_38
  loc_004B1715: mov var_E0, edx
  loc_004B171B: mov [ecx+00000008h], ebx
  loc_004B171E: mov [ecx+0000000Ch], edi
  loc_004B1721: lea ecx, var_88
  loc_004B1727: push ecx
  loc_004B1728: lea ecx, var_48
  loc_004B172B: push eax
  loc_004B172C: push ecx
  loc_004B172D: call __vbaVarCat
  loc_004B172F: push eax
  loc_004B1730: lea edx, var_98
  loc_004B1736: lea eax, var_58
  loc_004B1739: push edx
  loc_004B173A: push eax
  loc_004B173B: call __vbaVarCat
  loc_004B173D: lea ecx, var_20
  loc_004B1740: push eax
  loc_004B1741: push ecx
  loc_004B1742: call [004011B0h] ; __vbaStrVarVal
  loc_004B1748: mov edx, [0061A13Ch]
  loc_004B174E: push eax
  loc_004B174F: mov eax, var_E0
  loc_004B1755: push edx
  loc_004B1756: call [eax+0000005Ch]
  loc_004B1759: test eax, eax
  loc_004B175B: fnclex
  loc_004B175D: jge 004B1774h
  loc_004B175F: mov ecx, [0061A13Ch]
  loc_004B1765: push 0000005Ch
  loc_004B1767: push 0041E928h
  loc_004B176C: push ecx
  loc_004B176D: push eax
  loc_004B176E: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1774: lea ecx, var_20
  loc_004B1777: call [004012ACh] ; __vbaFreeStr
  loc_004B177D: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_004B1783: lea edx, var_58
  loc_004B1786: lea eax, var_48
  loc_004B1789: push edx
  loc_004B178A: lea ecx, var_38
  loc_004B178D: push eax
  loc_004B178E: push ecx
  loc_004B178F: push 00000003h
  loc_004B1791: call ebx
  loc_004B1793: fld real8 ptr var_B8
  loc_004B1799: fadd st0, real8 ptr var_1C
  loc_004B179C: add esp, 00000010h
  loc_004B179F: fstp real8 ptr var_1C
  loc_004B17A2: fnstsw ax
  loc_004B17A4: test al, 0Dh
  loc_004B17A6: jnz 004B18CAh
  loc_004B17AC: jmp 004B121Dh
  loc_004B17B1: mov ecx, 80020004h
  loc_004B17B6: mov eax, 0000000Ah
  loc_004B17BB: mov var_60, ecx
  loc_004B17BE: mov var_50, ecx
  loc_004B17C1: mov var_40, ecx
  loc_004B17C4: lea edx, var_78
  loc_004B17C7: lea ecx, var_38
  loc_004B17CA: mov var_68, eax
  loc_004B17CD: mov var_58, eax
  loc_004B17D0: mov var_48, eax
  loc_004B17D3: mov var_70, 004249F4h ; "Delete Successfully."
  loc_004B17DA: mov var_78, 00000008h
  loc_004B17E1: call [00401240h] ; __vbaVarDup
  loc_004B17E7: lea edx, var_68
  loc_004B17EA: lea eax, var_58
  loc_004B17ED: push edx
  loc_004B17EE: lea ecx, var_48
  loc_004B17F1: push eax
  loc_004B17F2: push ecx
  loc_004B17F3: lea edx, var_38
  loc_004B17F6: push 00000040h
  loc_004B17F8: push edx
  loc_004B17F9: call [004010A4h] ; rtcMsgBox
  loc_004B17FF: lea eax, var_68
  loc_004B1802: lea ecx, var_58
  loc_004B1805: push eax
  loc_004B1806: lea edx, var_48
  loc_004B1809: push ecx
  loc_004B180A: lea eax, var_38
  loc_004B180D: push edx
  loc_004B180E: push eax
  loc_004B180F: push 00000004h
  loc_004B1811: call ebx
  loc_004B1813: mov eax, [0061B394h]
  loc_004B1818: add esp, 00000014h
  loc_004B181B: test eax, eax
  loc_004B181D: jnz 004B182Fh
  loc_004B181F: push 0061B394h
  loc_004B1824: push 0041E4A0h
  loc_004B1829: call [004011DCh] ; __vbaNew2
  loc_004B182F: mov ecx, Me
  loc_004B1832: mov esi, [0061B394h]
  loc_004B1838: lea edx, var_24
  loc_004B183B: push ecx
  loc_004B183C: mov edi, [esi]
  loc_004B183E: push edx
  loc_004B183F: call [004010B8h] ; __vbaObjSetAddref
  loc_004B1845: push eax
  loc_004B1846: push esi
  loc_004B1847: call [edi+00000010h]
  loc_004B184A: test eax, eax
  loc_004B184C: fnclex
  loc_004B184E: jge 004B185Fh
  loc_004B1850: push 00000010h
  loc_004B1852: push 0041E490h
  loc_004B1857: push esi
  loc_004B1858: push eax
  loc_004B1859: call [00401074h] ; __vbaHresultCheckObj
  loc_004B185F: lea ecx, var_24
  loc_004B1862: call [004012B0h] ; __vbaFreeObj
  loc_004B1868: xor esi, esi
  loc_004B186A: mov var_4, esi
  loc_004B186D: fwait
  loc_004B186E: push 004B18ABh
  loc_004B1873: jmp 004B18AAh
  loc_004B1875: lea ecx, var_20
  loc_004B1878: call [004012ACh] ; __vbaFreeStr
  loc_004B187E: lea eax, var_28
  loc_004B1881: lea ecx, var_24
  loc_004B1884: push eax
  loc_004B1885: push ecx
  loc_004B1886: push 00000002h
  loc_004B1888: call [00401040h] ; __vbaFreeObjList
  loc_004B188E: lea edx, var_68
  loc_004B1891: lea eax, var_58
  loc_004B1894: push edx
  loc_004B1895: lea ecx, var_48
  loc_004B1898: push eax
  loc_004B1899: lea edx, var_38
  loc_004B189C: push ecx
  loc_004B189D: push edx
  loc_004B189E: push 00000004h
  loc_004B18A0: call [00401038h] ; __vbaFreeVarList
  loc_004B18A6: add esp, 00000020h
  loc_004B18A9: ret
  loc_004B18AA: ret
  loc_004B18AB: mov eax, Me
  loc_004B18AE: push eax
  loc_004B18AF: mov ecx, [eax]
  loc_004B18B1: call [ecx+00000008h]
  loc_004B18B4: mov eax, var_4
  loc_004B18B7: mov ecx, var_14
  loc_004B18BA: pop edi
  loc_004B18BB: pop esi
  loc_004B18BC: mov fs:[00000000h], ecx
  loc_004B18C3: pop ebx
  loc_004B18C4: mov esp, ebp
  loc_004B18C6: pop ebp
  loc_004B18C7: retn 0004h
End Sub
