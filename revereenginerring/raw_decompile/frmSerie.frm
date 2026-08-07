VERSION 5.00
Begin VB.Form frmSerie
  Caption = "Series"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 375
  ClientWidth = 10935
  ClientHeight = 3450
  BeginProperty Font
    Name = "Tahoma"
    Size = 9.75
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdOk
    Caption = "&Ok"
    Left = 3060
    Top = 2490
    Width = 1245
    Height = 525
    TabIndex = 4
  End
  Begin VB.TextBox txtAmount
    Left = 3030
    Top = 1680
    Width = 2535
    Height = 465
    TabIndex = 1
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtNumber
    Left = 3030
    Top = 810
    Width = 6945
    Height = 465
    TabIndex = 0
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label2
    Caption = "Amount :"
    Left = 1440
    Top = 1710
    Width = 1245
    Height = 435
    TabIndex = 3
    BeginProperty Font
      Name = "Tahoma"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "Number :"
    Left = 1440
    Top = 840
    Width = 1245
    Height = 435
    TabIndex = 2
    BeginProperty Font
      Name = "Tahoma"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmSerie"


Private Sub txtAmount_KeyPress(KeyAscii As Integer) '617A90
  loc_00617A90: push ebp
  loc_00617A91: mov ebp, esp
  loc_00617A93: sub esp, 0000000Ch
  loc_00617A96: push 00403B36h ; __vbaExceptHandler
  loc_00617A9B: mov eax, fs:[00000000h]
  loc_00617AA1: push eax
  loc_00617AA2: mov fs:[00000000h], esp
  loc_00617AA9: sub esp, 000000C8h
  loc_00617AAF: push ebx
  loc_00617AB0: push esi
  loc_00617AB1: push edi
  loc_00617AB2: mov var_C, esp
  loc_00617AB5: mov var_8, 00403AF8h
  loc_00617ABC: mov esi, Me
  loc_00617ABF: mov eax, esi
  loc_00617AC1: and eax, 00000001h
  loc_00617AC4: mov var_4, eax
  loc_00617AC7: and esi, FFFFFFFEh
  loc_00617ACA: push esi
  loc_00617ACB: mov Me, esi
  loc_00617ACE: mov ecx, [esi]
  loc_00617AD0: call [ecx+00000004h]
  loc_00617AD3: xor edi, edi
  loc_00617AD5: mov edx, 00433B00h ; "0123456789R*/."
  loc_00617ADA: lea ecx, var_18
  loc_00617ADD: mov var_18, edi
  loc_00617AE0: mov var_1C, edi
  loc_00617AE3: mov var_20, edi
  loc_00617AE6: mov var_24, edi
  loc_00617AE9: mov var_28, edi
  loc_00617AEC: mov var_38, edi
  loc_00617AEF: mov var_48, edi
  loc_00617AF2: mov var_58, edi
  loc_00617AF5: mov var_68, edi
  loc_00617AF8: mov var_78, edi
  loc_00617AFB: mov var_88, edi
  loc_00617B01: mov var_98, edi
  loc_00617B07: mov var_A8, edi
  loc_00617B0D: mov var_B8, edi
  loc_00617B13: call [004011ECh] ; __vbaStrCopy
  loc_00617B19: mov ebx, KeyAscii
  loc_00617B1C: mov edx, var_18
  loc_00617B1F: lea ecx, var_38
  loc_00617B22: mov var_80, edx
  loc_00617B25: movsx eax, [ebx]
  loc_00617B28: push eax
  loc_00617B29: push ecx
  loc_00617B2A: mov var_88, 00000008h
  loc_00617B34: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_00617B3A: mov ax, [ebx]
  loc_00617B3D: xor edx, edx
  loc_00617B3F: cmp ax, 0008h
  loc_00617B43: mov ecx, 0000000Bh
  loc_00617B48: setz dl
  loc_00617B4B: neg edx
  loc_00617B4D: mov var_A0, dx
  loc_00617B54: xor edx, edx
  loc_00617B56: cmp ax, 000Dh
  loc_00617B5A: mov var_A8, ecx
  loc_00617B60: setz dl
  loc_00617B63: neg edx
  loc_00617B65: mov var_B8, ecx
  loc_00617B6B: lea eax, var_88
  loc_00617B71: push 00000001h
  loc_00617B73: lea ecx, var_38
  loc_00617B76: mov var_B0, dx
  loc_00617B7D: push eax
  loc_00617B7E: push ecx
  loc_00617B7F: lea edx, var_48
  loc_00617B82: push edi
  loc_00617B83: push edx
  loc_00617B84: mov var_90, edi
  loc_00617B8A: mov var_98, 00008002h
  loc_00617B94: call [004011A8h] ; __vbaInStrVar
  loc_00617B9A: push eax
  loc_00617B9B: lea eax, var_98
  loc_00617BA1: lea ecx, var_58
  loc_00617BA4: push eax
  loc_00617BA5: push ecx
  loc_00617BA6: call [00401050h] ; __vbaVarCmpNe
  loc_00617BAC: push eax
  loc_00617BAD: lea edx, var_A8
  loc_00617BB3: lea eax, var_68
  loc_00617BB6: push edx
  loc_00617BB7: push eax
  loc_00617BB8: call [0040112Ch] ; __vbaVarOr
  loc_00617BBE: lea ecx, var_B8
  loc_00617BC4: push eax
  loc_00617BC5: push ecx
  loc_00617BC6: lea edx, var_78
  loc_00617BC9: push edx
  loc_00617BCA: call [0040112Ch] ; __vbaVarOr
  loc_00617BD0: push eax
  loc_00617BD1: call [004010E0h] ; __vbaBoolVarNull
  loc_00617BD7: mov var_BC, ax
  loc_00617BDE: lea eax, var_B8
  loc_00617BE4: lea ecx, var_A8
  loc_00617BEA: push eax
  loc_00617BEB: lea edx, var_48
  loc_00617BEE: push ecx
  loc_00617BEF: lea eax, var_38
  loc_00617BF2: push edx
  loc_00617BF3: push eax
  loc_00617BF4: push 00000004h
  loc_00617BF6: call [00401038h] ; __vbaFreeVarList
  loc_00617BFC: add esp, 00000014h
  loc_00617BFF: cmp var_BC, di
  loc_00617C06: jz 00617F46h
  loc_00617C0C: mov ax, [ebx]
  loc_00617C0F: cmp ax, 002Ah
  loc_00617C13: mov [ebx], ax
  loc_00617C16: jnz 00617D12h
  loc_00617C1C: mov [ebx], di
  loc_00617C1F: mov ecx, [esi]
  loc_00617C21: push esi
  loc_00617C22: call [ecx+00000300h]
  loc_00617C28: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00617C2E: lea edx, var_28
  loc_00617C31: push eax
  loc_00617C32: push edx
  loc_00617C33: call ebx
  loc_00617C35: mov var_C4, eax
  loc_00617C3B: mov eax, [esi]
  loc_00617C3D: push esi
  loc_00617C3E: call [eax+00000300h]
  loc_00617C44: lea ecx, var_24
  loc_00617C47: push eax
  loc_00617C48: push ecx
  loc_00617C49: call ebx
  loc_00617C4B: mov ebx, eax
  loc_00617C4D: lea eax, var_1C
  loc_00617C50: push eax
  loc_00617C51: push ebx
  loc_00617C52: mov edx, [ebx]
  loc_00617C54: call [edx+000000A0h]
  loc_00617C5A: cmp eax, edi
  loc_00617C5C: fnclex
  loc_00617C5E: jge 00617C72h
  loc_00617C60: push 000000A0h
  loc_00617C65: push 0041E5E8h
  loc_00617C6A: push ebx
  loc_00617C6B: push eax
  loc_00617C6C: call [00401074h] ; __vbaHresultCheckObj
  loc_00617C72: mov edx, var_1C
  loc_00617C75: mov ecx, var_C4
  loc_00617C7B: push edx
  loc_00617C7C: push 0041FC88h
  loc_00617C81: mov ebx, [ecx]
  loc_00617C83: call [00401054h] ; __vbaStrCat
  loc_00617C89: mov edx, eax
  loc_00617C8B: lea ecx, var_20
  loc_00617C8E: call [00401270h] ; __vbaStrMove
  loc_00617C94: mov var_D4, ebx
  loc_00617C9A: mov ebx, var_C4
  loc_00617CA0: push eax
  loc_00617CA1: mov eax, var_D4
  loc_00617CA7: push ebx
  loc_00617CA8: call [eax+000000A4h]
  loc_00617CAE: cmp eax, edi
  loc_00617CB0: fnclex
  loc_00617CB2: jge 00617CC6h
  loc_00617CB4: push 000000A4h
  loc_00617CB9: push 0041E5E8h
  loc_00617CBE: push ebx
  loc_00617CBF: push eax
  loc_00617CC0: call [00401074h] ; __vbaHresultCheckObj
  loc_00617CC6: lea ecx, var_20
  loc_00617CC9: lea edx, var_1C
  loc_00617CCC: push ecx
  loc_00617CCD: push edx
  loc_00617CCE: push 00000002h
  loc_00617CD0: call [004011FCh] ; __vbaFreeStrList
  loc_00617CD6: lea eax, var_28
  loc_00617CD9: lea ecx, var_24
  loc_00617CDC: push eax
  loc_00617CDD: push ecx
  loc_00617CDE: push 00000002h
  loc_00617CE0: call [00401040h] ; __vbaFreeObjList
  loc_00617CE6: add esp, 00000018h
  loc_00617CE9: lea edx, var_38
  loc_00617CEC: mov var_30, 80020004h
  loc_00617CF3: mov var_38, 0000000Ah
  loc_00617CFA: push edx
  loc_00617CFB: push 0042199Ch ; "{END}"
  loc_00617D00: call [004010C0h] ; rtcSendKeys
  loc_00617D06: lea ecx, var_38
  loc_00617D09: call [00401020h] ; __vbaFreeVar
  loc_00617D0F: mov ebx, KeyAscii
  loc_00617D12: cmp [ebx], 002Fh
  loc_00617D16: jnz 00617E08h
  loc_00617D1C: mov [ebx], di
  loc_00617D1F: mov eax, [esi]
  loc_00617D21: push esi
  loc_00617D22: call [eax+00000300h]
  loc_00617D28: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00617D2E: lea ecx, var_28
  loc_00617D31: push eax
  loc_00617D32: push ecx
  loc_00617D33: call ebx
  loc_00617D35: mov edx, [esi]
  loc_00617D37: push esi
  loc_00617D38: mov var_C4, eax
  loc_00617D3E: call [edx+00000300h]
  loc_00617D44: push eax
  loc_00617D45: lea eax, var_24
  loc_00617D48: push eax
  loc_00617D49: call ebx
  loc_00617D4B: mov ebx, eax
  loc_00617D4D: lea edx, var_1C
  loc_00617D50: push edx
  loc_00617D51: push ebx
  loc_00617D52: mov ecx, [ebx]
  loc_00617D54: call [ecx+000000A0h]
  loc_00617D5A: cmp eax, edi
  loc_00617D5C: fnclex
  loc_00617D5E: jge 00617D72h
  loc_00617D60: push 000000A0h
  loc_00617D65: push 0041E5E8h
  loc_00617D6A: push ebx
  loc_00617D6B: push eax
  loc_00617D6C: call [00401074h] ; __vbaHresultCheckObj
  loc_00617D72: mov ecx, var_1C
  loc_00617D75: mov eax, var_C4
  loc_00617D7B: push ecx
  loc_00617D7C: push 0041FCA8h
  loc_00617D81: mov ebx, [eax]
  loc_00617D83: call [00401054h] ; __vbaStrCat
  loc_00617D89: mov edx, eax
  loc_00617D8B: lea ecx, var_20
  loc_00617D8E: call [00401270h] ; __vbaStrMove
  loc_00617D94: mov edx, ebx
  loc_00617D96: mov ebx, var_C4
  loc_00617D9C: push eax
  loc_00617D9D: push ebx
  loc_00617D9E: call [edx+000000A4h]
  loc_00617DA4: cmp eax, edi
  loc_00617DA6: fnclex
  loc_00617DA8: jge 00617DBCh
  loc_00617DAA: push 000000A4h
  loc_00617DAF: push 0041E5E8h
  loc_00617DB4: push ebx
  loc_00617DB5: push eax
  loc_00617DB6: call [00401074h] ; __vbaHresultCheckObj
  loc_00617DBC: lea eax, var_20
  loc_00617DBF: lea ecx, var_1C
  loc_00617DC2: push eax
  loc_00617DC3: push ecx
  loc_00617DC4: push 00000002h
  loc_00617DC6: call [004011FCh] ; __vbaFreeStrList
  loc_00617DCC: lea edx, var_28
  loc_00617DCF: lea eax, var_24
  loc_00617DD2: push edx
  loc_00617DD3: push eax
  loc_00617DD4: push 00000002h
  loc_00617DD6: call [00401040h] ; __vbaFreeObjList
  loc_00617DDC: add esp, 00000018h
  loc_00617DDF: lea ecx, var_38
  loc_00617DE2: mov var_30, 80020004h
  loc_00617DE9: mov var_38, 0000000Ah
  loc_00617DF0: push ecx
  loc_00617DF1: push 0042199Ch ; "{END}"
  loc_00617DF6: call [004010C0h] ; rtcSendKeys
  loc_00617DFC: lea ecx, var_38
  loc_00617DFF: call [00401020h] ; __vbaFreeVar
  loc_00617E05: mov ebx, KeyAscii
  loc_00617E08: cmp [ebx], 002Eh
  loc_00617E0C: jnz 00617EFEh
  loc_00617E12: mov [ebx], di
  loc_00617E15: mov edx, [esi]
  loc_00617E17: push esi
  loc_00617E18: call [edx+00000300h]
  loc_00617E1E: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00617E24: push eax
  loc_00617E25: lea eax, var_28
  loc_00617E28: push eax
  loc_00617E29: call ebx
  loc_00617E2B: mov ecx, [esi]
  loc_00617E2D: push esi
  loc_00617E2E: mov var_C4, eax
  loc_00617E34: call [ecx+00000300h]
  loc_00617E3A: lea edx, var_24
  loc_00617E3D: push eax
  loc_00617E3E: push edx
  loc_00617E3F: call ebx
  loc_00617E41: mov ebx, eax
  loc_00617E43: lea ecx, var_1C
  loc_00617E46: push ecx
  loc_00617E47: push ebx
  loc_00617E48: mov eax, [ebx]
  loc_00617E4A: call [eax+000000A0h]
  loc_00617E50: cmp eax, edi
  loc_00617E52: fnclex
  loc_00617E54: jge 00617E68h
  loc_00617E56: push 000000A0h
  loc_00617E5B: push 0041E5E8h
  loc_00617E60: push ebx
  loc_00617E61: push eax
  loc_00617E62: call [00401074h] ; __vbaHresultCheckObj
  loc_00617E68: mov eax, var_1C
  loc_00617E6B: mov edx, var_C4
  loc_00617E71: push eax
  loc_00617E72: push 004219B4h ; "00"
  loc_00617E77: mov ebx, [edx]
  loc_00617E79: call [00401054h] ; __vbaStrCat
  loc_00617E7F: mov edx, eax
  loc_00617E81: lea ecx, var_20
  loc_00617E84: call [00401270h] ; __vbaStrMove
  loc_00617E8A: mov ecx, ebx
  loc_00617E8C: mov ebx, var_C4
  loc_00617E92: push eax
  loc_00617E93: push ebx
  loc_00617E94: call [ecx+000000A4h]
  loc_00617E9A: cmp eax, edi
  loc_00617E9C: fnclex
  loc_00617E9E: jge 00617EB2h
  loc_00617EA0: push 000000A4h
  loc_00617EA5: push 0041E5E8h
  loc_00617EAA: push ebx
  loc_00617EAB: push eax
  loc_00617EAC: call [00401074h] ; __vbaHresultCheckObj
  loc_00617EB2: lea edx, var_20
  loc_00617EB5: lea eax, var_1C
  loc_00617EB8: push edx
  loc_00617EB9: push eax
  loc_00617EBA: push 00000002h
  loc_00617EBC: call [004011FCh] ; __vbaFreeStrList
  loc_00617EC2: lea ecx, var_28
  loc_00617EC5: lea edx, var_24
  loc_00617EC8: push ecx
  loc_00617EC9: push edx
  loc_00617ECA: push 00000002h
  loc_00617ECC: call [00401040h] ; __vbaFreeObjList
  loc_00617ED2: add esp, 00000018h
  loc_00617ED5: lea eax, var_38
  loc_00617ED8: mov var_30, 80020004h
  loc_00617EDF: mov var_38, 0000000Ah
  loc_00617EE6: push eax
  loc_00617EE7: push 0042199Ch ; "{END}"
  loc_00617EEC: call [004010C0h] ; rtcSendKeys
  loc_00617EF2: lea ecx, var_38
  loc_00617EF5: call [00401020h] ; __vbaFreeVar
  loc_00617EFB: mov ebx, KeyAscii
  loc_00617EFE: cmp [ebx], 000Dh
  loc_00617F02: jnz 00617F49h
  loc_00617F04: mov ecx, [esi]
  loc_00617F06: push esi
  loc_00617F07: call [ecx+000002FCh]
  loc_00617F0D: lea edx, var_24
  loc_00617F10: push eax
  loc_00617F11: push edx
  loc_00617F12: call [004010A0h] ; __vbaObjSet
  loc_00617F18: mov esi, eax
  loc_00617F1A: push esi
  loc_00617F1B: mov eax, [esi]
  loc_00617F1D: call [eax+000001A4h]
  loc_00617F23: cmp eax, edi
  loc_00617F25: fnclex
  loc_00617F27: jge 00617F3Bh
  loc_00617F29: push 000001A4h
  loc_00617F2E: push 0041EAACh
  loc_00617F33: push esi
  loc_00617F34: push eax
  loc_00617F35: call [00401074h] ; __vbaHresultCheckObj
  loc_00617F3B: lea ecx, var_24
  loc_00617F3E: call [004012B0h] ; __vbaFreeObj
  loc_00617F44: jmp 00617F49h
  loc_00617F46: mov [ebx], di
  loc_00617F49: mov var_4, edi
  loc_00617F4C: push 00617F9Dh
  loc_00617F51: jmp 00617F93h
  loc_00617F53: lea ecx, var_20
  loc_00617F56: lea edx, var_1C
  loc_00617F59: push ecx
  loc_00617F5A: push edx
  loc_00617F5B: push 00000002h
  loc_00617F5D: call [004011FCh] ; __vbaFreeStrList
  loc_00617F63: lea eax, var_28
  loc_00617F66: lea ecx, var_24
  loc_00617F69: push eax
  loc_00617F6A: push ecx
  loc_00617F6B: push 00000002h
  loc_00617F6D: call [00401040h] ; __vbaFreeObjList
  loc_00617F73: lea edx, var_78
  loc_00617F76: lea eax, var_68
  loc_00617F79: push edx
  loc_00617F7A: lea ecx, var_58
  loc_00617F7D: push eax
  loc_00617F7E: lea edx, var_48
  loc_00617F81: push ecx
  loc_00617F82: lea eax, var_38
  loc_00617F85: push edx
  loc_00617F86: push eax
  loc_00617F87: push 00000005h
  loc_00617F89: call [00401038h] ; __vbaFreeVarList
  loc_00617F8F: add esp, 00000030h
  loc_00617F92: ret
  loc_00617F93: lea ecx, var_18
  loc_00617F96: call [004012ACh] ; __vbaFreeStr
  loc_00617F9C: ret
  loc_00617F9D: mov eax, Me
  loc_00617FA0: push eax
  loc_00617FA1: mov ecx, [eax]
  loc_00617FA3: call [ecx+00000008h]
  loc_00617FA6: mov eax, var_4
  loc_00617FA9: mov ecx, var_14
  loc_00617FAC: pop edi
  loc_00617FAD: pop esi
  loc_00617FAE: mov fs:[00000000h], ecx
  loc_00617FB5: pop ebx
  loc_00617FB6: mov esp, ebp
  loc_00617FB8: pop ebp
  loc_00617FB9: retn 0008h
End Sub

Private Sub cmdOk_Click() '617660
  loc_00617660: push ebp
  loc_00617661: mov ebp, esp
  loc_00617663: sub esp, 0000000Ch
  loc_00617666: push 00403B36h ; __vbaExceptHandler
  loc_0061766B: mov eax, fs:[00000000h]
  loc_00617671: push eax
  loc_00617672: mov fs:[00000000h], esp
  loc_00617679: sub esp, 0000007Ch
  loc_0061767C: push ebx
  loc_0061767D: push esi
  loc_0061767E: push edi
  loc_0061767F: mov var_C, esp
  loc_00617682: mov var_8, 00403AE8h
  loc_00617689: mov edi, Me
  loc_0061768C: mov eax, edi
  loc_0061768E: and eax, 00000001h
  loc_00617691: mov var_4, eax
  loc_00617694: and edi, FFFFFFFEh
  loc_00617697: push edi
  loc_00617698: mov Me, edi
  loc_0061769B: mov ecx, [edi]
  loc_0061769D: call [ecx+00000004h]
  loc_006176A0: xor eax, eax
  loc_006176A2: push eax
  loc_006176A3: mov var_1C, eax
  loc_006176A6: mov var_20, eax
  loc_006176A9: mov var_24, eax
  loc_006176AC: mov var_34, eax
  loc_006176AF: mov var_44, eax
  loc_006176B2: mov var_54, eax
  loc_006176B5: call [00401008h] ; __vbaStrI2
  loc_006176BB: mov edx, eax
  loc_006176BD: mov ecx, 0061A064h
  loc_006176C2: call [00401270h] ; __vbaStrMove
  loc_006176C8: mov edx, [edi]
  loc_006176CA: push edi
  loc_006176CB: call [edx+00000304h]
  loc_006176D1: mov ebx, [004010A0h] ; __vbaObjSet
  loc_006176D7: push eax
  loc_006176D8: lea eax, var_24
  loc_006176DB: push eax
  loc_006176DC: call ebx
  loc_006176DE: mov esi, eax
  loc_006176E0: lea edx, var_1C
  loc_006176E3: push edx
  loc_006176E4: push esi
  loc_006176E5: mov ecx, [esi]
  loc_006176E7: call [ecx+000000A0h]
  loc_006176ED: test eax, eax
  loc_006176EF: fnclex
  loc_006176F1: jge 00617705h
  loc_006176F3: push 000000A0h
  loc_006176F8: push 0041E5E8h
  loc_006176FD: push esi
  loc_006176FE: push eax
  loc_006176FF: call [00401074h] ; __vbaHresultCheckObj
  loc_00617705: mov eax, var_1C
  loc_00617708: push eax
  loc_00617709: call [0040102Ch] ; __vbaLenBstr
  loc_0061770F: mov ecx, eax
  loc_00617711: call [00401124h] ; __vbaI2I4
  loc_00617717: lea ecx, var_1C
  loc_0061771A: mov var_78, eax
  loc_0061771D: mov esi, 00000001h
  loc_00617722: call [004012ACh] ; __vbaFreeStr
  loc_00617728: lea ecx, var_24
  loc_0061772B: call [004012B0h] ; __vbaFreeObj
  loc_00617731: cmp si, var_78
  loc_00617735: jg 0061793Ah
  loc_0061773B: mov ecx, [edi]
  loc_0061773D: push edi
  loc_0061773E: call [ecx+00000304h]
  loc_00617744: lea edx, var_24
  loc_00617747: push eax
  loc_00617748: push edx
  loc_00617749: call ebx
  loc_0061774B: mov ebx, eax
  loc_0061774D: lea ecx, var_1C
  loc_00617750: push ecx
  loc_00617751: push ebx
  loc_00617752: mov eax, [ebx]
  loc_00617754: call [eax+000000A0h]
  loc_0061775A: test eax, eax
  loc_0061775C: fnclex
  loc_0061775E: jge 00617772h
  loc_00617760: push 000000A0h
  loc_00617765: push 0041E5E8h
  loc_0061776A: push ebx
  loc_0061776B: push eax
  loc_0061776C: call [00401074h] ; __vbaHresultCheckObj
  loc_00617772: mov eax, var_1C
  loc_00617775: movsx edx, si
  loc_00617778: push edx
  loc_00617779: push eax
  loc_0061777A: push 0041F1E0h ; "-"
  loc_0061777F: push 00000000h
  loc_00617781: call [004011D4h] ; __vbaInStr
  loc_00617787: mov ecx, eax
  loc_00617789: call [00401124h] ; __vbaI2I4
  loc_0061778F: lea ecx, var_1C
  loc_00617792: mov ebx, eax
  loc_00617794: call [004012ACh] ; __vbaFreeStr
  loc_0061779A: lea ecx, var_24
  loc_0061779D: call [004012B0h] ; __vbaFreeObj
  loc_006177A3: mov ecx, [0061A064h]
  loc_006177A9: push 00000000h
  loc_006177AB: push ecx
  loc_006177AC: call [004011F4h] ; __vbaI4Str
  loc_006177B2: push eax
  loc_006177B3: push 00000001h
  loc_006177B5: push 00000008h
  loc_006177B7: push 0061A14Ch
  loc_006177BC: push 00000004h
  loc_006177BE: push 00000180h
  loc_006177C3: call [00401134h] ; __vbaRedimPreserve
  loc_006177C9: mov edx, [edi]
  loc_006177CB: add esp, 0000001Ch
  loc_006177CE: push edi
  loc_006177CF: call [edx+00000304h]
  loc_006177D5: push eax
  loc_006177D6: lea eax, var_24
  loc_006177D9: push eax
  loc_006177DA: call [004010A0h] ; __vbaObjSet
  loc_006177E0: mov esi, eax
  loc_006177E2: lea edx, var_1C
  loc_006177E5: push edx
  loc_006177E6: push esi
  loc_006177E7: mov ecx, [esi]
  loc_006177E9: call [ecx+000000A0h]
  loc_006177EF: test eax, eax
  loc_006177F1: fnclex
  loc_006177F3: jge 00617807h
  loc_006177F5: push 000000A0h
  loc_006177FA: push 0041E5E8h
  loc_006177FF: push esi
  loc_00617800: push eax
  loc_00617801: call [00401074h] ; __vbaHresultCheckObj
  loc_00617807: mov eax, var_1C
  loc_0061780A: mov ecx, 00000002h
  loc_0061780F: mov dx, bx
  loc_00617812: mov var_2C, eax
  loc_00617815: lea eax, var_44
  loc_00617818: sub dx, cx
  loc_0061781B: push eax
  loc_0061781C: mov var_3C, ecx
  loc_0061781F: jo 00617A87h
  loc_00617825: movsx eax, dx
  loc_00617828: mov var_44, ecx
  loc_0061782B: lea ecx, var_34
  loc_0061782E: push eax
  loc_0061782F: lea edx, var_54
  loc_00617832: push ecx
  loc_00617833: push edx
  loc_00617834: mov var_1C, 00000000h
  loc_0061783B: mov var_34, 00000008h
  loc_00617842: call [004010F4h] ; rtcMidCharVar
  loc_00617848: mov eax, [0061A14Ch]
  loc_0061784D: test eax, eax
  loc_0061784F: jz 0061788Bh
  loc_00617851: cmp [eax], 0001h
  loc_00617855: jnz 0061788Bh
  loc_00617857: mov eax, [0061A064h]
  loc_0061785C: push eax
  loc_0061785D: call [004011F4h] ; __vbaI4Str
  loc_00617863: mov esi, eax
  loc_00617865: mov eax, [0061A14Ch]
  loc_0061786A: mov edx, [eax+00000014h]
  loc_0061786D: mov ecx, [eax+00000010h]
  loc_00617870: sub esi, edx
  loc_00617872: cmp esi, ecx
  loc_00617874: jb 0061787Ch
  loc_00617876: call [00401100h] ; __vbaGenerateBoundsError
  loc_0061787C: lea ecx, [esi*4]
  loc_00617883: mov var_8C, ecx
  loc_00617889: jmp 00617897h
  loc_0061788B: call [00401100h] ; __vbaGenerateBoundsError
  loc_00617891: mov var_8C, eax
  loc_00617897: lea edx, var_54
  loc_0061789A: push edx
  loc_0061789B: call [00401028h] ; __vbaStrVarMove
  loc_006178A1: mov esi, [00401270h] ; __vbaStrMove
  loc_006178A7: mov edx, eax
  loc_006178A9: lea ecx, var_20
  loc_006178AC: call __vbaStrMove
  loc_006178AE: mov edx, eax
  loc_006178B0: mov eax, [0061A14Ch]
  loc_006178B5: mov ecx, [eax+0000000Ch]
  loc_006178B8: mov eax, var_8C
  loc_006178BE: add ecx, eax
  loc_006178C0: call [004011ECh] ; __vbaStrCopy
  loc_006178C6: lea ecx, var_20
  loc_006178C9: call [004012ACh] ; __vbaFreeStr
  loc_006178CF: lea ecx, var_24
  loc_006178D2: call [004012B0h] ; __vbaFreeObj
  loc_006178D8: lea ecx, var_54
  loc_006178DB: lea edx, var_44
  loc_006178DE: push ecx
  loc_006178DF: lea eax, var_34
  loc_006178E2: push edx
  loc_006178E3: push eax
  loc_006178E4: push 00000003h
  loc_006178E6: call [00401038h] ; __vbaFreeVarList
  loc_006178EC: mov ecx, [0061A064h]
  loc_006178F2: add esp, 00000010h
  loc_006178F5: push ecx
  loc_006178F6: call [004011D8h] ; __vbaR8Str
  loc_006178FC: fadd st0, real8 ptr [004015F8h]
  loc_00617902: sub esp, 00000008h
  loc_00617905: fnstsw ax
  loc_00617907: test al, 0Dh
  loc_00617909: jnz 00617A82h
  loc_0061790F: fstp real8 ptr [esp]
  loc_00617912: call [00401144h] ; __vbaStrR8
  loc_00617918: mov edx, eax
  loc_0061791A: mov ecx, 0061A064h
  loc_0061791F: call __vbaStrMove
  loc_00617921: mov esi, 00000001h
  loc_00617926: add si, bx
  loc_00617929: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0061792F: jo 00617A87h
  loc_00617935: jmp 00617731h
  loc_0061793A: mov edx, [edi]
  loc_0061793C: push edi
  loc_0061793D: call [edx+00000300h]
  loc_00617943: push eax
  loc_00617944: lea eax, var_24
  loc_00617947: push eax
  loc_00617948: call ebx
  loc_0061794A: mov esi, eax
  loc_0061794C: lea edx, var_1C
  loc_0061794F: push edx
  loc_00617950: push esi
  loc_00617951: mov ecx, [esi]
  loc_00617953: call [ecx+000000A0h]
  loc_00617959: test eax, eax
  loc_0061795B: fnclex
  loc_0061795D: jge 00617971h
  loc_0061795F: push 000000A0h
  loc_00617964: push 0041E5E8h
  loc_00617969: push esi
  loc_0061796A: push eax
  loc_0061796B: call [00401074h] ; __vbaHresultCheckObj
  loc_00617971: mov eax, var_1C
  loc_00617974: lea ecx, var_44
  loc_00617977: mov var_2C, eax
  loc_0061797A: lea eax, var_34
  loc_0061797D: push eax
  loc_0061797E: push ecx
  loc_0061797F: mov var_1C, 00000000h
  loc_00617986: mov var_34, 00000008h
  loc_0061798D: call [004010D4h] ; rtcTrimVar
  loc_00617993: lea edx, var_44
  loc_00617996: push edx
  loc_00617997: call [00401028h] ; __vbaStrVarMove
  loc_0061799D: mov edx, eax
  loc_0061799F: mov ecx, 0061A038h
  loc_006179A4: call [00401270h] ; __vbaStrMove
  loc_006179AA: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_006179B0: lea ecx, var_24
  loc_006179B3: call ebx
  loc_006179B5: lea eax, var_44
  loc_006179B8: lea ecx, var_34
  loc_006179BB: push eax
  loc_006179BC: push ecx
  loc_006179BD: push 00000002h
  loc_006179BF: call [00401038h] ; __vbaFreeVarList
  loc_006179C5: mov eax, [0061B394h]
  loc_006179CA: add esp, 0000000Ch
  loc_006179CD: test eax, eax
  loc_006179CF: jnz 006179E1h
  loc_006179D1: push 0061B394h
  loc_006179D6: push 0041E4A0h
  loc_006179DB: call [004011DCh] ; __vbaNew2
  loc_006179E1: mov esi, [0061B394h]
  loc_006179E7: lea eax, var_24
  loc_006179EA: push edi
  loc_006179EB: push eax
  loc_006179EC: mov edx, [esi]
  loc_006179EE: mov var_90, edx
  loc_006179F4: call [004010B8h] ; __vbaObjSetAddref
  loc_006179FA: mov ecx, var_90
  loc_00617A00: push eax
  loc_00617A01: push esi
  loc_00617A02: call [ecx+00000010h]
  loc_00617A05: test eax, eax
  loc_00617A07: fnclex
  loc_00617A09: jge 00617A1Ah
  loc_00617A0B: push 00000010h
  loc_00617A0D: push 0041E490h
  loc_00617A12: push esi
  loc_00617A13: push eax
  loc_00617A14: call [00401074h] ; __vbaHresultCheckObj
  loc_00617A1A: lea ecx, var_24
  loc_00617A1D: call ebx
  loc_00617A1F: mov var_4, 00000000h
  loc_00617A26: fwait
  loc_00617A27: push 00617A63h
  loc_00617A2C: jmp 00617A62h
  loc_00617A2E: lea edx, var_20
  loc_00617A31: lea eax, var_1C
  loc_00617A34: push edx
  loc_00617A35: push eax
  loc_00617A36: push 00000002h
  loc_00617A38: call [004011FCh] ; __vbaFreeStrList
  loc_00617A3E: add esp, 0000000Ch
  loc_00617A41: lea ecx, var_24
  loc_00617A44: call [004012B0h] ; __vbaFreeObj
  loc_00617A4A: lea ecx, var_54
  loc_00617A4D: lea edx, var_44
  loc_00617A50: push ecx
  loc_00617A51: lea eax, var_34
  loc_00617A54: push edx
  loc_00617A55: push eax
  loc_00617A56: push 00000003h
  loc_00617A58: call [00401038h] ; __vbaFreeVarList
  loc_00617A5E: add esp, 00000010h
  loc_00617A61: ret
  loc_00617A62: ret
  loc_00617A63: mov eax, Me
  loc_00617A66: push eax
  loc_00617A67: mov ecx, [eax]
  loc_00617A69: call [ecx+00000008h]
  loc_00617A6C: mov eax, var_4
  loc_00617A6F: mov ecx, var_14
  loc_00617A72: pop edi
  loc_00617A73: pop esi
  loc_00617A74: mov fs:[00000000h], ecx
  loc_00617A7B: pop ebx
  loc_00617A7C: mov esp, ebp
  loc_00617A7E: pop ebp
  loc_00617A7F: retn 0004h
End Sub

Private Sub txtNumber_KeyPress(KeyAscii As Integer) '617FC0
  loc_00617FC0: push ebp
  loc_00617FC1: mov ebp, esp
  loc_00617FC3: sub esp, 0000000Ch
  loc_00617FC6: push 00403B36h ; __vbaExceptHandler
  loc_00617FCB: mov eax, fs:[00000000h]
  loc_00617FD1: push eax
  loc_00617FD2: mov fs:[00000000h], esp
  loc_00617FD9: sub esp, 000000A8h
  loc_00617FDF: push ebx
  loc_00617FE0: push esi
  loc_00617FE1: push edi
  loc_00617FE2: mov var_C, esp
  loc_00617FE5: mov var_8, 00403B08h
  loc_00617FEC: mov edi, Me
  loc_00617FEF: mov eax, edi
  loc_00617FF1: and eax, 00000001h
  loc_00617FF4: mov var_4, eax
  loc_00617FF7: and edi, FFFFFFFEh
  loc_00617FFA: push edi
  loc_00617FFB: mov Me, edi
  loc_00617FFE: mov ecx, [edi]
  loc_00618000: call [ecx+00000004h]
  loc_00618003: xor esi, esi
  loc_00618005: mov edx, 0041EA94h ; "0123456789."
  loc_0061800A: lea ecx, var_18
  loc_0061800D: mov var_18, esi
  loc_00618010: mov var_1C, esi
  loc_00618013: mov var_2C, esi
  loc_00618016: mov var_3C, esi
  loc_00618019: mov var_4C, esi
  loc_0061801C: mov var_5C, esi
  loc_0061801F: mov var_6C, esi
  loc_00618022: mov var_7C, esi
  loc_00618025: mov var_8C, esi
  loc_0061802B: mov var_9C, esi
  loc_00618031: mov var_AC, esi
  loc_00618037: call [004011ECh] ; __vbaStrCopy
  loc_0061803D: mov ebx, KeyAscii
  loc_00618040: mov edx, var_18
  loc_00618043: lea ecx, var_2C
  loc_00618046: mov var_74, edx
  loc_00618049: movsx eax, [ebx]
  loc_0061804C: push eax
  loc_0061804D: push ecx
  loc_0061804E: mov var_7C, 00000008h
  loc_00618055: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0061805B: mov ax, [ebx]
  loc_0061805E: xor edx, edx
  loc_00618060: cmp ax, 0008h
  loc_00618064: mov ecx, 0000000Bh
  loc_00618069: setz dl
  loc_0061806C: neg edx
  loc_0061806E: mov var_94, dx
  loc_00618075: xor edx, edx
  loc_00618077: cmp ax, 000Dh
  loc_0061807B: mov var_9C, ecx
  loc_00618081: setz dl
  loc_00618084: neg edx
  loc_00618086: mov var_AC, ecx
  loc_0061808C: lea eax, var_7C
  loc_0061808F: push 00000001h
  loc_00618091: lea ecx, var_2C
  loc_00618094: mov var_A4, dx
  loc_0061809B: push eax
  loc_0061809C: push ecx
  loc_0061809D: lea edx, var_3C
  loc_006180A0: push esi
  loc_006180A1: push edx
  loc_006180A2: mov var_84, esi
  loc_006180A8: mov var_8C, 00008002h
  loc_006180B2: call [004011A8h] ; __vbaInStrVar
  loc_006180B8: push eax
  loc_006180B9: lea eax, var_8C
  loc_006180BF: lea ecx, var_4C
  loc_006180C2: push eax
  loc_006180C3: push ecx
  loc_006180C4: call [00401050h] ; __vbaVarCmpNe
  loc_006180CA: push eax
  loc_006180CB: lea edx, var_9C
  loc_006180D1: lea eax, var_5C
  loc_006180D4: push edx
  loc_006180D5: push eax
  loc_006180D6: call [0040112Ch] ; __vbaVarOr
  loc_006180DC: lea ecx, var_AC
  loc_006180E2: push eax
  loc_006180E3: lea edx, var_6C
  loc_006180E6: push ecx
  loc_006180E7: push edx
  loc_006180E8: call [0040112Ch] ; __vbaVarOr
  loc_006180EE: push eax
  loc_006180EF: call [004010E0h] ; __vbaBoolVarNull
  loc_006180F5: mov var_B0, ax
  loc_006180FC: lea eax, var_AC
  loc_00618102: lea ecx, var_9C
  loc_00618108: push eax
  loc_00618109: lea edx, var_3C
  loc_0061810C: push ecx
  loc_0061810D: lea eax, var_2C
  loc_00618110: push edx
  loc_00618111: push eax
  loc_00618112: push 00000004h
  loc_00618114: call [00401038h] ; __vbaFreeVarList
  loc_0061811A: add esp, 00000014h
  loc_0061811D: cmp var_B0, si
  loc_00618124: jz 00618174h
  loc_00618126: mov ax, [ebx]
  loc_00618129: cmp ax, 000Dh
  loc_0061812D: mov [ebx], ax
  loc_00618130: jnz 00618177h
  loc_00618132: mov ecx, [edi]
  loc_00618134: push edi
  loc_00618135: call [ecx+00000300h]
  loc_0061813B: lea edx, var_1C
  loc_0061813E: push eax
  loc_0061813F: push edx
  loc_00618140: call [004010A0h] ; __vbaObjSet
  loc_00618146: mov edi, eax
  loc_00618148: push edi
  loc_00618149: mov eax, [edi]
  loc_0061814B: call [eax+00000204h]
  loc_00618151: cmp eax, esi
  loc_00618153: fnclex
  loc_00618155: jge 00618169h
  loc_00618157: push 00000204h
  loc_0061815C: push 0041E5E8h
  loc_00618161: push edi
  loc_00618162: push eax
  loc_00618163: call [00401074h] ; __vbaHresultCheckObj
  loc_00618169: lea ecx, var_1C
  loc_0061816C: call [004012B0h] ; __vbaFreeObj
  loc_00618172: jmp 00618177h
  loc_00618174: mov [ebx], si
  loc_00618177: mov var_4, esi
  loc_0061817A: push 006181B4h
  loc_0061817F: jmp 006181AAh
  loc_00618181: lea ecx, var_1C
  loc_00618184: call [004012B0h] ; __vbaFreeObj
  loc_0061818A: lea ecx, var_6C
  loc_0061818D: lea edx, var_5C
  loc_00618190: push ecx
  loc_00618191: lea eax, var_4C
  loc_00618194: push edx
  loc_00618195: lea ecx, var_3C
  loc_00618198: push eax
  loc_00618199: lea edx, var_2C
  loc_0061819C: push ecx
  loc_0061819D: push edx
  loc_0061819E: push 00000005h
  loc_006181A0: call [00401038h] ; __vbaFreeVarList
  loc_006181A6: add esp, 00000018h
  loc_006181A9: ret
  loc_006181AA: lea ecx, var_18
  loc_006181AD: call [004012ACh] ; __vbaFreeStr
  loc_006181B3: ret
  loc_006181B4: mov eax, Me
  loc_006181B7: push eax
  loc_006181B8: mov ecx, [eax]
  loc_006181BA: call [ecx+00000008h]
  loc_006181BD: mov eax, var_4
  loc_006181C0: mov ecx, var_14
  loc_006181C3: pop edi
  loc_006181C4: pop esi
  loc_006181C5: mov fs:[00000000h], ecx
  loc_006181CC: pop ebx
  loc_006181CD: mov esp, ebp
  loc_006181CF: pop ebp
  loc_006181D0: retn 0008h
End Sub

Private Sub txtNumber_KeyUp(KeyCode As Integer, Shift As Integer) '6181E0
  loc_006181E0: push ebp
  loc_006181E1: mov ebp, esp
  loc_006181E3: sub esp, 0000000Ch
  loc_006181E6: push 00403B36h ; __vbaExceptHandler
  loc_006181EB: mov eax, fs:[00000000h]
  loc_006181F1: push eax
  loc_006181F2: mov fs:[00000000h], esp
  loc_006181F9: sub esp, 000000B8h
  loc_006181FF: push ebx
  loc_00618200: push esi
  loc_00618201: push edi
  loc_00618202: mov var_C, esp
  loc_00618205: mov var_8, 00403B18h
  loc_0061820C: mov esi, Me
  loc_0061820F: mov eax, esi
  loc_00618211: and eax, 00000001h
  loc_00618214: mov var_4, eax
  loc_00618217: and esi, FFFFFFFEh
  loc_0061821A: push esi
  loc_0061821B: mov Me, esi
  loc_0061821E: mov ecx, [esi]
  loc_00618220: call [ecx+00000004h]
  loc_00618223: mov edx, KeyCode
  loc_00618226: xor ebx, ebx
  loc_00618228: mov var_18, ebx
  loc_0061822B: mov var_1C, ebx
  loc_0061822E: cmp [edx], 0008h
  loc_00618232: mov var_20, ebx
  loc_00618235: mov var_24, ebx
  loc_00618238: mov var_34, ebx
  loc_0061823B: mov var_44, ebx
  loc_0061823E: mov var_54, ebx
  loc_00618241: mov var_64, ebx
  loc_00618244: mov var_74, ebx
  loc_00618247: mov var_84, ebx
  loc_0061824D: mov var_94, ebx
  loc_00618253: mov var_A4, ebx
  loc_00618259: jz 00618677h
  loc_0061825F: mov eax, [esi]
  loc_00618261: push esi
  loc_00618262: call [eax+00000304h]
  loc_00618268: lea ecx, var_20
  loc_0061826B: push eax
  loc_0061826C: push ecx
  loc_0061826D: call [004010A0h] ; __vbaObjSet
  loc_00618273: mov edi, eax
  loc_00618275: lea eax, var_18
  loc_00618278: push eax
  loc_00618279: push edi
  loc_0061827A: mov edx, [edi]
  loc_0061827C: call [edx+000000A0h]
  loc_00618282: cmp eax, ebx
  loc_00618284: fnclex
  loc_00618286: jge 0061829Ah
  loc_00618288: push 000000A0h
  loc_0061828D: push 0041E5E8h
  loc_00618292: push edi
  loc_00618293: push eax
  loc_00618294: call [00401074h] ; __vbaHresultCheckObj
  loc_0061829A: mov ecx, var_18
  loc_0061829D: push ecx
  loc_0061829E: call [0040102Ch] ; __vbaLenBstr
  loc_006182A4: xor edx, edx
  loc_006182A6: cmp eax, 00000002h
  loc_006182A9: setl dl
  loc_006182AC: neg edx
  loc_006182AE: lea ecx, var_18
  loc_006182B1: mov di, dx
  loc_006182B4: call [004012ACh] ; __vbaFreeStr
  loc_006182BA: lea ecx, var_20
  loc_006182BD: call [004012B0h] ; __vbaFreeObj
  loc_006182C3: cmp di, bx
  loc_006182C6: jnz 00618677h
  loc_006182CC: mov eax, [esi]
  loc_006182CE: push esi
  loc_006182CF: call [eax+00000304h]
  loc_006182D5: lea ecx, var_20
  loc_006182D8: push eax
  loc_006182D9: push ecx
  loc_006182DA: call [004010A0h] ; __vbaObjSet
  loc_006182E0: mov edi, eax
  loc_006182E2: lea eax, var_18
  loc_006182E5: push eax
  loc_006182E6: push edi
  loc_006182E7: mov edx, [edi]
  loc_006182E9: call [edx+000000A0h]
  loc_006182EF: cmp eax, ebx
  loc_006182F1: fnclex
  loc_006182F3: jge 00618307h
  loc_006182F5: push 000000A0h
  loc_006182FA: push 0041E5E8h
  loc_006182FF: push edi
  loc_00618300: push eax
  loc_00618301: call [00401074h] ; __vbaHresultCheckObj
  loc_00618307: mov ecx, [esi]
  loc_00618309: push esi
  loc_0061830A: call [ecx+00000304h]
  loc_00618310: lea edx, var_24
  loc_00618313: push eax
  loc_00618314: push edx
  loc_00618315: call [004010A0h] ; __vbaObjSet
  loc_0061831B: mov edi, eax
  loc_0061831D: lea ecx, var_1C
  loc_00618320: push ecx
  loc_00618321: push edi
  loc_00618322: mov eax, [edi]
  loc_00618324: call [eax+000000A0h]
  loc_0061832A: cmp eax, ebx
  loc_0061832C: fnclex
  loc_0061832E: jge 00618342h
  loc_00618330: push 000000A0h
  loc_00618335: push 0041E5E8h
  loc_0061833A: push edi
  loc_0061833B: push eax
  loc_0061833C: call [00401074h] ; __vbaHresultCheckObj
  loc_00618342: mov eax, var_18
  loc_00618345: lea edx, var_34
  loc_00618348: mov var_2C, eax
  loc_0061834B: push 00000002h
  loc_0061834D: lea eax, var_44
  loc_00618350: mov var_18, ebx
  loc_00618353: mov ebx, [00401278h] ; rtcRightCharVar
  loc_00618359: push edx
  loc_0061835A: push eax
  loc_0061835B: mov var_34, 00000008h
  loc_00618362: call ebx
  loc_00618364: lea ecx, var_44
  loc_00618367: push ecx
  loc_00618368: call [0040111Ch] ; rtcIsNumeric
  loc_0061836E: mov var_9C, ax
  loc_00618375: mov eax, var_1C
  loc_00618378: mov var_4C, eax
  loc_0061837B: lea edx, var_54
  loc_0061837E: push 00000002h
  loc_00618380: lea eax, var_64
  loc_00618383: xor edi, edi
  loc_00618385: push edx
  loc_00618386: push eax
  loc_00618387: mov var_A4, 0000000Bh
  loc_00618391: mov var_1C, edi
  loc_00618394: mov var_54, 00000008h
  loc_0061839B: call ebx
  loc_0061839D: lea ecx, var_A4
  loc_006183A3: lea edx, var_64
  loc_006183A6: push ecx
  loc_006183A7: lea eax, var_94
  loc_006183AD: push edx
  loc_006183AE: lea ecx, var_74
  loc_006183B1: push eax
  loc_006183B2: push ecx
  loc_006183B3: mov var_8C, edi
  loc_006183B9: mov var_94, 00008002h
  loc_006183C3: call [004010ECh] ; __vbaVarCmpGt
  loc_006183C9: lea edx, var_84
  loc_006183CF: push eax
  loc_006183D0: push edx
  loc_006183D1: call [0040115Ch] ; __vbaVarAnd
  loc_006183D7: push eax
  loc_006183D8: call [004010E0h] ; __vbaBoolVarNull
  loc_006183DE: mov edi, eax
  loc_006183E0: lea eax, var_24
  loc_006183E3: lea ecx, var_20
  loc_006183E6: push eax
  loc_006183E7: push ecx
  loc_006183E8: push 00000002h
  loc_006183EA: call [00401040h] ; __vbaFreeObjList
  loc_006183F0: lea edx, var_A4
  loc_006183F6: lea eax, var_64
  loc_006183F9: push edx
  loc_006183FA: lea ecx, var_54
  loc_006183FD: push eax
  loc_006183FE: lea edx, var_44
  loc_00618401: push ecx
  loc_00618402: lea eax, var_34
  loc_00618405: push edx
  loc_00618406: push eax
  loc_00618407: push 00000005h
  loc_00618409: call [00401038h] ; __vbaFreeVarList
  loc_0061840F: add esp, 00000024h
  loc_00618412: test di, di
  loc_00618415: jz 006184F7h
  loc_0061841B: mov ecx, [esi]
  loc_0061841D: push esi
  loc_0061841E: call [ecx+00000304h]
  loc_00618424: lea edx, var_24
  loc_00618427: push eax
  loc_00618428: push edx
  loc_00618429: call [004010A0h] ; __vbaObjSet
  loc_0061842F: mov ebx, eax
  loc_00618431: mov eax, [esi]
  loc_00618433: push esi
  loc_00618434: call [eax+00000304h]
  loc_0061843A: lea ecx, var_20
  loc_0061843D: push eax
  loc_0061843E: push ecx
  loc_0061843F: call [004010A0h] ; __vbaObjSet
  loc_00618445: mov edi, eax
  loc_00618447: lea eax, var_18
  loc_0061844A: push eax
  loc_0061844B: push edi
  loc_0061844C: mov edx, [edi]
  loc_0061844E: call [edx+000000A0h]
  loc_00618454: test eax, eax
  loc_00618456: fnclex
  loc_00618458: jge 0061846Ch
  loc_0061845A: push 000000A0h
  loc_0061845F: push 0041E5E8h
  loc_00618464: push edi
  loc_00618465: push eax
  loc_00618466: call [00401074h] ; __vbaHresultCheckObj
  loc_0061846C: mov ecx, var_18
  loc_0061846F: mov edi, [ebx]
  loc_00618471: push ecx
  loc_00618472: push 0041F1E0h ; "-"
  loc_00618477: call [00401054h] ; __vbaStrCat
  loc_0061847D: mov edx, eax
  loc_0061847F: lea ecx, var_1C
  loc_00618482: call [00401270h] ; __vbaStrMove
  loc_00618488: push eax
  loc_00618489: push ebx
  loc_0061848A: call [edi+000000A4h]
  loc_00618490: test eax, eax
  loc_00618492: fnclex
  loc_00618494: jge 006184A8h
  loc_00618496: push 000000A4h
  loc_0061849B: push 0041E5E8h
  loc_006184A0: push ebx
  loc_006184A1: push eax
  loc_006184A2: call [00401074h] ; __vbaHresultCheckObj
  loc_006184A8: lea edx, var_1C
  loc_006184AB: lea eax, var_18
  loc_006184AE: push edx
  loc_006184AF: push eax
  loc_006184B0: push 00000002h
  loc_006184B2: call [004011FCh] ; __vbaFreeStrList
  loc_006184B8: lea ecx, var_24
  loc_006184BB: lea edx, var_20
  loc_006184BE: push ecx
  loc_006184BF: push edx
  loc_006184C0: push 00000002h
  loc_006184C2: call [00401040h] ; __vbaFreeObjList
  loc_006184C8: add esp, 00000018h
  loc_006184CB: lea eax, var_34
  loc_006184CE: mov var_2C, 80020004h
  loc_006184D5: mov var_34, 0000000Ah
  loc_006184DC: push eax
  loc_006184DD: push 00433B24h ; "{End}"
  loc_006184E2: call [004010C0h] ; rtcSendKeys
  loc_006184E8: lea ecx, var_34
  loc_006184EB: call [00401020h] ; __vbaFreeVar
  loc_006184F1: mov ebx, [00401278h] ; rtcRightCharVar
  loc_006184F7: mov ecx, [esi]
  loc_006184F9: push esi
  loc_006184FA: call [ecx+00000304h]
  loc_00618500: lea edx, var_20
  loc_00618503: push eax
  loc_00618504: push edx
  loc_00618505: call [004010A0h] ; __vbaObjSet
  loc_0061850B: mov edi, eax
  loc_0061850D: lea ecx, var_18
  loc_00618510: push ecx
  loc_00618511: push edi
  loc_00618512: mov eax, [edi]
  loc_00618514: call [eax+000000A0h]
  loc_0061851A: test eax, eax
  loc_0061851C: fnclex
  loc_0061851E: jge 00618532h
  loc_00618520: push 000000A0h
  loc_00618525: push 0041E5E8h
  loc_0061852A: push edi
  loc_0061852B: push eax
  loc_0061852C: call [00401074h] ; __vbaHresultCheckObj
  loc_00618532: mov eax, var_18
  loc_00618535: lea edx, var_34
  loc_00618538: mov var_2C, eax
  loc_0061853B: push 00000002h
  loc_0061853D: lea eax, var_44
  loc_00618540: push edx
  loc_00618541: push eax
  loc_00618542: mov var_18, 00000000h
  loc_00618549: mov var_34, 00000008h
  loc_00618550: call ebx
  loc_00618552: lea ecx, var_44
  loc_00618555: lea edx, var_94
  loc_0061855B: push ecx
  loc_0061855C: push edx
  loc_0061855D: mov var_8C, 004219B4h ; "00"
  loc_00618567: mov var_94, 00008008h
  loc_00618571: call [00401110h] ; __vbaVarTstEq
  loc_00618577: lea ecx, var_20
  loc_0061857A: mov di, ax
  loc_0061857D: call [004012B0h] ; __vbaFreeObj
  loc_00618583: lea eax, var_44
  loc_00618586: lea ecx, var_34
  loc_00618589: push eax
  loc_0061858A: push ecx
  loc_0061858B: push 00000002h
  loc_0061858D: call [00401038h] ; __vbaFreeVarList
  loc_00618593: add esp, 0000000Ch
  loc_00618596: test di, di
  loc_00618599: jz 00618675h
  loc_0061859F: mov edx, [esi]
  loc_006185A1: push esi
  loc_006185A2: call [edx+00000304h]
  loc_006185A8: push eax
  loc_006185A9: lea eax, var_24
  loc_006185AC: push eax
  loc_006185AD: call [004010A0h] ; __vbaObjSet
  loc_006185B3: mov ecx, [esi]
  loc_006185B5: push esi
  loc_006185B6: mov edi, eax
  loc_006185B8: call [ecx+00000304h]
  loc_006185BE: lea edx, var_20
  loc_006185C1: push eax
  loc_006185C2: push edx
  loc_006185C3: call [004010A0h] ; __vbaObjSet
  loc_006185C9: mov esi, eax
  loc_006185CB: lea ecx, var_18
  loc_006185CE: push ecx
  loc_006185CF: push esi
  loc_006185D0: mov eax, [esi]
  loc_006185D2: call [eax+000000A0h]
  loc_006185D8: test eax, eax
  loc_006185DA: fnclex
  loc_006185DC: jge 006185F0h
  loc_006185DE: push 000000A0h
  loc_006185E3: push 0041E5E8h
  loc_006185E8: push esi
  loc_006185E9: push eax
  loc_006185EA: call [00401074h] ; __vbaHresultCheckObj
  loc_006185F0: mov edx, var_18
  loc_006185F3: mov esi, [edi]
  loc_006185F5: push edx
  loc_006185F6: push 0041F1E0h ; "-"
  loc_006185FB: call [00401054h] ; __vbaStrCat
  loc_00618601: mov edx, eax
  loc_00618603: lea ecx, var_1C
  loc_00618606: call [00401270h] ; __vbaStrMove
  loc_0061860C: push eax
  loc_0061860D: push edi
  loc_0061860E: call [esi+000000A4h]
  loc_00618614: test eax, eax
  loc_00618616: fnclex
  loc_00618618: jge 0061862Ch
  loc_0061861A: push 000000A4h
  loc_0061861F: push 0041E5E8h
  loc_00618624: push edi
  loc_00618625: push eax
  loc_00618626: call [00401074h] ; __vbaHresultCheckObj
  loc_0061862C: lea eax, var_1C
  loc_0061862F: lea ecx, var_18
  loc_00618632: push eax
  loc_00618633: push ecx
  loc_00618634: push 00000002h
  loc_00618636: call [004011FCh] ; __vbaFreeStrList
  loc_0061863C: lea edx, var_24
  loc_0061863F: lea eax, var_20
  loc_00618642: push edx
  loc_00618643: push eax
  loc_00618644: push 00000002h
  loc_00618646: call [00401040h] ; __vbaFreeObjList
  loc_0061864C: add esp, 00000018h
  loc_0061864F: lea ecx, var_34
  loc_00618652: mov var_2C, 80020004h
  loc_00618659: mov var_34, 0000000Ah
  loc_00618660: push ecx
  loc_00618661: push 00433B24h ; "{End}"
  loc_00618666: call [004010C0h] ; rtcSendKeys
  loc_0061866C: lea ecx, var_34
  loc_0061866F: call [00401020h] ; __vbaFreeVar
  loc_00618675: xor ebx, ebx
  loc_00618677: mov var_4, ebx
  loc_0061867A: push 006186C9h
  loc_0061867F: jmp 006186C8h
  loc_00618681: lea edx, var_1C
  loc_00618684: lea eax, var_18
  loc_00618687: push edx
  loc_00618688: push eax
  loc_00618689: push 00000002h
  loc_0061868B: call [004011FCh] ; __vbaFreeStrList
  loc_00618691: lea ecx, var_24
  loc_00618694: lea edx, var_20
  loc_00618697: push ecx
  loc_00618698: push edx
  loc_00618699: push 00000002h
  loc_0061869B: call [00401040h] ; __vbaFreeObjList
  loc_006186A1: lea eax, var_84
  loc_006186A7: lea ecx, var_74
  loc_006186AA: push eax
  loc_006186AB: lea edx, var_64
  loc_006186AE: push ecx
  loc_006186AF: lea eax, var_54
  loc_006186B2: push edx
  loc_006186B3: lea ecx, var_44
  loc_006186B6: push eax
  loc_006186B7: lea edx, var_34
  loc_006186BA: push ecx
  loc_006186BB: push edx
  loc_006186BC: push 00000006h
  loc_006186BE: call [00401038h] ; __vbaFreeVarList
  loc_006186C4: add esp, 00000034h
  loc_006186C7: ret
  loc_006186C8: ret
  loc_006186C9: mov eax, Me
  loc_006186CC: push eax
  loc_006186CD: mov ecx, [eax]
  loc_006186CF: call [ecx+00000008h]
  loc_006186D2: mov eax, var_4
  loc_006186D5: mov ecx, var_14
  loc_006186D8: pop edi
  loc_006186D9: pop esi
  loc_006186DA: mov fs:[00000000h], ecx
  loc_006186E1: pop ebx
  loc_006186E2: mov esp, ebp
  loc_006186E4: pop ebp
  loc_006186E5: retn 000Ch
End Sub
