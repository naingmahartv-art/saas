VERSION 5.00
Begin VB.Form frmLoginAdv
  Caption = "Login"
  ScaleMode = 0
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 2835
  ClientTop = 3480
  ClientWidth = 3750
  ClientHeight = 1545
  ScaleLeft = 0
  ScaleTop = 0
  ScaleWidth = 3521.047
  ScaleHeight = 912.837
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.TextBox txtUserName
    Left = 1290
    Top = 135
    Width = 2325
    Height = 345
    TabIndex = 1
    PasswordChar = "*"
  End
  Begin VB.CommandButton cmdOK
    Caption = "OK"
    Left = 1335
    Top = 1035
    Width = 990
    Height = 390
    TabIndex = 4
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
  Begin VB.CommandButton cmdCancel
    Caption = "Cancel"
    Left = 2370
    Top = 1035
    Width = 990
    Height = 390
    TabIndex = 5
    Cancel = -1  'True
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
  Begin VB.TextBox txtPassword
    Left = 1290
    Top = 555
    Width = 2325
    Height = 345
    TabIndex = 3
    PasswordChar = "*"
  End
  Begin VB.Label lblLabels
    Caption = "&User Name:"
    Index = 0
    Left = 105
    Top = 180
    Width = 990
    Height = 270
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
  Begin VB.Label lblLabels
    Caption = "&Password:"
    Index = 1
    Left = 105
    Top = 600
    Width = 990
    Height = 270
    TabIndex = 2
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
End

Attribute VB_Name = "frmLoginAdv"

Public LoginSucceededAdv As Boolean


Private Sub txtUserName_KeyPress(KeyAscii As Integer) '6039A0
  loc_006039A0: push ebp
  loc_006039A1: mov ebp, esp
  loc_006039A3: sub esp, 0000000Ch
  loc_006039A6: push 00403B36h ; __vbaExceptHandler
  loc_006039AB: mov eax, fs:[00000000h]
  loc_006039B1: push eax
  loc_006039B2: mov fs:[00000000h], esp
  loc_006039B9: sub esp, 00000014h
  loc_006039BC: push ebx
  loc_006039BD: push esi
  loc_006039BE: push edi
  loc_006039BF: mov var_C, esp
  loc_006039C2: mov var_8, 00403510h
  loc_006039C9: mov esi, Me
  loc_006039CC: mov eax, esi
  loc_006039CE: and eax, 00000001h
  loc_006039D1: mov var_4, eax
  loc_006039D4: and esi, FFFFFFFEh
  loc_006039D7: push esi
  loc_006039D8: mov Me, esi
  loc_006039DB: mov ecx, [esi]
  loc_006039DD: call [ecx+00000004h]
  loc_006039E0: mov edx, KeyAscii
  loc_006039E3: xor edi, edi
  loc_006039E5: mov var_18, edi
  loc_006039E8: cmp [edx], 000Dh
  loc_006039EC: jnz 00603A2Eh
  loc_006039EE: mov eax, [esi]
  loc_006039F0: push esi
  loc_006039F1: call [eax+00000308h]
  loc_006039F7: lea ecx, var_18
  loc_006039FA: push eax
  loc_006039FB: push ecx
  loc_006039FC: call [004010A0h] ; __vbaObjSet
  loc_00603A02: mov esi, eax
  loc_00603A04: push esi
  loc_00603A05: mov edx, [esi]
  loc_00603A07: call [edx+00000204h]
  loc_00603A0D: cmp eax, edi
  loc_00603A0F: fnclex
  loc_00603A11: jge 00603A25h
  loc_00603A13: push 00000204h
  loc_00603A18: push 0041E5E8h
  loc_00603A1D: push esi
  loc_00603A1E: push eax
  loc_00603A1F: call [00401074h] ; __vbaHresultCheckObj
  loc_00603A25: lea ecx, var_18
  loc_00603A28: call [004012B0h] ; __vbaFreeObj
  loc_00603A2E: mov var_4, edi
  loc_00603A31: push 00603A43h
  loc_00603A36: jmp 00603A42h
  loc_00603A38: lea ecx, var_18
  loc_00603A3B: call [004012B0h] ; __vbaFreeObj
  loc_00603A41: ret
  loc_00603A42: ret
  loc_00603A43: mov eax, Me
  loc_00603A46: push eax
  loc_00603A47: mov ecx, [eax]
  loc_00603A49: call [ecx+00000008h]
  loc_00603A4C: mov eax, var_4
  loc_00603A4F: mov ecx, var_14
  loc_00603A52: pop edi
  loc_00603A53: pop esi
  loc_00603A54: mov fs:[00000000h], ecx
  loc_00603A5B: pop ebx
  loc_00603A5C: mov esp, ebp
  loc_00603A5E: pop ebp
  loc_00603A5F: retn 0008h
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer) '6038D0
  loc_006038D0: push ebp
  loc_006038D1: mov ebp, esp
  loc_006038D3: sub esp, 0000000Ch
  loc_006038D6: push 00403B36h ; __vbaExceptHandler
  loc_006038DB: mov eax, fs:[00000000h]
  loc_006038E1: push eax
  loc_006038E2: mov fs:[00000000h], esp
  loc_006038E9: sub esp, 00000014h
  loc_006038EC: push ebx
  loc_006038ED: push esi
  loc_006038EE: push edi
  loc_006038EF: mov var_C, esp
  loc_006038F2: mov var_8, 00403500h
  loc_006038F9: mov esi, Me
  loc_006038FC: mov eax, esi
  loc_006038FE: and eax, 00000001h
  loc_00603901: mov var_4, eax
  loc_00603904: and esi, FFFFFFFEh
  loc_00603907: push esi
  loc_00603908: mov Me, esi
  loc_0060390B: mov ecx, [esi]
  loc_0060390D: call [ecx+00000004h]
  loc_00603910: mov edx, KeyAscii
  loc_00603913: xor edi, edi
  loc_00603915: mov var_18, edi
  loc_00603918: cmp [edx], 000Dh
  loc_0060391C: jnz 0060395Eh
  loc_0060391E: mov eax, [esi]
  loc_00603920: push esi
  loc_00603921: call [eax+00000300h]
  loc_00603927: lea ecx, var_18
  loc_0060392A: push eax
  loc_0060392B: push ecx
  loc_0060392C: call [004010A0h] ; __vbaObjSet
  loc_00603932: mov esi, eax
  loc_00603934: push esi
  loc_00603935: mov edx, [esi]
  loc_00603937: call [edx+000001A4h]
  loc_0060393D: cmp eax, edi
  loc_0060393F: fnclex
  loc_00603941: jge 00603955h
  loc_00603943: push 000001A4h
  loc_00603948: push 0041EAACh
  loc_0060394D: push esi
  loc_0060394E: push eax
  loc_0060394F: call [00401074h] ; __vbaHresultCheckObj
  loc_00603955: lea ecx, var_18
  loc_00603958: call [004012B0h] ; __vbaFreeObj
  loc_0060395E: mov var_4, edi
  loc_00603961: push 00603973h
  loc_00603966: jmp 00603972h
  loc_00603968: lea ecx, var_18
  loc_0060396B: call [004012B0h] ; __vbaFreeObj
  loc_00603971: ret
  loc_00603972: ret
  loc_00603973: mov eax, Me
  loc_00603976: push eax
  loc_00603977: mov ecx, [eax]
  loc_00603979: call [ecx+00000008h]
  loc_0060397C: mov eax, var_4
  loc_0060397F: mov ecx, var_14
  loc_00603982: pop edi
  loc_00603983: pop esi
  loc_00603984: mov fs:[00000000h], ecx
  loc_0060398B: pop ebx
  loc_0060398C: mov esp, ebp
  loc_0060398E: pop ebp
  loc_0060398F: retn 0008h
End Sub

Private Sub lblLabels_Click() '603860
  loc_00603860: push ebp
  loc_00603861: mov ebp, esp
  loc_00603863: sub esp, 0000000Ch
  loc_00603866: push 00403B36h ; __vbaExceptHandler
  loc_0060386B: mov eax, fs:[00000000h]
  loc_00603871: push eax
  loc_00603872: mov fs:[00000000h], esp
  loc_00603879: sub esp, 00000008h
  loc_0060387C: push ebx
  loc_0060387D: push esi
  loc_0060387E: push edi
  loc_0060387F: mov var_C, esp
  loc_00603882: mov var_8, 004034F8h
  loc_00603889: mov esi, Me
  loc_0060388C: mov eax, esi
  loc_0060388E: and eax, 00000001h
  loc_00603891: mov var_4, eax
  loc_00603894: and esi, FFFFFFFEh
  loc_00603897: push esi
  loc_00603898: mov Me, esi
  loc_0060389B: mov ecx, [esi]
  loc_0060389D: call [ecx+00000004h]
  loc_006038A0: xor eax, eax
  loc_006038A2: mov [esi+00000034h], ax
  loc_006038A6: mov var_4, eax
  loc_006038A9: mov eax, Me
  loc_006038AC: push eax
  loc_006038AD: mov edx, [eax]
  loc_006038AF: call [edx+00000008h]
  loc_006038B2: mov eax, var_4
  loc_006038B5: mov ecx, var_14
  loc_006038B8: pop edi
  loc_006038B9: pop esi
  loc_006038BA: mov fs:[00000000h], ecx
  loc_006038C1: pop ebx
  loc_006038C2: mov esp, ebp
  loc_006038C4: pop ebp
  loc_006038C5: retn 0008h
End Sub

Private Sub cmdOk_Click() '603090
  loc_00603090: push ebp
  loc_00603091: mov ebp, esp
  loc_00603093: sub esp, 0000000Ch
  loc_00603096: push 00403B36h ; __vbaExceptHandler
  loc_0060309B: mov eax, fs:[00000000h]
  loc_006030A1: push eax
  loc_006030A2: mov fs:[00000000h], esp
  loc_006030A9: sub esp, 000000D4h
  loc_006030AF: push ebx
  loc_006030B0: push esi
  loc_006030B1: push edi
  loc_006030B2: mov var_C, esp
  loc_006030B5: mov var_8, 004034E8h
  loc_006030BC: mov esi, Me
  loc_006030BF: mov eax, esi
  loc_006030C1: and eax, 00000001h
  loc_006030C4: mov var_4, eax
  loc_006030C7: and esi, FFFFFFFEh
  loc_006030CA: push esi
  loc_006030CB: mov Me, esi
  loc_006030CE: mov ecx, [esi]
  loc_006030D0: call [ecx+00000004h]
  loc_006030D3: mov edx, [esi]
  loc_006030D5: xor ebx, ebx
  loc_006030D7: push esi
  loc_006030D8: mov var_18, ebx
  loc_006030DB: mov var_1C, ebx
  loc_006030DE: mov var_20, ebx
  loc_006030E1: mov var_24, ebx
  loc_006030E4: mov var_28, ebx
  loc_006030E7: mov var_2C, ebx
  loc_006030EA: mov var_3C, ebx
  loc_006030ED: mov var_4C, ebx
  loc_006030F0: mov var_5C, ebx
  loc_006030F3: mov var_6C, ebx
  loc_006030F6: mov var_7C, ebx
  loc_006030F9: mov var_8C, ebx
  loc_006030FF: mov var_B0, ebx
  loc_00603105: mov var_B4, ebx
  loc_0060310B: mov [esi+00000034h], bx
  loc_0060310F: call [edx+000002FCh]
  loc_00603115: push eax
  loc_00603116: lea eax, var_24
  loc_00603119: push eax
  loc_0060311A: call [004010A0h] ; __vbaObjSet
  loc_00603120: mov edi, eax
  loc_00603122: lea edx, var_1C
  loc_00603125: push edx
  loc_00603126: push edi
  loc_00603127: mov ecx, [edi]
  loc_00603129: call [ecx+000000A0h]
  loc_0060312F: cmp eax, ebx
  loc_00603131: fnclex
  loc_00603133: jge 00603147h
  loc_00603135: push 000000A0h
  loc_0060313A: push 0041E5E8h
  loc_0060313F: push edi
  loc_00603140: push eax
  loc_00603141: call [00401074h] ; __vbaHresultCheckObj
  loc_00603147: mov eax, [esi]
  loc_00603149: push esi
  loc_0060314A: call [eax+00000308h]
  loc_00603150: lea ecx, var_28
  loc_00603153: push eax
  loc_00603154: push ecx
  loc_00603155: call [004010A0h] ; __vbaObjSet
  loc_0060315B: mov edi, eax
  loc_0060315D: lea eax, var_20
  loc_00603160: push eax
  loc_00603161: push edi
  loc_00603162: mov edx, [edi]
  loc_00603164: call [edx+000000A0h]
  loc_0060316A: cmp eax, ebx
  loc_0060316C: fnclex
  loc_0060316E: jge 00603182h
  loc_00603170: push 000000A0h
  loc_00603175: push 0041E5E8h
  loc_0060317A: push edi
  loc_0060317B: push eax
  loc_0060317C: call [00401074h] ; __vbaHresultCheckObj
  loc_00603182: mov ecx, var_20
  loc_00603185: push ecx
  loc_00603186: push 00432094h ; "123"
  loc_0060318B: call [0040110Ch] ; __vbaStrCmp
  loc_00603191: mov edx, var_1C
  loc_00603194: mov edi, eax
  loc_00603196: neg edi
  loc_00603198: sbb edi, edi
  loc_0060319A: push edx
  loc_0060319B: inc edi
  loc_0060319C: push 00432094h ; "123"
  loc_006031A1: neg edi
  loc_006031A3: call [0040110Ch] ; __vbaStrCmp
  loc_006031A9: neg eax
  loc_006031AB: sbb eax, eax
  loc_006031AD: lea ecx, var_1C
  loc_006031B0: inc eax
  loc_006031B1: neg eax
  loc_006031B3: and edi, eax
  loc_006031B5: lea eax, var_20
  loc_006031B8: push eax
  loc_006031B9: push ecx
  loc_006031BA: push 00000002h
  loc_006031BC: call [004011FCh] ; __vbaFreeStrList
  loc_006031C2: lea edx, var_28
  loc_006031C5: lea eax, var_24
  loc_006031C8: push edx
  loc_006031C9: push eax
  loc_006031CA: push 00000002h
  loc_006031CC: call [00401040h] ; __vbaFreeObjList
  loc_006031D2: add esp, 00000018h
  loc_006031D5: cmp di, bx
  loc_006031D8: jz 006031E6h
  loc_006031DA: mov [esi+00000034h], FFFFFFh
  loc_006031E0: call [00401034h] ; __vbaEnd
  loc_006031E6: lea ebx, var_24
  loc_006031E9: mov ecx, 0000000Ah
  loc_006031EE: push ebx
  loc_006031EF: mov var_8C, ecx
  loc_006031F5: sub esp, 00000010h
  loc_006031F8: mov eax, 80020004h
  loc_006031FD: mov ebx, esp
  loc_006031FF: mov edx, eax
  loc_00603201: sub esp, 00000010h
  loc_00603204: mov var_84, edx
  loc_0060320A: mov [ebx], ecx
  loc_0060320C: mov ecx, var_98
  loc_00603212: mov var_7C, 00000003h
  loc_00603219: mov edi, [0061A13Ch]
  loc_0060321F: mov [ebx+00000004h], ecx
  loc_00603222: mov ecx, esp
  loc_00603224: sub esp, 00000010h
  loc_00603227: mov var_74, 00000004h
  loc_0060322E: mov [ebx+00000008h], eax
  loc_00603231: mov eax, var_90
  loc_00603237: mov edi, [edi]
  loc_00603239: mov [ebx+0000000Ch], eax
  loc_0060323C: mov eax, var_8C
  loc_00603242: mov [ecx], eax
  loc_00603244: mov eax, var_88
  loc_0060324A: mov [ecx+00000004h], eax
  loc_0060324D: mov eax, esp
  loc_0060324F: push 00433958h ; "Select * From LoginAdvUser"
  loc_00603254: mov [ecx+00000008h], edx
  loc_00603257: mov edx, var_80
  loc_0060325A: mov [ecx+0000000Ch], edx
  loc_0060325D: mov ecx, var_7C
  loc_00603260: mov edx, var_78
  loc_00603263: mov [eax], ecx
  loc_00603265: mov ecx, var_74
  loc_00603268: mov [eax+00000004h], edx
  loc_0060326B: mov edx, var_70
  loc_0060326E: mov [eax+00000008h], ecx
  loc_00603271: mov [eax+0000000Ch], edx
  loc_00603274: mov eax, [0061A13Ch]
  loc_00603279: push eax
  loc_0060327A: call [edi+000000BCh]
  loc_00603280: test eax, eax
  loc_00603282: fnclex
  loc_00603284: jge 0060329Eh
  loc_00603286: mov ecx, [0061A13Ch]
  loc_0060328C: push 000000BCh
  loc_00603291: push 0041E928h
  loc_00603296: push ecx
  loc_00603297: push eax
  loc_00603298: call [00401074h] ; __vbaHresultCheckObj
  loc_0060329E: mov eax, var_24
  loc_006032A1: lea edx, var_18
  loc_006032A4: push eax
  loc_006032A5: push edx
  loc_006032A6: mov var_24, 00000000h
  loc_006032AD: call [004010A0h] ; __vbaObjSet
  loc_006032B3: mov eax, var_18
  loc_006032B6: lea edx, var_B0
  loc_006032BC: push edx
  loc_006032BD: push eax
  loc_006032BE: mov ecx, [eax]
  loc_006032C0: call [ecx+00000020h]
  loc_006032C3: test eax, eax
  loc_006032C5: fnclex
  loc_006032C7: jge 006032DFh
  loc_006032C9: mov ecx, var_18
  loc_006032CC: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_006032D2: push 00000020h
  loc_006032D4: push 0041E938h
  loc_006032D9: push ecx
  loc_006032DA: push eax
  loc_006032DB: call edi
  loc_006032DD: jmp 006032E5h
  loc_006032DF: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_006032E5: mov eax, var_18
  loc_006032E8: lea ecx, var_B4
  loc_006032EE: push ecx
  loc_006032EF: push eax
  loc_006032F0: mov edx, [eax]
  loc_006032F2: call [edx+00000034h]
  loc_006032F5: test eax, eax
  loc_006032F7: fnclex
  loc_006032F9: jge 00603309h
  loc_006032FB: mov edx, var_18
  loc_006032FE: push 00000034h
  loc_00603300: push 0041E938h
  loc_00603305: push edx
  loc_00603306: push eax
  loc_00603307: call edi
  loc_00603309: xor eax, eax
  loc_0060330B: cmp var_B4, ax
  loc_00603312: setz al
  loc_00603315: xor ecx, ecx
  loc_00603317: cmp var_B0, cx
  loc_0060331E: setz cl
  loc_00603321: or eax, ecx
  loc_00603323: jz 006037A5h
  loc_00603329: mov eax, var_18
  loc_0060332C: lea ecx, var_24
  loc_0060332F: push ecx
  loc_00603330: push eax
  loc_00603331: mov edx, [eax]
  loc_00603333: call [edx+000000B4h]
  loc_00603339: test eax, eax
  loc_0060333B: fnclex
  loc_0060333D: jge 00603350h
  loc_0060333F: mov edx, var_18
  loc_00603342: push 000000B4h
  loc_00603347: push 0041E938h
  loc_0060334C: push edx
  loc_0060334D: push eax
  loc_0060334E: call edi
  loc_00603350: lea ebx, var_28
  loc_00603353: mov eax, var_24
  loc_00603356: push ebx
  loc_00603357: mov edx, 00000008h
  loc_0060335C: sub esp, 00000010h
  loc_0060335F: mov var_7C, edx
  loc_00603362: mov ebx, esp
  loc_00603364: mov ecx, 00431EC8h ; "UserName"
  loc_00603369: mov var_74, ecx
  loc_0060336C: mov edi, [eax]
  loc_0060336E: mov [ebx], edx
  loc_00603370: mov edx, var_78
  loc_00603373: push eax
  loc_00603374: mov var_BC, eax
  loc_0060337A: mov [ebx+00000004h], edx
  loc_0060337D: mov [ebx+00000008h], ecx
  loc_00603380: mov ecx, var_70
  loc_00603383: mov [ebx+0000000Ch], ecx
  loc_00603386: call [edi+00000030h]
  loc_00603389: test eax, eax
  loc_0060338B: fnclex
  loc_0060338D: jge 006033A8h
  loc_0060338F: mov edx, var_BC
  loc_00603395: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0060339B: push 00000030h
  loc_0060339D: push 0041EA14h ; "S"
  loc_006033A2: push edx
  loc_006033A3: push eax
  loc_006033A4: call edi
  loc_006033A6: jmp 006033AEh
  loc_006033A8: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_006033AE: mov eax, var_28
  loc_006033B1: lea edx, var_5C
  loc_006033B4: push edx
  loc_006033B5: push eax
  loc_006033B6: mov ecx, [eax]
  loc_006033B8: mov ebx, eax
  loc_006033BA: call [ecx+00000044h]
  loc_006033BD: test eax, eax
  loc_006033BF: fnclex
  loc_006033C1: jge 006033CEh
  loc_006033C3: push 00000044h
  loc_006033C5: push 0041EA48h
  loc_006033CA: push ebx
  loc_006033CB: push eax
  loc_006033CC: call edi
  loc_006033CE: mov eax, [esi]
  loc_006033D0: push esi
  loc_006033D1: call [eax+000002FCh]
  loc_006033D7: lea ecx, var_2C
  loc_006033DA: push eax
  loc_006033DB: push ecx
  loc_006033DC: call [004010A0h] ; __vbaObjSet
  loc_006033E2: mov ebx, eax
  loc_006033E4: lea eax, var_1C
  loc_006033E7: push eax
  loc_006033E8: push ebx
  loc_006033E9: mov edx, [ebx]
  loc_006033EB: call [edx+000000A0h]
  loc_006033F1: test eax, eax
  loc_006033F3: fnclex
  loc_006033F5: jge 00603405h
  loc_006033F7: push 000000A0h
  loc_006033FC: push 0041E5E8h
  loc_00603401: push ebx
  loc_00603402: push eax
  loc_00603403: call edi
  loc_00603405: mov eax, var_1C
  loc_00603408: lea ecx, var_3C
  loc_0060340B: lea edx, var_4C
  loc_0060340E: push ecx
  loc_0060340F: push edx
  loc_00603410: mov var_1C, 00000000h
  loc_00603417: mov var_34, eax
  loc_0060341A: mov var_3C, 00000008h
  loc_00603421: call [004010D4h] ; rtcTrimVar
  loc_00603427: lea eax, var_5C
  loc_0060342A: lea ecx, var_4C
  loc_0060342D: push eax
  loc_0060342E: push ecx
  loc_0060342F: call [00401110h] ; __vbaVarTstEq
  loc_00603435: mov edi, eax
  loc_00603437: lea edx, var_28
  loc_0060343A: lea eax, var_2C
  loc_0060343D: push edx
  loc_0060343E: lea ecx, var_24
  loc_00603441: push eax
  loc_00603442: push ecx
  loc_00603443: push 00000003h
  loc_00603445: call [00401040h] ; __vbaFreeObjList
  loc_0060344B: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_00603451: lea edx, var_4C
  loc_00603454: lea eax, var_5C
  loc_00603457: push edx
  loc_00603458: lea ecx, var_3C
  loc_0060345B: push eax
  loc_0060345C: push ecx
  loc_0060345D: push 00000003h
  loc_0060345F: call ebx
  loc_00603461: add esp, 00000020h
  loc_00603464: test di, di
  loc_00603467: jz 006036B9h
  loc_0060346D: mov eax, var_18
  loc_00603470: lea ecx, var_24
  loc_00603473: push ecx
  loc_00603474: push eax
  loc_00603475: mov edx, [eax]
  loc_00603477: call [edx+000000B4h]
  loc_0060347D: test eax, eax
  loc_0060347F: fnclex
  loc_00603481: jge 00603498h
  loc_00603483: mov edx, var_18
  loc_00603486: push 000000B4h
  loc_0060348B: push 0041E938h
  loc_00603490: push edx
  loc_00603491: push eax
  loc_00603492: call [00401074h] ; __vbaHresultCheckObj
  loc_00603498: lea edi, var_28
  loc_0060349B: mov eax, var_24
  loc_0060349E: push edi
  loc_0060349F: mov ecx, 00000008h
  loc_006034A4: sub esp, 00000010h
  loc_006034A7: mov var_7C, ecx
  loc_006034AA: mov edi, esp
  loc_006034AC: mov var_74, 00431EE0h ; "Password"
  loc_006034B3: mov edx, [eax]
  loc_006034B5: push eax
  loc_006034B6: mov [edi], ecx
  loc_006034B8: mov ecx, var_78
  loc_006034BB: mov var_BC, eax
  loc_006034C1: mov [edi+00000004h], ecx
  loc_006034C4: mov ecx, var_74
  loc_006034C7: mov [edi+00000008h], ecx
  loc_006034CA: mov ecx, var_70
  loc_006034CD: mov [edi+0000000Ch], ecx
  loc_006034D0: call [edx+00000030h]
  loc_006034D3: test eax, eax
  loc_006034D5: fnclex
  loc_006034D7: jge 006034EEh
  loc_006034D9: mov edx, var_BC
  loc_006034DF: push 00000030h
  loc_006034E1: push 0041EA14h ; "S"
  loc_006034E6: push edx
  loc_006034E7: push eax
  loc_006034E8: call [00401074h] ; __vbaHresultCheckObj
  loc_006034EE: mov eax, var_28
  loc_006034F1: lea edx, var_5C
  loc_006034F4: push edx
  loc_006034F5: push eax
  loc_006034F6: mov ecx, [eax]
  loc_006034F8: mov edi, eax
  loc_006034FA: call [ecx+00000044h]
  loc_006034FD: test eax, eax
  loc_006034FF: fnclex
  loc_00603501: jge 00603512h
  loc_00603503: push 00000044h
  loc_00603505: push 0041EA48h
  loc_0060350A: push edi
  loc_0060350B: push eax
  loc_0060350C: call [00401074h] ; __vbaHresultCheckObj
  loc_00603512: mov eax, [esi]
  loc_00603514: push esi
  loc_00603515: call [eax+00000308h]
  loc_0060351B: lea ecx, var_2C
  loc_0060351E: push eax
  loc_0060351F: push ecx
  loc_00603520: call [004010A0h] ; __vbaObjSet
  loc_00603526: mov edi, eax
  loc_00603528: lea eax, var_1C
  loc_0060352B: push eax
  loc_0060352C: push edi
  loc_0060352D: mov edx, [edi]
  loc_0060352F: call [edx+000000A0h]
  loc_00603535: test eax, eax
  loc_00603537: fnclex
  loc_00603539: jge 0060354Dh
  loc_0060353B: push 000000A0h
  loc_00603540: push 0041E5E8h
  loc_00603545: push edi
  loc_00603546: push eax
  loc_00603547: call [00401074h] ; __vbaHresultCheckObj
  loc_0060354D: mov eax, var_1C
  loc_00603550: lea ecx, var_3C
  loc_00603553: lea edx, var_4C
  loc_00603556: push ecx
  loc_00603557: push edx
  loc_00603558: mov var_1C, 00000000h
  loc_0060355F: mov var_34, eax
  loc_00603562: mov var_3C, 00000008h
  loc_00603569: call [004010D4h] ; rtcTrimVar
  loc_0060356F: lea eax, var_5C
  loc_00603572: lea ecx, var_4C
  loc_00603575: push eax
  loc_00603576: push ecx
  loc_00603577: call [00401110h] ; __vbaVarTstEq
  loc_0060357D: mov edi, eax
  loc_0060357F: lea edx, var_28
  loc_00603582: lea eax, var_2C
  loc_00603585: push edx
  loc_00603586: lea ecx, var_24
  loc_00603589: push eax
  loc_0060358A: push ecx
  loc_0060358B: push 00000003h
  loc_0060358D: call [00401040h] ; __vbaFreeObjList
  loc_00603593: lea edx, var_4C
  loc_00603596: lea eax, var_5C
  loc_00603599: push edx
  loc_0060359A: lea ecx, var_3C
  loc_0060359D: push eax
  loc_0060359E: push ecx
  loc_0060359F: push 00000003h
  loc_006035A1: call ebx
  loc_006035A3: add esp, 00000020h
  loc_006035A6: test di, di
  loc_006035A9: jz 00603605h
  loc_006035AB: mov [esi+00000034h], FFFFFFh
  loc_006035B1: mov eax, [0061B394h]
  loc_006035B6: test eax, eax
  loc_006035B8: jnz 006035CAh
  loc_006035BA: push 0061B394h
  loc_006035BF: push 0041E4A0h
  loc_006035C4: call [004011DCh] ; __vbaNew2
  loc_006035CA: mov edi, [0061B394h]
  loc_006035D0: lea edx, var_24
  loc_006035D3: push esi
  loc_006035D4: push edx
  loc_006035D5: mov ebx, [edi]
  loc_006035D7: call [004010B8h] ; __vbaObjSetAddref
  loc_006035DD: push eax
  loc_006035DE: push edi
  loc_006035DF: call [ebx+00000010h]
  loc_006035E2: test eax, eax
  loc_006035E4: fnclex
  loc_006035E6: jge 006035F7h
  loc_006035E8: push 00000010h
  loc_006035EA: push 0041E490h
  loc_006035EF: push edi
  loc_006035F0: push eax
  loc_006035F1: call [00401074h] ; __vbaHresultCheckObj
  loc_006035F7: lea ecx, var_24
  loc_006035FA: call [004012B0h] ; __vbaFreeObj
  loc_00603600: jmp 006037A5h
  loc_00603605: mov edi, [00401240h] ; __vbaVarDup
  loc_0060360B: mov ecx, 0000000Ah
  loc_00603610: mov eax, 80020004h
  loc_00603615: mov var_6C, ecx
  loc_00603618: mov var_5C, ecx
  loc_0060361B: lea edx, var_8C
  loc_00603621: lea ecx, var_4C
  loc_00603624: mov [esi+00000034h], 0000h
  loc_0060362A: mov var_64, eax
  loc_0060362D: mov var_54, eax
  loc_00603630: mov var_84, 00431F38h ; "Login"
  loc_0060363A: mov var_8C, 00000008h
  loc_00603644: call edi
  loc_00603646: lea edx, var_7C
  loc_00603649: lea ecx, var_3C
  loc_0060364C: mov var_74, 00431EF8h ; "Invalid Password, try again!"
  loc_00603653: mov var_7C, 00000008h
  loc_0060365A: call edi
  loc_0060365C: lea eax, var_6C
  loc_0060365F: lea ecx, var_5C
  loc_00603662: push eax
  loc_00603663: lea edx, var_4C
  loc_00603666: push ecx
  loc_00603667: push edx
  loc_00603668: lea eax, var_3C
  loc_0060366B: push 00000000h
  loc_0060366D: push eax
  loc_0060366E: call [004010A4h] ; rtcMsgBox
  loc_00603674: lea ecx, var_6C
  loc_00603677: lea edx, var_5C
  loc_0060367A: push ecx
  loc_0060367B: lea eax, var_4C
  loc_0060367E: push edx
  loc_0060367F: lea ecx, var_3C
  loc_00603682: push eax
  loc_00603683: push ecx
  loc_00603684: push 00000004h
  loc_00603686: call ebx
  loc_00603688: mov edx, [esi]
  loc_0060368A: add esp, 00000014h
  loc_0060368D: push esi
  loc_0060368E: call [edx+00000308h]
  loc_00603694: push eax
  loc_00603695: lea eax, var_24
  loc_00603698: push eax
  loc_00603699: call [004010A0h] ; __vbaObjSet
  loc_0060369F: mov esi, eax
  loc_006036A1: push esi
  loc_006036A2: mov ecx, [esi]
  loc_006036A4: call [ecx+00000204h]
  loc_006036AA: test eax, eax
  loc_006036AC: fnclex
  loc_006036AE: jge 00603776h
  loc_006036B4: jmp 00603764h
  loc_006036B9: mov edi, [00401240h] ; __vbaVarDup
  loc_006036BF: mov ecx, 0000000Ah
  loc_006036C4: mov eax, 80020004h
  loc_006036C9: mov var_6C, ecx
  loc_006036CC: mov var_5C, ecx
  loc_006036CF: lea edx, var_8C
  loc_006036D5: lea ecx, var_4C
  loc_006036D8: mov [esi+00000034h], 0000h
  loc_006036DE: mov var_64, eax
  loc_006036E1: mov var_54, eax
  loc_006036E4: mov var_84, 00431F38h ; "Login"
  loc_006036EE: mov var_8C, 00000008h
  loc_006036F8: call edi
  loc_006036FA: lea edx, var_7C
  loc_006036FD: lea ecx, var_3C
  loc_00603700: mov var_74, 00431EF8h ; "Invalid Password, try again!"
  loc_00603707: mov var_7C, 00000008h
  loc_0060370E: call edi
  loc_00603710: lea eax, var_6C
  loc_00603713: lea ecx, var_5C
  loc_00603716: push eax
  loc_00603717: lea edx, var_4C
  loc_0060371A: push ecx
  loc_0060371B: push edx
  loc_0060371C: lea eax, var_3C
  loc_0060371F: push 00000000h
  loc_00603721: push eax
  loc_00603722: call [004010A4h] ; rtcMsgBox
  loc_00603728: lea ecx, var_6C
  loc_0060372B: lea edx, var_5C
  loc_0060372E: push ecx
  loc_0060372F: lea eax, var_4C
  loc_00603732: push edx
  loc_00603733: lea ecx, var_3C
  loc_00603736: push eax
  loc_00603737: push ecx
  loc_00603738: push 00000004h
  loc_0060373A: call ebx
  loc_0060373C: mov edx, [esi]
  loc_0060373E: add esp, 00000014h
  loc_00603741: push esi
  loc_00603742: call [edx+00000308h]
  loc_00603748: push eax
  loc_00603749: lea eax, var_24
  loc_0060374C: push eax
  loc_0060374D: call [004010A0h] ; __vbaObjSet
  loc_00603753: mov esi, eax
  loc_00603755: push esi
  loc_00603756: mov ecx, [esi]
  loc_00603758: call [ecx+00000204h]
  loc_0060375E: test eax, eax
  loc_00603760: fnclex
  loc_00603762: jge 00603776h
  loc_00603764: push 00000204h
  loc_00603769: push 0041E5E8h
  loc_0060376E: push esi
  loc_0060376F: push eax
  loc_00603770: call [00401074h] ; __vbaHresultCheckObj
  loc_00603776: lea ecx, var_24
  loc_00603779: call [004012B0h] ; __vbaFreeObj
  loc_0060377F: lea edx, var_3C
  loc_00603782: mov var_34, 80020004h
  loc_00603789: push edx
  loc_0060378A: push 00431CB0h ; "{Home}+{End}"
  loc_0060378F: mov var_3C, 0000000Ah
  loc_00603796: call [004010C0h] ; rtcSendKeys
  loc_0060379C: lea ecx, var_3C
  loc_0060379F: call [00401020h] ; __vbaFreeVar
  loc_006037A5: mov eax, var_18
  loc_006037A8: push eax
  loc_006037A9: mov ecx, [eax]
  loc_006037AB: call [ecx+000000C4h]
  loc_006037B1: test eax, eax
  loc_006037B3: fnclex
  loc_006037B5: jge 006037CCh
  loc_006037B7: mov edx, var_18
  loc_006037BA: push 000000C4h
  loc_006037BF: push 0041E938h
  loc_006037C4: push edx
  loc_006037C5: push eax
  loc_006037C6: call [00401074h] ; __vbaHresultCheckObj
  loc_006037CC: push 0041E938h
  loc_006037D1: push 00000000h
  loc_006037D3: call [00401274h] ; __vbaCastObj
  loc_006037D9: push eax
  loc_006037DA: lea eax, var_18
  loc_006037DD: push eax
  loc_006037DE: call [004010A0h] ; __vbaObjSet
  loc_006037E4: mov var_4, 00000000h
  loc_006037EB: push 0060383Ch
  loc_006037F0: jmp 00603832h
  loc_006037F2: lea ecx, var_20
  loc_006037F5: lea edx, var_1C
  loc_006037F8: push ecx
  loc_006037F9: push edx
  loc_006037FA: push 00000002h
  loc_006037FC: call [004011FCh] ; __vbaFreeStrList
  loc_00603802: lea eax, var_2C
  loc_00603805: lea ecx, var_28
  loc_00603808: push eax
  loc_00603809: lea edx, var_24
  loc_0060380C: push ecx
  loc_0060380D: push edx
  loc_0060380E: push 00000003h
  loc_00603810: call [00401040h] ; __vbaFreeObjList
  loc_00603816: lea eax, var_6C
  loc_00603819: lea ecx, var_5C
  loc_0060381C: push eax
  loc_0060381D: lea edx, var_4C
  loc_00603820: push ecx
  loc_00603821: lea eax, var_3C
  loc_00603824: push edx
  loc_00603825: push eax
  loc_00603826: push 00000004h
  loc_00603828: call [00401038h] ; __vbaFreeVarList
  loc_0060382E: add esp, 00000030h
  loc_00603831: ret
  loc_00603832: lea ecx, var_18
  loc_00603835: call [004012B0h] ; __vbaFreeObj
  loc_0060383B: ret
  loc_0060383C: mov eax, Me
  loc_0060383F: push eax
  loc_00603840: mov ecx, [eax]
  loc_00603842: call [ecx+00000008h]
  loc_00603845: mov eax, var_4
  loc_00603848: mov ecx, var_14
  loc_0060384B: pop edi
  loc_0060384C: pop esi
  loc_0060384D: mov fs:[00000000h], ecx
  loc_00603854: pop ebx
  loc_00603855: mov esp, ebp
  loc_00603857: pop ebp
  loc_00603858: retn 0004h
End Sub

Private Sub cmdCancel_Click() '602FB0
  loc_00602FB0: push ebp
  loc_00602FB1: mov ebp, esp
  loc_00602FB3: sub esp, 0000000Ch
  loc_00602FB6: push 00403B36h ; __vbaExceptHandler
  loc_00602FBB: mov eax, fs:[00000000h]
  loc_00602FC1: push eax
  loc_00602FC2: mov fs:[00000000h], esp
  loc_00602FC9: sub esp, 00000018h
  loc_00602FCC: push ebx
  loc_00602FCD: push esi
  loc_00602FCE: push edi
  loc_00602FCF: mov var_C, esp
  loc_00602FD2: mov var_8, 004034D8h
  loc_00602FD9: mov edi, Me
  loc_00602FDC: mov eax, edi
  loc_00602FDE: and eax, 00000001h
  loc_00602FE1: mov var_4, eax
  loc_00602FE4: and edi, FFFFFFFEh
  loc_00602FE7: push edi
  loc_00602FE8: mov Me, edi
  loc_00602FEB: mov ecx, [edi]
  loc_00602FED: call [ecx+00000004h]
  loc_00602FF0: xor ebx, ebx
  loc_00602FF2: mov [edi+00000034h], bx
  loc_00602FF6: mov eax, [0061B394h]
  loc_00602FFB: cmp eax, ebx
  loc_00602FFD: mov var_18, ebx
  loc_00603000: jnz 00603012h
  loc_00603002: push 0061B394h
  loc_00603007: push 0041E4A0h
  loc_0060300C: call [004011DCh] ; __vbaNew2
  loc_00603012: mov esi, [0061B394h]
  loc_00603018: lea eax, var_18
  loc_0060301B: push edi
  loc_0060301C: push eax
  loc_0060301D: mov edx, [esi]
  loc_0060301F: mov var_2C, edx
  loc_00603022: call [004010B8h] ; __vbaObjSetAddref
  loc_00603028: mov ecx, var_2C
  loc_0060302B: push eax
  loc_0060302C: push esi
  loc_0060302D: call [ecx+00000010h]
  loc_00603030: cmp eax, ebx
  loc_00603032: fnclex
  loc_00603034: jge 00603045h
  loc_00603036: push 00000010h
  loc_00603038: push 0041E490h
  loc_0060303D: push esi
  loc_0060303E: push eax
  loc_0060303F: call [00401074h] ; __vbaHresultCheckObj
  loc_00603045: lea ecx, var_18
  loc_00603048: call [004012B0h] ; __vbaFreeObj
  loc_0060304E: mov var_4, ebx
  loc_00603051: push 00603063h
  loc_00603056: jmp 00603062h
  loc_00603058: lea ecx, var_18
  loc_0060305B: call [004012B0h] ; __vbaFreeObj
  loc_00603061: ret
  loc_00603062: ret
  loc_00603063: mov eax, Me
  loc_00603066: push eax
  loc_00603067: mov edx, [eax]
  loc_00603069: call [edx+00000008h]
  loc_0060306C: mov eax, var_4
  loc_0060306F: mov ecx, var_14
  loc_00603072: pop edi
  loc_00603073: pop esi
  loc_00603074: mov fs:[00000000h], ecx
  loc_0060307B: pop ebx
  loc_0060307C: mov esp, ebp
  loc_0060307E: pop ebp
  loc_0060307F: retn 0004h
End Sub
