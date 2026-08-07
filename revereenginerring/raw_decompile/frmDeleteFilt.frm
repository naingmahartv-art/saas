VERSION 5.00
Begin VB.Form frmDeleteFilt
  Caption = "Delete Filter"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 4680
  ClientHeight = 1845
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton Command2
    Caption = "pm&&if;rsm; zsufypfjcif; ( wpfywfpm )"
    Left = 180
    Top = 945
    Width = 4335
    Height = 690
    TabIndex = 1
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
  Begin VB.CommandButton Command1
    Caption = "pm&&if;rsm; zsufypfjcif;"
    Left = 180
    Top = 225
    Width = 4335
    Height = 690
    TabIndex = 0
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

Attribute VB_Name = "frmDeleteFilt"


Private Sub Command1_Click() '5FBE80
  loc_005FBE80: push ebp
  loc_005FBE81: mov ebp, esp
  loc_005FBE83: sub esp, 0000000Ch
  loc_005FBE86: push 00403B36h ; __vbaExceptHandler
  loc_005FBE8B: mov eax, fs:[00000000h]
  loc_005FBE91: push eax
  loc_005FBE92: mov fs:[00000000h], esp
  loc_005FBE99: sub esp, 00000018h
  loc_005FBE9C: push ebx
  loc_005FBE9D: push esi
  loc_005FBE9E: push edi
  loc_005FBE9F: mov var_C, esp
  loc_005FBEA2: mov var_8, 004033F8h
  loc_005FBEA9: mov edi, Me
  loc_005FBEAC: mov eax, edi
  loc_005FBEAE: and eax, 00000001h
  loc_005FBEB1: mov var_4, eax
  loc_005FBEB4: and edi, FFFFFFFEh
  loc_005FBEB7: push edi
  loc_005FBEB8: mov Me, edi
  loc_005FBEBB: mov ecx, [edi]
  loc_005FBEBD: call [ecx+00000004h]
  loc_005FBEC0: mov eax, [0061B394h]
  loc_005FBEC5: xor ebx, ebx
  loc_005FBEC7: cmp eax, ebx
  loc_005FBEC9: mov var_18, ebx
  loc_005FBECC: mov [0061A104h], FFFFFFh
  loc_005FBED5: jnz 005FBEE7h
  loc_005FBED7: push 0061B394h
  loc_005FBEDC: push 0041E4A0h
  loc_005FBEE1: call [004011DCh] ; __vbaNew2
  loc_005FBEE7: mov esi, [0061B394h]
  loc_005FBEED: lea eax, var_18
  loc_005FBEF0: push edi
  loc_005FBEF1: push eax
  loc_005FBEF2: mov edx, [esi]
  loc_005FBEF4: mov var_2C, edx
  loc_005FBEF7: call [004010B8h] ; __vbaObjSetAddref
  loc_005FBEFD: mov ecx, var_2C
  loc_005FBF00: push eax
  loc_005FBF01: push esi
  loc_005FBF02: call [ecx+00000010h]
  loc_005FBF05: cmp eax, ebx
  loc_005FBF07: fnclex
  loc_005FBF09: jge 005FBF1Ah
  loc_005FBF0B: push 00000010h
  loc_005FBF0D: push 0041E490h
  loc_005FBF12: push esi
  loc_005FBF13: push eax
  loc_005FBF14: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBF1A: lea ecx, var_18
  loc_005FBF1D: call [004012B0h] ; __vbaFreeObj
  loc_005FBF23: mov var_4, ebx
  loc_005FBF26: push 005FBF38h
  loc_005FBF2B: jmp 005FBF37h
  loc_005FBF2D: lea ecx, var_18
  loc_005FBF30: call [004012B0h] ; __vbaFreeObj
  loc_005FBF36: ret
  loc_005FBF37: ret
  loc_005FBF38: mov eax, Me
  loc_005FBF3B: push eax
  loc_005FBF3C: mov edx, [eax]
  loc_005FBF3E: call [edx+00000008h]
  loc_005FBF41: mov eax, var_4
  loc_005FBF44: mov ecx, var_14
  loc_005FBF47: pop edi
  loc_005FBF48: pop esi
  loc_005FBF49: mov fs:[00000000h], ecx
  loc_005FBF50: pop ebx
  loc_005FBF51: mov esp, ebp
  loc_005FBF53: pop ebp
  loc_005FBF54: retn 0004h
End Sub

Private Sub Command2_Click() '5FBF60
  loc_005FBF60: push ebp
  loc_005FBF61: mov ebp, esp
  loc_005FBF63: sub esp, 0000000Ch
  loc_005FBF66: push 00403B36h ; __vbaExceptHandler
  loc_005FBF6B: mov eax, fs:[00000000h]
  loc_005FBF71: push eax
  loc_005FBF72: mov fs:[00000000h], esp
  loc_005FBF79: sub esp, 00000018h
  loc_005FBF7C: push ebx
  loc_005FBF7D: push esi
  loc_005FBF7E: push edi
  loc_005FBF7F: mov var_C, esp
  loc_005FBF82: mov var_8, 00403408h
  loc_005FBF89: mov edi, Me
  loc_005FBF8C: mov eax, edi
  loc_005FBF8E: and eax, 00000001h
  loc_005FBF91: mov var_4, eax
  loc_005FBF94: and edi, FFFFFFFEh
  loc_005FBF97: push edi
  loc_005FBF98: mov Me, edi
  loc_005FBF9B: mov ecx, [edi]
  loc_005FBF9D: call [ecx+00000004h]
  loc_005FBFA0: mov eax, [0061B394h]
  loc_005FBFA5: xor ebx, ebx
  loc_005FBFA7: cmp eax, ebx
  loc_005FBFA9: mov var_18, ebx
  loc_005FBFAC: mov [0061A104h], bx
  loc_005FBFB3: jnz 005FBFC5h
  loc_005FBFB5: push 0061B394h
  loc_005FBFBA: push 0041E4A0h
  loc_005FBFBF: call [004011DCh] ; __vbaNew2
  loc_005FBFC5: mov esi, [0061B394h]
  loc_005FBFCB: lea eax, var_18
  loc_005FBFCE: push edi
  loc_005FBFCF: push eax
  loc_005FBFD0: mov edx, [esi]
  loc_005FBFD2: mov var_2C, edx
  loc_005FBFD5: call [004010B8h] ; __vbaObjSetAddref
  loc_005FBFDB: mov ecx, var_2C
  loc_005FBFDE: push eax
  loc_005FBFDF: push esi
  loc_005FBFE0: call [ecx+00000010h]
  loc_005FBFE3: cmp eax, ebx
  loc_005FBFE5: fnclex
  loc_005FBFE7: jge 005FBFF8h
  loc_005FBFE9: push 00000010h
  loc_005FBFEB: push 0041E490h
  loc_005FBFF0: push esi
  loc_005FBFF1: push eax
  loc_005FBFF2: call [00401074h] ; __vbaHresultCheckObj
  loc_005FBFF8: lea ecx, var_18
  loc_005FBFFB: call [004012B0h] ; __vbaFreeObj
  loc_005FC001: mov var_4, ebx
  loc_005FC004: push 005FC016h
  loc_005FC009: jmp 005FC015h
  loc_005FC00B: lea ecx, var_18
  loc_005FC00E: call [004012B0h] ; __vbaFreeObj
  loc_005FC014: ret
  loc_005FC015: ret
  loc_005FC016: mov eax, Me
  loc_005FC019: push eax
  loc_005FC01A: mov edx, [eax]
  loc_005FC01C: call [edx+00000008h]
  loc_005FC01F: mov eax, var_4
  loc_005FC022: mov ecx, var_14
  loc_005FC025: pop edi
  loc_005FC026: pop esi
  loc_005FC027: mov fs:[00000000h], ecx
  loc_005FC02E: pop ebx
  loc_005FC02F: mov esp, ebp
  loc_005FC031: pop ebp
  loc_005FC032: retn 0004h
End Sub
