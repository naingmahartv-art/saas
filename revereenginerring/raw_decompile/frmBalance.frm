VERSION 5.00
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmBalance
  Caption = "Open Cash Amount ...."
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  KeyPreview = -1  'True
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 8115
  ClientHeight = 8490
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
  Begin VB.ComboBox txtName
    Left = 1920
    Top = 450
    Width = 2055
    Height = 330
    TabIndex = 11
  End
  Begin Crystal.CrystalReport CrystalReport2
    OleObjectBlob = "frmBalance.frx":0000
    Left = 240
    Top = 3840
  End
  Begin VB.CommandButton cmdDelete
    Caption = "&Delete"
    Left = 3390
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 5
  End
  Begin VB.CommandButton cmdReports
    Caption = "&Reports"
    Left = 4380
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 6
  End
  Begin VB.CommandButton cmdNew
    Caption = "&New"
    Left = 1410
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 0
  End
  Begin VB.CommandButton cmdEdit
    Caption = "&Edit"
    Left = 2400
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 4
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 1410
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 2
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2400
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 3
  End
  Begin VB.TextBox txtAmount
    Left = 4860
    Top = 420
    Width = 1605
    Height = 345
    TabIndex = 1
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmBalance.frx":00F3
    Left = 240
    Top = 9240
  End
  Begin VB.CommandButton cmdClose
    Caption = "&Close"
    Left = 5370
    Top = 1200
    Width = 975
    Height = 345
    TabIndex = 7
  End
  Begin MSFlexGridLib.MSFlexGrid MSFle
    Left = 1020
    Top = 1710
    Width = 5985
    Height = 6225
    TabIndex = 8
    OleObjectBlob = "frmBalance.frx":01E6
  End
  Begin VB.Label Label2
    Caption = "Amount."
    Left = 4080
    Top = 510
    Width = 765
    Height = 225
    TabIndex = 10
  End
  Begin VB.Label Label1
    Caption = "Name."
    Left = 1380
    Top = 510
    Width = 795
    Height = 225
    TabIndex = 9
  End
  Begin VB.Menu mnuMain
    Visible = 0   'False
    Caption = "Main"
    Begin VB.Menu mnuDel
      Caption = "Delete Line"
    End
  End
End

Attribute VB_Name = "frmBalance"


Private Sub cmdCancel_Click() '60B130
  loc_0060B130: push ebp
  loc_0060B131: mov ebp, esp
  loc_0060B133: sub esp, 0000000Ch
  loc_0060B136: push 00403B36h ; __vbaExceptHandler
  loc_0060B13B: mov eax, fs:[00000000h]
  loc_0060B141: push eax
  loc_0060B142: mov fs:[00000000h], esp
  loc_0060B149: sub esp, 00000018h
  loc_0060B14C: push ebx
  loc_0060B14D: push esi
  loc_0060B14E: push edi
  loc_0060B14F: mov var_C, esp
  loc_0060B152: mov var_8, 004037C8h
  loc_0060B159: mov esi, Me
  loc_0060B15C: mov eax, esi
  loc_0060B15E: and eax, 00000001h
  loc_0060B161: mov var_4, eax
  loc_0060B164: and esi, FFFFFFFEh
  loc_0060B167: push esi
  loc_0060B168: mov Me, esi
  loc_0060B16B: mov ecx, [esi]
  loc_0060B16D: call [ecx+00000004h]
  loc_0060B170: mov edx, [esi]
  loc_0060B172: lea eax, var_1C
  loc_0060B175: xor edi, edi
  loc_0060B177: push eax
  loc_0060B178: mov var_1C, edi
  loc_0060B17B: push esi
  loc_0060B17C: mov var_18, edi
  loc_0060B17F: mov var_1C, FFFFFFFFh
  loc_0060B186: call [edx+000006FCh]
  loc_0060B18C: mov ecx, [esi]
  loc_0060B18E: lea edx, var_1C
  loc_0060B191: push edx
  loc_0060B192: push esi
  loc_0060B193: mov var_1C, edi
  loc_0060B196: call [ecx+000006F8h]
  loc_0060B19C: mov eax, [esi]
  loc_0060B19E: push esi
  loc_0060B19F: call [eax+00000308h]
  loc_0060B1A5: lea ecx, var_18
  loc_0060B1A8: push eax
  loc_0060B1A9: push ecx
  loc_0060B1AA: call [004010A0h] ; __vbaObjSet
  loc_0060B1B0: mov esi, eax
  loc_0060B1B2: push esi
  loc_0060B1B3: mov edx, [esi]
  loc_0060B1B5: call [edx+000001A4h]
  loc_0060B1BB: cmp eax, edi
  loc_0060B1BD: fnclex
  loc_0060B1BF: jge 0060B1D3h
  loc_0060B1C1: push 000001A4h
  loc_0060B1C6: push 0041EAACh
  loc_0060B1CB: push esi
  loc_0060B1CC: push eax
  loc_0060B1CD: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B1D3: lea ecx, var_18
  loc_0060B1D6: call [004012B0h] ; __vbaFreeObj
  loc_0060B1DC: mov var_4, edi
  loc_0060B1DF: push 0060B1F1h
  loc_0060B1E4: jmp 0060B1F0h
  loc_0060B1E6: lea ecx, var_18
  loc_0060B1E9: call [004012B0h] ; __vbaFreeObj
  loc_0060B1EF: ret
  loc_0060B1F0: ret
  loc_0060B1F1: mov eax, Me
  loc_0060B1F4: push eax
  loc_0060B1F5: mov ecx, [eax]
  loc_0060B1F7: call [ecx+00000008h]
  loc_0060B1FA: mov eax, var_4
  loc_0060B1FD: mov ecx, var_14
  loc_0060B200: pop edi
  loc_0060B201: pop esi
  loc_0060B202: mov fs:[00000000h], ecx
  loc_0060B209: pop ebx
  loc_0060B20A: mov esp, ebp
  loc_0060B20C: pop ebp
  loc_0060B20D: retn 0004h
End Sub

Private Sub cmdNew_Click() '60CCA0
  loc_0060CCA0: push ebp
  loc_0060CCA1: mov ebp, esp
  loc_0060CCA3: sub esp, 0000000Ch
  loc_0060CCA6: push 00403B36h ; __vbaExceptHandler
  loc_0060CCAB: mov eax, fs:[00000000h]
  loc_0060CCB1: push eax
  loc_0060CCB2: mov fs:[00000000h], esp
  loc_0060CCB9: sub esp, 00000018h
  loc_0060CCBC: push ebx
  loc_0060CCBD: push esi
  loc_0060CCBE: push edi
  loc_0060CCBF: mov var_C, esp
  loc_0060CCC2: mov var_8, 00403818h
  loc_0060CCC9: mov esi, Me
  loc_0060CCCC: mov eax, esi
  loc_0060CCCE: and eax, 00000001h
  loc_0060CCD1: mov var_4, eax
  loc_0060CCD4: and esi, FFFFFFFEh
  loc_0060CCD7: push esi
  loc_0060CCD8: mov Me, esi
  loc_0060CCDB: mov ecx, [esi]
  loc_0060CCDD: call [ecx+00000004h]
  loc_0060CCE0: mov edx, [esi]
  loc_0060CCE2: lea eax, var_1C
  loc_0060CCE5: xor edi, edi
  loc_0060CCE7: push eax
  loc_0060CCE8: mov var_1C, edi
  loc_0060CCEB: push esi
  loc_0060CCEC: mov var_18, edi
  loc_0060CCEF: mov var_1C, FFFFFFFFh
  loc_0060CCF6: call [edx+000006F8h]
  loc_0060CCFC: mov ecx, [esi]
  loc_0060CCFE: lea edx, var_1C
  loc_0060CD01: push edx
  loc_0060CD02: push esi
  loc_0060CD03: mov var_1C, edi
  loc_0060CD06: call [ecx+000006FCh]
  loc_0060CD0C: mov eax, [esi]
  loc_0060CD0E: push esi
  loc_0060CD0F: call [eax+00000700h]
  loc_0060CD15: mov ecx, [esi]
  loc_0060CD17: push esi
  loc_0060CD18: call [ecx+000002FCh]
  loc_0060CD1E: lea edx, var_18
  loc_0060CD21: push eax
  loc_0060CD22: push edx
  loc_0060CD23: call [004010A0h] ; __vbaObjSet
  loc_0060CD29: mov esi, eax
  loc_0060CD2B: push esi
  loc_0060CD2C: mov eax, [esi]
  loc_0060CD2E: call [eax+000001F4h]
  loc_0060CD34: cmp eax, edi
  loc_0060CD36: fnclex
  loc_0060CD38: jge 0060CD4Ch
  loc_0060CD3A: push 000001F4h
  loc_0060CD3F: push 0041F844h
  loc_0060CD44: push esi
  loc_0060CD45: push eax
  loc_0060CD46: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CD4C: lea ecx, var_18
  loc_0060CD4F: call [004012B0h] ; __vbaFreeObj
  loc_0060CD55: mov var_4, edi
  loc_0060CD58: push 0060CD6Ah
  loc_0060CD5D: jmp 0060CD69h
  loc_0060CD5F: lea ecx, var_18
  loc_0060CD62: call [004012B0h] ; __vbaFreeObj
  loc_0060CD68: ret
  loc_0060CD69: ret
  loc_0060CD6A: mov eax, Me
  loc_0060CD6D: push eax
  loc_0060CD6E: mov ecx, [eax]
  loc_0060CD70: call [ecx+00000008h]
  loc_0060CD73: mov eax, var_4
  loc_0060CD76: mov ecx, var_14
  loc_0060CD79: pop edi
  loc_0060CD7A: pop esi
  loc_0060CD7B: mov fs:[00000000h], ecx
  loc_0060CD82: pop ebx
  loc_0060CD83: mov esp, ebp
  loc_0060CD85: pop ebp
  loc_0060CD86: retn 0004h
End Sub

Private Sub cmdEdit_Click() '60C680
  loc_0060C680: push ebp
  loc_0060C681: mov ebp, esp
  loc_0060C683: sub esp, 0000000Ch
  loc_0060C686: push 00403B36h ; __vbaExceptHandler
  loc_0060C68B: mov eax, fs:[00000000h]
  loc_0060C691: push eax
  loc_0060C692: mov fs:[00000000h], esp
  loc_0060C699: sub esp, 000000D0h
  loc_0060C69F: push ebx
  loc_0060C6A0: push esi
  loc_0060C6A1: push edi
  loc_0060C6A2: mov var_C, esp
  loc_0060C6A5: mov var_8, 00403808h
  loc_0060C6AC: mov esi, Me
  loc_0060C6AF: mov eax, esi
  loc_0060C6B1: and eax, 00000001h
  loc_0060C6B4: mov var_4, eax
  loc_0060C6B7: and esi, FFFFFFFEh
  loc_0060C6BA: push esi
  loc_0060C6BB: mov Me, esi
  loc_0060C6BE: mov ecx, [esi]
  loc_0060C6C0: call [ecx+00000004h]
  loc_0060C6C3: xor edi, edi
  loc_0060C6C5: mov edx, 004268E8h ; "Balance"
  loc_0060C6CA: mov ecx, 0061A0A0h
  loc_0060C6CF: mov var_18, edi
  loc_0060C6D2: mov var_1C, edi
  loc_0060C6D5: mov var_20, edi
  loc_0060C6D8: mov var_24, edi
  loc_0060C6DB: mov var_34, edi
  loc_0060C6DE: mov var_44, edi
  loc_0060C6E1: mov var_54, edi
  loc_0060C6E4: mov var_64, edi
  loc_0060C6E7: mov var_74, edi
  loc_0060C6EA: mov var_84, edi
  loc_0060C6F0: mov var_94, edi
  loc_0060C6F6: mov var_A4, edi
  loc_0060C6FC: mov var_B4, edi
  loc_0060C702: mov var_B8, edi
  loc_0060C708: mov var_BC, edi
  loc_0060C70E: call [004011ECh] ; __vbaStrCopy
  loc_0060C714: cmp [0061A11Ch], edi
  loc_0060C71A: jnz 0060C72Ch
  loc_0060C71C: push 0061A11Ch
  loc_0060C721: push 004069CCh
  loc_0060C726: call [004011DCh] ; __vbaNew2
  loc_0060C72C: sub esp, 00000010h
  loc_0060C72F: mov ecx, 0000000Ah
  loc_0060C734: mov ebx, esp
  loc_0060C736: mov var_74, ecx
  loc_0060C739: mov eax, 80020004h
  loc_0060C73E: sub esp, 00000010h
  loc_0060C741: mov [ebx], ecx
  loc_0060C743: mov ecx, var_70
  loc_0060C746: mov var_6C, eax
  loc_0060C749: mov edi, [0061A11Ch]
  loc_0060C74F: mov [ebx+00000004h], ecx
  loc_0060C752: mov var_64, 00000002h
  loc_0060C759: mov ecx, esp
  loc_0060C75B: mov var_5C, 00000001h
  loc_0060C762: mov [ebx+00000008h], eax
  loc_0060C765: mov eax, var_68
  loc_0060C768: mov edx, [edi]
  loc_0060C76A: push edi
  loc_0060C76B: mov [ebx+0000000Ch], eax
  loc_0060C76E: mov eax, var_64
  loc_0060C771: mov [ecx], eax
  loc_0060C773: mov eax, var_60
  loc_0060C776: mov [ecx+00000004h], eax
  loc_0060C779: mov eax, var_5C
  loc_0060C77C: mov [ecx+00000008h], eax
  loc_0060C77F: mov eax, var_58
  loc_0060C782: mov [ecx+0000000Ch], eax
  loc_0060C785: call [edx+000002B0h]
  loc_0060C78B: test eax, eax
  loc_0060C78D: fnclex
  loc_0060C78F: jge 0060C7A3h
  loc_0060C791: push 000002B0h
  loc_0060C796: push 0041E6D0h
  loc_0060C79B: push edi
  loc_0060C79C: push eax
  loc_0060C79D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C7A3: mov edi, [004010D4h] ; rtcTrimVar
  loc_0060C7A9: lea ecx, var_64
  loc_0060C7AC: lea edx, var_34
  loc_0060C7AF: push ecx
  loc_0060C7B0: push edx
  loc_0060C7B1: mov var_5C, 0061A0B8h
  loc_0060C7B8: mov var_64, 00004008h
  loc_0060C7BF: call edi
  loc_0060C7C1: lea eax, var_34
  loc_0060C7C4: lea ecx, var_74
  loc_0060C7C7: push eax
  loc_0060C7C8: push ecx
  loc_0060C7C9: mov var_6C, 0041E5D4h
  loc_0060C7D0: mov var_74, 00008008h
  loc_0060C7D7: call [00401218h] ; __vbaVarTstNe
  loc_0060C7DD: lea ecx, var_34
  loc_0060C7E0: mov bx, ax
  loc_0060C7E3: call [00401020h] ; __vbaFreeVar
  loc_0060C7E9: test bx, bx
  loc_0060C7EC: jz 0060CC34h
  loc_0060C7F2: lea edx, var_64
  loc_0060C7F5: lea eax, var_34
  loc_0060C7F8: push edx
  loc_0060C7F9: push eax
  loc_0060C7FA: mov var_5C, 0061A0B8h
  loc_0060C801: mov var_64, 00004008h
  loc_0060C808: call edi
  loc_0060C80A: mov edi, 00000008h
  loc_0060C80F: mov var_6C, 00432224h ; "Select * From Balance where Name='"
  loc_0060C816: mov var_74, edi
  loc_0060C819: mov var_84, edi
  loc_0060C81F: mov edi, [0061A13Ch]
  loc_0060C825: mov var_7C, 0041E890h ; "'"
  loc_0060C82C: mov ecx, 0000000Ah
  loc_0060C831: mov eax, 80020004h
  loc_0060C836: mov ebx, [edi]
  loc_0060C838: lea edi, var_1C
  loc_0060C83B: push edi
  loc_0060C83C: mov var_A4, ecx
  loc_0060C842: sub esp, 00000010h
  loc_0060C845: mov edx, eax
  loc_0060C847: mov edi, esp
  loc_0060C849: sub esp, 00000010h
  loc_0060C84C: mov [edi], ecx
  loc_0060C84E: mov ecx, var_B0
  loc_0060C854: mov [edi+00000004h], ecx
  loc_0060C857: mov ecx, esp
  loc_0060C859: sub esp, 00000010h
  loc_0060C85C: mov [edi+00000008h], eax
  loc_0060C85F: mov eax, var_A8
  loc_0060C865: mov [edi+0000000Ch], eax
  loc_0060C868: mov eax, var_A4
  loc_0060C86E: mov [ecx], eax
  loc_0060C870: mov eax, var_A0
  loc_0060C876: mov edi, [004011B4h] ; __vbaVarCat
  loc_0060C87C: mov [ecx+00000004h], eax
  loc_0060C87F: mov eax, 00000003h
  loc_0060C884: mov [ecx+00000008h], edx
  loc_0060C887: mov edx, var_98
  loc_0060C88D: mov [ecx+0000000Ch], edx
  loc_0060C890: mov edx, var_90
  loc_0060C896: mov ecx, esp
  loc_0060C898: mov [ecx], eax
  loc_0060C89A: mov eax, 00000004h
  loc_0060C89F: mov [ecx+00000004h], edx
  loc_0060C8A2: lea edx, var_34
  loc_0060C8A5: mov [ecx+00000008h], eax
  loc_0060C8A8: mov eax, var_88
  loc_0060C8AE: mov [ecx+0000000Ch], eax
  loc_0060C8B1: lea ecx, var_74
  loc_0060C8B4: push ecx
  loc_0060C8B5: lea eax, var_44
  loc_0060C8B8: push edx
  loc_0060C8B9: push eax
  loc_0060C8BA: call edi
  loc_0060C8BC: lea ecx, var_84
  loc_0060C8C2: push eax
  loc_0060C8C3: lea edx, var_54
  loc_0060C8C6: push ecx
  loc_0060C8C7: push edx
  loc_0060C8C8: call edi
  loc_0060C8CA: push eax
  loc_0060C8CB: lea eax, var_18
  loc_0060C8CE: push eax
  loc_0060C8CF: call [004011B0h] ; __vbaStrVarVal
  loc_0060C8D5: mov ecx, [0061A13Ch]
  loc_0060C8DB: push eax
  loc_0060C8DC: push ecx
  loc_0060C8DD: call [ebx+000000BCh]
  loc_0060C8E3: test eax, eax
  loc_0060C8E5: fnclex
  loc_0060C8E7: jge 0060C905h
  loc_0060C8E9: mov edx, [0061A13Ch]
  loc_0060C8EF: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060C8F5: push 000000BCh
  loc_0060C8FA: push 0041E928h
  loc_0060C8FF: push edx
  loc_0060C900: push eax
  loc_0060C901: call ebx
  loc_0060C903: jmp 0060C90Bh
  loc_0060C905: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060C90B: mov eax, var_1C
  loc_0060C90E: lea edi, [esi+00000034h]
  loc_0060C911: push eax
  loc_0060C912: push edi
  loc_0060C913: call [004010B8h] ; __vbaObjSetAddref
  loc_0060C919: lea ecx, var_18
  loc_0060C91C: call [004012ACh] ; __vbaFreeStr
  loc_0060C922: lea ecx, var_1C
  loc_0060C925: call [004012B0h] ; __vbaFreeObj
  loc_0060C92B: lea ecx, var_54
  loc_0060C92E: lea edx, var_44
  loc_0060C931: push ecx
  loc_0060C932: lea eax, var_34
  loc_0060C935: push edx
  loc_0060C936: push eax
  loc_0060C937: push 00000003h
  loc_0060C939: call [00401038h] ; __vbaFreeVarList
  loc_0060C93F: mov eax, [edi]
  loc_0060C941: add esp, 00000010h
  loc_0060C944: lea edx, var_B8
  loc_0060C94A: mov ecx, [eax]
  loc_0060C94C: push edx
  loc_0060C94D: push eax
  loc_0060C94E: call [ecx+00000020h]
  loc_0060C951: test eax, eax
  loc_0060C953: fnclex
  loc_0060C955: jge 0060C964h
  loc_0060C957: mov ecx, [edi]
  loc_0060C959: push 00000020h
  loc_0060C95B: push 0041E938h
  loc_0060C960: push ecx
  loc_0060C961: push eax
  loc_0060C962: call ebx
  loc_0060C964: mov eax, [edi]
  loc_0060C966: lea ecx, var_BC
  loc_0060C96C: push ecx
  loc_0060C96D: push eax
  loc_0060C96E: mov edx, [eax]
  loc_0060C970: call [edx+00000034h]
  loc_0060C973: test eax, eax
  loc_0060C975: fnclex
  loc_0060C977: jge 0060C986h
  loc_0060C979: mov edx, [edi]
  loc_0060C97B: push 00000034h
  loc_0060C97D: push 0041E938h
  loc_0060C982: push edx
  loc_0060C983: push eax
  loc_0060C984: call ebx
  loc_0060C986: xor eax, eax
  loc_0060C988: cmp var_BC, ax
  loc_0060C98F: setz al
  loc_0060C992: xor ecx, ecx
  loc_0060C994: cmp var_B8, cx
  loc_0060C99B: setz cl
  loc_0060C99E: or eax, ecx
  loc_0060C9A0: jz 0060CB52h
  loc_0060C9A6: mov edx, [esi]
  loc_0060C9A8: push esi
  loc_0060C9A9: call [edx+00000318h]
  loc_0060C9AF: push eax
  loc_0060C9B0: lea eax, var_24
  loc_0060C9B3: push eax
  loc_0060C9B4: call [004010A0h] ; __vbaObjSet
  loc_0060C9BA: mov var_CC, eax
  loc_0060C9C0: mov eax, [edi]
  loc_0060C9C2: lea edx, var_1C
  loc_0060C9C5: mov ecx, [eax]
  loc_0060C9C7: push edx
  loc_0060C9C8: push eax
  loc_0060C9C9: call [ecx+000000B4h]
  loc_0060C9CF: test eax, eax
  loc_0060C9D1: fnclex
  loc_0060C9D3: jge 0060C9E5h
  loc_0060C9D5: mov ecx, [edi]
  loc_0060C9D7: push 000000B4h
  loc_0060C9DC: push 0041E938h
  loc_0060C9E1: push ecx
  loc_0060C9E2: push eax
  loc_0060C9E3: call ebx
  loc_0060C9E5: lea ebx, var_20
  loc_0060C9E8: mov eax, var_1C
  loc_0060C9EB: push ebx
  loc_0060C9EC: mov ecx, 00000008h
  loc_0060C9F1: sub esp, 00000010h
  loc_0060C9F4: mov var_64, ecx
  loc_0060C9F7: mov ebx, esp
  loc_0060C9F9: mov var_5C, 0042043Ch ; "Amount"
  loc_0060CA00: mov edx, [eax]
  loc_0060CA02: push eax
  loc_0060CA03: mov [ebx], ecx
  loc_0060CA05: mov ecx, var_60
  loc_0060CA08: mov var_C4, eax
  loc_0060CA0E: mov [ebx+00000004h], ecx
  loc_0060CA11: mov ecx, var_5C
  loc_0060CA14: mov [ebx+00000008h], ecx
  loc_0060CA17: mov ecx, var_58
  loc_0060CA1A: mov [ebx+0000000Ch], ecx
  loc_0060CA1D: call [edx+00000030h]
  loc_0060CA20: test eax, eax
  loc_0060CA22: fnclex
  loc_0060CA24: jge 0060CA3Bh
  loc_0060CA26: mov edx, var_C4
  loc_0060CA2C: push 00000030h
  loc_0060CA2E: push 0041EA14h ; "S"
  loc_0060CA33: push edx
  loc_0060CA34: push eax
  loc_0060CA35: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CA3B: mov eax, var_20
  loc_0060CA3E: lea ecx, var_44
  loc_0060CA41: mov var_2C, eax
  loc_0060CA44: lea eax, var_34
  loc_0060CA47: push eax
  loc_0060CA48: push ecx
  loc_0060CA49: mov var_20, 00000000h
  loc_0060CA50: mov var_34, 00000009h
  loc_0060CA57: call [004010D4h] ; rtcTrimVar
  loc_0060CA5D: mov edx, var_CC
  loc_0060CA63: lea eax, var_44
  loc_0060CA66: lea ecx, var_18
  loc_0060CA69: push eax
  loc_0060CA6A: mov ebx, [edx]
  loc_0060CA6C: push ecx
  loc_0060CA6D: call [004011B0h] ; __vbaStrVarVal
  loc_0060CA73: mov edx, ebx
  loc_0060CA75: mov ebx, var_CC
  loc_0060CA7B: push eax
  loc_0060CA7C: push ebx
  loc_0060CA7D: call [edx+000000A4h]
  loc_0060CA83: test eax, eax
  loc_0060CA85: fnclex
  loc_0060CA87: jge 0060CA9Bh
  loc_0060CA89: push 000000A4h
  loc_0060CA8E: push 0041E5E8h
  loc_0060CA93: push ebx
  loc_0060CA94: push eax
  loc_0060CA95: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CA9B: lea ecx, var_18
  loc_0060CA9E: call [004012ACh] ; __vbaFreeStr
  loc_0060CAA4: lea eax, var_24
  loc_0060CAA7: lea ecx, var_1C
  loc_0060CAAA: push eax
  loc_0060CAAB: push ecx
  loc_0060CAAC: push 00000002h
  loc_0060CAAE: call [00401040h] ; __vbaFreeObjList
  loc_0060CAB4: lea edx, var_44
  loc_0060CAB7: lea eax, var_34
  loc_0060CABA: push edx
  loc_0060CABB: push eax
  loc_0060CABC: push 00000002h
  loc_0060CABE: call [00401038h] ; __vbaFreeVarList
  loc_0060CAC4: mov ecx, [esi]
  loc_0060CAC6: add esp, 00000018h
  loc_0060CAC9: push esi
  loc_0060CACA: call [ecx+000002FCh]
  loc_0060CAD0: lea edx, var_1C
  loc_0060CAD3: push eax
  loc_0060CAD4: push edx
  loc_0060CAD5: call [004010A0h] ; __vbaObjSet
  loc_0060CADB: mov ebx, eax
  loc_0060CADD: lea eax, var_64
  loc_0060CAE0: lea ecx, var_34
  loc_0060CAE3: push eax
  loc_0060CAE4: push ecx
  loc_0060CAE5: mov var_C0, ebx
  loc_0060CAEB: mov var_5C, 0061A0B8h
  loc_0060CAF2: mov var_64, 00004008h
  loc_0060CAF9: call [004010D4h] ; rtcTrimVar
  loc_0060CAFF: mov ebx, [ebx]
  loc_0060CB01: lea edx, var_34
  loc_0060CB04: lea eax, var_18
  loc_0060CB07: push edx
  loc_0060CB08: push eax
  loc_0060CB09: call [004011B0h] ; __vbaStrVarVal
  loc_0060CB0F: mov ecx, ebx
  loc_0060CB11: mov ebx, var_C0
  loc_0060CB17: push eax
  loc_0060CB18: push ebx
  loc_0060CB19: call [ecx+000000ACh]
  loc_0060CB1F: test eax, eax
  loc_0060CB21: fnclex
  loc_0060CB23: jge 0060CB37h
  loc_0060CB25: push 000000ACh
  loc_0060CB2A: push 0041F844h
  loc_0060CB2F: push ebx
  loc_0060CB30: push eax
  loc_0060CB31: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CB37: lea ecx, var_18
  loc_0060CB3A: call [004012ACh] ; __vbaFreeStr
  loc_0060CB40: lea ecx, var_1C
  loc_0060CB43: call [004012B0h] ; __vbaFreeObj
  loc_0060CB49: lea ecx, var_34
  loc_0060CB4C: call [00401020h] ; __vbaFreeVar
  loc_0060CB52: mov eax, [edi]
  loc_0060CB54: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0060CB5A: push eax
  loc_0060CB5B: mov edx, [eax]
  loc_0060CB5D: call [edx+000000C4h]
  loc_0060CB63: test eax, eax
  loc_0060CB65: fnclex
  loc_0060CB67: jge 0060CB7Dh
  loc_0060CB69: mov ecx, [edi]
  loc_0060CB6B: push 000000C4h
  loc_0060CB70: push 0041E938h
  loc_0060CB75: push ecx
  loc_0060CB76: push eax
  loc_0060CB77: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CB7D: push 0041E938h
  loc_0060CB82: push 00000000h
  loc_0060CB84: call [00401274h] ; __vbaCastObj
  loc_0060CB8A: lea edx, var_1C
  loc_0060CB8D: push eax
  loc_0060CB8E: push edx
  loc_0060CB8F: call ebx
  loc_0060CB91: push eax
  loc_0060CB92: push edi
  loc_0060CB93: call [004010B8h] ; __vbaObjSetAddref
  loc_0060CB99: lea ecx, var_1C
  loc_0060CB9C: call [004012B0h] ; __vbaFreeObj
  loc_0060CBA2: mov eax, [esi]
  loc_0060CBA4: lea ecx, var_B8
  loc_0060CBAA: push ecx
  loc_0060CBAB: push esi
  loc_0060CBAC: mov var_B8, 00000000h
  loc_0060CBB6: call [eax+000006FCh]
  loc_0060CBBC: mov edx, [esi]
  loc_0060CBBE: push esi
  loc_0060CBBF: call [edx+00000318h]
  loc_0060CBC5: push eax
  loc_0060CBC6: lea eax, var_1C
  loc_0060CBC9: push eax
  loc_0060CBCA: call ebx
  loc_0060CBCC: mov edi, eax
  loc_0060CBCE: push FFFFFFFFh
  loc_0060CBD0: push edi
  loc_0060CBD1: mov ecx, [edi]
  loc_0060CBD3: call [ecx+0000008Ch]
  loc_0060CBD9: test eax, eax
  loc_0060CBDB: fnclex
  loc_0060CBDD: jge 0060CBF1h
  loc_0060CBDF: push 0000008Ch
  loc_0060CBE4: push 0041E5E8h
  loc_0060CBE9: push edi
  loc_0060CBEA: push eax
  loc_0060CBEB: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CBF1: mov edi, [004012B0h] ; __vbaFreeObj
  loc_0060CBF7: lea ecx, var_1C
  loc_0060CBFA: call edi
  loc_0060CBFC: mov edx, [esi]
  loc_0060CBFE: push esi
  loc_0060CBFF: call [edx+00000318h]
  loc_0060CC05: push eax
  loc_0060CC06: lea eax, var_1C
  loc_0060CC09: push eax
  loc_0060CC0A: call ebx
  loc_0060CC0C: mov esi, eax
  loc_0060CC0E: push esi
  loc_0060CC0F: mov ecx, [esi]
  loc_0060CC11: call [ecx+00000204h]
  loc_0060CC17: test eax, eax
  loc_0060CC19: fnclex
  loc_0060CC1B: jge 0060CC2Fh
  loc_0060CC1D: push 00000204h
  loc_0060CC22: push 0041E5E8h
  loc_0060CC27: push esi
  loc_0060CC28: push eax
  loc_0060CC29: call [00401074h] ; __vbaHresultCheckObj
  loc_0060CC2F: lea ecx, var_1C
  loc_0060CC32: call edi
  loc_0060CC34: mov var_4, 00000000h
  loc_0060CC3B: push 0060CC78h
  loc_0060CC40: jmp 0060CC77h
  loc_0060CC42: lea ecx, var_18
  loc_0060CC45: call [004012ACh] ; __vbaFreeStr
  loc_0060CC4B: lea edx, var_24
  loc_0060CC4E: lea eax, var_20
  loc_0060CC51: push edx
  loc_0060CC52: lea ecx, var_1C
  loc_0060CC55: push eax
  loc_0060CC56: push ecx
  loc_0060CC57: push 00000003h
  loc_0060CC59: call [00401040h] ; __vbaFreeObjList
  loc_0060CC5F: lea edx, var_54
  loc_0060CC62: lea eax, var_44
  loc_0060CC65: push edx
  loc_0060CC66: lea ecx, var_34
  loc_0060CC69: push eax
  loc_0060CC6A: push ecx
  loc_0060CC6B: push 00000003h
  loc_0060CC6D: call [00401038h] ; __vbaFreeVarList
  loc_0060CC73: add esp, 00000020h
  loc_0060CC76: ret
  loc_0060CC77: ret
  loc_0060CC78: mov eax, Me
  loc_0060CC7B: push eax
  loc_0060CC7C: mov edx, [eax]
  loc_0060CC7E: call [edx+00000008h]
  loc_0060CC81: mov eax, var_4
  loc_0060CC84: mov ecx, var_14
  loc_0060CC87: pop edi
  loc_0060CC88: pop esi
  loc_0060CC89: mov fs:[00000000h], ecx
  loc_0060CC90: pop ebx
  loc_0060CC91: mov esp, ebp
  loc_0060CC93: pop ebp
  loc_0060CC94: retn 0004h
End Sub

Private Sub txtName_KeyPress(KeyAscii As Integer) '60E410
  loc_0060E410: push ebp
  loc_0060E411: mov ebp, esp
  loc_0060E413: sub esp, 0000000Ch
  loc_0060E416: push 00403B36h ; __vbaExceptHandler
  loc_0060E41B: mov eax, fs:[00000000h]
  loc_0060E421: push eax
  loc_0060E422: mov fs:[00000000h], esp
  loc_0060E429: sub esp, 00000014h
  loc_0060E42C: push ebx
  loc_0060E42D: push esi
  loc_0060E42E: push edi
  loc_0060E42F: mov var_C, esp
  loc_0060E432: mov var_8, 00403898h
  loc_0060E439: mov esi, Me
  loc_0060E43C: mov eax, esi
  loc_0060E43E: and eax, 00000001h
  loc_0060E441: mov var_4, eax
  loc_0060E444: and esi, FFFFFFFEh
  loc_0060E447: push esi
  loc_0060E448: mov Me, esi
  loc_0060E44B: mov ecx, [esi]
  loc_0060E44D: call [ecx+00000004h]
  loc_0060E450: mov edx, KeyAscii
  loc_0060E453: xor edi, edi
  loc_0060E455: mov var_18, edi
  loc_0060E458: cmp [edx], 000Dh
  loc_0060E45C: jnz 0060E49Eh
  loc_0060E45E: mov eax, [esi]
  loc_0060E460: push esi
  loc_0060E461: call [eax+00000318h]
  loc_0060E467: lea ecx, var_18
  loc_0060E46A: push eax
  loc_0060E46B: push ecx
  loc_0060E46C: call [004010A0h] ; __vbaObjSet
  loc_0060E472: mov esi, eax
  loc_0060E474: push esi
  loc_0060E475: mov edx, [esi]
  loc_0060E477: call [edx+00000204h]
  loc_0060E47D: cmp eax, edi
  loc_0060E47F: fnclex
  loc_0060E481: jge 0060E495h
  loc_0060E483: push 00000204h
  loc_0060E488: push 0041E5E8h
  loc_0060E48D: push esi
  loc_0060E48E: push eax
  loc_0060E48F: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E495: lea ecx, var_18
  loc_0060E498: call [004012B0h] ; __vbaFreeObj
  loc_0060E49E: mov var_4, edi
  loc_0060E4A1: push 0060E4B3h
  loc_0060E4A6: jmp 0060E4B2h
  loc_0060E4A8: lea ecx, var_18
  loc_0060E4AB: call [004012B0h] ; __vbaFreeObj
  loc_0060E4B1: ret
  loc_0060E4B2: ret
  loc_0060E4B3: mov eax, Me
  loc_0060E4B6: push eax
  loc_0060E4B7: mov ecx, [eax]
  loc_0060E4B9: call [ecx+00000008h]
  loc_0060E4BC: mov eax, var_4
  loc_0060E4BF: mov ecx, var_14
  loc_0060E4C2: pop edi
  loc_0060E4C3: pop esi
  loc_0060E4C4: mov fs:[00000000h], ecx
  loc_0060E4CB: pop ebx
  loc_0060E4CC: mov esp, ebp
  loc_0060E4CE: pop ebp
  loc_0060E4CF: retn 0008h
End Sub

Private Sub txtName_LostFocus() '60E4E0
  loc_0060E4E0: push ebp
  loc_0060E4E1: mov ebp, esp
  loc_0060E4E3: sub esp, 0000000Ch
  loc_0060E4E6: push 00403B36h ; __vbaExceptHandler
  loc_0060E4EB: mov eax, fs:[00000000h]
  loc_0060E4F1: push eax
  loc_0060E4F2: mov fs:[00000000h], esp
  loc_0060E4F9: sub esp, 000000C0h
  loc_0060E4FF: push ebx
  loc_0060E500: push esi
  loc_0060E501: push edi
  loc_0060E502: mov var_C, esp
  loc_0060E505: mov var_8, 004038A8h
  loc_0060E50C: mov esi, Me
  loc_0060E50F: mov eax, esi
  loc_0060E511: and eax, 00000001h
  loc_0060E514: mov var_4, eax
  loc_0060E517: and esi, FFFFFFFEh
  loc_0060E51A: push esi
  loc_0060E51B: mov Me, esi
  loc_0060E51E: mov ecx, [esi]
  loc_0060E520: call [ecx+00000004h]
  loc_0060E523: mov edx, [esi]
  loc_0060E525: xor ebx, ebx
  loc_0060E527: push esi
  loc_0060E528: mov var_18, ebx
  loc_0060E52B: mov var_1C, ebx
  loc_0060E52E: mov var_20, ebx
  loc_0060E531: mov var_24, ebx
  loc_0060E534: mov var_34, ebx
  loc_0060E537: mov var_44, ebx
  loc_0060E53A: mov var_54, ebx
  loc_0060E53D: mov var_64, ebx
  loc_0060E540: mov var_74, ebx
  loc_0060E543: mov var_84, ebx
  loc_0060E549: mov var_94, ebx
  loc_0060E54F: mov var_A4, ebx
  loc_0060E555: mov var_B4, ebx
  loc_0060E55B: mov var_B8, ebx
  loc_0060E561: mov var_BC, ebx
  loc_0060E567: call [edx+000002FCh]
  loc_0060E56D: push eax
  loc_0060E56E: lea eax, var_20
  loc_0060E571: push eax
  loc_0060E572: call [004010A0h] ; __vbaObjSet
  loc_0060E578: mov edi, eax
  loc_0060E57A: lea edx, var_18
  loc_0060E57D: push edx
  loc_0060E57E: push edi
  loc_0060E57F: mov ecx, [edi]
  loc_0060E581: call [ecx+000000A8h]
  loc_0060E587: cmp eax, ebx
  loc_0060E589: fnclex
  loc_0060E58B: jge 0060E59Fh
  loc_0060E58D: push 000000A8h
  loc_0060E592: push 0041F844h
  loc_0060E597: push edi
  loc_0060E598: push eax
  loc_0060E599: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E59F: mov eax, var_18
  loc_0060E5A2: push eax
  loc_0060E5A3: push 0041E5D4h
  loc_0060E5A8: call [0040110Ch] ; __vbaStrCmp
  loc_0060E5AE: mov edi, eax
  loc_0060E5B0: lea ecx, var_18
  loc_0060E5B3: neg edi
  loc_0060E5B5: sbb edi, edi
  loc_0060E5B7: inc edi
  loc_0060E5B8: neg edi
  loc_0060E5BA: call [004012ACh] ; __vbaFreeStr
  loc_0060E5C0: lea ecx, var_20
  loc_0060E5C3: call [004012B0h] ; __vbaFreeObj
  loc_0060E5C9: cmp di, bx
  loc_0060E5CC: jnz 0060E913h
  loc_0060E5D2: mov ecx, [esi]
  loc_0060E5D4: push esi
  loc_0060E5D5: call [ecx+000002FCh]
  loc_0060E5DB: lea edx, var_20
  loc_0060E5DE: push eax
  loc_0060E5DF: push edx
  loc_0060E5E0: call [004010A0h] ; __vbaObjSet
  loc_0060E5E6: mov edi, eax
  loc_0060E5E8: lea ecx, var_18
  loc_0060E5EB: push ecx
  loc_0060E5EC: push edi
  loc_0060E5ED: mov eax, [edi]
  loc_0060E5EF: call [eax+000000A8h]
  loc_0060E5F5: cmp eax, ebx
  loc_0060E5F7: fnclex
  loc_0060E5F9: jge 0060E60Dh
  loc_0060E5FB: push 000000A8h
  loc_0060E600: push 0041F844h
  loc_0060E605: push edi
  loc_0060E606: push eax
  loc_0060E607: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E60D: mov eax, var_18
  loc_0060E610: lea edx, var_34
  loc_0060E613: mov var_2C, eax
  loc_0060E616: lea eax, var_44
  loc_0060E619: mov edi, 00000008h
  loc_0060E61E: push edx
  loc_0060E61F: push eax
  loc_0060E620: mov var_18, ebx
  loc_0060E623: mov var_34, edi
  loc_0060E626: call [004010D4h] ; rtcTrimVar
  loc_0060E62C: mov edx, [0061A13Ch]
  loc_0060E632: mov var_6C, 0042B7A8h ; "Select * From AgentTHAI Where AgentName='"
  loc_0060E639: mov var_74, edi
  loc_0060E63C: mov var_7C, 0041E890h ; "'"
  loc_0060E643: mov var_84, edi
  loc_0060E649: mov edi, [edx]
  loc_0060E64B: lea edx, var_24
  loc_0060E64E: mov ecx, 0000000Ah
  loc_0060E653: push edx
  loc_0060E654: mov var_A4, ecx
  loc_0060E65A: sub esp, 00000010h
  loc_0060E65D: mov eax, 80020004h
  loc_0060E662: mov edx, esp
  loc_0060E664: mov var_9C, eax
  loc_0060E66A: sub esp, 00000010h
  loc_0060E66D: mov [edx], ecx
  loc_0060E66F: mov ecx, var_B0
  loc_0060E675: mov [edx+00000004h], ecx
  loc_0060E678: mov ecx, esp
  loc_0060E67A: sub esp, 00000010h
  loc_0060E67D: mov [edx+00000008h], eax
  loc_0060E680: mov eax, var_A8
  loc_0060E686: mov [edx+0000000Ch], eax
  loc_0060E689: mov edx, var_A4
  loc_0060E68F: mov eax, var_A0
  loc_0060E695: mov [ecx], edx
  loc_0060E697: mov edx, var_9C
  loc_0060E69D: mov [ecx+00000004h], eax
  loc_0060E6A0: mov eax, var_98
  loc_0060E6A6: mov [ecx+00000008h], edx
  loc_0060E6A9: mov edx, var_90
  loc_0060E6AF: mov [ecx+0000000Ch], eax
  loc_0060E6B2: mov ecx, esp
  loc_0060E6B4: mov eax, 00000003h
  loc_0060E6B9: mov [ecx], eax
  loc_0060E6BB: mov eax, 00000004h
  loc_0060E6C0: mov [ecx+00000004h], edx
  loc_0060E6C3: lea edx, var_44
  loc_0060E6C6: mov [ecx+00000008h], eax
  loc_0060E6C9: mov eax, var_88
  loc_0060E6CF: mov [ecx+0000000Ch], eax
  loc_0060E6D2: lea ecx, var_74
  loc_0060E6D5: push ecx
  loc_0060E6D6: lea eax, var_54
  loc_0060E6D9: push edx
  loc_0060E6DA: push eax
  loc_0060E6DB: call [004011B4h] ; __vbaVarCat
  loc_0060E6E1: lea ecx, var_84
  loc_0060E6E7: push eax
  loc_0060E6E8: lea edx, var_64
  loc_0060E6EB: push ecx
  loc_0060E6EC: push edx
  loc_0060E6ED: call [004011B4h] ; __vbaVarCat
  loc_0060E6F3: push eax
  loc_0060E6F4: lea eax, var_1C
  loc_0060E6F7: push eax
  loc_0060E6F8: call [004011B0h] ; __vbaStrVarVal
  loc_0060E6FE: mov ecx, [0061A13Ch]
  loc_0060E704: push eax
  loc_0060E705: push ecx
  loc_0060E706: call [edi+000000BCh]
  loc_0060E70C: cmp eax, ebx
  loc_0060E70E: fnclex
  loc_0060E710: jge 0060E72Ah
  loc_0060E712: mov edx, [0061A13Ch]
  loc_0060E718: push 000000BCh
  loc_0060E71D: push 0041E928h
  loc_0060E722: push edx
  loc_0060E723: push eax
  loc_0060E724: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E72A: mov eax, var_24
  loc_0060E72D: lea edi, [esi+00000034h]
  loc_0060E730: push eax
  loc_0060E731: push edi
  loc_0060E732: call [004010B8h] ; __vbaObjSetAddref
  loc_0060E738: lea ecx, var_1C
  loc_0060E73B: call [004012ACh] ; __vbaFreeStr
  loc_0060E741: lea ecx, var_24
  loc_0060E744: lea edx, var_20
  loc_0060E747: push ecx
  loc_0060E748: push edx
  loc_0060E749: push 00000002h
  loc_0060E74B: call [00401040h] ; __vbaFreeObjList
  loc_0060E751: lea eax, var_64
  loc_0060E754: lea ecx, var_54
  loc_0060E757: push eax
  loc_0060E758: lea edx, var_44
  loc_0060E75B: push ecx
  loc_0060E75C: lea eax, var_34
  loc_0060E75F: push edx
  loc_0060E760: push eax
  loc_0060E761: push 00000004h
  loc_0060E763: call [00401038h] ; __vbaFreeVarList
  loc_0060E769: mov eax, [edi]
  loc_0060E76B: add esp, 00000020h
  loc_0060E76E: lea edx, var_B8
  loc_0060E774: mov ecx, [eax]
  loc_0060E776: push edx
  loc_0060E777: push eax
  loc_0060E778: call [ecx+00000020h]
  loc_0060E77B: cmp eax, ebx
  loc_0060E77D: fnclex
  loc_0060E77F: jge 0060E792h
  loc_0060E781: mov ecx, [edi]
  loc_0060E783: push 00000020h
  loc_0060E785: push 0041E938h
  loc_0060E78A: push ecx
  loc_0060E78B: push eax
  loc_0060E78C: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E792: mov eax, [edi]
  loc_0060E794: lea ecx, var_BC
  loc_0060E79A: push ecx
  loc_0060E79B: push eax
  loc_0060E79C: mov edx, [eax]
  loc_0060E79E: call [edx+00000034h]
  loc_0060E7A1: cmp eax, ebx
  loc_0060E7A3: fnclex
  loc_0060E7A5: jge 0060E7B8h
  loc_0060E7A7: mov edx, [edi]
  loc_0060E7A9: push 00000034h
  loc_0060E7AB: push 0041E938h
  loc_0060E7B0: push edx
  loc_0060E7B1: push eax
  loc_0060E7B2: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E7B8: xor eax, eax
  loc_0060E7BA: cmp var_BC, bx
  loc_0060E7C1: setz al
  loc_0060E7C4: xor ecx, ecx
  loc_0060E7C6: cmp var_B8, bx
  loc_0060E7CD: setz cl
  loc_0060E7D0: or eax, ecx
  loc_0060E7D2: jnz 0060E8C6h
  loc_0060E7D8: mov ecx, 0000000Ah
  loc_0060E7DD: mov eax, 80020004h
  loc_0060E7E2: mov var_64, ecx
  loc_0060E7E5: mov var_54, ecx
  loc_0060E7E8: mov var_44, ecx
  loc_0060E7EB: lea edx, var_74
  loc_0060E7EE: lea ecx, var_34
  loc_0060E7F1: mov var_5C, eax
  loc_0060E7F4: mov var_4C, eax
  loc_0060E7F7: mov var_3C, eax
  loc_0060E7FA: mov var_6C, 0041EB30h ; "AgentName Not Found!"
  loc_0060E801: mov var_74, 00000008h
  loc_0060E808: call [00401240h] ; __vbaVarDup
  loc_0060E80E: lea edx, var_64
  loc_0060E811: lea eax, var_54
  loc_0060E814: push edx
  loc_0060E815: lea ecx, var_44
  loc_0060E818: push eax
  loc_0060E819: push ecx
  loc_0060E81A: lea edx, var_34
  loc_0060E81D: push 00000030h
  loc_0060E81F: push edx
  loc_0060E820: call [004010A4h] ; rtcMsgBox
  loc_0060E826: lea eax, var_64
  loc_0060E829: lea ecx, var_54
  loc_0060E82C: push eax
  loc_0060E82D: lea edx, var_44
  loc_0060E830: push ecx
  loc_0060E831: lea eax, var_34
  loc_0060E834: push edx
  loc_0060E835: push eax
  loc_0060E836: push 00000004h
  loc_0060E838: call [00401038h] ; __vbaFreeVarList
  loc_0060E83E: mov ecx, [esi]
  loc_0060E840: add esp, 00000014h
  loc_0060E843: push esi
  loc_0060E844: call [ecx+000002FCh]
  loc_0060E84A: lea edx, var_20
  loc_0060E84D: push eax
  loc_0060E84E: push edx
  loc_0060E84F: call [004010A0h] ; __vbaObjSet
  loc_0060E855: mov ebx, eax
  loc_0060E857: push 0041E5D4h
  loc_0060E85C: push ebx
  loc_0060E85D: mov eax, [ebx]
  loc_0060E85F: call [eax+000000ACh]
  loc_0060E865: test eax, eax
  loc_0060E867: fnclex
  loc_0060E869: jge 0060E87Dh
  loc_0060E86B: push 000000ACh
  loc_0060E870: push 0041F844h
  loc_0060E875: push ebx
  loc_0060E876: push eax
  loc_0060E877: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E87D: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0060E883: lea ecx, var_20
  loc_0060E886: call ebx
  loc_0060E888: mov ecx, [esi]
  loc_0060E88A: push esi
  loc_0060E88B: call [ecx+000002FCh]
  loc_0060E891: lea edx, var_20
  loc_0060E894: push eax
  loc_0060E895: push edx
  loc_0060E896: call [004010A0h] ; __vbaObjSet
  loc_0060E89C: mov esi, eax
  loc_0060E89E: push esi
  loc_0060E89F: mov eax, [esi]
  loc_0060E8A1: call [eax+000001F4h]
  loc_0060E8A7: test eax, eax
  loc_0060E8A9: fnclex
  loc_0060E8AB: jge 0060E8BFh
  loc_0060E8AD: push 000001F4h
  loc_0060E8B2: push 0041F844h
  loc_0060E8B7: push esi
  loc_0060E8B8: push eax
  loc_0060E8B9: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E8BF: lea ecx, var_20
  loc_0060E8C2: call ebx
  loc_0060E8C4: xor ebx, ebx
  loc_0060E8C6: mov eax, [edi]
  loc_0060E8C8: push eax
  loc_0060E8C9: mov ecx, [eax]
  loc_0060E8CB: call [ecx+000000C4h]
  loc_0060E8D1: cmp eax, ebx
  loc_0060E8D3: fnclex
  loc_0060E8D5: jge 0060E8EBh
  loc_0060E8D7: mov edx, [edi]
  loc_0060E8D9: push 000000C4h
  loc_0060E8DE: push 0041E938h
  loc_0060E8E3: push edx
  loc_0060E8E4: push eax
  loc_0060E8E5: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E8EB: push 0041E938h
  loc_0060E8F0: push ebx
  loc_0060E8F1: call [00401274h] ; __vbaCastObj
  loc_0060E8F7: push eax
  loc_0060E8F8: lea eax, var_20
  loc_0060E8FB: push eax
  loc_0060E8FC: call [004010A0h] ; __vbaObjSet
  loc_0060E902: push eax
  loc_0060E903: push edi
  loc_0060E904: call [004010B8h] ; __vbaObjSetAddref
  loc_0060E90A: lea ecx, var_20
  loc_0060E90D: call [004012B0h] ; __vbaFreeObj
  loc_0060E913: mov var_4, ebx
  loc_0060E916: push 0060E95Ah
  loc_0060E91B: jmp 0060E959h
  loc_0060E91D: lea ecx, var_1C
  loc_0060E920: lea edx, var_18
  loc_0060E923: push ecx
  loc_0060E924: push edx
  loc_0060E925: push 00000002h
  loc_0060E927: call [004011FCh] ; __vbaFreeStrList
  loc_0060E92D: lea eax, var_24
  loc_0060E930: lea ecx, var_20
  loc_0060E933: push eax
  loc_0060E934: push ecx
  loc_0060E935: push 00000002h
  loc_0060E937: call [00401040h] ; __vbaFreeObjList
  loc_0060E93D: lea edx, var_64
  loc_0060E940: lea eax, var_54
  loc_0060E943: push edx
  loc_0060E944: lea ecx, var_44
  loc_0060E947: push eax
  loc_0060E948: lea edx, var_34
  loc_0060E94B: push ecx
  loc_0060E94C: push edx
  loc_0060E94D: push 00000004h
  loc_0060E94F: call [00401038h] ; __vbaFreeVarList
  loc_0060E955: add esp, 0000002Ch
  loc_0060E958: ret
  loc_0060E959: ret
  loc_0060E95A: mov eax, Me
  loc_0060E95D: push eax
  loc_0060E95E: mov ecx, [eax]
  loc_0060E960: call [ecx+00000008h]
  loc_0060E963: mov eax, var_4
  loc_0060E966: mov ecx, var_14
  loc_0060E969: pop edi
  loc_0060E96A: pop esi
  loc_0060E96B: mov fs:[00000000h], ecx
  loc_0060E972: pop ebx
  loc_0060E973: mov esp, ebp
  loc_0060E975: pop ebp
  loc_0060E976: retn 0004h
End Sub

Private Sub txtAmount_KeyPress(KeyAscii As Integer) '60E1F0
  loc_0060E1F0: push ebp
  loc_0060E1F1: mov ebp, esp
  loc_0060E1F3: sub esp, 0000000Ch
  loc_0060E1F6: push 00403B36h ; __vbaExceptHandler
  loc_0060E1FB: mov eax, fs:[00000000h]
  loc_0060E201: push eax
  loc_0060E202: mov fs:[00000000h], esp
  loc_0060E209: sub esp, 000000A8h
  loc_0060E20F: push ebx
  loc_0060E210: push esi
  loc_0060E211: push edi
  loc_0060E212: mov var_C, esp
  loc_0060E215: mov var_8, 00403888h
  loc_0060E21C: mov edi, Me
  loc_0060E21F: mov eax, edi
  loc_0060E221: and eax, 00000001h
  loc_0060E224: mov var_4, eax
  loc_0060E227: and edi, FFFFFFFEh
  loc_0060E22A: push edi
  loc_0060E22B: mov Me, edi
  loc_0060E22E: mov ecx, [edi]
  loc_0060E230: call [ecx+00000004h]
  loc_0060E233: xor esi, esi
  loc_0060E235: mov edx, 0043244Ch ; "-0123456789."
  loc_0060E23A: lea ecx, var_18
  loc_0060E23D: mov var_18, esi
  loc_0060E240: mov var_1C, esi
  loc_0060E243: mov var_2C, esi
  loc_0060E246: mov var_3C, esi
  loc_0060E249: mov var_4C, esi
  loc_0060E24C: mov var_5C, esi
  loc_0060E24F: mov var_6C, esi
  loc_0060E252: mov var_7C, esi
  loc_0060E255: mov var_8C, esi
  loc_0060E25B: mov var_9C, esi
  loc_0060E261: mov var_AC, esi
  loc_0060E267: call [004011ECh] ; __vbaStrCopy
  loc_0060E26D: mov ebx, KeyAscii
  loc_0060E270: mov edx, var_18
  loc_0060E273: lea ecx, var_2C
  loc_0060E276: mov var_74, edx
  loc_0060E279: movsx eax, [ebx]
  loc_0060E27C: push eax
  loc_0060E27D: push ecx
  loc_0060E27E: mov var_7C, 00000008h
  loc_0060E285: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0060E28B: mov ax, [ebx]
  loc_0060E28E: xor edx, edx
  loc_0060E290: cmp ax, 000Dh
  loc_0060E294: mov ecx, 0000000Bh
  loc_0060E299: setz dl
  loc_0060E29C: neg edx
  loc_0060E29E: mov var_94, dx
  loc_0060E2A5: xor edx, edx
  loc_0060E2A7: cmp ax, 0008h
  loc_0060E2AB: mov var_9C, ecx
  loc_0060E2B1: setz dl
  loc_0060E2B4: neg edx
  loc_0060E2B6: mov var_AC, ecx
  loc_0060E2BC: lea eax, var_7C
  loc_0060E2BF: push 00000001h
  loc_0060E2C1: lea ecx, var_2C
  loc_0060E2C4: mov var_A4, dx
  loc_0060E2CB: push eax
  loc_0060E2CC: push ecx
  loc_0060E2CD: lea edx, var_3C
  loc_0060E2D0: push esi
  loc_0060E2D1: push edx
  loc_0060E2D2: mov var_84, esi
  loc_0060E2D8: mov var_8C, 00008002h
  loc_0060E2E2: call [004011A8h] ; __vbaInStrVar
  loc_0060E2E8: push eax
  loc_0060E2E9: lea eax, var_8C
  loc_0060E2EF: lea ecx, var_4C
  loc_0060E2F2: push eax
  loc_0060E2F3: push ecx
  loc_0060E2F4: call [00401050h] ; __vbaVarCmpNe
  loc_0060E2FA: push eax
  loc_0060E2FB: lea edx, var_9C
  loc_0060E301: lea eax, var_5C
  loc_0060E304: push edx
  loc_0060E305: push eax
  loc_0060E306: call [0040112Ch] ; __vbaVarOr
  loc_0060E30C: lea ecx, var_AC
  loc_0060E312: push eax
  loc_0060E313: lea edx, var_6C
  loc_0060E316: push ecx
  loc_0060E317: push edx
  loc_0060E318: call [0040112Ch] ; __vbaVarOr
  loc_0060E31E: push eax
  loc_0060E31F: call [004010E0h] ; __vbaBoolVarNull
  loc_0060E325: mov var_B0, ax
  loc_0060E32C: lea eax, var_AC
  loc_0060E332: lea ecx, var_9C
  loc_0060E338: push eax
  loc_0060E339: lea edx, var_3C
  loc_0060E33C: push ecx
  loc_0060E33D: lea eax, var_2C
  loc_0060E340: push edx
  loc_0060E341: push eax
  loc_0060E342: push 00000004h
  loc_0060E344: call [00401038h] ; __vbaFreeVarList
  loc_0060E34A: add esp, 00000014h
  loc_0060E34D: cmp var_B0, si
  loc_0060E354: jz 0060E3A4h
  loc_0060E356: mov ax, [ebx]
  loc_0060E359: cmp ax, 000Dh
  loc_0060E35D: mov [ebx], ax
  loc_0060E360: jnz 0060E3A7h
  loc_0060E362: mov ecx, [edi]
  loc_0060E364: push edi
  loc_0060E365: call [ecx+00000310h]
  loc_0060E36B: lea edx, var_1C
  loc_0060E36E: push eax
  loc_0060E36F: push edx
  loc_0060E370: call [004010A0h] ; __vbaObjSet
  loc_0060E376: mov edi, eax
  loc_0060E378: push edi
  loc_0060E379: mov eax, [edi]
  loc_0060E37B: call [eax+000001A4h]
  loc_0060E381: cmp eax, esi
  loc_0060E383: fnclex
  loc_0060E385: jge 0060E399h
  loc_0060E387: push 000001A4h
  loc_0060E38C: push 0041EAACh
  loc_0060E391: push edi
  loc_0060E392: push eax
  loc_0060E393: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E399: lea ecx, var_1C
  loc_0060E39C: call [004012B0h] ; __vbaFreeObj
  loc_0060E3A2: jmp 0060E3A7h
  loc_0060E3A4: mov [ebx], si
  loc_0060E3A7: mov var_4, esi
  loc_0060E3AA: push 0060E3E4h
  loc_0060E3AF: jmp 0060E3DAh
  loc_0060E3B1: lea ecx, var_1C
  loc_0060E3B4: call [004012B0h] ; __vbaFreeObj
  loc_0060E3BA: lea ecx, var_6C
  loc_0060E3BD: lea edx, var_5C
  loc_0060E3C0: push ecx
  loc_0060E3C1: lea eax, var_4C
  loc_0060E3C4: push edx
  loc_0060E3C5: lea ecx, var_3C
  loc_0060E3C8: push eax
  loc_0060E3C9: lea edx, var_2C
  loc_0060E3CC: push ecx
  loc_0060E3CD: push edx
  loc_0060E3CE: push 00000005h
  loc_0060E3D0: call [00401038h] ; __vbaFreeVarList
  loc_0060E3D6: add esp, 00000018h
  loc_0060E3D9: ret
  loc_0060E3DA: lea ecx, var_18
  loc_0060E3DD: call [004012ACh] ; __vbaFreeStr
  loc_0060E3E3: ret
  loc_0060E3E4: mov eax, Me
  loc_0060E3E7: push eax
  loc_0060E3E8: mov ecx, [eax]
  loc_0060E3EA: call [ecx+00000008h]
  loc_0060E3ED: mov eax, var_4
  loc_0060E3F0: mov ecx, var_14
  loc_0060E3F3: pop edi
  loc_0060E3F4: pop esi
  loc_0060E3F5: mov fs:[00000000h], ecx
  loc_0060E3FC: pop ebx
  loc_0060E3FD: mov esp, ebp
  loc_0060E3FF: pop ebp
  loc_0060E400: retn 0008h
End Sub

Private Sub cmdReports_Click() '60D8A0
  loc_0060D8A0: push ebp
  loc_0060D8A1: mov ebp, esp
  loc_0060D8A3: sub esp, 0000000Ch
  loc_0060D8A6: push 00403B36h ; __vbaExceptHandler
  loc_0060D8AB: mov eax, fs:[00000000h]
  loc_0060D8B1: push eax
  loc_0060D8B2: mov fs:[00000000h], esp
  loc_0060D8B9: sub esp, 00000084h
  loc_0060D8BF: push ebx
  loc_0060D8C0: push esi
  loc_0060D8C1: push edi
  loc_0060D8C2: mov var_C, esp
  loc_0060D8C5: mov var_8, 00403848h
  loc_0060D8CC: mov esi, Me
  loc_0060D8CF: mov eax, esi
  loc_0060D8D1: and eax, 00000001h
  loc_0060D8D4: mov var_4, eax
  loc_0060D8D7: and esi, FFFFFFFEh
  loc_0060D8DA: push esi
  loc_0060D8DB: mov Me, esi
  loc_0060D8DE: mov ecx, [esi]
  loc_0060D8E0: call [ecx+00000004h]
  loc_0060D8E3: mov edx, [esi]
  loc_0060D8E5: xor edi, edi
  loc_0060D8E7: push 0000000Bh
  loc_0060D8E9: push esi
  loc_0060D8EA: mov var_18, edi
  loc_0060D8ED: mov var_1C, edi
  loc_0060D8F0: mov var_20, edi
  loc_0060D8F3: mov var_30, edi
  loc_0060D8F6: mov var_40, edi
  loc_0060D8F9: mov var_50, edi
  loc_0060D8FC: call [edx+000000A4h]
  loc_0060D902: cmp eax, edi
  loc_0060D904: fnclex
  loc_0060D906: jge 0060D91Ah
  loc_0060D908: push 000000A4h
  loc_0060D90D: push 00429540h
  loc_0060D912: push esi
  loc_0060D913: push eax
  loc_0060D914: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D91A: lea eax, var_50
  loc_0060D91D: lea ecx, var_30
  loc_0060D920: push eax
  loc_0060D921: push ecx
  loc_0060D922: mov ebx, 00000002h
  loc_0060D927: mov var_48, 0061A150h
  loc_0060D92E: mov var_50, 00004008h
  loc_0060D935: call [004010D4h] ; rtcTrimVar
  loc_0060D93B: lea edx, var_30
  loc_0060D93E: push edx
  loc_0060D93F: call [00401028h] ; __vbaStrVarMove
  loc_0060D945: sub esp, 00000010h
  loc_0060D948: mov ecx, 00000008h
  loc_0060D94D: mov edx, esp
  loc_0060D94F: sub esp, 00000010h
  loc_0060D952: mov var_40, ecx
  loc_0060D955: mov var_38, eax
  loc_0060D958: mov [edx], ebx
  loc_0060D95A: mov ebx, var_5C
  loc_0060D95D: mov [edx+00000004h], ebx
  loc_0060D960: mov [edx+00000008h], edi
  loc_0060D963: mov edi, var_54
  loc_0060D966: mov [edx+0000000Ch], edi
  loc_0060D969: mov edx, esp
  loc_0060D96B: push 00000001h
  loc_0060D96D: push 00000020h
  loc_0060D96F: mov [edx], ecx
  loc_0060D971: mov ecx, var_3C
  loc_0060D974: push esi
  loc_0060D975: mov [edx+00000004h], ecx
  loc_0060D978: mov ecx, [esi]
  loc_0060D97A: mov [edx+00000008h], eax
  loc_0060D97D: mov eax, var_34
  loc_0060D980: mov [edx+0000000Ch], eax
  loc_0060D983: call [ecx+00000334h]
  loc_0060D989: mov edi, [004010A0h] ; __vbaObjSet
  loc_0060D98F: lea edx, var_1C
  loc_0060D992: push eax
  loc_0060D993: push edx
  loc_0060D994: call edi
  loc_0060D996: push eax
  loc_0060D997: call [00401160h] ; __vbaLateIdCallSt
  loc_0060D99D: add esp, 0000002Ch
  loc_0060D9A0: lea ecx, var_1C
  loc_0060D9A3: call [004012B0h] ; __vbaFreeObj
  loc_0060D9A9: lea eax, var_40
  loc_0060D9AC: lea ecx, var_30
  loc_0060D9AF: push eax
  loc_0060D9B0: push ecx
  loc_0060D9B1: push 00000002h
  loc_0060D9B3: call [00401038h] ; __vbaFreeVarList
  loc_0060D9B9: mov eax, [0061B394h]
  loc_0060D9BE: add esp, 0000000Ch
  loc_0060D9C1: test eax, eax
  loc_0060D9C3: jnz 0060D9D5h
  loc_0060D9C5: push 0061B394h
  loc_0060D9CA: push 0041E4A0h
  loc_0060D9CF: call [004011DCh] ; __vbaNew2
  loc_0060D9D5: mov ebx, [0061B394h]
  loc_0060D9DB: lea eax, var_1C
  loc_0060D9DE: push eax
  loc_0060D9DF: push ebx
  loc_0060D9E0: mov edx, [ebx]
  loc_0060D9E2: call [edx+00000014h]
  loc_0060D9E5: test eax, eax
  loc_0060D9E7: fnclex
  loc_0060D9E9: jge 0060D9FAh
  loc_0060D9EB: push 00000014h
  loc_0060D9ED: push 0041E490h
  loc_0060D9F2: push ebx
  loc_0060D9F3: push eax
  loc_0060D9F4: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D9FA: mov eax, var_1C
  loc_0060D9FD: lea edx, var_18
  loc_0060DA00: push edx
  loc_0060DA01: push eax
  loc_0060DA02: mov ecx, [eax]
  loc_0060DA04: mov ebx, eax
  loc_0060DA06: call [ecx+00000050h]
  loc_0060DA09: test eax, eax
  loc_0060DA0B: fnclex
  loc_0060DA0D: jge 0060DA1Eh
  loc_0060DA0F: push 00000050h
  loc_0060DA11: push 0041F3A0h
  loc_0060DA16: push ebx
  loc_0060DA17: push eax
  loc_0060DA18: call [00401074h] ; __vbaHresultCheckObj
  loc_0060DA1E: mov eax, var_18
  loc_0060DA21: push eax
  loc_0060DA22: push 0042B9B8h ; "\Reports\Balance.rpt"
  loc_0060DA27: call [00401054h] ; __vbaStrCat
  loc_0060DA2D: sub esp, 00000010h
  loc_0060DA30: mov ecx, 00000008h
  loc_0060DA35: mov edx, esp
  loc_0060DA37: mov var_30, ecx
  loc_0060DA3A: mov var_28, eax
  loc_0060DA3D: push 00000003h
  loc_0060DA3F: mov [edx], ecx
  loc_0060DA41: mov ecx, var_2C
  loc_0060DA44: push esi
  loc_0060DA45: mov [edx+00000004h], ecx
  loc_0060DA48: mov ecx, [esi]
  loc_0060DA4A: mov [edx+00000008h], eax
  loc_0060DA4D: mov eax, var_24
  loc_0060DA50: mov [edx+0000000Ch], eax
  loc_0060DA53: call [ecx+00000334h]
  loc_0060DA59: lea edx, var_20
  loc_0060DA5C: push eax
  loc_0060DA5D: push edx
  loc_0060DA5E: call edi
  loc_0060DA60: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_0060DA66: push eax
  loc_0060DA67: call ebx
  loc_0060DA69: lea ecx, var_18
  loc_0060DA6C: call [004012ACh] ; __vbaFreeStr
  loc_0060DA72: lea eax, var_20
  loc_0060DA75: lea ecx, var_1C
  loc_0060DA78: push eax
  loc_0060DA79: push ecx
  loc_0060DA7A: push 00000002h
  loc_0060DA7C: call [00401040h] ; __vbaFreeObjList
  loc_0060DA82: add esp, 0000000Ch
  loc_0060DA85: lea ecx, var_30
  loc_0060DA88: call [00401020h] ; __vbaFreeVar
  loc_0060DA8E: sub esp, 00000010h
  loc_0060DA91: mov ecx, 00000003h
  loc_0060DA96: mov edx, esp
  loc_0060DA98: mov var_50, ecx
  loc_0060DA9B: mov eax, 00000002h
  loc_0060DAA0: push 00000043h
  loc_0060DAA2: mov [edx], ecx
  loc_0060DAA4: mov ecx, var_4C
  loc_0060DAA7: mov var_48, eax
  loc_0060DAAA: push esi
  loc_0060DAAB: mov [edx+00000004h], ecx
  loc_0060DAAE: mov ecx, [esi]
  loc_0060DAB0: mov [edx+00000008h], eax
  loc_0060DAB3: mov eax, var_44
  loc_0060DAB6: mov [edx+0000000Ch], eax
  loc_0060DAB9: call [ecx+00000334h]
  loc_0060DABF: lea edx, var_1C
  loc_0060DAC2: push eax
  loc_0060DAC3: push edx
  loc_0060DAC4: call edi
  loc_0060DAC6: push eax
  loc_0060DAC7: call ebx
  loc_0060DAC9: lea ecx, var_1C
  loc_0060DACC: call [004012B0h] ; __vbaFreeObj
  loc_0060DAD2: sub esp, 00000010h
  loc_0060DAD5: mov ecx, 00000002h
  loc_0060DADA: mov edx, esp
  loc_0060DADC: mov var_50, ecx
  loc_0060DADF: mov eax, 00000001h
  loc_0060DAE4: push 00000011h
  loc_0060DAE6: mov [edx], ecx
  loc_0060DAE8: mov ecx, var_4C
  loc_0060DAEB: mov var_48, eax
  loc_0060DAEE: push esi
  loc_0060DAEF: mov [edx+00000004h], ecx
  loc_0060DAF2: mov ecx, [esi]
  loc_0060DAF4: mov [edx+00000008h], eax
  loc_0060DAF7: mov eax, var_44
  loc_0060DAFA: mov [edx+0000000Ch], eax
  loc_0060DAFD: call [ecx+00000334h]
  loc_0060DB03: lea edx, var_1C
  loc_0060DB06: push eax
  loc_0060DB07: push edx
  loc_0060DB08: call edi
  loc_0060DB0A: push eax
  loc_0060DB0B: call ebx
  loc_0060DB0D: lea ecx, var_1C
  loc_0060DB10: call [004012B0h] ; __vbaFreeObj
  loc_0060DB16: mov eax, [esi]
  loc_0060DB18: push 00000001h
  loc_0060DB1A: push esi
  loc_0060DB1B: call [eax+000000A4h]
  loc_0060DB21: test eax, eax
  loc_0060DB23: fnclex
  loc_0060DB25: jge 0060DB39h
  loc_0060DB27: push 000000A4h
  loc_0060DB2C: push 00429540h
  loc_0060DB31: push esi
  loc_0060DB32: push eax
  loc_0060DB33: call [00401074h] ; __vbaHresultCheckObj
  loc_0060DB39: mov var_4, 00000000h
  loc_0060DB40: push 0060DB75h
  loc_0060DB45: jmp 0060DB74h
  loc_0060DB47: lea ecx, var_18
  loc_0060DB4A: call [004012ACh] ; __vbaFreeStr
  loc_0060DB50: lea ecx, var_20
  loc_0060DB53: lea edx, var_1C
  loc_0060DB56: push ecx
  loc_0060DB57: push edx
  loc_0060DB58: push 00000002h
  loc_0060DB5A: call [00401040h] ; __vbaFreeObjList
  loc_0060DB60: lea eax, var_40
  loc_0060DB63: lea ecx, var_30
  loc_0060DB66: push eax
  loc_0060DB67: push ecx
  loc_0060DB68: push 00000002h
  loc_0060DB6A: call [00401038h] ; __vbaFreeVarList
  loc_0060DB70: add esp, 00000018h
  loc_0060DB73: ret
  loc_0060DB74: ret
  loc_0060DB75: mov eax, Me
  loc_0060DB78: push eax
  loc_0060DB79: mov edx, [eax]
  loc_0060DB7B: call [edx+00000008h]
  loc_0060DB7E: mov eax, var_4
  loc_0060DB81: mov ecx, var_14
  loc_0060DB84: pop edi
  loc_0060DB85: pop esi
  loc_0060DB86: mov fs:[00000000h], ecx
  loc_0060DB8D: pop ebx
  loc_0060DB8E: mov esp, ebp
  loc_0060DB90: pop ebp
  loc_0060DB91: retn 0004h
End Sub

Private Sub cmdClose_Click() '60B210
  loc_0060B210: push ebp
  loc_0060B211: mov ebp, esp
  loc_0060B213: sub esp, 0000000Ch
  loc_0060B216: push 00403B36h ; __vbaExceptHandler
  loc_0060B21B: mov eax, fs:[00000000h]
  loc_0060B221: push eax
  loc_0060B222: mov fs:[00000000h], esp
  loc_0060B229: sub esp, 00000018h
  loc_0060B22C: push ebx
  loc_0060B22D: push esi
  loc_0060B22E: push edi
  loc_0060B22F: mov var_C, esp
  loc_0060B232: mov var_8, 004037D8h
  loc_0060B239: mov edi, Me
  loc_0060B23C: mov eax, edi
  loc_0060B23E: and eax, 00000001h
  loc_0060B241: mov var_4, eax
  loc_0060B244: and edi, FFFFFFFEh
  loc_0060B247: push edi
  loc_0060B248: mov Me, edi
  loc_0060B24B: mov ecx, [edi]
  loc_0060B24D: call [ecx+00000004h]
  loc_0060B250: mov eax, [0061B394h]
  loc_0060B255: xor ebx, ebx
  loc_0060B257: cmp eax, ebx
  loc_0060B259: mov var_18, ebx
  loc_0060B25C: jnz 0060B26Eh
  loc_0060B25E: push 0061B394h
  loc_0060B263: push 0041E4A0h
  loc_0060B268: call [004011DCh] ; __vbaNew2
  loc_0060B26E: mov esi, [0061B394h]
  loc_0060B274: lea eax, var_18
  loc_0060B277: push edi
  loc_0060B278: push eax
  loc_0060B279: mov edx, [esi]
  loc_0060B27B: mov var_2C, edx
  loc_0060B27E: call [004010B8h] ; __vbaObjSetAddref
  loc_0060B284: mov ecx, var_2C
  loc_0060B287: push eax
  loc_0060B288: push esi
  loc_0060B289: call [ecx+00000010h]
  loc_0060B28C: cmp eax, ebx
  loc_0060B28E: fnclex
  loc_0060B290: jge 0060B2A1h
  loc_0060B292: push 00000010h
  loc_0060B294: push 0041E490h
  loc_0060B299: push esi
  loc_0060B29A: push eax
  loc_0060B29B: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B2A1: lea ecx, var_18
  loc_0060B2A4: call [004012B0h] ; __vbaFreeObj
  loc_0060B2AA: mov var_4, ebx
  loc_0060B2AD: push 0060B2BFh
  loc_0060B2B2: jmp 0060B2BEh
  loc_0060B2B4: lea ecx, var_18
  loc_0060B2B7: call [004012B0h] ; __vbaFreeObj
  loc_0060B2BD: ret
  loc_0060B2BE: ret
  loc_0060B2BF: mov eax, Me
  loc_0060B2C2: push eax
  loc_0060B2C3: mov edx, [eax]
  loc_0060B2C5: call [edx+00000008h]
  loc_0060B2C8: mov eax, var_4
  loc_0060B2CB: mov ecx, var_14
  loc_0060B2CE: pop edi
  loc_0060B2CF: pop esi
  loc_0060B2D0: mov fs:[00000000h], ecx
  loc_0060B2D7: pop ebx
  loc_0060B2D8: mov esp, ebp
  loc_0060B2DA: pop ebp
  loc_0060B2DB: retn 0004h
End Sub

Private Sub cmdDelete_Click() '60BC50
  loc_0060BC50: push ebp
  loc_0060BC51: mov ebp, esp
  loc_0060BC53: sub esp, 0000000Ch
  loc_0060BC56: push 00403B36h ; __vbaExceptHandler
  loc_0060BC5B: mov eax, fs:[00000000h]
  loc_0060BC61: push eax
  loc_0060BC62: mov fs:[00000000h], esp
  loc_0060BC69: sub esp, 00000104h
  loc_0060BC6F: push ebx
  loc_0060BC70: push esi
  loc_0060BC71: push edi
  loc_0060BC72: mov var_C, esp
  loc_0060BC75: mov var_8, 004037F8h
  loc_0060BC7C: mov esi, Me
  loc_0060BC7F: mov eax, esi
  loc_0060BC81: and eax, 00000001h
  loc_0060BC84: mov var_4, eax
  loc_0060BC87: and esi, FFFFFFFEh
  loc_0060BC8A: push esi
  loc_0060BC8B: mov Me, esi
  loc_0060BC8E: mov ecx, [esi]
  loc_0060BC90: call [ecx+00000004h]
  loc_0060BC93: xor ebx, ebx
  loc_0060BC95: mov edx, 004268E8h ; "Balance"
  loc_0060BC9A: mov ecx, 0061A0A0h
  loc_0060BC9F: mov var_18, ebx
  loc_0060BCA2: mov var_1C, ebx
  loc_0060BCA5: mov var_20, ebx
  loc_0060BCA8: mov var_24, ebx
  loc_0060BCAB: mov var_34, ebx
  loc_0060BCAE: mov var_44, ebx
  loc_0060BCB1: mov var_54, ebx
  loc_0060BCB4: mov var_64, ebx
  loc_0060BCB7: mov var_74, ebx
  loc_0060BCBA: mov var_84, ebx
  loc_0060BCC0: mov var_94, ebx
  loc_0060BCC6: mov var_A4, ebx
  loc_0060BCCC: mov var_B4, ebx
  loc_0060BCD2: mov var_C4, ebx
  loc_0060BCD8: mov var_D4, ebx
  loc_0060BCDE: mov var_E4, ebx
  loc_0060BCE4: mov var_E8, ebx
  loc_0060BCEA: mov var_EC, ebx
  loc_0060BCF0: call [004011ECh] ; __vbaStrCopy
  loc_0060BCF6: cmp [0061A11Ch], ebx
  loc_0060BCFC: jnz 0060BD0Eh
  loc_0060BCFE: push 0061A11Ch
  loc_0060BD03: push 004069CCh
  loc_0060BD08: call [004011DCh] ; __vbaNew2
  loc_0060BD0E: sub esp, 00000010h
  loc_0060BD11: mov eax, 0000000Ah
  loc_0060BD16: mov ecx, esp
  loc_0060BD18: mov var_A4, eax
  loc_0060BD1E: mov var_9C, 80020004h
  loc_0060BD28: sub esp, 00000010h
  loc_0060BD2B: mov [ecx], eax
  loc_0060BD2D: mov eax, var_A0
  loc_0060BD33: mov edi, [0061A11Ch]
  loc_0060BD39: mov var_94, 00000002h
  loc_0060BD43: mov [ecx+00000004h], eax
  loc_0060BD46: mov eax, var_9C
  loc_0060BD4C: mov var_8C, 00000001h
  loc_0060BD56: mov edx, [edi]
  loc_0060BD58: mov [ecx+00000008h], eax
  loc_0060BD5B: mov eax, var_98
  loc_0060BD61: mov [ecx+0000000Ch], eax
  loc_0060BD64: mov eax, var_94
  loc_0060BD6A: mov ecx, esp
  loc_0060BD6C: push edi
  loc_0060BD6D: mov [ecx], eax
  loc_0060BD6F: mov eax, var_90
  loc_0060BD75: mov [ecx+00000004h], eax
  loc_0060BD78: mov eax, var_8C
  loc_0060BD7E: mov [ecx+00000008h], eax
  loc_0060BD81: mov eax, var_88
  loc_0060BD87: mov [ecx+0000000Ch], eax
  loc_0060BD8A: call [edx+000002B0h]
  loc_0060BD90: cmp eax, ebx
  loc_0060BD92: fnclex
  loc_0060BD94: jge 0060BDA8h
  loc_0060BD96: push 000002B0h
  loc_0060BD9B: push 0041E6D0h
  loc_0060BDA0: push edi
  loc_0060BDA1: push eax
  loc_0060BDA2: call [00401074h] ; __vbaHresultCheckObj
  loc_0060BDA8: mov edi, [004010D4h] ; rtcTrimVar
  loc_0060BDAE: lea ecx, var_94
  loc_0060BDB4: lea edx, var_34
  loc_0060BDB7: push ecx
  loc_0060BDB8: push edx
  loc_0060BDB9: mov var_8C, 0061A0B8h
  loc_0060BDC3: mov var_94, 00004008h
  loc_0060BDCD: call edi
  loc_0060BDCF: lea eax, var_34
  loc_0060BDD2: lea ecx, var_A4
  loc_0060BDD8: push eax
  loc_0060BDD9: push ecx
  loc_0060BDDA: mov var_9C, 0041E5D4h
  loc_0060BDE4: mov var_A4, 00008008h
  loc_0060BDEE: call [00401218h] ; __vbaVarTstNe
  loc_0060BDF4: lea ecx, var_34
  loc_0060BDF7: mov var_F0, ax
  loc_0060BDFE: call [00401020h] ; __vbaFreeVar
  loc_0060BE04: cmp var_F0, bx
  loc_0060BE0B: jz 0060C60Eh
  loc_0060BE11: lea edx, var_94
  loc_0060BE17: lea eax, var_34
  loc_0060BE1A: push edx
  loc_0060BE1B: push eax
  loc_0060BE1C: mov var_8C, 0061A0B8h
  loc_0060BE26: mov var_94, 00004008h
  loc_0060BE30: call edi
  loc_0060BE32: mov edi, 00000008h
  loc_0060BE37: mov eax, 80020004h
  loc_0060BE3C: mov var_A4, edi
  loc_0060BE42: mov var_B4, edi
  loc_0060BE48: mov edi, [0061A13Ch]
  loc_0060BE4E: mov ecx, 0000000Ah
  loc_0060BE53: mov edx, eax
  loc_0060BE55: mov var_D4, ecx
  loc_0060BE5B: mov var_CC, edx
  loc_0060BE61: mov var_BC, 00000004h
  loc_0060BE6B: mov var_C4, 00000003h
  loc_0060BE75: mov var_9C, 00432224h ; "Select * From Balance where Name='"
  loc_0060BE7F: mov var_AC, 0041E890h ; "'"
  loc_0060BE89: mov ebx, [edi]
  loc_0060BE8B: lea edi, var_1C
  loc_0060BE8E: push edi
  loc_0060BE8F: sub esp, 00000010h
  loc_0060BE92: mov edi, esp
  loc_0060BE94: sub esp, 00000010h
  loc_0060BE97: mov [edi], ecx
  loc_0060BE99: mov ecx, var_E0
  loc_0060BE9F: mov [edi+00000004h], ecx
  loc_0060BEA2: mov ecx, esp
  loc_0060BEA4: sub esp, 00000010h
  loc_0060BEA7: mov [edi+00000008h], eax
  loc_0060BEAA: mov eax, var_D8
  loc_0060BEB0: mov [edi+0000000Ch], eax
  loc_0060BEB3: mov eax, var_D4
  loc_0060BEB9: mov [ecx], eax
  loc_0060BEBB: mov eax, var_D0
  loc_0060BEC1: mov edi, [004011B4h] ; __vbaVarCat
  loc_0060BEC7: mov [ecx+00000004h], eax
  loc_0060BECA: mov eax, esp
  loc_0060BECC: mov [ecx+00000008h], edx
  loc_0060BECF: mov edx, var_C8
  loc_0060BED5: mov [ecx+0000000Ch], edx
  loc_0060BED8: mov ecx, var_C4
  loc_0060BEDE: mov edx, var_C0
  loc_0060BEE4: mov [eax], ecx
  loc_0060BEE6: mov ecx, var_BC
  loc_0060BEEC: mov [eax+00000004h], edx
  loc_0060BEEF: mov edx, var_B8
  loc_0060BEF5: mov [eax+00000008h], ecx
  loc_0060BEF8: lea ecx, var_34
  loc_0060BEFB: mov [eax+0000000Ch], edx
  loc_0060BEFE: lea eax, var_A4
  loc_0060BF04: push eax
  loc_0060BF05: lea edx, var_44
  loc_0060BF08: push ecx
  loc_0060BF09: push edx
  loc_0060BF0A: call edi
  loc_0060BF0C: push eax
  loc_0060BF0D: lea eax, var_B4
  loc_0060BF13: lea ecx, var_54
  loc_0060BF16: push eax
  loc_0060BF17: push ecx
  loc_0060BF18: call edi
  loc_0060BF1A: lea edx, var_18
  loc_0060BF1D: push eax
  loc_0060BF1E: push edx
  loc_0060BF1F: call [004011B0h] ; __vbaStrVarVal
  loc_0060BF25: push eax
  loc_0060BF26: mov eax, [0061A13Ch]
  loc_0060BF2B: push eax
  loc_0060BF2C: call [ebx+000000BCh]
  loc_0060BF32: test eax, eax
  loc_0060BF34: fnclex
  loc_0060BF36: jge 0060BF50h
  loc_0060BF38: mov ecx, [0061A13Ch]
  loc_0060BF3E: push 000000BCh
  loc_0060BF43: push 0041E928h
  loc_0060BF48: push ecx
  loc_0060BF49: push eax
  loc_0060BF4A: call [00401074h] ; __vbaHresultCheckObj
  loc_0060BF50: mov edx, var_1C
  loc_0060BF53: lea ebx, [esi+00000034h]
  loc_0060BF56: push edx
  loc_0060BF57: push ebx
  loc_0060BF58: call [004010B8h] ; __vbaObjSetAddref
  loc_0060BF5E: lea ecx, var_18
  loc_0060BF61: call [004012ACh] ; __vbaFreeStr
  loc_0060BF67: lea ecx, var_1C
  loc_0060BF6A: call [004012B0h] ; __vbaFreeObj
  loc_0060BF70: lea eax, var_54
  loc_0060BF73: lea ecx, var_44
  loc_0060BF76: push eax
  loc_0060BF77: lea edx, var_34
  loc_0060BF7A: push ecx
  loc_0060BF7B: push edx
  loc_0060BF7C: push 00000003h
  loc_0060BF7E: call [00401038h] ; __vbaFreeVarList
  loc_0060BF84: mov eax, [ebx]
  loc_0060BF86: add esp, 00000010h
  loc_0060BF89: lea edx, var_E8
  loc_0060BF8F: mov ecx, [eax]
  loc_0060BF91: push edx
  loc_0060BF92: push eax
  loc_0060BF93: call [ecx+00000020h]
  loc_0060BF96: test eax, eax
  loc_0060BF98: fnclex
  loc_0060BF9A: jge 0060BFADh
  loc_0060BF9C: mov ecx, [ebx]
  loc_0060BF9E: push 00000020h
  loc_0060BFA0: push 0041E938h
  loc_0060BFA5: push ecx
  loc_0060BFA6: push eax
  loc_0060BFA7: call [00401074h] ; __vbaHresultCheckObj
  loc_0060BFAD: mov eax, [ebx]
  loc_0060BFAF: lea ecx, var_EC
  loc_0060BFB5: push ecx
  loc_0060BFB6: push eax
  loc_0060BFB7: mov edx, [eax]
  loc_0060BFB9: call [edx+00000034h]
  loc_0060BFBC: test eax, eax
  loc_0060BFBE: fnclex
  loc_0060BFC0: jge 0060BFD3h
  loc_0060BFC2: mov edx, [ebx]
  loc_0060BFC4: push 00000034h
  loc_0060BFC6: push 0041E938h
  loc_0060BFCB: push edx
  loc_0060BFCC: push eax
  loc_0060BFCD: call [00401074h] ; __vbaHresultCheckObj
  loc_0060BFD3: xor eax, eax
  loc_0060BFD5: cmp var_EC, ax
  loc_0060BFDC: setz al
  loc_0060BFDF: xor ecx, ecx
  loc_0060BFE1: cmp var_E8, cx
  loc_0060BFE8: setz cl
  loc_0060BFEB: or eax, ecx
  loc_0060BFED: jz 0060C1BBh
  loc_0060BFF3: mov edx, [esi]
  loc_0060BFF5: push esi
  loc_0060BFF6: call [edx+00000318h]
  loc_0060BFFC: push eax
  loc_0060BFFD: lea eax, var_24
  loc_0060C000: push eax
  loc_0060C001: call [004010A0h] ; __vbaObjSet
  loc_0060C007: mov var_FC, eax
  loc_0060C00D: mov eax, [ebx]
  loc_0060C00F: lea edx, var_1C
  loc_0060C012: mov ecx, [eax]
  loc_0060C014: push edx
  loc_0060C015: push eax
  loc_0060C016: call [ecx+000000B4h]
  loc_0060C01C: test eax, eax
  loc_0060C01E: fnclex
  loc_0060C020: jge 0060C036h
  loc_0060C022: mov ecx, [ebx]
  loc_0060C024: push 000000B4h
  loc_0060C029: push 0041E938h
  loc_0060C02E: push ecx
  loc_0060C02F: push eax
  loc_0060C030: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C036: lea ebx, var_20
  loc_0060C039: mov eax, var_1C
  loc_0060C03C: push ebx
  loc_0060C03D: mov ecx, 00000008h
  loc_0060C042: sub esp, 00000010h
  loc_0060C045: mov var_94, ecx
  loc_0060C04B: mov ebx, esp
  loc_0060C04D: mov var_8C, 0042043Ch ; "Amount"
  loc_0060C057: mov edx, [eax]
  loc_0060C059: push eax
  loc_0060C05A: mov [ebx], ecx
  loc_0060C05C: mov ecx, var_90
  loc_0060C062: mov var_F4, eax
  loc_0060C068: mov [ebx+00000004h], ecx
  loc_0060C06B: mov ecx, var_8C
  loc_0060C071: mov [ebx+00000008h], ecx
  loc_0060C074: mov ecx, var_88
  loc_0060C07A: mov [ebx+0000000Ch], ecx
  loc_0060C07D: call [edx+00000030h]
  loc_0060C080: test eax, eax
  loc_0060C082: fnclex
  loc_0060C084: jge 0060C09Bh
  loc_0060C086: mov edx, var_F4
  loc_0060C08C: push 00000030h
  loc_0060C08E: push 0041EA14h ; "S"
  loc_0060C093: push edx
  loc_0060C094: push eax
  loc_0060C095: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C09B: mov eax, var_20
  loc_0060C09E: lea ecx, var_44
  loc_0060C0A1: mov var_2C, eax
  loc_0060C0A4: lea eax, var_34
  loc_0060C0A7: push eax
  loc_0060C0A8: push ecx
  loc_0060C0A9: mov var_20, 00000000h
  loc_0060C0B0: mov var_34, 00000009h
  loc_0060C0B7: call [004010D4h] ; rtcTrimVar
  loc_0060C0BD: mov edx, var_FC
  loc_0060C0C3: lea eax, var_44
  loc_0060C0C6: lea ecx, var_18
  loc_0060C0C9: push eax
  loc_0060C0CA: mov ebx, [edx]
  loc_0060C0CC: push ecx
  loc_0060C0CD: call [004011B0h] ; __vbaStrVarVal
  loc_0060C0D3: mov edx, ebx
  loc_0060C0D5: mov ebx, var_FC
  loc_0060C0DB: push eax
  loc_0060C0DC: push ebx
  loc_0060C0DD: call [edx+000000A4h]
  loc_0060C0E3: test eax, eax
  loc_0060C0E5: fnclex
  loc_0060C0E7: jge 0060C0FBh
  loc_0060C0E9: push 000000A4h
  loc_0060C0EE: push 0041E5E8h
  loc_0060C0F3: push ebx
  loc_0060C0F4: push eax
  loc_0060C0F5: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C0FB: lea ecx, var_18
  loc_0060C0FE: call [004012ACh] ; __vbaFreeStr
  loc_0060C104: lea eax, var_24
  loc_0060C107: lea ecx, var_1C
  loc_0060C10A: push eax
  loc_0060C10B: push ecx
  loc_0060C10C: push 00000002h
  loc_0060C10E: call [00401040h] ; __vbaFreeObjList
  loc_0060C114: lea edx, var_44
  loc_0060C117: lea eax, var_34
  loc_0060C11A: push edx
  loc_0060C11B: push eax
  loc_0060C11C: push 00000002h
  loc_0060C11E: call [00401038h] ; __vbaFreeVarList
  loc_0060C124: mov ecx, [esi]
  loc_0060C126: add esp, 00000018h
  loc_0060C129: push esi
  loc_0060C12A: call [ecx+000002FCh]
  loc_0060C130: lea edx, var_1C
  loc_0060C133: push eax
  loc_0060C134: push edx
  loc_0060C135: call [004010A0h] ; __vbaObjSet
  loc_0060C13B: mov ebx, eax
  loc_0060C13D: lea eax, var_94
  loc_0060C143: lea ecx, var_34
  loc_0060C146: push eax
  loc_0060C147: push ecx
  loc_0060C148: mov var_F0, ebx
  loc_0060C14E: mov var_8C, 0061A0B8h
  loc_0060C158: mov var_94, 00004008h
  loc_0060C162: call [004010D4h] ; rtcTrimVar
  loc_0060C168: mov ebx, [ebx]
  loc_0060C16A: lea edx, var_34
  loc_0060C16D: lea eax, var_18
  loc_0060C170: push edx
  loc_0060C171: push eax
  loc_0060C172: call [004011B0h] ; __vbaStrVarVal
  loc_0060C178: mov ecx, ebx
  loc_0060C17A: mov ebx, var_F0
  loc_0060C180: push eax
  loc_0060C181: push ebx
  loc_0060C182: call [ecx+000000ACh]
  loc_0060C188: test eax, eax
  loc_0060C18A: fnclex
  loc_0060C18C: jge 0060C1A0h
  loc_0060C18E: push 000000ACh
  loc_0060C193: push 0041F844h
  loc_0060C198: push ebx
  loc_0060C199: push eax
  loc_0060C19A: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C1A0: lea ecx, var_18
  loc_0060C1A3: call [004012ACh] ; __vbaFreeStr
  loc_0060C1A9: lea ecx, var_1C
  loc_0060C1AC: call [004012B0h] ; __vbaFreeObj
  loc_0060C1B2: lea ecx, var_34
  loc_0060C1B5: call [00401020h] ; __vbaFreeVar
  loc_0060C1BB: mov eax, [esi+00000034h]
  loc_0060C1BE: lea ebx, [esi+00000034h]
  loc_0060C1C1: push eax
  loc_0060C1C2: mov edx, [eax]
  loc_0060C1C4: call [edx+000000C4h]
  loc_0060C1CA: test eax, eax
  loc_0060C1CC: fnclex
  loc_0060C1CE: jge 0060C1E4h
  loc_0060C1D0: mov ecx, [ebx]
  loc_0060C1D2: push 000000C4h
  loc_0060C1D7: push 0041E938h
  loc_0060C1DC: push ecx
  loc_0060C1DD: push eax
  loc_0060C1DE: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C1E4: push 0041E938h
  loc_0060C1E9: push 00000000h
  loc_0060C1EB: call [00401274h] ; __vbaCastObj
  loc_0060C1F1: lea edx, var_1C
  loc_0060C1F4: push eax
  loc_0060C1F5: push edx
  loc_0060C1F6: call [004010A0h] ; __vbaObjSet
  loc_0060C1FC: push eax
  loc_0060C1FD: push ebx
  loc_0060C1FE: call [004010B8h] ; __vbaObjSetAddref
  loc_0060C204: lea ecx, var_1C
  loc_0060C207: call [004012B0h] ; __vbaFreeObj
  loc_0060C20D: mov eax, 80020004h
  loc_0060C212: mov ebx, 0000000Ah
  loc_0060C217: lea edx, var_94
  loc_0060C21D: lea ecx, var_34
  loc_0060C220: mov var_5C, eax
  loc_0060C223: mov var_64, ebx
  loc_0060C226: mov var_4C, eax
  loc_0060C229: mov var_54, ebx
  loc_0060C22C: mov var_3C, eax
  loc_0060C22F: mov var_44, ebx
  loc_0060C232: mov var_8C, 0042BBF0h ; "Are your sure to delete!"
  loc_0060C23C: mov var_94, 00000008h
  loc_0060C246: call [00401240h] ; __vbaVarDup
  loc_0060C24C: lea eax, var_64
  loc_0060C24F: lea ecx, var_54
  loc_0060C252: push eax
  loc_0060C253: lea edx, var_44
  loc_0060C256: push ecx
  loc_0060C257: push edx
  loc_0060C258: lea eax, var_34
  loc_0060C25B: push 00000144h
  loc_0060C260: push eax
  loc_0060C261: call [004010A4h] ; rtcMsgBox
  loc_0060C267: xor ecx, ecx
  loc_0060C269: cmp eax, 00000006h
  loc_0060C26C: setz cl
  loc_0060C26F: neg ecx
  loc_0060C271: lea edx, var_64
  loc_0060C274: mov var_F0, cx
  loc_0060C27B: lea eax, var_54
  loc_0060C27E: push edx
  loc_0060C27F: lea ecx, var_44
  loc_0060C282: push eax
  loc_0060C283: lea edx, var_34
  loc_0060C286: push ecx
  loc_0060C287: push edx
  loc_0060C288: push 00000004h
  loc_0060C28A: call [00401038h] ; __vbaFreeVarList
  loc_0060C290: add esp, 00000014h
  loc_0060C293: cmp var_F0, 0000h
  loc_0060C29B: jz 0060C59Fh
  loc_0060C2A1: lea eax, var_94
  loc_0060C2A7: mov var_C4, ebx
  loc_0060C2AD: lea ecx, var_34
  loc_0060C2B0: mov ebx, 00000008h
  loc_0060C2B5: push eax
  loc_0060C2B6: push ecx
  loc_0060C2B7: mov var_BC, 80020004h
  loc_0060C2C1: mov var_9C, 004323D4h ; "Delete From Balance Where Name='"
  loc_0060C2CB: mov var_A4, ebx
  loc_0060C2D1: mov var_8C, 0061A0B8h
  loc_0060C2DB: mov var_94, 00004008h
  loc_0060C2E5: call [004010D4h] ; rtcTrimVar
  loc_0060C2EB: mov edx, [0061A13Ch]
  loc_0060C2F1: mov ecx, var_C4
  loc_0060C2F7: sub esp, 00000010h
  loc_0060C2FA: mov var_AC, 0041E890h ; "'"
  loc_0060C304: mov eax, esp
  loc_0060C306: mov var_B4, ebx
  loc_0060C30C: mov ebx, [edx]
  loc_0060C30E: mov edx, var_C0
  loc_0060C314: mov [eax], ecx
  loc_0060C316: mov ecx, var_BC
  loc_0060C31C: mov [eax+00000004h], edx
  loc_0060C31F: mov edx, var_B8
  loc_0060C325: mov [eax+00000008h], ecx
  loc_0060C328: lea ecx, var_34
  loc_0060C32B: mov [eax+0000000Ch], edx
  loc_0060C32E: lea eax, var_A4
  loc_0060C334: push eax
  loc_0060C335: lea edx, var_44
  loc_0060C338: push ecx
  loc_0060C339: push edx
  loc_0060C33A: call edi
  loc_0060C33C: push eax
  loc_0060C33D: lea eax, var_B4
  loc_0060C343: lea ecx, var_54
  loc_0060C346: push eax
  loc_0060C347: push ecx
  loc_0060C348: call edi
  loc_0060C34A: lea edx, var_18
  loc_0060C34D: push eax
  loc_0060C34E: push edx
  loc_0060C34F: call [004011B0h] ; __vbaStrVarVal
  loc_0060C355: push eax
  loc_0060C356: mov eax, [0061A13Ch]
  loc_0060C35B: push eax
  loc_0060C35C: call [ebx+0000005Ch]
  loc_0060C35F: test eax, eax
  loc_0060C361: fnclex
  loc_0060C363: jge 0060C37Ah
  loc_0060C365: mov ecx, [0061A13Ch]
  loc_0060C36B: push 0000005Ch
  loc_0060C36D: push 0041E928h
  loc_0060C372: push ecx
  loc_0060C373: push eax
  loc_0060C374: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C37A: lea ecx, var_18
  loc_0060C37D: call [004012ACh] ; __vbaFreeStr
  loc_0060C383: lea edx, var_54
  loc_0060C386: lea eax, var_44
  loc_0060C389: push edx
  loc_0060C38A: lea ecx, var_34
  loc_0060C38D: push eax
  loc_0060C38E: push ecx
  loc_0060C38F: push 00000003h
  loc_0060C391: call [00401038h] ; __vbaFreeVarList
  loc_0060C397: mov eax, 80020004h
  loc_0060C39C: mov ebx, 0000000Ah
  loc_0060C3A1: add esp, 00000010h
  loc_0060C3A4: lea edx, var_94
  loc_0060C3AA: lea ecx, var_34
  loc_0060C3AD: mov var_5C, eax
  loc_0060C3B0: mov var_64, ebx
  loc_0060C3B3: mov var_4C, eax
  loc_0060C3B6: mov var_54, ebx
  loc_0060C3B9: mov var_3C, eax
  loc_0060C3BC: mov var_44, ebx
  loc_0060C3BF: mov var_8C, 004249F4h ; "Delete Successfully."
  loc_0060C3C9: mov var_94, 00000008h
  loc_0060C3D3: call [00401240h] ; __vbaVarDup
  loc_0060C3D9: lea edx, var_64
  loc_0060C3DC: lea eax, var_54
  loc_0060C3DF: push edx
  loc_0060C3E0: lea ecx, var_44
  loc_0060C3E3: push eax
  loc_0060C3E4: push ecx
  loc_0060C3E5: lea edx, var_34
  loc_0060C3E8: push 00000040h
  loc_0060C3EA: push edx
  loc_0060C3EB: call [004010A4h] ; rtcMsgBox
  loc_0060C3F1: lea eax, var_64
  loc_0060C3F4: lea ecx, var_54
  loc_0060C3F7: push eax
  loc_0060C3F8: lea edx, var_44
  loc_0060C3FB: push ecx
  loc_0060C3FC: lea eax, var_34
  loc_0060C3FF: push edx
  loc_0060C400: push eax
  loc_0060C401: push 00000004h
  loc_0060C403: call [00401038h] ; __vbaFreeVarList
  loc_0060C409: mov ecx, [esi]
  loc_0060C40B: add esp, 00000014h
  loc_0060C40E: push 00000000h
  loc_0060C410: push 00000044h
  loc_0060C412: push esi
  loc_0060C413: call [ecx+00000338h]
  loc_0060C419: lea edx, var_1C
  loc_0060C41C: push eax
  loc_0060C41D: push edx
  loc_0060C41E: call [004010A0h] ; __vbaObjSet
  loc_0060C424: push eax
  loc_0060C425: call [00401024h] ; __vbaLateIdCall
  loc_0060C42B: add esp, 0000000Ch
  loc_0060C42E: lea ecx, var_1C
  loc_0060C431: call [004012B0h] ; __vbaFreeObj
  loc_0060C437: mov eax, [esi]
  loc_0060C439: push esi
  loc_0060C43A: call [eax+0000071Ch]
  loc_0060C440: mov ecx, [esi]
  loc_0060C442: push esi
  loc_0060C443: call [ecx+00000720h]
  loc_0060C449: lea edx, var_94
  loc_0060C44F: lea eax, var_34
  loc_0060C452: push edx
  loc_0060C453: push eax
  loc_0060C454: mov esi, 80020004h
  loc_0060C459: mov var_9C, 004321E8h ; "DELETE * FROM BALANCE IN '"
  loc_0060C463: mov var_A4, 00000008h
  loc_0060C46D: mov var_8C, 0061A09Ch
  loc_0060C477: mov var_94, 00004008h
  loc_0060C481: call [004010D4h] ; rtcTrimVar
  loc_0060C487: lea ecx, var_C4
  loc_0060C48D: mov var_AC, 004326BCh ; "' Where Name='"
  loc_0060C497: mov var_B4, 00000008h
  loc_0060C4A1: mov var_BC, 0061A0B8h
  loc_0060C4AB: mov var_C4, 00004008h
  loc_0060C4B5: push ecx
  loc_0060C4B6: lea edx, var_64
  loc_0060C4B9: push edx
  loc_0060C4BA: call [004010D4h] ; rtcTrimVar
  loc_0060C4C0: mov eax, [0061A13Ch]
  loc_0060C4C5: sub esp, 00000010h
  loc_0060C4C8: mov ecx, esp
  loc_0060C4CA: mov var_CC, 0041E890h ; "'"
  loc_0060C4D4: mov var_D4, 00000008h
  loc_0060C4DE: mov edx, [eax]
  loc_0060C4E0: mov eax, var_E0
  loc_0060C4E6: mov [ecx], ebx
  loc_0060C4E8: mov var_118, edx
  loc_0060C4EE: mov [ecx+00000004h], eax
  loc_0060C4F1: mov eax, var_D8
  loc_0060C4F7: mov [ecx+00000008h], esi
  loc_0060C4FA: mov [ecx+0000000Ch], eax
  loc_0060C4FD: lea ecx, var_A4
  loc_0060C503: push ecx
  loc_0060C504: lea eax, var_34
  loc_0060C507: lea ecx, var_44
  loc_0060C50A: push eax
  loc_0060C50B: push ecx
  loc_0060C50C: call edi
  loc_0060C50E: push eax
  loc_0060C50F: lea edx, var_B4
  loc_0060C515: lea eax, var_54
  loc_0060C518: push edx
  loc_0060C519: push eax
  loc_0060C51A: call edi
  loc_0060C51C: lea ecx, var_64
  loc_0060C51F: push eax
  loc_0060C520: lea edx, var_74
  loc_0060C523: push ecx
  loc_0060C524: push edx
  loc_0060C525: call edi
  loc_0060C527: push eax
  loc_0060C528: lea eax, var_D4
  loc_0060C52E: lea ecx, var_84
  loc_0060C534: push eax
  loc_0060C535: push ecx
  loc_0060C536: call edi
  loc_0060C538: lea edx, var_18
  loc_0060C53B: push eax
  loc_0060C53C: push edx
  loc_0060C53D: call [004011B0h] ; __vbaStrVarVal
  loc_0060C543: mov ecx, var_118
  loc_0060C549: push eax
  loc_0060C54A: mov eax, [0061A13Ch]
  loc_0060C54F: push eax
  loc_0060C550: call [ecx+0000005Ch]
  loc_0060C553: test eax, eax
  loc_0060C555: fnclex
  loc_0060C557: jge 0060C56Eh
  loc_0060C559: mov edx, [0061A13Ch]
  loc_0060C55F: push 0000005Ch
  loc_0060C561: push 0041E928h
  loc_0060C566: push edx
  loc_0060C567: push eax
  loc_0060C568: call [00401074h] ; __vbaHresultCheckObj
  loc_0060C56E: lea ecx, var_18
  loc_0060C571: call [004012ACh] ; __vbaFreeStr
  loc_0060C577: lea eax, var_84
  loc_0060C57D: lea ecx, var_74
  loc_0060C580: push eax
  loc_0060C581: lea edx, var_64
  loc_0060C584: push ecx
  loc_0060C585: lea eax, var_54
  loc_0060C588: push edx
  loc_0060C589: lea ecx, var_44
  loc_0060C58C: push eax
  loc_0060C58D: lea edx, var_34
  loc_0060C590: push ecx
  loc_0060C591: push edx
  loc_0060C592: push 00000006h
  loc_0060C594: call [00401038h] ; __vbaFreeVarList
  loc_0060C59A: add esp, 0000001Ch
  loc_0060C59D: jmp 0060C60Ch
  loc_0060C59F: mov eax, 80020004h
  loc_0060C5A4: lea edx, var_94
  loc_0060C5AA: lea ecx, var_34
  loc_0060C5AD: mov var_5C, eax
  loc_0060C5B0: mov var_64, ebx
  loc_0060C5B3: mov var_4C, eax
  loc_0060C5B6: mov var_54, ebx
  loc_0060C5B9: mov var_3C, eax
  loc_0060C5BC: mov var_44, ebx
  loc_0060C5BF: mov var_8C, 00429030h ; "Cann't Delete Successfully."
  loc_0060C5C9: mov var_94, 00000008h
  loc_0060C5D3: call [00401240h] ; __vbaVarDup
  loc_0060C5D9: lea eax, var_64
  loc_0060C5DC: lea ecx, var_54
  loc_0060C5DF: push eax
  loc_0060C5E0: lea edx, var_44
  loc_0060C5E3: push ecx
  loc_0060C5E4: push edx
  loc_0060C5E5: lea eax, var_34
  loc_0060C5E8: push 00000040h
  loc_0060C5EA: push eax
  loc_0060C5EB: call [004010A4h] ; rtcMsgBox
  loc_0060C5F1: lea ecx, var_64
  loc_0060C5F4: lea edx, var_54
  loc_0060C5F7: push ecx
  loc_0060C5F8: lea eax, var_44
  loc_0060C5FB: push edx
  loc_0060C5FC: lea ecx, var_34
  loc_0060C5FF: push eax
  loc_0060C600: push ecx
  loc_0060C601: push 00000004h
  loc_0060C603: call [00401038h] ; __vbaFreeVarList
  loc_0060C609: add esp, 00000014h
  loc_0060C60C: xor ebx, ebx
  loc_0060C60E: mov var_4, ebx
  loc_0060C611: push 0060C65Dh
  loc_0060C616: jmp 0060C65Ch
  loc_0060C618: lea ecx, var_18
  loc_0060C61B: call [004012ACh] ; __vbaFreeStr
  loc_0060C621: lea edx, var_24
  loc_0060C624: lea eax, var_20
  loc_0060C627: push edx
  loc_0060C628: lea ecx, var_1C
  loc_0060C62B: push eax
  loc_0060C62C: push ecx
  loc_0060C62D: push 00000003h
  loc_0060C62F: call [00401040h] ; __vbaFreeObjList
  loc_0060C635: lea edx, var_84
  loc_0060C63B: lea eax, var_74
  loc_0060C63E: push edx
  loc_0060C63F: lea ecx, var_64
  loc_0060C642: push eax
  loc_0060C643: lea edx, var_54
  loc_0060C646: push ecx
  loc_0060C647: lea eax, var_44
  loc_0060C64A: push edx
  loc_0060C64B: lea ecx, var_34
  loc_0060C64E: push eax
  loc_0060C64F: push ecx
  loc_0060C650: push 00000006h
  loc_0060C652: call [00401038h] ; __vbaFreeVarList
  loc_0060C658: add esp, 0000002Ch
  loc_0060C65B: ret
  loc_0060C65C: ret
  loc_0060C65D: mov eax, Me
  loc_0060C660: push eax
  loc_0060C661: mov edx, [eax]
  loc_0060C663: call [edx+00000008h]
  loc_0060C666: mov eax, var_4
  loc_0060C669: mov ecx, var_14
  loc_0060C66C: pop edi
  loc_0060C66D: pop esi
  loc_0060C66E: mov fs:[00000000h], ecx
  loc_0060C675: pop ebx
  loc_0060C676: mov esp, ebp
  loc_0060C678: pop ebp
  loc_0060C679: retn 0004h
End Sub

Private Sub cmdSave_Click() '60DBA0
  loc_0060DBA0: push ebp
  loc_0060DBA1: mov ebp, esp
  loc_0060DBA3: sub esp, 0000000Ch
  loc_0060DBA6: push 00403B36h ; __vbaExceptHandler
  loc_0060DBAB: mov eax, fs:[00000000h]
  loc_0060DBB1: push eax
  loc_0060DBB2: mov fs:[00000000h], esp
  loc_0060DBB9: sub esp, 000000C4h
  loc_0060DBBF: push ebx
  loc_0060DBC0: push esi
  loc_0060DBC1: push edi
  loc_0060DBC2: mov var_C, esp
  loc_0060DBC5: mov var_8, 00403858h
  loc_0060DBCC: mov edi, Me
  loc_0060DBCF: mov eax, edi
  loc_0060DBD1: and eax, 00000001h
  loc_0060DBD4: mov var_4, eax
  loc_0060DBD7: and edi, FFFFFFFEh
  loc_0060DBDA: push edi
  loc_0060DBDB: mov Me, edi
  loc_0060DBDE: mov ecx, [edi]
  loc_0060DBE0: call [ecx+00000004h]
  loc_0060DBE3: mov edx, [edi]
  loc_0060DBE5: xor esi, esi
  loc_0060DBE7: push edi
  loc_0060DBE8: mov var_18, esi
  loc_0060DBEB: mov var_1C, esi
  loc_0060DBEE: mov var_20, esi
  loc_0060DBF1: mov var_24, esi
  loc_0060DBF4: mov var_34, esi
  loc_0060DBF7: mov var_44, esi
  loc_0060DBFA: mov var_54, esi
  loc_0060DBFD: mov var_64, esi
  loc_0060DC00: mov var_74, esi
  loc_0060DC03: mov var_84, esi
  loc_0060DC09: mov var_94, esi
  loc_0060DC0F: mov var_A4, esi
  loc_0060DC15: mov var_B4, esi
  loc_0060DC1B: call [edx+000002FCh]
  loc_0060DC21: push eax
  loc_0060DC22: lea eax, var_20
  loc_0060DC25: push eax
  loc_0060DC26: call [004010A0h] ; __vbaObjSet
  loc_0060DC2C: mov ebx, eax
  loc_0060DC2E: lea edx, var_18
  loc_0060DC31: push edx
  loc_0060DC32: push ebx
  loc_0060DC33: mov ecx, [ebx]
  loc_0060DC35: call [ecx+000000A8h]
  loc_0060DC3B: cmp eax, esi
  loc_0060DC3D: fnclex
  loc_0060DC3F: jge 0060DC53h
  loc_0060DC41: push 000000A8h
  loc_0060DC46: push 0041F844h
  loc_0060DC4B: push ebx
  loc_0060DC4C: push eax
  loc_0060DC4D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060DC53: mov eax, var_18
  loc_0060DC56: lea ecx, var_44
  loc_0060DC59: mov var_2C, eax
  loc_0060DC5C: lea eax, var_34
  loc_0060DC5F: push eax
  loc_0060DC60: push ecx
  loc_0060DC61: mov var_18, esi
  loc_0060DC64: mov var_34, 00000008h
  loc_0060DC6B: call [004010D4h] ; rtcTrimVar
  loc_0060DC71: mov edx, [edi]
  loc_0060DC73: push edi
  loc_0060DC74: mov var_9C, 0041E5D4h
  loc_0060DC7E: mov var_A4, 00008008h
  loc_0060DC88: call [edx+00000318h]
  loc_0060DC8E: push eax
  loc_0060DC8F: lea eax, var_24
  loc_0060DC92: push eax
  loc_0060DC93: call [004010A0h] ; __vbaObjSet
  loc_0060DC99: mov ebx, eax
  loc_0060DC9B: lea edx, var_1C
  loc_0060DC9E: push edx
  loc_0060DC9F: push ebx
  loc_0060DCA0: mov ecx, [ebx]
  loc_0060DCA2: call [ecx+000000A0h]
  loc_0060DCA8: cmp eax, esi
  loc_0060DCAA: fnclex
  loc_0060DCAC: jge 0060DCC0h
  loc_0060DCAE: push 000000A0h
  loc_0060DCB3: push 0041E5E8h
  loc_0060DCB8: push ebx
  loc_0060DCB9: push eax
  loc_0060DCBA: call [00401074h] ; __vbaHresultCheckObj
  loc_0060DCC0: mov eax, var_1C
  loc_0060DCC3: lea ecx, var_74
  loc_0060DCC6: mov var_5C, eax
  loc_0060DCC9: lea eax, var_64
  loc_0060DCCC: push eax
  loc_0060DCCD: push ecx
  loc_0060DCCE: mov var_1C, esi
  loc_0060DCD1: mov var_64, 00000008h
  loc_0060DCD8: call [004010D4h] ; rtcTrimVar
  loc_0060DCDE: mov ebx, [00401050h] ; __vbaVarCmpNe
  loc_0060DCE4: lea edx, var_44
  loc_0060DCE7: lea eax, var_A4
  loc_0060DCED: push edx
  loc_0060DCEE: lea ecx, var_54
  loc_0060DCF1: push eax
  loc_0060DCF2: push ecx
  loc_0060DCF3: mov var_AC, 0041E5D4h
  loc_0060DCFD: mov var_B4, 00008008h
  loc_0060DD07: call ebx
  loc_0060DD09: push eax
  loc_0060DD0A: lea edx, var_74
  loc_0060DD0D: lea eax, var_B4
  loc_0060DD13: push edx
  loc_0060DD14: lea ecx, var_84
  loc_0060DD1A: push eax
  loc_0060DD1B: push ecx
  loc_0060DD1C: call ebx
  loc_0060DD1E: lea edx, var_94
  loc_0060DD24: push eax
  loc_0060DD25: push edx
  loc_0060DD26: call [0040115Ch] ; __vbaVarAnd
  loc_0060DD2C: push eax
  loc_0060DD2D: call [004010E0h] ; __vbaBoolVarNull
  loc_0060DD33: mov ebx, eax
  loc_0060DD35: lea eax, var_24
  loc_0060DD38: lea ecx, var_20
  loc_0060DD3B: push eax
  loc_0060DD3C: push ecx
  loc_0060DD3D: push 00000002h
  loc_0060DD3F: call [00401040h] ; __vbaFreeObjList
  loc_0060DD45: lea edx, var_74
  loc_0060DD48: lea eax, var_64
  loc_0060DD4B: push edx
  loc_0060DD4C: lea ecx, var_44
  loc_0060DD4F: push eax
  loc_0060DD50: lea edx, var_34
  loc_0060DD53: push ecx
  loc_0060DD54: push edx
  loc_0060DD55: push 00000004h
  loc_0060DD57: call [00401038h] ; __vbaFreeVarList
  loc_0060DD5D: add esp, 00000020h
  loc_0060DD60: cmp bx, si
  loc_0060DD63: jz 0060DD6Eh
  loc_0060DD65: mov eax, [edi]
  loc_0060DD67: push edi
  loc_0060DD68: call [eax+0000070Ch]
  loc_0060DD6E: mov var_4, esi
  loc_0060DD71: push 0060DDC7h
  loc_0060DD76: jmp 0060DDC6h
  loc_0060DD78: lea ecx, var_1C
  loc_0060DD7B: lea edx, var_18
  loc_0060DD7E: push ecx
  loc_0060DD7F: push edx
  loc_0060DD80: push 00000002h
  loc_0060DD82: call [004011FCh] ; __vbaFreeStrList
  loc_0060DD88: lea eax, var_24
  loc_0060DD8B: lea ecx, var_20
  loc_0060DD8E: push eax
  loc_0060DD8F: push ecx
  loc_0060DD90: push 00000002h
  loc_0060DD92: call [00401040h] ; __vbaFreeObjList
  loc_0060DD98: lea edx, var_94
  loc_0060DD9E: lea eax, var_84
  loc_0060DDA4: push edx
  loc_0060DDA5: lea ecx, var_74
  loc_0060DDA8: push eax
  loc_0060DDA9: lea edx, var_64
  loc_0060DDAC: push ecx
  loc_0060DDAD: lea eax, var_54
  loc_0060DDB0: push edx
  loc_0060DDB1: lea ecx, var_44
  loc_0060DDB4: push eax
  loc_0060DDB5: lea edx, var_34
  loc_0060DDB8: push ecx
  loc_0060DDB9: push edx
  loc_0060DDBA: push 00000007h
  loc_0060DDBC: call [00401038h] ; __vbaFreeVarList
  loc_0060DDC2: add esp, 00000038h
  loc_0060DDC5: ret
  loc_0060DDC6: ret
  loc_0060DDC7: mov eax, Me
  loc_0060DDCA: push eax
  loc_0060DDCB: mov ecx, [eax]
  loc_0060DDCD: call [ecx+00000008h]
  loc_0060DDD0: mov eax, var_4
  loc_0060DDD3: mov ecx, var_14
  loc_0060DDD6: pop edi
  loc_0060DDD7: pop esi
  loc_0060DDD8: mov fs:[00000000h], ecx
  loc_0060DDDF: pop ebx
  loc_0060DDE0: mov esp, ebp
  loc_0060DDE2: pop ebp
  loc_0060DDE3: retn 0004h
End Sub

Private Sub Form_Load() '60DDF0
  loc_0060DDF0: push ebp
  loc_0060DDF1: mov ebp, esp
  loc_0060DDF3: sub esp, 0000000Ch
  loc_0060DDF6: push 00403B36h ; __vbaExceptHandler
  loc_0060DDFB: mov eax, fs:[00000000h]
  loc_0060DE01: push eax
  loc_0060DE02: mov fs:[00000000h], esp
  loc_0060DE09: sub esp, 00000010h
  loc_0060DE0C: push ebx
  loc_0060DE0D: push esi
  loc_0060DE0E: push edi
  loc_0060DE0F: mov var_C, esp
  loc_0060DE12: mov var_8, 00403868h
  loc_0060DE19: mov esi, Me
  loc_0060DE1C: mov eax, esi
  loc_0060DE1E: and eax, 00000001h
  loc_0060DE21: mov var_4, eax
  loc_0060DE24: and esi, FFFFFFFEh
  loc_0060DE27: push esi
  loc_0060DE28: mov Me, esi
  loc_0060DE2B: mov ecx, [esi]
  loc_0060DE2D: call [ecx+00000004h]
  loc_0060DE30: mov edx, [esi]
  loc_0060DE32: lea eax, var_1C
  loc_0060DE35: xor edi, edi
  loc_0060DE37: push eax
  loc_0060DE38: mov var_1C, edi
  loc_0060DE3B: push esi
  loc_0060DE3C: mov var_18, edi
  loc_0060DE3F: mov var_1C, edi
  loc_0060DE42: call [edx+000006F8h]
  loc_0060DE48: mov ecx, [esi]
  loc_0060DE4A: push edi
  loc_0060DE4B: push 00000044h
  loc_0060DE4D: push esi
  loc_0060DE4E: call [ecx+00000338h]
  loc_0060DE54: lea edx, var_18
  loc_0060DE57: push eax
  loc_0060DE58: push edx
  loc_0060DE59: call [004010A0h] ; __vbaObjSet
  loc_0060DE5F: push eax
  loc_0060DE60: call [00401024h] ; __vbaLateIdCall
  loc_0060DE66: add esp, 0000000Ch
  loc_0060DE69: lea ecx, var_18
  loc_0060DE6C: call [004012B0h] ; __vbaFreeObj
  loc_0060DE72: mov eax, [esi]
  loc_0060DE74: push esi
  loc_0060DE75: call [eax+0000071Ch]
  loc_0060DE7B: mov ecx, [esi]
  loc_0060DE7D: push esi
  loc_0060DE7E: call [ecx+00000730h]
  loc_0060DE84: mov edx, [esi]
  loc_0060DE86: push esi
  loc_0060DE87: call [edx+00000720h]
  loc_0060DE8D: mov var_4, edi
  loc_0060DE90: push 0060DEA2h
  loc_0060DE95: jmp 0060DEA1h
  loc_0060DE97: lea ecx, var_18
  loc_0060DE9A: call [004012B0h] ; __vbaFreeObj
  loc_0060DEA0: ret
  loc_0060DEA1: ret
  loc_0060DEA2: mov eax, Me
  loc_0060DEA5: push eax
  loc_0060DEA6: mov ecx, [eax]
  loc_0060DEA8: call [ecx+00000008h]
  loc_0060DEAB: mov eax, var_4
  loc_0060DEAE: mov ecx, var_14
  loc_0060DEB1: pop edi
  loc_0060DEB2: pop esi
  loc_0060DEB3: mov fs:[00000000h], ecx
  loc_0060DEBA: pop ebx
  loc_0060DEBB: mov esp, ebp
  loc_0060DEBD: pop ebp
  loc_0060DEBE: retn 0004h
End Sub

Private Sub Proc_36_11_60AD10(arg_C) '60AD10
  loc_0060AD10: push ebp
  loc_0060AD11: mov ebp, esp
  loc_0060AD13: sub esp, 00000008h
  loc_0060AD16: push 00403B36h ; __vbaExceptHandler
  loc_0060AD1B: mov eax, fs:[00000000h]
  loc_0060AD21: push eax
  loc_0060AD22: mov fs:[00000000h], esp
  loc_0060AD29: sub esp, 00000010h
  loc_0060AD2C: push ebx
  loc_0060AD2D: push esi
  loc_0060AD2E: push edi
  loc_0060AD2F: mov var_8, esp
  loc_0060AD32: mov var_4, 00403798h
  loc_0060AD39: mov esi, Me
  loc_0060AD3C: mov var_14, 00000000h
  loc_0060AD43: push esi
  loc_0060AD44: mov eax, [esi]
  loc_0060AD46: call [eax+00000318h]
  loc_0060AD4C: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0060AD52: lea ecx, var_14
  loc_0060AD55: push eax
  loc_0060AD56: push ecx
  loc_0060AD57: call ebx
  loc_0060AD59: mov edi, eax
  loc_0060AD5B: mov eax, arg_C
  loc_0060AD5E: mov cx, [eax]
  loc_0060AD61: mov edx, [edi]
  loc_0060AD63: push ecx
  loc_0060AD64: push edi
  loc_0060AD65: call [edx+0000008Ch]
  loc_0060AD6B: test eax, eax
  loc_0060AD6D: fnclex
  loc_0060AD6F: jge 0060AD83h
  loc_0060AD71: push 0000008Ch
  loc_0060AD76: push 0041E5E8h
  loc_0060AD7B: push edi
  loc_0060AD7C: push eax
  loc_0060AD7D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AD83: mov edi, [004012B0h] ; __vbaFreeObj
  loc_0060AD89: lea ecx, var_14
  loc_0060AD8C: call edi
  loc_0060AD8E: mov edx, [esi]
  loc_0060AD90: push esi
  loc_0060AD91: call [edx+000002FCh]
  loc_0060AD97: push eax
  loc_0060AD98: lea eax, var_14
  loc_0060AD9B: push eax
  loc_0060AD9C: call ebx
  loc_0060AD9E: mov edx, arg_C
  loc_0060ADA1: mov esi, eax
  loc_0060ADA3: mov ax, [edx]
  loc_0060ADA6: mov ecx, [esi]
  loc_0060ADA8: push eax
  loc_0060ADA9: push esi
  loc_0060ADAA: call [ecx+00000094h]
  loc_0060ADB0: test eax, eax
  loc_0060ADB2: fnclex
  loc_0060ADB4: jge 0060ADC8h
  loc_0060ADB6: push 00000094h
  loc_0060ADBB: push 0041F844h
  loc_0060ADC0: push esi
  loc_0060ADC1: push eax
  loc_0060ADC2: call [00401074h] ; __vbaHresultCheckObj
  loc_0060ADC8: lea ecx, var_14
  loc_0060ADCB: call edi
  loc_0060ADCD: push 0060ADDFh
  loc_0060ADD2: jmp 0060ADDEh
  loc_0060ADD4: lea ecx, var_14
  loc_0060ADD7: call [004012B0h] ; __vbaFreeObj
  loc_0060ADDD: ret
  loc_0060ADDE: ret
  loc_0060ADDF: mov ecx, var_10
  loc_0060ADE2: pop edi
  loc_0060ADE3: pop esi
  loc_0060ADE4: xor eax, eax
  loc_0060ADE6: mov fs:[00000000h], ecx
  loc_0060ADED: pop ebx
  loc_0060ADEE: mov esp, ebp
  loc_0060ADF0: pop ebp
  loc_0060ADF1: retn 0008h
End Sub

Private Sub Proc_36_12_60AE00(arg_C) '60AE00
  loc_0060AE00: push ebp
  loc_0060AE01: mov ebp, esp
  loc_0060AE03: sub esp, 00000008h
  loc_0060AE06: push 00403B36h ; __vbaExceptHandler
  loc_0060AE0B: mov eax, fs:[00000000h]
  loc_0060AE11: push eax
  loc_0060AE12: mov fs:[00000000h], esp
  loc_0060AE19: sub esp, 00000010h
  loc_0060AE1C: push ebx
  loc_0060AE1D: push esi
  loc_0060AE1E: push edi
  loc_0060AE1F: mov var_8, esp
  loc_0060AE22: mov var_4, 004037A8h
  loc_0060AE29: mov esi, Me
  loc_0060AE2C: mov var_14, 00000000h
  loc_0060AE33: push esi
  loc_0060AE34: mov eax, [esi]
  loc_0060AE36: call [eax+00000310h]
  loc_0060AE3C: mov edi, [004010A0h] ; __vbaObjSet
  loc_0060AE42: lea ecx, var_14
  loc_0060AE45: push eax
  loc_0060AE46: push ecx
  loc_0060AE47: call edi
  loc_0060AE49: mov ebx, arg_C
  loc_0060AE4C: mov edx, [eax]
  loc_0060AE4E: mov var_18, eax
  loc_0060AE51: mov cx, [ebx]
  loc_0060AE54: not cx
  loc_0060AE57: push ecx
  loc_0060AE58: push eax
  loc_0060AE59: call [edx+00000094h]
  loc_0060AE5F: test eax, eax
  loc_0060AE61: fnclex
  loc_0060AE63: jge 0060AE7Ah
  loc_0060AE65: mov edx, var_18
  loc_0060AE68: push 00000094h
  loc_0060AE6D: push 0041EAACh
  loc_0060AE72: push edx
  loc_0060AE73: push eax
  loc_0060AE74: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AE7A: lea ecx, var_14
  loc_0060AE7D: call [004012B0h] ; __vbaFreeObj
  loc_0060AE83: mov eax, [esi]
  loc_0060AE85: push esi
  loc_0060AE86: call [eax+00000314h]
  loc_0060AE8C: lea ecx, var_14
  loc_0060AE8F: push eax
  loc_0060AE90: push ecx
  loc_0060AE91: call edi
  loc_0060AE93: mov cx, [ebx]
  loc_0060AE96: mov edx, [eax]
  loc_0060AE98: not cx
  loc_0060AE9B: push ecx
  loc_0060AE9C: push eax
  loc_0060AE9D: mov var_18, eax
  loc_0060AEA0: call [edx+00000094h]
  loc_0060AEA6: test eax, eax
  loc_0060AEA8: fnclex
  loc_0060AEAA: jge 0060AEC1h
  loc_0060AEAC: mov edx, var_18
  loc_0060AEAF: push 00000094h
  loc_0060AEB4: push 0041EAACh
  loc_0060AEB9: push edx
  loc_0060AEBA: push eax
  loc_0060AEBB: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AEC1: lea ecx, var_14
  loc_0060AEC4: call [004012B0h] ; __vbaFreeObj
  loc_0060AECA: mov eax, [esi]
  loc_0060AECC: push esi
  loc_0060AECD: call [eax+00000308h]
  loc_0060AED3: lea ecx, var_14
  loc_0060AED6: push eax
  loc_0060AED7: push ecx
  loc_0060AED8: call edi
  loc_0060AEDA: mov cx, [ebx]
  loc_0060AEDD: mov edx, [eax]
  loc_0060AEDF: push ecx
  loc_0060AEE0: push eax
  loc_0060AEE1: mov var_18, eax
  loc_0060AEE4: call [edx+00000094h]
  loc_0060AEEA: test eax, eax
  loc_0060AEEC: fnclex
  loc_0060AEEE: jge 0060AF05h
  loc_0060AEF0: mov edx, var_18
  loc_0060AEF3: push 00000094h
  loc_0060AEF8: push 0041EAACh
  loc_0060AEFD: push edx
  loc_0060AEFE: push eax
  loc_0060AEFF: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AF05: lea ecx, var_14
  loc_0060AF08: call [004012B0h] ; __vbaFreeObj
  loc_0060AF0E: mov eax, [esi]
  loc_0060AF10: push esi
  loc_0060AF11: call [eax+0000030Ch]
  loc_0060AF17: lea ecx, var_14
  loc_0060AF1A: push eax
  loc_0060AF1B: push ecx
  loc_0060AF1C: call edi
  loc_0060AF1E: mov cx, [ebx]
  loc_0060AF21: mov edx, [eax]
  loc_0060AF23: push ecx
  loc_0060AF24: push eax
  loc_0060AF25: mov var_18, eax
  loc_0060AF28: call [edx+00000094h]
  loc_0060AF2E: test eax, eax
  loc_0060AF30: fnclex
  loc_0060AF32: jge 0060AF49h
  loc_0060AF34: mov edx, var_18
  loc_0060AF37: push 00000094h
  loc_0060AF3C: push 0041EAACh
  loc_0060AF41: push edx
  loc_0060AF42: push eax
  loc_0060AF43: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AF49: lea ecx, var_14
  loc_0060AF4C: call [004012B0h] ; __vbaFreeObj
  loc_0060AF52: mov eax, [esi]
  loc_0060AF54: push esi
  loc_0060AF55: call [eax+00000300h]
  loc_0060AF5B: lea ecx, var_14
  loc_0060AF5E: push eax
  loc_0060AF5F: push ecx
  loc_0060AF60: call edi
  loc_0060AF62: mov cx, [ebx]
  loc_0060AF65: mov edx, [eax]
  loc_0060AF67: push ecx
  loc_0060AF68: push eax
  loc_0060AF69: mov var_18, eax
  loc_0060AF6C: call [edx+00000094h]
  loc_0060AF72: test eax, eax
  loc_0060AF74: fnclex
  loc_0060AF76: jge 0060AF8Dh
  loc_0060AF78: mov edx, var_18
  loc_0060AF7B: push 00000094h
  loc_0060AF80: push 0041EAACh
  loc_0060AF85: push edx
  loc_0060AF86: push eax
  loc_0060AF87: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AF8D: lea ecx, var_14
  loc_0060AF90: call [004012B0h] ; __vbaFreeObj
  loc_0060AF96: mov eax, [esi]
  loc_0060AF98: push esi
  loc_0060AF99: call [eax+00000304h]
  loc_0060AF9F: lea ecx, var_14
  loc_0060AFA2: push eax
  loc_0060AFA3: push ecx
  loc_0060AFA4: call edi
  loc_0060AFA6: mov cx, [ebx]
  loc_0060AFA9: mov edx, [eax]
  loc_0060AFAB: push ecx
  loc_0060AFAC: push eax
  loc_0060AFAD: mov var_18, eax
  loc_0060AFB0: call [edx+00000094h]
  loc_0060AFB6: test eax, eax
  loc_0060AFB8: fnclex
  loc_0060AFBA: jge 0060AFD1h
  loc_0060AFBC: mov edx, var_18
  loc_0060AFBF: push 00000094h
  loc_0060AFC4: push 0041EAACh
  loc_0060AFC9: push edx
  loc_0060AFCA: push eax
  loc_0060AFCB: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AFD1: lea ecx, var_14
  loc_0060AFD4: call [004012B0h] ; __vbaFreeObj
  loc_0060AFDA: mov eax, [esi]
  loc_0060AFDC: push esi
  loc_0060AFDD: call [eax+0000031Ch]
  loc_0060AFE3: lea ecx, var_14
  loc_0060AFE6: push eax
  loc_0060AFE7: push ecx
  loc_0060AFE8: call edi
  loc_0060AFEA: mov esi, eax
  loc_0060AFEC: mov ax, [ebx]
  loc_0060AFEF: push eax
  loc_0060AFF0: push esi
  loc_0060AFF1: mov edx, [esi]
  loc_0060AFF3: call [edx+00000094h]
  loc_0060AFF9: test eax, eax
  loc_0060AFFB: fnclex
  loc_0060AFFD: jge 0060B011h
  loc_0060AFFF: push 00000094h
  loc_0060B004: push 0041EAACh
  loc_0060B009: push esi
  loc_0060B00A: push eax
  loc_0060B00B: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B011: lea ecx, var_14
  loc_0060B014: call [004012B0h] ; __vbaFreeObj
  loc_0060B01A: push 0060B02Ch
  loc_0060B01F: jmp 0060B02Bh
  loc_0060B021: lea ecx, var_14
  loc_0060B024: call [004012B0h] ; __vbaFreeObj
  loc_0060B02A: ret
  loc_0060B02B: ret
  loc_0060B02C: mov ecx, var_10
  loc_0060B02F: pop edi
  loc_0060B030: pop esi
  loc_0060B031: xor eax, eax
  loc_0060B033: mov fs:[00000000h], ecx
  loc_0060B03A: pop ebx
  loc_0060B03B: mov esp, ebp
  loc_0060B03D: pop ebp
  loc_0060B03E: retn 0008h
End Sub

Private Sub Proc_36_13_60B050() '60B050
  loc_0060B050: push ebp
  loc_0060B051: mov ebp, esp
  loc_0060B053: sub esp, 00000008h
  loc_0060B056: push 00403B36h ; __vbaExceptHandler
  loc_0060B05B: mov eax, fs:[00000000h]
  loc_0060B061: push eax
  loc_0060B062: mov fs:[00000000h], esp
  loc_0060B069: sub esp, 00000010h
  loc_0060B06C: push ebx
  loc_0060B06D: push esi
  loc_0060B06E: push edi
  loc_0060B06F: mov var_8, esp
  loc_0060B072: mov var_4, 004037B8h
  loc_0060B079: mov esi, Me
  loc_0060B07C: mov var_14, 00000000h
  loc_0060B083: push esi
  loc_0060B084: mov eax, [esi]
  loc_0060B086: call [eax+00000318h]
  loc_0060B08C: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0060B092: lea ecx, var_14
  loc_0060B095: push eax
  loc_0060B096: push ecx
  loc_0060B097: call ebx
  loc_0060B099: mov edi, eax
  loc_0060B09B: push 0041E5D4h
  loc_0060B0A0: push edi
  loc_0060B0A1: mov edx, [edi]
  loc_0060B0A3: call [edx+000000A4h]
  loc_0060B0A9: test eax, eax
  loc_0060B0AB: fnclex
  loc_0060B0AD: jge 0060B0C1h
  loc_0060B0AF: push 000000A4h
  loc_0060B0B4: push 0041E5E8h
  loc_0060B0B9: push edi
  loc_0060B0BA: push eax
  loc_0060B0BB: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B0C1: mov edi, [004012B0h] ; __vbaFreeObj
  loc_0060B0C7: lea ecx, var_14
  loc_0060B0CA: call edi
  loc_0060B0CC: mov eax, [esi]
  loc_0060B0CE: push esi
  loc_0060B0CF: call [eax+000002FCh]
  loc_0060B0D5: lea ecx, var_14
  loc_0060B0D8: push eax
  loc_0060B0D9: push ecx
  loc_0060B0DA: call ebx
  loc_0060B0DC: mov esi, eax
  loc_0060B0DE: push 0041E5D4h
  loc_0060B0E3: push esi
  loc_0060B0E4: mov edx, [esi]
  loc_0060B0E6: call [edx+000000ACh]
  loc_0060B0EC: test eax, eax
  loc_0060B0EE: fnclex
  loc_0060B0F0: jge 0060B104h
  loc_0060B0F2: push 000000ACh
  loc_0060B0F7: push 0041F844h
  loc_0060B0FC: push esi
  loc_0060B0FD: push eax
  loc_0060B0FE: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B104: lea ecx, var_14
  loc_0060B107: call edi
  loc_0060B109: push 0060B11Bh
  loc_0060B10E: jmp 0060B11Ah
  loc_0060B110: lea ecx, var_14
  loc_0060B113: call [004012B0h] ; __vbaFreeObj
  loc_0060B119: ret
  loc_0060B11A: ret
  loc_0060B11B: mov ecx, var_10
  loc_0060B11E: pop edi
  loc_0060B11F: pop esi
  loc_0060B120: xor eax, eax
  loc_0060B122: mov fs:[00000000h], ecx
  loc_0060B129: pop ebx
  loc_0060B12A: mov esp, ebp
  loc_0060B12C: pop ebp
  loc_0060B12D: retn 0004h
End Sub

Private Sub Proc_36_14_60B2E0() '60B2E0
  loc_0060B2E0: push ebp
  loc_0060B2E1: mov ebp, esp
  loc_0060B2E3: sub esp, 00000008h
  loc_0060B2E6: push 00403B36h ; __vbaExceptHandler
  loc_0060B2EB: mov eax, fs:[00000000h]
  loc_0060B2F1: push eax
  loc_0060B2F2: mov fs:[00000000h], esp
  loc_0060B2F9: sub esp, 00000104h
  loc_0060B2FF: push ebx
  loc_0060B300: push esi
  loc_0060B301: push edi
  loc_0060B302: mov var_8, esp
  loc_0060B305: mov var_4, 004037E8h
  loc_0060B30C: mov esi, Me
  loc_0060B30F: xor ebx, ebx
  loc_0060B311: push esi
  loc_0060B312: mov var_14, ebx
  loc_0060B315: mov eax, [esi]
  loc_0060B317: mov var_18, ebx
  loc_0060B31A: mov var_1C, ebx
  loc_0060B31D: mov var_20, ebx
  loc_0060B320: mov var_30, ebx
  loc_0060B323: mov var_40, ebx
  loc_0060B326: mov var_50, ebx
  loc_0060B329: mov var_60, ebx
  loc_0060B32C: mov var_70, ebx
  loc_0060B32F: mov var_80, ebx
  loc_0060B332: mov var_90, ebx
  loc_0060B338: mov var_A0, ebx
  loc_0060B33E: mov var_C0, ebx
  loc_0060B344: mov var_E4, ebx
  loc_0060B34A: mov var_C8, 80020004h
  loc_0060B354: mov var_D0, 0000000Ah
  loc_0060B35E: mov var_A8, 004323D4h ; "Delete From Balance Where Name='"
  loc_0060B368: mov var_B0, 00000008h
  loc_0060B372: call [eax+000002FCh]
  loc_0060B378: lea ecx, var_1C
  loc_0060B37B: push eax
  loc_0060B37C: push ecx
  loc_0060B37D: call [004010A0h] ; __vbaObjSet
  loc_0060B383: mov edi, eax
  loc_0060B385: lea eax, var_14
  loc_0060B388: push eax
  loc_0060B389: push edi
  loc_0060B38A: mov edx, [edi]
  loc_0060B38C: call [edx+000000A8h]
  loc_0060B392: cmp eax, ebx
  loc_0060B394: fnclex
  loc_0060B396: jge 0060B3AAh
  loc_0060B398: push 000000A8h
  loc_0060B39D: push 0041F844h
  loc_0060B3A2: push edi
  loc_0060B3A3: push eax
  loc_0060B3A4: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B3AA: mov eax, var_14
  loc_0060B3AD: lea ecx, var_30
  loc_0060B3B0: lea edx, var_40
  loc_0060B3B3: mov edi, 00000008h
  loc_0060B3B8: push ecx
  loc_0060B3B9: push edx
  loc_0060B3BA: mov var_14, ebx
  loc_0060B3BD: mov var_28, eax
  loc_0060B3C0: mov var_30, edi
  loc_0060B3C3: call [004010D4h] ; rtcTrimVar
  loc_0060B3C9: mov eax, [0061A13Ch]
  loc_0060B3CE: mov edx, var_D0
  loc_0060B3D4: sub esp, 00000010h
  loc_0060B3D7: mov var_B8, 0041E890h ; "'"
  loc_0060B3E1: mov ecx, esp
  loc_0060B3E3: mov var_C0, edi
  loc_0060B3E9: mov edi, [eax]
  loc_0060B3EB: mov eax, var_CC
  loc_0060B3F1: mov [ecx], edx
  loc_0060B3F3: mov edx, var_C8
  loc_0060B3F9: mov [ecx+00000004h], eax
  loc_0060B3FC: mov eax, var_C4
  loc_0060B402: mov [ecx+00000008h], edx
  loc_0060B405: lea edx, var_40
  loc_0060B408: mov [ecx+0000000Ch], eax
  loc_0060B40B: lea ecx, var_B0
  loc_0060B411: push ecx
  loc_0060B412: lea eax, var_50
  loc_0060B415: push edx
  loc_0060B416: push eax
  loc_0060B417: call [004011B4h] ; __vbaVarCat
  loc_0060B41D: lea ecx, var_C0
  loc_0060B423: push eax
  loc_0060B424: lea edx, var_60
  loc_0060B427: push ecx
  loc_0060B428: push edx
  loc_0060B429: call [004011B4h] ; __vbaVarCat
  loc_0060B42F: push eax
  loc_0060B430: lea eax, var_18
  loc_0060B433: push eax
  loc_0060B434: call [004011B0h] ; __vbaStrVarVal
  loc_0060B43A: mov ecx, [0061A13Ch]
  loc_0060B440: push eax
  loc_0060B441: push ecx
  loc_0060B442: call [edi+0000005Ch]
  loc_0060B445: cmp eax, ebx
  loc_0060B447: fnclex
  loc_0060B449: jge 0060B460h
  loc_0060B44B: mov edx, [0061A13Ch]
  loc_0060B451: push 0000005Ch
  loc_0060B453: push 0041E928h
  loc_0060B458: push edx
  loc_0060B459: push eax
  loc_0060B45A: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B460: lea ecx, var_18
  loc_0060B463: call [004012ACh] ; __vbaFreeStr
  loc_0060B469: lea ecx, var_1C
  loc_0060B46C: call [004012B0h] ; __vbaFreeObj
  loc_0060B472: lea eax, var_60
  loc_0060B475: lea ecx, var_50
  loc_0060B478: push eax
  loc_0060B479: lea edx, var_40
  loc_0060B47C: push ecx
  loc_0060B47D: lea eax, var_30
  loc_0060B480: push edx
  loc_0060B481: push eax
  loc_0060B482: push 00000004h
  loc_0060B484: call [00401038h] ; __vbaFreeVarList
  loc_0060B48A: add esp, 00000014h
  loc_0060B48D: lea edi, var_1C
  loc_0060B490: mov ecx, 0000000Ah
  loc_0060B495: mov eax, 80020004h
  loc_0060B49A: push edi
  loc_0060B49B: mov var_D0, ecx
  loc_0060B4A1: sub esp, 00000010h
  loc_0060B4A4: mov var_C0, ecx
  loc_0060B4AA: mov edi, esp
  loc_0060B4AC: mov var_C8, eax
  loc_0060B4B2: mov var_B8, eax
  loc_0060B4B8: sub esp, 00000010h
  loc_0060B4BB: mov [edi], ecx
  loc_0060B4BD: mov ecx, var_CC
  loc_0060B4C3: mov var_B0, 00000003h
  loc_0060B4CD: mov edx, [0061A13Ch]
  loc_0060B4D3: mov [edi+00000004h], ecx
  loc_0060B4D6: mov ecx, esp
  loc_0060B4D8: sub esp, 00000010h
  loc_0060B4DB: mov var_A8, 00000002h
  loc_0060B4E5: mov [edi+00000008h], eax
  loc_0060B4E8: mov eax, var_C4
  loc_0060B4EE: mov edx, [edx]
  loc_0060B4F0: mov [edi+0000000Ch], eax
  loc_0060B4F3: mov eax, var_C0
  loc_0060B4F9: mov [ecx], eax
  loc_0060B4FB: mov eax, var_BC
  loc_0060B501: mov [ecx+00000004h], eax
  loc_0060B504: mov eax, var_B8
  loc_0060B50A: mov [ecx+00000008h], eax
  loc_0060B50D: mov eax, var_B4
  loc_0060B513: mov [ecx+0000000Ch], eax
  loc_0060B516: mov eax, var_B0
  loc_0060B51C: mov ecx, esp
  loc_0060B51E: push 0043241Ch ; "Select * from Balance"
  loc_0060B523: mov [ecx], eax
  loc_0060B525: mov eax, var_AC
  loc_0060B52B: mov [ecx+00000004h], eax
  loc_0060B52E: mov eax, var_A8
  loc_0060B534: mov [ecx+00000008h], eax
  loc_0060B537: mov eax, var_A4
  loc_0060B53D: mov [ecx+0000000Ch], eax
  loc_0060B540: mov ecx, [0061A13Ch]
  loc_0060B546: push ecx
  loc_0060B547: call [edx+000000BCh]
  loc_0060B54D: cmp eax, ebx
  loc_0060B54F: fnclex
  loc_0060B551: jge 0060B56Bh
  loc_0060B553: mov edx, [0061A13Ch]
  loc_0060B559: push 000000BCh
  loc_0060B55E: push 0041E928h
  loc_0060B563: push edx
  loc_0060B564: push eax
  loc_0060B565: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B56B: mov eax, var_1C
  loc_0060B56E: lea edi, [esi+00000034h]
  loc_0060B571: push eax
  loc_0060B572: push edi
  loc_0060B573: call [004010B8h] ; __vbaObjSetAddref
  loc_0060B579: lea ecx, var_1C
  loc_0060B57C: call [004012B0h] ; __vbaFreeObj
  loc_0060B582: mov eax, [edi]
  loc_0060B584: push eax
  loc_0060B585: mov ecx, [eax]
  loc_0060B587: call [ecx+000000C0h]
  loc_0060B58D: cmp eax, ebx
  loc_0060B58F: fnclex
  loc_0060B591: jge 0060B5A7h
  loc_0060B593: mov edx, [edi]
  loc_0060B595: push 000000C0h
  loc_0060B59A: push 0041E938h
  loc_0060B59F: push edx
  loc_0060B5A0: push eax
  loc_0060B5A1: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B5A7: mov eax, [esi]
  loc_0060B5A9: push esi
  loc_0060B5AA: call [eax+000002FCh]
  loc_0060B5B0: lea ecx, var_1C
  loc_0060B5B3: push eax
  loc_0060B5B4: push ecx
  loc_0060B5B5: call [004010A0h] ; __vbaObjSet
  loc_0060B5BB: mov edx, [eax]
  loc_0060B5BD: lea ecx, var_14
  loc_0060B5C0: push ecx
  loc_0060B5C1: push eax
  loc_0060B5C2: mov var_E8, eax
  loc_0060B5C8: call [edx+000000A8h]
  loc_0060B5CE: cmp eax, ebx
  loc_0060B5D0: fnclex
  loc_0060B5D2: jge 0060B5ECh
  loc_0060B5D4: mov edx, var_E8
  loc_0060B5DA: push 000000A8h
  loc_0060B5DF: push 0041F844h
  loc_0060B5E4: push edx
  loc_0060B5E5: push eax
  loc_0060B5E6: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B5EC: mov eax, var_14
  loc_0060B5EF: lea ecx, var_40
  loc_0060B5F2: mov var_28, eax
  loc_0060B5F5: lea eax, var_30
  loc_0060B5F8: push eax
  loc_0060B5F9: push ecx
  loc_0060B5FA: mov var_14, ebx
  loc_0060B5FD: mov var_30, 00000008h
  loc_0060B604: call [004010D4h] ; rtcTrimVar
  loc_0060B60A: mov eax, [edi]
  loc_0060B60C: mov ecx, var_40
  loc_0060B60F: mov var_A8, 0041EA08h ; "Name"
  loc_0060B619: mov var_B0, 00000008h
  loc_0060B623: mov edx, [eax]
  loc_0060B625: sub esp, 00000010h
  loc_0060B628: mov eax, esp
  loc_0060B62A: sub esp, 00000010h
  loc_0060B62D: mov [eax], ecx
  loc_0060B62F: mov ecx, var_3C
  loc_0060B632: mov [eax+00000004h], ecx
  loc_0060B635: mov ecx, var_38
  loc_0060B638: mov [eax+00000008h], ecx
  loc_0060B63B: mov ecx, var_34
  loc_0060B63E: mov [eax+0000000Ch], ecx
  loc_0060B641: mov ecx, var_B0
  loc_0060B647: mov eax, esp
  loc_0060B649: mov [eax], ecx
  loc_0060B64B: mov ecx, var_AC
  loc_0060B651: mov [eax+00000004h], ecx
  loc_0060B654: mov ecx, var_A8
  loc_0060B65A: mov [eax+00000008h], ecx
  loc_0060B65D: mov ecx, var_A4
  loc_0060B663: mov [eax+0000000Ch], ecx
  loc_0060B666: mov eax, [edi]
  loc_0060B668: push eax
  loc_0060B669: call [edx+00000128h]
  loc_0060B66F: cmp eax, ebx
  loc_0060B671: fnclex
  loc_0060B673: jge 0060B689h
  loc_0060B675: mov edx, [edi]
  loc_0060B677: push 00000128h
  loc_0060B67C: push 0041E938h
  loc_0060B681: push edx
  loc_0060B682: push eax
  loc_0060B683: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B689: lea ecx, var_1C
  loc_0060B68C: call [004012B0h] ; __vbaFreeObj
  loc_0060B692: lea eax, var_40
  loc_0060B695: lea ecx, var_30
  loc_0060B698: push eax
  loc_0060B699: push ecx
  loc_0060B69A: push 00000002h
  loc_0060B69C: call [00401038h] ; __vbaFreeVarList
  loc_0060B6A2: mov edx, [esi]
  loc_0060B6A4: add esp, 0000000Ch
  loc_0060B6A7: push esi
  loc_0060B6A8: call [edx+00000318h]
  loc_0060B6AE: push eax
  loc_0060B6AF: lea eax, var_1C
  loc_0060B6B2: push eax
  loc_0060B6B3: call [004010A0h] ; __vbaObjSet
  loc_0060B6B9: mov ecx, [eax]
  loc_0060B6BB: lea edx, var_14
  loc_0060B6BE: push edx
  loc_0060B6BF: push eax
  loc_0060B6C0: mov var_E8, eax
  loc_0060B6C6: call [ecx+000000A0h]
  loc_0060B6CC: cmp eax, ebx
  loc_0060B6CE: fnclex
  loc_0060B6D0: jge 0060B6EAh
  loc_0060B6D2: mov ecx, var_E8
  loc_0060B6D8: push 000000A0h
  loc_0060B6DD: push 0041E5E8h
  loc_0060B6E2: push ecx
  loc_0060B6E3: push eax
  loc_0060B6E4: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B6EA: mov eax, var_14
  loc_0060B6ED: lea edx, var_30
  loc_0060B6F0: mov var_28, eax
  loc_0060B6F3: lea eax, var_40
  loc_0060B6F6: push edx
  loc_0060B6F7: push eax
  loc_0060B6F8: mov var_14, ebx
  loc_0060B6FB: mov var_30, 00000008h
  loc_0060B702: call [004010D4h] ; rtcTrimVar
  loc_0060B708: mov ecx, [esi]
  loc_0060B70A: push esi
  loc_0060B70B: call [ecx+00000318h]
  loc_0060B711: lea edx, var_20
  loc_0060B714: push eax
  loc_0060B715: push edx
  loc_0060B716: call [004010A0h] ; __vbaObjSet
  loc_0060B71C: mov ecx, [eax]
  loc_0060B71E: lea edx, var_18
  loc_0060B721: push edx
  loc_0060B722: push eax
  loc_0060B723: mov var_F0, eax
  loc_0060B729: call [ecx+000000A0h]
  loc_0060B72F: cmp eax, ebx
  loc_0060B731: fnclex
  loc_0060B733: jge 0060B74Dh
  loc_0060B735: mov ecx, var_F0
  loc_0060B73B: push 000000A0h
  loc_0060B740: push 0041E5E8h
  loc_0060B745: push ecx
  loc_0060B746: push eax
  loc_0060B747: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B74D: mov eax, var_18
  loc_0060B750: lea edx, var_60
  loc_0060B753: mov var_58, eax
  loc_0060B756: lea eax, var_70
  loc_0060B759: push edx
  loc_0060B75A: push eax
  loc_0060B75B: mov var_18, ebx
  loc_0060B75E: mov var_60, 00000008h
  loc_0060B765: call [004010D4h] ; rtcTrimVar
  loc_0060B76B: lea ecx, var_40
  loc_0060B76E: lea edx, var_B0
  loc_0060B774: push ecx
  loc_0060B775: lea eax, var_50
  loc_0060B778: push edx
  loc_0060B779: push eax
  loc_0060B77A: mov var_88, ebx
  loc_0060B780: mov var_90, 00000002h
  loc_0060B78A: mov var_A8, 0041E5D4h
  loc_0060B794: mov var_B0, 00008008h
  loc_0060B79E: call [00401050h] ; __vbaVarCmpNe
  loc_0060B7A4: mov edx, eax
  loc_0060B7A6: lea ecx, var_80
  loc_0060B7A9: call [00401014h] ; __vbaVarMove
  loc_0060B7AF: lea ecx, var_90
  loc_0060B7B5: lea edx, var_70
  loc_0060B7B8: push ecx
  loc_0060B7B9: lea eax, var_80
  loc_0060B7BC: push edx
  loc_0060B7BD: lea ecx, var_A0
  loc_0060B7C3: push eax
  loc_0060B7C4: push ecx
  loc_0060B7C5: call [004011F0h] ; rtcImmediateIf
  loc_0060B7CB: mov eax, [edi]
  loc_0060B7CD: mov ecx, var_A0
  loc_0060B7D3: mov var_C8, 0042043Ch ; "Amount"
  loc_0060B7DD: mov var_D0, 00000008h
  loc_0060B7E7: mov edx, [eax]
  loc_0060B7E9: sub esp, 00000010h
  loc_0060B7EC: mov eax, esp
  loc_0060B7EE: sub esp, 00000010h
  loc_0060B7F1: mov [eax], ecx
  loc_0060B7F3: mov ecx, var_9C
  loc_0060B7F9: mov [eax+00000004h], ecx
  loc_0060B7FC: mov ecx, var_98
  loc_0060B802: mov [eax+00000008h], ecx
  loc_0060B805: mov ecx, var_94
  loc_0060B80B: mov [eax+0000000Ch], ecx
  loc_0060B80E: mov ecx, var_D0
  loc_0060B814: mov eax, esp
  loc_0060B816: mov [eax], ecx
  loc_0060B818: mov ecx, var_CC
  loc_0060B81E: mov [eax+00000004h], ecx
  loc_0060B821: mov ecx, var_C8
  loc_0060B827: mov [eax+00000008h], ecx
  loc_0060B82A: mov ecx, var_C4
  loc_0060B830: mov [eax+0000000Ch], ecx
  loc_0060B833: mov eax, [edi]
  loc_0060B835: push eax
  loc_0060B836: call [edx+00000128h]
  loc_0060B83C: cmp eax, ebx
  loc_0060B83E: fnclex
  loc_0060B840: jge 0060B856h
  loc_0060B842: mov edx, [edi]
  loc_0060B844: push 00000128h
  loc_0060B849: push 0041E938h
  loc_0060B84E: push edx
  loc_0060B84F: push eax
  loc_0060B850: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B856: lea eax, var_20
  loc_0060B859: lea ecx, var_1C
  loc_0060B85C: push eax
  loc_0060B85D: push ecx
  loc_0060B85E: push 00000002h
  loc_0060B860: call [00401040h] ; __vbaFreeObjList
  loc_0060B866: lea edx, var_A0
  loc_0060B86C: lea eax, var_90
  loc_0060B872: push edx
  loc_0060B873: lea ecx, var_70
  loc_0060B876: push eax
  loc_0060B877: lea edx, var_80
  loc_0060B87A: push ecx
  loc_0060B87B: lea eax, var_60
  loc_0060B87E: push edx
  loc_0060B87F: lea ecx, var_40
  loc_0060B882: push eax
  loc_0060B883: lea edx, var_30
  loc_0060B886: push ecx
  loc_0060B887: push edx
  loc_0060B888: push 00000007h
  loc_0060B88A: call [00401038h] ; __vbaFreeVarList
  loc_0060B890: mov eax, [edi]
  loc_0060B892: add esp, 0000002Ch
  loc_0060B895: mov ecx, [eax]
  loc_0060B897: push ebx
  loc_0060B898: push 00000001h
  loc_0060B89A: push eax
  loc_0060B89B: call [ecx+00000164h]
  loc_0060B8A1: cmp eax, ebx
  loc_0060B8A3: fnclex
  loc_0060B8A5: jge 0060B8BBh
  loc_0060B8A7: mov edx, [edi]
  loc_0060B8A9: push 00000164h
  loc_0060B8AE: push 0041E938h
  loc_0060B8B3: push edx
  loc_0060B8B4: push eax
  loc_0060B8B5: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B8BB: mov eax, [edi]
  loc_0060B8BD: push eax
  loc_0060B8BE: mov ecx, [eax]
  loc_0060B8C0: call [ecx+000000C4h]
  loc_0060B8C6: cmp eax, ebx
  loc_0060B8C8: fnclex
  loc_0060B8CA: jge 0060B8E0h
  loc_0060B8CC: mov edx, [edi]
  loc_0060B8CE: push 000000C4h
  loc_0060B8D3: push 0041E938h
  loc_0060B8D8: push edx
  loc_0060B8D9: push eax
  loc_0060B8DA: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B8E0: push 0041E938h
  loc_0060B8E5: push ebx
  loc_0060B8E6: call [00401274h] ; __vbaCastObj
  loc_0060B8EC: push eax
  loc_0060B8ED: lea eax, var_1C
  loc_0060B8F0: push eax
  loc_0060B8F1: call [004010A0h] ; __vbaObjSet
  loc_0060B8F7: push eax
  loc_0060B8F8: push edi
  loc_0060B8F9: call [004010B8h] ; __vbaObjSetAddref
  loc_0060B8FF: lea ecx, var_1C
  loc_0060B902: call [004012B0h] ; __vbaFreeObj
  loc_0060B908: lea ecx, var_B0
  loc_0060B90E: lea edx, var_30
  loc_0060B911: push ecx
  loc_0060B912: push edx
  loc_0060B913: mov edi, 80020004h
  loc_0060B918: mov var_B8, 004321E8h ; "DELETE * FROM BALANCE IN '"
  loc_0060B922: mov var_C0, 00000008h
  loc_0060B92C: mov var_A8, 0061A09Ch
  loc_0060B936: mov var_B0, 00004008h
  loc_0060B940: call [004010D4h] ; rtcTrimVar
  loc_0060B946: mov eax, [0061A13Ch]
  loc_0060B94B: sub esp, 00000010h
  loc_0060B94E: mov var_C8, 0041E890h ; "'"
  loc_0060B958: mov var_D0, 00000008h
  loc_0060B962: mov edx, [eax]
  loc_0060B964: mov ecx, esp
  loc_0060B966: mov eax, 0000000Ah
  loc_0060B96B: mov var_110, edx
  loc_0060B971: mov [ecx], eax
  loc_0060B973: mov eax, var_DC
  loc_0060B979: mov [ecx+00000004h], eax
  loc_0060B97C: mov eax, var_D4
  loc_0060B982: mov [ecx+00000008h], edi
  loc_0060B985: mov [ecx+0000000Ch], eax
  loc_0060B988: lea ecx, var_C0
  loc_0060B98E: push ecx
  loc_0060B98F: lea eax, var_30
  loc_0060B992: lea ecx, var_40
  loc_0060B995: push eax
  loc_0060B996: push ecx
  loc_0060B997: call [004011B4h] ; __vbaVarCat
  loc_0060B99D: push eax
  loc_0060B99E: lea edx, var_D0
  loc_0060B9A4: lea eax, var_50
  loc_0060B9A7: push edx
  loc_0060B9A8: push eax
  loc_0060B9A9: call [004011B4h] ; __vbaVarCat
  loc_0060B9AF: lea ecx, var_14
  loc_0060B9B2: push eax
  loc_0060B9B3: push ecx
  loc_0060B9B4: call [004011B0h] ; __vbaStrVarVal
  loc_0060B9BA: mov edx, [0061A13Ch]
  loc_0060B9C0: push eax
  loc_0060B9C1: mov eax, var_110
  loc_0060B9C7: push edx
  loc_0060B9C8: call [eax+0000005Ch]
  loc_0060B9CB: cmp eax, ebx
  loc_0060B9CD: fnclex
  loc_0060B9CF: jge 0060B9E6h
  loc_0060B9D1: mov ecx, [0061A13Ch]
  loc_0060B9D7: push 0000005Ch
  loc_0060B9D9: push 0041E928h
  loc_0060B9DE: push ecx
  loc_0060B9DF: push eax
  loc_0060B9E0: call [00401074h] ; __vbaHresultCheckObj
  loc_0060B9E6: lea ecx, var_14
  loc_0060B9E9: call [004012ACh] ; __vbaFreeStr
  loc_0060B9EF: lea edx, var_50
  loc_0060B9F2: lea eax, var_40
  loc_0060B9F5: push edx
  loc_0060B9F6: lea ecx, var_30
  loc_0060B9F9: push eax
  loc_0060B9FA: push ecx
  loc_0060B9FB: push 00000003h
  loc_0060B9FD: call [00401038h] ; __vbaFreeVarList
  loc_0060BA03: add esp, 00000010h
  loc_0060BA06: lea edx, var_B0
  loc_0060BA0C: lea eax, var_30
  loc_0060BA0F: mov edi, 80020004h
  loc_0060BA14: push edx
  loc_0060BA15: push eax
  loc_0060BA16: mov var_B8, 0042EF00h ; "INSERT INTO Balance IN '"
  loc_0060BA20: mov var_C0, 00000008h
  loc_0060BA2A: mov var_A8, 0061A09Ch
  loc_0060BA34: mov var_B0, 00004008h
  loc_0060BA3E: call [004010D4h] ; rtcTrimVar
  loc_0060BA44: mov ecx, [0061A13Ch]
  loc_0060BA4A: mov var_C8, 0042EF38h ; "' SELECT * FROM Balance"
  loc_0060BA54: mov var_D0, 00000008h
  loc_0060BA5E: sub esp, 00000010h
  loc_0060BA61: mov edx, [ecx]
  loc_0060BA63: mov ecx, esp
  loc_0060BA65: mov eax, 0000000Ah
  loc_0060BA6A: mov var_114, edx
  loc_0060BA70: mov [ecx], eax
  loc_0060BA72: mov eax, var_DC
  loc_0060BA78: mov [ecx+00000004h], eax
  loc_0060BA7B: mov eax, var_D4
  loc_0060BA81: mov [ecx+00000008h], edi
  loc_0060BA84: mov [ecx+0000000Ch], eax
  loc_0060BA87: lea ecx, var_C0
  loc_0060BA8D: push ecx
  loc_0060BA8E: lea eax, var_30
  loc_0060BA91: lea ecx, var_40
  loc_0060BA94: push eax
  loc_0060BA95: push ecx
  loc_0060BA96: call [004011B4h] ; __vbaVarCat
  loc_0060BA9C: push eax
  loc_0060BA9D: lea edx, var_D0
  loc_0060BAA3: lea eax, var_50
  loc_0060BAA6: push edx
  loc_0060BAA7: push eax
  loc_0060BAA8: call [004011B4h] ; __vbaVarCat
  loc_0060BAAE: lea ecx, var_14
  loc_0060BAB1: push eax
  loc_0060BAB2: push ecx
  loc_0060BAB3: call [004011B0h] ; __vbaStrVarVal
  loc_0060BAB9: mov edx, [0061A13Ch]
  loc_0060BABF: push eax
  loc_0060BAC0: mov eax, var_114
  loc_0060BAC6: push edx
  loc_0060BAC7: call [eax+0000005Ch]
  loc_0060BACA: cmp eax, ebx
  loc_0060BACC: fnclex
  loc_0060BACE: jge 0060BAE5h
  loc_0060BAD0: mov ecx, [0061A13Ch]
  loc_0060BAD6: push 0000005Ch
  loc_0060BAD8: push 0041E928h
  loc_0060BADD: push ecx
  loc_0060BADE: push eax
  loc_0060BADF: call [00401074h] ; __vbaHresultCheckObj
  loc_0060BAE5: lea ecx, var_14
  loc_0060BAE8: call [004012ACh] ; __vbaFreeStr
  loc_0060BAEE: mov edi, [00401038h] ; __vbaFreeVarList
  loc_0060BAF4: lea edx, var_50
  loc_0060BAF7: lea eax, var_40
  loc_0060BAFA: push edx
  loc_0060BAFB: lea ecx, var_30
  loc_0060BAFE: push eax
  loc_0060BAFF: push ecx
  loc_0060BB00: push 00000003h
  loc_0060BB02: call edi
  loc_0060BB04: mov ecx, 80020004h
  loc_0060BB09: mov eax, 0000000Ah
  loc_0060BB0E: mov var_58, ecx
  loc_0060BB11: mov var_48, ecx
  loc_0060BB14: mov var_38, ecx
  loc_0060BB17: add esp, 00000010h
  loc_0060BB1A: lea edx, var_B0
  loc_0060BB20: lea ecx, var_30
  loc_0060BB23: mov var_60, eax
  loc_0060BB26: mov var_50, eax
  loc_0060BB29: mov var_40, eax
  loc_0060BB2C: mov var_A8, 0041F378h ; "Save Successfully."
  loc_0060BB36: mov var_B0, 00000008h
  loc_0060BB40: call [00401240h] ; __vbaVarDup
  loc_0060BB46: lea edx, var_60
  loc_0060BB49: lea eax, var_50
  loc_0060BB4C: push edx
  loc_0060BB4D: lea ecx, var_40
  loc_0060BB50: push eax
  loc_0060BB51: push ecx
  loc_0060BB52: lea edx, var_30
  loc_0060BB55: push 00000040h
  loc_0060BB57: push edx
  loc_0060BB58: call [004010A4h] ; rtcMsgBox
  loc_0060BB5E: lea eax, var_60
  loc_0060BB61: lea ecx, var_50
  loc_0060BB64: push eax
  loc_0060BB65: lea edx, var_40
  loc_0060BB68: push ecx
  loc_0060BB69: lea eax, var_30
  loc_0060BB6C: push edx
  loc_0060BB6D: push eax
  loc_0060BB6E: push 00000004h
  loc_0060BB70: call edi
  loc_0060BB72: mov ecx, [esi]
  loc_0060BB74: add esp, 00000014h
  loc_0060BB77: lea edx, var_E4
  loc_0060BB7D: mov var_E4, FFFFFFFFh
  loc_0060BB87: push edx
  loc_0060BB88: push esi
  loc_0060BB89: call [ecx+000006FCh]
  loc_0060BB8F: mov eax, [esi]
  loc_0060BB91: lea ecx, var_E4
  loc_0060BB97: push ecx
  loc_0060BB98: push esi
  loc_0060BB99: mov var_E4, ebx
  loc_0060BB9F: call [eax+000006F8h]
  loc_0060BBA5: mov edx, [esi]
  loc_0060BBA7: push ebx
  loc_0060BBA8: push 00000044h
  loc_0060BBAA: push esi
  loc_0060BBAB: call [edx+00000338h]
  loc_0060BBB1: push eax
  loc_0060BBB2: lea eax, var_1C
  loc_0060BBB5: push eax
  loc_0060BBB6: call [004010A0h] ; __vbaObjSet
  loc_0060BBBC: push eax
  loc_0060BBBD: call [00401024h] ; __vbaLateIdCall
  loc_0060BBC3: add esp, 0000000Ch
  loc_0060BBC6: lea ecx, var_1C
  loc_0060BBC9: call [004012B0h] ; __vbaFreeObj
  loc_0060BBCF: mov ecx, [esi]
  loc_0060BBD1: push esi
  loc_0060BBD2: call [ecx+0000071Ch]
  loc_0060BBD8: mov edx, [esi]
  loc_0060BBDA: push esi
  loc_0060BBDB: call [edx+00000720h]
  loc_0060BBE1: push 0060BC3Bh
  loc_0060BBE6: jmp 0060BC3Ah
  loc_0060BBE8: lea eax, var_18
  loc_0060BBEB: lea ecx, var_14
  loc_0060BBEE: push eax
  loc_0060BBEF: push ecx
  loc_0060BBF0: push 00000002h
  loc_0060BBF2: call [004011FCh] ; __vbaFreeStrList
  loc_0060BBF8: lea edx, var_20
  loc_0060BBFB: lea eax, var_1C
  loc_0060BBFE: push edx
  loc_0060BBFF: push eax
  loc_0060BC00: push 00000002h
  loc_0060BC02: call [00401040h] ; __vbaFreeObjList
  loc_0060BC08: lea ecx, var_A0
  loc_0060BC0E: lea edx, var_90
  loc_0060BC14: push ecx
  loc_0060BC15: lea eax, var_80
  loc_0060BC18: push edx
  loc_0060BC19: lea ecx, var_70
  loc_0060BC1C: push eax
  loc_0060BC1D: lea edx, var_60
  loc_0060BC20: push ecx
  loc_0060BC21: lea eax, var_50
  loc_0060BC24: push edx
  loc_0060BC25: lea ecx, var_40
  loc_0060BC28: push eax
  loc_0060BC29: lea edx, var_30
  loc_0060BC2C: push ecx
  loc_0060BC2D: push edx
  loc_0060BC2E: push 00000008h
  loc_0060BC30: call [00401038h] ; __vbaFreeVarList
  loc_0060BC36: add esp, 0000003Ch
  loc_0060BC39: ret
  loc_0060BC3A: ret
  loc_0060BC3B: mov ecx, var_10
  loc_0060BC3E: pop edi
  loc_0060BC3F: pop esi
  loc_0060BC40: xor eax, eax
  loc_0060BC42: mov fs:[00000000h], ecx
  loc_0060BC49: pop ebx
  loc_0060BC4A: mov esp, ebp
  loc_0060BC4C: pop ebp
  loc_0060BC4D: retn 0004h
End Sub

Private Sub Proc_36_15_60CD90() '60CD90
  loc_0060CD90: push ebp
  loc_0060CD91: mov ebp, esp
  loc_0060CD93: sub esp, 00000008h
  loc_0060CD96: push 00403B36h ; __vbaExceptHandler
  loc_0060CD9B: mov eax, fs:[00000000h]
  loc_0060CDA1: push eax
  loc_0060CDA2: mov fs:[00000000h], esp
  loc_0060CDA9: sub esp, 00000048h
  loc_0060CDAC: push ebx
  loc_0060CDAD: push esi
  loc_0060CDAE: push edi
  loc_0060CDAF: mov var_8, esp
  loc_0060CDB2: mov var_4, 00403828h
  loc_0060CDB9: mov edi, var_20
  loc_0060CDBC: sub esp, 00000010h
  loc_0060CDBF: mov esi, Me
  loc_0060CDC2: mov edx, esp
  loc_0060CDC4: mov ecx, 00000003h
  loc_0060CDC9: mov ebx, var_18
  loc_0060CDCC: mov [edx], ecx
  loc_0060CDCE: xor eax, eax
  loc_0060CDD0: mov var_14, eax
  loc_0060CDD3: push 0000000Ah
  loc_0060CDD5: mov [edx+00000004h], edi
  loc_0060CDD8: push esi
  loc_0060CDD9: mov [edx+00000008h], eax
  loc_0060CDDC: mov eax, [esi]
  loc_0060CDDE: mov [edx+0000000Ch], ebx
  loc_0060CDE1: call [eax+00000338h]
  loc_0060CDE7: lea ecx, var_14
  loc_0060CDEA: push eax
  loc_0060CDEB: push ecx
  loc_0060CDEC: call [004010A0h] ; __vbaObjSet
  loc_0060CDF2: push eax
  loc_0060CDF3: call [00401288h] ; __vbaLateIdSt
  loc_0060CDF9: lea ecx, var_14
  loc_0060CDFC: call [004012B0h] ; __vbaFreeObj
  loc_0060CE02: sub esp, 00000010h
  loc_0060CE05: mov ecx, 00000003h
  loc_0060CE0A: mov edx, esp
  loc_0060CE0C: xor eax, eax
  loc_0060CE0E: push 0000000Bh
  loc_0060CE10: push esi
  loc_0060CE11: mov [edx], ecx
  loc_0060CE13: mov [edx+00000004h], edi
  loc_0060CE16: mov [edx+00000008h], eax
  loc_0060CE19: mov eax, [esi]
  loc_0060CE1B: mov [edx+0000000Ch], ebx
  loc_0060CE1E: call [eax+00000338h]
  loc_0060CE24: lea ecx, var_14
  loc_0060CE27: push eax
  loc_0060CE28: push ecx
  loc_0060CE29: call [004010A0h] ; __vbaObjSet
  loc_0060CE2F: push eax
  loc_0060CE30: call [00401288h] ; __vbaLateIdSt
  loc_0060CE36: lea ecx, var_14
  loc_0060CE39: call [004012B0h] ; __vbaFreeObj
  loc_0060CE3F: sub esp, 00000010h
  loc_0060CE42: mov ecx, 00000008h
  loc_0060CE47: mov edx, esp
  loc_0060CE49: mov eax, 0042457Ch ; "No"
  loc_0060CE4E: push 00000000h
  loc_0060CE50: push esi
  loc_0060CE51: mov [edx], ecx
  loc_0060CE53: mov [edx+00000004h], edi
  loc_0060CE56: mov [edx+00000008h], eax
  loc_0060CE59: mov eax, [esi]
  loc_0060CE5B: mov [edx+0000000Ch], ebx
  loc_0060CE5E: call [eax+00000338h]
  loc_0060CE64: lea ecx, var_14
  loc_0060CE67: push eax
  loc_0060CE68: push ecx
  loc_0060CE69: call [004010A0h] ; __vbaObjSet
  loc_0060CE6F: push eax
  loc_0060CE70: call [00401288h] ; __vbaLateIdSt
  loc_0060CE76: lea ecx, var_14
  loc_0060CE79: call [004012B0h] ; __vbaFreeObj
  loc_0060CE7F: sub esp, 00000010h
  loc_0060CE82: mov ecx, 00000003h
  loc_0060CE87: mov edx, esp
  loc_0060CE89: mov eax, 00000001h
  loc_0060CE8E: push 0000000Bh
  loc_0060CE90: push esi
  loc_0060CE91: mov [edx], ecx
  loc_0060CE93: mov [edx+00000004h], edi
  loc_0060CE96: mov [edx+00000008h], eax
  loc_0060CE99: mov eax, [esi]
  loc_0060CE9B: mov [edx+0000000Ch], ebx
  loc_0060CE9E: call [eax+00000338h]
  loc_0060CEA4: lea ecx, var_14
  loc_0060CEA7: push eax
  loc_0060CEA8: push ecx
  loc_0060CEA9: call [004010A0h] ; __vbaObjSet
  loc_0060CEAF: push eax
  loc_0060CEB0: call [00401288h] ; __vbaLateIdSt
  loc_0060CEB6: lea ecx, var_14
  loc_0060CEB9: call [004012B0h] ; __vbaFreeObj
  loc_0060CEBF: sub esp, 00000010h
  loc_0060CEC2: mov ecx, 00000008h
  loc_0060CEC7: mov edx, esp
  loc_0060CEC9: mov eax, 0041EA08h ; "Name"
  loc_0060CECE: push 00000000h
  loc_0060CED0: push esi
  loc_0060CED1: mov [edx], ecx
  loc_0060CED3: mov [edx+00000004h], edi
  loc_0060CED6: mov [edx+00000008h], eax
  loc_0060CED9: mov eax, [esi]
  loc_0060CEDB: mov [edx+0000000Ch], ebx
  loc_0060CEDE: call [eax+00000338h]
  loc_0060CEE4: lea ecx, var_14
  loc_0060CEE7: push eax
  loc_0060CEE8: push ecx
  loc_0060CEE9: call [004010A0h] ; __vbaObjSet
  loc_0060CEEF: push eax
  loc_0060CEF0: call [00401288h] ; __vbaLateIdSt
  loc_0060CEF6: lea ecx, var_14
  loc_0060CEF9: call [004012B0h] ; __vbaFreeObj
  loc_0060CEFF: sub esp, 00000010h
  loc_0060CF02: mov ecx, 00000003h
  loc_0060CF07: mov edx, esp
  loc_0060CF09: mov eax, 00000002h
  loc_0060CF0E: push 0000000Bh
  loc_0060CF10: push esi
  loc_0060CF11: mov [edx], ecx
  loc_0060CF13: mov [edx+00000004h], edi
  loc_0060CF16: mov [edx+00000008h], eax
  loc_0060CF19: mov eax, [esi]
  loc_0060CF1B: mov [edx+0000000Ch], ebx
  loc_0060CF1E: call [eax+00000338h]
  loc_0060CF24: lea ecx, var_14
  loc_0060CF27: push eax
  loc_0060CF28: push ecx
  loc_0060CF29: call [004010A0h] ; __vbaObjSet
  loc_0060CF2F: push eax
  loc_0060CF30: call [00401288h] ; __vbaLateIdSt
  loc_0060CF36: lea ecx, var_14
  loc_0060CF39: call [004012B0h] ; __vbaFreeObj
  loc_0060CF3F: sub esp, 00000010h
  loc_0060CF42: mov ecx, 00000008h
  loc_0060CF47: mov edx, esp
  loc_0060CF49: mov eax, 0042043Ch ; "Amount"
  loc_0060CF4E: push 00000000h
  loc_0060CF50: push esi
  loc_0060CF51: mov [edx], ecx
  loc_0060CF53: mov [edx+00000004h], edi
  loc_0060CF56: mov [edx+00000008h], eax
  loc_0060CF59: mov eax, [esi]
  loc_0060CF5B: mov [edx+0000000Ch], ebx
  loc_0060CF5E: call [eax+00000338h]
  loc_0060CF64: lea ecx, var_14
  loc_0060CF67: push eax
  loc_0060CF68: push ecx
  loc_0060CF69: call [004010A0h] ; __vbaObjSet
  loc_0060CF6F: push eax
  loc_0060CF70: call [00401288h] ; __vbaLateIdSt
  loc_0060CF76: lea ecx, var_14
  loc_0060CF79: call [004012B0h] ; __vbaFreeObj
  loc_0060CF7F: sub esp, 00000010h
  loc_0060CF82: mov ecx, 00000003h
  loc_0060CF87: mov edx, esp
  loc_0060CF89: mov eax, 00000001h
  loc_0060CF8E: sub esp, 00000010h
  loc_0060CF91: mov var_44, ecx
  loc_0060CF94: mov [edx], ecx
  loc_0060CF96: mov ecx, esp
  loc_0060CF98: mov [edx+00000004h], edi
  loc_0060CF9B: mov [edx+00000008h], eax
  loc_0060CF9E: mov [edx+0000000Ch], ebx
  loc_0060CFA1: mov edx, var_44
  loc_0060CFA4: mov [ecx], edx
  loc_0060CFA6: mov eax, var_40
  loc_0060CFA9: mov edx, var_38
  loc_0060CFAC: mov [ecx+00000004h], eax
  loc_0060CFAF: mov eax, 000007D0h
  loc_0060CFB4: push 00000001h
  loc_0060CFB6: push 00000039h
  loc_0060CFB8: mov [ecx+00000008h], eax
  loc_0060CFBB: mov eax, [esi]
  loc_0060CFBD: push esi
  loc_0060CFBE: mov [ecx+0000000Ch], edx
  loc_0060CFC1: call [eax+00000338h]
  loc_0060CFC7: lea ecx, var_14
  loc_0060CFCA: push eax
  loc_0060CFCB: push ecx
  loc_0060CFCC: call [004010A0h] ; __vbaObjSet
  loc_0060CFD2: push eax
  loc_0060CFD3: call [00401160h] ; __vbaLateIdCallSt
  loc_0060CFD9: add esp, 0000002Ch
  loc_0060CFDC: lea ecx, var_14
  loc_0060CFDF: call [004012B0h] ; __vbaFreeObj
  loc_0060CFE5: sub esp, 00000010h
  loc_0060CFE8: mov ecx, 00000003h
  loc_0060CFED: mov edx, esp
  loc_0060CFEF: mov eax, 00000002h
  loc_0060CFF4: sub esp, 00000010h
  loc_0060CFF7: mov var_44, ecx
  loc_0060CFFA: mov [edx], ecx
  loc_0060CFFC: mov ecx, esp
  loc_0060CFFE: push 00000001h
  loc_0060D000: push 00000039h
  loc_0060D002: mov [edx+00000004h], edi
  loc_0060D005: push esi
  loc_0060D006: mov [edx+00000008h], eax
  loc_0060D009: mov eax, var_40
  loc_0060D00C: mov [edx+0000000Ch], ebx
  loc_0060D00F: mov edx, var_44
  loc_0060D012: mov [ecx], edx
  loc_0060D014: mov edx, var_38
  loc_0060D017: mov [ecx+00000004h], eax
  loc_0060D01A: mov eax, 000007D0h
  loc_0060D01F: mov [ecx+00000008h], eax
  loc_0060D022: mov eax, [esi]
  loc_0060D024: mov [ecx+0000000Ch], edx
  loc_0060D027: call [eax+00000338h]
  loc_0060D02D: lea ecx, var_14
  loc_0060D030: push eax
  loc_0060D031: push ecx
  loc_0060D032: call [004010A0h] ; __vbaObjSet
  loc_0060D038: push eax
  loc_0060D039: call [00401160h] ; __vbaLateIdCallSt
  loc_0060D03F: add esp, 0000002Ch
  loc_0060D042: lea ecx, var_14
  loc_0060D045: call [004012B0h] ; __vbaFreeObj
  loc_0060D04B: push 0060D05Dh
  loc_0060D050: jmp 0060D05Ch
  loc_0060D052: lea ecx, var_14
  loc_0060D055: call [004012B0h] ; __vbaFreeObj
  loc_0060D05B: ret
  loc_0060D05C: ret
  loc_0060D05D: mov ecx, var_10
  loc_0060D060: pop edi
  loc_0060D061: pop esi
  loc_0060D062: xor eax, eax
  loc_0060D064: mov fs:[00000000h], ecx
  loc_0060D06B: pop ebx
  loc_0060D06C: mov esp, ebp
  loc_0060D06E: pop ebp
  loc_0060D06F: retn 0004h
End Sub

Private Sub Proc_36_16_60D080() '60D080
  loc_0060D080: push ebp
  loc_0060D081: mov ebp, esp
  loc_0060D083: sub esp, 00000008h
  loc_0060D086: push 00403B36h ; __vbaExceptHandler
  loc_0060D08B: mov eax, fs:[00000000h]
  loc_0060D091: push eax
  loc_0060D092: mov fs:[00000000h], esp
  loc_0060D099: sub esp, 0000009Ch
  loc_0060D09F: push ebx
  loc_0060D0A0: push esi
  loc_0060D0A1: push edi
  loc_0060D0A2: mov var_8, esp
  loc_0060D0A5: mov var_4, 00403838h
  loc_0060D0AC: lea ebx, var_18
  loc_0060D0AF: mov ecx, 0000000Ah
  loc_0060D0B4: push ebx
  loc_0060D0B5: mov var_70, ecx
  loc_0060D0B8: sub esp, 00000010h
  loc_0060D0BB: mov eax, 80020004h
  loc_0060D0C0: mov ebx, esp
  loc_0060D0C2: mov edx, eax
  loc_0060D0C4: sub esp, 00000010h
  loc_0060D0C7: mov var_68, edx
  loc_0060D0CA: mov [ebx], ecx
  loc_0060D0CC: mov ecx, var_7C
  loc_0060D0CF: mov edi, [0061A13Ch]
  loc_0060D0D5: xor esi, esi
  loc_0060D0D7: mov [ebx+00000004h], ecx
  loc_0060D0DA: mov ecx, esp
  loc_0060D0DC: sub esp, 00000010h
  loc_0060D0DF: mov var_18, esi
  loc_0060D0E2: mov [ebx+00000008h], eax
  loc_0060D0E5: mov eax, var_74
  loc_0060D0E8: mov var_1C, esi
  loc_0060D0EB: mov var_20, esi
  loc_0060D0EE: mov [ebx+0000000Ch], eax
  loc_0060D0F1: mov eax, var_70
  loc_0060D0F4: mov [ecx], eax
  loc_0060D0F6: mov eax, var_6C
  loc_0060D0F9: mov var_30, esi
  loc_0060D0FC: mov var_40, esi
  loc_0060D0FF: mov [ecx+00000004h], eax
  loc_0060D102: mov eax, 00000003h
  loc_0060D107: mov var_50, esi
  loc_0060D10A: mov var_84, esi
  loc_0060D110: mov [ecx+00000008h], edx
  loc_0060D113: mov edx, var_64
  loc_0060D116: mov edi, [edi]
  loc_0060D118: mov var_14, 00000001h
  loc_0060D11F: mov [ecx+0000000Ch], edx
  loc_0060D122: mov edx, var_5C
  loc_0060D125: mov ecx, esp
  loc_0060D127: push 0042B96Ch ; "Select * From Balance Order by Name"
  loc_0060D12C: mov [ecx], eax
  loc_0060D12E: mov eax, 00000004h
  loc_0060D133: mov [ecx+00000004h], edx
  loc_0060D136: mov [ecx+00000008h], eax
  loc_0060D139: mov eax, var_54
  loc_0060D13C: mov [ecx+0000000Ch], eax
  loc_0060D13F: mov ecx, [0061A13Ch]
  loc_0060D145: push ecx
  loc_0060D146: call [edi+000000BCh]
  loc_0060D14C: cmp eax, esi
  loc_0060D14E: fnclex
  loc_0060D150: jge 0060D16Ah
  loc_0060D152: mov edx, [0061A13Ch]
  loc_0060D158: push 000000BCh
  loc_0060D15D: push 0041E928h
  loc_0060D162: push edx
  loc_0060D163: push eax
  loc_0060D164: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D16A: mov esi, Me
  loc_0060D16D: mov ecx, var_18
  loc_0060D170: push ecx
  loc_0060D171: lea eax, [esi+00000034h]
  loc_0060D174: push eax
  loc_0060D175: mov var_AC, eax
  loc_0060D17B: call [004010B8h] ; __vbaObjSetAddref
  loc_0060D181: lea ecx, var_18
  loc_0060D184: call [004012B0h] ; __vbaFreeObj
  loc_0060D18A: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_0060D190: mov edi, [004010A0h] ; __vbaObjSet
  loc_0060D196: mov edx, var_AC
  loc_0060D19C: mov eax, [edx]
  loc_0060D19E: lea edx, var_84
  loc_0060D1A4: push edx
  loc_0060D1A5: push eax
  loc_0060D1A6: mov ecx, [eax]
  loc_0060D1A8: call [ecx+00000034h]
  loc_0060D1AB: test eax, eax
  loc_0060D1AD: fnclex
  loc_0060D1AF: jge 0060D1C8h
  loc_0060D1B1: mov ecx, var_AC
  loc_0060D1B7: push 00000034h
  loc_0060D1B9: push 0041E938h
  loc_0060D1BE: mov edx, [ecx]
  loc_0060D1C0: push edx
  loc_0060D1C1: push eax
  loc_0060D1C2: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D1C8: cmp var_84, 0000h
  loc_0060D1D0: jnz 0060D7FBh
  loc_0060D1D6: movsx eax, var_14
  loc_0060D1DA: sub esp, 00000010h
  loc_0060D1DD: mov ecx, 00000003h
  loc_0060D1E2: mov edx, esp
  loc_0060D1E4: push 0000000Ah
  loc_0060D1E6: push esi
  loc_0060D1E7: mov [edx], ecx
  loc_0060D1E9: mov ecx, var_5C
  loc_0060D1EC: mov [edx+00000004h], ecx
  loc_0060D1EF: mov ecx, [esi]
  loc_0060D1F1: mov [edx+00000008h], eax
  loc_0060D1F4: mov eax, var_54
  loc_0060D1F7: mov [edx+0000000Ch], eax
  loc_0060D1FA: call [ecx+00000338h]
  loc_0060D200: lea edx, var_18
  loc_0060D203: push eax
  loc_0060D204: push edx
  loc_0060D205: call edi
  loc_0060D207: push eax
  loc_0060D208: call ebx
  loc_0060D20A: lea ecx, var_18
  loc_0060D20D: call [004012B0h] ; __vbaFreeObj
  loc_0060D213: sub esp, 00000010h
  loc_0060D216: mov ecx, 00000003h
  loc_0060D21B: mov edx, esp
  loc_0060D21D: xor eax, eax
  loc_0060D21F: push 0000000Bh
  loc_0060D221: push esi
  loc_0060D222: mov [edx], ecx
  loc_0060D224: mov ecx, var_5C
  loc_0060D227: mov [edx+00000004h], ecx
  loc_0060D22A: mov ecx, [esi]
  loc_0060D22C: mov [edx+00000008h], eax
  loc_0060D22F: mov eax, var_54
  loc_0060D232: mov [edx+0000000Ch], eax
  loc_0060D235: call [ecx+00000338h]
  loc_0060D23B: lea edx, var_18
  loc_0060D23E: push eax
  loc_0060D23F: push edx
  loc_0060D240: call edi
  loc_0060D242: push eax
  loc_0060D243: call ebx
  loc_0060D245: lea ecx, var_18
  loc_0060D248: call [004012B0h] ; __vbaFreeObj
  loc_0060D24E: sub esp, 00000010h
  loc_0060D251: mov ecx, 00000002h
  loc_0060D256: mov edx, esp
  loc_0060D258: mov eax, 00000001h
  loc_0060D25D: push 00000028h
  loc_0060D25F: push esi
  loc_0060D260: mov [edx], ecx
  loc_0060D262: mov ecx, var_5C
  loc_0060D265: mov [edx+00000004h], ecx
  loc_0060D268: mov ecx, [esi]
  loc_0060D26A: mov [edx+00000008h], eax
  loc_0060D26D: mov eax, var_54
  loc_0060D270: mov [edx+0000000Ch], eax
  loc_0060D273: call [ecx+00000338h]
  loc_0060D279: lea edx, var_18
  loc_0060D27C: push eax
  loc_0060D27D: push edx
  loc_0060D27E: call edi
  loc_0060D280: push eax
  loc_0060D281: call ebx
  loc_0060D283: lea ecx, var_18
  loc_0060D286: call [004012B0h] ; __vbaFreeObj
  loc_0060D28C: mov eax, var_14
  loc_0060D28F: push eax
  loc_0060D290: call [00401008h] ; __vbaStrI2
  loc_0060D296: sub esp, 00000010h
  loc_0060D299: mov ecx, 00000008h
  loc_0060D29E: mov edx, esp
  loc_0060D2A0: mov var_30, ecx
  loc_0060D2A3: mov var_28, eax
  loc_0060D2A6: push 00000000h
  loc_0060D2A8: mov [edx], ecx
  loc_0060D2AA: mov ecx, var_2C
  loc_0060D2AD: mov [edx+00000004h], ecx
  loc_0060D2B0: mov [edx+00000008h], eax
  loc_0060D2B3: mov eax, var_24
  loc_0060D2B6: mov [edx+0000000Ch], eax
  loc_0060D2B9: mov ecx, [esi]
  loc_0060D2BB: push esi
  loc_0060D2BC: call [ecx+00000338h]
  loc_0060D2C2: lea edx, var_18
  loc_0060D2C5: push eax
  loc_0060D2C6: push edx
  loc_0060D2C7: call edi
  loc_0060D2C9: push eax
  loc_0060D2CA: call ebx
  loc_0060D2CC: lea ecx, var_18
  loc_0060D2CF: call [004012B0h] ; __vbaFreeObj
  loc_0060D2D5: lea ecx, var_30
  loc_0060D2D8: call [00401020h] ; __vbaFreeVar
  loc_0060D2DE: sub esp, 00000010h
  loc_0060D2E1: mov ecx, 00000003h
  loc_0060D2E6: mov edx, esp
  loc_0060D2E8: mov eax, 00000001h
  loc_0060D2ED: push 0000000Bh
  loc_0060D2EF: push esi
  loc_0060D2F0: mov [edx], ecx
  loc_0060D2F2: mov ecx, var_5C
  loc_0060D2F5: mov [edx+00000004h], ecx
  loc_0060D2F8: mov ecx, [esi]
  loc_0060D2FA: mov [edx+00000008h], eax
  loc_0060D2FD: mov eax, var_54
  loc_0060D300: mov [edx+0000000Ch], eax
  loc_0060D303: call [ecx+00000338h]
  loc_0060D309: lea edx, var_18
  loc_0060D30C: push eax
  loc_0060D30D: push edx
  loc_0060D30E: call edi
  loc_0060D310: push eax
  loc_0060D311: call ebx
  loc_0060D313: lea ecx, var_18
  loc_0060D316: call [004012B0h] ; __vbaFreeObj
  loc_0060D31C: sub esp, 00000010h
  loc_0060D31F: mov ecx, 00000002h
  loc_0060D324: mov edx, esp
  loc_0060D326: mov eax, 00000001h
  loc_0060D32B: push 00000028h
  loc_0060D32D: push esi
  loc_0060D32E: mov [edx], ecx
  loc_0060D330: mov ecx, var_5C
  loc_0060D333: mov [edx+00000004h], ecx
  loc_0060D336: mov ecx, [esi]
  loc_0060D338: mov [edx+00000008h], eax
  loc_0060D33B: mov eax, var_54
  loc_0060D33E: mov [edx+0000000Ch], eax
  loc_0060D341: call [ecx+00000338h]
  loc_0060D347: lea edx, var_18
  loc_0060D34A: push eax
  loc_0060D34B: push edx
  loc_0060D34C: call edi
  loc_0060D34E: push eax
  loc_0060D34F: call ebx
  loc_0060D351: lea ecx, var_18
  loc_0060D354: call [004012B0h] ; __vbaFreeObj
  loc_0060D35A: mov eax, var_AC
  loc_0060D360: lea edx, var_18
  loc_0060D363: push edx
  loc_0060D364: mov eax, [eax]
  loc_0060D366: push eax
  loc_0060D367: mov ecx, [eax]
  loc_0060D369: call [ecx+000000B4h]
  loc_0060D36F: test eax, eax
  loc_0060D371: fnclex
  loc_0060D373: jge 0060D38Fh
  loc_0060D375: mov ecx, var_AC
  loc_0060D37B: push 000000B4h
  loc_0060D380: push 0041E938h
  loc_0060D385: mov edx, [ecx]
  loc_0060D387: push edx
  loc_0060D388: push eax
  loc_0060D389: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D38F: lea edx, var_1C
  loc_0060D392: mov eax, 00000008h
  loc_0060D397: push edx
  loc_0060D398: mov ecx, var_18
  loc_0060D39B: sub esp, 00000010h
  loc_0060D39E: mov var_8C, ecx
  loc_0060D3A4: mov edx, esp
  loc_0060D3A6: mov ecx, [ecx]
  loc_0060D3A8: mov [edx], eax
  loc_0060D3AA: mov eax, var_5C
  loc_0060D3AD: mov [edx+00000004h], eax
  loc_0060D3B0: mov eax, 0041EA08h ; "Name"
  loc_0060D3B5: mov [edx+00000008h], eax
  loc_0060D3B8: mov eax, var_54
  loc_0060D3BB: mov [edx+0000000Ch], eax
  loc_0060D3BE: mov edx, var_18
  loc_0060D3C1: push edx
  loc_0060D3C2: call [ecx+00000030h]
  loc_0060D3C5: test eax, eax
  loc_0060D3C7: fnclex
  loc_0060D3C9: jge 0060D3E0h
  loc_0060D3CB: mov ecx, var_8C
  loc_0060D3D1: push 00000030h
  loc_0060D3D3: push 0041EA14h ; "S"
  loc_0060D3D8: push ecx
  loc_0060D3D9: push eax
  loc_0060D3DA: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D3E0: mov eax, var_1C
  loc_0060D3E3: lea edx, var_30
  loc_0060D3E6: mov var_28, eax
  loc_0060D3E9: lea eax, var_40
  loc_0060D3EC: push edx
  loc_0060D3ED: push eax
  loc_0060D3EE: mov var_1C, 00000000h
  loc_0060D3F5: mov var_30, 00000009h
  loc_0060D3FC: call [004010D4h] ; rtcTrimVar
  loc_0060D402: lea ecx, var_40
  loc_0060D405: push ecx
  loc_0060D406: call [00401028h] ; __vbaStrVarMove
  loc_0060D40C: sub esp, 00000010h
  loc_0060D40F: mov ecx, 00000008h
  loc_0060D414: mov edx, esp
  loc_0060D416: mov var_50, ecx
  loc_0060D419: mov var_48, eax
  loc_0060D41C: push 00000000h
  loc_0060D41E: mov [edx], ecx
  loc_0060D420: mov ecx, var_4C
  loc_0060D423: push esi
  loc_0060D424: mov [edx+00000004h], ecx
  loc_0060D427: mov ecx, [esi]
  loc_0060D429: mov [edx+00000008h], eax
  loc_0060D42C: mov eax, var_44
  loc_0060D42F: mov [edx+0000000Ch], eax
  loc_0060D432: call [ecx+00000338h]
  loc_0060D438: lea edx, var_20
  loc_0060D43B: push eax
  loc_0060D43C: push edx
  loc_0060D43D: call edi
  loc_0060D43F: push eax
  loc_0060D440: call ebx
  loc_0060D442: lea eax, var_20
  loc_0060D445: lea ecx, var_18
  loc_0060D448: push eax
  loc_0060D449: push ecx
  loc_0060D44A: push 00000002h
  loc_0060D44C: call [00401040h] ; __vbaFreeObjList
  loc_0060D452: lea edx, var_50
  loc_0060D455: lea eax, var_40
  loc_0060D458: push edx
  loc_0060D459: lea ecx, var_30
  loc_0060D45C: push eax
  loc_0060D45D: push ecx
  loc_0060D45E: push 00000003h
  loc_0060D460: call [00401038h] ; __vbaFreeVarList
  loc_0060D466: add esp, 0000000Ch
  loc_0060D469: mov ecx, 00000003h
  loc_0060D46E: mov edx, esp
  loc_0060D470: mov eax, 00000002h
  loc_0060D475: push 0000000Bh
  loc_0060D477: push esi
  loc_0060D478: mov [edx], ecx
  loc_0060D47A: mov ecx, var_5C
  loc_0060D47D: mov [edx+00000004h], ecx
  loc_0060D480: mov ecx, [esi]
  loc_0060D482: mov [edx+00000008h], eax
  loc_0060D485: mov eax, var_54
  loc_0060D488: mov [edx+0000000Ch], eax
  loc_0060D48B: call [ecx+00000338h]
  loc_0060D491: lea edx, var_18
  loc_0060D494: push eax
  loc_0060D495: push edx
  loc_0060D496: call edi
  loc_0060D498: push eax
  loc_0060D499: call ebx
  loc_0060D49B: lea ecx, var_18
  loc_0060D49E: call [004012B0h] ; __vbaFreeObj
  loc_0060D4A4: sub esp, 00000010h
  loc_0060D4A7: mov ecx, 00000002h
  loc_0060D4AC: mov edx, esp
  loc_0060D4AE: mov eax, 00000001h
  loc_0060D4B3: push 00000028h
  loc_0060D4B5: mov [edx], ecx
  loc_0060D4B7: mov ecx, var_5C
  loc_0060D4BA: mov [edx+00000004h], ecx
  loc_0060D4BD: mov ecx, [esi]
  loc_0060D4BF: mov [edx+00000008h], eax
  loc_0060D4C2: mov eax, var_54
  loc_0060D4C5: mov [edx+0000000Ch], eax
  loc_0060D4C8: push esi
  loc_0060D4C9: call [ecx+00000338h]
  loc_0060D4CF: lea edx, var_18
  loc_0060D4D2: push eax
  loc_0060D4D3: push edx
  loc_0060D4D4: call edi
  loc_0060D4D6: push eax
  loc_0060D4D7: call ebx
  loc_0060D4D9: lea ecx, var_18
  loc_0060D4DC: call [004012B0h] ; __vbaFreeObj
  loc_0060D4E2: mov eax, var_AC
  loc_0060D4E8: lea edx, var_18
  loc_0060D4EB: push edx
  loc_0060D4EC: mov eax, [eax]
  loc_0060D4EE: push eax
  loc_0060D4EF: mov ecx, [eax]
  loc_0060D4F1: call [ecx+000000B4h]
  loc_0060D4F7: test eax, eax
  loc_0060D4F9: fnclex
  loc_0060D4FB: jge 0060D517h
  loc_0060D4FD: mov ecx, var_AC
  loc_0060D503: push 000000B4h
  loc_0060D508: push 0041E938h
  loc_0060D50D: mov edx, [ecx]
  loc_0060D50F: push edx
  loc_0060D510: push eax
  loc_0060D511: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D517: lea edx, var_1C
  loc_0060D51A: mov eax, 00000008h
  loc_0060D51F: push edx
  loc_0060D520: mov ecx, var_18
  loc_0060D523: sub esp, 00000010h
  loc_0060D526: mov var_8C, ecx
  loc_0060D52C: mov edx, esp
  loc_0060D52E: mov ecx, [ecx]
  loc_0060D530: mov [edx], eax
  loc_0060D532: mov eax, var_5C
  loc_0060D535: mov [edx+00000004h], eax
  loc_0060D538: mov eax, 0042043Ch ; "Amount"
  loc_0060D53D: mov [edx+00000008h], eax
  loc_0060D540: mov eax, var_54
  loc_0060D543: mov [edx+0000000Ch], eax
  loc_0060D546: mov edx, var_18
  loc_0060D549: push edx
  loc_0060D54A: call [ecx+00000030h]
  loc_0060D54D: test eax, eax
  loc_0060D54F: fnclex
  loc_0060D551: jge 0060D568h
  loc_0060D553: mov ecx, var_8C
  loc_0060D559: push 00000030h
  loc_0060D55B: push 0041EA14h ; "S"
  loc_0060D560: push ecx
  loc_0060D561: push eax
  loc_0060D562: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D568: mov eax, var_1C
  loc_0060D56B: lea ecx, var_30
  loc_0060D56E: push ecx
  loc_0060D56F: push eax
  loc_0060D570: mov edx, [eax]
  loc_0060D572: mov var_94, eax
  loc_0060D578: call [edx+00000044h]
  loc_0060D57B: test eax, eax
  loc_0060D57D: fnclex
  loc_0060D57F: jge 0060D596h
  loc_0060D581: mov edx, var_94
  loc_0060D587: push 00000044h
  loc_0060D589: push 0041EA48h
  loc_0060D58E: push edx
  loc_0060D58F: push eax
  loc_0060D590: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D596: lea eax, var_30
  loc_0060D599: lea ecx, var_70
  loc_0060D59C: push eax
  loc_0060D59D: push ecx
  loc_0060D59E: mov var_68, 00000000h
  loc_0060D5A5: mov var_70, 00008002h
  loc_0060D5AC: call [00401004h] ; __vbaVarTstGt
  loc_0060D5B2: mov var_9C, eax
  loc_0060D5B8: lea edx, var_1C
  loc_0060D5BB: lea eax, var_18
  loc_0060D5BE: push edx
  loc_0060D5BF: push eax
  loc_0060D5C0: push 00000002h
  loc_0060D5C2: call [00401040h] ; __vbaFreeObjList
  loc_0060D5C8: add esp, 0000000Ch
  loc_0060D5CB: lea ecx, var_30
  loc_0060D5CE: call [00401020h] ; __vbaFreeVar
  loc_0060D5D4: cmp var_9C, 0000h
  loc_0060D5DC: jz 0060D5E2h
  loc_0060D5DE: push 00000009h
  loc_0060D5E0: jmp 0060D5E4h
  loc_0060D5E2: push 0000000Ch
  loc_0060D5E4: call [00401030h] ; rtcQBColor
  loc_0060D5EA: sub esp, 00000010h
  loc_0060D5ED: mov ecx, 00000003h
  loc_0060D5F2: mov edx, esp
  loc_0060D5F4: push 00000027h
  loc_0060D5F6: push esi
  loc_0060D5F7: mov [edx], ecx
  loc_0060D5F9: mov ecx, var_5C
  loc_0060D5FC: mov [edx+00000004h], ecx
  loc_0060D5FF: mov ecx, [esi]
  loc_0060D601: mov [edx+00000008h], eax
  loc_0060D604: mov eax, var_54
  loc_0060D607: mov [edx+0000000Ch], eax
  loc_0060D60A: call [ecx+00000338h]
  loc_0060D610: lea edx, var_18
  loc_0060D613: push eax
  loc_0060D614: push edx
  loc_0060D615: call edi
  loc_0060D617: push eax
  loc_0060D618: call ebx
  loc_0060D61A: lea ecx, var_18
  loc_0060D61D: call [004012B0h] ; __vbaFreeObj
  loc_0060D623: mov eax, var_AC
  loc_0060D629: lea edx, var_18
  loc_0060D62C: push edx
  loc_0060D62D: mov eax, [eax]
  loc_0060D62F: push eax
  loc_0060D630: mov ecx, [eax]
  loc_0060D632: call [ecx+000000B4h]
  loc_0060D638: test eax, eax
  loc_0060D63A: fnclex
  loc_0060D63C: jge 0060D658h
  loc_0060D63E: mov ecx, var_AC
  loc_0060D644: push 000000B4h
  loc_0060D649: push 0041E938h
  loc_0060D64E: mov edx, [ecx]
  loc_0060D650: push edx
  loc_0060D651: push eax
  loc_0060D652: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D658: lea edx, var_1C
  loc_0060D65B: mov eax, 00000008h
  loc_0060D660: push edx
  loc_0060D661: mov ecx, var_18
  loc_0060D664: sub esp, 00000010h
  loc_0060D667: mov var_8C, ecx
  loc_0060D66D: mov edx, esp
  loc_0060D66F: mov ecx, [ecx]
  loc_0060D671: mov [edx], eax
  loc_0060D673: mov eax, var_5C
  loc_0060D676: mov [edx+00000004h], eax
  loc_0060D679: mov eax, 0042043Ch ; "Amount"
  loc_0060D67E: mov [edx+00000008h], eax
  loc_0060D681: mov eax, var_54
  loc_0060D684: mov [edx+0000000Ch], eax
  loc_0060D687: mov edx, var_18
  loc_0060D68A: push edx
  loc_0060D68B: call [ecx+00000030h]
  loc_0060D68E: test eax, eax
  loc_0060D690: fnclex
  loc_0060D692: jge 0060D6A9h
  loc_0060D694: mov ecx, var_8C
  loc_0060D69A: push 00000030h
  loc_0060D69C: push 0041EA14h ; "S"
  loc_0060D6A1: push ecx
  loc_0060D6A2: push eax
  loc_0060D6A3: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D6A9: mov eax, var_1C
  loc_0060D6AC: lea edx, var_30
  loc_0060D6AF: mov var_28, eax
  loc_0060D6B2: lea eax, var_40
  loc_0060D6B5: push edx
  loc_0060D6B6: push eax
  loc_0060D6B7: mov var_1C, 00000000h
  loc_0060D6BE: mov var_30, 00000009h
  loc_0060D6C5: call [004010D4h] ; rtcTrimVar
  loc_0060D6CB: lea ecx, var_40
  loc_0060D6CE: push ecx
  loc_0060D6CF: call [00401028h] ; __vbaStrVarMove
  loc_0060D6D5: sub esp, 00000010h
  loc_0060D6D8: mov ecx, 00000008h
  loc_0060D6DD: mov edx, esp
  loc_0060D6DF: mov var_50, ecx
  loc_0060D6E2: mov var_48, eax
  loc_0060D6E5: push 00000000h
  loc_0060D6E7: mov [edx], ecx
  loc_0060D6E9: mov ecx, var_4C
  loc_0060D6EC: push esi
  loc_0060D6ED: mov [edx+00000004h], ecx
  loc_0060D6F0: mov ecx, [esi]
  loc_0060D6F2: mov [edx+00000008h], eax
  loc_0060D6F5: mov eax, var_44
  loc_0060D6F8: mov [edx+0000000Ch], eax
  loc_0060D6FB: call [ecx+00000338h]
  loc_0060D701: lea edx, var_20
  loc_0060D704: push eax
  loc_0060D705: push edx
  loc_0060D706: call edi
  loc_0060D708: push eax
  loc_0060D709: call ebx
  loc_0060D70B: lea eax, var_20
  loc_0060D70E: lea ecx, var_18
  loc_0060D711: push eax
  loc_0060D712: push ecx
  loc_0060D713: push 00000002h
  loc_0060D715: call [00401040h] ; __vbaFreeObjList
  loc_0060D71B: lea edx, var_50
  loc_0060D71E: lea eax, var_40
  loc_0060D721: push edx
  loc_0060D722: lea ecx, var_30
  loc_0060D725: push eax
  loc_0060D726: push ecx
  loc_0060D727: push 00000003h
  loc_0060D729: call [00401038h] ; __vbaFreeVarList
  loc_0060D72F: mov dx, var_14
  loc_0060D733: mov eax, [esi]
  loc_0060D735: add esp, 0000001Ch
  loc_0060D738: add dx, 0001h
  loc_0060D73C: jo 0060D894h
  loc_0060D742: push 00000000h
  loc_0060D744: push 00000004h
  loc_0060D746: push esi
  loc_0060D747: mov var_14, edx
  loc_0060D74A: call [eax+00000338h]
  loc_0060D750: lea ecx, var_18
  loc_0060D753: push eax
  loc_0060D754: push ecx
  loc_0060D755: call edi
  loc_0060D757: lea edx, var_30
  loc_0060D75A: push eax
  loc_0060D75B: push edx
  loc_0060D75C: call [00401140h] ; __vbaLateIdCallLd
  loc_0060D762: add esp, 00000010h
  loc_0060D765: push eax
  loc_0060D766: call [0040121Ch] ; __vbaI4Var
  loc_0060D76C: add eax, 00000001h
  loc_0060D76F: mov ecx, 00000003h
  loc_0060D774: jo 0060D894h
  loc_0060D77A: sub esp, 00000010h
  loc_0060D77D: mov edx, esp
  loc_0060D77F: push 00000004h
  loc_0060D781: mov [edx], ecx
  loc_0060D783: mov ecx, var_5C
  loc_0060D786: mov [edx+00000004h], ecx
  loc_0060D789: mov ecx, [esi]
  loc_0060D78B: mov [edx+00000008h], eax
  loc_0060D78E: mov eax, var_54
  loc_0060D791: mov [edx+0000000Ch], eax
  loc_0060D794: push esi
  loc_0060D795: call [ecx+00000338h]
  loc_0060D79B: lea edx, var_1C
  loc_0060D79E: push eax
  loc_0060D79F: push edx
  loc_0060D7A0: call edi
  loc_0060D7A2: push eax
  loc_0060D7A3: call ebx
  loc_0060D7A5: lea eax, var_1C
  loc_0060D7A8: lea ecx, var_18
  loc_0060D7AB: push eax
  loc_0060D7AC: push ecx
  loc_0060D7AD: push 00000002h
  loc_0060D7AF: call [00401040h] ; __vbaFreeObjList
  loc_0060D7B5: add esp, 0000000Ch
  loc_0060D7B8: lea ecx, var_30
  loc_0060D7BB: call [00401020h] ; __vbaFreeVar
  loc_0060D7C1: mov edx, var_AC
  loc_0060D7C7: mov eax, [edx]
  loc_0060D7C9: push eax
  loc_0060D7CA: mov ecx, [eax]
  loc_0060D7CC: call [ecx+000000ECh]
  loc_0060D7D2: test eax, eax
  loc_0060D7D4: fnclex
  loc_0060D7D6: jge 0060D196h
  loc_0060D7DC: mov edx, var_AC
  loc_0060D7E2: push 000000ECh
  loc_0060D7E7: push 0041E938h
  loc_0060D7EC: mov ecx, [edx]
  loc_0060D7EE: push ecx
  loc_0060D7EF: push eax
  loc_0060D7F0: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D7F6: jmp 0060D196h
  loc_0060D7FB: mov esi, var_AC
  loc_0060D801: mov eax, [esi]
  loc_0060D803: push eax
  loc_0060D804: mov edx, [eax]
  loc_0060D806: call [edx+000000C4h]
  loc_0060D80C: test eax, eax
  loc_0060D80E: fnclex
  loc_0060D810: jge 0060D826h
  loc_0060D812: mov ecx, [esi]
  loc_0060D814: push 000000C4h
  loc_0060D819: push 0041E938h
  loc_0060D81E: push ecx
  loc_0060D81F: push eax
  loc_0060D820: call [00401074h] ; __vbaHresultCheckObj
  loc_0060D826: push 0041E938h
  loc_0060D82B: push 00000000h
  loc_0060D82D: call [00401274h] ; __vbaCastObj
  loc_0060D833: lea edx, var_18
  loc_0060D836: push eax
  loc_0060D837: push edx
  loc_0060D838: call edi
  loc_0060D83A: push eax
  loc_0060D83B: push esi
  loc_0060D83C: call [004010B8h] ; __vbaObjSetAddref
  loc_0060D842: lea ecx, var_18
  loc_0060D845: call [004012B0h] ; __vbaFreeObj
  loc_0060D84B: push 0060D87Fh
  loc_0060D850: jmp 0060D87Eh
  loc_0060D852: lea eax, var_20
  loc_0060D855: lea ecx, var_1C
  loc_0060D858: push eax
  loc_0060D859: lea edx, var_18
  loc_0060D85C: push ecx
  loc_0060D85D: push edx
  loc_0060D85E: push 00000003h
  loc_0060D860: call [00401040h] ; __vbaFreeObjList
  loc_0060D866: lea eax, var_50
  loc_0060D869: lea ecx, var_40
  loc_0060D86C: push eax
  loc_0060D86D: lea edx, var_30
  loc_0060D870: push ecx
  loc_0060D871: push edx
  loc_0060D872: push 00000003h
  loc_0060D874: call [00401038h] ; __vbaFreeVarList
  loc_0060D87A: add esp, 00000020h
  loc_0060D87D: ret
  loc_0060D87E: ret
  loc_0060D87F: mov ecx, var_10
  loc_0060D882: pop edi
  loc_0060D883: pop esi
  loc_0060D884: xor eax, eax
  loc_0060D886: mov fs:[00000000h], ecx
  loc_0060D88D: pop ebx
  loc_0060D88E: mov esp, ebp
  loc_0060D890: pop ebp
  loc_0060D891: retn 0004h
End Sub

Private Sub Proc_36_17_60DED0() '60DED0
  loc_0060DED0: push ebp
  loc_0060DED1: mov ebp, esp
  loc_0060DED3: sub esp, 00000008h
  loc_0060DED6: push 00403B36h ; __vbaExceptHandler
  loc_0060DEDB: mov eax, fs:[00000000h]
  loc_0060DEE1: push eax
  loc_0060DEE2: mov fs:[00000000h], esp
  loc_0060DEE9: sub esp, 00000080h
  loc_0060DEEF: push ebx
  loc_0060DEF0: push esi
  loc_0060DEF1: push edi
  loc_0060DEF2: mov var_8, esp
  loc_0060DEF5: mov var_4, 00403878h
  loc_0060DEFC: lea ebx, var_18
  loc_0060DEFF: mov ecx, 0000000Ah
  loc_0060DF04: push ebx
  loc_0060DF05: mov esi, ecx
  loc_0060DF07: sub esp, 00000010h
  loc_0060DF0A: xor eax, eax
  loc_0060DF0C: mov ebx, esp
  loc_0060DF0E: mov var_14, eax
  loc_0060DF11: mov var_18, eax
  loc_0060DF14: mov var_1C, eax
  loc_0060DF17: mov [ebx], ecx
  loc_0060DF19: mov ecx, var_6C
  loc_0060DF1C: mov var_20, eax
  loc_0060DF1F: mov var_30, eax
  loc_0060DF22: mov var_40, eax
  loc_0060DF25: mov var_74, eax
  loc_0060DF28: mov [ebx+00000004h], ecx
  loc_0060DF2B: mov eax, 80020004h
  loc_0060DF30: sub esp, 00000010h
  loc_0060DF33: mov edx, eax
  loc_0060DF35: mov [ebx+00000008h], eax
  loc_0060DF38: mov eax, var_64
  loc_0060DF3B: mov ecx, esp
  loc_0060DF3D: sub esp, 00000010h
  loc_0060DF40: mov [ebx+0000000Ch], eax
  loc_0060DF43: mov eax, var_5C
  loc_0060DF46: mov [ecx], esi
  loc_0060DF48: mov edi, [0061A13Ch]
  loc_0060DF4E: mov [ecx+00000004h], eax
  loc_0060DF51: mov eax, 00000003h
  loc_0060DF56: mov edi, [edi]
  loc_0060DF58: mov [ecx+00000008h], edx
  loc_0060DF5B: mov edx, var_54
  loc_0060DF5E: mov [ecx+0000000Ch], edx
  loc_0060DF61: mov edx, var_4C
  loc_0060DF64: mov ecx, esp
  loc_0060DF66: push 0042B9E8h ; "Select * from AgentThai Order by AgentName"
  loc_0060DF6B: mov [ecx], eax
  loc_0060DF6D: mov eax, 00000004h
  loc_0060DF72: mov [ecx+00000004h], edx
  loc_0060DF75: mov [ecx+00000008h], eax
  loc_0060DF78: mov eax, var_44
  loc_0060DF7B: mov [ecx+0000000Ch], eax
  loc_0060DF7E: mov ecx, [0061A13Ch]
  loc_0060DF84: push ecx
  loc_0060DF85: call [edi+000000BCh]
  loc_0060DF8B: test eax, eax
  loc_0060DF8D: fnclex
  loc_0060DF8F: jge 0060DFADh
  loc_0060DF91: mov edx, [0061A13Ch]
  loc_0060DF97: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060DF9D: push 000000BCh
  loc_0060DFA2: push 0041E928h
  loc_0060DFA7: push edx
  loc_0060DFA8: push eax
  loc_0060DFA9: call ebx
  loc_0060DFAB: jmp 0060DFB3h
  loc_0060DFAD: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060DFB3: mov eax, Me
  loc_0060DFB6: mov ecx, var_18
  loc_0060DFB9: push ecx
  loc_0060DFBA: lea esi, [eax+00000034h]
  loc_0060DFBD: push esi
  loc_0060DFBE: call [004010B8h] ; __vbaObjSetAddref
  loc_0060DFC4: lea ecx, var_18
  loc_0060DFC7: call [004012B0h] ; __vbaFreeObj
  loc_0060DFCD: mov eax, [esi]
  loc_0060DFCF: lea ecx, var_74
  loc_0060DFD2: push ecx
  loc_0060DFD3: push eax
  loc_0060DFD4: mov edx, [eax]
  loc_0060DFD6: call [edx+00000034h]
  loc_0060DFD9: test eax, eax
  loc_0060DFDB: fnclex
  loc_0060DFDD: jge 0060DFECh
  loc_0060DFDF: mov edx, [esi]
  loc_0060DFE1: push 00000034h
  loc_0060DFE3: push 0041E938h
  loc_0060DFE8: push edx
  loc_0060DFE9: push eax
  loc_0060DFEA: call ebx
  loc_0060DFEC: cmp var_74, 0000h
  loc_0060DFF1: jnz 0060E14Fh
  loc_0060DFF7: mov eax, Me
  loc_0060DFFA: push eax
  loc_0060DFFB: mov ecx, [eax]
  loc_0060DFFD: call [ecx+000002FCh]
  loc_0060E003: lea edx, var_20
  loc_0060E006: push eax
  loc_0060E007: push edx
  loc_0060E008: call [004010A0h] ; __vbaObjSet
  loc_0060E00E: mov edi, eax
  loc_0060E010: mov eax, [esi]
  loc_0060E012: lea edx, var_18
  loc_0060E015: mov ecx, [eax]
  loc_0060E017: push edx
  loc_0060E018: push eax
  loc_0060E019: call [ecx+000000B4h]
  loc_0060E01F: test eax, eax
  loc_0060E021: fnclex
  loc_0060E023: jge 0060E035h
  loc_0060E025: mov ecx, [esi]
  loc_0060E027: push 000000B4h
  loc_0060E02C: push 0041E938h
  loc_0060E031: push ecx
  loc_0060E032: push eax
  loc_0060E033: call ebx
  loc_0060E035: lea ebx, var_1C
  loc_0060E038: mov eax, var_18
  loc_0060E03B: push ebx
  loc_0060E03C: mov ecx, 00000008h
  loc_0060E041: sub esp, 00000010h
  loc_0060E044: mov edx, [eax]
  loc_0060E046: mov ebx, esp
  loc_0060E048: mov var_7C, eax
  loc_0060E04B: push eax
  loc_0060E04C: mov [ebx], ecx
  loc_0060E04E: mov ecx, var_4C
  loc_0060E051: mov [ebx+00000004h], ecx
  loc_0060E054: mov ecx, 0041EB18h ; "AgentName"
  loc_0060E059: mov [ebx+00000008h], ecx
  loc_0060E05C: mov ecx, var_44
  loc_0060E05F: mov [ebx+0000000Ch], ecx
  loc_0060E062: call [edx+00000030h]
  loc_0060E065: test eax, eax
  loc_0060E067: fnclex
  loc_0060E069: jge 0060E07Dh
  loc_0060E06B: mov edx, var_7C
  loc_0060E06E: push 00000030h
  loc_0060E070: push 0041EA14h ; "S"
  loc_0060E075: push edx
  loc_0060E076: push eax
  loc_0060E077: call [00401074h] ; __vbaHresultCheckObj
  loc_0060E07D: mov eax, var_1C
  loc_0060E080: lea ecx, var_40
  loc_0060E083: mov var_28, eax
  loc_0060E086: lea eax, var_30
  loc_0060E089: push eax
  loc_0060E08A: push ecx
  loc_0060E08B: mov var_1C, 00000000h
  loc_0060E092: mov var_30, 00000009h
  loc_0060E099: call [004010D4h] ; rtcTrimVar
  loc_0060E09F: sub esp, 00000010h
  loc_0060E0A2: mov eax, 0000000Ah
  loc_0060E0A7: mov edx, esp
  loc_0060E0A9: mov ecx, var_54
  loc_0060E0AC: mov ebx, [edi]
  loc_0060E0AE: mov [edx], eax
  loc_0060E0B0: mov eax, var_5C
  loc_0060E0B3: mov [edx+00000004h], eax
  loc_0060E0B6: mov eax, 80020004h
  loc_0060E0BB: mov [edx+00000008h], eax
  loc_0060E0BE: lea eax, var_14
  loc_0060E0C1: mov [edx+0000000Ch], ecx
  loc_0060E0C4: lea edx, var_40
  loc_0060E0C7: push edx
  loc_0060E0C8: push eax
  loc_0060E0C9: call [004011B0h] ; __vbaStrVarVal
  loc_0060E0CF: push eax
  loc_0060E0D0: push edi
  loc_0060E0D1: call [ebx+000001ECh]
  loc_0060E0D7: test eax, eax
  loc_0060E0D9: fnclex
  loc_0060E0DB: jge 0060E0F3h
  loc_0060E0DD: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060E0E3: push 000001ECh
  loc_0060E0E8: push 0041F844h
  loc_0060E0ED: push edi
  loc_0060E0EE: push eax
  loc_0060E0EF: call ebx
  loc_0060E0F1: jmp 0060E0F9h
  loc_0060E0F3: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060E0F9: lea ecx, var_14
  loc_0060E0FC: call [004012ACh] ; __vbaFreeStr
  loc_0060E102: lea ecx, var_20
  loc_0060E105: lea edx, var_18
  loc_0060E108: push ecx
  loc_0060E109: push edx
  loc_0060E10A: push 00000002h
  loc_0060E10C: call [00401040h] ; __vbaFreeObjList
  loc_0060E112: lea eax, var_40
  loc_0060E115: lea ecx, var_30
  loc_0060E118: push eax
  loc_0060E119: push ecx
  loc_0060E11A: push 00000002h
  loc_0060E11C: call [00401038h] ; __vbaFreeVarList
  loc_0060E122: mov eax, [esi]
  loc_0060E124: add esp, 00000018h
  loc_0060E127: mov edx, [eax]
  loc_0060E129: push eax
  loc_0060E12A: call [edx+000000ECh]
  loc_0060E130: test eax, eax
  loc_0060E132: fnclex
  loc_0060E134: jge 0060DFCDh
  loc_0060E13A: mov ecx, [esi]
  loc_0060E13C: push 000000ECh
  loc_0060E141: push 0041E938h
  loc_0060E146: push ecx
  loc_0060E147: push eax
  loc_0060E148: call ebx
  loc_0060E14A: jmp 0060DFCDh
  loc_0060E14F: mov eax, [esi]
  loc_0060E151: push eax
  loc_0060E152: mov edx, [eax]
  loc_0060E154: call [edx+000000C4h]
  loc_0060E15A: test eax, eax
  loc_0060E15C: fnclex
  loc_0060E15E: jge 0060E170h
  loc_0060E160: mov ecx, [esi]
  loc_0060E162: push 000000C4h
  loc_0060E167: push 0041E938h
  loc_0060E16C: push ecx
  loc_0060E16D: push eax
  loc_0060E16E: call ebx
  loc_0060E170: push 0041E938h
  loc_0060E175: push 00000000h
  loc_0060E177: call [00401274h] ; __vbaCastObj
  loc_0060E17D: lea edx, var_18
  loc_0060E180: push eax
  loc_0060E181: push edx
  loc_0060E182: call [004010A0h] ; __vbaObjSet
  loc_0060E188: push eax
  loc_0060E189: push esi
  loc_0060E18A: call [004010B8h] ; __vbaObjSetAddref
  loc_0060E190: lea ecx, var_18
  loc_0060E193: call [004012B0h] ; __vbaFreeObj
  loc_0060E199: push 0060E1D2h
  loc_0060E19E: jmp 0060E1D1h
  loc_0060E1A0: lea ecx, var_14
  loc_0060E1A3: call [004012ACh] ; __vbaFreeStr
  loc_0060E1A9: lea eax, var_20
  loc_0060E1AC: lea ecx, var_1C
  loc_0060E1AF: push eax
  loc_0060E1B0: lea edx, var_18
  loc_0060E1B3: push ecx
  loc_0060E1B4: push edx
  loc_0060E1B5: push 00000003h
  loc_0060E1B7: call [00401040h] ; __vbaFreeObjList
  loc_0060E1BD: lea eax, var_40
  loc_0060E1C0: lea ecx, var_30
  loc_0060E1C3: push eax
  loc_0060E1C4: push ecx
  loc_0060E1C5: push 00000002h
  loc_0060E1C7: call [00401038h] ; __vbaFreeVarList
  loc_0060E1CD: add esp, 0000001Ch
  loc_0060E1D0: ret
  loc_0060E1D1: ret
  loc_0060E1D2: mov ecx, var_10
  loc_0060E1D5: pop edi
  loc_0060E1D6: pop esi
  loc_0060E1D7: xor eax, eax
  loc_0060E1D9: mov fs:[00000000h], ecx
  loc_0060E1E0: pop ebx
  loc_0060E1E1: mov esp, ebp
  loc_0060E1E3: pop ebp
  loc_0060E1E4: retn 0004h
End Sub
