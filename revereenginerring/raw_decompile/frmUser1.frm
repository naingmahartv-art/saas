VERSION 5.00
Begin VB.Form frmUser1
  Caption = "User Name && Login Password ( Advance Filter )"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 1 'Fixed Single
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 435
  ClientWidth = 5325
  ClientHeight = 2535
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdCancel
    Caption = "E&xit"
    Left = 3285
    Top = 1845
    Width = 960
    Height = 375
    TabIndex = 5
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 2250
    Top = 1845
    Width = 960
    Height = 375
    TabIndex = 4
  End
  Begin VB.TextBox txtPassword
    Left = 2250
    Top = 900
    Width = 1815
    Height = 330
    TabIndex = 3
    MaxLength = 12
  End
  Begin VB.TextBox txtUserName
    Left = 2250
    Top = 495
    Width = 1815
    Height = 330
    TabIndex = 1
    MaxLength = 12
  End
  Begin VB.Label Label2
    Caption = "Password"
    ForeColor = &HFFFFFF&
    Left = 1125
    Top = 945
    Width = 1095
    Height = 330
    TabIndex = 2
    BackStyle = 0 'Transparent
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
  Begin VB.Label Label1
    Caption = "User Name"
    ForeColor = &HFFFFFF&
    Left = 1125
    Top = 540
    Width = 1095
    Height = 330
    TabIndex = 0
    BackStyle = 0 'Transparent
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
  Begin VB.Shape Shape1
    BackColor = &H808000&
    Left = 405
    Top = 270
    Width = 4515
    Height = 1275
    BackStyle = 1 'Opaque
  End
End

Attribute VB_Name = "frmUser1"


Private Sub txtUserName_KeyPress(KeyAscii As Integer) '606DE0
  loc_00606DE0: push ebp
  loc_00606DE1: mov ebp, esp
  loc_00606DE3: sub esp, 0000000Ch
  loc_00606DE6: push 00403B36h ; __vbaExceptHandler
  loc_00606DEB: mov eax, fs:[00000000h]
  loc_00606DF1: push eax
  loc_00606DF2: mov fs:[00000000h], esp
  loc_00606DF9: sub esp, 00000014h
  loc_00606DFC: push ebx
  loc_00606DFD: push esi
  loc_00606DFE: push edi
  loc_00606DFF: mov var_C, esp
  loc_00606E02: mov var_8, 004035F8h
  loc_00606E09: mov esi, Me
  loc_00606E0C: mov eax, esi
  loc_00606E0E: and eax, 00000001h
  loc_00606E11: mov var_4, eax
  loc_00606E14: and esi, FFFFFFFEh
  loc_00606E17: push esi
  loc_00606E18: mov Me, esi
  loc_00606E1B: mov ecx, [esi]
  loc_00606E1D: call [ecx+00000004h]
  loc_00606E20: mov edx, KeyAscii
  loc_00606E23: xor edi, edi
  loc_00606E25: mov var_18, edi
  loc_00606E28: cmp [edx], 000Dh
  loc_00606E2C: jnz 00606E6Eh
  loc_00606E2E: mov eax, [esi]
  loc_00606E30: push esi
  loc_00606E31: call [eax+00000304h]
  loc_00606E37: lea ecx, var_18
  loc_00606E3A: push eax
  loc_00606E3B: push ecx
  loc_00606E3C: call [004010A0h] ; __vbaObjSet
  loc_00606E42: mov esi, eax
  loc_00606E44: push esi
  loc_00606E45: mov edx, [esi]
  loc_00606E47: call [edx+00000204h]
  loc_00606E4D: cmp eax, edi
  loc_00606E4F: fnclex
  loc_00606E51: jge 00606E65h
  loc_00606E53: push 00000204h
  loc_00606E58: push 0041E5E8h
  loc_00606E5D: push esi
  loc_00606E5E: push eax
  loc_00606E5F: call [00401074h] ; __vbaHresultCheckObj
  loc_00606E65: lea ecx, var_18
  loc_00606E68: call [004012B0h] ; __vbaFreeObj
  loc_00606E6E: mov var_4, edi
  loc_00606E71: push 00606E83h
  loc_00606E76: jmp 00606E82h
  loc_00606E78: lea ecx, var_18
  loc_00606E7B: call [004012B0h] ; __vbaFreeObj
  loc_00606E81: ret
  loc_00606E82: ret
  loc_00606E83: mov eax, Me
  loc_00606E86: push eax
  loc_00606E87: mov ecx, [eax]
  loc_00606E89: call [ecx+00000008h]
  loc_00606E8C: mov eax, var_4
  loc_00606E8F: mov ecx, var_14
  loc_00606E92: pop edi
  loc_00606E93: pop esi
  loc_00606E94: mov fs:[00000000h], ecx
  loc_00606E9B: pop ebx
  loc_00606E9C: mov esp, ebp
  loc_00606E9E: pop ebp
  loc_00606E9F: retn 0008h
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer) '606D10
  loc_00606D10: push ebp
  loc_00606D11: mov ebp, esp
  loc_00606D13: sub esp, 0000000Ch
  loc_00606D16: push 00403B36h ; __vbaExceptHandler
  loc_00606D1B: mov eax, fs:[00000000h]
  loc_00606D21: push eax
  loc_00606D22: mov fs:[00000000h], esp
  loc_00606D29: sub esp, 00000014h
  loc_00606D2C: push ebx
  loc_00606D2D: push esi
  loc_00606D2E: push edi
  loc_00606D2F: mov var_C, esp
  loc_00606D32: mov var_8, 004035E8h
  loc_00606D39: mov esi, Me
  loc_00606D3C: mov eax, esi
  loc_00606D3E: and eax, 00000001h
  loc_00606D41: mov var_4, eax
  loc_00606D44: and esi, FFFFFFFEh
  loc_00606D47: push esi
  loc_00606D48: mov Me, esi
  loc_00606D4B: mov ecx, [esi]
  loc_00606D4D: call [ecx+00000004h]
  loc_00606D50: mov edx, KeyAscii
  loc_00606D53: xor edi, edi
  loc_00606D55: mov var_18, edi
  loc_00606D58: cmp [edx], 000Dh
  loc_00606D5C: jnz 00606D9Eh
  loc_00606D5E: mov eax, [esi]
  loc_00606D60: push esi
  loc_00606D61: call [eax+00000300h]
  loc_00606D67: lea ecx, var_18
  loc_00606D6A: push eax
  loc_00606D6B: push ecx
  loc_00606D6C: call [004010A0h] ; __vbaObjSet
  loc_00606D72: mov esi, eax
  loc_00606D74: push esi
  loc_00606D75: mov edx, [esi]
  loc_00606D77: call [edx+000001A4h]
  loc_00606D7D: cmp eax, edi
  loc_00606D7F: fnclex
  loc_00606D81: jge 00606D95h
  loc_00606D83: push 000001A4h
  loc_00606D88: push 0041EAACh
  loc_00606D8D: push esi
  loc_00606D8E: push eax
  loc_00606D8F: call [00401074h] ; __vbaHresultCheckObj
  loc_00606D95: lea ecx, var_18
  loc_00606D98: call [004012B0h] ; __vbaFreeObj
  loc_00606D9E: mov var_4, edi
  loc_00606DA1: push 00606DB3h
  loc_00606DA6: jmp 00606DB2h
  loc_00606DA8: lea ecx, var_18
  loc_00606DAB: call [004012B0h] ; __vbaFreeObj
  loc_00606DB1: ret
  loc_00606DB2: ret
  loc_00606DB3: mov eax, Me
  loc_00606DB6: push eax
  loc_00606DB7: mov ecx, [eax]
  loc_00606DB9: call [ecx+00000008h]
  loc_00606DBC: mov eax, var_4
  loc_00606DBF: mov ecx, var_14
  loc_00606DC2: pop edi
  loc_00606DC3: pop esi
  loc_00606DC4: mov fs:[00000000h], ecx
  loc_00606DCB: pop ebx
  loc_00606DCC: mov esp, ebp
  loc_00606DCE: pop ebp
  loc_00606DCF: retn 0008h
End Sub

Private Sub cmdCancel_Click() '605F80
  loc_00605F80: push ebp
  loc_00605F81: mov ebp, esp
  loc_00605F83: sub esp, 0000000Ch
  loc_00605F86: push 00403B36h ; __vbaExceptHandler
  loc_00605F8B: mov eax, fs:[00000000h]
  loc_00605F91: push eax
  loc_00605F92: mov fs:[00000000h], esp
  loc_00605F99: sub esp, 00000018h
  loc_00605F9C: push ebx
  loc_00605F9D: push esi
  loc_00605F9E: push edi
  loc_00605F9F: mov var_C, esp
  loc_00605FA2: mov var_8, 00403598h
  loc_00605FA9: mov edi, Me
  loc_00605FAC: mov eax, edi
  loc_00605FAE: and eax, 00000001h
  loc_00605FB1: mov var_4, eax
  loc_00605FB4: and edi, FFFFFFFEh
  loc_00605FB7: push edi
  loc_00605FB8: mov Me, edi
  loc_00605FBB: mov ecx, [edi]
  loc_00605FBD: call [ecx+00000004h]
  loc_00605FC0: mov eax, [0061B394h]
  loc_00605FC5: xor ebx, ebx
  loc_00605FC7: cmp eax, ebx
  loc_00605FC9: mov var_18, ebx
  loc_00605FCC: jnz 00605FDEh
  loc_00605FCE: push 0061B394h
  loc_00605FD3: push 0041E4A0h
  loc_00605FD8: call [004011DCh] ; __vbaNew2
  loc_00605FDE: mov esi, [0061B394h]
  loc_00605FE4: lea eax, var_18
  loc_00605FE7: push edi
  loc_00605FE8: push eax
  loc_00605FE9: mov edx, [esi]
  loc_00605FEB: mov var_2C, edx
  loc_00605FEE: call [004010B8h] ; __vbaObjSetAddref
  loc_00605FF4: mov ecx, var_2C
  loc_00605FF7: push eax
  loc_00605FF8: push esi
  loc_00605FF9: call [ecx+00000010h]
  loc_00605FFC: cmp eax, ebx
  loc_00605FFE: fnclex
  loc_00606000: jge 00606011h
  loc_00606002: push 00000010h
  loc_00606004: push 0041E490h
  loc_00606009: push esi
  loc_0060600A: push eax
  loc_0060600B: call [00401074h] ; __vbaHresultCheckObj
  loc_00606011: lea ecx, var_18
  loc_00606014: call [004012B0h] ; __vbaFreeObj
  loc_0060601A: mov var_4, ebx
  loc_0060601D: push 0060602Fh
  loc_00606022: jmp 0060602Eh
  loc_00606024: lea ecx, var_18
  loc_00606027: call [004012B0h] ; __vbaFreeObj
  loc_0060602D: ret
  loc_0060602E: ret
  loc_0060602F: mov eax, Me
  loc_00606032: push eax
  loc_00606033: mov edx, [eax]
  loc_00606035: call [edx+00000008h]
  loc_00606038: mov eax, var_4
  loc_0060603B: mov ecx, var_14
  loc_0060603E: pop edi
  loc_0060603F: pop esi
  loc_00606040: mov fs:[00000000h], ecx
  loc_00606047: pop ebx
  loc_00606048: mov esp, ebp
  loc_0060604A: pop ebp
  loc_0060604B: retn 0004h
End Sub

Private Sub cmdSave_Click() '606050
  loc_00606050: push ebp
  loc_00606051: mov ebp, esp
  loc_00606053: sub esp, 00000014h
  loc_00606056: push 00403B36h ; __vbaExceptHandler
  loc_0060605B: mov eax, fs:[00000000h]
  loc_00606061: push eax
  loc_00606062: mov fs:[00000000h], esp
  loc_00606069: sub esp, 000000DCh
  loc_0060606F: push ebx
  loc_00606070: push esi
  loc_00606071: push edi
  loc_00606072: mov var_14, esp
  loc_00606075: mov var_10, 004035A8h
  loc_0060607C: mov eax, Me
  loc_0060607F: mov ecx, eax
  loc_00606081: and ecx, 00000001h
  loc_00606084: mov var_C, ecx
  loc_00606087: and al, FEh
  loc_00606089: mov Me, eax
  loc_0060608C: xor esi, esi
  loc_0060608E: mov var_8, esi
  loc_00606091: mov edx, [eax]
  loc_00606093: push eax
  loc_00606094: call [edx+00000004h]
  loc_00606097: mov var_20, esi
  loc_0060609A: mov var_24, esi
  loc_0060609D: mov var_28, esi
  loc_006060A0: mov var_2C, esi
  loc_006060A3: mov var_3C, esi
  loc_006060A6: mov var_4C, esi
  loc_006060A9: mov var_5C, esi
  loc_006060AC: mov var_6C, esi
  loc_006060AF: mov var_7C, esi
  loc_006060B2: mov var_8C, esi
  loc_006060B8: mov var_9C, esi
  loc_006060BE: mov var_B0, esi
  loc_006060C4: mov var_B4, esi
  loc_006060CA: push 00000001h
  loc_006060CC: call [004010A8h] ; __vbaOnError
  loc_006060D2: mov eax, 80020004h
  loc_006060D7: mov ecx, 0000000Ah
  loc_006060DC: mov edx, eax
  loc_006060DE: mov esi, ecx
  loc_006060E0: mov var_74, 00000002h
  loc_006060E7: mov var_7C, 00000003h
  loc_006060EE: mov edi, [0061A13Ch]
  loc_006060F4: mov edi, [edi]
  loc_006060F6: lea ebx, var_28
  loc_006060F9: push ebx
  loc_006060FA: sub esp, 00000010h
  loc_006060FD: mov ebx, esp
  loc_006060FF: mov [ebx], ecx
  loc_00606101: mov ecx, var_98
  loc_00606107: mov [ebx+00000004h], ecx
  loc_0060610A: mov [ebx+00000008h], eax
  loc_0060610D: mov eax, var_90
  loc_00606113: mov [ebx+0000000Ch], eax
  loc_00606116: sub esp, 00000010h
  loc_00606119: mov ecx, esp
  loc_0060611B: mov [ecx], esi
  loc_0060611D: mov eax, var_88
  loc_00606123: mov [ecx+00000004h], eax
  loc_00606126: mov [ecx+00000008h], edx
  loc_00606129: mov edx, var_80
  loc_0060612C: mov [ecx+0000000Ch], edx
  loc_0060612F: sub esp, 00000010h
  loc_00606132: mov eax, esp
  loc_00606134: mov ecx, var_7C
  loc_00606137: mov [eax], ecx
  loc_00606139: mov edx, var_78
  loc_0060613C: mov [eax+00000004h], edx
  loc_0060613F: mov ecx, var_74
  loc_00606142: mov [eax+00000008h], ecx
  loc_00606145: mov edx, var_70
  loc_00606148: mov [eax+0000000Ch], edx
  loc_0060614B: push 00433958h ; "Select * From LoginAdvUser"
  loc_00606150: mov eax, [0061A13Ch]
  loc_00606155: push eax
  loc_00606156: call [edi+000000BCh]
  loc_0060615C: fnclex
  loc_0060615E: test eax, eax
  loc_00606160: jge 0060617Eh
  loc_00606162: push 000000BCh
  loc_00606167: push 0041E928h
  loc_0060616C: mov ecx, [0061A13Ch]
  loc_00606172: push ecx
  loc_00606173: push eax
  loc_00606174: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0060617A: call __vbaHresultCheckObj
  loc_0060617C: jmp 00606184h
  loc_0060617E: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00606184: mov eax, var_28
  loc_00606187: mov var_28, 00000000h
  loc_0060618E: push eax
  loc_0060618F: lea edx, var_20
  loc_00606192: push edx
  loc_00606193: call [004010A0h] ; __vbaObjSet
  loc_00606199: mov eax, var_20
  loc_0060619C: mov ecx, [eax]
  loc_0060619E: lea edx, var_B0
  loc_006061A4: push edx
  loc_006061A5: push eax
  loc_006061A6: call [ecx+00000020h]
  loc_006061A9: fnclex
  loc_006061AB: test eax, eax
  loc_006061AD: jge 006061BDh
  loc_006061AF: push 00000020h
  loc_006061B1: push 0041E938h
  loc_006061B6: mov ecx, var_20
  loc_006061B9: push ecx
  loc_006061BA: push eax
  loc_006061BB: call __vbaHresultCheckObj
  loc_006061BD: mov eax, var_20
  loc_006061C0: mov edx, [eax]
  loc_006061C2: lea ecx, var_B4
  loc_006061C8: push ecx
  loc_006061C9: push eax
  loc_006061CA: call [edx+00000034h]
  loc_006061CD: fnclex
  loc_006061CF: test eax, eax
  loc_006061D1: jge 006061E1h
  loc_006061D3: push 00000034h
  loc_006061D5: push 0041E938h
  loc_006061DA: mov edx, var_20
  loc_006061DD: push edx
  loc_006061DE: push eax
  loc_006061DF: call __vbaHresultCheckObj
  loc_006061E1: mov eax, var_20
  loc_006061E4: mov ecx, [eax]
  loc_006061E6: lea edx, var_28
  loc_006061E9: push edx
  loc_006061EA: push eax
  loc_006061EB: call [ecx+000000B4h]
  loc_006061F1: fnclex
  loc_006061F3: test eax, eax
  loc_006061F5: jge 00606208h
  loc_006061F7: push 000000B4h
  loc_006061FC: push 0041E938h
  loc_00606201: mov ecx, var_20
  loc_00606204: push ecx
  loc_00606205: push eax
  loc_00606206: call __vbaHresultCheckObj
  loc_00606208: mov eax, var_28
  loc_0060620B: mov esi, eax
  loc_0060620D: mov ecx, 00431EC8h ; "UserName"
  loc_00606212: mov var_74, ecx
  loc_00606215: mov edx, 00000008h
  loc_0060621A: mov var_7C, edx
  loc_0060621D: mov edi, [eax]
  loc_0060621F: lea ebx, var_2C
  loc_00606222: push ebx
  loc_00606223: sub esp, 00000010h
  loc_00606226: mov ebx, esp
  loc_00606228: mov [ebx], edx
  loc_0060622A: mov edx, var_78
  loc_0060622D: mov [ebx+00000004h], edx
  loc_00606230: mov [ebx+00000008h], ecx
  loc_00606233: mov ecx, var_70
  loc_00606236: mov [ebx+0000000Ch], ecx
  loc_00606239: push eax
  loc_0060623A: call [edi+00000030h]
  loc_0060623D: fnclex
  loc_0060623F: xor ebx, ebx
  loc_00606241: cmp eax, ebx
  loc_00606243: jge 00606258h
  loc_00606245: push 00000030h
  loc_00606247: push 0041EA14h ; "S"
  loc_0060624C: push esi
  loc_0060624D: push eax
  loc_0060624E: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00606254: call edi
  loc_00606256: jmp 0060625Eh
  loc_00606258: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0060625E: mov eax, var_2C
  loc_00606261: mov var_2C, ebx
  loc_00606264: mov var_34, eax
  loc_00606267: mov var_3C, 00000009h
  loc_0060626E: lea edx, var_3C
  loc_00606271: push edx
  loc_00606272: call [00401118h] ; rtcIsNull
  loc_00606278: mov si, ax
  loc_0060627B: not esi
  loc_0060627D: mov eax, var_B4
  loc_00606283: and eax, var_B0
  loc_00606289: not eax
  loc_0060628B: and esi, eax
  loc_0060628D: lea ecx, var_28
  loc_00606290: call [004012B0h] ; __vbaFreeObj
  loc_00606296: lea ecx, var_3C
  loc_00606299: call [00401020h] ; __vbaFreeVar
  loc_0060629F: cmp si, bx
  loc_006062A2: mov eax, var_20
  loc_006062A5: jz 0060647Ch
  loc_006062AB: mov ecx, [eax]
  loc_006062AD: push eax
  loc_006062AE: call [ecx+000000D0h]
  loc_006062B4: fnclex
  loc_006062B6: cmp eax, ebx
  loc_006062B8: jge 006062CBh
  loc_006062BA: push 000000D0h
  loc_006062BF: push 0041E938h
  loc_006062C4: mov edx, var_20
  loc_006062C7: push edx
  loc_006062C8: push eax
  loc_006062C9: call edi
  loc_006062CB: mov eax, Me
  loc_006062CE: mov ecx, [eax]
  loc_006062D0: push eax
  loc_006062D1: call [ecx+00000308h]
  loc_006062D7: push eax
  loc_006062D8: lea edx, var_28
  loc_006062DB: push edx
  loc_006062DC: call [004010A0h] ; __vbaObjSet
  loc_006062E2: mov esi, eax
  loc_006062E4: mov eax, [esi]
  loc_006062E6: lea ecx, var_24
  loc_006062E9: push ecx
  loc_006062EA: push esi
  loc_006062EB: call [eax+000000A0h]
  loc_006062F1: fnclex
  loc_006062F3: cmp eax, ebx
  loc_006062F5: jge 00606305h
  loc_006062F7: push 000000A0h
  loc_006062FC: push 0041E5E8h
  loc_00606301: push esi
  loc_00606302: push eax
  loc_00606303: call edi
  loc_00606305: mov eax, var_24
  loc_00606308: mov var_24, ebx
  loc_0060630B: mov var_34, eax
  loc_0060630E: mov ecx, 00000008h
  loc_00606313: mov var_3C, ecx
  loc_00606316: mov edx, 00431EC8h ; "UserName"
  loc_0060631B: mov var_74, edx
  loc_0060631E: mov esi, ecx
  loc_00606320: mov var_7C, esi
  loc_00606323: mov edi, var_20
  loc_00606326: mov edi, [edi]
  loc_00606328: sub esp, 00000010h
  loc_0060632B: mov ebx, esp
  loc_0060632D: mov [ebx], ecx
  loc_0060632F: mov ecx, var_38
  loc_00606332: mov [ebx+00000004h], ecx
  loc_00606335: mov [ebx+00000008h], eax
  loc_00606338: mov eax, var_30
  loc_0060633B: mov [ebx+0000000Ch], eax
  loc_0060633E: sub esp, 00000010h
  loc_00606341: mov ecx, esp
  loc_00606343: mov [ecx], esi
  loc_00606345: mov eax, var_78
  loc_00606348: mov [ecx+00000004h], eax
  loc_0060634B: mov [ecx+00000008h], edx
  loc_0060634E: mov edx, var_70
  loc_00606351: mov [ecx+0000000Ch], edx
  loc_00606354: mov eax, var_20
  loc_00606357: push eax
  loc_00606358: call [edi+00000128h]
  loc_0060635E: fnclex
  loc_00606360: test eax, eax
  loc_00606362: jge 00606379h
  loc_00606364: push 00000128h
  loc_00606369: push 0041E938h
  loc_0060636E: mov ecx, var_20
  loc_00606371: push ecx
  loc_00606372: push eax
  loc_00606373: call [00401074h] ; __vbaHresultCheckObj
  loc_00606379: lea ecx, var_28
  loc_0060637C: call [004012B0h] ; __vbaFreeObj
  loc_00606382: lea ecx, var_3C
  loc_00606385: call [00401020h] ; __vbaFreeVar
  loc_0060638B: mov eax, Me
  loc_0060638E: mov edx, [eax]
  loc_00606390: push eax
  loc_00606391: call [edx+00000304h]
  loc_00606397: push eax
  loc_00606398: lea eax, var_28
  loc_0060639B: push eax
  loc_0060639C: call [004010A0h] ; __vbaObjSet
  loc_006063A2: mov esi, eax
  loc_006063A4: mov ecx, [esi]
  loc_006063A6: lea edx, var_24
  loc_006063A9: push edx
  loc_006063AA: push esi
  loc_006063AB: call [ecx+000000A0h]
  loc_006063B1: fnclex
  loc_006063B3: test eax, eax
  loc_006063B5: jge 006063C9h
  loc_006063B7: push 000000A0h
  loc_006063BC: push 0041E5E8h
  loc_006063C1: push esi
  loc_006063C2: push eax
  loc_006063C3: call [00401074h] ; __vbaHresultCheckObj
  loc_006063C9: mov eax, var_24
  loc_006063CC: mov var_24, 00000000h
  loc_006063D3: mov var_34, eax
  loc_006063D6: mov ecx, 00000008h
  loc_006063DB: mov var_3C, ecx
  loc_006063DE: mov edx, 00431EE0h ; "Password"
  loc_006063E3: mov var_74, edx
  loc_006063E6: mov esi, ecx
  loc_006063E8: mov var_7C, esi
  loc_006063EB: mov edi, var_20
  loc_006063EE: mov edi, [edi]
  loc_006063F0: sub esp, 00000010h
  loc_006063F3: mov ebx, esp
  loc_006063F5: mov [ebx], ecx
  loc_006063F7: mov ecx, var_38
  loc_006063FA: mov [ebx+00000004h], ecx
  loc_006063FD: mov [ebx+00000008h], eax
  loc_00606400: mov eax, var_30
  loc_00606403: mov [ebx+0000000Ch], eax
  loc_00606406: sub esp, 00000010h
  loc_00606409: mov ecx, esp
  loc_0060640B: mov [ecx], esi
  loc_0060640D: mov eax, var_78
  loc_00606410: mov [ecx+00000004h], eax
  loc_00606413: mov [ecx+00000008h], edx
  loc_00606416: mov edx, var_70
  loc_00606419: mov [ecx+0000000Ch], edx
  loc_0060641C: mov eax, var_20
  loc_0060641F: push eax
  loc_00606420: call [edi+00000128h]
  loc_00606426: fnclex
  loc_00606428: test eax, eax
  loc_0060642A: jge 00606445h
  loc_0060642C: push 00000128h
  loc_00606431: push 0041E938h
  loc_00606436: mov ecx, var_20
  loc_00606439: push ecx
  loc_0060643A: push eax
  loc_0060643B: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00606441: call __vbaHresultCheckObj
  loc_00606443: jmp 0060644Bh
  loc_00606445: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0060644B: lea ecx, var_28
  loc_0060644E: call [004012B0h] ; __vbaFreeObj
  loc_00606454: lea ecx, var_3C
  loc_00606457: call [00401020h] ; __vbaFreeVar
  loc_0060645D: mov eax, var_20
  loc_00606460: mov edx, [eax]
  loc_00606462: push 00000000h
  loc_00606464: push 00000001h
  loc_00606466: push eax
  loc_00606467: call [edx+00000164h]
  loc_0060646D: fnclex
  loc_0060646F: test eax, eax
  loc_00606471: jge 00606655h
  loc_00606477: jmp 00606644h
  loc_0060647C: mov edx, [eax]
  loc_0060647E: push eax
  loc_0060647F: call [edx+000000C0h]
  loc_00606485: fnclex
  loc_00606487: cmp eax, ebx
  loc_00606489: jge 0060649Ch
  loc_0060648B: push 000000C0h
  loc_00606490: push 0041E938h
  loc_00606495: mov ecx, var_20
  loc_00606498: push ecx
  loc_00606499: push eax
  loc_0060649A: call edi
  loc_0060649C: mov eax, Me
  loc_0060649F: mov edx, [eax]
  loc_006064A1: push eax
  loc_006064A2: call [edx+00000308h]
  loc_006064A8: push eax
  loc_006064A9: lea eax, var_28
  loc_006064AC: push eax
  loc_006064AD: call [004010A0h] ; __vbaObjSet
  loc_006064B3: mov esi, eax
  loc_006064B5: mov ecx, [esi]
  loc_006064B7: lea edx, var_24
  loc_006064BA: push edx
  loc_006064BB: push esi
  loc_006064BC: call [ecx+000000A0h]
  loc_006064C2: fnclex
  loc_006064C4: cmp eax, ebx
  loc_006064C6: jge 006064D6h
  loc_006064C8: push 000000A0h
  loc_006064CD: push 0041E5E8h
  loc_006064D2: push esi
  loc_006064D3: push eax
  loc_006064D4: call edi
  loc_006064D6: mov eax, var_24
  loc_006064D9: mov var_24, ebx
  loc_006064DC: mov var_34, eax
  loc_006064DF: mov ecx, 00000008h
  loc_006064E4: mov var_3C, ecx
  loc_006064E7: mov edx, 00431EC8h ; "UserName"
  loc_006064EC: mov var_74, edx
  loc_006064EF: mov esi, ecx
  loc_006064F1: mov var_7C, esi
  loc_006064F4: mov edi, var_20
  loc_006064F7: mov edi, [edi]
  loc_006064F9: sub esp, 00000010h
  loc_006064FC: mov ebx, esp
  loc_006064FE: mov [ebx], ecx
  loc_00606500: mov ecx, var_38
  loc_00606503: mov [ebx+00000004h], ecx
  loc_00606506: mov [ebx+00000008h], eax
  loc_00606509: mov eax, var_30
  loc_0060650C: mov [ebx+0000000Ch], eax
  loc_0060650F: sub esp, 00000010h
  loc_00606512: mov ecx, esp
  loc_00606514: mov [ecx], esi
  loc_00606516: mov eax, var_78
  loc_00606519: mov [ecx+00000004h], eax
  loc_0060651C: mov [ecx+00000008h], edx
  loc_0060651F: mov edx, var_70
  loc_00606522: mov [ecx+0000000Ch], edx
  loc_00606525: mov eax, var_20
  loc_00606528: push eax
  loc_00606529: call [edi+00000128h]
  loc_0060652F: fnclex
  loc_00606531: test eax, eax
  loc_00606533: jge 0060654Ah
  loc_00606535: push 00000128h
  loc_0060653A: push 0041E938h
  loc_0060653F: mov ecx, var_20
  loc_00606542: push ecx
  loc_00606543: push eax
  loc_00606544: call [00401074h] ; __vbaHresultCheckObj
  loc_0060654A: lea ecx, var_28
  loc_0060654D: call [004012B0h] ; __vbaFreeObj
  loc_00606553: lea ecx, var_3C
  loc_00606556: call [00401020h] ; __vbaFreeVar
  loc_0060655C: mov eax, Me
  loc_0060655F: mov edx, [eax]
  loc_00606561: push eax
  loc_00606562: call [edx+00000304h]
  loc_00606568: push eax
  loc_00606569: lea eax, var_28
  loc_0060656C: push eax
  loc_0060656D: call [004010A0h] ; __vbaObjSet
  loc_00606573: mov esi, eax
  loc_00606575: mov ecx, [esi]
  loc_00606577: lea edx, var_24
  loc_0060657A: push edx
  loc_0060657B: push esi
  loc_0060657C: call [ecx+000000A0h]
  loc_00606582: fnclex
  loc_00606584: test eax, eax
  loc_00606586: jge 0060659Ah
  loc_00606588: push 000000A0h
  loc_0060658D: push 0041E5E8h
  loc_00606592: push esi
  loc_00606593: push eax
  loc_00606594: call [00401074h] ; __vbaHresultCheckObj
  loc_0060659A: mov eax, var_24
  loc_0060659D: mov var_24, 00000000h
  loc_006065A4: mov var_34, eax
  loc_006065A7: mov ecx, 00000008h
  loc_006065AC: mov var_3C, ecx
  loc_006065AF: mov edx, 00431EE0h ; "Password"
  loc_006065B4: mov var_74, edx
  loc_006065B7: mov esi, ecx
  loc_006065B9: mov var_7C, esi
  loc_006065BC: mov edi, var_20
  loc_006065BF: mov edi, [edi]
  loc_006065C1: sub esp, 00000010h
  loc_006065C4: mov ebx, esp
  loc_006065C6: mov [ebx], ecx
  loc_006065C8: mov ecx, var_38
  loc_006065CB: mov [ebx+00000004h], ecx
  loc_006065CE: mov [ebx+00000008h], eax
  loc_006065D1: mov eax, var_30
  loc_006065D4: mov [ebx+0000000Ch], eax
  loc_006065D7: sub esp, 00000010h
  loc_006065DA: mov ecx, esp
  loc_006065DC: mov [ecx], esi
  loc_006065DE: mov eax, var_78
  loc_006065E1: mov [ecx+00000004h], eax
  loc_006065E4: mov [ecx+00000008h], edx
  loc_006065E7: mov edx, var_70
  loc_006065EA: mov [ecx+0000000Ch], edx
  loc_006065ED: mov eax, var_20
  loc_006065F0: push eax
  loc_006065F1: call [edi+00000128h]
  loc_006065F7: fnclex
  loc_006065F9: test eax, eax
  loc_006065FB: jge 00606616h
  loc_006065FD: push 00000128h
  loc_00606602: push 0041E938h
  loc_00606607: mov ecx, var_20
  loc_0060660A: push ecx
  loc_0060660B: push eax
  loc_0060660C: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00606612: call __vbaHresultCheckObj
  loc_00606614: jmp 0060661Ch
  loc_00606616: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0060661C: lea ecx, var_28
  loc_0060661F: call [004012B0h] ; __vbaFreeObj
  loc_00606625: lea ecx, var_3C
  loc_00606628: call [00401020h] ; __vbaFreeVar
  loc_0060662E: mov eax, var_20
  loc_00606631: mov edx, [eax]
  loc_00606633: push 00000000h
  loc_00606635: push 00000001h
  loc_00606637: push eax
  loc_00606638: call [edx+00000164h]
  loc_0060663E: fnclex
  loc_00606640: test eax, eax
  loc_00606642: jge 00606655h
  loc_00606644: push 00000164h
  loc_00606649: push 0041E938h
  loc_0060664E: mov ecx, var_20
  loc_00606651: push ecx
  loc_00606652: push eax
  loc_00606653: call __vbaHresultCheckObj
  loc_00606655: mov eax, var_20
  loc_00606658: mov edx, [eax]
  loc_0060665A: push eax
  loc_0060665B: call [edx+000000C4h]
  loc_00606661: fnclex
  loc_00606663: test eax, eax
  loc_00606665: jge 00606678h
  loc_00606667: push 000000C4h
  loc_0060666C: push 0041E938h
  loc_00606671: mov ecx, var_20
  loc_00606674: push ecx
  loc_00606675: push eax
  loc_00606676: call __vbaHresultCheckObj
  loc_00606678: push 0041E938h
  loc_0060667D: push 00000000h
  loc_0060667F: call [00401274h] ; __vbaCastObj
  loc_00606685: push eax
  loc_00606686: lea edx, var_20
  loc_00606689: push edx
  loc_0060668A: call [004010A0h] ; __vbaObjSet
  loc_00606690: mov ecx, 80020004h
  loc_00606695: mov var_64, ecx
  loc_00606698: mov eax, 0000000Ah
  loc_0060669D: mov var_6C, eax
  loc_006066A0: mov var_54, ecx
  loc_006066A3: mov var_5C, eax
  loc_006066A6: mov var_44, ecx
  loc_006066A9: mov var_4C, eax
  loc_006066AC: mov var_74, 0041F378h ; "Save Successfully."
  loc_006066B3: mov var_7C, 00000008h
  loc_006066BA: lea edx, var_7C
  loc_006066BD: lea ecx, var_3C
  loc_006066C0: call [00401240h] ; __vbaVarDup
  loc_006066C6: lea eax, var_6C
  loc_006066C9: push eax
  loc_006066CA: lea ecx, var_5C
  loc_006066CD: push ecx
  loc_006066CE: lea edx, var_4C
  loc_006066D1: push edx
  loc_006066D2: push 00000040h
  loc_006066D4: lea eax, var_3C
  loc_006066D7: push eax
  loc_006066D8: call [004010A4h] ; rtcMsgBox
  loc_006066DE: lea ecx, var_6C
  loc_006066E1: push ecx
  loc_006066E2: lea edx, var_5C
  loc_006066E5: push edx
  loc_006066E6: lea eax, var_4C
  loc_006066E9: push eax
  loc_006066EA: lea ecx, var_3C
  loc_006066ED: push ecx
  loc_006066EE: jmp 00606786h
  loc_006066F3: call [00401210h] ; rtcErrObj
  loc_006066F9: push eax
  loc_006066FA: lea edx, var_28
  loc_006066FD: push edx
  loc_006066FE: call [004010A0h] ; __vbaObjSet
  loc_00606704: mov esi, eax
  loc_00606706: mov eax, [esi]
  loc_00606708: lea ecx, var_24
  loc_0060670B: push ecx
  loc_0060670C: push esi
  loc_0060670D: call [eax+0000002Ch]
  loc_00606710: fnclex
  loc_00606712: test eax, eax
  loc_00606714: jge 00606725h
  loc_00606716: push 0000002Ch
  loc_00606718: push 0042150Ch
  loc_0060671D: push esi
  loc_0060671E: push eax
  loc_0060671F: call [00401074h] ; __vbaHresultCheckObj
  loc_00606725: mov ecx, 80020004h
  loc_0060672A: mov var_64, ecx
  loc_0060672D: mov eax, 0000000Ah
  loc_00606732: mov var_6C, eax
  loc_00606735: mov var_54, ecx
  loc_00606738: mov var_5C, eax
  loc_0060673B: mov var_44, ecx
  loc_0060673E: mov var_4C, eax
  loc_00606741: mov eax, var_24
  loc_00606744: mov var_24, 00000000h
  loc_0060674B: mov var_34, eax
  loc_0060674E: mov var_3C, 00000008h
  loc_00606755: lea edx, var_6C
  loc_00606758: push edx
  loc_00606759: lea eax, var_5C
  loc_0060675C: push eax
  loc_0060675D: lea ecx, var_4C
  loc_00606760: push ecx
  loc_00606761: push 00000040h
  loc_00606763: lea edx, var_3C
  loc_00606766: push edx
  loc_00606767: call [004010A4h] ; rtcMsgBox
  loc_0060676D: lea ecx, var_28
  loc_00606770: call [004012B0h] ; __vbaFreeObj
  loc_00606776: lea eax, var_6C
  loc_00606779: push eax
  loc_0060677A: lea ecx, var_5C
  loc_0060677D: push ecx
  loc_0060677E: lea edx, var_4C
  loc_00606781: push edx
  loc_00606782: lea eax, var_3C
  loc_00606785: push eax
  loc_00606786: push 00000004h
  loc_00606788: call [00401038h] ; __vbaFreeVarList
  loc_0060678E: add esp, 00000014h
  loc_00606791: call [00401094h] ; __vbaExitProc
  loc_00606797: push 006067DDh
  loc_0060679C: jmp 006067D3h
  loc_0060679E: lea ecx, var_24
  loc_006067A1: call [004012ACh] ; __vbaFreeStr
  loc_006067A7: lea ecx, var_2C
  loc_006067AA: push ecx
  loc_006067AB: lea edx, var_28
  loc_006067AE: push edx
  loc_006067AF: push 00000002h
  loc_006067B1: call [00401040h] ; __vbaFreeObjList
  loc_006067B7: lea eax, var_6C
  loc_006067BA: push eax
  loc_006067BB: lea ecx, var_5C
  loc_006067BE: push ecx
  loc_006067BF: lea edx, var_4C
  loc_006067C2: push edx
  loc_006067C3: lea eax, var_3C
  loc_006067C6: push eax
  loc_006067C7: push 00000004h
  loc_006067C9: call [00401038h] ; __vbaFreeVarList
  loc_006067CF: add esp, 00000020h
  loc_006067D2: ret
  loc_006067D3: lea ecx, var_20
  loc_006067D6: call [004012B0h] ; __vbaFreeObj
  loc_006067DC: ret
  loc_006067DD: mov eax, Me
  loc_006067E0: mov ecx, [eax]
  loc_006067E2: push eax
  loc_006067E3: call [ecx+00000008h]
  loc_006067E6: mov eax, var_C
  loc_006067E9: mov ecx, var_1C
  loc_006067EC: mov fs:[00000000h], ecx
  loc_006067F3: pop edi
  loc_006067F4: pop esi
  loc_006067F5: pop ebx
  loc_006067F6: mov esp, ebp
  loc_006067F8: pop ebp
  loc_006067F9: retn 0004h
End Sub

Private Sub Form_Load() '606800
  loc_00606800: push ebp
  loc_00606801: mov ebp, esp
  loc_00606803: sub esp, 0000000Ch
  loc_00606806: push 00403B36h ; __vbaExceptHandler
  loc_0060680B: mov eax, fs:[00000000h]
  loc_00606811: push eax
  loc_00606812: mov fs:[00000000h], esp
  loc_00606819: sub esp, 00000008h
  loc_0060681C: push ebx
  loc_0060681D: push esi
  loc_0060681E: push edi
  loc_0060681F: mov var_C, esp
  loc_00606822: mov var_8, 004035D0h
  loc_00606829: mov esi, Me
  loc_0060682C: mov eax, esi
  loc_0060682E: and eax, 00000001h
  loc_00606831: mov var_4, eax
  loc_00606834: and esi, FFFFFFFEh
  loc_00606837: push esi
  loc_00606838: mov Me, esi
  loc_0060683B: mov ecx, [esi]
  loc_0060683D: call [ecx+00000004h]
  loc_00606840: mov edx, [esi]
  loc_00606842: push esi
  loc_00606843: call [edx+00000704h]
  loc_00606849: mov var_4, 00000000h
  loc_00606850: mov eax, Me
  loc_00606853: push eax
  loc_00606854: mov ecx, [eax]
  loc_00606856: call [ecx+00000008h]
  loc_00606859: mov eax, var_4
  loc_0060685C: mov ecx, var_14
  loc_0060685F: pop edi
  loc_00606860: pop esi
  loc_00606861: mov fs:[00000000h], ecx
  loc_00606868: pop ebx
  loc_00606869: mov esp, ebp
  loc_0060686B: pop ebp
  loc_0060686C: retn 0004h
End Sub

Private Sub Proc_29_5_606870() '606870
  loc_00606870: push ebp
  loc_00606871: mov ebp, esp
  loc_00606873: sub esp, 00000008h
  loc_00606876: push 00403B36h ; __vbaExceptHandler
  loc_0060687B: mov eax, fs:[00000000h]
  loc_00606881: push eax
  loc_00606882: mov fs:[00000000h], esp
  loc_00606889: sub esp, 00000084h
  loc_0060688F: push ebx
  loc_00606890: push esi
  loc_00606891: push edi
  loc_00606892: mov var_8, esp
  loc_00606895: mov var_4, 004035D8h
  loc_0060689C: lea ebx, var_1C
  loc_0060689F: mov ecx, 0000000Ah
  loc_006068A4: push ebx
  loc_006068A5: mov esi, ecx
  loc_006068A7: sub esp, 00000010h
  loc_006068AA: xor eax, eax
  loc_006068AC: mov ebx, esp
  loc_006068AE: mov var_14, eax
  loc_006068B1: mov var_18, eax
  loc_006068B4: mov var_1C, eax
  loc_006068B7: mov [ebx], ecx
  loc_006068B9: mov ecx, var_60
  loc_006068BC: mov var_20, eax
  loc_006068BF: mov var_24, eax
  loc_006068C2: mov var_34, eax
  loc_006068C5: mov var_68, eax
  loc_006068C8: mov var_6C, eax
  loc_006068CB: mov [ebx+00000004h], ecx
  loc_006068CE: mov eax, 80020004h
  loc_006068D3: sub esp, 00000010h
  loc_006068D6: mov edx, eax
  loc_006068D8: mov [ebx+00000008h], eax
  loc_006068DB: mov eax, var_58
  loc_006068DE: mov ecx, esp
  loc_006068E0: mov [ebx+0000000Ch], eax
  loc_006068E3: mov eax, var_50
  loc_006068E6: mov [ecx], esi
  loc_006068E8: sub esp, 00000010h
  loc_006068EB: mov edi, [0061A13Ch]
  loc_006068F1: mov [ecx+00000004h], eax
  loc_006068F4: mov eax, 00000003h
  loc_006068F9: mov edi, [edi]
  loc_006068FB: mov [ecx+00000008h], edx
  loc_006068FE: mov edx, var_48
  loc_00606901: mov [ecx+0000000Ch], edx
  loc_00606904: mov edx, var_40
  loc_00606907: mov ecx, esp
  loc_00606909: push 00433958h ; "Select * From LoginAdvUser"
  loc_0060690E: mov [ecx], eax
  loc_00606910: mov eax, 00000004h
  loc_00606915: mov [ecx+00000004h], edx
  loc_00606918: mov [ecx+00000008h], eax
  loc_0060691B: mov eax, var_38
  loc_0060691E: mov [ecx+0000000Ch], eax
  loc_00606921: mov ecx, [0061A13Ch]
  loc_00606927: push ecx
  loc_00606928: call [edi+000000BCh]
  loc_0060692E: test eax, eax
  loc_00606930: fnclex
  loc_00606932: jge 00606950h
  loc_00606934: mov edx, [0061A13Ch]
  loc_0060693A: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00606940: push 000000BCh
  loc_00606945: push 0041E928h
  loc_0060694A: push edx
  loc_0060694B: push eax
  loc_0060694C: call edi
  loc_0060694E: jmp 00606956h
  loc_00606950: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00606956: mov eax, var_1C
  loc_00606959: mov var_1C, 00000000h
  loc_00606960: push eax
  loc_00606961: lea eax, var_14
  loc_00606964: push eax
  loc_00606965: call [004010A0h] ; __vbaObjSet
  loc_0060696B: mov eax, var_14
  loc_0060696E: lea edx, var_68
  loc_00606971: push edx
  loc_00606972: push eax
  loc_00606973: mov ecx, [eax]
  loc_00606975: call [ecx+00000020h]
  loc_00606978: test eax, eax
  loc_0060697A: fnclex
  loc_0060697C: jge 0060698Ch
  loc_0060697E: mov ecx, var_14
  loc_00606981: push 00000020h
  loc_00606983: push 0041E938h
  loc_00606988: push ecx
  loc_00606989: push eax
  loc_0060698A: call edi
  loc_0060698C: mov eax, var_14
  loc_0060698F: lea ecx, var_6C
  loc_00606992: push ecx
  loc_00606993: push eax
  loc_00606994: mov edx, [eax]
  loc_00606996: call [edx+00000034h]
  loc_00606999: test eax, eax
  loc_0060699B: fnclex
  loc_0060699D: jge 006069ADh
  loc_0060699F: mov edx, var_14
  loc_006069A2: push 00000034h
  loc_006069A4: push 0041E938h
  loc_006069A9: push edx
  loc_006069AA: push eax
  loc_006069AB: call edi
  loc_006069AD: mov eax, var_14
  loc_006069B0: lea edx, var_1C
  loc_006069B3: push edx
  loc_006069B4: push eax
  loc_006069B5: mov ecx, [eax]
  loc_006069B7: call [ecx+000000B4h]
  loc_006069BD: test eax, eax
  loc_006069BF: fnclex
  loc_006069C1: jge 006069D4h
  loc_006069C3: mov ecx, var_14
  loc_006069C6: push 000000B4h
  loc_006069CB: push 0041E938h
  loc_006069D0: push ecx
  loc_006069D1: push eax
  loc_006069D2: call edi
  loc_006069D4: lea ebx, var_20
  loc_006069D7: mov eax, var_1C
  loc_006069DA: push ebx
  loc_006069DB: mov edx, 00000008h
  loc_006069E0: sub esp, 00000010h
  loc_006069E3: mov esi, [eax]
  loc_006069E5: mov ebx, esp
  loc_006069E7: mov ecx, 00431EC8h ; "UserName"
  loc_006069EC: push eax
  loc_006069ED: mov var_7C, eax
  loc_006069F0: mov [ebx], edx
  loc_006069F2: mov edx, var_40
  loc_006069F5: mov [ebx+00000004h], edx
  loc_006069F8: mov [ebx+00000008h], ecx
  loc_006069FB: mov ecx, var_38
  loc_006069FE: mov [ebx+0000000Ch], ecx
  loc_00606A01: call [esi+00000030h]
  loc_00606A04: test eax, eax
  loc_00606A06: fnclex
  loc_00606A08: jge 00606A18h
  loc_00606A0A: mov edx, var_7C
  loc_00606A0D: push 00000030h
  loc_00606A0F: push 0041EA14h ; "S"
  loc_00606A14: push edx
  loc_00606A15: push eax
  loc_00606A16: call edi
  loc_00606A18: mov eax, var_20
  loc_00606A1B: mov var_20, 00000000h
  loc_00606A22: mov var_2C, eax
  loc_00606A25: lea eax, var_34
  loc_00606A28: push eax
  loc_00606A29: mov var_34, 00000009h
  loc_00606A30: call [00401118h] ; rtcIsNull
  loc_00606A36: mov ecx, var_6C
  loc_00606A39: mov si, ax
  loc_00606A3C: and ecx, var_68
  loc_00606A3F: not esi
  loc_00606A41: not ecx
  loc_00606A43: and esi, ecx
  loc_00606A45: lea ecx, var_1C
  loc_00606A48: call [004012B0h] ; __vbaFreeObj
  loc_00606A4E: lea ecx, var_34
  loc_00606A51: call [00401020h] ; __vbaFreeVar
  loc_00606A57: test si, si
  loc_00606A5A: jz 00606C7Eh
  loc_00606A60: mov eax, Me
  loc_00606A63: push eax
  loc_00606A64: mov edx, [eax]
  loc_00606A66: call [edx+00000308h]
  loc_00606A6C: push eax
  loc_00606A6D: lea eax, var_24
  loc_00606A70: push eax
  loc_00606A71: call [004010A0h] ; __vbaObjSet
  loc_00606A77: mov var_84, eax
  loc_00606A7D: mov eax, var_14
  loc_00606A80: lea edx, var_1C
  loc_00606A83: mov ecx, [eax]
  loc_00606A85: push edx
  loc_00606A86: push eax
  loc_00606A87: call [ecx+000000B4h]
  loc_00606A8D: test eax, eax
  loc_00606A8F: fnclex
  loc_00606A91: jge 00606AA4h
  loc_00606A93: mov ecx, var_14
  loc_00606A96: push 000000B4h
  loc_00606A9B: push 0041E938h
  loc_00606AA0: push ecx
  loc_00606AA1: push eax
  loc_00606AA2: call edi
  loc_00606AA4: lea ebx, var_20
  loc_00606AA7: mov eax, var_1C
  loc_00606AAA: push ebx
  loc_00606AAB: mov edx, 00000008h
  loc_00606AB0: sub esp, 00000010h
  loc_00606AB3: mov edi, [eax]
  loc_00606AB5: mov ebx, esp
  loc_00606AB7: mov ecx, 00431EC8h ; "UserName"
  loc_00606ABC: push eax
  loc_00606ABD: mov esi, eax
  loc_00606ABF: mov [ebx], edx
  loc_00606AC1: mov edx, var_40
  loc_00606AC4: mov [ebx+00000004h], edx
  loc_00606AC7: mov [ebx+00000008h], ecx
  loc_00606ACA: mov ecx, var_38
  loc_00606ACD: mov [ebx+0000000Ch], ecx
  loc_00606AD0: call [edi+00000030h]
  loc_00606AD3: test eax, eax
  loc_00606AD5: fnclex
  loc_00606AD7: jge 00606AECh
  loc_00606AD9: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00606ADF: push 00000030h
  loc_00606AE1: push 0041EA14h ; "S"
  loc_00606AE6: push esi
  loc_00606AE7: push eax
  loc_00606AE8: call edi
  loc_00606AEA: jmp 00606AF2h
  loc_00606AEC: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_00606AF2: mov eax, var_20
  loc_00606AF5: lea ecx, var_34
  loc_00606AF8: push ecx
  loc_00606AF9: push eax
  loc_00606AFA: mov edx, [eax]
  loc_00606AFC: mov esi, eax
  loc_00606AFE: call [edx+00000044h]
  loc_00606B01: test eax, eax
  loc_00606B03: fnclex
  loc_00606B05: jge 00606B12h
  loc_00606B07: push 00000044h
  loc_00606B09: push 0041EA48h
  loc_00606B0E: push esi
  loc_00606B0F: push eax
  loc_00606B10: call edi
  loc_00606B12: mov esi, var_84
  loc_00606B18: lea edx, var_34
  loc_00606B1B: push edx
  loc_00606B1C: mov ebx, [esi]
  loc_00606B1E: call [00401028h] ; __vbaStrVarMove
  loc_00606B24: mov edx, eax
  loc_00606B26: lea ecx, var_18
  loc_00606B29: call [00401270h] ; __vbaStrMove
  loc_00606B2F: push eax
  loc_00606B30: push esi
  loc_00606B31: call [ebx+000000A4h]
  loc_00606B37: test eax, eax
  loc_00606B39: fnclex
  loc_00606B3B: jge 00606B4Bh
  loc_00606B3D: push 000000A4h
  loc_00606B42: push 0041E5E8h
  loc_00606B47: push esi
  loc_00606B48: push eax
  loc_00606B49: call edi
  loc_00606B4B: lea ecx, var_18
  loc_00606B4E: call [004012ACh] ; __vbaFreeStr
  loc_00606B54: lea eax, var_24
  loc_00606B57: lea ecx, var_20
  loc_00606B5A: push eax
  loc_00606B5B: lea edx, var_1C
  loc_00606B5E: push ecx
  loc_00606B5F: push edx
  loc_00606B60: push 00000003h
  loc_00606B62: call [00401040h] ; __vbaFreeObjList
  loc_00606B68: add esp, 00000010h
  loc_00606B6B: lea ecx, var_34
  loc_00606B6E: call [00401020h] ; __vbaFreeVar
  loc_00606B74: mov eax, Me
  loc_00606B77: push eax
  loc_00606B78: mov ecx, [eax]
  loc_00606B7A: call [ecx+00000304h]
  loc_00606B80: lea edx, var_24
  loc_00606B83: push eax
  loc_00606B84: push edx
  loc_00606B85: call [004010A0h] ; __vbaObjSet
  loc_00606B8B: mov var_84, eax
  loc_00606B91: mov eax, var_14
  loc_00606B94: lea edx, var_1C
  loc_00606B97: mov ecx, [eax]
  loc_00606B99: push edx
  loc_00606B9A: push eax
  loc_00606B9B: call [ecx+000000B4h]
  loc_00606BA1: test eax, eax
  loc_00606BA3: fnclex
  loc_00606BA5: jge 00606BB8h
  loc_00606BA7: mov ecx, var_14
  loc_00606BAA: push 000000B4h
  loc_00606BAF: push 0041E938h
  loc_00606BB4: push ecx
  loc_00606BB5: push eax
  loc_00606BB6: call edi
  loc_00606BB8: lea ebx, var_20
  loc_00606BBB: mov eax, var_1C
  loc_00606BBE: push ebx
  loc_00606BBF: mov edx, 00000008h
  loc_00606BC4: sub esp, 00000010h
  loc_00606BC7: mov esi, [eax]
  loc_00606BC9: mov ebx, esp
  loc_00606BCB: mov ecx, 00431EE0h ; "Password"
  loc_00606BD0: push eax
  loc_00606BD1: mov var_74, eax
  loc_00606BD4: mov [ebx], edx
  loc_00606BD6: mov edx, var_40
  loc_00606BD9: mov [ebx+00000004h], edx
  loc_00606BDC: mov [ebx+00000008h], ecx
  loc_00606BDF: mov ecx, var_38
  loc_00606BE2: mov [ebx+0000000Ch], ecx
  loc_00606BE5: call [esi+00000030h]
  loc_00606BE8: test eax, eax
  loc_00606BEA: fnclex
  loc_00606BEC: jge 00606BFCh
  loc_00606BEE: mov edx, var_74
  loc_00606BF1: push 00000030h
  loc_00606BF3: push 0041EA14h ; "S"
  loc_00606BF8: push edx
  loc_00606BF9: push eax
  loc_00606BFA: call edi
  loc_00606BFC: mov eax, var_20
  loc_00606BFF: lea edx, var_34
  loc_00606C02: push edx
  loc_00606C03: push eax
  loc_00606C04: mov ecx, [eax]
  loc_00606C06: mov esi, eax
  loc_00606C08: call [ecx+00000044h]
  loc_00606C0B: test eax, eax
  loc_00606C0D: fnclex
  loc_00606C0F: jge 00606C1Ch
  loc_00606C11: push 00000044h
  loc_00606C13: push 0041EA48h
  loc_00606C18: push esi
  loc_00606C19: push eax
  loc_00606C1A: call edi
  loc_00606C1C: mov esi, var_84
  loc_00606C22: lea eax, var_34
  loc_00606C25: push eax
  loc_00606C26: mov ebx, [esi]
  loc_00606C28: call [00401028h] ; __vbaStrVarMove
  loc_00606C2E: mov edx, eax
  loc_00606C30: lea ecx, var_18
  loc_00606C33: call [00401270h] ; __vbaStrMove
  loc_00606C39: push eax
  loc_00606C3A: push esi
  loc_00606C3B: call [ebx+000000A4h]
  loc_00606C41: test eax, eax
  loc_00606C43: fnclex
  loc_00606C45: jge 00606C55h
  loc_00606C47: push 000000A4h
  loc_00606C4C: push 0041E5E8h
  loc_00606C51: push esi
  loc_00606C52: push eax
  loc_00606C53: call edi
  loc_00606C55: lea ecx, var_18
  loc_00606C58: call [004012ACh] ; __vbaFreeStr
  loc_00606C5E: lea ecx, var_24
  loc_00606C61: lea edx, var_20
  loc_00606C64: push ecx
  loc_00606C65: lea eax, var_1C
  loc_00606C68: push edx
  loc_00606C69: push eax
  loc_00606C6A: push 00000003h
  loc_00606C6C: call [00401040h] ; __vbaFreeObjList
  loc_00606C72: add esp, 00000010h
  loc_00606C75: lea ecx, var_34
  loc_00606C78: call [00401020h] ; __vbaFreeVar
  loc_00606C7E: mov eax, var_14
  loc_00606C81: push eax
  loc_00606C82: mov ecx, [eax]
  loc_00606C84: call [ecx+000000C4h]
  loc_00606C8A: test eax, eax
  loc_00606C8C: fnclex
  loc_00606C8E: jge 00606CA1h
  loc_00606C90: mov edx, var_14
  loc_00606C93: push 000000C4h
  loc_00606C98: push 0041E938h
  loc_00606C9D: push edx
  loc_00606C9E: push eax
  loc_00606C9F: call edi
  loc_00606CA1: push 0041E938h
  loc_00606CA6: push 00000000h
  loc_00606CA8: call [00401274h] ; __vbaCastObj
  loc_00606CAE: push eax
  loc_00606CAF: lea eax, var_14
  loc_00606CB2: push eax
  loc_00606CB3: call [004010A0h] ; __vbaObjSet
  loc_00606CB9: push 00606CF4h
  loc_00606CBE: jmp 00606CEAh
  loc_00606CC0: lea ecx, var_18
  loc_00606CC3: call [004012ACh] ; __vbaFreeStr
  loc_00606CC9: lea ecx, var_24
  loc_00606CCC: lea edx, var_20
  loc_00606CCF: push ecx
  loc_00606CD0: lea eax, var_1C
  loc_00606CD3: push edx
  loc_00606CD4: push eax
  loc_00606CD5: push 00000003h
  loc_00606CD7: call [00401040h] ; __vbaFreeObjList
  loc_00606CDD: add esp, 00000010h
  loc_00606CE0: lea ecx, var_34
  loc_00606CE3: call [00401020h] ; __vbaFreeVar
  loc_00606CE9: ret
  loc_00606CEA: lea ecx, var_14
  loc_00606CED: call [004012B0h] ; __vbaFreeObj
  loc_00606CF3: ret
  loc_00606CF4: mov ecx, var_10
  loc_00606CF7: pop edi
  loc_00606CF8: pop esi
  loc_00606CF9: xor eax, eax
  loc_00606CFB: mov fs:[00000000h], ecx
  loc_00606D02: pop ebx
  loc_00606D03: mov esp, ebp
  loc_00606D05: pop ebp
  loc_00606D06: retn 0004h
End Sub
