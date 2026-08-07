VERSION 5.00
Begin VB.Form frmUserName
  Caption = "Create Password"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 3660
  ClientHeight = 2640
  BeginProperty Font
    Name = "Arial"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdClose
    Caption = "&Close"
    Left = 2220
    Top = 1830
    Width = 975
    Height = 405
    TabIndex = 5
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 1170
    Top = 1830
    Width = 1035
    Height = 405
    TabIndex = 4
  End
  Begin VB.TextBox txtPassword
    Left = 1170
    Top = 1110
    Width = 2085
    Height = 405
    TabIndex = 1
    MaxLength = 12
  End
  Begin VB.TextBox txtUserName
    Left = 1170
    Top = 570
    Width = 2085
    Height = 405
    TabIndex = 0
    MaxLength = 12
  End
  Begin VB.Label Label2
    Caption = "Password."
    Left = 210
    Top = 1200
    Width = 915
    Height = 255
    TabIndex = 3
  End
  Begin VB.Label Label1
    Caption = "User Name."
    Left = 240
    Top = 660
    Width = 855
    Height = 255
    TabIndex = 2
  End
End

Attribute VB_Name = "frmUserName"


Private Sub txtUserName_KeyPress(KeyAscii As Integer) '5C8AF0
  loc_005C8AF0: push ebp
  loc_005C8AF1: mov ebp, esp
  loc_005C8AF3: sub esp, 0000000Ch
  loc_005C8AF6: push 00403B36h ; __vbaExceptHandler
  loc_005C8AFB: mov eax, fs:[00000000h]
  loc_005C8B01: push eax
  loc_005C8B02: mov fs:[00000000h], esp
  loc_005C8B09: sub esp, 00000014h
  loc_005C8B0C: push ebx
  loc_005C8B0D: push esi
  loc_005C8B0E: push edi
  loc_005C8B0F: mov var_C, esp
  loc_005C8B12: mov var_8, 00403018h
  loc_005C8B19: mov esi, Me
  loc_005C8B1C: mov eax, esi
  loc_005C8B1E: and eax, 00000001h
  loc_005C8B21: mov var_4, eax
  loc_005C8B24: and esi, FFFFFFFEh
  loc_005C8B27: push esi
  loc_005C8B28: mov Me, esi
  loc_005C8B2B: mov ecx, [esi]
  loc_005C8B2D: call [ecx+00000004h]
  loc_005C8B30: mov edx, KeyAscii
  loc_005C8B33: xor edi, edi
  loc_005C8B35: mov var_18, edi
  loc_005C8B38: cmp [edx], 000Dh
  loc_005C8B3C: jnz 005C8B7Eh
  loc_005C8B3E: mov eax, [esi]
  loc_005C8B40: push esi
  loc_005C8B41: call [eax+00000304h]
  loc_005C8B47: lea ecx, var_18
  loc_005C8B4A: push eax
  loc_005C8B4B: push ecx
  loc_005C8B4C: call [004010A0h] ; __vbaObjSet
  loc_005C8B52: mov esi, eax
  loc_005C8B54: push esi
  loc_005C8B55: mov edx, [esi]
  loc_005C8B57: call [edx+00000204h]
  loc_005C8B5D: cmp eax, edi
  loc_005C8B5F: fnclex
  loc_005C8B61: jge 005C8B75h
  loc_005C8B63: push 00000204h
  loc_005C8B68: push 0041E5E8h
  loc_005C8B6D: push esi
  loc_005C8B6E: push eax
  loc_005C8B6F: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8B75: lea ecx, var_18
  loc_005C8B78: call [004012B0h] ; __vbaFreeObj
  loc_005C8B7E: mov var_4, edi
  loc_005C8B81: push 005C8B93h
  loc_005C8B86: jmp 005C8B92h
  loc_005C8B88: lea ecx, var_18
  loc_005C8B8B: call [004012B0h] ; __vbaFreeObj
  loc_005C8B91: ret
  loc_005C8B92: ret
  loc_005C8B93: mov eax, Me
  loc_005C8B96: push eax
  loc_005C8B97: mov ecx, [eax]
  loc_005C8B99: call [ecx+00000008h]
  loc_005C8B9C: mov eax, var_4
  loc_005C8B9F: mov ecx, var_14
  loc_005C8BA2: pop edi
  loc_005C8BA3: pop esi
  loc_005C8BA4: mov fs:[00000000h], ecx
  loc_005C8BAB: pop ebx
  loc_005C8BAC: mov esp, ebp
  loc_005C8BAE: pop ebp
  loc_005C8BAF: retn 0008h
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer) '5C8A20
  loc_005C8A20: push ebp
  loc_005C8A21: mov ebp, esp
  loc_005C8A23: sub esp, 0000000Ch
  loc_005C8A26: push 00403B36h ; __vbaExceptHandler
  loc_005C8A2B: mov eax, fs:[00000000h]
  loc_005C8A31: push eax
  loc_005C8A32: mov fs:[00000000h], esp
  loc_005C8A39: sub esp, 00000014h
  loc_005C8A3C: push ebx
  loc_005C8A3D: push esi
  loc_005C8A3E: push edi
  loc_005C8A3F: mov var_C, esp
  loc_005C8A42: mov var_8, 00403008h
  loc_005C8A49: mov esi, Me
  loc_005C8A4C: mov eax, esi
  loc_005C8A4E: and eax, 00000001h
  loc_005C8A51: mov var_4, eax
  loc_005C8A54: and esi, FFFFFFFEh
  loc_005C8A57: push esi
  loc_005C8A58: mov Me, esi
  loc_005C8A5B: mov ecx, [esi]
  loc_005C8A5D: call [ecx+00000004h]
  loc_005C8A60: mov edx, KeyAscii
  loc_005C8A63: xor edi, edi
  loc_005C8A65: mov var_18, edi
  loc_005C8A68: cmp [edx], 000Dh
  loc_005C8A6C: jnz 005C8AAEh
  loc_005C8A6E: mov eax, [esi]
  loc_005C8A70: push esi
  loc_005C8A71: call [eax+00000300h]
  loc_005C8A77: lea ecx, var_18
  loc_005C8A7A: push eax
  loc_005C8A7B: push ecx
  loc_005C8A7C: call [004010A0h] ; __vbaObjSet
  loc_005C8A82: mov esi, eax
  loc_005C8A84: push esi
  loc_005C8A85: mov edx, [esi]
  loc_005C8A87: call [edx+000001A4h]
  loc_005C8A8D: cmp eax, edi
  loc_005C8A8F: fnclex
  loc_005C8A91: jge 005C8AA5h
  loc_005C8A93: push 000001A4h
  loc_005C8A98: push 0041EAACh
  loc_005C8A9D: push esi
  loc_005C8A9E: push eax
  loc_005C8A9F: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8AA5: lea ecx, var_18
  loc_005C8AA8: call [004012B0h] ; __vbaFreeObj
  loc_005C8AAE: mov var_4, edi
  loc_005C8AB1: push 005C8AC3h
  loc_005C8AB6: jmp 005C8AC2h
  loc_005C8AB8: lea ecx, var_18
  loc_005C8ABB: call [004012B0h] ; __vbaFreeObj
  loc_005C8AC1: ret
  loc_005C8AC2: ret
  loc_005C8AC3: mov eax, Me
  loc_005C8AC6: push eax
  loc_005C8AC7: mov ecx, [eax]
  loc_005C8AC9: call [ecx+00000008h]
  loc_005C8ACC: mov eax, var_4
  loc_005C8ACF: mov ecx, var_14
  loc_005C8AD2: pop edi
  loc_005C8AD3: pop esi
  loc_005C8AD4: mov fs:[00000000h], ecx
  loc_005C8ADB: pop ebx
  loc_005C8ADC: mov esp, ebp
  loc_005C8ADE: pop ebp
  loc_005C8ADF: retn 0008h
End Sub

Private Sub cmdClose_Click() '5C80F0
  loc_005C80F0: push ebp
  loc_005C80F1: mov ebp, esp
  loc_005C80F3: sub esp, 0000000Ch
  loc_005C80F6: push 00403B36h ; __vbaExceptHandler
  loc_005C80FB: mov eax, fs:[00000000h]
  loc_005C8101: push eax
  loc_005C8102: mov fs:[00000000h], esp
  loc_005C8109: sub esp, 00000018h
  loc_005C810C: push ebx
  loc_005C810D: push esi
  loc_005C810E: push edi
  loc_005C810F: mov var_C, esp
  loc_005C8112: mov var_8, 00402FD8h
  loc_005C8119: mov edi, Me
  loc_005C811C: mov eax, edi
  loc_005C811E: and eax, 00000001h
  loc_005C8121: mov var_4, eax
  loc_005C8124: and edi, FFFFFFFEh
  loc_005C8127: push edi
  loc_005C8128: mov Me, edi
  loc_005C812B: mov ecx, [edi]
  loc_005C812D: call [ecx+00000004h]
  loc_005C8130: mov eax, [0061B394h]
  loc_005C8135: xor ebx, ebx
  loc_005C8137: cmp eax, ebx
  loc_005C8139: mov var_18, ebx
  loc_005C813C: jnz 005C814Eh
  loc_005C813E: push 0061B394h
  loc_005C8143: push 0041E4A0h
  loc_005C8148: call [004011DCh] ; __vbaNew2
  loc_005C814E: mov esi, [0061B394h]
  loc_005C8154: lea eax, var_18
  loc_005C8157: push edi
  loc_005C8158: push eax
  loc_005C8159: mov edx, [esi]
  loc_005C815B: mov var_2C, edx
  loc_005C815E: call [004010B8h] ; __vbaObjSetAddref
  loc_005C8164: mov ecx, var_2C
  loc_005C8167: push eax
  loc_005C8168: push esi
  loc_005C8169: call [ecx+00000010h]
  loc_005C816C: cmp eax, ebx
  loc_005C816E: fnclex
  loc_005C8170: jge 005C8181h
  loc_005C8172: push 00000010h
  loc_005C8174: push 0041E490h
  loc_005C8179: push esi
  loc_005C817A: push eax
  loc_005C817B: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8181: lea ecx, var_18
  loc_005C8184: call [004012B0h] ; __vbaFreeObj
  loc_005C818A: mov var_4, ebx
  loc_005C818D: push 005C819Fh
  loc_005C8192: jmp 005C819Eh
  loc_005C8194: lea ecx, var_18
  loc_005C8197: call [004012B0h] ; __vbaFreeObj
  loc_005C819D: ret
  loc_005C819E: ret
  loc_005C819F: mov eax, Me
  loc_005C81A2: push eax
  loc_005C81A3: mov edx, [eax]
  loc_005C81A5: call [edx+00000008h]
  loc_005C81A8: mov eax, var_4
  loc_005C81AB: mov ecx, var_14
  loc_005C81AE: pop edi
  loc_005C81AF: pop esi
  loc_005C81B0: mov fs:[00000000h], ecx
  loc_005C81B7: pop ebx
  loc_005C81B8: mov esp, ebp
  loc_005C81BA: pop ebp
  loc_005C81BB: retn 0004h
End Sub

Private Sub cmdSave_Click() '5C81C0
  loc_005C81C0: push ebp
  loc_005C81C1: mov ebp, esp
  loc_005C81C3: sub esp, 0000000Ch
  loc_005C81C6: push 00403B36h ; __vbaExceptHandler
  loc_005C81CB: mov eax, fs:[00000000h]
  loc_005C81D1: push eax
  loc_005C81D2: mov fs:[00000000h], esp
  loc_005C81D9: sub esp, 00000074h
  loc_005C81DC: push ebx
  loc_005C81DD: push esi
  loc_005C81DE: push edi
  loc_005C81DF: mov var_C, esp
  loc_005C81E2: mov var_8, 00402FE8h
  loc_005C81E9: mov edi, Me
  loc_005C81EC: mov eax, edi
  loc_005C81EE: and eax, 00000001h
  loc_005C81F1: mov var_4, eax
  loc_005C81F4: and edi, FFFFFFFEh
  loc_005C81F7: push edi
  loc_005C81F8: mov Me, edi
  loc_005C81FB: mov ecx, [edi]
  loc_005C81FD: call [ecx+00000004h]
  loc_005C8200: sub esp, 00000010h
  loc_005C8203: mov edx, [0061A13Ch]
  loc_005C8209: mov ebx, esp
  loc_005C820B: mov ecx, 0000000Ah
  loc_005C8210: xor eax, eax
  loc_005C8212: push 00431CD0h ; "Delete From Login"
  loc_005C8217: mov [ebx], ecx
  loc_005C8219: mov ecx, var_48
  loc_005C821C: mov var_18, eax
  loc_005C821F: mov var_1C, eax
  loc_005C8222: mov var_2C, eax
  loc_005C8225: mov var_3C, eax
  loc_005C8228: mov esi, [edx]
  loc_005C822A: mov [ebx+00000004h], ecx
  loc_005C822D: mov eax, 80020004h
  loc_005C8232: push edx
  loc_005C8233: mov [ebx+00000008h], eax
  loc_005C8236: mov eax, var_40
  loc_005C8239: mov [ebx+0000000Ch], eax
  loc_005C823C: call [esi+0000005Ch]
  loc_005C823F: test eax, eax
  loc_005C8241: fnclex
  loc_005C8243: jge 005C825Ah
  loc_005C8245: mov ecx, [0061A13Ch]
  loc_005C824B: push 0000005Ch
  loc_005C824D: push 0041E928h
  loc_005C8252: push ecx
  loc_005C8253: push eax
  loc_005C8254: call [00401074h] ; __vbaHresultCheckObj
  loc_005C825A: lea ebx, var_1C
  loc_005C825D: mov ecx, 0000000Ah
  loc_005C8262: push ebx
  loc_005C8263: mov var_5C, ecx
  loc_005C8266: sub esp, 00000010h
  loc_005C8269: mov eax, 80020004h
  loc_005C826E: mov ebx, esp
  loc_005C8270: mov edx, eax
  loc_005C8272: sub esp, 00000010h
  loc_005C8275: mov esi, [0061A13Ch]
  loc_005C827B: mov [ebx], ecx
  loc_005C827D: mov ecx, var_68
  loc_005C8280: mov esi, [esi]
  loc_005C8282: mov [ebx+00000004h], ecx
  loc_005C8285: mov ecx, esp
  loc_005C8287: sub esp, 00000010h
  loc_005C828A: mov [ebx+00000008h], eax
  loc_005C828D: mov eax, var_60
  loc_005C8290: mov [ebx+0000000Ch], eax
  loc_005C8293: mov eax, var_5C
  loc_005C8296: mov [ecx], eax
  loc_005C8298: mov eax, var_58
  loc_005C829B: mov [ecx+00000004h], eax
  loc_005C829E: mov eax, 00000003h
  loc_005C82A3: mov [ecx+00000008h], edx
  loc_005C82A6: mov edx, var_50
  loc_005C82A9: mov [ecx+0000000Ch], edx
  loc_005C82AC: mov edx, var_48
  loc_005C82AF: mov ecx, esp
  loc_005C82B1: push 00431E9Ch ; "Select * From Login"
  loc_005C82B6: mov [ecx], eax
  loc_005C82B8: mov eax, 00000002h
  loc_005C82BD: mov [ecx+00000004h], edx
  loc_005C82C0: mov [ecx+00000008h], eax
  loc_005C82C3: mov eax, var_40
  loc_005C82C6: mov [ecx+0000000Ch], eax
  loc_005C82C9: mov ecx, [0061A13Ch]
  loc_005C82CF: push ecx
  loc_005C82D0: call [esi+000000BCh]
  loc_005C82D6: test eax, eax
  loc_005C82D8: fnclex
  loc_005C82DA: jge 005C82F4h
  loc_005C82DC: mov edx, [0061A13Ch]
  loc_005C82E2: push 000000BCh
  loc_005C82E7: push 0041E928h
  loc_005C82EC: push edx
  loc_005C82ED: push eax
  loc_005C82EE: call [00401074h] ; __vbaHresultCheckObj
  loc_005C82F4: mov eax, var_1C
  loc_005C82F7: lea esi, [edi+00000034h]
  loc_005C82FA: push eax
  loc_005C82FB: push esi
  loc_005C82FC: call [004010B8h] ; __vbaObjSetAddref
  loc_005C8302: lea ecx, var_1C
  loc_005C8305: call [004012B0h] ; __vbaFreeObj
  loc_005C830B: mov eax, [esi]
  loc_005C830D: push eax
  loc_005C830E: mov ecx, [eax]
  loc_005C8310: call [ecx+000000C0h]
  loc_005C8316: test eax, eax
  loc_005C8318: fnclex
  loc_005C831A: jge 005C8330h
  loc_005C831C: mov edx, [esi]
  loc_005C831E: push 000000C0h
  loc_005C8323: push 0041E938h
  loc_005C8328: push edx
  loc_005C8329: push eax
  loc_005C832A: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8330: mov eax, [edi]
  loc_005C8332: push edi
  loc_005C8333: call [eax+00000308h]
  loc_005C8339: lea ecx, var_1C
  loc_005C833C: push eax
  loc_005C833D: push ecx
  loc_005C833E: call [004010A0h] ; __vbaObjSet
  loc_005C8344: mov ebx, eax
  loc_005C8346: lea eax, var_18
  loc_005C8349: push eax
  loc_005C834A: push ebx
  loc_005C834B: mov edx, [ebx]
  loc_005C834D: call [edx+000000A0h]
  loc_005C8353: test eax, eax
  loc_005C8355: fnclex
  loc_005C8357: jge 005C836Bh
  loc_005C8359: push 000000A0h
  loc_005C835E: push 0041E5E8h
  loc_005C8363: push ebx
  loc_005C8364: push eax
  loc_005C8365: call [00401074h] ; __vbaHresultCheckObj
  loc_005C836B: mov eax, var_18
  loc_005C836E: lea ecx, var_2C
  loc_005C8371: lea edx, var_3C
  loc_005C8374: push ecx
  loc_005C8375: push edx
  loc_005C8376: mov var_18, 00000000h
  loc_005C837D: mov var_24, eax
  loc_005C8380: mov var_2C, 00000008h
  loc_005C8387: call [004010D4h] ; rtcTrimVar
  loc_005C838D: mov ebx, var_3C
  loc_005C8390: sub esp, 00000010h
  loc_005C8393: mov ecx, esp
  loc_005C8395: sub esp, 00000010h
  loc_005C8398: mov eax, [esi]
  loc_005C839A: mov [ecx], ebx
  loc_005C839C: mov ebx, var_38
  loc_005C839F: mov edx, [eax]
  loc_005C83A1: mov [ecx+00000004h], ebx
  loc_005C83A4: mov ebx, var_34
  loc_005C83A7: mov [ecx+00000008h], ebx
  loc_005C83AA: mov ebx, var_30
  loc_005C83AD: mov [ecx+0000000Ch], ebx
  loc_005C83B0: mov ebx, esp
  loc_005C83B2: mov ecx, 00000008h
  loc_005C83B7: push eax
  loc_005C83B8: mov [ebx], ecx
  loc_005C83BA: mov ecx, var_48
  loc_005C83BD: mov [ebx+00000004h], ecx
  loc_005C83C0: mov ecx, 00431EC8h ; "UserName"
  loc_005C83C5: mov [ebx+00000008h], ecx
  loc_005C83C8: mov ecx, var_40
  loc_005C83CB: mov [ebx+0000000Ch], ecx
  loc_005C83CE: call [edx+00000128h]
  loc_005C83D4: test eax, eax
  loc_005C83D6: fnclex
  loc_005C83D8: jge 005C83EEh
  loc_005C83DA: mov edx, [esi]
  loc_005C83DC: push 00000128h
  loc_005C83E1: push 0041E938h
  loc_005C83E6: push edx
  loc_005C83E7: push eax
  loc_005C83E8: call [00401074h] ; __vbaHresultCheckObj
  loc_005C83EE: lea ecx, var_1C
  loc_005C83F1: call [004012B0h] ; __vbaFreeObj
  loc_005C83F7: lea eax, var_3C
  loc_005C83FA: lea ecx, var_2C
  loc_005C83FD: push eax
  loc_005C83FE: push ecx
  loc_005C83FF: push 00000002h
  loc_005C8401: call [00401038h] ; __vbaFreeVarList
  loc_005C8407: mov edx, [edi]
  loc_005C8409: add esp, 0000000Ch
  loc_005C840C: push edi
  loc_005C840D: call [edx+00000304h]
  loc_005C8413: push eax
  loc_005C8414: lea eax, var_1C
  loc_005C8417: push eax
  loc_005C8418: call [004010A0h] ; __vbaObjSet
  loc_005C841E: mov edi, eax
  loc_005C8420: lea edx, var_18
  loc_005C8423: push edx
  loc_005C8424: push edi
  loc_005C8425: mov ecx, [edi]
  loc_005C8427: call [ecx+000000A0h]
  loc_005C842D: test eax, eax
  loc_005C842F: fnclex
  loc_005C8431: jge 005C8445h
  loc_005C8433: push 000000A0h
  loc_005C8438: push 0041E5E8h
  loc_005C843D: push edi
  loc_005C843E: push eax
  loc_005C843F: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8445: mov eax, var_18
  loc_005C8448: lea ecx, var_3C
  loc_005C844B: mov var_24, eax
  loc_005C844E: lea eax, var_2C
  loc_005C8451: mov edi, 00000008h
  loc_005C8456: push eax
  loc_005C8457: push ecx
  loc_005C8458: mov var_18, 00000000h
  loc_005C845F: mov var_2C, edi
  loc_005C8462: call [004010D4h] ; rtcTrimVar
  loc_005C8468: mov ebx, var_3C
  loc_005C846B: sub esp, 00000010h
  loc_005C846E: mov var_4C, edi
  loc_005C8471: mov edi, esp
  loc_005C8473: sub esp, 00000010h
  loc_005C8476: mov eax, [esi]
  loc_005C8478: mov [edi], ebx
  loc_005C847A: mov ebx, var_38
  loc_005C847D: mov edx, [eax]
  loc_005C847F: mov ecx, 00431EE0h ; "Password"
  loc_005C8484: mov [edi+00000004h], ebx
  loc_005C8487: mov ebx, var_34
  loc_005C848A: mov [edi+00000008h], ebx
  loc_005C848D: mov ebx, var_30
  loc_005C8490: mov [edi+0000000Ch], ebx
  loc_005C8493: mov ebx, var_4C
  loc_005C8496: mov edi, esp
  loc_005C8498: push eax
  loc_005C8499: mov [edi], ebx
  loc_005C849B: mov ebx, var_48
  loc_005C849E: mov [edi+00000004h], ebx
  loc_005C84A1: mov [edi+00000008h], ecx
  loc_005C84A4: mov ecx, var_40
  loc_005C84A7: mov [edi+0000000Ch], ecx
  loc_005C84AA: call [edx+00000128h]
  loc_005C84B0: test eax, eax
  loc_005C84B2: fnclex
  loc_005C84B4: jge 005C84CEh
  loc_005C84B6: mov edx, [esi]
  loc_005C84B8: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C84BE: push 00000128h
  loc_005C84C3: push 0041E938h
  loc_005C84C8: push edx
  loc_005C84C9: push eax
  loc_005C84CA: call edi
  loc_005C84CC: jmp 005C84D4h
  loc_005C84CE: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C84D4: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005C84DA: lea ecx, var_1C
  loc_005C84DD: call ebx
  loc_005C84DF: lea eax, var_3C
  loc_005C84E2: lea ecx, var_2C
  loc_005C84E5: push eax
  loc_005C84E6: push ecx
  loc_005C84E7: push 00000002h
  loc_005C84E9: call [00401038h] ; __vbaFreeVarList
  loc_005C84EF: mov eax, [esi]
  loc_005C84F1: add esp, 0000000Ch
  loc_005C84F4: mov edx, [eax]
  loc_005C84F6: push 00000000h
  loc_005C84F8: push 00000001h
  loc_005C84FA: push eax
  loc_005C84FB: call [edx+00000164h]
  loc_005C8501: test eax, eax
  loc_005C8503: fnclex
  loc_005C8505: jge 005C8517h
  loc_005C8507: mov ecx, [esi]
  loc_005C8509: push 00000164h
  loc_005C850E: push 0041E938h
  loc_005C8513: push ecx
  loc_005C8514: push eax
  loc_005C8515: call edi
  loc_005C8517: mov eax, [esi]
  loc_005C8519: push eax
  loc_005C851A: mov edx, [eax]
  loc_005C851C: call [edx+000000C4h]
  loc_005C8522: test eax, eax
  loc_005C8524: fnclex
  loc_005C8526: jge 005C8538h
  loc_005C8528: mov ecx, [esi]
  loc_005C852A: push 000000C4h
  loc_005C852F: push 0041E938h
  loc_005C8534: push ecx
  loc_005C8535: push eax
  loc_005C8536: call edi
  loc_005C8538: push 0041E938h
  loc_005C853D: push 00000000h
  loc_005C853F: call [00401274h] ; __vbaCastObj
  loc_005C8545: lea edx, var_1C
  loc_005C8548: push eax
  loc_005C8549: push edx
  loc_005C854A: call [004010A0h] ; __vbaObjSet
  loc_005C8550: push eax
  loc_005C8551: push esi
  loc_005C8552: call [004010B8h] ; __vbaObjSetAddref
  loc_005C8558: lea ecx, var_1C
  loc_005C855B: call ebx
  loc_005C855D: mov var_4, 00000000h
  loc_005C8564: push 005C8592h
  loc_005C8569: jmp 005C8591h
  loc_005C856B: lea ecx, var_18
  loc_005C856E: call [004012ACh] ; __vbaFreeStr
  loc_005C8574: lea ecx, var_1C
  loc_005C8577: call [004012B0h] ; __vbaFreeObj
  loc_005C857D: lea eax, var_3C
  loc_005C8580: lea ecx, var_2C
  loc_005C8583: push eax
  loc_005C8584: push ecx
  loc_005C8585: push 00000002h
  loc_005C8587: call [00401038h] ; __vbaFreeVarList
  loc_005C858D: add esp, 0000000Ch
  loc_005C8590: ret
  loc_005C8591: ret
  loc_005C8592: mov eax, Me
  loc_005C8595: push eax
  loc_005C8596: mov edx, [eax]
  loc_005C8598: call [edx+00000008h]
  loc_005C859B: mov eax, var_4
  loc_005C859E: mov ecx, var_14
  loc_005C85A1: pop edi
  loc_005C85A2: pop esi
  loc_005C85A3: mov fs:[00000000h], ecx
  loc_005C85AA: pop ebx
  loc_005C85AB: mov esp, ebp
  loc_005C85AD: pop ebp
  loc_005C85AE: retn 0004h
End Sub

Private Sub Form_Load() '5C85C0
  loc_005C85C0: push ebp
  loc_005C85C1: mov ebp, esp
  loc_005C85C3: sub esp, 0000000Ch
  loc_005C85C6: push 00403B36h ; __vbaExceptHandler
  loc_005C85CB: mov eax, fs:[00000000h]
  loc_005C85D1: push eax
  loc_005C85D2: mov fs:[00000000h], esp
  loc_005C85D9: sub esp, 00000090h
  loc_005C85DF: push ebx
  loc_005C85E0: push esi
  loc_005C85E1: push edi
  loc_005C85E2: mov var_C, esp
  loc_005C85E5: mov var_8, 00402FF8h
  loc_005C85EC: mov esi, Me
  loc_005C85EF: mov eax, esi
  loc_005C85F1: and eax, 00000001h
  loc_005C85F4: mov var_4, eax
  loc_005C85F7: and esi, FFFFFFFEh
  loc_005C85FA: push esi
  loc_005C85FB: mov Me, esi
  loc_005C85FE: mov ecx, [esi]
  loc_005C8600: call [ecx+00000004h]
  loc_005C8603: lea edi, var_1C
  loc_005C8606: mov ecx, 0000000Ah
  loc_005C860B: push edi
  loc_005C860C: mov var_64, ecx
  loc_005C860F: sub esp, 00000010h
  loc_005C8612: mov eax, 80020004h
  loc_005C8617: mov edi, esp
  loc_005C8619: mov var_5C, eax
  loc_005C861C: sub esp, 00000010h
  loc_005C861F: mov edx, [0061A13Ch]
  loc_005C8625: mov [edi], ecx
  loc_005C8627: mov ecx, var_70
  loc_005C862A: xor ebx, ebx
  loc_005C862C: mov [edi+00000004h], ecx
  loc_005C862F: mov ecx, esp
  loc_005C8631: sub esp, 00000010h
  loc_005C8634: mov var_18, ebx
  loc_005C8637: mov [edi+00000008h], eax
  loc_005C863A: mov eax, var_68
  loc_005C863D: mov var_1C, ebx
  loc_005C8640: mov var_20, ebx
  loc_005C8643: mov [edi+0000000Ch], eax
  loc_005C8646: mov eax, var_64
  loc_005C8649: mov [ecx], eax
  loc_005C864B: mov eax, var_60
  loc_005C864E: mov var_24, ebx
  loc_005C8651: mov var_34, ebx
  loc_005C8654: mov [ecx+00000004h], eax
  loc_005C8657: mov eax, var_5C
  loc_005C865A: mov var_44, ebx
  loc_005C865D: mov var_78, ebx
  loc_005C8660: mov [ecx+00000008h], eax
  loc_005C8663: mov eax, var_58
  loc_005C8666: mov var_7C, ebx
  loc_005C8669: mov edx, [edx]
  loc_005C866B: mov [ecx+0000000Ch], eax
  loc_005C866E: mov ecx, esp
  loc_005C8670: mov eax, 00000003h
  loc_005C8675: push 00431E9Ch ; "Select * From Login"
  loc_005C867A: mov [ecx], eax
  loc_005C867C: mov eax, var_50
  loc_005C867F: mov [ecx+00000004h], eax
  loc_005C8682: mov eax, 00000004h
  loc_005C8687: mov [ecx+00000008h], eax
  loc_005C868A: mov eax, var_48
  loc_005C868D: mov [ecx+0000000Ch], eax
  loc_005C8690: mov ecx, [0061A13Ch]
  loc_005C8696: push ecx
  loc_005C8697: call [edx+000000BCh]
  loc_005C869D: cmp eax, ebx
  loc_005C869F: fnclex
  loc_005C86A1: jge 005C86BBh
  loc_005C86A3: mov edx, [0061A13Ch]
  loc_005C86A9: push 000000BCh
  loc_005C86AE: push 0041E928h
  loc_005C86B3: push edx
  loc_005C86B4: push eax
  loc_005C86B5: call [00401074h] ; __vbaHresultCheckObj
  loc_005C86BB: mov eax, var_1C
  loc_005C86BE: lea edi, [esi+00000034h]
  loc_005C86C1: push eax
  loc_005C86C2: push edi
  loc_005C86C3: call [004010B8h] ; __vbaObjSetAddref
  loc_005C86C9: lea ecx, var_1C
  loc_005C86CC: call [004012B0h] ; __vbaFreeObj
  loc_005C86D2: mov eax, [edi]
  loc_005C86D4: lea edx, var_78
  loc_005C86D7: push edx
  loc_005C86D8: push eax
  loc_005C86D9: mov ecx, [eax]
  loc_005C86DB: call [ecx+00000020h]
  loc_005C86DE: cmp eax, ebx
  loc_005C86E0: fnclex
  loc_005C86E2: jge 005C86F5h
  loc_005C86E4: mov ecx, [edi]
  loc_005C86E6: push 00000020h
  loc_005C86E8: push 0041E938h
  loc_005C86ED: push ecx
  loc_005C86EE: push eax
  loc_005C86EF: call [00401074h] ; __vbaHresultCheckObj
  loc_005C86F5: mov eax, [edi]
  loc_005C86F7: lea ecx, var_7C
  loc_005C86FA: push ecx
  loc_005C86FB: push eax
  loc_005C86FC: mov edx, [eax]
  loc_005C86FE: call [edx+00000034h]
  loc_005C8701: cmp eax, ebx
  loc_005C8703: fnclex
  loc_005C8705: jge 005C8718h
  loc_005C8707: mov edx, [edi]
  loc_005C8709: push 00000034h
  loc_005C870B: push 0041E938h
  loc_005C8710: push edx
  loc_005C8711: push eax
  loc_005C8712: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8718: xor eax, eax
  loc_005C871A: cmp var_7C, bx
  loc_005C871E: setz al
  loc_005C8721: xor ecx, ecx
  loc_005C8723: cmp var_78, bx
  loc_005C8727: setz cl
  loc_005C872A: or eax, ecx
  loc_005C872C: jz 005C896Dh
  loc_005C8732: mov edx, [esi]
  loc_005C8734: push esi
  loc_005C8735: call [edx+00000308h]
  loc_005C873B: push eax
  loc_005C873C: lea eax, var_24
  loc_005C873F: push eax
  loc_005C8740: call [004010A0h] ; __vbaObjSet
  loc_005C8746: mov var_8C, eax
  loc_005C874C: mov eax, [edi]
  loc_005C874E: lea edx, var_1C
  loc_005C8751: mov ecx, [eax]
  loc_005C8753: push edx
  loc_005C8754: push eax
  loc_005C8755: call [ecx+000000B4h]
  loc_005C875B: cmp eax, ebx
  loc_005C875D: fnclex
  loc_005C875F: jge 005C8775h
  loc_005C8761: mov ecx, [edi]
  loc_005C8763: push 000000B4h
  loc_005C8768: push 0041E938h
  loc_005C876D: push ecx
  loc_005C876E: push eax
  loc_005C876F: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8775: mov ecx, var_1C
  loc_005C8778: mov eax, 00000008h
  loc_005C877D: mov var_84, ecx
  loc_005C8783: mov edx, [ecx]
  loc_005C8785: lea ecx, var_20
  loc_005C8788: push ecx
  loc_005C8789: sub esp, 00000010h
  loc_005C878C: mov ecx, esp
  loc_005C878E: mov [ecx], eax
  loc_005C8790: mov eax, var_50
  loc_005C8793: mov [ecx+00000004h], eax
  loc_005C8796: mov eax, 00431EC8h ; "UserName"
  loc_005C879B: mov [ecx+00000008h], eax
  loc_005C879E: mov eax, var_48
  loc_005C87A1: mov [ecx+0000000Ch], eax
  loc_005C87A4: mov ecx, var_1C
  loc_005C87A7: push ecx
  loc_005C87A8: call [edx+00000030h]
  loc_005C87AB: cmp eax, ebx
  loc_005C87AD: fnclex
  loc_005C87AF: jge 005C87C6h
  loc_005C87B1: mov edx, var_84
  loc_005C87B7: push 00000030h
  loc_005C87B9: push 0041EA14h ; "S"
  loc_005C87BE: push edx
  loc_005C87BF: push eax
  loc_005C87C0: call [00401074h] ; __vbaHresultCheckObj
  loc_005C87C6: mov eax, var_20
  loc_005C87C9: lea ecx, var_44
  loc_005C87CC: mov var_2C, eax
  loc_005C87CF: lea eax, var_34
  loc_005C87D2: push eax
  loc_005C87D3: push ecx
  loc_005C87D4: mov var_20, ebx
  loc_005C87D7: mov var_34, 00000009h
  loc_005C87DE: call [004010D4h] ; rtcTrimVar
  loc_005C87E4: mov edx, var_8C
  loc_005C87EA: lea eax, var_44
  loc_005C87ED: lea ecx, var_18
  loc_005C87F0: push eax
  loc_005C87F1: mov ebx, [edx]
  loc_005C87F3: push ecx
  loc_005C87F4: call [004011B0h] ; __vbaStrVarVal
  loc_005C87FA: mov edx, var_8C
  loc_005C8800: push eax
  loc_005C8801: push edx
  loc_005C8802: call [ebx+000000A4h]
  loc_005C8808: xor ebx, ebx
  loc_005C880A: cmp eax, ebx
  loc_005C880C: fnclex
  loc_005C880E: jge 005C8828h
  loc_005C8810: mov ecx, var_8C
  loc_005C8816: push 000000A4h
  loc_005C881B: push 0041E5E8h
  loc_005C8820: push ecx
  loc_005C8821: push eax
  loc_005C8822: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8828: lea ecx, var_18
  loc_005C882B: call [004012ACh] ; __vbaFreeStr
  loc_005C8831: lea edx, var_24
  loc_005C8834: lea eax, var_1C
  loc_005C8837: push edx
  loc_005C8838: push eax
  loc_005C8839: push 00000002h
  loc_005C883B: call [00401040h] ; __vbaFreeObjList
  loc_005C8841: lea ecx, var_44
  loc_005C8844: lea edx, var_34
  loc_005C8847: push ecx
  loc_005C8848: push edx
  loc_005C8849: push 00000002h
  loc_005C884B: call [00401038h] ; __vbaFreeVarList
  loc_005C8851: mov eax, [esi]
  loc_005C8853: add esp, 00000018h
  loc_005C8856: push esi
  loc_005C8857: call [eax+00000304h]
  loc_005C885D: lea ecx, var_24
  loc_005C8860: push eax
  loc_005C8861: push ecx
  loc_005C8862: call [004010A0h] ; __vbaObjSet
  loc_005C8868: mov var_8C, eax
  loc_005C886E: mov eax, [edi]
  loc_005C8870: lea ecx, var_1C
  loc_005C8873: mov edx, [eax]
  loc_005C8875: push ecx
  loc_005C8876: push eax
  loc_005C8877: call [edx+000000B4h]
  loc_005C887D: cmp eax, ebx
  loc_005C887F: fnclex
  loc_005C8881: jge 005C8897h
  loc_005C8883: mov edx, [edi]
  loc_005C8885: push 000000B4h
  loc_005C888A: push 0041E938h
  loc_005C888F: push edx
  loc_005C8890: push eax
  loc_005C8891: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8897: lea esi, var_20
  loc_005C889A: mov eax, var_1C
  loc_005C889D: push esi
  loc_005C889E: mov ecx, 00000008h
  loc_005C88A3: sub esp, 00000010h
  loc_005C88A6: mov edx, [eax]
  loc_005C88A8: mov esi, esp
  loc_005C88AA: mov var_84, eax
  loc_005C88B0: push eax
  loc_005C88B1: mov [esi], ecx
  loc_005C88B3: mov ecx, var_50
  loc_005C88B6: mov [esi+00000004h], ecx
  loc_005C88B9: mov ecx, 00431EE0h ; "Password"
  loc_005C88BE: mov [esi+00000008h], ecx
  loc_005C88C1: mov ecx, var_48
  loc_005C88C4: mov [esi+0000000Ch], ecx
  loc_005C88C7: call [edx+00000030h]
  loc_005C88CA: cmp eax, ebx
  loc_005C88CC: fnclex
  loc_005C88CE: jge 005C88E5h
  loc_005C88D0: mov edx, var_84
  loc_005C88D6: push 00000030h
  loc_005C88D8: push 0041EA14h ; "S"
  loc_005C88DD: push edx
  loc_005C88DE: push eax
  loc_005C88DF: call [00401074h] ; __vbaHresultCheckObj
  loc_005C88E5: mov eax, var_20
  loc_005C88E8: lea ecx, var_44
  loc_005C88EB: mov var_2C, eax
  loc_005C88EE: lea eax, var_34
  loc_005C88F1: push eax
  loc_005C88F2: push ecx
  loc_005C88F3: mov var_20, ebx
  loc_005C88F6: mov var_34, 00000009h
  loc_005C88FD: call [004010D4h] ; rtcTrimVar
  loc_005C8903: mov edx, var_8C
  loc_005C8909: lea eax, var_44
  loc_005C890C: lea ecx, var_18
  loc_005C890F: push eax
  loc_005C8910: mov esi, [edx]
  loc_005C8912: push ecx
  loc_005C8913: call [004011B0h] ; __vbaStrVarVal
  loc_005C8919: mov edx, esi
  loc_005C891B: mov esi, var_8C
  loc_005C8921: push eax
  loc_005C8922: push esi
  loc_005C8923: call [edx+000000A4h]
  loc_005C8929: cmp eax, ebx
  loc_005C892B: fnclex
  loc_005C892D: jge 005C8941h
  loc_005C892F: push 000000A4h
  loc_005C8934: push 0041E5E8h
  loc_005C8939: push esi
  loc_005C893A: push eax
  loc_005C893B: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8941: lea ecx, var_18
  loc_005C8944: call [004012ACh] ; __vbaFreeStr
  loc_005C894A: lea eax, var_24
  loc_005C894D: lea ecx, var_1C
  loc_005C8950: push eax
  loc_005C8951: push ecx
  loc_005C8952: push 00000002h
  loc_005C8954: call [00401040h] ; __vbaFreeObjList
  loc_005C895A: lea edx, var_44
  loc_005C895D: lea eax, var_34
  loc_005C8960: push edx
  loc_005C8961: push eax
  loc_005C8962: push 00000002h
  loc_005C8964: call [00401038h] ; __vbaFreeVarList
  loc_005C896A: add esp, 00000018h
  loc_005C896D: mov eax, [edi]
  loc_005C896F: push eax
  loc_005C8970: mov ecx, [eax]
  loc_005C8972: call [ecx+000000C4h]
  loc_005C8978: cmp eax, ebx
  loc_005C897A: fnclex
  loc_005C897C: jge 005C8992h
  loc_005C897E: mov edx, [edi]
  loc_005C8980: push 000000C4h
  loc_005C8985: push 0041E938h
  loc_005C898A: push edx
  loc_005C898B: push eax
  loc_005C898C: call [00401074h] ; __vbaHresultCheckObj
  loc_005C8992: push 0041E938h
  loc_005C8997: push ebx
  loc_005C8998: call [00401274h] ; __vbaCastObj
  loc_005C899E: push eax
  loc_005C899F: lea eax, var_1C
  loc_005C89A2: push eax
  loc_005C89A3: call [004010A0h] ; __vbaObjSet
  loc_005C89A9: push eax
  loc_005C89AA: push edi
  loc_005C89AB: call [004010B8h] ; __vbaObjSetAddref
  loc_005C89B1: lea ecx, var_1C
  loc_005C89B4: call [004012B0h] ; __vbaFreeObj
  loc_005C89BA: mov var_4, ebx
  loc_005C89BD: push 005C89F6h
  loc_005C89C2: jmp 005C89F5h
  loc_005C89C4: lea ecx, var_18
  loc_005C89C7: call [004012ACh] ; __vbaFreeStr
  loc_005C89CD: lea ecx, var_24
  loc_005C89D0: lea edx, var_20
  loc_005C89D3: push ecx
  loc_005C89D4: lea eax, var_1C
  loc_005C89D7: push edx
  loc_005C89D8: push eax
  loc_005C89D9: push 00000003h
  loc_005C89DB: call [00401040h] ; __vbaFreeObjList
  loc_005C89E1: lea ecx, var_44
  loc_005C89E4: lea edx, var_34
  loc_005C89E7: push ecx
  loc_005C89E8: push edx
  loc_005C89E9: push 00000002h
  loc_005C89EB: call [00401038h] ; __vbaFreeVarList
  loc_005C89F1: add esp, 0000001Ch
  loc_005C89F4: ret
  loc_005C89F5: ret
  loc_005C89F6: mov eax, Me
  loc_005C89F9: push eax
  loc_005C89FA: mov ecx, [eax]
  loc_005C89FC: call [ecx+00000008h]
  loc_005C89FF: mov eax, var_4
  loc_005C8A02: mov ecx, var_14
  loc_005C8A05: pop edi
  loc_005C8A06: pop esi
  loc_005C8A07: mov fs:[00000000h], ecx
  loc_005C8A0E: pop ebx
  loc_005C8A0F: mov esp, ebp
  loc_005C8A11: pop ebp
  loc_005C8A12: retn 0004h
End Sub
