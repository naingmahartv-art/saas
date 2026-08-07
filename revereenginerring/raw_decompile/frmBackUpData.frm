VERSION 5.00
Begin VB.Form frmBackUpData
  BackColor = &HFFFFFF&
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 0 'None
  'Icon = n/a
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 3120
  ClientTop = 1035
  ClientWidth = 4500
  ClientHeight = 3180
  ShowInTaskbar = 0   'False
  Begin VB.OptionButton Opt
    Caption = "Local Machine"
    Index = 0
    Left = 1200
    Top = 930
    Width = 1650
    Height = 300
    TabIndex = 7
    Value = 255
  End
  Begin VB.OptionButton Opt
    Caption = "Network "
    Index = 1
    Left = 1200
    Top = 1320
    Width = 1650
    Height = 270
    TabIndex = 6
  End
  Begin VB.CommandButton CmdExit
    Caption = "E&xit"
    Left = 2280
    Top = 2670
    Width = 960
    Height = 405
    TabIndex = 3
  End
  Begin VB.CommandButton CmdBackUp
    Caption = "&BackUp"
    Left = 1170
    Top = 2670
    Width = 960
    Height = 405
    TabIndex = 2
  End
  Begin VB.Line Line2
    X1 = 450
    Y1 = 1800
    X2 = 3990
    Y2 = 1800
    BorderWidth = 2
  End
  Begin VB.Line Line1
    X1 = 450
    Y1 = 720
    X2 = 3990
    Y2 = 720
    BorderWidth = 2
  End
  Begin VB.Label Label2
    Caption = "Finished Back UP"
    ForeColor = &HFF&
    Left = 870
    Top = 2160
    Width = 2745
    Height = 420
    Visible = 0   'False
    TabIndex = 5
    AutoSize = -1  'True
    DragMode = 1
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Times New Roman"
      Size = 18
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = -1 'True
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.OLE OLE1
    Left = 570
    Top = 2130
    Width = 3390
    Height = 405
    Visible = 0   'False
    BorderStyle = 0 'None
    TabIndex = 4
    Class = "avifile"
    SourceDoc = "K:\KARAWEIK\Filecopy.avi"
    SizeMode = 6146
    Left = 13613
    Top = -256
    Width = 21507
    Height = 0
  End
  Begin VB.Label Label1
    Caption = "Backup Data"
    Index = 1
    ForeColor = &HFF00&
    Left = 1455
    Top = 120
    Width = 1695
    Height = 360
    TabIndex = 0
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Times New Roman"
      Size = 15.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = -1 'True
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "Backup Data"
    Index = 0
    ForeColor = &H0&
    Left = 1425
    Top = 120
    Width = 1695
    Height = 360
    TabIndex = 1
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Times New Roman"
      Size = 15.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = -1 'True
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmBackUpData"


Private Sub cmdExit_Click() '458750
  loc_00458750: push ebp
  loc_00458751: mov ebp, esp
  loc_00458753: sub esp, 0000000Ch
  loc_00458756: push 00403B36h ; __vbaExceptHandler
  loc_0045875B: mov eax, fs:[00000000h]
  loc_00458761: push eax
  loc_00458762: mov fs:[00000000h], esp
  loc_00458769: sub esp, 00000018h
  loc_0045876C: push ebx
  loc_0045876D: push esi
  loc_0045876E: push edi
  loc_0045876F: mov var_C, esp
  loc_00458772: mov var_8, 00401560h
  loc_00458779: mov edi, Me
  loc_0045877C: mov eax, edi
  loc_0045877E: and eax, 00000001h
  loc_00458781: mov var_4, eax
  loc_00458784: and edi, FFFFFFFEh
  loc_00458787: push edi
  loc_00458788: mov Me, edi
  loc_0045878B: mov ecx, [edi]
  loc_0045878D: call [ecx+00000004h]
  loc_00458790: mov eax, [0061B394h]
  loc_00458795: xor ebx, ebx
  loc_00458797: cmp eax, ebx
  loc_00458799: mov var_18, ebx
  loc_0045879C: jnz 004587AEh
  loc_0045879E: push 0061B394h
  loc_004587A3: push 0041E4A0h
  loc_004587A8: call [004011DCh] ; __vbaNew2
  loc_004587AE: mov esi, [0061B394h]
  loc_004587B4: lea eax, var_18
  loc_004587B7: push edi
  loc_004587B8: push eax
  loc_004587B9: mov edx, [esi]
  loc_004587BB: mov var_2C, edx
  loc_004587BE: call [004010B8h] ; __vbaObjSetAddref
  loc_004587C4: mov ecx, var_2C
  loc_004587C7: push eax
  loc_004587C8: push esi
  loc_004587C9: call [ecx+00000010h]
  loc_004587CC: cmp eax, ebx
  loc_004587CE: fnclex
  loc_004587D0: jge 004587E1h
  loc_004587D2: push 00000010h
  loc_004587D4: push 0041E490h
  loc_004587D9: push esi
  loc_004587DA: push eax
  loc_004587DB: call [00401074h] ; __vbaHresultCheckObj
  loc_004587E1: lea ecx, var_18
  loc_004587E4: call [004012B0h] ; __vbaFreeObj
  loc_004587EA: mov var_4, ebx
  loc_004587ED: push 004587FFh
  loc_004587F2: jmp 004587FEh
  loc_004587F4: lea ecx, var_18
  loc_004587F7: call [004012B0h] ; __vbaFreeObj
  loc_004587FD: ret
  loc_004587FE: ret
  loc_004587FF: mov eax, Me
  loc_00458802: push eax
  loc_00458803: mov edx, [eax]
  loc_00458805: call [edx+00000008h]
  loc_00458808: mov eax, var_4
  loc_0045880B: mov ecx, var_14
  loc_0045880E: pop edi
  loc_0045880F: pop esi
  loc_00458810: mov fs:[00000000h], ecx
  loc_00458817: pop ebx
  loc_00458818: mov esp, ebp
  loc_0045881A: pop ebp
  loc_0045881B: retn 0004h
End Sub

Private Sub CmdBackUp_Click() '4580C0
  loc_004580C0: push ebp
  loc_004580C1: mov ebp, esp
  loc_004580C3: sub esp, 0000000Ch
  loc_004580C6: push 00403B36h ; __vbaExceptHandler
  loc_004580CB: mov eax, fs:[00000000h]
  loc_004580D1: push eax
  loc_004580D2: mov fs:[00000000h], esp
  loc_004580D9: sub esp, 000000E0h
  loc_004580DF: push ebx
  loc_004580E0: push esi
  loc_004580E1: push edi
  loc_004580E2: mov var_C, esp
  loc_004580E5: mov var_8, 00401540h
  loc_004580EC: mov esi, Me
  loc_004580EF: mov eax, esi
  loc_004580F1: and eax, 00000001h
  loc_004580F4: mov var_4, eax
  loc_004580F7: and esi, FFFFFFFEh
  loc_004580FA: push esi
  loc_004580FB: mov Me, esi
  loc_004580FE: mov ecx, [esi]
  loc_00458100: call [ecx+00000004h]
  loc_00458103: lea edx, var_34
  loc_00458106: xor edi, edi
  loc_00458108: push 0000000Dh
  loc_0045810A: push edx
  loc_0045810B: mov var_1C, edi
  loc_0045810E: mov var_20, edi
  loc_00458111: mov var_24, edi
  loc_00458114: mov var_34, edi
  loc_00458117: mov var_44, edi
  loc_0045811A: mov var_54, edi
  loc_0045811D: mov var_64, edi
  loc_00458120: mov var_74, edi
  loc_00458123: mov var_84, edi
  loc_00458129: mov var_94, edi
  loc_0045812F: mov var_A4, edi
  loc_00458135: mov var_B4, edi
  loc_0045813B: mov var_D8, edi
  loc_00458141: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_00458147: mov ecx, 80020004h
  loc_0045814C: mov eax, 0000000Ah
  loc_00458151: mov var_7C, ecx
  loc_00458154: mov var_6C, ecx
  loc_00458157: mov ebx, 00000008h
  loc_0045815C: lea edx, var_B4
  loc_00458162: lea ecx, var_64
  loc_00458165: mov var_84, eax
  loc_0045816B: mov var_74, eax
  loc_0045816E: mov var_AC, 0041F5E0h ; "SOFT"
  loc_00458178: mov var_B4, ebx
  loc_0045817E: call [00401240h] ; __vbaVarDup
  loc_00458184: lea eax, var_84
  loc_0045818A: lea ecx, var_74
  loc_0045818D: push eax
  loc_0045818E: lea edx, var_64
  loc_00458191: push ecx
  loc_00458192: push edx
  loc_00458193: lea eax, var_94
  loc_00458199: push 00000144h
  loc_0045819E: lea ecx, var_34
  loc_004581A1: push eax
  loc_004581A2: lea edx, var_44
  loc_004581A5: mov var_94, ebx
  loc_004581AB: mov var_A4, ebx
  loc_004581B1: mov ebx, [004011B4h] ; __vbaVarCat
  loc_004581B7: push ecx
  loc_004581B8: push edx
  loc_004581B9: mov var_8C, 0041F554h ; "Backup process will take a few minutes."
  loc_004581C3: mov var_9C, 0041F5A8h ; "Are you sure to back up ?"
  loc_004581CD: call ebx
  loc_004581CF: push eax
  loc_004581D0: lea eax, var_A4
  loc_004581D6: lea ecx, var_54
  loc_004581D9: push eax
  loc_004581DA: push ecx
  loc_004581DB: call ebx
  loc_004581DD: push eax
  loc_004581DE: call [004010A4h] ; rtcMsgBox
  loc_004581E4: mov ecx, eax
  loc_004581E6: call [00401124h] ; __vbaI2I4
  loc_004581EC: mov ebx, eax
  loc_004581EE: lea edx, var_84
  loc_004581F4: lea eax, var_74
  loc_004581F7: push edx
  loc_004581F8: lea ecx, var_64
  loc_004581FB: push eax
  loc_004581FC: push ecx
  loc_004581FD: lea edx, var_54
  loc_00458200: lea eax, var_44
  loc_00458203: push edx
  loc_00458204: lea ecx, var_34
  loc_00458207: push eax
  loc_00458208: push ecx
  loc_00458209: push 00000006h
  loc_0045820B: call [00401038h] ; __vbaFreeVarList
  loc_00458211: add esp, 0000001Ch
  loc_00458214: cmp bx, 0006h
  loc_00458218: jnz 004584EAh
  loc_0045821E: mov edx, [esi]
  loc_00458220: push esi
  loc_00458221: call [edx+000002FCh]
  loc_00458227: push eax
  loc_00458228: lea eax, var_20
  loc_0045822B: push eax
  loc_0045822C: call [004010A0h] ; __vbaObjSet
  loc_00458232: mov ebx, eax
  loc_00458234: lea edx, var_24
  loc_00458237: push edx
  loc_00458238: push edi
  loc_00458239: mov ecx, [ebx]
  loc_0045823B: push ebx
  loc_0045823C: call [ecx+00000040h]
  loc_0045823F: cmp eax, edi
  loc_00458241: fnclex
  loc_00458243: jge 00458254h
  loc_00458245: push 00000040h
  loc_00458247: push 0041E5D8h
  loc_0045824C: push ebx
  loc_0045824D: push eax
  loc_0045824E: call [00401074h] ; __vbaHresultCheckObj
  loc_00458254: mov eax, var_24
  loc_00458257: lea edx, var_D8
  loc_0045825D: push edx
  loc_0045825E: push eax
  loc_0045825F: mov ecx, [eax]
  loc_00458261: mov ebx, eax
  loc_00458263: call [ecx+000000E0h]
  loc_00458269: cmp eax, edi
  loc_0045826B: fnclex
  loc_0045826D: jge 00458281h
  loc_0045826F: push 000000E0h
  loc_00458274: push 0041F5ECh
  loc_00458279: push ebx
  loc_0045827A: push eax
  loc_0045827B: call [00401074h] ; __vbaHresultCheckObj
  loc_00458281: xor ebx, ebx
  loc_00458283: cmp var_D8, FFFFFFh
  loc_0045828B: lea eax, var_24
  loc_0045828E: lea ecx, var_20
  loc_00458291: push eax
  loc_00458292: push ecx
  loc_00458293: setz bl
  loc_00458296: push 00000002h
  loc_00458298: neg ebx
  loc_0045829A: call [00401040h] ; __vbaFreeObjList
  loc_004582A0: add esp, 0000000Ch
  loc_004582A3: cmp bx, di
  loc_004582A6: jz 0045849Eh
  loc_004582AC: mov eax, [esi+00000034h]
  loc_004582AF: lea ecx, var_20
  loc_004582B2: push ecx
  loc_004582B3: push eax
  loc_004582B4: mov edx, [eax]
  loc_004582B6: call [edx+000000B4h]
  loc_004582BC: cmp eax, edi
  loc_004582BE: fnclex
  loc_004582C0: jge 004582D7h
  loc_004582C2: mov edx, [esi+00000034h]
  loc_004582C5: push 000000B4h
  loc_004582CA: push 0041E938h
  loc_004582CF: push edx
  loc_004582D0: push eax
  loc_004582D1: call [00401074h] ; __vbaHresultCheckObj
  loc_004582D7: lea ebx, var_24
  loc_004582DA: mov eax, var_20
  loc_004582DD: push ebx
  loc_004582DE: mov ecx, 00000008h
  loc_004582E3: sub esp, 00000010h
  loc_004582E6: mov var_94, ecx
  loc_004582EC: mov ebx, esp
  loc_004582EE: mov var_8C, 0041F600h ; "despath"
  loc_004582F8: mov edx, [eax]
  loc_004582FA: push eax
  loc_004582FB: mov [ebx], ecx
  loc_004582FD: mov ecx, var_90
  loc_00458303: mov var_E0, eax
  loc_00458309: mov [ebx+00000004h], ecx
  loc_0045830C: mov ecx, var_8C
  loc_00458312: mov [ebx+00000008h], ecx
  loc_00458315: mov ecx, var_88
  loc_0045831B: mov [ebx+0000000Ch], ecx
  loc_0045831E: call [edx+00000030h]
  loc_00458321: cmp eax, edi
  loc_00458323: fnclex
  loc_00458325: jge 0045833Ch
  loc_00458327: mov edx, var_E0
  loc_0045832D: push 00000030h
  loc_0045832F: push 0041EA14h ; "S"
  loc_00458334: push edx
  loc_00458335: push eax
  loc_00458336: call [00401074h] ; __vbaHresultCheckObj
  loc_0045833C: mov eax, var_24
  loc_0045833F: lea edx, var_34
  loc_00458342: push edx
  loc_00458343: push eax
  loc_00458344: mov ecx, [eax]
  loc_00458346: mov ebx, eax
  loc_00458348: call [ecx+00000044h]
  loc_0045834B: cmp eax, edi
  loc_0045834D: fnclex
  loc_0045834F: jge 00458360h
  loc_00458351: push 00000044h
  loc_00458353: push 0041EA48h
  loc_00458358: push ebx
  loc_00458359: push eax
  loc_0045835A: call [00401074h] ; __vbaHresultCheckObj
  loc_00458360: lea eax, var_34
  loc_00458363: push eax
  loc_00458364: call [00401028h] ; __vbaStrVarMove
  loc_0045836A: mov edx, eax
  loc_0045836C: lea ecx, var_1C
  loc_0045836F: call [00401270h] ; __vbaStrMove
  loc_00458375: mov edx, eax
  loc_00458377: lea ecx, [esi+00000038h]
  loc_0045837A: call [004011ECh] ; __vbaStrCopy
  loc_00458380: lea ecx, var_1C
  loc_00458383: call [004012ACh] ; __vbaFreeStr
  loc_00458389: lea ecx, var_24
  loc_0045838C: lea edx, var_20
  loc_0045838F: push ecx
  loc_00458390: push edx
  loc_00458391: push 00000002h
  loc_00458393: call [00401040h] ; __vbaFreeObjList
  loc_00458399: add esp, 0000000Ch
  loc_0045839C: lea ecx, var_34
  loc_0045839F: call [00401020h] ; __vbaFreeVar
  loc_004583A5: mov eax, [esi+00000034h]
  loc_004583A8: lea edx, var_20
  loc_004583AB: push edx
  loc_004583AC: push eax
  loc_004583AD: mov ecx, [eax]
  loc_004583AF: call [ecx+000000B4h]
  loc_004583B5: cmp eax, edi
  loc_004583B7: fnclex
  loc_004583B9: jge 004583D0h
  loc_004583BB: mov ecx, [esi+00000034h]
  loc_004583BE: push 000000B4h
  loc_004583C3: push 0041E938h
  loc_004583C8: push ecx
  loc_004583C9: push eax
  loc_004583CA: call [00401074h] ; __vbaHresultCheckObj
  loc_004583D0: lea ebx, var_24
  loc_004583D3: mov eax, var_20
  loc_004583D6: push ebx
  loc_004583D7: mov ecx, 00000008h
  loc_004583DC: sub esp, 00000010h
  loc_004583DF: mov var_94, ecx
  loc_004583E5: mov ebx, esp
  loc_004583E7: mov var_8C, 0041F614h ; "sourcepath"
  loc_004583F1: mov edx, [eax]
  loc_004583F3: push eax
  loc_004583F4: mov [ebx], ecx
  loc_004583F6: mov ecx, var_90
  loc_004583FC: mov var_E0, eax
  loc_00458402: mov [ebx+00000004h], ecx
  loc_00458405: mov ecx, var_8C
  loc_0045840B: mov [ebx+00000008h], ecx
  loc_0045840E: mov ecx, var_88
  loc_00458414: mov [ebx+0000000Ch], ecx
  loc_00458417: call [edx+00000030h]
  loc_0045841A: cmp eax, edi
  loc_0045841C: fnclex
  loc_0045841E: jge 00458435h
  loc_00458420: mov edx, var_E0
  loc_00458426: push 00000030h
  loc_00458428: push 0041EA14h ; "S"
  loc_0045842D: push edx
  loc_0045842E: push eax
  loc_0045842F: call [00401074h] ; __vbaHresultCheckObj
  loc_00458435: mov eax, var_24
  loc_00458438: lea edx, var_34
  loc_0045843B: push edx
  loc_0045843C: push eax
  loc_0045843D: mov ecx, [eax]
  loc_0045843F: mov ebx, eax
  loc_00458441: call [ecx+00000044h]
  loc_00458444: cmp eax, edi
  loc_00458446: fnclex
  loc_00458448: jge 00458459h
  loc_0045844A: push 00000044h
  loc_0045844C: push 0041EA48h
  loc_00458451: push ebx
  loc_00458452: push eax
  loc_00458453: call [00401074h] ; __vbaHresultCheckObj
  loc_00458459: lea eax, var_34
  loc_0045845C: push eax
  loc_0045845D: call [00401028h] ; __vbaStrVarMove
  loc_00458463: mov edx, eax
  loc_00458465: lea ecx, var_1C
  loc_00458468: call [00401270h] ; __vbaStrMove
  loc_0045846E: mov edx, eax
  loc_00458470: lea ecx, [esi+0000003Ch]
  loc_00458473: call [004011ECh] ; __vbaStrCopy
  loc_00458479: lea ecx, var_1C
  loc_0045847C: call [004012ACh] ; __vbaFreeStr
  loc_00458482: lea ecx, var_24
  loc_00458485: lea edx, var_20
  loc_00458488: push ecx
  loc_00458489: push edx
  loc_0045848A: push 00000002h
  loc_0045848C: call [00401040h] ; __vbaFreeObjList
  loc_00458492: add esp, 0000000Ch
  loc_00458495: lea ecx, var_34
  loc_00458498: call [00401020h] ; __vbaFreeVar
  loc_0045849E: mov eax, [esi]
  loc_004584A0: push esi
  loc_004584A1: call [eax+00000310h]
  loc_004584A7: lea ecx, var_20
  loc_004584AA: push eax
  loc_004584AB: push ecx
  loc_004584AC: call [004010A0h] ; __vbaObjSet
  loc_004584B2: mov ebx, eax
  loc_004584B4: push edi
  loc_004584B5: push ebx
  loc_004584B6: mov edx, [ebx]
  loc_004584B8: call [edx+0000009Ch]
  loc_004584BE: cmp eax, edi
  loc_004584C0: fnclex
  loc_004584C2: jge 004584D6h
  loc_004584C4: push 0000009Ch
  loc_004584C9: push 0041F62Ch
  loc_004584CE: push ebx
  loc_004584CF: push eax
  loc_004584D0: call [00401074h] ; __vbaHresultCheckObj
  loc_004584D6: lea ecx, var_20
  loc_004584D9: call [004012B0h] ; __vbaFreeObj
  loc_004584DF: mov eax, [esi]
  loc_004584E1: push esi
  loc_004584E2: call [eax+000006FCh]
  loc_004584E8: jmp 0045852Ah
  loc_004584EA: mov ecx, [esi]
  loc_004584EC: push esi
  loc_004584ED: call [ecx+00000304h]
  loc_004584F3: lea edx, var_20
  loc_004584F6: push eax
  loc_004584F7: push edx
  loc_004584F8: call [004010A0h] ; __vbaObjSet
  loc_004584FE: mov esi, eax
  loc_00458500: push esi
  loc_00458501: mov eax, [esi]
  loc_00458503: call [eax+000001A4h]
  loc_00458509: cmp eax, edi
  loc_0045850B: fnclex
  loc_0045850D: jge 00458521h
  loc_0045850F: push 000001A4h
  loc_00458514: push 0041EAACh
  loc_00458519: push esi
  loc_0045851A: push eax
  loc_0045851B: call [00401074h] ; __vbaHresultCheckObj
  loc_00458521: lea ecx, var_20
  loc_00458524: call [004012B0h] ; __vbaFreeObj
  loc_0045852A: mov var_4, edi
  loc_0045852D: push 00458575h
  loc_00458532: jmp 00458574h
  loc_00458534: lea ecx, var_1C
  loc_00458537: call [004012ACh] ; __vbaFreeStr
  loc_0045853D: lea ecx, var_24
  loc_00458540: lea edx, var_20
  loc_00458543: push ecx
  loc_00458544: push edx
  loc_00458545: push 00000002h
  loc_00458547: call [00401040h] ; __vbaFreeObjList
  loc_0045854D: lea eax, var_84
  loc_00458553: lea ecx, var_74
  loc_00458556: push eax
  loc_00458557: lea edx, var_64
  loc_0045855A: push ecx
  loc_0045855B: lea eax, var_54
  loc_0045855E: push edx
  loc_0045855F: lea ecx, var_44
  loc_00458562: push eax
  loc_00458563: lea edx, var_34
  loc_00458566: push ecx
  loc_00458567: push edx
  loc_00458568: push 00000006h
  loc_0045856A: call [00401038h] ; __vbaFreeVarList
  loc_00458570: add esp, 00000028h
  loc_00458573: ret
  loc_00458574: ret
  loc_00458575: mov eax, Me
  loc_00458578: push eax
  loc_00458579: mov ecx, [eax]
  loc_0045857B: call [ecx+00000008h]
  loc_0045857E: mov eax, var_4
  loc_00458581: mov ecx, var_14
  loc_00458584: pop edi
  loc_00458585: pop esi
  loc_00458586: mov fs:[00000000h], ecx
  loc_0045858D: pop ebx
  loc_0045858E: mov esp, ebp
  loc_00458590: pop ebp
  loc_00458591: retn 0004h
End Sub

Private Sub Form_Load() '458820
  loc_00458820: push ebp
  loc_00458821: mov ebp, esp
  loc_00458823: sub esp, 0000000Ch
  loc_00458826: push 00403B36h ; __vbaExceptHandler
  loc_0045882B: mov eax, fs:[00000000h]
  loc_00458831: push eax
  loc_00458832: mov fs:[00000000h], esp
  loc_00458839: sub esp, 00000040h
  loc_0045883C: push ebx
  loc_0045883D: push esi
  loc_0045883E: push edi
  loc_0045883F: mov var_C, esp
  loc_00458842: mov var_8, 00401570h
  loc_00458849: mov esi, Me
  loc_0045884C: mov eax, esi
  loc_0045884E: and eax, 00000001h
  loc_00458851: mov var_4, eax
  loc_00458854: and esi, FFFFFFFEh
  loc_00458857: push esi
  loc_00458858: mov Me, esi
  loc_0045885B: mov ecx, [esi]
  loc_0045885D: call [ecx+00000004h]
  loc_00458860: lea ebx, var_18
  loc_00458863: mov ecx, 0000000Ah
  loc_00458868: push ebx
  loc_00458869: mov var_38, ecx
  loc_0045886C: sub esp, 00000010h
  loc_0045886F: mov eax, 80020004h
  loc_00458874: mov ebx, esp
  loc_00458876: mov edx, eax
  loc_00458878: sub esp, 00000010h
  loc_0045887B: mov edi, [0061A13Ch]
  loc_00458881: mov [ebx], ecx
  loc_00458883: mov ecx, var_44
  loc_00458886: mov var_18, 00000000h
  loc_0045888D: mov edi, [edi]
  loc_0045888F: mov [ebx+00000004h], ecx
  loc_00458892: mov ecx, esp
  loc_00458894: sub esp, 00000010h
  loc_00458897: mov [ebx+00000008h], eax
  loc_0045889A: mov eax, var_3C
  loc_0045889D: mov [ebx+0000000Ch], eax
  loc_004588A0: mov eax, var_38
  loc_004588A3: mov [ecx], eax
  loc_004588A5: mov eax, var_34
  loc_004588A8: mov [ecx+00000004h], eax
  loc_004588AB: mov eax, 00000003h
  loc_004588B0: mov [ecx+00000008h], edx
  loc_004588B3: mov edx, var_2C
  loc_004588B6: mov [ecx+0000000Ch], edx
  loc_004588B9: mov edx, var_24
  loc_004588BC: mov ecx, esp
  loc_004588BE: push 0041F694h ; "select * from DataBkup"
  loc_004588C3: mov [ecx], eax
  loc_004588C5: mov eax, 00000002h
  loc_004588CA: mov [ecx+00000004h], edx
  loc_004588CD: mov [ecx+00000008h], eax
  loc_004588D0: mov eax, var_1C
  loc_004588D3: mov [ecx+0000000Ch], eax
  loc_004588D6: mov ecx, [0061A13Ch]
  loc_004588DC: push ecx
  loc_004588DD: call [edi+000000BCh]
  loc_004588E3: test eax, eax
  loc_004588E5: fnclex
  loc_004588E7: jge 00458901h
  loc_004588E9: mov edx, [0061A13Ch]
  loc_004588EF: push 000000BCh
  loc_004588F4: push 0041E928h
  loc_004588F9: push edx
  loc_004588FA: push eax
  loc_004588FB: call [00401074h] ; __vbaHresultCheckObj
  loc_00458901: mov eax, var_18
  loc_00458904: add esi, 00000034h
  loc_00458907: push eax
  loc_00458908: push esi
  loc_00458909: call [004010B8h] ; __vbaObjSetAddref
  loc_0045890F: lea ecx, var_18
  loc_00458912: call [004012B0h] ; __vbaFreeObj
  loc_00458918: mov var_4, 00000000h
  loc_0045891F: push 00458931h
  loc_00458924: jmp 00458930h
  loc_00458926: lea ecx, var_18
  loc_00458929: call [004012B0h] ; __vbaFreeObj
  loc_0045892F: ret
  loc_00458930: ret
  loc_00458931: mov eax, Me
  loc_00458934: push eax
  loc_00458935: mov ecx, [eax]
  loc_00458937: call [ecx+00000008h]
  loc_0045893A: mov eax, var_4
  loc_0045893D: mov ecx, var_14
  loc_00458940: pop edi
  loc_00458941: pop esi
  loc_00458942: mov fs:[00000000h], ecx
  loc_00458949: pop ebx
  loc_0045894A: mov esp, ebp
  loc_0045894C: pop ebp
  loc_0045894D: retn 0004h
End Sub

Private Sub Proc_3_3_4585A0() '4585A0
  loc_004585A0: push ebp
  loc_004585A1: mov ebp, esp
  loc_004585A3: sub esp, 00000008h
  loc_004585A6: push 00403B36h ; __vbaExceptHandler
  loc_004585AB: mov eax, fs:[00000000h]
  loc_004585B1: push eax
  loc_004585B2: mov fs:[00000000h], esp
  loc_004585B9: sub esp, 0000002Ch
  loc_004585BC: push ebx
  loc_004585BD: push esi
  loc_004585BE: push edi
  loc_004585BF: mov var_8, esp
  loc_004585C2: mov var_4, 00401550h
  loc_004585C9: mov edi, Me
  loc_004585CC: mov ebx, [00401054h] ; __vbaStrCat
  loc_004585D2: xor esi, esi
  loc_004585D4: mov eax, [edi+00000038h]
  loc_004585D7: mov var_14, esi
  loc_004585DA: push eax
  loc_004585DB: push 0041F640h ; "TmpXDb2.Mdb"
  loc_004585E0: mov var_18, esi
  loc_004585E3: mov var_1C, esi
  loc_004585E6: mov var_20, esi
  loc_004585E9: mov var_30, esi
  loc_004585EC: call ebx
  loc_004585EE: lea ecx, var_30
  loc_004585F1: push esi
  loc_004585F2: push ecx
  loc_004585F3: mov var_28, eax
  loc_004585F6: mov var_30, 00000008h
  loc_004585FD: call [004011C8h] ; rtcDir
  loc_00458603: mov edx, eax
  loc_00458605: lea ecx, var_1C
  loc_00458608: call [00401270h] ; __vbaStrMove
  loc_0045860E: push eax
  loc_0045860F: push 0041E5D4h
  loc_00458614: call [0040110Ch] ; __vbaStrCmp
  loc_0045861A: mov esi, eax
  loc_0045861C: lea ecx, var_1C
  loc_0045861F: neg esi
  loc_00458621: sbb esi, esi
  loc_00458623: neg esi
  loc_00458625: neg esi
  loc_00458627: call [004012ACh] ; __vbaFreeStr
  loc_0045862D: lea ecx, var_30
  loc_00458630: call [00401020h] ; __vbaFreeVar
  loc_00458636: test si, si
  loc_00458639: jz 00458663h
  loc_0045863B: mov edx, [edi+00000038h]
  loc_0045863E: push edx
  loc_0045863F: push 0041F65Ch ; "TmpXDB2.Mdb"
  loc_00458644: call ebx
  loc_00458646: mov var_28, eax
  loc_00458649: lea eax, var_30
  loc_0045864C: push eax
  loc_0045864D: mov var_30, 00000008h
  loc_00458654: call [00401108h] ; rtcKillFiles
  loc_0045865A: lea ecx, var_30
  loc_0045865D: call [00401020h] ; __vbaFreeVar
  loc_00458663: mov eax, [0061A13Ch]
  loc_00458668: push eax
  loc_00458669: mov ecx, [eax]
  loc_0045866B: call [ecx+00000058h]
  loc_0045866E: test eax, eax
  loc_00458670: fnclex
  loc_00458672: jge 00458689h
  loc_00458674: mov edx, [0061A13Ch]
  loc_0045867A: push 00000058h
  loc_0045867C: push 0041E928h
  loc_00458681: push edx
  loc_00458682: push eax
  loc_00458683: call [00401074h] ; __vbaHresultCheckObj
  loc_00458689: mov eax, [edi+0000003Ch]
  loc_0045868C: push eax
  loc_0045868D: push 0041F678h ; "TmpXDB2.mdb"
  loc_00458692: call ebx
  loc_00458694: mov esi, [00401270h] ; __vbaStrMove
  loc_0045869A: mov edx, eax
  loc_0045869C: lea ecx, var_14
  loc_0045869F: call __vbaStrMove
  loc_004586A1: mov ecx, [edi+00000038h]
  loc_004586A4: push ecx
  loc_004586A5: push 0041F678h ; "TmpXDB2.mdb"
  loc_004586AA: call ebx
  loc_004586AC: mov edx, eax
  loc_004586AE: lea ecx, var_18
  loc_004586B1: call __vbaStrMove
  loc_004586B3: mov edx, var_18
  loc_004586B6: mov eax, var_14
  loc_004586B9: push edx
  loc_004586BA: push eax
  loc_004586BB: call [00401200h] ; rtcFileCopy
  loc_004586C1: mov ecx, [edi]
  loc_004586C3: push edi
  loc_004586C4: call [ecx+00000310h]
  loc_004586CA: lea edx, var_20
  loc_004586CD: push eax
  loc_004586CE: push edx
  loc_004586CF: call [004010A0h] ; __vbaObjSet
  loc_004586D5: mov esi, eax
  loc_004586D7: push FFFFFFFFh
  loc_004586D9: push esi
  loc_004586DA: mov eax, [esi]
  loc_004586DC: call [eax+0000009Ch]
  loc_004586E2: test eax, eax
  loc_004586E4: fnclex
  loc_004586E6: jge 004586FAh
  loc_004586E8: push 0000009Ch
  loc_004586ED: push 0041F62Ch
  loc_004586F2: push esi
  loc_004586F3: push eax
  loc_004586F4: call [00401074h] ; __vbaHresultCheckObj
  loc_004586FA: lea ecx, var_20
  loc_004586FD: call [004012B0h] ; __vbaFreeObj
  loc_00458703: push 00458737h
  loc_00458708: jmp 00458726h
  loc_0045870A: lea ecx, var_1C
  loc_0045870D: call [004012ACh] ; __vbaFreeStr
  loc_00458713: lea ecx, var_20
  loc_00458716: call [004012B0h] ; __vbaFreeObj
  loc_0045871C: lea ecx, var_30
  loc_0045871F: call [00401020h] ; __vbaFreeVar
  loc_00458725: ret
  loc_00458726: mov esi, [004012ACh] ; __vbaFreeStr
  loc_0045872C: lea ecx, var_14
  loc_0045872F: call __vbaFreeStr
  loc_00458731: lea ecx, var_18
  loc_00458734: call __vbaFreeStr
  loc_00458736: ret
  loc_00458737: mov ecx, var_10
  loc_0045873A: pop edi
  loc_0045873B: pop esi
  loc_0045873C: xor eax, eax
  loc_0045873E: mov fs:[00000000h], ecx
  loc_00458745: pop ebx
  loc_00458746: mov esp, ebp
  loc_00458748: pop ebp
  loc_00458749: retn 0004h
End Sub
