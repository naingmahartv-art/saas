VERSION 5.00
Begin VB.Form frmComfi
  Caption = "Key Option"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 5685
  ClientHeight = 3630
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
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2910
    Top = 3090
    Width = 1095
    Height = 405
    TabIndex = 7
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 1800
    Top = 3090
    Width = 1095
    Height = 405
    TabIndex = 6
  End
  Begin VB.TextBox txt3
    Left = 2730
    Top = 2250
    Width = 1245
    Height = 405
    TabIndex = 5
    MaxLength = 3
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txt2
    Left = 2730
    Top = 1650
    Width = 1245
    Height = 405
    TabIndex = 3
    MaxLength = 3
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.TextBox txt1
    Left = 2730
    Top = 1050
    Width = 1245
    Height = 405
    TabIndex = 1
    MaxLength = 3
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.Label Label5
    Caption = "When Ledger Entry"
    Index = 1
    ForeColor = &H800000&
    Left = 630
    Top = 45
    Width = 2130
    Height = 330
    TabIndex = 10
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
  Begin VB.Line Line1
    Index = 2
    BorderColor = &HC0C0FF&
    X1 = 585
    Y1 = 2160
    X2 = 5265
    Y2 = 2160
  End
  Begin VB.Line Line1
    Index = 1
    BorderColor = &HC0C0FF&
    X1 = 585
    Y1 = 1530
    X2 = 5265
    Y2 = 1530
  End
  Begin VB.Line Line2
    Index = 0
    X1 = 2610
    Y1 = 360
    X2 = 2610
    Y2 = 945
  End
  Begin VB.Line Line1
    Index = 0
    X1 = 585
    Y1 = 945
    X2 = 5265
    Y2 = 945
  End
  Begin VB.Label Label5
    Caption = "Display this Letter"
    Index = 0
    ForeColor = &HFF&
    Left = 2790
    Top = 495
    Width = 2310
    Height = 330
    TabIndex = 9
    BackStyle = 0 'Transparent
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
  Begin VB.Label Label4
    Caption = "If you typed this"
    ForeColor = &H800000&
    Left = 1035
    Top = 540
    Width = 1365
    Height = 330
    TabIndex = 8
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
  Begin VB.Label Label3
    Caption = "."
    Left = 1500
    Top = 2280
    Width = 885
    Height = 375
    TabIndex = 4
    Alignment = 2 'Center
    BeginProperty Font
      Name = "Arial"
      Size = 15.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label2
    Caption = "*"
    Left = 1500
    Top = 1695
    Width = 885
    Height = 375
    TabIndex = 2
    Alignment = 2 'Center
    BeginProperty Font
      Name = "Arial"
      Size = 15.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "/"
    Left = 1500
    Top = 1080
    Width = 885
    Height = 375
    TabIndex = 0
    Alignment = 2 'Center
    BeginProperty Font
      Name = "Arial"
      Size = 15.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Shape Shape2
    BackColor = &HC0FFFF&
    Left = 630
    Top = 405
    Width = 1950
    Height = 510
    BackStyle = 1 'Opaque
  End
  Begin VB.Shape Shape1
    Left = 585
    Top = 360
    Width = 4695
    Height = 2400
    BackStyle = 1 'Opaque
  End
End

Attribute VB_Name = "frmComfi"


Private Sub Form_Load() '5CD5A0
  loc_005CD5A0: push ebp
  loc_005CD5A1: mov ebp, esp
  loc_005CD5A3: sub esp, 0000000Ch
  loc_005CD5A6: push 00403B36h ; __vbaExceptHandler
  loc_005CD5AB: mov eax, fs:[00000000h]
  loc_005CD5B1: push eax
  loc_005CD5B2: mov fs:[00000000h], esp
  loc_005CD5B9: sub esp, 00000008h
  loc_005CD5BC: push ebx
  loc_005CD5BD: push esi
  loc_005CD5BE: push edi
  loc_005CD5BF: mov var_C, esp
  loc_005CD5C2: mov var_8, 00403150h
  loc_005CD5C9: mov esi, Me
  loc_005CD5CC: mov eax, esi
  loc_005CD5CE: and eax, 00000001h
  loc_005CD5D1: mov var_4, eax
  loc_005CD5D4: and esi, FFFFFFFEh
  loc_005CD5D7: push esi
  loc_005CD5D8: mov Me, esi
  loc_005CD5DB: mov ecx, [esi]
  loc_005CD5DD: call [ecx+00000004h]
  loc_005CD5E0: mov edx, [esi]
  loc_005CD5E2: push esi
  loc_005CD5E3: call [edx+000006FCh]
  loc_005CD5E9: mov var_4, 00000000h
  loc_005CD5F0: mov eax, Me
  loc_005CD5F3: push eax
  loc_005CD5F4: mov ecx, [eax]
  loc_005CD5F6: call [ecx+00000008h]
  loc_005CD5F9: mov eax, var_4
  loc_005CD5FC: mov ecx, var_14
  loc_005CD5FF: pop edi
  loc_005CD600: pop esi
  loc_005CD601: mov fs:[00000000h], ecx
  loc_005CD608: pop ebx
  loc_005CD609: mov esp, ebp
  loc_005CD60B: pop ebp
  loc_005CD60C: retn 0004h
End Sub

Private Sub cmdCancel_Click() '5CD460
  loc_005CD460: push ebp
  loc_005CD461: mov ebp, esp
  loc_005CD463: sub esp, 0000000Ch
  loc_005CD466: push 00403B36h ; __vbaExceptHandler
  loc_005CD46B: mov eax, fs:[00000000h]
  loc_005CD471: push eax
  loc_005CD472: mov fs:[00000000h], esp
  loc_005CD479: sub esp, 00000018h
  loc_005CD47C: push ebx
  loc_005CD47D: push esi
  loc_005CD47E: push edi
  loc_005CD47F: mov var_C, esp
  loc_005CD482: mov var_8, 00403138h
  loc_005CD489: mov edi, Me
  loc_005CD48C: mov eax, edi
  loc_005CD48E: and eax, 00000001h
  loc_005CD491: mov var_4, eax
  loc_005CD494: and edi, FFFFFFFEh
  loc_005CD497: push edi
  loc_005CD498: mov Me, edi
  loc_005CD49B: mov ecx, [edi]
  loc_005CD49D: call [ecx+00000004h]
  loc_005CD4A0: mov eax, [0061B394h]
  loc_005CD4A5: xor ebx, ebx
  loc_005CD4A7: cmp eax, ebx
  loc_005CD4A9: mov var_18, ebx
  loc_005CD4AC: jnz 005CD4BEh
  loc_005CD4AE: push 0061B394h
  loc_005CD4B3: push 0041E4A0h
  loc_005CD4B8: call [004011DCh] ; __vbaNew2
  loc_005CD4BE: mov esi, [0061B394h]
  loc_005CD4C4: lea eax, var_18
  loc_005CD4C7: push edi
  loc_005CD4C8: push eax
  loc_005CD4C9: mov edx, [esi]
  loc_005CD4CB: mov var_2C, edx
  loc_005CD4CE: call [004010B8h] ; __vbaObjSetAddref
  loc_005CD4D4: mov ecx, var_2C
  loc_005CD4D7: push eax
  loc_005CD4D8: push esi
  loc_005CD4D9: call [ecx+00000010h]
  loc_005CD4DC: cmp eax, ebx
  loc_005CD4DE: fnclex
  loc_005CD4E0: jge 005CD4F1h
  loc_005CD4E2: push 00000010h
  loc_005CD4E4: push 0041E490h
  loc_005CD4E9: push esi
  loc_005CD4EA: push eax
  loc_005CD4EB: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD4F1: lea ecx, var_18
  loc_005CD4F4: call [004012B0h] ; __vbaFreeObj
  loc_005CD4FA: mov var_4, ebx
  loc_005CD4FD: push 005CD50Fh
  loc_005CD502: jmp 005CD50Eh
  loc_005CD504: lea ecx, var_18
  loc_005CD507: call [004012B0h] ; __vbaFreeObj
  loc_005CD50D: ret
  loc_005CD50E: ret
  loc_005CD50F: mov eax, Me
  loc_005CD512: push eax
  loc_005CD513: mov edx, [eax]
  loc_005CD515: call [edx+00000008h]
  loc_005CD518: mov eax, var_4
  loc_005CD51B: mov ecx, var_14
  loc_005CD51E: pop edi
  loc_005CD51F: pop esi
  loc_005CD520: mov fs:[00000000h], ecx
  loc_005CD527: pop ebx
  loc_005CD528: mov esp, ebp
  loc_005CD52A: pop ebp
  loc_005CD52B: retn 0004h
End Sub

Private Sub cmdSave_Click() '5CD530
  loc_005CD530: push ebp
  loc_005CD531: mov ebp, esp
  loc_005CD533: sub esp, 0000000Ch
  loc_005CD536: push 00403B36h ; __vbaExceptHandler
  loc_005CD53B: mov eax, fs:[00000000h]
  loc_005CD541: push eax
  loc_005CD542: mov fs:[00000000h], esp
  loc_005CD549: sub esp, 00000008h
  loc_005CD54C: push ebx
  loc_005CD54D: push esi
  loc_005CD54E: push edi
  loc_005CD54F: mov var_C, esp
  loc_005CD552: mov var_8, 00403148h
  loc_005CD559: mov esi, Me
  loc_005CD55C: mov eax, esi
  loc_005CD55E: and eax, 00000001h
  loc_005CD561: mov var_4, eax
  loc_005CD564: and esi, FFFFFFFEh
  loc_005CD567: push esi
  loc_005CD568: mov Me, esi
  loc_005CD56B: mov ecx, [esi]
  loc_005CD56D: call [ecx+00000004h]
  loc_005CD570: mov edx, [esi]
  loc_005CD572: push esi
  loc_005CD573: call [edx+000006F8h]
  loc_005CD579: mov var_4, 00000000h
  loc_005CD580: mov eax, Me
  loc_005CD583: push eax
  loc_005CD584: mov ecx, [eax]
  loc_005CD586: call [ecx+00000008h]
  loc_005CD589: mov eax, var_4
  loc_005CD58C: mov ecx, var_14
  loc_005CD58F: pop edi
  loc_005CD590: pop esi
  loc_005CD591: mov fs:[00000000h], ecx
  loc_005CD598: pop ebx
  loc_005CD599: mov esp, ebp
  loc_005CD59B: pop ebp
  loc_005CD59C: retn 0004h
End Sub

Private Sub txt1_KeyPress(KeyAscii As Integer) '5CD610
  loc_005CD610: push ebp
  loc_005CD611: mov ebp, esp
  loc_005CD613: sub esp, 0000000Ch
  loc_005CD616: push 00403B36h ; __vbaExceptHandler
  loc_005CD61B: mov eax, fs:[00000000h]
  loc_005CD621: push eax
  loc_005CD622: mov fs:[00000000h], esp
  loc_005CD629: sub esp, 00000014h
  loc_005CD62C: push ebx
  loc_005CD62D: push esi
  loc_005CD62E: push edi
  loc_005CD62F: mov var_C, esp
  loc_005CD632: mov var_8, 00403158h
  loc_005CD639: mov esi, Me
  loc_005CD63C: mov eax, esi
  loc_005CD63E: and eax, 00000001h
  loc_005CD641: mov var_4, eax
  loc_005CD644: and esi, FFFFFFFEh
  loc_005CD647: push esi
  loc_005CD648: mov Me, esi
  loc_005CD64B: mov ecx, [esi]
  loc_005CD64D: call [ecx+00000004h]
  loc_005CD650: mov edx, KeyAscii
  loc_005CD653: xor edi, edi
  loc_005CD655: mov var_18, edi
  loc_005CD658: cmp [edx], 000Dh
  loc_005CD65C: jnz 005CD69Eh
  loc_005CD65E: mov eax, [esi]
  loc_005CD660: push esi
  loc_005CD661: call [eax+00000308h]
  loc_005CD667: lea ecx, var_18
  loc_005CD66A: push eax
  loc_005CD66B: push ecx
  loc_005CD66C: call [004010A0h] ; __vbaObjSet
  loc_005CD672: mov esi, eax
  loc_005CD674: push esi
  loc_005CD675: mov edx, [esi]
  loc_005CD677: call [edx+00000204h]
  loc_005CD67D: cmp eax, edi
  loc_005CD67F: fnclex
  loc_005CD681: jge 005CD695h
  loc_005CD683: push 00000204h
  loc_005CD688: push 0041E5E8h
  loc_005CD68D: push esi
  loc_005CD68E: push eax
  loc_005CD68F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD695: lea ecx, var_18
  loc_005CD698: call [004012B0h] ; __vbaFreeObj
  loc_005CD69E: mov var_4, edi
  loc_005CD6A1: push 005CD6B3h
  loc_005CD6A6: jmp 005CD6B2h
  loc_005CD6A8: lea ecx, var_18
  loc_005CD6AB: call [004012B0h] ; __vbaFreeObj
  loc_005CD6B1: ret
  loc_005CD6B2: ret
  loc_005CD6B3: mov eax, Me
  loc_005CD6B6: push eax
  loc_005CD6B7: mov ecx, [eax]
  loc_005CD6B9: call [ecx+00000008h]
  loc_005CD6BC: mov eax, var_4
  loc_005CD6BF: mov ecx, var_14
  loc_005CD6C2: pop edi
  loc_005CD6C3: pop esi
  loc_005CD6C4: mov fs:[00000000h], ecx
  loc_005CD6CB: pop ebx
  loc_005CD6CC: mov esp, ebp
  loc_005CD6CE: pop ebp
  loc_005CD6CF: retn 0008h
End Sub

Private Sub txt3_KeyPress(KeyAscii As Integer) '5CD7B0
  loc_005CD7B0: push ebp
  loc_005CD7B1: mov ebp, esp
  loc_005CD7B3: sub esp, 0000000Ch
  loc_005CD7B6: push 00403B36h ; __vbaExceptHandler
  loc_005CD7BB: mov eax, fs:[00000000h]
  loc_005CD7C1: push eax
  loc_005CD7C2: mov fs:[00000000h], esp
  loc_005CD7C9: sub esp, 00000014h
  loc_005CD7CC: push ebx
  loc_005CD7CD: push esi
  loc_005CD7CE: push edi
  loc_005CD7CF: mov var_C, esp
  loc_005CD7D2: mov var_8, 00403178h
  loc_005CD7D9: mov esi, Me
  loc_005CD7DC: mov eax, esi
  loc_005CD7DE: and eax, 00000001h
  loc_005CD7E1: mov var_4, eax
  loc_005CD7E4: and esi, FFFFFFFEh
  loc_005CD7E7: push esi
  loc_005CD7E8: mov Me, esi
  loc_005CD7EB: mov ecx, [esi]
  loc_005CD7ED: call [ecx+00000004h]
  loc_005CD7F0: mov edx, KeyAscii
  loc_005CD7F3: xor edi, edi
  loc_005CD7F5: mov var_18, edi
  loc_005CD7F8: cmp [edx], 000Dh
  loc_005CD7FC: jnz 005CD83Eh
  loc_005CD7FE: mov eax, [esi]
  loc_005CD800: push esi
  loc_005CD801: call [eax+00000300h]
  loc_005CD807: lea ecx, var_18
  loc_005CD80A: push eax
  loc_005CD80B: push ecx
  loc_005CD80C: call [004010A0h] ; __vbaObjSet
  loc_005CD812: mov esi, eax
  loc_005CD814: push esi
  loc_005CD815: mov edx, [esi]
  loc_005CD817: call [edx+000001A4h]
  loc_005CD81D: cmp eax, edi
  loc_005CD81F: fnclex
  loc_005CD821: jge 005CD835h
  loc_005CD823: push 000001A4h
  loc_005CD828: push 0041EAACh
  loc_005CD82D: push esi
  loc_005CD82E: push eax
  loc_005CD82F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD835: lea ecx, var_18
  loc_005CD838: call [004012B0h] ; __vbaFreeObj
  loc_005CD83E: mov var_4, edi
  loc_005CD841: push 005CD853h
  loc_005CD846: jmp 005CD852h
  loc_005CD848: lea ecx, var_18
  loc_005CD84B: call [004012B0h] ; __vbaFreeObj
  loc_005CD851: ret
  loc_005CD852: ret
  loc_005CD853: mov eax, Me
  loc_005CD856: push eax
  loc_005CD857: mov ecx, [eax]
  loc_005CD859: call [ecx+00000008h]
  loc_005CD85C: mov eax, var_4
  loc_005CD85F: mov ecx, var_14
  loc_005CD862: pop edi
  loc_005CD863: pop esi
  loc_005CD864: mov fs:[00000000h], ecx
  loc_005CD86B: pop ebx
  loc_005CD86C: mov esp, ebp
  loc_005CD86E: pop ebp
  loc_005CD86F: retn 0008h
End Sub

Private Sub txt2_KeyPress(KeyAscii As Integer) '5CD6E0
  loc_005CD6E0: push ebp
  loc_005CD6E1: mov ebp, esp
  loc_005CD6E3: sub esp, 0000000Ch
  loc_005CD6E6: push 00403B36h ; __vbaExceptHandler
  loc_005CD6EB: mov eax, fs:[00000000h]
  loc_005CD6F1: push eax
  loc_005CD6F2: mov fs:[00000000h], esp
  loc_005CD6F9: sub esp, 00000014h
  loc_005CD6FC: push ebx
  loc_005CD6FD: push esi
  loc_005CD6FE: push edi
  loc_005CD6FF: mov var_C, esp
  loc_005CD702: mov var_8, 00403168h
  loc_005CD709: mov esi, Me
  loc_005CD70C: mov eax, esi
  loc_005CD70E: and eax, 00000001h
  loc_005CD711: mov var_4, eax
  loc_005CD714: and esi, FFFFFFFEh
  loc_005CD717: push esi
  loc_005CD718: mov Me, esi
  loc_005CD71B: mov ecx, [esi]
  loc_005CD71D: call [ecx+00000004h]
  loc_005CD720: mov edx, KeyAscii
  loc_005CD723: xor edi, edi
  loc_005CD725: mov var_18, edi
  loc_005CD728: cmp [edx], 000Dh
  loc_005CD72C: jnz 005CD76Eh
  loc_005CD72E: mov eax, [esi]
  loc_005CD730: push esi
  loc_005CD731: call [eax+00000304h]
  loc_005CD737: lea ecx, var_18
  loc_005CD73A: push eax
  loc_005CD73B: push ecx
  loc_005CD73C: call [004010A0h] ; __vbaObjSet
  loc_005CD742: mov esi, eax
  loc_005CD744: push esi
  loc_005CD745: mov edx, [esi]
  loc_005CD747: call [edx+00000204h]
  loc_005CD74D: cmp eax, edi
  loc_005CD74F: fnclex
  loc_005CD751: jge 005CD765h
  loc_005CD753: push 00000204h
  loc_005CD758: push 0041E5E8h
  loc_005CD75D: push esi
  loc_005CD75E: push eax
  loc_005CD75F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD765: lea ecx, var_18
  loc_005CD768: call [004012B0h] ; __vbaFreeObj
  loc_005CD76E: mov var_4, edi
  loc_005CD771: push 005CD783h
  loc_005CD776: jmp 005CD782h
  loc_005CD778: lea ecx, var_18
  loc_005CD77B: call [004012B0h] ; __vbaFreeObj
  loc_005CD781: ret
  loc_005CD782: ret
  loc_005CD783: mov eax, Me
  loc_005CD786: push eax
  loc_005CD787: mov ecx, [eax]
  loc_005CD789: call [ecx+00000008h]
  loc_005CD78C: mov eax, var_4
  loc_005CD78F: mov ecx, var_14
  loc_005CD792: pop edi
  loc_005CD793: pop esi
  loc_005CD794: mov fs:[00000000h], ecx
  loc_005CD79B: pop ebx
  loc_005CD79C: mov esp, ebp
  loc_005CD79E: pop ebp
  loc_005CD79F: retn 0008h
End Sub

Private Sub Proc_22_6_5CC430() '5CC430
  loc_005CC430: push ebp
  loc_005CC431: mov ebp, esp
  loc_005CC433: sub esp, 00000008h
  loc_005CC436: push 00403B36h ; __vbaExceptHandler
  loc_005CC43B: mov eax, fs:[00000000h]
  loc_005CC441: push eax
  loc_005CC442: mov fs:[00000000h], esp
  loc_005CC449: sub esp, 00000108h
  loc_005CC44F: push ebx
  loc_005CC450: push esi
  loc_005CC451: push edi
  loc_005CC452: mov var_8, esp
  loc_005CC455: mov var_4, 00403118h
  loc_005CC45C: sub esp, 00000010h
  loc_005CC45F: mov edx, [0061A13Ch]
  loc_005CC465: mov edi, esp
  loc_005CC467: mov ecx, 0000000Ah
  loc_005CC46C: mov var_B0, ecx
  loc_005CC472: xor ebx, ebx
  loc_005CC474: mov [edi], ecx
  loc_005CC476: mov ecx, var_AC
  loc_005CC47C: mov eax, 80020004h
  loc_005CC481: mov var_14, ebx
  loc_005CC484: mov [edi+00000004h], ecx
  loc_005CC487: mov var_18, ebx
  loc_005CC48A: mov var_1C, ebx
  loc_005CC48D: mov var_20, ebx
  loc_005CC490: mov var_30, ebx
  loc_005CC493: mov var_40, ebx
  loc_005CC496: mov var_50, ebx
  loc_005CC499: mov var_60, ebx
  loc_005CC49C: mov var_70, ebx
  loc_005CC49F: mov var_80, ebx
  loc_005CC4A2: mov var_90, ebx
  loc_005CC4A8: mov var_A0, ebx
  loc_005CC4AE: mov var_C0, ebx
  loc_005CC4B4: mov var_A8, eax
  loc_005CC4BA: mov esi, [edx]
  loc_005CC4BC: mov [edi+00000008h], eax
  loc_005CC4BF: mov eax, var_A4
  loc_005CC4C5: push 0042BD70h ; "Delete * From Keyconfi"
  loc_005CC4CA: push edx
  loc_005CC4CB: mov [edi+0000000Ch], eax
  loc_005CC4CE: call [esi+0000005Ch]
  loc_005CC4D1: cmp eax, ebx
  loc_005CC4D3: fnclex
  loc_005CC4D5: jge 005CC4ECh
  loc_005CC4D7: mov ecx, [0061A13Ch]
  loc_005CC4DD: push 0000005Ch
  loc_005CC4DF: push 0041E928h
  loc_005CC4E4: push ecx
  loc_005CC4E5: push eax
  loc_005CC4E6: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC4EC: lea edi, var_1C
  loc_005CC4EF: mov ecx, 0000000Ah
  loc_005CC4F4: push edi
  loc_005CC4F5: mov var_C0, ecx
  loc_005CC4FB: sub esp, 00000010h
  loc_005CC4FE: mov eax, 80020004h
  loc_005CC503: mov edi, esp
  loc_005CC505: mov edx, eax
  loc_005CC507: sub esp, 00000010h
  loc_005CC50A: mov var_B8, edx
  loc_005CC510: mov [edi], ecx
  loc_005CC512: mov ecx, var_CC
  loc_005CC518: mov var_B0, 00000003h
  loc_005CC522: mov esi, [0061A13Ch]
  loc_005CC528: mov [edi+00000004h], ecx
  loc_005CC52B: mov ecx, esp
  loc_005CC52D: sub esp, 00000010h
  loc_005CC530: mov var_A8, 00000002h
  loc_005CC53A: mov [edi+00000008h], eax
  loc_005CC53D: mov eax, var_C4
  loc_005CC543: mov esi, [esi]
  loc_005CC545: mov [edi+0000000Ch], eax
  loc_005CC548: mov eax, var_C0
  loc_005CC54E: mov [ecx], eax
  loc_005CC550: mov eax, var_BC
  loc_005CC556: mov [ecx+00000004h], eax
  loc_005CC559: mov eax, esp
  loc_005CC55B: push 0042BDA4h ; "Select * From KeyConfi"
  loc_005CC560: mov [ecx+00000008h], edx
  loc_005CC563: mov edx, var_B4
  loc_005CC569: mov [ecx+0000000Ch], edx
  loc_005CC56C: mov ecx, var_B0
  loc_005CC572: mov edx, var_AC
  loc_005CC578: mov [eax], ecx
  loc_005CC57A: mov ecx, var_A8
  loc_005CC580: mov [eax+00000004h], edx
  loc_005CC583: mov edx, var_A4
  loc_005CC589: mov [eax+00000008h], ecx
  loc_005CC58C: mov [eax+0000000Ch], edx
  loc_005CC58F: mov eax, [0061A13Ch]
  loc_005CC594: push eax
  loc_005CC595: call [esi+000000BCh]
  loc_005CC59B: cmp eax, ebx
  loc_005CC59D: fnclex
  loc_005CC59F: jge 005CC5B9h
  loc_005CC5A1: mov ecx, [0061A13Ch]
  loc_005CC5A7: push 000000BCh
  loc_005CC5AC: push 0041E928h
  loc_005CC5B1: push ecx
  loc_005CC5B2: push eax
  loc_005CC5B3: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC5B9: mov esi, Me
  loc_005CC5BC: mov edx, var_1C
  loc_005CC5BF: push edx
  loc_005CC5C0: lea edi, [esi+00000034h]
  loc_005CC5C3: push edi
  loc_005CC5C4: call [004010B8h] ; __vbaObjSetAddref
  loc_005CC5CA: lea ecx, var_1C
  loc_005CC5CD: call [004012B0h] ; __vbaFreeObj
  loc_005CC5D3: mov eax, [edi]
  loc_005CC5D5: push eax
  loc_005CC5D6: mov ecx, [eax]
  loc_005CC5D8: call [ecx+000000C0h]
  loc_005CC5DE: cmp eax, ebx
  loc_005CC5E0: fnclex
  loc_005CC5E2: jge 005CC5F8h
  loc_005CC5E4: mov edx, [edi]
  loc_005CC5E6: push 000000C0h
  loc_005CC5EB: push 0041E938h
  loc_005CC5F0: push edx
  loc_005CC5F1: push eax
  loc_005CC5F2: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC5F8: mov eax, [esi]
  loc_005CC5FA: push esi
  loc_005CC5FB: call [eax+0000030Ch]
  loc_005CC601: lea ecx, var_1C
  loc_005CC604: push eax
  loc_005CC605: push ecx
  loc_005CC606: call [004010A0h] ; __vbaObjSet
  loc_005CC60C: mov edx, [eax]
  loc_005CC60E: lea ecx, var_14
  loc_005CC611: push ecx
  loc_005CC612: push eax
  loc_005CC613: mov var_E4, eax
  loc_005CC619: call [edx+000000A0h]
  loc_005CC61F: cmp eax, ebx
  loc_005CC621: fnclex
  loc_005CC623: jge 005CC63Dh
  loc_005CC625: mov edx, var_E4
  loc_005CC62B: push 000000A0h
  loc_005CC630: push 0041E5E8h
  loc_005CC635: push edx
  loc_005CC636: push eax
  loc_005CC637: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC63D: mov eax, var_14
  loc_005CC640: lea ecx, var_40
  loc_005CC643: mov var_28, eax
  loc_005CC646: lea eax, var_30
  loc_005CC649: mov var_14, ebx
  loc_005CC64C: mov ebx, [004010D4h] ; rtcTrimVar
  loc_005CC652: push eax
  loc_005CC653: push ecx
  loc_005CC654: mov var_30, 00000008h
  loc_005CC65B: call ebx
  loc_005CC65D: mov eax, [edi]
  loc_005CC65F: mov ecx, var_40
  loc_005CC662: mov var_A8, 0042810Ch ; "Text"
  loc_005CC66C: mov var_B0, 00000008h
  loc_005CC676: mov edx, [eax]
  loc_005CC678: sub esp, 00000010h
  loc_005CC67B: mov eax, esp
  loc_005CC67D: sub esp, 00000010h
  loc_005CC680: mov [eax], ecx
  loc_005CC682: mov ecx, var_3C
  loc_005CC685: mov [eax+00000004h], ecx
  loc_005CC688: mov ecx, var_38
  loc_005CC68B: mov [eax+00000008h], ecx
  loc_005CC68E: mov ecx, var_34
  loc_005CC691: mov [eax+0000000Ch], ecx
  loc_005CC694: mov ecx, var_B0
  loc_005CC69A: mov eax, esp
  loc_005CC69C: mov [eax], ecx
  loc_005CC69E: mov ecx, var_AC
  loc_005CC6A4: mov [eax+00000004h], ecx
  loc_005CC6A7: mov ecx, var_A8
  loc_005CC6AD: mov [eax+00000008h], ecx
  loc_005CC6B0: mov ecx, var_A4
  loc_005CC6B6: mov [eax+0000000Ch], ecx
  loc_005CC6B9: mov eax, [edi]
  loc_005CC6BB: push eax
  loc_005CC6BC: call [edx+00000128h]
  loc_005CC6C2: test eax, eax
  loc_005CC6C4: fnclex
  loc_005CC6C6: jge 005CC6DCh
  loc_005CC6C8: mov edx, [edi]
  loc_005CC6CA: push 00000128h
  loc_005CC6CF: push 0041E938h
  loc_005CC6D4: push edx
  loc_005CC6D5: push eax
  loc_005CC6D6: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC6DC: lea ecx, var_1C
  loc_005CC6DF: call [004012B0h] ; __vbaFreeObj
  loc_005CC6E5: lea eax, var_40
  loc_005CC6E8: lea ecx, var_30
  loc_005CC6EB: push eax
  loc_005CC6EC: push ecx
  loc_005CC6ED: push 00000002h
  loc_005CC6EF: call [00401038h] ; __vbaFreeVarList
  loc_005CC6F5: mov edx, [esi]
  loc_005CC6F7: add esp, 0000000Ch
  loc_005CC6FA: push esi
  loc_005CC6FB: call [edx+00000308h]
  loc_005CC701: push eax
  loc_005CC702: lea eax, var_1C
  loc_005CC705: push eax
  loc_005CC706: call [004010A0h] ; __vbaObjSet
  loc_005CC70C: mov ecx, [eax]
  loc_005CC70E: lea edx, var_14
  loc_005CC711: push edx
  loc_005CC712: push eax
  loc_005CC713: mov var_E4, eax
  loc_005CC719: call [ecx+000000A0h]
  loc_005CC71F: test eax, eax
  loc_005CC721: fnclex
  loc_005CC723: jge 005CC73Dh
  loc_005CC725: mov ecx, var_E4
  loc_005CC72B: push 000000A0h
  loc_005CC730: push 0041E5E8h
  loc_005CC735: push ecx
  loc_005CC736: push eax
  loc_005CC737: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC73D: mov eax, var_14
  loc_005CC740: lea edx, var_30
  loc_005CC743: mov var_28, eax
  loc_005CC746: lea eax, var_40
  loc_005CC749: push edx
  loc_005CC74A: push eax
  loc_005CC74B: mov var_14, 00000000h
  loc_005CC752: mov var_30, 00000008h
  loc_005CC759: call ebx
  loc_005CC75B: mov eax, [edi]
  loc_005CC75D: sub esp, 00000010h
  loc_005CC760: mov var_A8, 0042811Ch ; "Text1"
  loc_005CC76A: mov var_B0, 00000008h
  loc_005CC774: mov ecx, [eax]
  loc_005CC776: mov eax, var_40
  loc_005CC779: mov edx, esp
  loc_005CC77B: sub esp, 00000010h
  loc_005CC77E: mov [edx], eax
  loc_005CC780: mov eax, var_3C
  loc_005CC783: mov [edx+00000004h], eax
  loc_005CC786: mov eax, var_38
  loc_005CC789: mov [edx+00000008h], eax
  loc_005CC78C: mov eax, var_34
  loc_005CC78F: mov [edx+0000000Ch], eax
  loc_005CC792: mov eax, var_B0
  loc_005CC798: mov edx, esp
  loc_005CC79A: mov [edx], eax
  loc_005CC79C: mov eax, var_AC
  loc_005CC7A2: mov [edx+00000004h], eax
  loc_005CC7A5: mov eax, var_A8
  loc_005CC7AB: mov [edx+00000008h], eax
  loc_005CC7AE: mov eax, var_A4
  loc_005CC7B4: mov [edx+0000000Ch], eax
  loc_005CC7B7: mov eax, [edi]
  loc_005CC7B9: push eax
  loc_005CC7BA: call [ecx+00000128h]
  loc_005CC7C0: test eax, eax
  loc_005CC7C2: fnclex
  loc_005CC7C4: jge 005CC7DAh
  loc_005CC7C6: mov ecx, [edi]
  loc_005CC7C8: push 00000128h
  loc_005CC7CD: push 0041E938h
  loc_005CC7D2: push ecx
  loc_005CC7D3: push eax
  loc_005CC7D4: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC7DA: lea ecx, var_1C
  loc_005CC7DD: call [004012B0h] ; __vbaFreeObj
  loc_005CC7E3: lea edx, var_40
  loc_005CC7E6: lea eax, var_30
  loc_005CC7E9: push edx
  loc_005CC7EA: push eax
  loc_005CC7EB: push 00000002h
  loc_005CC7ED: call [00401038h] ; __vbaFreeVarList
  loc_005CC7F3: mov ecx, [esi]
  loc_005CC7F5: add esp, 0000000Ch
  loc_005CC7F8: push esi
  loc_005CC7F9: call [ecx+00000304h]
  loc_005CC7FF: lea edx, var_1C
  loc_005CC802: push eax
  loc_005CC803: push edx
  loc_005CC804: call [004010A0h] ; __vbaObjSet
  loc_005CC80A: mov ecx, [eax]
  loc_005CC80C: lea edx, var_14
  loc_005CC80F: push edx
  loc_005CC810: push eax
  loc_005CC811: mov var_E4, eax
  loc_005CC817: call [ecx+000000A0h]
  loc_005CC81D: test eax, eax
  loc_005CC81F: fnclex
  loc_005CC821: jge 005CC83Bh
  loc_005CC823: mov ecx, var_E4
  loc_005CC829: push 000000A0h
  loc_005CC82E: push 0041E5E8h
  loc_005CC833: push ecx
  loc_005CC834: push eax
  loc_005CC835: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC83B: mov eax, var_14
  loc_005CC83E: lea edx, var_30
  loc_005CC841: mov var_28, eax
  loc_005CC844: lea eax, var_40
  loc_005CC847: push edx
  loc_005CC848: push eax
  loc_005CC849: mov var_14, 00000000h
  loc_005CC850: mov var_30, 00000008h
  loc_005CC857: call ebx
  loc_005CC859: mov eax, [edi]
  loc_005CC85B: sub esp, 00000010h
  loc_005CC85E: mov var_A8, 0042812Ch ; "Text2"
  loc_005CC868: mov var_B0, 00000008h
  loc_005CC872: mov ecx, [eax]
  loc_005CC874: mov eax, var_40
  loc_005CC877: mov edx, esp
  loc_005CC879: sub esp, 00000010h
  loc_005CC87C: mov [edx], eax
  loc_005CC87E: mov eax, var_3C
  loc_005CC881: mov [edx+00000004h], eax
  loc_005CC884: mov eax, var_38
  loc_005CC887: mov [edx+00000008h], eax
  loc_005CC88A: mov eax, var_34
  loc_005CC88D: mov [edx+0000000Ch], eax
  loc_005CC890: mov eax, var_B0
  loc_005CC896: mov edx, esp
  loc_005CC898: mov [edx], eax
  loc_005CC89A: mov eax, var_AC
  loc_005CC8A0: mov [edx+00000004h], eax
  loc_005CC8A3: mov eax, var_A8
  loc_005CC8A9: mov [edx+00000008h], eax
  loc_005CC8AC: mov eax, var_A4
  loc_005CC8B2: mov [edx+0000000Ch], eax
  loc_005CC8B5: mov eax, [edi]
  loc_005CC8B7: push eax
  loc_005CC8B8: call [ecx+00000128h]
  loc_005CC8BE: test eax, eax
  loc_005CC8C0: fnclex
  loc_005CC8C2: jge 005CC8D8h
  loc_005CC8C4: mov ecx, [edi]
  loc_005CC8C6: push 00000128h
  loc_005CC8CB: push 0041E938h
  loc_005CC8D0: push ecx
  loc_005CC8D1: push eax
  loc_005CC8D2: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC8D8: lea ecx, var_1C
  loc_005CC8DB: call [004012B0h] ; __vbaFreeObj
  loc_005CC8E1: lea edx, var_40
  loc_005CC8E4: lea eax, var_30
  loc_005CC8E7: push edx
  loc_005CC8E8: push eax
  loc_005CC8E9: push 00000002h
  loc_005CC8EB: call [00401038h] ; __vbaFreeVarList
  loc_005CC8F1: mov ecx, [esi]
  loc_005CC8F3: add esp, 0000000Ch
  loc_005CC8F6: push esi
  loc_005CC8F7: call [ecx+0000030Ch]
  loc_005CC8FD: lea edx, var_1C
  loc_005CC900: push eax
  loc_005CC901: push edx
  loc_005CC902: call [004010A0h] ; __vbaObjSet
  loc_005CC908: mov edi, eax
  loc_005CC90A: lea ecx, var_14
  loc_005CC90D: push ecx
  loc_005CC90E: push edi
  loc_005CC90F: mov eax, [edi]
  loc_005CC911: call [eax+000000A0h]
  loc_005CC917: test eax, eax
  loc_005CC919: fnclex
  loc_005CC91B: jge 005CC92Fh
  loc_005CC91D: push 000000A0h
  loc_005CC922: push 0041E5E8h
  loc_005CC927: push edi
  loc_005CC928: push eax
  loc_005CC929: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC92F: mov eax, var_14
  loc_005CC932: lea edx, var_30
  loc_005CC935: mov var_28, eax
  loc_005CC938: lea eax, var_40
  loc_005CC93B: push edx
  loc_005CC93C: push eax
  loc_005CC93D: mov var_14, 00000000h
  loc_005CC944: mov var_30, 00000008h
  loc_005CC94B: call ebx
  loc_005CC94D: mov ecx, [esi]
  loc_005CC94F: push esi
  loc_005CC950: call [ecx+0000030Ch]
  loc_005CC956: lea edx, var_20
  loc_005CC959: push eax
  loc_005CC95A: push edx
  loc_005CC95B: call [004010A0h] ; __vbaObjSet
  loc_005CC961: mov edi, eax
  loc_005CC963: lea ecx, var_18
  loc_005CC966: push ecx
  loc_005CC967: push edi
  loc_005CC968: mov eax, [edi]
  loc_005CC96A: call [eax+000000A0h]
  loc_005CC970: test eax, eax
  loc_005CC972: fnclex
  loc_005CC974: jge 005CC988h
  loc_005CC976: push 000000A0h
  loc_005CC97B: push 0041E5E8h
  loc_005CC980: push edi
  loc_005CC981: push eax
  loc_005CC982: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC988: mov eax, var_18
  loc_005CC98B: lea edx, var_60
  loc_005CC98E: mov var_58, eax
  loc_005CC991: lea eax, var_70
  loc_005CC994: mov edi, 00000008h
  loc_005CC999: push edx
  loc_005CC99A: push eax
  loc_005CC99B: mov var_18, 00000000h
  loc_005CC9A2: mov var_60, edi
  loc_005CC9A5: call ebx
  loc_005CC9A7: lea edx, var_C0
  loc_005CC9AD: lea ecx, var_90
  loc_005CC9B3: mov var_B8, 0041E5D4h
  loc_005CC9BD: mov var_C0, edi
  loc_005CC9C3: call [00401240h] ; __vbaVarDup
  loc_005CC9C9: lea ecx, var_40
  loc_005CC9CC: lea edx, var_B0
  loc_005CC9D2: push ecx
  loc_005CC9D3: lea eax, var_50
  loc_005CC9D6: push edx
  loc_005CC9D7: push eax
  loc_005CC9D8: mov var_A8, 0041E5D4h
  loc_005CC9E2: mov var_B0, 00008008h
  loc_005CC9EC: call [00401050h] ; __vbaVarCmpNe
  loc_005CC9F2: mov edi, [00401014h] ; __vbaVarMove
  loc_005CC9F8: mov edx, eax
  loc_005CC9FA: lea ecx, var_80
  loc_005CC9FD: call edi
  loc_005CC9FF: lea ecx, var_90
  loc_005CCA05: lea edx, var_70
  loc_005CCA08: push ecx
  loc_005CCA09: lea eax, var_80
  loc_005CCA0C: push edx
  loc_005CCA0D: lea ecx, var_A0
  loc_005CCA13: push eax
  loc_005CCA14: push ecx
  loc_005CCA15: call [004011F0h] ; rtcImmediateIf
  loc_005CCA1B: lea edx, var_A0
  loc_005CCA21: mov ecx, 0061A0C8h
  loc_005CCA26: call edi
  loc_005CCA28: lea edx, var_20
  loc_005CCA2B: lea eax, var_1C
  loc_005CCA2E: push edx
  loc_005CCA2F: push eax
  loc_005CCA30: push 00000002h
  loc_005CCA32: call [00401040h] ; __vbaFreeObjList
  loc_005CCA38: lea ecx, var_90
  loc_005CCA3E: lea edx, var_70
  loc_005CCA41: push ecx
  loc_005CCA42: lea eax, var_80
  loc_005CCA45: push edx
  loc_005CCA46: lea ecx, var_60
  loc_005CCA49: push eax
  loc_005CCA4A: lea edx, var_40
  loc_005CCA4D: push ecx
  loc_005CCA4E: lea eax, var_30
  loc_005CCA51: push edx
  loc_005CCA52: push eax
  loc_005CCA53: push 00000006h
  loc_005CCA55: call [00401038h] ; __vbaFreeVarList
  loc_005CCA5B: mov ecx, [esi]
  loc_005CCA5D: add esp, 00000028h
  loc_005CCA60: push esi
  loc_005CCA61: call [ecx+00000308h]
  loc_005CCA67: lea edx, var_1C
  loc_005CCA6A: push eax
  loc_005CCA6B: push edx
  loc_005CCA6C: call [004010A0h] ; __vbaObjSet
  loc_005CCA72: mov ecx, [eax]
  loc_005CCA74: lea edx, var_14
  loc_005CCA77: push edx
  loc_005CCA78: push eax
  loc_005CCA79: mov var_E4, eax
  loc_005CCA7F: call [ecx+000000A0h]
  loc_005CCA85: test eax, eax
  loc_005CCA87: fnclex
  loc_005CCA89: jge 005CCAA3h
  loc_005CCA8B: mov ecx, var_E4
  loc_005CCA91: push 000000A0h
  loc_005CCA96: push 0041E5E8h
  loc_005CCA9B: push ecx
  loc_005CCA9C: push eax
  loc_005CCA9D: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCAA3: mov eax, var_14
  loc_005CCAA6: lea edx, var_30
  loc_005CCAA9: mov var_28, eax
  loc_005CCAAC: lea eax, var_40
  loc_005CCAAF: push edx
  loc_005CCAB0: push eax
  loc_005CCAB1: mov var_14, 00000000h
  loc_005CCAB8: mov var_30, 00000008h
  loc_005CCABF: call ebx
  loc_005CCAC1: mov ecx, [esi]
  loc_005CCAC3: push esi
  loc_005CCAC4: call [ecx+00000308h]
  loc_005CCACA: lea edx, var_20
  loc_005CCACD: push eax
  loc_005CCACE: push edx
  loc_005CCACF: call [004010A0h] ; __vbaObjSet
  loc_005CCAD5: mov ecx, [eax]
  loc_005CCAD7: lea edx, var_18
  loc_005CCADA: push edx
  loc_005CCADB: push eax
  loc_005CCADC: mov var_EC, eax
  loc_005CCAE2: call [ecx+000000A0h]
  loc_005CCAE8: test eax, eax
  loc_005CCAEA: fnclex
  loc_005CCAEC: jge 005CCB06h
  loc_005CCAEE: mov ecx, var_EC
  loc_005CCAF4: push 000000A0h
  loc_005CCAF9: push 0041E5E8h
  loc_005CCAFE: push ecx
  loc_005CCAFF: push eax
  loc_005CCB00: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCB06: mov eax, var_18
  loc_005CCB09: lea edx, var_60
  loc_005CCB0C: mov var_58, eax
  loc_005CCB0F: lea eax, var_70
  loc_005CCB12: push edx
  loc_005CCB13: push eax
  loc_005CCB14: mov var_18, 00000000h
  loc_005CCB1B: mov var_60, 00000008h
  loc_005CCB22: call ebx
  loc_005CCB24: lea edx, var_C0
  loc_005CCB2A: lea ecx, var_90
  loc_005CCB30: mov var_B8, 0041E5D4h
  loc_005CCB3A: mov var_C0, 00000008h
  loc_005CCB44: call [00401240h] ; __vbaVarDup
  loc_005CCB4A: lea ecx, var_40
  loc_005CCB4D: lea edx, var_B0
  loc_005CCB53: push ecx
  loc_005CCB54: lea eax, var_50
  loc_005CCB57: push edx
  loc_005CCB58: push eax
  loc_005CCB59: mov var_A8, 0041E5D4h
  loc_005CCB63: mov var_B0, 00008008h
  loc_005CCB6D: call [00401050h] ; __vbaVarCmpNe
  loc_005CCB73: mov edx, eax
  loc_005CCB75: lea ecx, var_80
  loc_005CCB78: call edi
  loc_005CCB7A: lea ecx, var_90
  loc_005CCB80: lea edx, var_70
  loc_005CCB83: push ecx
  loc_005CCB84: lea eax, var_80
  loc_005CCB87: push edx
  loc_005CCB88: lea ecx, var_A0
  loc_005CCB8E: push eax
  loc_005CCB8F: push ecx
  loc_005CCB90: call [004011F0h] ; rtcImmediateIf
  loc_005CCB96: lea edx, var_A0
  loc_005CCB9C: mov ecx, 0061A0D8h
  loc_005CCBA1: call edi
  loc_005CCBA3: lea edx, var_20
  loc_005CCBA6: lea eax, var_1C
  loc_005CCBA9: push edx
  loc_005CCBAA: push eax
  loc_005CCBAB: push 00000002h
  loc_005CCBAD: call [00401040h] ; __vbaFreeObjList
  loc_005CCBB3: lea ecx, var_90
  loc_005CCBB9: lea edx, var_70
  loc_005CCBBC: push ecx
  loc_005CCBBD: lea eax, var_80
  loc_005CCBC0: push edx
  loc_005CCBC1: lea ecx, var_60
  loc_005CCBC4: push eax
  loc_005CCBC5: lea edx, var_40
  loc_005CCBC8: push ecx
  loc_005CCBC9: lea eax, var_30
  loc_005CCBCC: push edx
  loc_005CCBCD: push eax
  loc_005CCBCE: push 00000006h
  loc_005CCBD0: call [00401038h] ; __vbaFreeVarList
  loc_005CCBD6: mov ecx, [esi]
  loc_005CCBD8: add esp, 00000028h
  loc_005CCBDB: push esi
  loc_005CCBDC: call [ecx+00000304h]
  loc_005CCBE2: lea edx, var_1C
  loc_005CCBE5: push eax
  loc_005CCBE6: push edx
  loc_005CCBE7: call [004010A0h] ; __vbaObjSet
  loc_005CCBED: mov ecx, [eax]
  loc_005CCBEF: lea edx, var_14
  loc_005CCBF2: push edx
  loc_005CCBF3: push eax
  loc_005CCBF4: mov var_E4, eax
  loc_005CCBFA: call [ecx+000000A0h]
  loc_005CCC00: test eax, eax
  loc_005CCC02: fnclex
  loc_005CCC04: jge 005CCC1Eh
  loc_005CCC06: mov ecx, var_E4
  loc_005CCC0C: push 000000A0h
  loc_005CCC11: push 0041E5E8h
  loc_005CCC16: push ecx
  loc_005CCC17: push eax
  loc_005CCC18: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCC1E: mov eax, var_14
  loc_005CCC21: lea edx, var_30
  loc_005CCC24: mov var_28, eax
  loc_005CCC27: lea eax, var_40
  loc_005CCC2A: push edx
  loc_005CCC2B: push eax
  loc_005CCC2C: mov var_14, 00000000h
  loc_005CCC33: mov var_30, 00000008h
  loc_005CCC3A: call ebx
  loc_005CCC3C: mov ecx, [esi]
  loc_005CCC3E: push esi
  loc_005CCC3F: call [ecx+00000304h]
  loc_005CCC45: lea edx, var_20
  loc_005CCC48: push eax
  loc_005CCC49: push edx
  loc_005CCC4A: call [004010A0h] ; __vbaObjSet
  loc_005CCC50: mov ecx, [eax]
  loc_005CCC52: lea edx, var_18
  loc_005CCC55: push edx
  loc_005CCC56: push eax
  loc_005CCC57: mov var_EC, eax
  loc_005CCC5D: call [ecx+000000A0h]
  loc_005CCC63: test eax, eax
  loc_005CCC65: fnclex
  loc_005CCC67: jge 005CCC81h
  loc_005CCC69: mov ecx, var_EC
  loc_005CCC6F: push 000000A0h
  loc_005CCC74: push 0041E5E8h
  loc_005CCC79: push ecx
  loc_005CCC7A: push eax
  loc_005CCC7B: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCC81: mov eax, var_18
  loc_005CCC84: lea edx, var_60
  loc_005CCC87: mov var_58, eax
  loc_005CCC8A: lea eax, var_70
  loc_005CCC8D: push edx
  loc_005CCC8E: push eax
  loc_005CCC8F: mov var_18, 00000000h
  loc_005CCC96: mov var_60, 00000008h
  loc_005CCC9D: call ebx
  loc_005CCC9F: mov ebx, [00401240h] ; __vbaVarDup
  loc_005CCCA5: lea edx, var_C0
  loc_005CCCAB: lea ecx, var_90
  loc_005CCCB1: mov var_B8, 0041E5D4h
  loc_005CCCBB: mov var_C0, 00000008h
  loc_005CCCC5: call ebx
  loc_005CCCC7: lea ecx, var_40
  loc_005CCCCA: lea edx, var_B0
  loc_005CCCD0: push ecx
  loc_005CCCD1: lea eax, var_50
  loc_005CCCD4: push edx
  loc_005CCCD5: push eax
  loc_005CCCD6: mov var_A8, 0041E5D4h
  loc_005CCCE0: mov var_B0, 00008008h
  loc_005CCCEA: call [00401050h] ; __vbaVarCmpNe
  loc_005CCCF0: mov edx, eax
  loc_005CCCF2: lea ecx, var_80
  loc_005CCCF5: call edi
  loc_005CCCF7: lea ecx, var_90
  loc_005CCCFD: lea edx, var_70
  loc_005CCD00: push ecx
  loc_005CCD01: lea eax, var_80
  loc_005CCD04: push edx
  loc_005CCD05: lea ecx, var_A0
  loc_005CCD0B: push eax
  loc_005CCD0C: push ecx
  loc_005CCD0D: call [004011F0h] ; rtcImmediateIf
  loc_005CCD13: lea edx, var_A0
  loc_005CCD19: push edx
  loc_005CCD1A: call [00401028h] ; __vbaStrVarMove
  loc_005CCD20: push eax
  loc_005CCD21: push 0061A0E8h
  loc_005CCD26: push 00000005h
  loc_005CCD28: call [004011BCh] ; __vbaLsetFixstrFree
  loc_005CCD2E: lea eax, var_20
  loc_005CCD31: lea ecx, var_1C
  loc_005CCD34: push eax
  loc_005CCD35: push ecx
  loc_005CCD36: push 00000002h
  loc_005CCD38: call [00401040h] ; __vbaFreeObjList
  loc_005CCD3E: lea edx, var_A0
  loc_005CCD44: lea eax, var_90
  loc_005CCD4A: push edx
  loc_005CCD4B: lea ecx, var_70
  loc_005CCD4E: push eax
  loc_005CCD4F: lea edx, var_80
  loc_005CCD52: push ecx
  loc_005CCD53: lea eax, var_60
  loc_005CCD56: push edx
  loc_005CCD57: lea ecx, var_40
  loc_005CCD5A: push eax
  loc_005CCD5B: lea edx, var_30
  loc_005CCD5E: push ecx
  loc_005CCD5F: push edx
  loc_005CCD60: push 00000007h
  loc_005CCD62: call [00401038h] ; __vbaFreeVarList
  loc_005CCD68: mov eax, [esi+00000034h]
  loc_005CCD6B: lea edi, [esi+00000034h]
  loc_005CCD6E: add esp, 0000002Ch
  loc_005CCD71: mov ecx, [eax]
  loc_005CCD73: push 00000000h
  loc_005CCD75: push 00000001h
  loc_005CCD77: push eax
  loc_005CCD78: call [ecx+00000164h]
  loc_005CCD7E: test eax, eax
  loc_005CCD80: fnclex
  loc_005CCD82: jge 005CCD98h
  loc_005CCD84: mov edx, [edi]
  loc_005CCD86: push 00000164h
  loc_005CCD8B: push 0041E938h
  loc_005CCD90: push edx
  loc_005CCD91: push eax
  loc_005CCD92: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCD98: mov eax, [edi]
  loc_005CCD9A: push eax
  loc_005CCD9B: mov ecx, [eax]
  loc_005CCD9D: call [ecx+000000C4h]
  loc_005CCDA3: test eax, eax
  loc_005CCDA5: fnclex
  loc_005CCDA7: jge 005CCDBDh
  loc_005CCDA9: mov edx, [edi]
  loc_005CCDAB: push 000000C4h
  loc_005CCDB0: push 0041E938h
  loc_005CCDB5: push edx
  loc_005CCDB6: push eax
  loc_005CCDB7: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCDBD: push 0041E938h
  loc_005CCDC2: push 00000000h
  loc_005CCDC4: call [00401274h] ; __vbaCastObj
  loc_005CCDCA: push eax
  loc_005CCDCB: lea eax, var_1C
  loc_005CCDCE: push eax
  loc_005CCDCF: call [004010A0h] ; __vbaObjSet
  loc_005CCDD5: push eax
  loc_005CCDD6: push edi
  loc_005CCDD7: call [004010B8h] ; __vbaObjSetAddref
  loc_005CCDDD: lea ecx, var_1C
  loc_005CCDE0: call [004012B0h] ; __vbaFreeObj
  loc_005CCDE6: mov ecx, 80020004h
  loc_005CCDEB: mov eax, 0000000Ah
  loc_005CCDF0: mov var_58, ecx
  loc_005CCDF3: mov var_48, ecx
  loc_005CCDF6: mov var_38, ecx
  loc_005CCDF9: lea edx, var_B0
  loc_005CCDFF: lea ecx, var_30
  loc_005CCE02: mov var_60, eax
  loc_005CCE05: mov var_50, eax
  loc_005CCE08: mov var_40, eax
  loc_005CCE0B: mov var_A8, 0041F378h ; "Save Successfully."
  loc_005CCE15: mov var_B0, 00000008h
  loc_005CCE1F: call ebx
  loc_005CCE21: lea ecx, var_60
  loc_005CCE24: lea edx, var_50
  loc_005CCE27: push ecx
  loc_005CCE28: lea eax, var_40
  loc_005CCE2B: push edx
  loc_005CCE2C: push eax
  loc_005CCE2D: lea ecx, var_30
  loc_005CCE30: push 00000040h
  loc_005CCE32: push ecx
  loc_005CCE33: call [004010A4h] ; rtcMsgBox
  loc_005CCE39: lea edx, var_60
  loc_005CCE3C: lea eax, var_50
  loc_005CCE3F: push edx
  loc_005CCE40: lea ecx, var_40
  loc_005CCE43: push eax
  loc_005CCE44: lea edx, var_30
  loc_005CCE47: push ecx
  loc_005CCE48: push edx
  loc_005CCE49: push 00000004h
  loc_005CCE4B: call [00401038h] ; __vbaFreeVarList
  loc_005CCE51: mov eax, [0061B394h]
  loc_005CCE56: add esp, 00000014h
  loc_005CCE59: test eax, eax
  loc_005CCE5B: jnz 005CCE6Dh
  loc_005CCE5D: push 0061B394h
  loc_005CCE62: push 0041E4A0h
  loc_005CCE67: call [004011DCh] ; __vbaNew2
  loc_005CCE6D: mov edi, [0061B394h]
  loc_005CCE73: lea eax, var_1C
  loc_005CCE76: push esi
  loc_005CCE77: push eax
  loc_005CCE78: mov ebx, [edi]
  loc_005CCE7A: call [004010B8h] ; __vbaObjSetAddref
  loc_005CCE80: push eax
  loc_005CCE81: push edi
  loc_005CCE82: call [ebx+00000010h]
  loc_005CCE85: test eax, eax
  loc_005CCE87: fnclex
  loc_005CCE89: jge 005CCE9Ah
  loc_005CCE8B: push 00000010h
  loc_005CCE8D: push 0041E490h
  loc_005CCE92: push edi
  loc_005CCE93: push eax
  loc_005CCE94: call [00401074h] ; __vbaHresultCheckObj
  loc_005CCE9A: lea ecx, var_1C
  loc_005CCE9D: call [004012B0h] ; __vbaFreeObj
  loc_005CCEA3: push 005CCEFDh
  loc_005CCEA8: jmp 005CCEFCh
  loc_005CCEAA: lea ecx, var_18
  loc_005CCEAD: lea edx, var_14
  loc_005CCEB0: push ecx
  loc_005CCEB1: push edx
  loc_005CCEB2: push 00000002h
  loc_005CCEB4: call [004011FCh] ; __vbaFreeStrList
  loc_005CCEBA: lea eax, var_20
  loc_005CCEBD: lea ecx, var_1C
  loc_005CCEC0: push eax
  loc_005CCEC1: push ecx
  loc_005CCEC2: push 00000002h
  loc_005CCEC4: call [00401040h] ; __vbaFreeObjList
  loc_005CCECA: lea edx, var_A0
  loc_005CCED0: lea eax, var_90
  loc_005CCED6: push edx
  loc_005CCED7: lea ecx, var_80
  loc_005CCEDA: push eax
  loc_005CCEDB: lea edx, var_70
  loc_005CCEDE: push ecx
  loc_005CCEDF: lea eax, var_60
  loc_005CCEE2: push edx
  loc_005CCEE3: lea ecx, var_50
  loc_005CCEE6: push eax
  loc_005CCEE7: lea edx, var_40
  loc_005CCEEA: push ecx
  loc_005CCEEB: lea eax, var_30
  loc_005CCEEE: push edx
  loc_005CCEEF: push eax
  loc_005CCEF0: push 00000008h
  loc_005CCEF2: call [00401038h] ; __vbaFreeVarList
  loc_005CCEF8: add esp, 0000003Ch
  loc_005CCEFB: ret
  loc_005CCEFC: ret
  loc_005CCEFD: mov ecx, var_10
  loc_005CCF00: pop edi
  loc_005CCF01: pop esi
  loc_005CCF02: xor eax, eax
  loc_005CCF04: mov fs:[00000000h], ecx
  loc_005CCF0B: pop ebx
  loc_005CCF0C: mov esp, ebp
  loc_005CCF0E: pop ebp
  loc_005CCF0F: retn 0004h
End Sub

Private Sub Proc_22_7_5CCF20() '5CCF20
  loc_005CCF20: push ebp
  loc_005CCF21: mov ebp, esp
  loc_005CCF23: sub esp, 00000008h
  loc_005CCF26: push 00403B36h ; __vbaExceptHandler
  loc_005CCF2B: mov eax, fs:[00000000h]
  loc_005CCF31: push eax
  loc_005CCF32: mov fs:[00000000h], esp
  loc_005CCF39: sub esp, 00000098h
  loc_005CCF3F: push ebx
  loc_005CCF40: push esi
  loc_005CCF41: push edi
  loc_005CCF42: mov var_8, esp
  loc_005CCF45: mov var_4, 00403128h
  loc_005CCF4C: lea ebx, var_18
  loc_005CCF4F: mov ecx, 0000000Ah
  loc_005CCF54: push ebx
  loc_005CCF55: mov var_60, ecx
  loc_005CCF58: sub esp, 00000010h
  loc_005CCF5B: mov eax, 80020004h
  loc_005CCF60: mov ebx, esp
  loc_005CCF62: mov edx, eax
  loc_005CCF64: sub esp, 00000010h
  loc_005CCF67: mov esi, [0061A13Ch]
  loc_005CCF6D: mov [ebx], ecx
  loc_005CCF6F: mov ecx, var_6C
  loc_005CCF72: xor edi, edi
  loc_005CCF74: mov [ebx+00000004h], ecx
  loc_005CCF77: mov ecx, esp
  loc_005CCF79: sub esp, 00000010h
  loc_005CCF7C: mov var_14, edi
  loc_005CCF7F: mov [ebx+00000008h], eax
  loc_005CCF82: mov eax, var_64
  loc_005CCF85: mov var_18, edi
  loc_005CCF88: mov var_1C, edi
  loc_005CCF8B: mov [ebx+0000000Ch], eax
  loc_005CCF8E: mov eax, var_60
  loc_005CCF91: mov [ecx], eax
  loc_005CCF93: mov eax, var_5C
  loc_005CCF96: mov var_20, edi
  loc_005CCF99: mov var_30, edi
  loc_005CCF9C: mov [ecx+00000004h], eax
  loc_005CCF9F: mov eax, 00000003h
  loc_005CCFA4: mov var_40, edi
  loc_005CCFA7: mov var_74, edi
  loc_005CCFAA: mov [ecx+00000008h], edx
  loc_005CCFAD: mov edx, var_54
  loc_005CCFB0: mov var_78, edi
  loc_005CCFB3: mov esi, [esi]
  loc_005CCFB5: mov [ecx+0000000Ch], edx
  loc_005CCFB8: mov edx, var_4C
  loc_005CCFBB: mov ecx, esp
  loc_005CCFBD: push 004280D8h ; "Select * from KeyConfi"
  loc_005CCFC2: mov [ecx], eax
  loc_005CCFC4: mov eax, 00000004h
  loc_005CCFC9: mov [ecx+00000004h], edx
  loc_005CCFCC: mov [ecx+00000008h], eax
  loc_005CCFCF: mov eax, var_44
  loc_005CCFD2: mov [ecx+0000000Ch], eax
  loc_005CCFD5: mov ecx, [0061A13Ch]
  loc_005CCFDB: push ecx
  loc_005CCFDC: call [esi+000000BCh]
  loc_005CCFE2: cmp eax, edi
  loc_005CCFE4: fnclex
  loc_005CCFE6: jge 005CD000h
  loc_005CCFE8: mov edx, [0061A13Ch]
  loc_005CCFEE: push 000000BCh
  loc_005CCFF3: push 0041E928h
  loc_005CCFF8: push edx
  loc_005CCFF9: push eax
  loc_005CCFFA: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD000: mov ebx, Me
  loc_005CD003: mov eax, var_18
  loc_005CD006: push eax
  loc_005CD007: lea esi, [ebx+00000034h]
  loc_005CD00A: push esi
  loc_005CD00B: call [004010B8h] ; __vbaObjSetAddref
  loc_005CD011: lea ecx, var_18
  loc_005CD014: call [004012B0h] ; __vbaFreeObj
  loc_005CD01A: mov eax, [esi]
  loc_005CD01C: lea edx, var_74
  loc_005CD01F: push edx
  loc_005CD020: push eax
  loc_005CD021: mov ecx, [eax]
  loc_005CD023: call [ecx+00000020h]
  loc_005CD026: cmp eax, edi
  loc_005CD028: fnclex
  loc_005CD02A: jge 005CD03Dh
  loc_005CD02C: mov ecx, [esi]
  loc_005CD02E: push 00000020h
  loc_005CD030: push 0041E938h
  loc_005CD035: push ecx
  loc_005CD036: push eax
  loc_005CD037: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD03D: mov eax, [esi]
  loc_005CD03F: lea ecx, var_78
  loc_005CD042: push ecx
  loc_005CD043: push eax
  loc_005CD044: mov edx, [eax]
  loc_005CD046: call [edx+00000034h]
  loc_005CD049: cmp eax, edi
  loc_005CD04B: fnclex
  loc_005CD04D: jge 005CD060h
  loc_005CD04F: mov edx, [esi]
  loc_005CD051: push 00000034h
  loc_005CD053: push 0041E938h
  loc_005CD058: push edx
  loc_005CD059: push eax
  loc_005CD05A: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD060: xor eax, eax
  loc_005CD062: cmp var_78, di
  loc_005CD066: setz al
  loc_005CD069: xor ecx, ecx
  loc_005CD06B: cmp var_74, di
  loc_005CD06F: setz cl
  loc_005CD072: or eax, ecx
  loc_005CD074: jz 005CD3B9h
  loc_005CD07A: mov edx, [ebx]
  loc_005CD07C: push ebx
  loc_005CD07D: call [edx+0000030Ch]
  loc_005CD083: push eax
  loc_005CD084: lea eax, var_20
  loc_005CD087: push eax
  loc_005CD088: call [004010A0h] ; __vbaObjSet
  loc_005CD08E: mov var_88, eax
  loc_005CD094: mov eax, [esi]
  loc_005CD096: lea edx, var_18
  loc_005CD099: mov ecx, [eax]
  loc_005CD09B: push edx
  loc_005CD09C: push eax
  loc_005CD09D: call [ecx+000000B4h]
  loc_005CD0A3: cmp eax, edi
  loc_005CD0A5: fnclex
  loc_005CD0A7: jge 005CD0BDh
  loc_005CD0A9: mov ecx, [esi]
  loc_005CD0AB: push 000000B4h
  loc_005CD0B0: push 0041E938h
  loc_005CD0B5: push ecx
  loc_005CD0B6: push eax
  loc_005CD0B7: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD0BD: lea ebx, var_1C
  loc_005CD0C0: mov eax, var_18
  loc_005CD0C3: push ebx
  loc_005CD0C4: mov ecx, 00000008h
  loc_005CD0C9: sub esp, 00000010h
  loc_005CD0CC: mov edx, [eax]
  loc_005CD0CE: mov ebx, esp
  loc_005CD0D0: mov var_80, eax
  loc_005CD0D3: push eax
  loc_005CD0D4: mov [ebx], ecx
  loc_005CD0D6: mov ecx, var_4C
  loc_005CD0D9: mov [ebx+00000004h], ecx
  loc_005CD0DC: mov ecx, 0042810Ch ; "Text"
  loc_005CD0E1: mov [ebx+00000008h], ecx
  loc_005CD0E4: mov ecx, var_44
  loc_005CD0E7: mov [ebx+0000000Ch], ecx
  loc_005CD0EA: call [edx+00000030h]
  loc_005CD0ED: cmp eax, edi
  loc_005CD0EF: fnclex
  loc_005CD0F1: jge 005CD105h
  loc_005CD0F3: mov edx, var_80
  loc_005CD0F6: push 00000030h
  loc_005CD0F8: push 0041EA14h ; "S"
  loc_005CD0FD: push edx
  loc_005CD0FE: push eax
  loc_005CD0FF: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD105: mov eax, var_1C
  loc_005CD108: lea ecx, var_40
  loc_005CD10B: mov var_28, eax
  loc_005CD10E: lea eax, var_30
  loc_005CD111: push eax
  loc_005CD112: push ecx
  loc_005CD113: mov var_1C, edi
  loc_005CD116: mov var_30, 00000009h
  loc_005CD11D: call [004010D4h] ; rtcTrimVar
  loc_005CD123: mov edx, var_88
  loc_005CD129: lea eax, var_40
  loc_005CD12C: lea ecx, var_14
  loc_005CD12F: push eax
  loc_005CD130: mov ebx, [edx]
  loc_005CD132: push ecx
  loc_005CD133: call [004011B0h] ; __vbaStrVarVal
  loc_005CD139: mov edx, ebx
  loc_005CD13B: mov ebx, var_88
  loc_005CD141: push eax
  loc_005CD142: push ebx
  loc_005CD143: call [edx+000000A4h]
  loc_005CD149: cmp eax, edi
  loc_005CD14B: fnclex
  loc_005CD14D: jge 005CD161h
  loc_005CD14F: push 000000A4h
  loc_005CD154: push 0041E5E8h
  loc_005CD159: push ebx
  loc_005CD15A: push eax
  loc_005CD15B: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD161: lea ecx, var_14
  loc_005CD164: call [004012ACh] ; __vbaFreeStr
  loc_005CD16A: lea eax, var_20
  loc_005CD16D: lea ecx, var_18
  loc_005CD170: push eax
  loc_005CD171: push ecx
  loc_005CD172: push 00000002h
  loc_005CD174: call [00401040h] ; __vbaFreeObjList
  loc_005CD17A: lea edx, var_40
  loc_005CD17D: lea eax, var_30
  loc_005CD180: push edx
  loc_005CD181: push eax
  loc_005CD182: push 00000002h
  loc_005CD184: call [00401038h] ; __vbaFreeVarList
  loc_005CD18A: mov eax, Me
  loc_005CD18D: add esp, 00000018h
  loc_005CD190: mov ecx, [eax]
  loc_005CD192: push eax
  loc_005CD193: call [ecx+00000308h]
  loc_005CD199: lea edx, var_20
  loc_005CD19C: push eax
  loc_005CD19D: push edx
  loc_005CD19E: call [004010A0h] ; __vbaObjSet
  loc_005CD1A4: mov var_88, eax
  loc_005CD1AA: mov eax, [esi]
  loc_005CD1AC: lea edx, var_18
  loc_005CD1AF: mov ecx, [eax]
  loc_005CD1B1: push edx
  loc_005CD1B2: push eax
  loc_005CD1B3: call [ecx+000000B4h]
  loc_005CD1B9: cmp eax, edi
  loc_005CD1BB: fnclex
  loc_005CD1BD: jge 005CD1D3h
  loc_005CD1BF: mov ecx, [esi]
  loc_005CD1C1: push 000000B4h
  loc_005CD1C6: push 0041E938h
  loc_005CD1CB: push ecx
  loc_005CD1CC: push eax
  loc_005CD1CD: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD1D3: lea ebx, var_1C
  loc_005CD1D6: mov eax, var_18
  loc_005CD1D9: push ebx
  loc_005CD1DA: mov ecx, 00000008h
  loc_005CD1DF: sub esp, 00000010h
  loc_005CD1E2: mov edx, [eax]
  loc_005CD1E4: mov ebx, esp
  loc_005CD1E6: mov var_80, eax
  loc_005CD1E9: push eax
  loc_005CD1EA: mov [ebx], ecx
  loc_005CD1EC: mov ecx, var_4C
  loc_005CD1EF: mov [ebx+00000004h], ecx
  loc_005CD1F2: mov ecx, 0042811Ch ; "Text1"
  loc_005CD1F7: mov [ebx+00000008h], ecx
  loc_005CD1FA: mov ecx, var_44
  loc_005CD1FD: mov [ebx+0000000Ch], ecx
  loc_005CD200: call [edx+00000030h]
  loc_005CD203: cmp eax, edi
  loc_005CD205: fnclex
  loc_005CD207: jge 005CD21Bh
  loc_005CD209: mov edx, var_80
  loc_005CD20C: push 00000030h
  loc_005CD20E: push 0041EA14h ; "S"
  loc_005CD213: push edx
  loc_005CD214: push eax
  loc_005CD215: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD21B: mov eax, var_1C
  loc_005CD21E: lea ecx, var_40
  loc_005CD221: mov var_28, eax
  loc_005CD224: lea eax, var_30
  loc_005CD227: push eax
  loc_005CD228: push ecx
  loc_005CD229: mov var_1C, edi
  loc_005CD22C: mov var_30, 00000009h
  loc_005CD233: call [004010D4h] ; rtcTrimVar
  loc_005CD239: mov edx, var_88
  loc_005CD23F: lea eax, var_40
  loc_005CD242: lea ecx, var_14
  loc_005CD245: push eax
  loc_005CD246: mov ebx, [edx]
  loc_005CD248: push ecx
  loc_005CD249: call [004011B0h] ; __vbaStrVarVal
  loc_005CD24F: mov edx, ebx
  loc_005CD251: mov ebx, var_88
  loc_005CD257: push eax
  loc_005CD258: push ebx
  loc_005CD259: call [edx+000000A4h]
  loc_005CD25F: cmp eax, edi
  loc_005CD261: fnclex
  loc_005CD263: jge 005CD277h
  loc_005CD265: push 000000A4h
  loc_005CD26A: push 0041E5E8h
  loc_005CD26F: push ebx
  loc_005CD270: push eax
  loc_005CD271: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD277: lea ecx, var_14
  loc_005CD27A: call [004012ACh] ; __vbaFreeStr
  loc_005CD280: lea eax, var_20
  loc_005CD283: lea ecx, var_18
  loc_005CD286: push eax
  loc_005CD287: push ecx
  loc_005CD288: push 00000002h
  loc_005CD28A: call [00401040h] ; __vbaFreeObjList
  loc_005CD290: lea edx, var_40
  loc_005CD293: lea eax, var_30
  loc_005CD296: push edx
  loc_005CD297: push eax
  loc_005CD298: push 00000002h
  loc_005CD29A: call [00401038h] ; __vbaFreeVarList
  loc_005CD2A0: mov eax, Me
  loc_005CD2A3: add esp, 00000018h
  loc_005CD2A6: mov ecx, [eax]
  loc_005CD2A8: push eax
  loc_005CD2A9: call [ecx+00000304h]
  loc_005CD2AF: lea edx, var_20
  loc_005CD2B2: push eax
  loc_005CD2B3: push edx
  loc_005CD2B4: call [004010A0h] ; __vbaObjSet
  loc_005CD2BA: mov var_88, eax
  loc_005CD2C0: mov eax, [esi]
  loc_005CD2C2: lea edx, var_18
  loc_005CD2C5: mov ecx, [eax]
  loc_005CD2C7: push edx
  loc_005CD2C8: push eax
  loc_005CD2C9: call [ecx+000000B4h]
  loc_005CD2CF: cmp eax, edi
  loc_005CD2D1: fnclex
  loc_005CD2D3: jge 005CD2E9h
  loc_005CD2D5: mov ecx, [esi]
  loc_005CD2D7: push 000000B4h
  loc_005CD2DC: push 0041E938h
  loc_005CD2E1: push ecx
  loc_005CD2E2: push eax
  loc_005CD2E3: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD2E9: lea ebx, var_1C
  loc_005CD2EC: mov eax, var_18
  loc_005CD2EF: push ebx
  loc_005CD2F0: mov ecx, 00000008h
  loc_005CD2F5: sub esp, 00000010h
  loc_005CD2F8: mov edx, [eax]
  loc_005CD2FA: mov ebx, esp
  loc_005CD2FC: mov var_80, eax
  loc_005CD2FF: push eax
  loc_005CD300: mov [ebx], ecx
  loc_005CD302: mov ecx, var_4C
  loc_005CD305: mov [ebx+00000004h], ecx
  loc_005CD308: mov ecx, 0042812Ch ; "Text2"
  loc_005CD30D: mov [ebx+00000008h], ecx
  loc_005CD310: mov ecx, var_44
  loc_005CD313: mov [ebx+0000000Ch], ecx
  loc_005CD316: call [edx+00000030h]
  loc_005CD319: cmp eax, edi
  loc_005CD31B: fnclex
  loc_005CD31D: jge 005CD331h
  loc_005CD31F: mov edx, var_80
  loc_005CD322: push 00000030h
  loc_005CD324: push 0041EA14h ; "S"
  loc_005CD329: push edx
  loc_005CD32A: push eax
  loc_005CD32B: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD331: mov eax, var_1C
  loc_005CD334: lea ecx, var_40
  loc_005CD337: mov var_28, eax
  loc_005CD33A: lea eax, var_30
  loc_005CD33D: push eax
  loc_005CD33E: push ecx
  loc_005CD33F: mov var_1C, edi
  loc_005CD342: mov var_30, 00000009h
  loc_005CD349: call [004010D4h] ; rtcTrimVar
  loc_005CD34F: mov edx, var_88
  loc_005CD355: lea eax, var_40
  loc_005CD358: lea ecx, var_14
  loc_005CD35B: push eax
  loc_005CD35C: mov ebx, [edx]
  loc_005CD35E: push ecx
  loc_005CD35F: call [004011B0h] ; __vbaStrVarVal
  loc_005CD365: mov edx, ebx
  loc_005CD367: mov ebx, var_88
  loc_005CD36D: push eax
  loc_005CD36E: push ebx
  loc_005CD36F: call [edx+000000A4h]
  loc_005CD375: cmp eax, edi
  loc_005CD377: fnclex
  loc_005CD379: jge 005CD38Dh
  loc_005CD37B: push 000000A4h
  loc_005CD380: push 0041E5E8h
  loc_005CD385: push ebx
  loc_005CD386: push eax
  loc_005CD387: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD38D: lea ecx, var_14
  loc_005CD390: call [004012ACh] ; __vbaFreeStr
  loc_005CD396: lea eax, var_20
  loc_005CD399: lea ecx, var_18
  loc_005CD39C: push eax
  loc_005CD39D: push ecx
  loc_005CD39E: push 00000002h
  loc_005CD3A0: call [00401040h] ; __vbaFreeObjList
  loc_005CD3A6: lea edx, var_40
  loc_005CD3A9: lea eax, var_30
  loc_005CD3AC: push edx
  loc_005CD3AD: push eax
  loc_005CD3AE: push 00000002h
  loc_005CD3B0: call [00401038h] ; __vbaFreeVarList
  loc_005CD3B6: add esp, 00000018h
  loc_005CD3B9: mov eax, [esi]
  loc_005CD3BB: push eax
  loc_005CD3BC: mov ecx, [eax]
  loc_005CD3BE: call [ecx+000000C4h]
  loc_005CD3C4: cmp eax, edi
  loc_005CD3C6: fnclex
  loc_005CD3C8: jge 005CD3DEh
  loc_005CD3CA: mov edx, [esi]
  loc_005CD3CC: push 000000C4h
  loc_005CD3D1: push 0041E938h
  loc_005CD3D6: push edx
  loc_005CD3D7: push eax
  loc_005CD3D8: call [00401074h] ; __vbaHresultCheckObj
  loc_005CD3DE: push 0041E938h
  loc_005CD3E3: push edi
  loc_005CD3E4: call [00401274h] ; __vbaCastObj
  loc_005CD3EA: push eax
  loc_005CD3EB: lea eax, var_18
  loc_005CD3EE: push eax
  loc_005CD3EF: call [004010A0h] ; __vbaObjSet
  loc_005CD3F5: push eax
  loc_005CD3F6: push esi
  loc_005CD3F7: call [004010B8h] ; __vbaObjSetAddref
  loc_005CD3FD: lea ecx, var_18
  loc_005CD400: call [004012B0h] ; __vbaFreeObj
  loc_005CD406: push 005CD43Fh
  loc_005CD40B: jmp 005CD43Eh
  loc_005CD40D: lea ecx, var_14
  loc_005CD410: call [004012ACh] ; __vbaFreeStr
  loc_005CD416: lea ecx, var_20
  loc_005CD419: lea edx, var_1C
  loc_005CD41C: push ecx
  loc_005CD41D: lea eax, var_18
  loc_005CD420: push edx
  loc_005CD421: push eax
  loc_005CD422: push 00000003h
  loc_005CD424: call [00401040h] ; __vbaFreeObjList
  loc_005CD42A: lea ecx, var_40
  loc_005CD42D: lea edx, var_30
  loc_005CD430: push ecx
  loc_005CD431: push edx
  loc_005CD432: push 00000002h
  loc_005CD434: call [00401038h] ; __vbaFreeVarList
  loc_005CD43A: add esp, 0000001Ch
  loc_005CD43D: ret
  loc_005CD43E: ret
  loc_005CD43F: mov ecx, var_10
  loc_005CD442: pop edi
  loc_005CD443: pop esi
  loc_005CD444: xor eax, eax
  loc_005CD446: mov fs:[00000000h], ecx
  loc_005CD44D: pop ebx
  loc_005CD44E: mov esp, ebp
  loc_005CD450: pop ebp
  loc_005CD451: retn 0004h
End Sub
