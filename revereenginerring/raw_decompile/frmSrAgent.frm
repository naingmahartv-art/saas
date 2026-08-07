VERSION 5.00
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmSrAgent
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 4920
  ClientHeight = 5790
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmSrAgent.frx":0000
    Left = 1710
    Top = 2520
  End
  Begin VB.CommandButton cmdReport
    Caption = "&Report"
    Left = 3240
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 14
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
  Begin VB.CommandButton cmdName
    Caption = "--"
    Left = 3840
    Top = 240
    Width = 255
    Height = 315
    TabIndex = 13
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
  Begin VB.TextBox txtCustomerName
    Left = 1410
    Top = 210
    Width = 2385
    Height = 315
    TabIndex = 11
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
  Begin VB.CommandButton cmdClose
    Caption = "Cl&ose"
    Left = 4020
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 10
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
  Begin VB.CommandButton cmdEdit
    Caption = "&Edit"
    Left = 1680
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 9
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
  Begin VB.CommandButton cmdSearch
    Caption = "&Search"
    Left = 900
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 8
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
  Begin VB.CommandButton cmdDelete
    Caption = "&Delete"
    Left = 2460
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 7
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
  Begin VB.CommandButton cmdNew
    Caption = "&New"
    Left = 120
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 6
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
    Caption = "&Cancel"
    Left = 900
    Top = 5340
    Width = 780
    Height = 315
    TabIndex = 5
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
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 120
    Top = 5340
    Width = 780
    Height = 315
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
  Begin MSFlexGridLib.MSFlexGrid MSFle
    Left = 90
    Top = 1170
    Width = 4725
    Height = 4005
    TabIndex = 3
    OleObjectBlob = "frmSrAgent.frx":00F3
  End
  Begin VB.CommandButton cmdAdd
    Caption = "&ADD"
    Left = 3840
    Top = 660
    Width = 645
    Height = 345
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
  Begin VB.TextBox txtSrNo
    Left = 1410
    Top = 660
    Width = 2385
    Height = 315
    TabIndex = 1
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
  Begin VB.Label Label2
    Caption = "Customer Name"
    Left = 210
    Top = 300
    Width = 1140
    Height = 210
    TabIndex = 12
    AutoSize = -1  'True
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
  Begin VB.Label Label1
    Caption = ",m,DeHygwf"
    Left = 210
    Top = 690
    Width = 885
    Height = 255
    TabIndex = 0
    AutoSize = -1  'True
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
  Begin VB.Menu mnuMain
    Visible = 0   'False
    Caption = "Main"
    Begin VB.Menu mnuDelete
      Caption = "Delete Line"
    End
  End
End

Attribute VB_Name = "frmSrAgent"


Private Sub txtSrNo_KeyPress(KeyAscii As Integer) '56AB80
  loc_0056AB80: push ebp
  loc_0056AB81: mov ebp, esp
  loc_0056AB83: sub esp, 0000000Ch
  loc_0056AB86: push 00403B36h ; __vbaExceptHandler
  loc_0056AB8B: mov eax, fs:[00000000h]
  loc_0056AB91: push eax
  loc_0056AB92: mov fs:[00000000h], esp
  loc_0056AB99: sub esp, 00000014h
  loc_0056AB9C: push ebx
  loc_0056AB9D: push esi
  loc_0056AB9E: push edi
  loc_0056AB9F: mov var_C, esp
  loc_0056ABA2: mov var_8, 00402B18h
  loc_0056ABA9: mov esi, Me
  loc_0056ABAC: mov eax, esi
  loc_0056ABAE: and eax, 00000001h
  loc_0056ABB1: mov var_4, eax
  loc_0056ABB4: and esi, FFFFFFFEh
  loc_0056ABB7: push esi
  loc_0056ABB8: mov Me, esi
  loc_0056ABBB: mov ecx, [esi]
  loc_0056ABBD: call [ecx+00000004h]
  loc_0056ABC0: mov edx, KeyAscii
  loc_0056ABC3: xor edi, edi
  loc_0056ABC5: mov var_18, edi
  loc_0056ABC8: cmp [edx], 000Dh
  loc_0056ABCC: jnz 0056AC0Eh
  loc_0056ABCE: mov eax, [esi]
  loc_0056ABD0: push esi
  loc_0056ABD1: call [eax+00000324h]
  loc_0056ABD7: lea ecx, var_18
  loc_0056ABDA: push eax
  loc_0056ABDB: push ecx
  loc_0056ABDC: call [004010A0h] ; __vbaObjSet
  loc_0056ABE2: mov esi, eax
  loc_0056ABE4: push esi
  loc_0056ABE5: mov edx, [esi]
  loc_0056ABE7: call [edx+000001A4h]
  loc_0056ABED: cmp eax, edi
  loc_0056ABEF: fnclex
  loc_0056ABF1: jge 0056AC05h
  loc_0056ABF3: push 000001A4h
  loc_0056ABF8: push 0041EAACh
  loc_0056ABFD: push esi
  loc_0056ABFE: push eax
  loc_0056ABFF: call [00401074h] ; __vbaHresultCheckObj
  loc_0056AC05: lea ecx, var_18
  loc_0056AC08: call [004012B0h] ; __vbaFreeObj
  loc_0056AC0E: mov var_4, edi
  loc_0056AC11: push 0056AC23h
  loc_0056AC16: jmp 0056AC22h
  loc_0056AC18: lea ecx, var_18
  loc_0056AC1B: call [004012B0h] ; __vbaFreeObj
  loc_0056AC21: ret
  loc_0056AC22: ret
  loc_0056AC23: mov eax, Me
  loc_0056AC26: push eax
  loc_0056AC27: mov ecx, [eax]
  loc_0056AC29: call [ecx+00000008h]
  loc_0056AC2C: mov eax, var_4
  loc_0056AC2F: mov ecx, var_14
  loc_0056AC32: pop edi
  loc_0056AC33: pop esi
  loc_0056AC34: mov fs:[00000000h], ecx
  loc_0056AC3B: pop ebx
  loc_0056AC3C: mov esp, ebp
  loc_0056AC3E: pop ebp
  loc_0056AC3F: retn 0008h
End Sub

Private Sub Form_Load() '567990
  loc_00567990: push ebp
  loc_00567991: mov ebp, esp
  loc_00567993: sub esp, 0000000Ch
  loc_00567996: push 00403B36h ; __vbaExceptHandler
  loc_0056799B: mov eax, fs:[00000000h]
  loc_005679A1: push eax
  loc_005679A2: mov fs:[00000000h], esp
  loc_005679A9: sub esp, 00000024h
  loc_005679AC: push ebx
  loc_005679AD: push esi
  loc_005679AE: push edi
  loc_005679AF: mov var_C, esp
  loc_005679B2: mov var_8, 00402A98h
  loc_005679B9: mov esi, Me
  loc_005679BC: mov eax, esi
  loc_005679BE: and eax, 00000001h
  loc_005679C1: mov var_4, eax
  loc_005679C4: and esi, FFFFFFFEh
  loc_005679C7: push esi
  loc_005679C8: mov Me, esi
  loc_005679CB: mov ecx, [esi]
  loc_005679CD: call [ecx+00000004h]
  loc_005679D0: mov edx, [esi]
  loc_005679D2: xor edi, edi
  loc_005679D4: push edi
  loc_005679D5: push 00000044h
  loc_005679D7: push esi
  loc_005679D8: mov var_18, edi
  loc_005679DB: mov var_1C, edi
  loc_005679DE: mov var_2C, edi
  loc_005679E1: mov var_30, edi
  loc_005679E4: mov [esi+0000003Ch], di
  loc_005679E8: call [edx+00000340h]
  loc_005679EE: push eax
  loc_005679EF: lea eax, var_1C
  loc_005679F2: push eax
  loc_005679F3: call [004010A0h] ; __vbaObjSet
  loc_005679F9: push eax
  loc_005679FA: call [00401024h] ; __vbaLateIdCall
  loc_00567A00: add esp, 0000000Ch
  loc_00567A03: lea ecx, var_1C
  loc_00567A06: call [004012B0h] ; __vbaFreeObj
  loc_00567A0C: push 00000001h
  loc_00567A0E: call [00401008h] ; __vbaStrI2
  loc_00567A14: mov edx, eax
  loc_00567A16: lea ecx, var_18
  loc_00567A19: call [00401270h] ; __vbaStrMove
  loc_00567A1F: mov edx, eax
  loc_00567A21: lea ecx, [esi+00000038h]
  loc_00567A24: call [004011ECh] ; __vbaStrCopy
  loc_00567A2A: lea ecx, var_18
  loc_00567A2D: call [004012ACh] ; __vbaFreeStr
  loc_00567A33: mov ecx, [esi]
  loc_00567A35: push esi
  loc_00567A36: call [ecx+00000700h]
  loc_00567A3C: mov edx, [esi]
  loc_00567A3E: lea eax, var_2C
  loc_00567A41: lea ecx, var_30
  loc_00567A44: push eax
  loc_00567A45: push ecx
  loc_00567A46: push esi
  loc_00567A47: mov var_30, FFFFFFFFh
  loc_00567A4E: call [edx+000006FCh]
  loc_00567A54: mov ebx, [00401020h] ; __vbaFreeVar
  loc_00567A5A: lea ecx, var_2C
  loc_00567A5D: call ebx
  loc_00567A5F: mov edx, [esi]
  loc_00567A61: lea eax, var_2C
  loc_00567A64: lea ecx, var_30
  loc_00567A67: push eax
  loc_00567A68: push ecx
  loc_00567A69: push esi
  loc_00567A6A: mov var_30, edi
  loc_00567A6D: call [edx+000006F8h]
  loc_00567A73: lea ecx, var_2C
  loc_00567A76: call ebx
  loc_00567A78: mov var_4, edi
  loc_00567A7B: push 00567A9Fh
  loc_00567A80: jmp 00567A9Eh
  loc_00567A82: lea ecx, var_18
  loc_00567A85: call [004012ACh] ; __vbaFreeStr
  loc_00567A8B: lea ecx, var_1C
  loc_00567A8E: call [004012B0h] ; __vbaFreeObj
  loc_00567A94: lea ecx, var_2C
  loc_00567A97: call [00401020h] ; __vbaFreeVar
  loc_00567A9D: ret
  loc_00567A9E: ret
  loc_00567A9F: mov eax, Me
  loc_00567AA2: push eax
  loc_00567AA3: mov edx, [eax]
  loc_00567AA5: call [edx+00000008h]
  loc_00567AA8: mov eax, var_4
  loc_00567AAB: mov ecx, var_14
  loc_00567AAE: pop edi
  loc_00567AAF: pop esi
  loc_00567AB0: mov fs:[00000000h], ecx
  loc_00567AB7: pop ebx
  loc_00567AB8: mov esp, ebp
  loc_00567ABA: pop ebp
  loc_00567ABB: retn 0004h
End Sub

Private Sub cmdCancel_Click() '566700
  loc_00566700: push ebp
  loc_00566701: mov ebp, esp
  loc_00566703: sub esp, 0000000Ch
  loc_00566706: push 00403B36h ; __vbaExceptHandler
  loc_0056670B: mov eax, fs:[00000000h]
  loc_00566711: push eax
  loc_00566712: mov fs:[00000000h], esp
  loc_00566719: sub esp, 0000001Ch
  loc_0056671C: push ebx
  loc_0056671D: push esi
  loc_0056671E: push edi
  loc_0056671F: mov var_C, esp
  loc_00566722: mov var_8, 00402A00h
  loc_00566729: mov esi, Me
  loc_0056672C: mov eax, esi
  loc_0056672E: and eax, 00000001h
  loc_00566731: mov var_4, eax
  loc_00566734: and esi, FFFFFFFEh
  loc_00566737: push esi
  loc_00566738: mov Me, esi
  loc_0056673B: mov ecx, [esi]
  loc_0056673D: call [ecx+00000004h]
  loc_00566740: mov edx, [esi]
  loc_00566742: lea eax, var_24
  loc_00566745: lea ecx, var_28
  loc_00566748: xor edi, edi
  loc_0056674A: push eax
  loc_0056674B: push ecx
  loc_0056674C: mov var_28, edi
  loc_0056674F: push esi
  loc_00566750: mov var_24, edi
  loc_00566753: mov [esi+0000003Ch], di
  loc_00566757: mov var_28, FFFFFFFFh
  loc_0056675E: call [edx+000006FCh]
  loc_00566764: mov ebx, [00401020h] ; __vbaFreeVar
  loc_0056676A: lea ecx, var_24
  loc_0056676D: call ebx
  loc_0056676F: mov edx, [esi]
  loc_00566771: lea eax, var_24
  loc_00566774: lea ecx, var_28
  loc_00566777: push eax
  loc_00566778: push ecx
  loc_00566779: push esi
  loc_0056677A: mov var_28, edi
  loc_0056677D: call [edx+000006F8h]
  loc_00566783: lea ecx, var_24
  loc_00566786: call ebx
  loc_00566788: mov var_4, edi
  loc_0056678B: push 0056679Dh
  loc_00566790: jmp 0056679Ch
  loc_00566792: lea ecx, var_24
  loc_00566795: call [00401020h] ; __vbaFreeVar
  loc_0056679B: ret
  loc_0056679C: ret
  loc_0056679D: mov eax, Me
  loc_005667A0: push eax
  loc_005667A1: mov edx, [eax]
  loc_005667A3: call [edx+00000008h]
  loc_005667A6: mov eax, var_4
  loc_005667A9: mov ecx, var_14
  loc_005667AC: pop edi
  loc_005667AD: pop esi
  loc_005667AE: mov fs:[00000000h], ecx
  loc_005667B5: pop ebx
  loc_005667B6: mov esp, ebp
  loc_005667B8: pop ebp
  loc_005667B9: retn 0004h
End Sub

Private Sub cmdNew_Click() '567200
  loc_00567200: push ebp
  loc_00567201: mov ebp, esp
  loc_00567203: sub esp, 0000000Ch
  loc_00567206: push 00403B36h ; __vbaExceptHandler
  loc_0056720B: mov eax, fs:[00000000h]
  loc_00567211: push eax
  loc_00567212: mov fs:[00000000h], esp
  loc_00567219: sub esp, 0000002Ch
  loc_0056721C: push ebx
  loc_0056721D: push esi
  loc_0056721E: push edi
  loc_0056721F: mov var_C, esp
  loc_00567222: mov var_8, 00402A60h
  loc_00567229: mov esi, Me
  loc_0056722C: mov eax, esi
  loc_0056722E: and eax, 00000001h
  loc_00567231: mov var_4, eax
  loc_00567234: and esi, FFFFFFFEh
  loc_00567237: push esi
  loc_00567238: mov Me, esi
  loc_0056723B: mov ecx, [esi]
  loc_0056723D: call [ecx+00000004h]
  loc_00567240: mov edx, [esi]
  loc_00567242: xor eax, eax
  loc_00567244: push esi
  loc_00567245: mov var_18, eax
  loc_00567248: mov var_1C, eax
  loc_0056724B: mov var_2C, eax
  loc_0056724E: mov var_30, eax
  loc_00567251: call [edx+00000320h]
  loc_00567257: mov edi, [004010A0h] ; __vbaObjSet
  loc_0056725D: push eax
  loc_0056725E: lea eax, var_1C
  loc_00567261: push eax
  loc_00567262: call edi
  loc_00567264: mov ebx, eax
  loc_00567266: push 0041F368h ; "&Save"
  loc_0056726B: push ebx
  loc_0056726C: mov ecx, [ebx]
  loc_0056726E: call [ecx+00000054h]
  loc_00567271: test eax, eax
  loc_00567273: fnclex
  loc_00567275: jge 00567286h
  loc_00567277: push 00000054h
  loc_00567279: push 0041EAACh
  loc_0056727E: push ebx
  loc_0056727F: push eax
  loc_00567280: call [00401074h] ; __vbaHresultCheckObj
  loc_00567286: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0056728C: lea ecx, var_1C
  loc_0056728F: call ebx
  loc_00567291: mov edx, [esi]
  loc_00567293: push esi
  loc_00567294: mov [esi+0000003Ch], 0000h
  loc_0056729A: call [edx+00000720h]
  loc_005672A0: mov eax, [esi]
  loc_005672A2: lea ecx, var_2C
  loc_005672A5: lea edx, var_30
  loc_005672A8: push ecx
  loc_005672A9: push edx
  loc_005672AA: push esi
  loc_005672AB: mov var_30, 00000000h
  loc_005672B2: call [eax+000006FCh]
  loc_005672B8: lea ecx, var_2C
  loc_005672BB: call [00401020h] ; __vbaFreeVar
  loc_005672C1: mov eax, [esi]
  loc_005672C3: lea ecx, var_2C
  loc_005672C6: lea edx, var_30
  loc_005672C9: push ecx
  loc_005672CA: push edx
  loc_005672CB: push esi
  loc_005672CC: mov var_30, FFFFFFFFh
  loc_005672D3: call [eax+000006F8h]
  loc_005672D9: lea ecx, var_2C
  loc_005672DC: call [00401020h] ; __vbaFreeVar
  loc_005672E2: mov eax, [esi]
  loc_005672E4: push 00000000h
  loc_005672E6: push 00000044h
  loc_005672E8: push esi
  loc_005672E9: call [eax+00000340h]
  loc_005672EF: lea ecx, var_1C
  loc_005672F2: push eax
  loc_005672F3: push ecx
  loc_005672F4: call edi
  loc_005672F6: push eax
  loc_005672F7: call [00401024h] ; __vbaLateIdCall
  loc_005672FD: add esp, 0000000Ch
  loc_00567300: lea ecx, var_1C
  loc_00567303: call ebx
  loc_00567305: push 00000001h
  loc_00567307: call [00401008h] ; __vbaStrI2
  loc_0056730D: mov edx, eax
  loc_0056730F: lea ecx, var_18
  loc_00567312: call [00401270h] ; __vbaStrMove
  loc_00567318: mov edx, eax
  loc_0056731A: lea ecx, [esi+00000038h]
  loc_0056731D: call [004011ECh] ; __vbaStrCopy
  loc_00567323: lea ecx, var_18
  loc_00567326: call [004012ACh] ; __vbaFreeStr
  loc_0056732C: mov edx, [esi]
  loc_0056732E: push esi
  loc_0056732F: call [edx+00000700h]
  loc_00567335: mov eax, [esi]
  loc_00567337: push esi
  loc_00567338: call [eax+00000304h]
  loc_0056733E: lea ecx, var_1C
  loc_00567341: push eax
  loc_00567342: push ecx
  loc_00567343: call edi
  loc_00567345: mov esi, eax
  loc_00567347: push esi
  loc_00567348: mov edx, [esi]
  loc_0056734A: call [edx+00000204h]
  loc_00567350: test eax, eax
  loc_00567352: fnclex
  loc_00567354: jge 00567368h
  loc_00567356: push 00000204h
  loc_0056735B: push 0041E5E8h
  loc_00567360: push esi
  loc_00567361: push eax
  loc_00567362: call [00401074h] ; __vbaHresultCheckObj
  loc_00567368: lea ecx, var_1C
  loc_0056736B: call ebx
  loc_0056736D: mov var_4, 00000000h
  loc_00567374: push 00567398h
  loc_00567379: jmp 00567397h
  loc_0056737B: lea ecx, var_18
  loc_0056737E: call [004012ACh] ; __vbaFreeStr
  loc_00567384: lea ecx, var_1C
  loc_00567387: call [004012B0h] ; __vbaFreeObj
  loc_0056738D: lea ecx, var_2C
  loc_00567390: call [00401020h] ; __vbaFreeVar
  loc_00567396: ret
  loc_00567397: ret
  loc_00567398: mov eax, Me
  loc_0056739B: push eax
  loc_0056739C: mov ecx, [eax]
  loc_0056739E: call [ecx+00000008h]
  loc_005673A1: mov eax, var_4
  loc_005673A4: mov ecx, var_14
  loc_005673A7: pop edi
  loc_005673A8: pop esi
  loc_005673A9: mov fs:[00000000h], ecx
  loc_005673B0: pop ebx
  loc_005673B1: mov esp, ebp
  loc_005673B3: pop ebp
  loc_005673B4: retn 0004h
End Sub

Private Sub cmdEdit_Click() '566B20
  loc_00566B20: push ebp
  loc_00566B21: mov ebp, esp
  loc_00566B23: sub esp, 0000000Ch
  loc_00566B26: push 00403B36h ; __vbaExceptHandler
  loc_00566B2B: mov eax, fs:[00000000h]
  loc_00566B31: push eax
  loc_00566B32: mov fs:[00000000h], esp
  loc_00566B39: sub esp, 0000005Ch
  loc_00566B3C: push ebx
  loc_00566B3D: push esi
  loc_00566B3E: push edi
  loc_00566B3F: mov var_C, esp
  loc_00566B42: mov var_8, 00402A30h
  loc_00566B49: mov esi, Me
  loc_00566B4C: mov eax, esi
  loc_00566B4E: and eax, 00000001h
  loc_00566B51: mov var_4, eax
  loc_00566B54: and esi, FFFFFFFEh
  loc_00566B57: push esi
  loc_00566B58: mov Me, esi
  loc_00566B5B: mov ecx, [esi]
  loc_00566B5D: call [ecx+00000004h]
  loc_00566B60: xor edi, edi
  loc_00566B62: mov edx, 004269F8h ; "SrAgent"
  loc_00566B67: mov ecx, 0061A0A0h
  loc_00566B6C: mov var_18, edi
  loc_00566B6F: mov var_1C, edi
  loc_00566B72: mov var_2C, edi
  loc_00566B75: mov var_3C, edi
  loc_00566B78: mov var_4C, edi
  loc_00566B7B: mov var_5C, edi
  loc_00566B7E: mov var_60, edi
  loc_00566B81: call [004011ECh] ; __vbaStrCopy
  loc_00566B87: cmp [0061A11Ch], edi
  loc_00566B8D: jnz 00566B9Fh
  loc_00566B8F: push 0061A11Ch
  loc_00566B94: push 004069CCh
  loc_00566B99: call [004011DCh] ; __vbaNew2
  loc_00566B9F: sub esp, 00000010h
  loc_00566BA2: mov ecx, 0000000Ah
  loc_00566BA7: mov ebx, esp
  loc_00566BA9: mov var_5C, ecx
  loc_00566BAC: mov eax, 80020004h
  loc_00566BB1: sub esp, 00000010h
  loc_00566BB4: mov [ebx], ecx
  loc_00566BB6: mov ecx, var_58
  loc_00566BB9: mov var_54, eax
  loc_00566BBC: mov edi, [0061A11Ch]
  loc_00566BC2: mov [ebx+00000004h], ecx
  loc_00566BC5: mov var_4C, 00000002h
  loc_00566BCC: mov ecx, esp
  loc_00566BCE: mov var_44, 00000001h
  loc_00566BD5: mov [ebx+00000008h], eax
  loc_00566BD8: mov eax, var_50
  loc_00566BDB: mov edx, [edi]
  loc_00566BDD: push edi
  loc_00566BDE: mov [ebx+0000000Ch], eax
  loc_00566BE1: mov eax, var_4C
  loc_00566BE4: mov [ecx], eax
  loc_00566BE6: mov eax, var_48
  loc_00566BE9: mov [ecx+00000004h], eax
  loc_00566BEC: mov eax, var_44
  loc_00566BEF: mov [ecx+00000008h], eax
  loc_00566BF2: mov eax, var_40
  loc_00566BF5: mov [ecx+0000000Ch], eax
  loc_00566BF8: call [edx+000002B0h]
  loc_00566BFE: test eax, eax
  loc_00566C00: fnclex
  loc_00566C02: jge 00566C16h
  loc_00566C04: push 000002B0h
  loc_00566C09: push 0041E6D0h
  loc_00566C0E: push edi
  loc_00566C0F: push eax
  loc_00566C10: call [00401074h] ; __vbaHresultCheckObj
  loc_00566C16: lea ecx, var_4C
  loc_00566C19: lea edx, var_2C
  loc_00566C1C: push ecx
  loc_00566C1D: push edx
  loc_00566C1E: mov var_44, 0061A0B8h
  loc_00566C25: mov var_4C, 00004008h
  loc_00566C2C: call [004010D4h] ; rtcTrimVar
  loc_00566C32: lea eax, var_2C
  loc_00566C35: lea ecx, var_5C
  loc_00566C38: push eax
  loc_00566C39: push ecx
  loc_00566C3A: mov var_54, 0041E5D4h
  loc_00566C41: mov var_5C, 00008008h
  loc_00566C48: call [00401218h] ; __vbaVarTstNe
  loc_00566C4E: mov edi, [00401020h] ; __vbaFreeVar
  loc_00566C54: lea ecx, var_2C
  loc_00566C57: mov bx, ax
  loc_00566C5A: call edi
  loc_00566C5C: test bx, bx
  loc_00566C5F: jz 00566E4Ah
  loc_00566C65: mov edx, [esi]
  loc_00566C67: push esi
  loc_00566C68: call [edx+00000720h]
  loc_00566C6E: mov eax, [esi]
  loc_00566C70: push 00000000h
  loc_00566C72: push 00000044h
  loc_00566C74: push esi
  loc_00566C75: call [eax+00000340h]
  loc_00566C7B: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00566C81: lea ecx, var_1C
  loc_00566C84: push eax
  loc_00566C85: push ecx
  loc_00566C86: call ebx
  loc_00566C88: push eax
  loc_00566C89: call [00401024h] ; __vbaLateIdCall
  loc_00566C8F: add esp, 0000000Ch
  loc_00566C92: lea ecx, var_1C
  loc_00566C95: call [004012B0h] ; __vbaFreeObj
  loc_00566C9B: push 00000001h
  loc_00566C9D: call [00401008h] ; __vbaStrI2
  loc_00566CA3: mov edx, eax
  loc_00566CA5: lea ecx, var_18
  loc_00566CA8: call [00401270h] ; __vbaStrMove
  loc_00566CAE: mov edx, eax
  loc_00566CB0: lea ecx, [esi+00000038h]
  loc_00566CB3: call [004011ECh] ; __vbaStrCopy
  loc_00566CB9: lea ecx, var_18
  loc_00566CBC: call [004012ACh] ; __vbaFreeStr
  loc_00566CC2: mov edx, [esi]
  loc_00566CC4: push esi
  loc_00566CC5: call [edx+00000700h]
  loc_00566CCB: mov eax, [esi]
  loc_00566CCD: push esi
  loc_00566CCE: call [eax+00000704h]
  loc_00566CD4: mov ecx, [esi]
  loc_00566CD6: lea edx, var_2C
  loc_00566CD9: lea eax, var_60
  loc_00566CDC: push edx
  loc_00566CDD: push eax
  loc_00566CDE: push esi
  loc_00566CDF: mov var_60, 00000000h
  loc_00566CE6: call [ecx+000006FCh]
  loc_00566CEC: lea ecx, var_2C
  loc_00566CEF: call edi
  loc_00566CF1: mov ecx, [esi]
  loc_00566CF3: lea edx, var_2C
  loc_00566CF6: lea eax, var_60
  loc_00566CF9: push edx
  loc_00566CFA: push eax
  loc_00566CFB: push esi
  loc_00566CFC: mov var_60, FFFFFFFFh
  loc_00566D03: call [ecx+000006F8h]
  loc_00566D09: lea ecx, var_2C
  loc_00566D0C: call edi
  loc_00566D0E: mov ecx, [esi]
  loc_00566D10: push esi
  loc_00566D11: call [ecx+00000304h]
  loc_00566D17: lea edx, var_1C
  loc_00566D1A: push eax
  loc_00566D1B: push edx
  loc_00566D1C: call ebx
  loc_00566D1E: mov edi, eax
  loc_00566D20: lea eax, var_4C
  loc_00566D23: lea ecx, var_2C
  loc_00566D26: push eax
  loc_00566D27: push ecx
  loc_00566D28: mov var_44, 0061A0B8h
  loc_00566D2F: mov var_4C, 00004008h
  loc_00566D36: call [004010D4h] ; rtcTrimVar
  loc_00566D3C: mov ebx, [edi]
  loc_00566D3E: lea edx, var_2C
  loc_00566D41: lea eax, var_18
  loc_00566D44: push edx
  loc_00566D45: push eax
  loc_00566D46: call [004011B0h] ; __vbaStrVarVal
  loc_00566D4C: push eax
  loc_00566D4D: push edi
  loc_00566D4E: call [ebx+000000A4h]
  loc_00566D54: test eax, eax
  loc_00566D56: fnclex
  loc_00566D58: jge 00566D6Ch
  loc_00566D5A: push 000000A4h
  loc_00566D5F: push 0041E5E8h
  loc_00566D64: push edi
  loc_00566D65: push eax
  loc_00566D66: call [00401074h] ; __vbaHresultCheckObj
  loc_00566D6C: lea ecx, var_18
  loc_00566D6F: call [004012ACh] ; __vbaFreeStr
  loc_00566D75: lea ecx, var_1C
  loc_00566D78: call [004012B0h] ; __vbaFreeObj
  loc_00566D7E: lea ecx, var_2C
  loc_00566D81: call [00401020h] ; __vbaFreeVar
  loc_00566D87: mov ecx, [esi]
  loc_00566D89: push esi
  loc_00566D8A: call [ecx+00000304h]
  loc_00566D90: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00566D96: lea edx, var_1C
  loc_00566D99: push eax
  loc_00566D9A: push edx
  loc_00566D9B: call ebx
  loc_00566D9D: mov edi, eax
  loc_00566D9F: push 00000000h
  loc_00566DA1: push edi
  loc_00566DA2: mov eax, [edi]
  loc_00566DA4: call [eax+0000008Ch]
  loc_00566DAA: test eax, eax
  loc_00566DAC: fnclex
  loc_00566DAE: jge 00566DC2h
  loc_00566DB0: push 0000008Ch
  loc_00566DB5: push 0041E5E8h
  loc_00566DBA: push edi
  loc_00566DBB: push eax
  loc_00566DBC: call [00401074h] ; __vbaHresultCheckObj
  loc_00566DC2: lea ecx, var_1C
  loc_00566DC5: call [004012B0h] ; __vbaFreeObj
  loc_00566DCB: mov ecx, [esi]
  loc_00566DCD: push esi
  loc_00566DCE: call [ecx+00000300h]
  loc_00566DD4: lea edx, var_1C
  loc_00566DD7: push eax
  loc_00566DD8: push edx
  loc_00566DD9: call ebx
  loc_00566DDB: mov edi, eax
  loc_00566DDD: push 00000000h
  loc_00566DDF: push edi
  loc_00566DE0: mov eax, [edi]
  loc_00566DE2: call [eax+0000008Ch]
  loc_00566DE8: test eax, eax
  loc_00566DEA: fnclex
  loc_00566DEC: jge 00566E00h
  loc_00566DEE: push 0000008Ch
  loc_00566DF3: push 0041EAACh
  loc_00566DF8: push edi
  loc_00566DF9: push eax
  loc_00566DFA: call [00401074h] ; __vbaHresultCheckObj
  loc_00566E00: lea ecx, var_1C
  loc_00566E03: call [004012B0h] ; __vbaFreeObj
  loc_00566E09: mov ecx, [esi]
  loc_00566E0B: push esi
  loc_00566E0C: call [ecx+00000320h]
  loc_00566E12: lea edx, var_1C
  loc_00566E15: push eax
  loc_00566E16: push edx
  loc_00566E17: call ebx
  loc_00566E19: mov edi, eax
  loc_00566E1B: push 0041F358h ; "&Edit"
  loc_00566E20: push edi
  loc_00566E21: mov eax, [edi]
  loc_00566E23: call [eax+00000054h]
  loc_00566E26: test eax, eax
  loc_00566E28: fnclex
  loc_00566E2A: jge 00566E3Bh
  loc_00566E2C: push 00000054h
  loc_00566E2E: push 0041EAACh
  loc_00566E33: push edi
  loc_00566E34: push eax
  loc_00566E35: call [00401074h] ; __vbaHresultCheckObj
  loc_00566E3B: lea ecx, var_1C
  loc_00566E3E: call [004012B0h] ; __vbaFreeObj
  loc_00566E44: mov [esi+0000003Ch], FFFFFFh
  loc_00566E4A: mov var_4, 00000000h
  loc_00566E51: push 00566E7Fh
  loc_00566E56: jmp 00566E7Eh
  loc_00566E58: lea ecx, var_18
  loc_00566E5B: call [004012ACh] ; __vbaFreeStr
  loc_00566E61: lea ecx, var_1C
  loc_00566E64: call [004012B0h] ; __vbaFreeObj
  loc_00566E6A: lea ecx, var_3C
  loc_00566E6D: lea edx, var_2C
  loc_00566E70: push ecx
  loc_00566E71: push edx
  loc_00566E72: push 00000002h
  loc_00566E74: call [00401038h] ; __vbaFreeVarList
  loc_00566E7A: add esp, 0000000Ch
  loc_00566E7D: ret
  loc_00566E7E: ret
  loc_00566E7F: mov eax, Me
  loc_00566E82: push eax
  loc_00566E83: mov ecx, [eax]
  loc_00566E85: call [ecx+00000008h]
  loc_00566E88: mov eax, var_4
  loc_00566E8B: mov ecx, var_14
  loc_00566E8E: pop edi
  loc_00566E8F: pop esi
  loc_00566E90: mov fs:[00000000h], ecx
  loc_00566E97: pop ebx
  loc_00566E98: mov esp, ebp
  loc_00566E9A: pop ebp
  loc_00566E9B: retn 0004h
End Sub

Private Sub MSFle_MouseDown(Button As Integer, Shift As Integer, x As OLE_XPOS_PIXELS, y As OLE_YPOS_PIXELS) '56A550
  loc_0056A550: push ebp
  loc_0056A551: mov ebp, esp
  loc_0056A553: sub esp, 0000000Ch
  loc_0056A556: push 00403B36h ; __vbaExceptHandler
  loc_0056A55B: mov eax, fs:[00000000h]
  loc_0056A561: push eax
  loc_0056A562: mov fs:[00000000h], esp
  loc_0056A569: sub esp, 00000050h
  loc_0056A56C: push ebx
  loc_0056A56D: push esi
  loc_0056A56E: push edi
  loc_0056A56F: mov var_C, esp
  loc_0056A572: mov var_8, 00402AE8h
  loc_0056A579: mov esi, Me
  loc_0056A57C: mov eax, esi
  loc_0056A57E: and eax, 00000001h
  loc_0056A581: mov var_4, eax
  loc_0056A584: and esi, FFFFFFFEh
  loc_0056A587: push esi
  loc_0056A588: mov Me, esi
  loc_0056A58B: mov ecx, [esi]
  loc_0056A58D: call [ecx+00000004h]
  loc_0056A590: mov edx, Button
  loc_0056A593: xor edi, edi
  loc_0056A595: mov var_18, edi
  loc_0056A598: mov var_28, edi
  loc_0056A59B: cmp [edx], 0002h
  loc_0056A59F: mov var_38, edi
  loc_0056A5A2: mov var_48, edi
  loc_0056A5A5: mov var_58, edi
  loc_0056A5A8: jnz 0056A66Ch
  loc_0056A5AE: sub esp, 00000010h
  loc_0056A5B1: mov ecx, 0000000Ah
  loc_0056A5B6: mov ebx, esp
  loc_0056A5B8: mov var_28, ecx
  loc_0056A5BB: mov edx, 80020004h
  loc_0056A5C0: sub esp, 00000010h
  loc_0056A5C3: mov [ebx], ecx
  loc_0056A5C5: mov ecx, var_54
  loc_0056A5C8: mov eax, edx
  loc_0056A5CA: mov var_20, edx
  loc_0056A5CD: mov [ebx+00000004h], ecx
  loc_0056A5D0: mov ecx, esp
  loc_0056A5D2: sub esp, 00000010h
  loc_0056A5D5: mov edi, [esi]
  loc_0056A5D7: mov [ebx+00000008h], eax
  loc_0056A5DA: mov eax, var_4C
  loc_0056A5DD: mov [ebx+0000000Ch], eax
  loc_0056A5E0: mov eax, 0000000Ah
  loc_0056A5E5: mov [ecx], eax
  loc_0056A5E7: mov eax, var_44
  loc_0056A5EA: mov [ecx+00000004h], eax
  loc_0056A5ED: mov eax, 0000000Ah
  loc_0056A5F2: mov [ecx+00000008h], edx
  loc_0056A5F5: mov edx, var_3C
  loc_0056A5F8: mov [ecx+0000000Ch], edx
  loc_0056A5FB: mov edx, var_34
  loc_0056A5FE: mov ecx, esp
  loc_0056A600: sub esp, 00000010h
  loc_0056A603: mov [ecx], eax
  loc_0056A605: mov eax, 80020004h
  loc_0056A60A: mov [ecx+00000004h], edx
  loc_0056A60D: mov edx, var_28
  loc_0056A610: mov [ecx+00000008h], eax
  loc_0056A613: mov eax, var_2C
  loc_0056A616: mov [ecx+0000000Ch], eax
  loc_0056A619: mov eax, var_24
  loc_0056A61C: mov ecx, esp
  loc_0056A61E: push esi
  loc_0056A61F: mov [ecx], edx
  loc_0056A621: mov edx, var_20
  loc_0056A624: mov [ecx+00000004h], eax
  loc_0056A627: mov eax, var_1C
  loc_0056A62A: mov [ecx+00000008h], edx
  loc_0056A62D: mov [ecx+0000000Ch], eax
  loc_0056A630: call [edi+00000334h]
  loc_0056A636: lea ecx, var_18
  loc_0056A639: push eax
  loc_0056A63A: push ecx
  loc_0056A63B: call [004010A0h] ; __vbaObjSet
  loc_0056A641: push eax
  loc_0056A642: push esi
  loc_0056A643: call [edi+000002BCh]
  loc_0056A649: xor edi, edi
  loc_0056A64B: cmp eax, edi
  loc_0056A64D: fnclex
  loc_0056A64F: jge 0056A663h
  loc_0056A651: push 000002BCh
  loc_0056A656: push 00428D68h
  loc_0056A65B: push esi
  loc_0056A65C: push eax
  loc_0056A65D: call [00401074h] ; __vbaHresultCheckObj
  loc_0056A663: lea ecx, var_18
  loc_0056A666: call [004012B0h] ; __vbaFreeObj
  loc_0056A66C: mov var_4, edi
  loc_0056A66F: push 0056A681h
  loc_0056A674: jmp 0056A680h
  loc_0056A676: lea ecx, var_18
  loc_0056A679: call [004012B0h] ; __vbaFreeObj
  loc_0056A67F: ret
  loc_0056A680: ret
  loc_0056A681: mov eax, Me
  loc_0056A684: push eax
  loc_0056A685: mov edx, [eax]
  loc_0056A687: call [edx+00000008h]
  loc_0056A68A: mov eax, var_4
  loc_0056A68D: mov ecx, var_14
  loc_0056A690: pop edi
  loc_0056A691: pop esi
  loc_0056A692: mov fs:[00000000h], ecx
  loc_0056A699: pop ebx
  loc_0056A69A: mov esp, ebp
  loc_0056A69C: pop ebp
  loc_0056A69D: retn 0014h
End Sub

Private Sub cmdReport_Click() '5673C0
  loc_005673C0: push ebp
  loc_005673C1: mov ebp, esp
  loc_005673C3: sub esp, 0000000Ch
  loc_005673C6: push 00403B36h ; __vbaExceptHandler
  loc_005673CB: mov eax, fs:[00000000h]
  loc_005673D1: push eax
  loc_005673D2: mov fs:[00000000h], esp
  loc_005673D9: sub esp, 000000B0h
  loc_005673DF: push ebx
  loc_005673E0: push esi
  loc_005673E1: push edi
  loc_005673E2: mov var_C, esp
  loc_005673E5: mov var_8, 00402A70h
  loc_005673EC: mov esi, Me
  loc_005673EF: mov eax, esi
  loc_005673F1: and eax, 00000001h
  loc_005673F4: mov var_4, eax
  loc_005673F7: and esi, FFFFFFFEh
  loc_005673FA: push esi
  loc_005673FB: mov Me, esi
  loc_005673FE: mov ecx, [esi]
  loc_00567400: call [ecx+00000004h]
  loc_00567403: mov edx, [esi]
  loc_00567405: xor edi, edi
  loc_00567407: push 0000000Bh
  loc_00567409: push esi
  loc_0056740A: mov var_18, edi
  loc_0056740D: mov var_28, edi
  loc_00567410: mov var_38, edi
  loc_00567413: mov var_48, edi
  loc_00567416: mov var_58, edi
  loc_00567419: mov var_68, edi
  loc_0056741C: mov var_78, edi
  loc_0056741F: mov var_88, edi
  loc_00567425: call [edx+000000A4h]
  loc_0056742B: cmp eax, edi
  loc_0056742D: fnclex
  loc_0056742F: jge 00567443h
  loc_00567431: push 000000A4h
  loc_00567436: push 00428D68h
  loc_0056743B: push esi
  loc_0056743C: push eax
  loc_0056743D: call [00401074h] ; __vbaHresultCheckObj
  loc_00567443: sub esp, 00000010h
  loc_00567446: mov ecx, 00000008h
  loc_0056744B: mov edx, esp
  loc_0056744D: mov var_68, ecx
  loc_00567450: mov eax, 00428EE0h ; "C:\soft\Lottery\Reports\sragent.rpt"
  loc_00567455: push 00000003h
  loc_00567457: mov [edx], ecx
  loc_00567459: mov ecx, var_64
  loc_0056745C: mov var_60, eax
  loc_0056745F: push esi
  loc_00567460: mov [edx+00000004h], ecx
  loc_00567463: mov ecx, [esi]
  loc_00567465: mov [edx+00000008h], eax
  loc_00567468: mov eax, var_5C
  loc_0056746B: mov [edx+0000000Ch], eax
  loc_0056746E: call [ecx+0000033Ch]
  loc_00567474: mov edi, [004010A0h] ; __vbaObjSet
  loc_0056747A: lea edx, var_18
  loc_0056747D: push eax
  loc_0056747E: push edx
  loc_0056747F: call edi
  loc_00567481: push eax
  loc_00567482: call [00401288h] ; __vbaLateIdSt
  loc_00567488: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0056748E: lea ecx, var_18
  loc_00567491: call ebx
  loc_00567493: lea eax, var_68
  loc_00567496: lea ecx, var_28
  loc_00567499: push eax
  loc_0056749A: push ecx
  loc_0056749B: mov var_70, 00428F2Ch ; "Oncount='"
  loc_005674A2: mov var_78, 00000008h
  loc_005674A9: mov var_60, 0061A05Ch
  loc_005674B0: mov var_68, 00004008h
  loc_005674B7: call [004010D4h] ; rtcTrimVar
  loc_005674BD: lea edx, var_78
  loc_005674C0: lea eax, var_28
  loc_005674C3: push edx
  loc_005674C4: lea ecx, var_38
  loc_005674C7: push eax
  loc_005674C8: push ecx
  loc_005674C9: mov var_80, 0041E890h ; "'"
  loc_005674D0: mov var_88, 00000008h
  loc_005674DA: call [004011B4h] ; __vbaVarCat
  loc_005674E0: push eax
  loc_005674E1: lea edx, var_88
  loc_005674E7: lea eax, var_48
  loc_005674EA: push edx
  loc_005674EB: push eax
  loc_005674EC: call [004011B4h] ; __vbaVarCat
  loc_005674F2: push eax
  loc_005674F3: call [00401028h] ; __vbaStrVarMove
  loc_005674F9: sub esp, 00000010h
  loc_005674FC: mov ecx, 00000002h
  loc_00567501: mov edx, esp
  loc_00567503: sub esp, 00000010h
  loc_00567506: mov var_58, 00000008h
  loc_0056750D: mov var_50, eax
  loc_00567510: mov [edx], ecx
  loc_00567512: mov ecx, var_94
  loc_00567518: mov [edx+00000004h], ecx
  loc_0056751B: xor ecx, ecx
  loc_0056751D: mov [edx+00000008h], ecx
  loc_00567520: mov ecx, var_8C
  loc_00567526: mov [edx+0000000Ch], ecx
  loc_00567529: mov ecx, var_58
  loc_0056752C: mov edx, esp
  loc_0056752E: push 00000001h
  loc_00567530: push 0000001Dh
  loc_00567532: push esi
  loc_00567533: mov [edx], ecx
  loc_00567535: mov ecx, var_54
  loc_00567538: mov [edx+00000004h], ecx
  loc_0056753B: mov ecx, [esi]
  loc_0056753D: mov [edx+00000008h], eax
  loc_00567540: mov eax, var_4C
  loc_00567543: mov [edx+0000000Ch], eax
  loc_00567546: call [ecx+0000033Ch]
  loc_0056754C: lea edx, var_18
  loc_0056754F: push eax
  loc_00567550: push edx
  loc_00567551: call edi
  loc_00567553: push eax
  loc_00567554: call [00401160h] ; __vbaLateIdCallSt
  loc_0056755A: add esp, 0000002Ch
  loc_0056755D: lea ecx, var_18
  loc_00567560: call ebx
  loc_00567562: lea eax, var_58
  loc_00567565: lea ecx, var_48
  loc_00567568: push eax
  loc_00567569: lea edx, var_38
  loc_0056756C: push ecx
  loc_0056756D: lea eax, var_28
  loc_00567570: push edx
  loc_00567571: push eax
  loc_00567572: push 00000004h
  loc_00567574: call [00401038h] ; __vbaFreeVarList
  loc_0056757A: add esp, 00000004h
  loc_0056757D: mov ecx, 00000003h
  loc_00567582: mov edx, esp
  loc_00567584: mov var_68, ecx
  loc_00567587: mov eax, 00000002h
  loc_0056758C: push 00000043h
  loc_0056758E: mov [edx], ecx
  loc_00567590: mov ecx, var_64
  loc_00567593: mov var_60, eax
  loc_00567596: push esi
  loc_00567597: mov [edx+00000004h], ecx
  loc_0056759A: mov ecx, [esi]
  loc_0056759C: mov [edx+00000008h], eax
  loc_0056759F: mov eax, var_5C
  loc_005675A2: mov [edx+0000000Ch], eax
  loc_005675A5: call [ecx+0000033Ch]
  loc_005675AB: lea edx, var_18
  loc_005675AE: push eax
  loc_005675AF: push edx
  loc_005675B0: call edi
  loc_005675B2: push eax
  loc_005675B3: call [00401288h] ; __vbaLateIdSt
  loc_005675B9: lea ecx, var_18
  loc_005675BC: call ebx
  loc_005675BE: sub esp, 00000010h
  loc_005675C1: mov ecx, 00000002h
  loc_005675C6: mov edx, esp
  loc_005675C8: mov var_68, ecx
  loc_005675CB: mov eax, 00000001h
  loc_005675D0: push 00000011h
  loc_005675D2: mov [edx], ecx
  loc_005675D4: mov ecx, var_64
  loc_005675D7: mov var_60, eax
  loc_005675DA: push esi
  loc_005675DB: mov [edx+00000004h], ecx
  loc_005675DE: mov ecx, [esi]
  loc_005675E0: mov [edx+00000008h], eax
  loc_005675E3: mov eax, var_5C
  loc_005675E6: mov [edx+0000000Ch], eax
  loc_005675E9: call [ecx+0000033Ch]
  loc_005675EF: lea edx, var_18
  loc_005675F2: push eax
  loc_005675F3: push edx
  loc_005675F4: call edi
  loc_005675F6: push eax
  loc_005675F7: call [00401288h] ; __vbaLateIdSt
  loc_005675FD: lea ecx, var_18
  loc_00567600: call ebx
  loc_00567602: mov eax, [esi]
  loc_00567604: push 00000001h
  loc_00567606: push esi
  loc_00567607: call [eax+000000A4h]
  loc_0056760D: test eax, eax
  loc_0056760F: fnclex
  loc_00567611: jge 00567625h
  loc_00567613: push 000000A4h
  loc_00567618: push 00428D68h
  loc_0056761D: push esi
  loc_0056761E: push eax
  loc_0056761F: call [00401074h] ; __vbaHresultCheckObj
  loc_00567625: mov var_4, 00000000h
  loc_0056762C: push 00567659h
  loc_00567631: jmp 00567658h
  loc_00567633: lea ecx, var_18
  loc_00567636: call [004012B0h] ; __vbaFreeObj
  loc_0056763C: lea ecx, var_58
  loc_0056763F: lea edx, var_48
  loc_00567642: push ecx
  loc_00567643: lea eax, var_38
  loc_00567646: push edx
  loc_00567647: lea ecx, var_28
  loc_0056764A: push eax
  loc_0056764B: push ecx
  loc_0056764C: push 00000004h
  loc_0056764E: call [00401038h] ; __vbaFreeVarList
  loc_00567654: add esp, 00000014h
  loc_00567657: ret
  loc_00567658: ret
  loc_00567659: mov eax, Me
  loc_0056765C: push eax
  loc_0056765D: mov edx, [eax]
  loc_0056765F: call [edx+00000008h]
  loc_00567662: mov eax, var_4
  loc_00567665: mov ecx, var_14
  loc_00567668: pop edi
  loc_00567669: pop esi
  loc_0056766A: mov fs:[00000000h], ecx
  loc_00567671: pop ebx
  loc_00567672: mov esp, ebp
  loc_00567674: pop ebp
  loc_00567675: retn 0004h
End Sub

Private Sub cmdName_Click() '566EA0
  loc_00566EA0: push ebp
  loc_00566EA1: mov ebp, esp
  loc_00566EA3: sub esp, 0000000Ch
  loc_00566EA6: push 00403B36h ; __vbaExceptHandler
  loc_00566EAB: mov eax, fs:[00000000h]
  loc_00566EB1: push eax
  loc_00566EB2: mov fs:[00000000h], esp
  loc_00566EB9: sub esp, 00000058h
  loc_00566EBC: push ebx
  loc_00566EBD: push esi
  loc_00566EBE: push edi
  loc_00566EBF: mov var_C, esp
  loc_00566EC2: mov var_8, 00402A40h
  loc_00566EC9: mov esi, Me
  loc_00566ECC: mov eax, esi
  loc_00566ECE: and eax, 00000001h
  loc_00566ED1: mov var_4, eax
  loc_00566ED4: and esi, FFFFFFFEh
  loc_00566ED7: push esi
  loc_00566ED8: mov Me, esi
  loc_00566EDB: mov ecx, [esi]
  loc_00566EDD: call [ecx+00000004h]
  loc_00566EE0: xor edi, edi
  loc_00566EE2: mov edx, 0041E5D4h
  loc_00566EE7: mov ecx, 0061A0A0h
  loc_00566EEC: mov var_18, edi
  loc_00566EEF: mov var_1C, edi
  loc_00566EF2: mov var_2C, edi
  loc_00566EF5: mov var_3C, edi
  loc_00566EF8: mov var_4C, edi
  loc_00566EFB: mov var_5C, edi
  loc_00566EFE: call [004011ECh] ; __vbaStrCopy
  loc_00566F04: cmp [0061A11Ch], edi
  loc_00566F0A: jnz 00566F1Ch
  loc_00566F0C: push 0061A11Ch
  loc_00566F11: push 004069CCh
  loc_00566F16: call [004011DCh] ; __vbaNew2
  loc_00566F1C: sub esp, 00000010h
  loc_00566F1F: mov ecx, 0000000Ah
  loc_00566F24: mov ebx, esp
  loc_00566F26: mov var_5C, ecx
  loc_00566F29: mov eax, 80020004h
  loc_00566F2E: sub esp, 00000010h
  loc_00566F31: mov [ebx], ecx
  loc_00566F33: mov ecx, var_58
  loc_00566F36: mov var_54, eax
  loc_00566F39: mov edi, [0061A11Ch]
  loc_00566F3F: mov [ebx+00000004h], ecx
  loc_00566F42: mov var_4C, 00000002h
  loc_00566F49: mov ecx, esp
  loc_00566F4B: mov var_44, 00000001h
  loc_00566F52: mov [ebx+00000008h], eax
  loc_00566F55: mov eax, var_50
  loc_00566F58: mov edx, [edi]
  loc_00566F5A: push edi
  loc_00566F5B: mov [ebx+0000000Ch], eax
  loc_00566F5E: mov eax, var_4C
  loc_00566F61: mov [ecx], eax
  loc_00566F63: mov eax, var_48
  loc_00566F66: mov [ecx+00000004h], eax
  loc_00566F69: mov eax, var_44
  loc_00566F6C: mov [ecx+00000008h], eax
  loc_00566F6F: mov eax, var_40
  loc_00566F72: mov [ecx+0000000Ch], eax
  loc_00566F75: call [edx+000002B0h]
  loc_00566F7B: test eax, eax
  loc_00566F7D: fnclex
  loc_00566F7F: jge 00566F93h
  loc_00566F81: push 000002B0h
  loc_00566F86: push 0041E6D0h
  loc_00566F8B: push edi
  loc_00566F8C: push eax
  loc_00566F8D: call [00401074h] ; __vbaHresultCheckObj
  loc_00566F93: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00566F99: lea ecx, var_4C
  loc_00566F9C: lea edx, var_2C
  loc_00566F9F: push ecx
  loc_00566FA0: push edx
  loc_00566FA1: mov var_44, 0061A0B8h
  loc_00566FA8: mov var_4C, 00004008h
  loc_00566FAF: call ebx
  loc_00566FB1: lea eax, var_2C
  loc_00566FB4: lea ecx, var_5C
  loc_00566FB7: push eax
  loc_00566FB8: push ecx
  loc_00566FB9: mov var_54, 0041E5D4h
  loc_00566FC0: mov var_5C, 00008008h
  loc_00566FC7: call [00401218h] ; __vbaVarTstNe
  loc_00566FCD: lea ecx, var_2C
  loc_00566FD0: mov di, ax
  loc_00566FD3: call [00401020h] ; __vbaFreeVar
  loc_00566FD9: test di, di
  loc_00566FDC: jz 005670BBh
  loc_00566FE2: mov edx, [esi]
  loc_00566FE4: push esi
  loc_00566FE5: call [edx+00000304h]
  loc_00566FEB: push eax
  loc_00566FEC: lea eax, var_1C
  loc_00566FEF: push eax
  loc_00566FF0: call [004010A0h] ; __vbaObjSet
  loc_00566FF6: lea ecx, var_4C
  loc_00566FF9: lea edx, var_2C
  loc_00566FFC: push ecx
  loc_00566FFD: push edx
  loc_00566FFE: mov edi, eax
  loc_00567000: mov var_44, 0061A0B8h
  loc_00567007: mov var_4C, 00004008h
  loc_0056700E: call ebx
  loc_00567010: mov ebx, [edi]
  loc_00567012: lea eax, var_2C
  loc_00567015: lea ecx, var_18
  loc_00567018: push eax
  loc_00567019: push ecx
  loc_0056701A: call [004011B0h] ; __vbaStrVarVal
  loc_00567020: push eax
  loc_00567021: push edi
  loc_00567022: call [ebx+000000A4h]
  loc_00567028: test eax, eax
  loc_0056702A: fnclex
  loc_0056702C: jge 00567040h
  loc_0056702E: push 000000A4h
  loc_00567033: push 0041E5E8h
  loc_00567038: push edi
  loc_00567039: push eax
  loc_0056703A: call [00401074h] ; __vbaHresultCheckObj
  loc_00567040: mov edi, [004012ACh] ; __vbaFreeStr
  loc_00567046: lea ecx, var_18
  loc_00567049: call edi
  loc_0056704B: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_00567051: lea ecx, var_1C
  loc_00567054: call ebx
  loc_00567056: lea ecx, var_2C
  loc_00567059: call [00401020h] ; __vbaFreeVar
  loc_0056705F: mov edx, [esi]
  loc_00567061: push 00000000h
  loc_00567063: push 00000044h
  loc_00567065: push esi
  loc_00567066: call [edx+00000340h]
  loc_0056706C: push eax
  loc_0056706D: lea eax, var_1C
  loc_00567070: push eax
  loc_00567071: call [004010A0h] ; __vbaObjSet
  loc_00567077: push eax
  loc_00567078: call [00401024h] ; __vbaLateIdCall
  loc_0056707E: add esp, 0000000Ch
  loc_00567081: lea ecx, var_1C
  loc_00567084: call ebx
  loc_00567086: push 00000001h
  loc_00567088: call [00401008h] ; __vbaStrI2
  loc_0056708E: mov edx, eax
  loc_00567090: lea ecx, var_18
  loc_00567093: call [00401270h] ; __vbaStrMove
  loc_00567099: mov edx, eax
  loc_0056709B: lea ecx, [esi+00000038h]
  loc_0056709E: call [004011ECh] ; __vbaStrCopy
  loc_005670A4: lea ecx, var_18
  loc_005670A7: call edi
  loc_005670A9: mov ecx, [esi]
  loc_005670AB: push esi
  loc_005670AC: call [ecx+00000700h]
  loc_005670B2: mov edx, [esi]
  loc_005670B4: push esi
  loc_005670B5: call [edx+00000704h]
  loc_005670BB: mov var_4, 00000000h
  loc_005670C2: push 005670F0h
  loc_005670C7: jmp 005670EFh
  loc_005670C9: lea ecx, var_18
  loc_005670CC: call [004012ACh] ; __vbaFreeStr
  loc_005670D2: lea ecx, var_1C
  loc_005670D5: call [004012B0h] ; __vbaFreeObj
  loc_005670DB: lea eax, var_3C
  loc_005670DE: lea ecx, var_2C
  loc_005670E1: push eax
  loc_005670E2: push ecx
  loc_005670E3: push 00000002h
  loc_005670E5: call [00401038h] ; __vbaFreeVarList
  loc_005670EB: add esp, 0000000Ch
  loc_005670EE: ret
  loc_005670EF: ret
  loc_005670F0: mov eax, Me
  loc_005670F3: push eax
  loc_005670F4: mov edx, [eax]
  loc_005670F6: call [edx+00000008h]
  loc_005670F9: mov eax, var_4
  loc_005670FC: mov ecx, var_14
  loc_005670FF: pop edi
  loc_00567100: pop esi
  loc_00567101: mov fs:[00000000h], ecx
  loc_00567108: pop ebx
  loc_00567109: mov esp, ebp
  loc_0056710B: pop ebp
  loc_0056710C: retn 0004h
End Sub

Private Sub txtCustomerName_KeyPress(KeyAscii As Integer) '56A6A0
  loc_0056A6A0: push ebp
  loc_0056A6A1: mov ebp, esp
  loc_0056A6A3: sub esp, 0000000Ch
  loc_0056A6A6: push 00403B36h ; __vbaExceptHandler
  loc_0056A6AB: mov eax, fs:[00000000h]
  loc_0056A6B1: push eax
  loc_0056A6B2: mov fs:[00000000h], esp
  loc_0056A6B9: sub esp, 00000014h
  loc_0056A6BC: push ebx
  loc_0056A6BD: push esi
  loc_0056A6BE: push edi
  loc_0056A6BF: mov var_C, esp
  loc_0056A6C2: mov var_8, 00402AF8h
  loc_0056A6C9: mov esi, Me
  loc_0056A6CC: mov eax, esi
  loc_0056A6CE: and eax, 00000001h
  loc_0056A6D1: mov var_4, eax
  loc_0056A6D4: and esi, FFFFFFFEh
  loc_0056A6D7: push esi
  loc_0056A6D8: mov Me, esi
  loc_0056A6DB: mov ecx, [esi]
  loc_0056A6DD: call [ecx+00000004h]
  loc_0056A6E0: mov edx, KeyAscii
  loc_0056A6E3: xor edi, edi
  loc_0056A6E5: mov var_18, edi
  loc_0056A6E8: cmp [edx], 000Dh
  loc_0056A6EC: jnz 0056A72Eh
  loc_0056A6EE: mov eax, [esi]
  loc_0056A6F0: push esi
  loc_0056A6F1: call [eax+00000328h]
  loc_0056A6F7: lea ecx, var_18
  loc_0056A6FA: push eax
  loc_0056A6FB: push ecx
  loc_0056A6FC: call [004010A0h] ; __vbaObjSet
  loc_0056A702: mov esi, eax
  loc_0056A704: push esi
  loc_0056A705: mov edx, [esi]
  loc_0056A707: call [edx+00000204h]
  loc_0056A70D: cmp eax, edi
  loc_0056A70F: fnclex
  loc_0056A711: jge 0056A725h
  loc_0056A713: push 00000204h
  loc_0056A718: push 0041E5E8h
  loc_0056A71D: push esi
  loc_0056A71E: push eax
  loc_0056A71F: call [00401074h] ; __vbaHresultCheckObj
  loc_0056A725: lea ecx, var_18
  loc_0056A728: call [004012B0h] ; __vbaFreeObj
  loc_0056A72E: mov var_4, edi
  loc_0056A731: push 0056A743h
  loc_0056A736: jmp 0056A742h
  loc_0056A738: lea ecx, var_18
  loc_0056A73B: call [004012B0h] ; __vbaFreeObj
  loc_0056A741: ret
  loc_0056A742: ret
  loc_0056A743: mov eax, Me
  loc_0056A746: push eax
  loc_0056A747: mov ecx, [eax]
  loc_0056A749: call [ecx+00000008h]
  loc_0056A74C: mov eax, var_4
  loc_0056A74F: mov ecx, var_14
  loc_0056A752: pop edi
  loc_0056A753: pop esi
  loc_0056A754: mov fs:[00000000h], ecx
  loc_0056A75B: pop ebx
  loc_0056A75C: mov esp, ebp
  loc_0056A75E: pop ebp
  loc_0056A75F: retn 0008h
End Sub

Private Sub txtCustomerName_LostFocus() '56A770
  loc_0056A770: push ebp
  loc_0056A771: mov ebp, esp
  loc_0056A773: sub esp, 0000000Ch
  loc_0056A776: push 00403B36h ; __vbaExceptHandler
  loc_0056A77B: mov eax, fs:[00000000h]
  loc_0056A781: push eax
  loc_0056A782: mov fs:[00000000h], esp
  loc_0056A789: sub esp, 000000ACh
  loc_0056A78F: push ebx
  loc_0056A790: push esi
  loc_0056A791: push edi
  loc_0056A792: mov var_C, esp
  loc_0056A795: mov var_8, 00402B08h
  loc_0056A79C: mov edi, Me
  loc_0056A79F: mov eax, edi
  loc_0056A7A1: and eax, 00000001h
  loc_0056A7A4: mov var_4, eax
  loc_0056A7A7: and edi, FFFFFFFEh
  loc_0056A7AA: push edi
  loc_0056A7AB: mov Me, edi
  loc_0056A7AE: mov ecx, [edi]
  loc_0056A7B0: call [ecx+00000004h]
  loc_0056A7B3: mov edx, [edi]
  loc_0056A7B5: xor ebx, ebx
  loc_0056A7B7: push edi
  loc_0056A7B8: mov var_18, ebx
  loc_0056A7BB: mov var_1C, ebx
  loc_0056A7BE: mov var_20, ebx
  loc_0056A7C1: mov var_30, ebx
  loc_0056A7C4: mov var_40, ebx
  loc_0056A7C7: mov var_50, ebx
  loc_0056A7CA: mov var_60, ebx
  loc_0056A7CD: mov var_70, ebx
  loc_0056A7D0: mov var_80, ebx
  loc_0056A7D3: mov var_90, ebx
  loc_0056A7D9: mov var_A4, ebx
  loc_0056A7DF: call [edx+00000304h]
  loc_0056A7E5: push eax
  loc_0056A7E6: lea eax, var_20
  loc_0056A7E9: push eax
  loc_0056A7EA: call [004010A0h] ; __vbaObjSet
  loc_0056A7F0: mov esi, eax
  loc_0056A7F2: lea edx, var_18
  loc_0056A7F5: push edx
  loc_0056A7F6: push esi
  loc_0056A7F7: mov ecx, [esi]
  loc_0056A7F9: call [ecx+000000A0h]
  loc_0056A7FF: cmp eax, ebx
  loc_0056A801: fnclex
  loc_0056A803: jge 0056A817h
  loc_0056A805: push 000000A0h
  loc_0056A80A: push 0041E5E8h
  loc_0056A80F: push esi
  loc_0056A810: push eax
  loc_0056A811: call [00401074h] ; __vbaHresultCheckObj
  loc_0056A817: mov eax, var_18
  loc_0056A81A: lea ecx, var_40
  loc_0056A81D: mov var_28, eax
  loc_0056A820: lea eax, var_30
  loc_0056A823: push eax
  loc_0056A824: push ecx
  loc_0056A825: mov var_18, ebx
  loc_0056A828: mov var_30, 00000008h
  loc_0056A82F: call [004010D4h] ; rtcTrimVar
  loc_0056A835: lea edx, var_40
  loc_0056A838: lea eax, var_70
  loc_0056A83B: push edx
  loc_0056A83C: push eax
  loc_0056A83D: mov var_68, 0041E5D4h
  loc_0056A844: mov var_70, 00008008h
  loc_0056A84B: call [00401218h] ; __vbaVarTstNe
  loc_0056A851: lea ecx, var_20
  loc_0056A854: mov si, ax
  loc_0056A857: call [004012B0h] ; __vbaFreeObj
  loc_0056A85D: lea ecx, var_40
  loc_0056A860: lea edx, var_30
  loc_0056A863: push ecx
  loc_0056A864: push edx
  loc_0056A865: push 00000002h
  loc_0056A867: call [00401038h] ; __vbaFreeVarList
  loc_0056A86D: add esp, 0000000Ch
  loc_0056A870: cmp si, bx
  loc_0056A873: jz 0056AB15h
  loc_0056A879: lea ebx, var_20
  loc_0056A87C: mov ecx, 0000000Ah
  loc_0056A881: push ebx
  loc_0056A882: mov var_80, ecx
  loc_0056A885: sub esp, 00000010h
  loc_0056A888: mov eax, 80020004h
  loc_0056A88D: mov ebx, esp
  loc_0056A88F: mov edx, eax
  loc_0056A891: sub esp, 00000010h
  loc_0056A894: mov var_78, edx
  loc_0056A897: mov [ebx], ecx
  loc_0056A899: mov ecx, var_8C
  loc_0056A89F: mov var_70, 00000003h
  loc_0056A8A6: mov esi, [0061A13Ch]
  loc_0056A8AC: mov [ebx+00000004h], ecx
  loc_0056A8AF: mov ecx, esp
  loc_0056A8B1: sub esp, 00000010h
  loc_0056A8B4: mov var_68, 00000004h
  loc_0056A8BB: mov [ebx+00000008h], eax
  loc_0056A8BE: mov eax, var_84
  loc_0056A8C4: mov esi, [esi]
  loc_0056A8C6: mov [ebx+0000000Ch], eax
  loc_0056A8C9: mov eax, var_80
  loc_0056A8CC: mov [ecx], eax
  loc_0056A8CE: mov eax, var_7C
  loc_0056A8D1: mov [ecx+00000004h], eax
  loc_0056A8D4: mov eax, esp
  loc_0056A8D6: push 0041F1ACh ; "Select * From AgentThai"
  loc_0056A8DB: mov [ecx+00000008h], edx
  loc_0056A8DE: mov edx, var_74
  loc_0056A8E1: mov [ecx+0000000Ch], edx
  loc_0056A8E4: mov ecx, var_70
  loc_0056A8E7: mov edx, var_6C
  loc_0056A8EA: mov [eax], ecx
  loc_0056A8EC: mov ecx, var_68
  loc_0056A8EF: mov [eax+00000004h], edx
  loc_0056A8F2: mov edx, var_64
  loc_0056A8F5: mov [eax+00000008h], ecx
  loc_0056A8F8: mov [eax+0000000Ch], edx
  loc_0056A8FB: mov eax, [0061A13Ch]
  loc_0056A900: push eax
  loc_0056A901: call [esi+000000BCh]
  loc_0056A907: xor ebx, ebx
  loc_0056A909: cmp eax, ebx
  loc_0056A90B: fnclex
  loc_0056A90D: jge 0056A927h
  loc_0056A90F: mov ecx, [0061A13Ch]
  loc_0056A915: push 000000BCh
  loc_0056A91A: push 0041E928h
  loc_0056A91F: push ecx
  loc_0056A920: push eax
  loc_0056A921: call [00401074h] ; __vbaHresultCheckObj
  loc_0056A927: mov edx, var_20
  loc_0056A92A: lea esi, [edi+00000034h]
  loc_0056A92D: push edx
  loc_0056A92E: push esi
  loc_0056A92F: call [004010B8h] ; __vbaObjSetAddref
  loc_0056A935: lea ecx, var_20
  loc_0056A938: call [004012B0h] ; __vbaFreeObj
  loc_0056A93E: mov eax, [edi]
  loc_0056A940: push edi
  loc_0056A941: mov var_68, 00429148h ; "AgentName='"
  loc_0056A948: mov var_70, 00000008h
  loc_0056A94F: call [eax+00000304h]
  loc_0056A955: lea ecx, var_20
  loc_0056A958: push eax
  loc_0056A959: push ecx
  loc_0056A95A: call [004010A0h] ; __vbaObjSet
  loc_0056A960: mov edi, eax
  loc_0056A962: lea eax, var_18
  loc_0056A965: push eax
  loc_0056A966: push edi
  loc_0056A967: mov edx, [edi]
  loc_0056A969: call [edx+000000A0h]
  loc_0056A96F: cmp eax, ebx
  loc_0056A971: fnclex
  loc_0056A973: jge 0056A987h
  loc_0056A975: push 000000A0h
  loc_0056A97A: push 0041E5E8h
  loc_0056A97F: push edi
  loc_0056A980: push eax
  loc_0056A981: call [00401074h] ; __vbaHresultCheckObj
  loc_0056A987: mov eax, var_18
  loc_0056A98A: lea ecx, var_30
  loc_0056A98D: lea edx, var_40
  loc_0056A990: mov edi, 00000008h
  loc_0056A995: push ecx
  loc_0056A996: push edx
  loc_0056A997: mov var_18, ebx
  loc_0056A99A: mov var_28, eax
  loc_0056A99D: mov var_30, edi
  loc_0056A9A0: call [004010D4h] ; rtcTrimVar
  loc_0056A9A6: mov eax, [esi]
  loc_0056A9A8: mov var_78, 0041E890h ; "'"
  loc_0056A9AF: mov var_80, edi
  loc_0056A9B2: lea ecx, var_70
  loc_0056A9B5: mov edi, [eax]
  loc_0056A9B7: lea edx, var_40
  loc_0056A9BA: push ecx
  loc_0056A9BB: lea eax, var_50
  loc_0056A9BE: push edx
  loc_0056A9BF: push eax
  loc_0056A9C0: call [004011B4h] ; __vbaVarCat
  loc_0056A9C6: lea ecx, var_80
  loc_0056A9C9: push eax
  loc_0056A9CA: lea edx, var_60
  loc_0056A9CD: push ecx
  loc_0056A9CE: push edx
  loc_0056A9CF: call [004011B4h] ; __vbaVarCat
  loc_0056A9D5: push eax
  loc_0056A9D6: lea eax, var_1C
  loc_0056A9D9: push eax
  loc_0056A9DA: call [004011B0h] ; __vbaStrVarVal
  loc_0056A9E0: mov ecx, [esi]
  loc_0056A9E2: push eax
  loc_0056A9E3: push ecx
  loc_0056A9E4: call [edi+000000D4h]
  loc_0056A9EA: cmp eax, ebx
  loc_0056A9EC: fnclex
  loc_0056A9EE: jge 0056AA04h
  loc_0056A9F0: mov edx, [esi]
  loc_0056A9F2: push 000000D4h
  loc_0056A9F7: push 0041E938h
  loc_0056A9FC: push edx
  loc_0056A9FD: push eax
  loc_0056A9FE: call [00401074h] ; __vbaHresultCheckObj
  loc_0056AA04: lea ecx, var_1C
  loc_0056AA07: call [004012ACh] ; __vbaFreeStr
  loc_0056AA0D: lea ecx, var_20
  loc_0056AA10: call [004012B0h] ; __vbaFreeObj
  loc_0056AA16: mov edi, [00401038h] ; __vbaFreeVarList
  loc_0056AA1C: lea eax, var_60
  loc_0056AA1F: lea ecx, var_50
  loc_0056AA22: push eax
  loc_0056AA23: lea edx, var_40
  loc_0056AA26: push ecx
  loc_0056AA27: lea eax, var_30
  loc_0056AA2A: push edx
  loc_0056AA2B: push eax
  loc_0056AA2C: push 00000004h
  loc_0056AA2E: call edi
  loc_0056AA30: mov eax, [esi]
  loc_0056AA32: add esp, 00000014h
  loc_0056AA35: lea edx, var_A4
  loc_0056AA3B: mov ecx, [eax]
  loc_0056AA3D: push edx
  loc_0056AA3E: push eax
  loc_0056AA3F: call [ecx+0000005Ch]
  loc_0056AA42: cmp eax, ebx
  loc_0056AA44: fnclex
  loc_0056AA46: jge 0056AA59h
  loc_0056AA48: mov ecx, [esi]
  loc_0056AA4A: push 0000005Ch
  loc_0056AA4C: push 0041E938h
  loc_0056AA51: push ecx
  loc_0056AA52: push eax
  loc_0056AA53: call [00401074h] ; __vbaHresultCheckObj
  loc_0056AA59: cmp var_A4, FFFFFFh
  loc_0056AA61: jnz 0056AAC8h
  loc_0056AA63: mov ecx, 80020004h
  loc_0056AA68: mov eax, 0000000Ah
  loc_0056AA6D: mov var_58, ecx
  loc_0056AA70: mov var_48, ecx
  loc_0056AA73: mov var_38, ecx
  loc_0056AA76: lea edx, var_70
  loc_0056AA79: lea ecx, var_30
  loc_0056AA7C: mov var_60, eax
  loc_0056AA7F: mov var_50, eax
  loc_0056AA82: mov var_40, eax
  loc_0056AA85: mov var_68, 00429164h ; "CustomerName Not Found"
  loc_0056AA8C: mov var_70, 00000008h
  loc_0056AA93: call [00401240h] ; __vbaVarDup
  loc_0056AA99: lea edx, var_60
  loc_0056AA9C: lea eax, var_50
  loc_0056AA9F: push edx
  loc_0056AAA0: lea ecx, var_40
  loc_0056AAA3: push eax
  loc_0056AAA4: push ecx
  loc_0056AAA5: lea edx, var_30
  loc_0056AAA8: push 00000010h
  loc_0056AAAA: push edx
  loc_0056AAAB: call [004010A4h] ; rtcMsgBox
  loc_0056AAB1: lea eax, var_60
  loc_0056AAB4: lea ecx, var_50
  loc_0056AAB7: push eax
  loc_0056AAB8: lea edx, var_40
  loc_0056AABB: push ecx
  loc_0056AABC: lea eax, var_30
  loc_0056AABF: push edx
  loc_0056AAC0: push eax
  loc_0056AAC1: push 00000004h
  loc_0056AAC3: call edi
  loc_0056AAC5: add esp, 00000014h
  loc_0056AAC8: mov eax, [esi]
  loc_0056AACA: push eax
  loc_0056AACB: mov ecx, [eax]
  loc_0056AACD: call [ecx+000000C4h]
  loc_0056AAD3: cmp eax, ebx
  loc_0056AAD5: fnclex
  loc_0056AAD7: jge 0056AAEDh
  loc_0056AAD9: mov edx, [esi]
  loc_0056AADB: push 000000C4h
  loc_0056AAE0: push 0041E938h
  loc_0056AAE5: push edx
  loc_0056AAE6: push eax
  loc_0056AAE7: call [00401074h] ; __vbaHresultCheckObj
  loc_0056AAED: push 0041E938h
  loc_0056AAF2: push ebx
  loc_0056AAF3: call [00401274h] ; __vbaCastObj
  loc_0056AAF9: push eax
  loc_0056AAFA: lea eax, var_20
  loc_0056AAFD: push eax
  loc_0056AAFE: call [004010A0h] ; __vbaObjSet
  loc_0056AB04: push eax
  loc_0056AB05: push esi
  loc_0056AB06: call [004010B8h] ; __vbaObjSetAddref
  loc_0056AB0C: lea ecx, var_20
  loc_0056AB0F: call [004012B0h] ; __vbaFreeObj
  loc_0056AB15: mov var_4, ebx
  loc_0056AB18: push 0056AB58h
  loc_0056AB1D: jmp 0056AB57h
  loc_0056AB1F: lea ecx, var_1C
  loc_0056AB22: lea edx, var_18
  loc_0056AB25: push ecx
  loc_0056AB26: push edx
  loc_0056AB27: push 00000002h
  loc_0056AB29: call [004011FCh] ; __vbaFreeStrList
  loc_0056AB2F: add esp, 0000000Ch
  loc_0056AB32: lea ecx, var_20
  loc_0056AB35: call [004012B0h] ; __vbaFreeObj
  loc_0056AB3B: lea eax, var_60
  loc_0056AB3E: lea ecx, var_50
  loc_0056AB41: push eax
  loc_0056AB42: lea edx, var_40
  loc_0056AB45: push ecx
  loc_0056AB46: lea eax, var_30
  loc_0056AB49: push edx
  loc_0056AB4A: push eax
  loc_0056AB4B: push 00000004h
  loc_0056AB4D: call [00401038h] ; __vbaFreeVarList
  loc_0056AB53: add esp, 00000014h
  loc_0056AB56: ret
  loc_0056AB57: ret
  loc_0056AB58: mov eax, Me
  loc_0056AB5B: push eax
  loc_0056AB5C: mov ecx, [eax]
  loc_0056AB5E: call [ecx+00000008h]
  loc_0056AB61: mov eax, var_4
  loc_0056AB64: mov ecx, var_14
  loc_0056AB67: pop edi
  loc_0056AB68: pop esi
  loc_0056AB69: mov fs:[00000000h], ecx
  loc_0056AB70: pop ebx
  loc_0056AB71: mov esp, ebp
  loc_0056AB73: pop ebp
  loc_0056AB74: retn 0004h
End Sub

Private Sub cmdSearch_Click() '567710
  loc_00567710: push ebp
  loc_00567711: mov ebp, esp
  loc_00567713: sub esp, 0000000Ch
  loc_00567716: push 00403B36h ; __vbaExceptHandler
  loc_0056771B: mov eax, fs:[00000000h]
  loc_00567721: push eax
  loc_00567722: mov fs:[00000000h], esp
  loc_00567729: sub esp, 00000058h
  loc_0056772C: push ebx
  loc_0056772D: push esi
  loc_0056772E: push edi
  loc_0056772F: mov var_C, esp
  loc_00567732: mov var_8, 00402A88h
  loc_00567739: mov esi, Me
  loc_0056773C: mov eax, esi
  loc_0056773E: and eax, 00000001h
  loc_00567741: mov var_4, eax
  loc_00567744: and esi, FFFFFFFEh
  loc_00567747: push esi
  loc_00567748: mov Me, esi
  loc_0056774B: mov ecx, [esi]
  loc_0056774D: call [ecx+00000004h]
  loc_00567750: xor edi, edi
  loc_00567752: mov edx, 004269F8h ; "SrAgent"
  loc_00567757: mov ecx, 0061A0A0h
  loc_0056775C: mov var_18, edi
  loc_0056775F: mov var_1C, edi
  loc_00567762: mov var_2C, edi
  loc_00567765: mov var_3C, edi
  loc_00567768: mov var_4C, edi
  loc_0056776B: mov var_5C, edi
  loc_0056776E: call [004011ECh] ; __vbaStrCopy
  loc_00567774: cmp [0061A11Ch], edi
  loc_0056777A: jnz 0056778Ch
  loc_0056777C: push 0061A11Ch
  loc_00567781: push 004069CCh
  loc_00567786: call [004011DCh] ; __vbaNew2
  loc_0056778C: sub esp, 00000010h
  loc_0056778F: mov ecx, 0000000Ah
  loc_00567794: mov ebx, esp
  loc_00567796: mov var_5C, ecx
  loc_00567799: mov eax, 80020004h
  loc_0056779E: sub esp, 00000010h
  loc_005677A1: mov [ebx], ecx
  loc_005677A3: mov ecx, var_58
  loc_005677A6: mov var_54, eax
  loc_005677A9: mov edi, [0061A11Ch]
  loc_005677AF: mov [ebx+00000004h], ecx
  loc_005677B2: mov var_4C, 00000002h
  loc_005677B9: mov ecx, esp
  loc_005677BB: mov var_44, 00000001h
  loc_005677C2: mov [ebx+00000008h], eax
  loc_005677C5: mov eax, var_50
  loc_005677C8: mov edx, [edi]
  loc_005677CA: push edi
  loc_005677CB: mov [ebx+0000000Ch], eax
  loc_005677CE: mov eax, var_4C
  loc_005677D1: mov [ecx], eax
  loc_005677D3: mov eax, var_48
  loc_005677D6: mov [ecx+00000004h], eax
  loc_005677D9: mov eax, var_44
  loc_005677DC: mov [ecx+00000008h], eax
  loc_005677DF: mov eax, var_40
  loc_005677E2: mov [ecx+0000000Ch], eax
  loc_005677E5: call [edx+000002B0h]
  loc_005677EB: test eax, eax
  loc_005677ED: fnclex
  loc_005677EF: jge 00567803h
  loc_005677F1: push 000002B0h
  loc_005677F6: push 0041E6D0h
  loc_005677FB: push edi
  loc_005677FC: push eax
  loc_005677FD: call [00401074h] ; __vbaHresultCheckObj
  loc_00567803: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00567809: lea ecx, var_4C
  loc_0056780C: lea edx, var_2C
  loc_0056780F: push ecx
  loc_00567810: push edx
  loc_00567811: mov var_44, 0061A0B8h
  loc_00567818: mov var_4C, 00004008h
  loc_0056781F: call ebx
  loc_00567821: lea eax, var_2C
  loc_00567824: lea ecx, var_5C
  loc_00567827: push eax
  loc_00567828: push ecx
  loc_00567829: mov var_54, 0041E5D4h
  loc_00567830: mov var_5C, 00008008h
  loc_00567837: call [00401218h] ; __vbaVarTstNe
  loc_0056783D: lea ecx, var_2C
  loc_00567840: mov di, ax
  loc_00567843: call [00401020h] ; __vbaFreeVar
  loc_00567849: test di, di
  loc_0056784C: jz 00567934h
  loc_00567852: mov edx, [esi]
  loc_00567854: push esi
  loc_00567855: call [edx+00000720h]
  loc_0056785B: mov eax, [esi]
  loc_0056785D: push esi
  loc_0056785E: call [eax+00000304h]
  loc_00567864: lea ecx, var_1C
  loc_00567867: push eax
  loc_00567868: push ecx
  loc_00567869: call [004010A0h] ; __vbaObjSet
  loc_0056786F: mov edi, eax
  loc_00567871: lea edx, var_4C
  loc_00567874: lea eax, var_2C
  loc_00567877: push edx
  loc_00567878: push eax
  loc_00567879: mov var_44, 0061A0B8h
  loc_00567880: mov var_4C, 00004008h
  loc_00567887: call ebx
  loc_00567889: mov ebx, [edi]
  loc_0056788B: lea ecx, var_2C
  loc_0056788E: lea edx, var_18
  loc_00567891: push ecx
  loc_00567892: push edx
  loc_00567893: call [004011B0h] ; __vbaStrVarVal
  loc_00567899: push eax
  loc_0056789A: push edi
  loc_0056789B: call [ebx+000000A4h]
  loc_005678A1: test eax, eax
  loc_005678A3: fnclex
  loc_005678A5: jge 005678B9h
  loc_005678A7: push 000000A4h
  loc_005678AC: push 0041E5E8h
  loc_005678B1: push edi
  loc_005678B2: push eax
  loc_005678B3: call [00401074h] ; __vbaHresultCheckObj
  loc_005678B9: mov edi, [004012ACh] ; __vbaFreeStr
  loc_005678BF: lea ecx, var_18
  loc_005678C2: call edi
  loc_005678C4: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005678CA: lea ecx, var_1C
  loc_005678CD: call ebx
  loc_005678CF: lea ecx, var_2C
  loc_005678D2: call [00401020h] ; __vbaFreeVar
  loc_005678D8: mov eax, [esi]
  loc_005678DA: push 00000000h
  loc_005678DC: push 00000044h
  loc_005678DE: push esi
  loc_005678DF: call [eax+00000340h]
  loc_005678E5: lea ecx, var_1C
  loc_005678E8: push eax
  loc_005678E9: push ecx
  loc_005678EA: call [004010A0h] ; __vbaObjSet
  loc_005678F0: push eax
  loc_005678F1: call [00401024h] ; __vbaLateIdCall
  loc_005678F7: add esp, 0000000Ch
  loc_005678FA: lea ecx, var_1C
  loc_005678FD: call ebx
  loc_005678FF: push 00000001h
  loc_00567901: call [00401008h] ; __vbaStrI2
  loc_00567907: mov edx, eax
  loc_00567909: lea ecx, var_18
  loc_0056790C: call [00401270h] ; __vbaStrMove
  loc_00567912: mov edx, eax
  loc_00567914: lea ecx, [esi+00000038h]
  loc_00567917: call [004011ECh] ; __vbaStrCopy
  loc_0056791D: lea ecx, var_18
  loc_00567920: call edi
  loc_00567922: mov edx, [esi]
  loc_00567924: push esi
  loc_00567925: call [edx+00000700h]
  loc_0056792B: mov eax, [esi]
  loc_0056792D: push esi
  loc_0056792E: call [eax+00000704h]
  loc_00567934: mov var_4, 00000000h
  loc_0056793B: push 00567969h
  loc_00567940: jmp 00567968h
  loc_00567942: lea ecx, var_18
  loc_00567945: call [004012ACh] ; __vbaFreeStr
  loc_0056794B: lea ecx, var_1C
  loc_0056794E: call [004012B0h] ; __vbaFreeObj
  loc_00567954: lea ecx, var_3C
  loc_00567957: lea edx, var_2C
  loc_0056795A: push ecx
  loc_0056795B: push edx
  loc_0056795C: push 00000002h
  loc_0056795E: call [00401038h] ; __vbaFreeVarList
  loc_00567964: add esp, 0000000Ch
  loc_00567967: ret
  loc_00567968: ret
  loc_00567969: mov eax, Me
  loc_0056796C: push eax
  loc_0056796D: mov ecx, [eax]
  loc_0056796F: call [ecx+00000008h]
  loc_00567972: mov eax, var_4
  loc_00567975: mov ecx, var_14
  loc_00567978: pop edi
  loc_00567979: pop esi
  loc_0056797A: mov fs:[00000000h], ecx
  loc_00567981: pop ebx
  loc_00567982: mov esp, ebp
  loc_00567984: pop ebp
  loc_00567985: retn 0004h
End Sub

Private Sub cmdClose_Click() '5667C0
  loc_005667C0: push ebp
  loc_005667C1: mov ebp, esp
  loc_005667C3: sub esp, 0000000Ch
  loc_005667C6: push 00403B36h ; __vbaExceptHandler
  loc_005667CB: mov eax, fs:[00000000h]
  loc_005667D1: push eax
  loc_005667D2: mov fs:[00000000h], esp
  loc_005667D9: sub esp, 00000018h
  loc_005667DC: push ebx
  loc_005667DD: push esi
  loc_005667DE: push edi
  loc_005667DF: mov var_C, esp
  loc_005667E2: mov var_8, 00402A10h
  loc_005667E9: mov edi, Me
  loc_005667EC: mov eax, edi
  loc_005667EE: and eax, 00000001h
  loc_005667F1: mov var_4, eax
  loc_005667F4: and edi, FFFFFFFEh
  loc_005667F7: push edi
  loc_005667F8: mov Me, edi
  loc_005667FB: mov ecx, [edi]
  loc_005667FD: call [ecx+00000004h]
  loc_00566800: mov eax, [0061B394h]
  loc_00566805: xor ebx, ebx
  loc_00566807: cmp eax, ebx
  loc_00566809: mov var_18, ebx
  loc_0056680C: jnz 0056681Eh
  loc_0056680E: push 0061B394h
  loc_00566813: push 0041E4A0h
  loc_00566818: call [004011DCh] ; __vbaNew2
  loc_0056681E: mov esi, [0061B394h]
  loc_00566824: lea eax, var_18
  loc_00566827: push edi
  loc_00566828: push eax
  loc_00566829: mov edx, [esi]
  loc_0056682B: mov var_2C, edx
  loc_0056682E: call [004010B8h] ; __vbaObjSetAddref
  loc_00566834: mov ecx, var_2C
  loc_00566837: push eax
  loc_00566838: push esi
  loc_00566839: call [ecx+00000010h]
  loc_0056683C: cmp eax, ebx
  loc_0056683E: fnclex
  loc_00566840: jge 00566851h
  loc_00566842: push 00000010h
  loc_00566844: push 0041E490h
  loc_00566849: push esi
  loc_0056684A: push eax
  loc_0056684B: call [00401074h] ; __vbaHresultCheckObj
  loc_00566851: lea ecx, var_18
  loc_00566854: call [004012B0h] ; __vbaFreeObj
  loc_0056685A: mov var_4, ebx
  loc_0056685D: push 0056686Fh
  loc_00566862: jmp 0056686Eh
  loc_00566864: lea ecx, var_18
  loc_00566867: call [004012B0h] ; __vbaFreeObj
  loc_0056686D: ret
  loc_0056686E: ret
  loc_0056686F: mov eax, Me
  loc_00566872: push eax
  loc_00566873: mov edx, [eax]
  loc_00566875: call [edx+00000008h]
  loc_00566878: mov eax, var_4
  loc_0056687B: mov ecx, var_14
  loc_0056687E: pop edi
  loc_0056687F: pop esi
  loc_00566880: mov fs:[00000000h], ecx
  loc_00566887: pop ebx
  loc_00566888: mov esp, ebp
  loc_0056688A: pop ebp
  loc_0056688B: retn 0004h
End Sub

Private Sub cmdDelete_Click() '566890
  loc_00566890: push ebp
  loc_00566891: mov ebp, esp
  loc_00566893: sub esp, 0000000Ch
  loc_00566896: push 00403B36h ; __vbaExceptHandler
  loc_0056689B: mov eax, fs:[00000000h]
  loc_005668A1: push eax
  loc_005668A2: mov fs:[00000000h], esp
  loc_005668A9: sub esp, 00000058h
  loc_005668AC: push ebx
  loc_005668AD: push esi
  loc_005668AE: push edi
  loc_005668AF: mov var_C, esp
  loc_005668B2: mov var_8, 00402A20h
  loc_005668B9: mov esi, Me
  loc_005668BC: mov eax, esi
  loc_005668BE: and eax, 00000001h
  loc_005668C1: mov var_4, eax
  loc_005668C4: and esi, FFFFFFFEh
  loc_005668C7: push esi
  loc_005668C8: mov Me, esi
  loc_005668CB: mov ecx, [esi]
  loc_005668CD: call [ecx+00000004h]
  loc_005668D0: xor edi, edi
  loc_005668D2: mov edx, 004269F8h ; "SrAgent"
  loc_005668D7: mov ecx, 0061A0A0h
  loc_005668DC: mov var_18, edi
  loc_005668DF: mov var_1C, edi
  loc_005668E2: mov var_2C, edi
  loc_005668E5: mov var_3C, edi
  loc_005668E8: mov var_4C, edi
  loc_005668EB: mov var_5C, edi
  loc_005668EE: call [004011ECh] ; __vbaStrCopy
  loc_005668F4: cmp [0061A11Ch], edi
  loc_005668FA: jnz 0056690Ch
  loc_005668FC: push 0061A11Ch
  loc_00566901: push 004069CCh
  loc_00566906: call [004011DCh] ; __vbaNew2
  loc_0056690C: sub esp, 00000010h
  loc_0056690F: mov ecx, 0000000Ah
  loc_00566914: mov ebx, esp
  loc_00566916: mov var_5C, ecx
  loc_00566919: mov eax, 80020004h
  loc_0056691E: sub esp, 00000010h
  loc_00566921: mov [ebx], ecx
  loc_00566923: mov ecx, var_58
  loc_00566926: mov var_54, eax
  loc_00566929: mov edi, [0061A11Ch]
  loc_0056692F: mov [ebx+00000004h], ecx
  loc_00566932: mov var_4C, 00000002h
  loc_00566939: mov ecx, esp
  loc_0056693B: mov var_44, 00000001h
  loc_00566942: mov [ebx+00000008h], eax
  loc_00566945: mov eax, var_50
  loc_00566948: mov edx, [edi]
  loc_0056694A: push edi
  loc_0056694B: mov [ebx+0000000Ch], eax
  loc_0056694E: mov eax, var_4C
  loc_00566951: mov [ecx], eax
  loc_00566953: mov eax, var_48
  loc_00566956: mov [ecx+00000004h], eax
  loc_00566959: mov eax, var_44
  loc_0056695C: mov [ecx+00000008h], eax
  loc_0056695F: mov eax, var_40
  loc_00566962: mov [ecx+0000000Ch], eax
  loc_00566965: call [edx+000002B0h]
  loc_0056696B: test eax, eax
  loc_0056696D: fnclex
  loc_0056696F: jge 00566983h
  loc_00566971: push 000002B0h
  loc_00566976: push 0041E6D0h
  loc_0056697B: push edi
  loc_0056697C: push eax
  loc_0056697D: call [00401074h] ; __vbaHresultCheckObj
  loc_00566983: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00566989: lea ecx, var_4C
  loc_0056698C: lea edx, var_2C
  loc_0056698F: push ecx
  loc_00566990: push edx
  loc_00566991: mov var_44, 0061A0B8h
  loc_00566998: mov var_4C, 00004008h
  loc_0056699F: call ebx
  loc_005669A1: lea eax, var_2C
  loc_005669A4: lea ecx, var_5C
  loc_005669A7: push eax
  loc_005669A8: push ecx
  loc_005669A9: mov var_54, 0041E5D4h
  loc_005669B0: mov var_5C, 00008008h
  loc_005669B7: call [00401218h] ; __vbaVarTstNe
  loc_005669BD: lea ecx, var_2C
  loc_005669C0: mov di, ax
  loc_005669C3: call [00401020h] ; __vbaFreeVar
  loc_005669C9: test di, di
  loc_005669CC: jz 00566ABDh
  loc_005669D2: mov edx, [esi]
  loc_005669D4: push esi
  loc_005669D5: call [edx+00000720h]
  loc_005669DB: mov eax, [esi]
  loc_005669DD: push esi
  loc_005669DE: call [eax+00000304h]
  loc_005669E4: lea ecx, var_1C
  loc_005669E7: push eax
  loc_005669E8: push ecx
  loc_005669E9: call [004010A0h] ; __vbaObjSet
  loc_005669EF: mov edi, eax
  loc_005669F1: lea edx, var_4C
  loc_005669F4: lea eax, var_2C
  loc_005669F7: push edx
  loc_005669F8: push eax
  loc_005669F9: mov var_44, 0061A0B8h
  loc_00566A00: mov var_4C, 00004008h
  loc_00566A07: call ebx
  loc_00566A09: mov ebx, [edi]
  loc_00566A0B: lea ecx, var_2C
  loc_00566A0E: lea edx, var_18
  loc_00566A11: push ecx
  loc_00566A12: push edx
  loc_00566A13: call [004011B0h] ; __vbaStrVarVal
  loc_00566A19: push eax
  loc_00566A1A: push edi
  loc_00566A1B: call [ebx+000000A4h]
  loc_00566A21: test eax, eax
  loc_00566A23: fnclex
  loc_00566A25: jge 00566A39h
  loc_00566A27: push 000000A4h
  loc_00566A2C: push 0041E5E8h
  loc_00566A31: push edi
  loc_00566A32: push eax
  loc_00566A33: call [00401074h] ; __vbaHresultCheckObj
  loc_00566A39: mov edi, [004012ACh] ; __vbaFreeStr
  loc_00566A3F: lea ecx, var_18
  loc_00566A42: call edi
  loc_00566A44: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_00566A4A: lea ecx, var_1C
  loc_00566A4D: call ebx
  loc_00566A4F: lea ecx, var_2C
  loc_00566A52: call [00401020h] ; __vbaFreeVar
  loc_00566A58: mov eax, [esi]
  loc_00566A5A: push 00000000h
  loc_00566A5C: push 00000044h
  loc_00566A5E: push esi
  loc_00566A5F: call [eax+00000340h]
  loc_00566A65: lea ecx, var_1C
  loc_00566A68: push eax
  loc_00566A69: push ecx
  loc_00566A6A: call [004010A0h] ; __vbaObjSet
  loc_00566A70: push eax
  loc_00566A71: call [00401024h] ; __vbaLateIdCall
  loc_00566A77: add esp, 0000000Ch
  loc_00566A7A: lea ecx, var_1C
  loc_00566A7D: call ebx
  loc_00566A7F: push 00000001h
  loc_00566A81: call [00401008h] ; __vbaStrI2
  loc_00566A87: mov edx, eax
  loc_00566A89: lea ecx, var_18
  loc_00566A8C: call [00401270h] ; __vbaStrMove
  loc_00566A92: mov edx, eax
  loc_00566A94: lea ecx, [esi+00000038h]
  loc_00566A97: call [004011ECh] ; __vbaStrCopy
  loc_00566A9D: lea ecx, var_18
  loc_00566AA0: call edi
  loc_00566AA2: mov edx, [esi]
  loc_00566AA4: push esi
  loc_00566AA5: call [edx+00000700h]
  loc_00566AAB: mov eax, [esi]
  loc_00566AAD: push esi
  loc_00566AAE: call [eax+00000704h]
  loc_00566AB4: mov ecx, [esi]
  loc_00566AB6: push esi
  loc_00566AB7: call [ecx+0000073Ch]
  loc_00566ABD: mov var_4, 00000000h
  loc_00566AC4: push 00566AF2h
  loc_00566AC9: jmp 00566AF1h
  loc_00566ACB: lea ecx, var_18
  loc_00566ACE: call [004012ACh] ; __vbaFreeStr
  loc_00566AD4: lea ecx, var_1C
  loc_00566AD7: call [004012B0h] ; __vbaFreeObj
  loc_00566ADD: lea edx, var_3C
  loc_00566AE0: lea eax, var_2C
  loc_00566AE3: push edx
  loc_00566AE4: push eax
  loc_00566AE5: push 00000002h
  loc_00566AE7: call [00401038h] ; __vbaFreeVarList
  loc_00566AED: add esp, 0000000Ch
  loc_00566AF0: ret
  loc_00566AF1: ret
  loc_00566AF2: mov eax, Me
  loc_00566AF5: push eax
  loc_00566AF6: mov ecx, [eax]
  loc_00566AF8: call [ecx+00000008h]
  loc_00566AFB: mov eax, var_4
  loc_00566AFE: mov ecx, var_14
  loc_00566B01: pop edi
  loc_00566B02: pop esi
  loc_00566B03: mov fs:[00000000h], ecx
  loc_00566B0A: pop ebx
  loc_00566B0B: mov esp, ebp
  loc_00566B0D: pop ebp
  loc_00566B0E: retn 0004h
End Sub

Private Sub cmdAdd_Click() '565DF0
  loc_00565DF0: push ebp
  loc_00565DF1: mov ebp, esp
  loc_00565DF3: sub esp, 0000000Ch
  loc_00565DF6: push 00403B36h ; __vbaExceptHandler
  loc_00565DFB: mov eax, fs:[00000000h]
  loc_00565E01: push eax
  loc_00565E02: mov fs:[00000000h], esp
  loc_00565E09: sub esp, 000000D0h
  loc_00565E0F: push ebx
  loc_00565E10: push esi
  loc_00565E11: push edi
  loc_00565E12: mov var_C, esp
  loc_00565E15: mov var_8, 004029F0h
  loc_00565E1C: mov esi, Me
  loc_00565E1F: mov eax, esi
  loc_00565E21: and eax, 00000001h
  loc_00565E24: mov var_4, eax
  loc_00565E27: and esi, FFFFFFFEh
  loc_00565E2A: push esi
  loc_00565E2B: mov Me, esi
  loc_00565E2E: mov ecx, [esi]
  loc_00565E30: call [ecx+00000004h]
  loc_00565E33: mov edx, [esi]
  loc_00565E35: xor eax, eax
  loc_00565E37: push esi
  loc_00565E38: mov var_20, eax
  loc_00565E3B: mov var_24, eax
  loc_00565E3E: mov var_28, eax
  loc_00565E41: mov var_38, eax
  loc_00565E44: mov var_48, eax
  loc_00565E47: mov var_58, eax
  loc_00565E4A: mov var_68, eax
  loc_00565E4D: mov var_78, eax
  loc_00565E50: mov var_88, eax
  loc_00565E56: mov var_A8, eax
  loc_00565E5C: call [edx+00000328h]
  loc_00565E62: mov edi, [004010A0h] ; __vbaObjSet
  loc_00565E68: push eax
  loc_00565E69: lea eax, var_24
  loc_00565E6C: push eax
  loc_00565E6D: call edi
  loc_00565E6F: mov ebx, eax
  loc_00565E71: lea edx, var_20
  loc_00565E74: push edx
  loc_00565E75: push ebx
  loc_00565E76: mov ecx, [ebx]
  loc_00565E78: call [ecx+000000A0h]
  loc_00565E7E: test eax, eax
  loc_00565E80: fnclex
  loc_00565E82: jge 00565E96h
  loc_00565E84: push 000000A0h
  loc_00565E89: push 0041E5E8h
  loc_00565E8E: push ebx
  loc_00565E8F: push eax
  loc_00565E90: call [00401074h] ; __vbaHresultCheckObj
  loc_00565E96: mov eax, var_20
  loc_00565E99: lea ecx, var_48
  loc_00565E9C: mov var_30, eax
  loc_00565E9F: lea eax, var_38
  loc_00565EA2: push eax
  loc_00565EA3: push ecx
  loc_00565EA4: mov var_20, 00000000h
  loc_00565EAB: mov var_38, 00000008h
  loc_00565EB2: call [004010D4h] ; rtcTrimVar
  loc_00565EB8: lea edx, var_48
  loc_00565EBB: lea eax, var_88
  loc_00565EC1: push edx
  loc_00565EC2: push eax
  loc_00565EC3: mov var_80, 0041E5D4h
  loc_00565ECA: mov var_88, 00008008h
  loc_00565ED4: call [00401218h] ; __vbaVarTstNe
  loc_00565EDA: lea ecx, var_24
  loc_00565EDD: mov ebx, eax
  loc_00565EDF: call [004012B0h] ; __vbaFreeObj
  loc_00565EE5: lea ecx, var_48
  loc_00565EE8: lea edx, var_38
  loc_00565EEB: push ecx
  loc_00565EEC: push edx
  loc_00565EED: push 00000002h
  loc_00565EEF: call [00401038h] ; __vbaFreeVarList
  loc_00565EF5: add esp, 0000000Ch
  loc_00565EF8: test bx, bx
  loc_00565EFB: jz 005661C7h
  loc_00565F01: mov eax, [esi]
  loc_00565F03: push 00000000h
  loc_00565F05: mov ebx, 00000001h
  loc_00565F0A: push 00000004h
  loc_00565F0C: push esi
  loc_00565F0D: mov var_18, ebx
  loc_00565F10: call [eax+00000340h]
  loc_00565F16: lea ecx, var_24
  loc_00565F19: push eax
  loc_00565F1A: push ecx
  loc_00565F1B: call edi
  loc_00565F1D: lea edx, var_38
  loc_00565F20: push eax
  loc_00565F21: push edx
  loc_00565F22: call [00401140h] ; __vbaLateIdCallLd
  loc_00565F28: add esp, 00000010h
  loc_00565F2B: push eax
  loc_00565F2C: call [0040121Ch] ; __vbaI4Var
  loc_00565F32: mov ecx, eax
  loc_00565F34: call [00401124h] ; __vbaI2I4
  loc_00565F3A: lea ecx, var_24
  loc_00565F3D: mov var_CC, eax
  loc_00565F43: call [004012B0h] ; __vbaFreeObj
  loc_00565F49: lea ecx, var_38
  loc_00565F4C: call [00401020h] ; __vbaFreeVar
  loc_00565F52: cmp bx, var_CC
  loc_00565F59: jg 005661C7h
  loc_00565F5F: sub esp, 00000010h
  loc_00565F62: mov ecx, 00000003h
  loc_00565F67: movsx eax, bx
  loc_00565F6A: mov ebx, esp
  loc_00565F6C: mov var_88, ecx
  loc_00565F72: mov var_80, eax
  loc_00565F75: sub esp, 00000010h
  loc_00565F78: mov [ebx], ecx
  loc_00565F7A: mov ecx, var_84
  loc_00565F80: mov edx, 00000002h
  loc_00565F85: mov [ebx+00000004h], ecx
  loc_00565F88: mov ecx, esp
  loc_00565F8A: push 00000002h
  loc_00565F8C: push 00000041h
  loc_00565F8E: mov [ebx+00000008h], eax
  loc_00565F91: mov eax, var_7C
  loc_00565F94: push esi
  loc_00565F95: mov [ebx+0000000Ch], eax
  loc_00565F98: mov eax, 00000003h
  loc_00565F9D: mov [ecx], eax
  loc_00565F9F: mov eax, var_A4
  loc_00565FA5: mov [ecx+00000004h], eax
  loc_00565FA8: mov eax, [esi]
  loc_00565FAA: mov [ecx+00000008h], edx
  loc_00565FAD: mov edx, var_9C
  loc_00565FB3: mov [ecx+0000000Ch], edx
  loc_00565FB6: call [eax+00000340h]
  loc_00565FBC: lea ecx, var_24
  loc_00565FBF: push eax
  loc_00565FC0: push ecx
  loc_00565FC1: call edi
  loc_00565FC3: lea edx, var_38
  loc_00565FC6: push eax
  loc_00565FC7: push edx
  loc_00565FC8: call [00401140h] ; __vbaLateIdCallLd
  loc_00565FCE: add esp, 00000030h
  loc_00565FD1: push eax
  loc_00565FD2: call [00401028h] ; __vbaStrVarMove
  loc_00565FD8: mov edx, eax
  loc_00565FDA: lea ecx, var_20
  loc_00565FDD: call [00401270h] ; __vbaStrMove
  loc_00565FE3: push eax
  loc_00565FE4: push 0041E5D4h
  loc_00565FE9: call [0040110Ch] ; __vbaStrCmp
  loc_00565FEF: mov ebx, eax
  loc_00565FF1: lea ecx, var_20
  loc_00565FF4: neg ebx
  loc_00565FF6: sbb ebx, ebx
  loc_00565FF8: neg ebx
  loc_00565FFA: neg ebx
  loc_00565FFC: call [004012ACh] ; __vbaFreeStr
  loc_00566002: lea ecx, var_24
  loc_00566005: call [004012B0h] ; __vbaFreeObj
  loc_0056600B: lea ecx, var_38
  loc_0056600E: call [00401020h] ; __vbaFreeVar
  loc_00566014: test bx, bx
  loc_00566017: jz 005661C7h
  loc_0056601D: movsx eax, var_18
  loc_00566021: sub esp, 00000010h
  loc_00566024: mov ecx, 00000003h
  loc_00566029: mov ebx, esp
  loc_0056602B: mov var_88, ecx
  loc_00566031: mov var_80, eax
  loc_00566034: sub esp, 00000010h
  loc_00566037: mov [ebx], ecx
  loc_00566039: mov ecx, var_84
  loc_0056603F: mov edx, 00000002h
  loc_00566044: mov [ebx+00000004h], ecx
  loc_00566047: mov ecx, esp
  loc_00566049: push 00000002h
  loc_0056604B: push 00000041h
  loc_0056604D: mov [ebx+00000008h], eax
  loc_00566050: mov eax, var_7C
  loc_00566053: push esi
  loc_00566054: mov [ebx+0000000Ch], eax
  loc_00566057: mov eax, 00000003h
  loc_0056605C: mov [ecx], eax
  loc_0056605E: mov eax, var_A4
  loc_00566064: mov [ecx+00000004h], eax
  loc_00566067: mov eax, [esi]
  loc_00566069: mov [ecx+00000008h], edx
  loc_0056606C: mov edx, var_9C
  loc_00566072: mov [ecx+0000000Ch], edx
  loc_00566075: call [eax+00000340h]
  loc_0056607B: lea ecx, var_24
  loc_0056607E: push eax
  loc_0056607F: push ecx
  loc_00566080: call edi
  loc_00566082: lea edx, var_38
  loc_00566085: push eax
  loc_00566086: push edx
  loc_00566087: call [00401140h] ; __vbaLateIdCallLd
  loc_0056608D: add esp, 00000030h
  loc_00566090: push eax
  loc_00566091: call [00401028h] ; __vbaStrVarMove
  loc_00566097: mov var_60, eax
  loc_0056609A: mov eax, [esi]
  loc_0056609C: push esi
  loc_0056609D: mov var_68, 00008008h
  loc_005660A4: call [eax+00000328h]
  loc_005660AA: lea ecx, var_28
  loc_005660AD: push eax
  loc_005660AE: push ecx
  loc_005660AF: call edi
  loc_005660B1: mov ebx, eax
  loc_005660B3: lea eax, var_20
  loc_005660B6: push eax
  loc_005660B7: push ebx
  loc_005660B8: mov edx, [ebx]
  loc_005660BA: call [edx+000000A0h]
  loc_005660C0: test eax, eax
  loc_005660C2: fnclex
  loc_005660C4: jge 005660D8h
  loc_005660C6: push 000000A0h
  loc_005660CB: push 0041E5E8h
  loc_005660D0: push ebx
  loc_005660D1: push eax
  loc_005660D2: call [00401074h] ; __vbaHresultCheckObj
  loc_005660D8: mov eax, var_20
  loc_005660DB: lea ecx, var_48
  loc_005660DE: lea edx, var_58
  loc_005660E1: push ecx
  loc_005660E2: push edx
  loc_005660E3: mov var_20, 00000000h
  loc_005660EA: mov var_40, eax
  loc_005660ED: mov var_48, 00000008h
  loc_005660F4: call [004010D4h] ; rtcTrimVar
  loc_005660FA: lea eax, var_68
  loc_005660FD: lea ecx, var_58
  loc_00566100: push eax
  loc_00566101: push ecx
  loc_00566102: call [00401110h] ; __vbaVarTstEq
  loc_00566108: mov ebx, eax
  loc_0056610A: lea edx, var_28
  loc_0056610D: lea eax, var_24
  loc_00566110: push edx
  loc_00566111: push eax
  loc_00566112: push 00000002h
  loc_00566114: call [00401040h] ; __vbaFreeObjList
  loc_0056611A: lea ecx, var_58
  loc_0056611D: lea edx, var_68
  loc_00566120: push ecx
  loc_00566121: lea eax, var_48
  loc_00566124: push edx
  loc_00566125: lea ecx, var_38
  loc_00566128: push eax
  loc_00566129: push ecx
  loc_0056612A: push 00000004h
  loc_0056612C: call [00401038h] ; __vbaFreeVarList
  loc_00566132: add esp, 00000020h
  loc_00566135: test bx, bx
  loc_00566138: jnz 00566153h
  loc_0056613A: mov eax, 00000001h
  loc_0056613F: add ax, var_18
  loc_00566143: jo 005666F7h
  loc_00566149: mov var_18, eax
  loc_0056614C: mov ebx, eax
  loc_0056614E: jmp 00565F52h
  loc_00566153: mov ecx, 80020004h
  loc_00566158: mov eax, 0000000Ah
  loc_0056615D: mov var_60, ecx
  loc_00566160: mov var_50, ecx
  loc_00566163: mov var_40, ecx
  loc_00566166: lea edx, var_88
  loc_0056616C: lea ecx, var_38
  loc_0056616F: mov var_68, eax
  loc_00566172: mov var_58, eax
  loc_00566175: mov var_48, eax
  loc_00566178: mov var_80, 00428EB8h ; "Duplicated SrNo."
  loc_0056617F: mov var_88, 00000008h
  loc_00566189: call [00401240h] ; __vbaVarDup
  loc_0056618F: lea edx, var_68
  loc_00566192: lea eax, var_58
  loc_00566195: push edx
  loc_00566196: lea ecx, var_48
  loc_00566199: push eax
  loc_0056619A: push ecx
  loc_0056619B: lea edx, var_38
  loc_0056619E: push 00000020h
  loc_005661A0: push edx
  loc_005661A1: call [004010A4h] ; rtcMsgBox
  loc_005661A7: lea eax, var_68
  loc_005661AA: lea ecx, var_58
  loc_005661AD: push eax
  loc_005661AE: lea edx, var_48
  loc_005661B1: push ecx
  loc_005661B2: lea eax, var_38
  loc_005661B5: push edx
  loc_005661B6: push eax
  loc_005661B7: push 00000004h
  loc_005661B9: call [00401038h] ; __vbaFreeVarList
  loc_005661BF: add esp, 00000014h
  loc_005661C2: jmp 0056668Ah
  loc_005661C7: or eax, FFFFFFFFh
  loc_005661CA: cmp ax, FFFFFFh
  loc_005661CE: jnz 0056668Ah
  loc_005661D4: mov ecx, [esi+00000038h]
  loc_005661D7: push ecx
  loc_005661D8: call [004011F4h] ; __vbaI4Str
  loc_005661DE: sub esp, 00000010h
  loc_005661E1: mov ecx, 00000003h
  loc_005661E6: mov edx, esp
  loc_005661E8: mov var_88, ecx
  loc_005661EE: mov var_80, eax
  loc_005661F1: push 0000000Ah
  loc_005661F3: mov [edx], ecx
  loc_005661F5: mov ecx, var_84
  loc_005661FB: push esi
  loc_005661FC: mov [edx+00000004h], ecx
  loc_005661FF: mov ecx, [esi]
  loc_00566201: mov [edx+00000008h], eax
  loc_00566204: mov eax, var_7C
  loc_00566207: mov [edx+0000000Ch], eax
  loc_0056620A: call [ecx+00000340h]
  loc_00566210: lea edx, var_24
  loc_00566213: push eax
  loc_00566214: push edx
  loc_00566215: call edi
  loc_00566217: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_0056621D: push eax
  loc_0056621E: call ebx
  loc_00566220: lea ecx, var_24
  loc_00566223: call [004012B0h] ; __vbaFreeObj
  loc_00566229: sub esp, 00000010h
  loc_0056622C: mov ecx, 00000003h
  loc_00566231: mov edx, esp
  loc_00566233: mov var_88, ecx
  loc_00566239: xor eax, eax
  loc_0056623B: push 0000000Bh
  loc_0056623D: mov [edx], ecx
  loc_0056623F: mov ecx, var_84
  loc_00566245: mov var_80, eax
  loc_00566248: push esi
  loc_00566249: mov [edx+00000004h], ecx
  loc_0056624C: mov ecx, [esi]
  loc_0056624E: mov [edx+00000008h], eax
  loc_00566251: mov eax, var_7C
  loc_00566254: mov [edx+0000000Ch], eax
  loc_00566257: call [ecx+00000340h]
  loc_0056625D: lea edx, var_24
  loc_00566260: push eax
  loc_00566261: push edx
  loc_00566262: call edi
  loc_00566264: push eax
  loc_00566265: call ebx
  loc_00566267: lea ecx, var_24
  loc_0056626A: call [004012B0h] ; __vbaFreeObj
  loc_00566270: sub esp, 00000010h
  loc_00566273: mov ecx, 00000002h
  loc_00566278: mov edx, esp
  loc_0056627A: mov var_88, ecx
  loc_00566280: mov eax, 00000001h
  loc_00566285: push 00000028h
  loc_00566287: mov [edx], ecx
  loc_00566289: mov ecx, var_84
  loc_0056628F: mov var_80, eax
  loc_00566292: push esi
  loc_00566293: mov [edx+00000004h], ecx
  loc_00566296: mov ecx, [esi]
  loc_00566298: mov [edx+00000008h], eax
  loc_0056629B: mov eax, var_7C
  loc_0056629E: mov [edx+0000000Ch], eax
  loc_005662A1: call [ecx+00000340h]
  loc_005662A7: lea edx, var_24
  loc_005662AA: push eax
  loc_005662AB: push edx
  loc_005662AC: call edi
  loc_005662AE: push eax
  loc_005662AF: call ebx
  loc_005662B1: lea ecx, var_24
  loc_005662B4: call [004012B0h] ; __vbaFreeObj
  loc_005662BA: lea eax, [esi+00000038h]
  loc_005662BD: mov ecx, 00004008h
  loc_005662C2: sub esp, 00000010h
  loc_005662C5: mov var_80, eax
  loc_005662C8: mov var_88, ecx
  loc_005662CE: mov edx, esp
  loc_005662D0: mov [edx], ecx
  loc_005662D2: mov ecx, var_84
  loc_005662D8: push 00000000h
  loc_005662DA: push esi
  loc_005662DB: mov [edx+00000004h], ecx
  loc_005662DE: mov ecx, [esi]
  loc_005662E0: mov [edx+00000008h], eax
  loc_005662E3: mov eax, var_7C
  loc_005662E6: mov [edx+0000000Ch], eax
  loc_005662E9: call [ecx+00000340h]
  loc_005662EF: lea edx, var_24
  loc_005662F2: push eax
  loc_005662F3: push edx
  loc_005662F4: call edi
  loc_005662F6: push eax
  loc_005662F7: call ebx
  loc_005662F9: lea ecx, var_24
  loc_005662FC: call [004012B0h] ; __vbaFreeObj
  loc_00566302: sub esp, 00000010h
  loc_00566305: mov ecx, 00000003h
  loc_0056630A: mov edx, esp
  loc_0056630C: mov var_88, ecx
  loc_00566312: mov eax, 00000001h
  loc_00566317: push 0000000Bh
  loc_00566319: mov [edx], ecx
  loc_0056631B: mov ecx, var_84
  loc_00566321: mov var_80, eax
  loc_00566324: push esi
  loc_00566325: mov [edx+00000004h], ecx
  loc_00566328: mov ecx, [esi]
  loc_0056632A: mov [edx+00000008h], eax
  loc_0056632D: mov eax, var_7C
  loc_00566330: mov [edx+0000000Ch], eax
  loc_00566333: call [ecx+00000340h]
  loc_00566339: lea edx, var_24
  loc_0056633C: push eax
  loc_0056633D: push edx
  loc_0056633E: call edi
  loc_00566340: push eax
  loc_00566341: call ebx
  loc_00566343: lea ecx, var_24
  loc_00566346: call [004012B0h] ; __vbaFreeObj
  loc_0056634C: sub esp, 00000010h
  loc_0056634F: mov ecx, 00000002h
  loc_00566354: mov edx, esp
  loc_00566356: mov var_88, ecx
  loc_0056635C: mov eax, 00000001h
  loc_00566361: push 00000028h
  loc_00566363: mov [edx], ecx
  loc_00566365: mov ecx, var_84
  loc_0056636B: mov var_80, eax
  loc_0056636E: push esi
  loc_0056636F: mov [edx+00000004h], ecx
  loc_00566372: mov ecx, [esi]
  loc_00566374: mov [edx+00000008h], eax
  loc_00566377: mov eax, var_7C
  loc_0056637A: mov [edx+0000000Ch], eax
  loc_0056637D: call [ecx+00000340h]
  loc_00566383: lea edx, var_24
  loc_00566386: push eax
  loc_00566387: push edx
  loc_00566388: call edi
  loc_0056638A: push eax
  loc_0056638B: call ebx
  loc_0056638D: lea ecx, var_24
  loc_00566390: call [004012B0h] ; __vbaFreeObj
  loc_00566396: mov eax, [esi]
  loc_00566398: push esi
  loc_00566399: call [eax+00000304h]
  loc_0056639F: lea ecx, var_24
  loc_005663A2: push eax
  loc_005663A3: push ecx
  loc_005663A4: call edi
  loc_005663A6: mov edx, [eax]
  loc_005663A8: lea ecx, var_20
  loc_005663AB: push ecx
  loc_005663AC: push eax
  loc_005663AD: mov var_BC, eax
  loc_005663B3: call [edx+000000A0h]
  loc_005663B9: fnclex
  loc_005663BB: test eax, eax
  loc_005663BD: jge 005663D7h
  loc_005663BF: mov edx, var_BC
  loc_005663C5: push 000000A0h
  loc_005663CA: push 0041E5E8h
  loc_005663CF: push edx
  loc_005663D0: push eax
  loc_005663D1: call [00401074h] ; __vbaHresultCheckObj
  loc_005663D7: mov eax, var_20
  loc_005663DA: lea ecx, var_48
  loc_005663DD: mov var_30, eax
  loc_005663E0: lea eax, var_38
  loc_005663E3: push eax
  loc_005663E4: push ecx
  loc_005663E5: mov var_20, 00000000h
  loc_005663EC: mov var_38, 00000008h
  loc_005663F3: call [004010D4h] ; rtcTrimVar
  loc_005663F9: lea edx, var_48
  loc_005663FC: push edx
  loc_005663FD: call [00401028h] ; __vbaStrVarMove
  loc_00566403: sub esp, 00000010h
  loc_00566406: mov ecx, 00000008h
  loc_0056640B: mov edx, esp
  loc_0056640D: mov var_58, ecx
  loc_00566410: mov var_50, eax
  loc_00566413: push 00000000h
  loc_00566415: mov [edx], ecx
  loc_00566417: mov ecx, var_54
  loc_0056641A: push esi
  loc_0056641B: mov [edx+00000004h], ecx
  loc_0056641E: mov ecx, [esi]
  loc_00566420: mov [edx+00000008h], eax
  loc_00566423: mov eax, var_4C
  loc_00566426: mov [edx+0000000Ch], eax
  loc_00566429: call [ecx+00000340h]
  loc_0056642F: lea edx, var_28
  loc_00566432: push eax
  loc_00566433: push edx
  loc_00566434: call edi
  loc_00566436: push eax
  loc_00566437: call ebx
  loc_00566439: lea eax, var_28
  loc_0056643C: lea ecx, var_24
  loc_0056643F: push eax
  loc_00566440: push ecx
  loc_00566441: push 00000002h
  loc_00566443: call [00401040h] ; __vbaFreeObjList
  loc_00566449: lea edx, var_58
  loc_0056644C: lea eax, var_48
  loc_0056644F: push edx
  loc_00566450: lea ecx, var_38
  loc_00566453: push eax
  loc_00566454: push ecx
  loc_00566455: push 00000003h
  loc_00566457: call [00401038h] ; __vbaFreeVarList
  loc_0056645D: add esp, 0000000Ch
  loc_00566460: mov ecx, 00000003h
  loc_00566465: mov edx, esp
  loc_00566467: mov var_88, ecx
  loc_0056646D: mov eax, 00000002h
  loc_00566472: push 0000000Bh
  loc_00566474: mov [edx], ecx
  loc_00566476: mov ecx, var_84
  loc_0056647C: mov var_80, eax
  loc_0056647F: push esi
  loc_00566480: mov [edx+00000004h], ecx
  loc_00566483: mov ecx, [esi]
  loc_00566485: mov [edx+00000008h], eax
  loc_00566488: mov eax, var_7C
  loc_0056648B: mov [edx+0000000Ch], eax
  loc_0056648E: call [ecx+00000340h]
  loc_00566494: lea edx, var_24
  loc_00566497: push eax
  loc_00566498: push edx
  loc_00566499: call edi
  loc_0056649B: push eax
  loc_0056649C: call ebx
  loc_0056649E: lea ecx, var_24
  loc_005664A1: call [004012B0h] ; __vbaFreeObj
  loc_005664A7: sub esp, 00000010h
  loc_005664AA: mov ecx, 00000002h
  loc_005664AF: mov edx, esp
  loc_005664B1: mov var_88, ecx
  loc_005664B7: mov eax, 00000001h
  loc_005664BC: mov [edx], ecx
  loc_005664BE: mov ecx, var_84
  loc_005664C4: mov var_80, eax
  loc_005664C7: mov [edx+00000004h], ecx
  loc_005664CA: mov [edx+00000008h], eax
  loc_005664CD: mov eax, var_7C
  loc_005664D0: mov ecx, [esi]
  loc_005664D2: push 00000028h
  loc_005664D4: push esi
  loc_005664D5: mov [edx+0000000Ch], eax
  loc_005664D8: call [ecx+00000340h]
  loc_005664DE: lea edx, var_24
  loc_005664E1: push eax
  loc_005664E2: push edx
  loc_005664E3: call edi
  loc_005664E5: push eax
  loc_005664E6: call ebx
  loc_005664E8: lea ecx, var_24
  loc_005664EB: call [004012B0h] ; __vbaFreeObj
  loc_005664F1: mov eax, [esi]
  loc_005664F3: push esi
  loc_005664F4: call [eax+00000328h]
  loc_005664FA: lea ecx, var_24
  loc_005664FD: push eax
  loc_005664FE: push ecx
  loc_005664FF: call edi
  loc_00566501: mov edx, [eax]
  loc_00566503: lea ecx, var_20
  loc_00566506: push ecx
  loc_00566507: push eax
  loc_00566508: mov var_BC, eax
  loc_0056650E: call [edx+000000A0h]
  loc_00566514: test eax, eax
  loc_00566516: fnclex
  loc_00566518: jge 00566532h
  loc_0056651A: mov edx, var_BC
  loc_00566520: push 000000A0h
  loc_00566525: push 0041E5E8h
  loc_0056652A: push edx
  loc_0056652B: push eax
  loc_0056652C: call [00401074h] ; __vbaHresultCheckObj
  loc_00566532: mov eax, var_20
  loc_00566535: lea ecx, var_48
  loc_00566538: mov var_30, eax
  loc_0056653B: lea eax, var_38
  loc_0056653E: push eax
  loc_0056653F: push ecx
  loc_00566540: mov var_20, 00000000h
  loc_00566547: mov var_38, 00000008h
  loc_0056654E: call [004010D4h] ; rtcTrimVar
  loc_00566554: lea edx, var_48
  loc_00566557: push edx
  loc_00566558: call [00401028h] ; __vbaStrVarMove
  loc_0056655E: sub esp, 00000010h
  loc_00566561: mov ecx, 00000008h
  loc_00566566: mov edx, esp
  loc_00566568: mov var_58, ecx
  loc_0056656B: mov var_50, eax
  loc_0056656E: push 00000000h
  loc_00566570: mov [edx], ecx
  loc_00566572: mov ecx, var_54
  loc_00566575: push esi
  loc_00566576: mov [edx+00000004h], ecx
  loc_00566579: mov ecx, [esi]
  loc_0056657B: mov [edx+00000008h], eax
  loc_0056657E: mov eax, var_4C
  loc_00566581: mov [edx+0000000Ch], eax
  loc_00566584: call [ecx+00000340h]
  loc_0056658A: lea edx, var_28
  loc_0056658D: push eax
  loc_0056658E: push edx
  loc_0056658F: call edi
  loc_00566591: push eax
  loc_00566592: call ebx
  loc_00566594: lea eax, var_28
  loc_00566597: lea ecx, var_24
  loc_0056659A: push eax
  loc_0056659B: push ecx
  loc_0056659C: push 00000002h
  loc_0056659E: call [00401040h] ; __vbaFreeObjList
  loc_005665A4: lea edx, var_58
  loc_005665A7: lea eax, var_48
  loc_005665AA: push edx
  loc_005665AB: lea ecx, var_38
  loc_005665AE: push eax
  loc_005665AF: push ecx
  loc_005665B0: push 00000003h
  loc_005665B2: call [00401038h] ; __vbaFreeVarList
  loc_005665B8: mov edx, [esi+00000038h]
  loc_005665BB: add esp, 0000001Ch
  loc_005665BE: push edx
  loc_005665BF: call [004011D8h] ; __vbaR8Str
  loc_005665C5: fadd st0, real8 ptr [004015F8h]
  loc_005665CB: sub esp, 00000008h
  loc_005665CE: fnstsw ax
  loc_005665D0: test al, 0Dh
  loc_005665D2: jnz 005666F2h
  loc_005665D8: fstp real8 ptr [esp]
  loc_005665DB: call [00401144h] ; __vbaStrR8
  loc_005665E1: mov edx, eax
  loc_005665E3: lea ecx, var_20
  loc_005665E6: call [00401270h] ; __vbaStrMove
  loc_005665EC: mov edx, eax
  loc_005665EE: lea ecx, [esi+00000038h]
  loc_005665F1: call [004011ECh] ; __vbaStrCopy
  loc_005665F7: lea ecx, var_20
  loc_005665FA: call [004012ACh] ; __vbaFreeStr
  loc_00566600: mov eax, [esi]
  loc_00566602: push 00000000h
  loc_00566604: push 00000004h
  loc_00566606: push esi
  loc_00566607: call [eax+00000340h]
  loc_0056660D: lea ecx, var_24
  loc_00566610: push eax
  loc_00566611: push ecx
  loc_00566612: call edi
  loc_00566614: lea edx, var_38
  loc_00566617: push eax
  loc_00566618: push edx
  loc_00566619: call [00401140h] ; __vbaLateIdCallLd
  loc_0056661F: add esp, 00000010h
  loc_00566622: push eax
  loc_00566623: call [0040121Ch] ; __vbaI4Var
  loc_00566629: add eax, 00000001h
  loc_0056662C: mov ecx, 00000003h
  loc_00566631: jo 005666F7h
  loc_00566637: sub esp, 00000010h
  loc_0056663A: mov var_88, ecx
  loc_00566640: mov edx, esp
  loc_00566642: mov var_80, eax
  loc_00566645: push 00000004h
  loc_00566647: push esi
  loc_00566648: mov [edx], ecx
  loc_0056664A: mov ecx, var_84
  loc_00566650: mov [edx+00000004h], ecx
  loc_00566653: mov ecx, [esi]
  loc_00566655: mov [edx+00000008h], eax
  loc_00566658: mov eax, var_7C
  loc_0056665B: mov [edx+0000000Ch], eax
  loc_0056665E: call [ecx+00000340h]
  loc_00566664: lea edx, var_28
  loc_00566667: push eax
  loc_00566668: push edx
  loc_00566669: call edi
  loc_0056666B: push eax
  loc_0056666C: call ebx
  loc_0056666E: lea eax, var_28
  loc_00566671: lea ecx, var_24
  loc_00566674: push eax
  loc_00566675: push ecx
  loc_00566676: push 00000002h
  loc_00566678: call [00401040h] ; __vbaFreeObjList
  loc_0056667E: add esp, 0000000Ch
  loc_00566681: lea ecx, var_38
  loc_00566684: call [00401020h] ; __vbaFreeVar
  loc_0056668A: mov var_4, 00000000h
  loc_00566691: fwait
  loc_00566692: push 005666D3h
  loc_00566697: jmp 005666D2h
  loc_00566699: lea ecx, var_20
  loc_0056669C: call [004012ACh] ; __vbaFreeStr
  loc_005666A2: lea edx, var_28
  loc_005666A5: lea eax, var_24
  loc_005666A8: push edx
  loc_005666A9: push eax
  loc_005666AA: push 00000002h
  loc_005666AC: call [00401040h] ; __vbaFreeObjList
  loc_005666B2: lea ecx, var_78
  loc_005666B5: lea edx, var_68
  loc_005666B8: push ecx
  loc_005666B9: lea eax, var_58
  loc_005666BC: push edx
  loc_005666BD: lea ecx, var_48
  loc_005666C0: push eax
  loc_005666C1: lea edx, var_38
  loc_005666C4: push ecx
  loc_005666C5: push edx
  loc_005666C6: push 00000005h
  loc_005666C8: call [00401038h] ; __vbaFreeVarList
  loc_005666CE: add esp, 00000024h
  loc_005666D1: ret
  loc_005666D2: ret
  loc_005666D3: mov eax, Me
  loc_005666D6: push eax
  loc_005666D7: mov ecx, [eax]
  loc_005666D9: call [ecx+00000008h]
  loc_005666DC: mov eax, var_4
  loc_005666DF: mov ecx, var_14
  loc_005666E2: pop edi
  loc_005666E3: pop esi
  loc_005666E4: mov fs:[00000000h], ecx
  loc_005666EB: pop ebx
  loc_005666EC: mov esp, ebp
  loc_005666EE: pop ebp
  loc_005666EF: retn 0004h
End Sub

Private Sub cmdSave_Click() '567680
  loc_00567680: push ebp
  loc_00567681: mov ebp, esp
  loc_00567683: sub esp, 0000000Ch
  loc_00567686: push 00403B36h ; __vbaExceptHandler
  loc_0056768B: mov eax, fs:[00000000h]
  loc_00567691: push eax
  loc_00567692: mov fs:[00000000h], esp
  loc_00567699: sub esp, 00000008h
  loc_0056769C: push ebx
  loc_0056769D: push esi
  loc_0056769E: push edi
  loc_0056769F: mov var_C, esp
  loc_005676A2: mov var_8, 00402A80h
  loc_005676A9: mov esi, Me
  loc_005676AC: mov eax, esi
  loc_005676AE: and eax, 00000001h
  loc_005676B1: mov var_4, eax
  loc_005676B4: and esi, FFFFFFFEh
  loc_005676B7: push esi
  loc_005676B8: mov Me, esi
  loc_005676BB: mov ecx, [esi]
  loc_005676BD: call [ecx+00000004h]
  loc_005676C0: cmp [esi+0000003Ch], FFFFFFh
  loc_005676C5: jnz 005676D2h
  loc_005676C7: mov edx, [esi]
  loc_005676C9: push esi
  loc_005676CA: call [edx+00000740h]
  loc_005676D0: jmp 005676DBh
  loc_005676D2: mov eax, [esi]
  loc_005676D4: push esi
  loc_005676D5: call [eax+00000738h]
  loc_005676DB: mov var_4, 00000000h
  loc_005676E2: mov eax, Me
  loc_005676E5: push eax
  loc_005676E6: mov ecx, [eax]
  loc_005676E8: call [ecx+00000008h]
  loc_005676EB: mov eax, var_4
  loc_005676EE: mov ecx, var_14
  loc_005676F1: pop edi
  loc_005676F2: pop esi
  loc_005676F3: mov fs:[00000000h], ecx
  loc_005676FA: pop ebx
  loc_005676FB: mov esp, ebp
  loc_005676FD: pop ebp
  loc_005676FE: retn 0004h
End Sub

Private Sub mnuDelete_Click() '56A0F0
  loc_0056A0F0: push ebp
  loc_0056A0F1: mov ebp, esp
  loc_0056A0F3: sub esp, 0000000Ch
  loc_0056A0F6: push 00403B36h ; __vbaExceptHandler
  loc_0056A0FB: mov eax, fs:[00000000h]
  loc_0056A101: push eax
  loc_0056A102: mov fs:[00000000h], esp
  loc_0056A109: sub esp, 000000A4h
  loc_0056A10F: push ebx
  loc_0056A110: push esi
  loc_0056A111: push edi
  loc_0056A112: mov var_C, esp
  loc_0056A115: mov var_8, 00402AD8h
  loc_0056A11C: mov esi, Me
  loc_0056A11F: mov eax, esi
  loc_0056A121: and eax, 00000001h
  loc_0056A124: mov var_4, eax
  loc_0056A127: and esi, FFFFFFFEh
  loc_0056A12A: push esi
  loc_0056A12B: mov Me, esi
  loc_0056A12E: mov ecx, [esi]
  loc_0056A130: call [ecx+00000004h]
  loc_0056A133: sub esp, 00000010h
  loc_0056A136: mov ecx, 00000003h
  loc_0056A13B: mov edx, esp
  loc_0056A13D: xor eax, eax
  loc_0056A13F: xor ebx, ebx
  loc_0056A141: push 0000000Bh
  loc_0056A143: mov [edx], ecx
  loc_0056A145: mov ecx, var_80
  loc_0056A148: push esi
  loc_0056A149: mov var_1C, ebx
  loc_0056A14C: mov [edx+00000004h], ecx
  loc_0056A14F: mov ecx, [esi]
  loc_0056A151: mov var_20, ebx
  loc_0056A154: mov var_24, ebx
  loc_0056A157: mov [edx+00000008h], eax
  loc_0056A15A: mov eax, var_78
  loc_0056A15D: mov var_34, ebx
  loc_0056A160: mov var_44, ebx
  loc_0056A163: mov var_54, ebx
  loc_0056A166: mov var_64, ebx
  loc_0056A169: mov var_74, ebx
  loc_0056A16C: mov [edx+0000000Ch], eax
  loc_0056A16F: call [ecx+00000340h]
  loc_0056A175: mov edi, [004010A0h] ; __vbaObjSet
  loc_0056A17B: lea edx, var_20
  loc_0056A17E: push eax
  loc_0056A17F: push edx
  loc_0056A180: call edi
  loc_0056A182: push eax
  loc_0056A183: call [00401288h] ; __vbaLateIdSt
  loc_0056A189: lea ecx, var_20
  loc_0056A18C: call [004012B0h] ; __vbaFreeObj
  loc_0056A192: mov eax, [esi]
  loc_0056A194: push ebx
  loc_0056A195: push ebx
  loc_0056A196: push esi
  loc_0056A197: call [eax+00000340h]
  loc_0056A19D: lea ecx, var_20
  loc_0056A1A0: push eax
  loc_0056A1A1: push ecx
  loc_0056A1A2: call edi
  loc_0056A1A4: lea edx, var_34
  loc_0056A1A7: push eax
  loc_0056A1A8: push edx
  loc_0056A1A9: call [00401140h] ; __vbaLateIdCallLd
  loc_0056A1AF: add esp, 00000010h
  loc_0056A1B2: push eax
  loc_0056A1B3: call [00401028h] ; __vbaStrVarMove
  loc_0056A1B9: mov var_3C, eax
  loc_0056A1BC: lea eax, var_44
  loc_0056A1BF: push eax
  loc_0056A1C0: mov var_44, 00000008h
  loc_0056A1C7: call [0040111Ch] ; rtcIsNumeric
  loc_0056A1CD: lea ecx, var_20
  loc_0056A1D0: mov var_A8, eax
  loc_0056A1D6: call [004012B0h] ; __vbaFreeObj
  loc_0056A1DC: lea ecx, var_44
  loc_0056A1DF: lea edx, var_34
  loc_0056A1E2: push ecx
  loc_0056A1E3: push edx
  loc_0056A1E4: push 00000002h
  loc_0056A1E6: call [00401038h] ; __vbaFreeVarList
  loc_0056A1EC: add esp, 0000000Ch
  loc_0056A1EF: cmp var_A8, bx
  loc_0056A1F6: jz 0056A4D5h
  loc_0056A1FC: mov eax, [esi]
  loc_0056A1FE: push ebx
  loc_0056A1FF: push ebx
  loc_0056A200: push esi
  loc_0056A201: call [eax+00000340h]
  loc_0056A207: lea ecx, var_20
  loc_0056A20A: push eax
  loc_0056A20B: push ecx
  loc_0056A20C: call edi
  loc_0056A20E: lea edx, var_34
  loc_0056A211: push eax
  loc_0056A212: push edx
  loc_0056A213: call [00401140h] ; __vbaLateIdCallLd
  loc_0056A219: mov eax, 80020004h
  loc_0056A21E: add esp, 00000010h
  loc_0056A221: mov var_6C, eax
  loc_0056A224: mov var_5C, eax
  loc_0056A227: mov var_4C, eax
  loc_0056A22A: lea eax, var_34
  loc_0056A22D: mov ecx, 0000000Ah
  loc_0056A232: push 00429100h ; "Are you sure to Delete Line No. "
  loc_0056A237: push eax
  loc_0056A238: mov var_74, ecx
  loc_0056A23B: mov var_64, ecx
  loc_0056A23E: mov var_54, ecx
  loc_0056A241: call [00401028h] ; __vbaStrVarMove
  loc_0056A247: mov edx, eax
  loc_0056A249: lea ecx, var_1C
  loc_0056A24C: call [00401270h] ; __vbaStrMove
  loc_0056A252: push eax
  loc_0056A253: call [00401054h] ; __vbaStrCat
  loc_0056A259: lea ecx, var_74
  loc_0056A25C: mov var_3C, eax
  loc_0056A25F: lea edx, var_64
  loc_0056A262: push ecx
  loc_0056A263: lea eax, var_54
  loc_0056A266: push edx
  loc_0056A267: push eax
  loc_0056A268: lea ecx, var_44
  loc_0056A26B: push 00000134h
  loc_0056A270: push ecx
  loc_0056A271: mov var_44, 00000008h
  loc_0056A278: call [004010A4h] ; rtcMsgBox
  loc_0056A27E: xor edx, edx
  loc_0056A280: cmp eax, 00000006h
  loc_0056A283: setz dl
  loc_0056A286: neg edx
  loc_0056A288: lea ecx, var_1C
  loc_0056A28B: mov var_A8, edx
  loc_0056A291: call [004012ACh] ; __vbaFreeStr
  loc_0056A297: lea ecx, var_20
  loc_0056A29A: call [004012B0h] ; __vbaFreeObj
  loc_0056A2A0: lea eax, var_74
  loc_0056A2A3: lea ecx, var_64
  loc_0056A2A6: push eax
  loc_0056A2A7: lea edx, var_54
  loc_0056A2AA: push ecx
  loc_0056A2AB: lea eax, var_44
  loc_0056A2AE: push edx
  loc_0056A2AF: lea ecx, var_34
  loc_0056A2B2: push eax
  loc_0056A2B3: push ecx
  loc_0056A2B4: push 00000005h
  loc_0056A2B6: call [00401038h] ; __vbaFreeVarList
  loc_0056A2BC: add esp, 00000018h
  loc_0056A2BF: cmp var_A8, bx
  loc_0056A2C6: jz 0056A3B8h
  loc_0056A2CC: mov edx, [esi]
  loc_0056A2CE: push ebx
  loc_0056A2CF: push 0000000Ah
  loc_0056A2D1: push esi
  loc_0056A2D2: call [edx+00000340h]
  loc_0056A2D8: push eax
  loc_0056A2D9: lea eax, var_20
  loc_0056A2DC: push eax
  loc_0056A2DD: call edi
  loc_0056A2DF: lea ecx, var_34
  loc_0056A2E2: push eax
  loc_0056A2E3: push ecx
  loc_0056A2E4: call [00401140h] ; __vbaLateIdCallLd
  loc_0056A2EA: add esp, 00000010h
  loc_0056A2ED: push eax
  loc_0056A2EE: call [0040121Ch] ; __vbaI4Var
  loc_0056A2F4: push eax
  loc_0056A2F5: call [00401018h] ; __vbaStrI4
  loc_0056A2FB: mov edx, eax
  loc_0056A2FD: lea ecx, var_1C
  loc_0056A300: call [00401270h] ; __vbaStrMove
  loc_0056A306: push eax
  loc_0056A307: call [004012B4h] ; rtcR8ValFromBstr
  loc_0056A30D: call [0040125Ch] ; __vbaFpI4
  loc_0056A313: sub esp, 00000010h
  loc_0056A316: mov ecx, 00000003h
  loc_0056A31B: mov edx, esp
  loc_0056A31D: push 00000001h
  loc_0056A31F: push 00000043h
  loc_0056A321: mov [edx], ecx
  loc_0056A323: mov ecx, var_80
  loc_0056A326: push esi
  loc_0056A327: mov [edx+00000004h], ecx
  loc_0056A32A: mov ecx, [esi]
  loc_0056A32C: mov [edx+00000008h], eax
  loc_0056A32F: mov eax, var_78
  loc_0056A332: mov [edx+0000000Ch], eax
  loc_0056A335: call [ecx+00000340h]
  loc_0056A33B: lea edx, var_24
  loc_0056A33E: push eax
  loc_0056A33F: push edx
  loc_0056A340: call edi
  loc_0056A342: push eax
  loc_0056A343: call [00401024h] ; __vbaLateIdCall
  loc_0056A349: add esp, 0000001Ch
  loc_0056A34C: lea ecx, var_1C
  loc_0056A34F: call [004012ACh] ; __vbaFreeStr
  loc_0056A355: lea eax, var_24
  loc_0056A358: lea ecx, var_20
  loc_0056A35B: push eax
  loc_0056A35C: push ecx
  loc_0056A35D: push 00000002h
  loc_0056A35F: call [00401040h] ; __vbaFreeObjList
  loc_0056A365: add esp, 0000000Ch
  loc_0056A368: lea ecx, var_34
  loc_0056A36B: call [00401020h] ; __vbaFreeVar
  loc_0056A371: mov edx, [esi+00000038h]
  loc_0056A374: lea ebx, [esi+00000038h]
  loc_0056A377: push edx
  loc_0056A378: call [004011D8h] ; __vbaR8Str
  loc_0056A37E: fsub st0, real8 ptr [004015F8h]
  loc_0056A384: sub esp, 00000008h
  loc_0056A387: fnstsw ax
  loc_0056A389: test al, 0Dh
  loc_0056A38B: jnz 0056A539h
  loc_0056A391: fstp real8 ptr [esp]
  loc_0056A394: call [00401144h] ; __vbaStrR8
  loc_0056A39A: mov edx, eax
  loc_0056A39C: lea ecx, var_1C
  loc_0056A39F: call [00401270h] ; __vbaStrMove
  loc_0056A3A5: mov edx, eax
  loc_0056A3A7: mov ecx, ebx
  loc_0056A3A9: call [004011ECh] ; __vbaStrCopy
  loc_0056A3AF: lea ecx, var_1C
  loc_0056A3B2: call [004012ACh] ; __vbaFreeStr
  loc_0056A3B8: mov eax, [esi+00000038h]
  loc_0056A3BB: push eax
  loc_0056A3BC: call [004011D8h] ; __vbaR8Str
  loc_0056A3C2: fsub st0, real8 ptr [004015F8h]
  loc_0056A3C8: fnstsw ax
  loc_0056A3CA: test al, 0Dh
  loc_0056A3CC: jnz 0056A539h
  loc_0056A3D2: call [00401244h] ; __vbaFpI2
  loc_0056A3D8: mov var_B0, eax
  loc_0056A3DE: mov ebx, 00000001h
  loc_0056A3E3: cmp bx, var_B0
  loc_0056A3EA: jg 0056A4D3h
  loc_0056A3F0: sub esp, 00000010h
  loc_0056A3F3: mov ecx, 00000003h
  loc_0056A3F8: mov edx, esp
  loc_0056A3FA: movsx eax, bx
  loc_0056A3FD: mov [edx], ecx
  loc_0056A3FF: mov ecx, var_80
  loc_0056A402: push 0000000Ah
  loc_0056A404: push esi
  loc_0056A405: mov [edx+00000004h], ecx
  loc_0056A408: mov ecx, [esi]
  loc_0056A40A: mov [edx+00000008h], eax
  loc_0056A40D: mov eax, var_78
  loc_0056A410: mov [edx+0000000Ch], eax
  loc_0056A413: call [ecx+00000340h]
  loc_0056A419: lea edx, var_20
  loc_0056A41C: push eax
  loc_0056A41D: push edx
  loc_0056A41E: call edi
  loc_0056A420: push eax
  loc_0056A421: call [00401288h] ; __vbaLateIdSt
  loc_0056A427: lea ecx, var_20
  loc_0056A42A: call [004012B0h] ; __vbaFreeObj
  loc_0056A430: sub esp, 00000010h
  loc_0056A433: mov ecx, 00000003h
  loc_0056A438: mov edx, esp
  loc_0056A43A: xor eax, eax
  loc_0056A43C: push 0000000Bh
  loc_0056A43E: push esi
  loc_0056A43F: mov [edx], ecx
  loc_0056A441: mov ecx, var_80
  loc_0056A444: mov [edx+00000004h], ecx
  loc_0056A447: mov ecx, [esi]
  loc_0056A449: mov [edx+00000008h], eax
  loc_0056A44C: mov eax, var_78
  loc_0056A44F: mov [edx+0000000Ch], eax
  loc_0056A452: call [ecx+00000340h]
  loc_0056A458: lea edx, var_20
  loc_0056A45B: push eax
  loc_0056A45C: push edx
  loc_0056A45D: call edi
  loc_0056A45F: push eax
  loc_0056A460: call [00401288h] ; __vbaLateIdSt
  loc_0056A466: lea ecx, var_20
  loc_0056A469: call [004012B0h] ; __vbaFreeObj
  loc_0056A46F: push ebx
  loc_0056A470: call [00401008h] ; __vbaStrI2
  loc_0056A476: sub esp, 00000010h
  loc_0056A479: mov ecx, 00000008h
  loc_0056A47E: mov edx, esp
  loc_0056A480: mov var_34, ecx
  loc_0056A483: mov var_2C, eax
  loc_0056A486: push 00000000h
  loc_0056A488: mov [edx], ecx
  loc_0056A48A: mov ecx, var_30
  loc_0056A48D: push esi
  loc_0056A48E: mov [edx+00000004h], ecx
  loc_0056A491: mov ecx, [esi]
  loc_0056A493: mov [edx+00000008h], eax
  loc_0056A496: mov eax, var_28
  loc_0056A499: mov [edx+0000000Ch], eax
  loc_0056A49C: call [ecx+00000340h]
  loc_0056A4A2: lea edx, var_20
  loc_0056A4A5: push eax
  loc_0056A4A6: push edx
  loc_0056A4A7: call edi
  loc_0056A4A9: push eax
  loc_0056A4AA: call [00401288h] ; __vbaLateIdSt
  loc_0056A4B0: lea ecx, var_20
  loc_0056A4B3: call [004012B0h] ; __vbaFreeObj
  loc_0056A4B9: lea ecx, var_34
  loc_0056A4BC: call [00401020h] ; __vbaFreeVar
  loc_0056A4C2: mov eax, 00000001h
  loc_0056A4C7: add ax, bx
  loc_0056A4CA: jo 0056A53Eh
  loc_0056A4CC: mov ebx, eax
  loc_0056A4CE: jmp 0056A3E3h
  loc_0056A4D3: xor ebx, ebx
  loc_0056A4D5: mov var_4, ebx
  loc_0056A4D8: fwait
  loc_0056A4D9: push 0056A51Ah
  loc_0056A4DE: jmp 0056A519h
  loc_0056A4E0: lea ecx, var_1C
  loc_0056A4E3: call [004012ACh] ; __vbaFreeStr
  loc_0056A4E9: lea eax, var_24
  loc_0056A4EC: lea ecx, var_20
  loc_0056A4EF: push eax
  loc_0056A4F0: push ecx
  loc_0056A4F1: push 00000002h
  loc_0056A4F3: call [00401040h] ; __vbaFreeObjList
  loc_0056A4F9: lea edx, var_74
  loc_0056A4FC: lea eax, var_64
  loc_0056A4FF: push edx
  loc_0056A500: lea ecx, var_54
  loc_0056A503: push eax
  loc_0056A504: lea edx, var_44
  loc_0056A507: push ecx
  loc_0056A508: lea eax, var_34
  loc_0056A50B: push edx
  loc_0056A50C: push eax
  loc_0056A50D: push 00000005h
  loc_0056A50F: call [00401038h] ; __vbaFreeVarList
  loc_0056A515: add esp, 00000024h
  loc_0056A518: ret
  loc_0056A519: ret
  loc_0056A51A: mov eax, Me
  loc_0056A51D: push eax
  loc_0056A51E: mov ecx, [eax]
  loc_0056A520: call [ecx+00000008h]
  loc_0056A523: mov eax, var_4
  loc_0056A526: mov ecx, var_14
  loc_0056A529: pop edi
  loc_0056A52A: pop esi
  loc_0056A52B: mov fs:[00000000h], ecx
  loc_0056A532: pop ebx
  loc_0056A533: mov esp, ebp
  loc_0056A535: pop ebp
  loc_0056A536: retn 0004h
End Sub

Private Sub Proc_14_16_564D70(arg_C, arg_10) '564D70
  loc_00564D70: push ebp
  loc_00564D71: mov ebp, esp
  loc_00564D73: sub esp, 0000000Ch
  loc_00564D76: push 00403B36h ; __vbaExceptHandler
  loc_00564D7B: mov eax, fs:[00000000h]
  loc_00564D81: push eax
  loc_00564D82: mov fs:[00000000h], esp
  loc_00564D89: sub esp, 00000034h
  loc_00564D8C: push ebx
  loc_00564D8D: push esi
  loc_00564D8E: push edi
  loc_00564D8F: mov var_C, esp
  loc_00564D92: mov var_8, 004029B0h
  loc_00564D99: mov ecx, arg_10
  loc_00564D9C: mov esi, Me
  loc_00564D9F: xor eax, eax
  loc_00564DA1: push esi
  loc_00564DA2: mov [ecx], eax
  loc_00564DA4: mov edx, [esi]
  loc_00564DA6: mov var_24, eax
  loc_00564DA9: mov var_28, eax
  loc_00564DAC: call [edx+00000328h]
  loc_00564DB2: mov edi, [004010A0h] ; __vbaObjSet
  loc_00564DB8: push eax
  loc_00564DB9: lea eax, var_28
  loc_00564DBC: push eax
  loc_00564DBD: call edi
  loc_00564DBF: mov edx, arg_C
  loc_00564DC2: mov ebx, eax
  loc_00564DC4: mov ax, [edx]
  loc_00564DC7: mov ecx, [ebx]
  loc_00564DC9: push eax
  loc_00564DCA: push ebx
  loc_00564DCB: call [ecx+0000008Ch]
  loc_00564DD1: test eax, eax
  loc_00564DD3: fnclex
  loc_00564DD5: jge 00564DE9h
  loc_00564DD7: push 0000008Ch
  loc_00564DDC: push 0041E5E8h
  loc_00564DE1: push ebx
  loc_00564DE2: push eax
  loc_00564DE3: call [00401074h] ; __vbaHresultCheckObj
  loc_00564DE9: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_00564DEF: lea ecx, var_28
  loc_00564DF2: call ebx
  loc_00564DF4: mov ecx, [esi]
  loc_00564DF6: push esi
  loc_00564DF7: call [ecx+00000300h]
  loc_00564DFD: lea edx, var_28
  loc_00564E00: push eax
  loc_00564E01: push edx
  loc_00564E02: call edi
  loc_00564E04: mov ecx, arg_C
  loc_00564E07: mov edi, eax
  loc_00564E09: mov dx, [ecx]
  loc_00564E0C: mov eax, [edi]
  loc_00564E0E: push edx
  loc_00564E0F: push edi
  loc_00564E10: call [eax+0000008Ch]
  loc_00564E16: test eax, eax
  loc_00564E18: fnclex
  loc_00564E1A: jge 00564E2Eh
  loc_00564E1C: push 0000008Ch
  loc_00564E21: push 0041EAACh
  loc_00564E26: push edi
  loc_00564E27: push eax
  loc_00564E28: call [00401074h] ; __vbaHresultCheckObj
  loc_00564E2E: lea ecx, var_28
  loc_00564E31: call ebx
  loc_00564E33: mov eax, [esi]
  loc_00564E35: push esi
  loc_00564E36: call [eax+00000304h]
  loc_00564E3C: lea ecx, var_28
  loc_00564E3F: push eax
  loc_00564E40: push ecx
  loc_00564E41: call [004010A0h] ; __vbaObjSet
  loc_00564E47: mov edi, eax
  loc_00564E49: mov eax, arg_C
  loc_00564E4C: mov cx, [eax]
  loc_00564E4F: mov edx, [edi]
  loc_00564E51: push ecx
  loc_00564E52: push edi
  loc_00564E53: call [edx+0000008Ch]
  loc_00564E59: test eax, eax
  loc_00564E5B: fnclex
  loc_00564E5D: jge 00564E71h
  loc_00564E5F: push 0000008Ch
  loc_00564E64: push 0041E5E8h
  loc_00564E69: push edi
  loc_00564E6A: push eax
  loc_00564E6B: call [00401074h] ; __vbaHresultCheckObj
  loc_00564E71: lea ecx, var_28
  loc_00564E74: call ebx
  loc_00564E76: mov edx, [esi]
  loc_00564E78: push esi
  loc_00564E79: call [edx+00000324h]
  loc_00564E7F: push eax
  loc_00564E80: lea eax, var_28
  loc_00564E83: push eax
  loc_00564E84: call [004010A0h] ; __vbaObjSet
  loc_00564E8A: mov edx, arg_C
  loc_00564E8D: mov edi, eax
  loc_00564E8F: mov ax, [edx]
  loc_00564E92: mov ecx, [edi]
  loc_00564E94: push eax
  loc_00564E95: push edi
  loc_00564E96: call [ecx+0000008Ch]
  loc_00564E9C: test eax, eax
  loc_00564E9E: fnclex
  loc_00564EA0: jge 00564EB4h
  loc_00564EA2: push 0000008Ch
  loc_00564EA7: push 0041EAACh
  loc_00564EAC: push edi
  loc_00564EAD: push eax
  loc_00564EAE: call [00401074h] ; __vbaHresultCheckObj
  loc_00564EB4: lea ecx, var_28
  loc_00564EB7: call ebx
  loc_00564EB9: mov edx, var_34
  loc_00564EBC: sub esp, 00000010h
  loc_00564EBF: mov ecx, esp
  loc_00564EC1: mov eax, 0000400Bh
  loc_00564EC6: push 8001000Dh
  loc_00564ECB: push esi
  loc_00564ECC: mov [ecx], eax
  loc_00564ECE: mov eax, arg_C
  loc_00564ED1: mov [ecx+00000004h], edx
  loc_00564ED4: mov edx, var_2C
  loc_00564ED7: mov [ecx+00000008h], eax
  loc_00564EDA: mov eax, [esi]
  loc_00564EDC: mov [ecx+0000000Ch], edx
  loc_00564EDF: call [eax+00000340h]
  loc_00564EE5: lea ecx, var_28
  loc_00564EE8: push eax
  loc_00564EE9: push ecx
  loc_00564EEA: call [004010A0h] ; __vbaObjSet
  loc_00564EF0: push eax
  loc_00564EF1: call [00401288h] ; __vbaLateIdSt
  loc_00564EF7: lea ecx, var_28
  loc_00564EFA: call ebx
  loc_00564EFC: push 00564F1Dh
  loc_00564F01: jmp 00564F1Ch
  loc_00564F03: test var_4, 04h
  loc_00564F07: jz 00564F12h
  loc_00564F09: lea ecx, var_24
  loc_00564F0C: call [00401020h] ; __vbaFreeVar
  loc_00564F12: lea ecx, var_28
  loc_00564F15: call [004012B0h] ; __vbaFreeObj
  loc_00564F1B: ret
  loc_00564F1C: ret
  loc_00564F1D: mov edx, arg_10
  loc_00564F20: mov eax, var_24
  loc_00564F23: mov ecx, var_20
  loc_00564F26: pop edi
  loc_00564F27: mov [edx], eax
  loc_00564F29: mov eax, var_1C
  loc_00564F2C: pop esi
  loc_00564F2D: pop ebx
  loc_00564F2E: mov [edx+00000004h], ecx
  loc_00564F31: mov ecx, var_18
  loc_00564F34: mov [edx+00000008h], eax
  loc_00564F37: xor eax, eax
  loc_00564F39: mov [edx+0000000Ch], ecx
  loc_00564F3C: mov ecx, var_14
  loc_00564F3F: mov fs:[00000000h], ecx
  loc_00564F46: mov esp, ebp
  loc_00564F48: pop ebp
  loc_00564F49: retn 000Ch
End Sub

Private Sub Proc_14_17_564F50(arg_C, arg_10) '564F50
  loc_00564F50: push ebp
  loc_00564F51: mov ebp, esp
  loc_00564F53: sub esp, 0000000Ch
  loc_00564F56: push 00403B36h ; __vbaExceptHandler
  loc_00564F5B: mov eax, fs:[00000000h]
  loc_00564F61: push eax
  loc_00564F62: mov fs:[00000000h], esp
  loc_00564F69: sub esp, 00000024h
  loc_00564F6C: push ebx
  loc_00564F6D: push esi
  loc_00564F6E: push edi
  loc_00564F6F: mov var_C, esp
  loc_00564F72: mov var_8, 004029C0h
  loc_00564F79: mov ecx, arg_10
  loc_00564F7C: mov esi, Me
  loc_00564F7F: xor eax, eax
  loc_00564F81: push esi
  loc_00564F82: mov [ecx], eax
  loc_00564F84: mov edx, [esi]
  loc_00564F86: mov var_24, eax
  loc_00564F89: mov var_28, eax
  loc_00564F8C: call [edx+00000320h]
  loc_00564F92: mov edi, [004010A0h] ; __vbaObjSet
  loc_00564F98: push eax
  loc_00564F99: lea eax, var_28
  loc_00564F9C: push eax
  loc_00564F9D: call edi
  loc_00564F9F: mov ebx, arg_C
  loc_00564FA2: mov ecx, [eax]
  loc_00564FA4: mov var_2C, eax
  loc_00564FA7: mov dx, [ebx]
  loc_00564FAA: not dx
  loc_00564FAD: push edx
  loc_00564FAE: push eax
  loc_00564FAF: call [ecx+00000094h]
  loc_00564FB5: test eax, eax
  loc_00564FB7: fnclex
  loc_00564FB9: jge 00564FD0h
  loc_00564FBB: mov ecx, var_2C
  loc_00564FBE: push 00000094h
  loc_00564FC3: push 0041EAACh
  loc_00564FC8: push ecx
  loc_00564FC9: push eax
  loc_00564FCA: call [00401074h] ; __vbaHresultCheckObj
  loc_00564FD0: lea ecx, var_28
  loc_00564FD3: call [004012B0h] ; __vbaFreeObj
  loc_00564FD9: mov edx, [esi]
  loc_00564FDB: push esi
  loc_00564FDC: call [edx+0000031Ch]
  loc_00564FE2: push eax
  loc_00564FE3: lea eax, var_28
  loc_00564FE6: push eax
  loc_00564FE7: call edi
  loc_00564FE9: mov dx, [ebx]
  loc_00564FEC: mov ecx, [eax]
  loc_00564FEE: not dx
  loc_00564FF1: push edx
  loc_00564FF2: push eax
  loc_00564FF3: mov var_2C, eax
  loc_00564FF6: call [ecx+00000094h]
  loc_00564FFC: test eax, eax
  loc_00564FFE: fnclex
  loc_00565000: jge 00565017h
  loc_00565002: mov ecx, var_2C
  loc_00565005: push 00000094h
  loc_0056500A: push 0041EAACh
  loc_0056500F: push ecx
  loc_00565010: push eax
  loc_00565011: call [00401074h] ; __vbaHresultCheckObj
  loc_00565017: lea ecx, var_28
  loc_0056501A: call [004012B0h] ; __vbaFreeObj
  loc_00565020: mov edx, [esi]
  loc_00565022: push esi
  loc_00565023: call [edx+00000318h]
  loc_00565029: push eax
  loc_0056502A: lea eax, var_28
  loc_0056502D: push eax
  loc_0056502E: call edi
  loc_00565030: mov dx, [ebx]
  loc_00565033: mov ecx, [eax]
  loc_00565035: push edx
  loc_00565036: push eax
  loc_00565037: mov var_2C, eax
  loc_0056503A: call [ecx+00000094h]
  loc_00565040: test eax, eax
  loc_00565042: fnclex
  loc_00565044: jge 0056505Bh
  loc_00565046: mov ecx, var_2C
  loc_00565049: push 00000094h
  loc_0056504E: push 0041EAACh
  loc_00565053: push ecx
  loc_00565054: push eax
  loc_00565055: call [00401074h] ; __vbaHresultCheckObj
  loc_0056505B: lea ecx, var_28
  loc_0056505E: call [004012B0h] ; __vbaFreeObj
  loc_00565064: mov edx, [esi]
  loc_00565066: push esi
  loc_00565067: call [edx+000002FCh]
  loc_0056506D: push eax
  loc_0056506E: lea eax, var_28
  loc_00565071: push eax
  loc_00565072: call edi
  loc_00565074: mov dx, [ebx]
  loc_00565077: mov ecx, [eax]
  loc_00565079: push edx
  loc_0056507A: push eax
  loc_0056507B: mov var_2C, eax
  loc_0056507E: call [ecx+00000094h]
  loc_00565084: test eax, eax
  loc_00565086: fnclex
  loc_00565088: jge 0056509Fh
  loc_0056508A: mov ecx, var_2C
  loc_0056508D: push 00000094h
  loc_00565092: push 0041EAACh
  loc_00565097: push ecx
  loc_00565098: push eax
  loc_00565099: call [00401074h] ; __vbaHresultCheckObj
  loc_0056509F: lea ecx, var_28
  loc_005650A2: call [004012B0h] ; __vbaFreeObj
  loc_005650A8: mov edx, [esi]
  loc_005650AA: push esi
  loc_005650AB: call [edx+00000310h]
  loc_005650B1: push eax
  loc_005650B2: lea eax, var_28
  loc_005650B5: push eax
  loc_005650B6: call edi
  loc_005650B8: mov dx, [ebx]
  loc_005650BB: mov ecx, [eax]
  loc_005650BD: push edx
  loc_005650BE: push eax
  loc_005650BF: mov var_2C, eax
  loc_005650C2: call [ecx+00000094h]
  loc_005650C8: test eax, eax
  loc_005650CA: fnclex
  loc_005650CC: jge 005650E3h
  loc_005650CE: mov ecx, var_2C
  loc_005650D1: push 00000094h
  loc_005650D6: push 0041EAACh
  loc_005650DB: push ecx
  loc_005650DC: push eax
  loc_005650DD: call [00401074h] ; __vbaHresultCheckObj
  loc_005650E3: lea ecx, var_28
  loc_005650E6: call [004012B0h] ; __vbaFreeObj
  loc_005650EC: mov edx, [esi]
  loc_005650EE: push esi
  loc_005650EF: call [edx+0000030Ch]
  loc_005650F5: push eax
  loc_005650F6: lea eax, var_28
  loc_005650F9: push eax
  loc_005650FA: call edi
  loc_005650FC: mov dx, [ebx]
  loc_005650FF: mov ecx, [eax]
  loc_00565101: push edx
  loc_00565102: push eax
  loc_00565103: mov var_2C, eax
  loc_00565106: call [ecx+00000094h]
  loc_0056510C: test eax, eax
  loc_0056510E: fnclex
  loc_00565110: jge 00565127h
  loc_00565112: mov ecx, var_2C
  loc_00565115: push 00000094h
  loc_0056511A: push 0041EAACh
  loc_0056511F: push ecx
  loc_00565120: push eax
  loc_00565121: call [00401074h] ; __vbaHresultCheckObj
  loc_00565127: lea ecx, var_28
  loc_0056512A: call [004012B0h] ; __vbaFreeObj
  loc_00565130: mov edx, [esi]
  loc_00565132: push esi
  loc_00565133: call [edx+00000314h]
  loc_00565139: push eax
  loc_0056513A: lea eax, var_28
  loc_0056513D: push eax
  loc_0056513E: call edi
  loc_00565140: mov dx, [ebx]
  loc_00565143: mov ecx, [eax]
  loc_00565145: push edx
  loc_00565146: push eax
  loc_00565147: mov var_2C, eax
  loc_0056514A: call [ecx+00000094h]
  loc_00565150: test eax, eax
  loc_00565152: fnclex
  loc_00565154: jge 0056516Bh
  loc_00565156: mov ecx, var_2C
  loc_00565159: push 00000094h
  loc_0056515E: push 0041EAACh
  loc_00565163: push ecx
  loc_00565164: push eax
  loc_00565165: call [00401074h] ; __vbaHresultCheckObj
  loc_0056516B: lea ecx, var_28
  loc_0056516E: call [004012B0h] ; __vbaFreeObj
  loc_00565174: mov edx, [esi]
  loc_00565176: push esi
  loc_00565177: call [edx+00000308h]
  loc_0056517D: push eax
  loc_0056517E: lea eax, var_28
  loc_00565181: push eax
  loc_00565182: call edi
  loc_00565184: mov dx, [ebx]
  loc_00565187: mov esi, eax
  loc_00565189: push edx
  loc_0056518A: push esi
  loc_0056518B: mov ecx, [esi]
  loc_0056518D: call [ecx+00000094h]
  loc_00565193: test eax, eax
  loc_00565195: fnclex
  loc_00565197: jge 005651ABh
  loc_00565199: push 00000094h
  loc_0056519E: push 0041EAACh
  loc_005651A3: push esi
  loc_005651A4: push eax
  loc_005651A5: call [00401074h] ; __vbaHresultCheckObj
  loc_005651AB: lea ecx, var_28
  loc_005651AE: call [004012B0h] ; __vbaFreeObj
  loc_005651B4: push 005651D5h
  loc_005651B9: jmp 005651D4h
  loc_005651BB: test var_4, 04h
  loc_005651BF: jz 005651CAh
  loc_005651C1: lea ecx, var_24
  loc_005651C4: call [00401020h] ; __vbaFreeVar
  loc_005651CA: lea ecx, var_28
  loc_005651CD: call [004012B0h] ; __vbaFreeObj
  loc_005651D3: ret
  loc_005651D4: ret
  loc_005651D5: mov eax, arg_10
  loc_005651D8: mov ecx, var_24
  loc_005651DB: mov edx, var_20
  loc_005651DE: pop edi
  loc_005651DF: mov [eax], ecx
  loc_005651E1: mov ecx, var_1C
  loc_005651E4: pop esi
  loc_005651E5: pop ebx
  loc_005651E6: mov [eax+00000004h], edx
  loc_005651E9: mov edx, var_18
  loc_005651EC: mov [eax+00000008h], ecx
  loc_005651EF: mov ecx, var_14
  loc_005651F2: mov [eax+0000000Ch], edx
  loc_005651F5: xor eax, eax
  loc_005651F7: mov fs:[00000000h], ecx
  loc_005651FE: mov esp, ebp
  loc_00565200: pop ebp
  loc_00565201: retn 000Ch
End Sub

Private Sub Proc_14_18_565210() '565210
  loc_00565210: push ebp
  loc_00565211: mov ebp, esp
  loc_00565213: sub esp, 00000008h
  loc_00565216: push 00403B36h ; __vbaExceptHandler
  loc_0056521B: mov eax, fs:[00000000h]
  loc_00565221: push eax
  loc_00565222: mov fs:[00000000h], esp
  loc_00565229: sub esp, 00000048h
  loc_0056522C: push ebx
  loc_0056522D: push esi
  loc_0056522E: push edi
  loc_0056522F: mov var_8, esp
  loc_00565232: mov var_4, 004029D0h
  loc_00565239: mov edi, var_20
  loc_0056523C: sub esp, 00000010h
  loc_0056523F: mov esi, Me
  loc_00565242: mov edx, esp
  loc_00565244: mov ecx, 00000003h
  loc_00565249: mov ebx, var_18
  loc_0056524C: mov [edx], ecx
  loc_0056524E: xor eax, eax
  loc_00565250: mov var_14, eax
  loc_00565253: push 0000000Ah
  loc_00565255: mov [edx+00000004h], edi
  loc_00565258: push esi
  loc_00565259: mov [edx+00000008h], eax
  loc_0056525C: mov eax, [esi]
  loc_0056525E: mov [edx+0000000Ch], ebx
  loc_00565261: call [eax+00000340h]
  loc_00565267: lea ecx, var_14
  loc_0056526A: push eax
  loc_0056526B: push ecx
  loc_0056526C: call [004010A0h] ; __vbaObjSet
  loc_00565272: push eax
  loc_00565273: call [00401288h] ; __vbaLateIdSt
  loc_00565279: lea ecx, var_14
  loc_0056527C: call [004012B0h] ; __vbaFreeObj
  loc_00565282: sub esp, 00000010h
  loc_00565285: mov ecx, 00000003h
  loc_0056528A: mov edx, esp
  loc_0056528C: xor eax, eax
  loc_0056528E: push 0000000Bh
  loc_00565290: push esi
  loc_00565291: mov [edx], ecx
  loc_00565293: mov [edx+00000004h], edi
  loc_00565296: mov [edx+00000008h], eax
  loc_00565299: mov eax, [esi]
  loc_0056529B: mov [edx+0000000Ch], ebx
  loc_0056529E: call [eax+00000340h]
  loc_005652A4: lea ecx, var_14
  loc_005652A7: push eax
  loc_005652A8: push ecx
  loc_005652A9: call [004010A0h] ; __vbaObjSet
  loc_005652AF: push eax
  loc_005652B0: call [00401288h] ; __vbaLateIdSt
  loc_005652B6: lea ecx, var_14
  loc_005652B9: call [004012B0h] ; __vbaFreeObj
  loc_005652BF: sub esp, 00000010h
  loc_005652C2: mov ecx, 00000008h
  loc_005652C7: mov edx, esp
  loc_005652C9: mov eax, 0042457Ch ; "No"
  loc_005652CE: push 00000000h
  loc_005652D0: push esi
  loc_005652D1: mov [edx], ecx
  loc_005652D3: mov [edx+00000004h], edi
  loc_005652D6: mov [edx+00000008h], eax
  loc_005652D9: mov eax, [esi]
  loc_005652DB: mov [edx+0000000Ch], ebx
  loc_005652DE: call [eax+00000340h]
  loc_005652E4: lea ecx, var_14
  loc_005652E7: push eax
  loc_005652E8: push ecx
  loc_005652E9: call [004010A0h] ; __vbaObjSet
  loc_005652EF: push eax
  loc_005652F0: call [00401288h] ; __vbaLateIdSt
  loc_005652F6: lea ecx, var_14
  loc_005652F9: call [004012B0h] ; __vbaFreeObj
  loc_005652FF: sub esp, 00000010h
  loc_00565302: mov ecx, 00000003h
  loc_00565307: mov edx, esp
  loc_00565309: mov eax, 00000001h
  loc_0056530E: push 0000000Bh
  loc_00565310: push esi
  loc_00565311: mov [edx], ecx
  loc_00565313: mov [edx+00000004h], edi
  loc_00565316: mov [edx+00000008h], eax
  loc_00565319: mov eax, [esi]
  loc_0056531B: mov [edx+0000000Ch], ebx
  loc_0056531E: call [eax+00000340h]
  loc_00565324: lea ecx, var_14
  loc_00565327: push eax
  loc_00565328: push ecx
  loc_00565329: call [004010A0h] ; __vbaObjSet
  loc_0056532F: push eax
  loc_00565330: call [00401288h] ; __vbaLateIdSt
  loc_00565336: lea ecx, var_14
  loc_00565339: call [004012B0h] ; __vbaFreeObj
  loc_0056533F: sub esp, 00000010h
  loc_00565342: mov ecx, 00000008h
  loc_00565347: mov edx, esp
  loc_00565349: mov eax, 00428DE8h ; "Customer Name"
  loc_0056534E: push 00000000h
  loc_00565350: push esi
  loc_00565351: mov [edx], ecx
  loc_00565353: mov [edx+00000004h], edi
  loc_00565356: mov [edx+00000008h], eax
  loc_00565359: mov eax, [esi]
  loc_0056535B: mov [edx+0000000Ch], ebx
  loc_0056535E: call [eax+00000340h]
  loc_00565364: lea ecx, var_14
  loc_00565367: push eax
  loc_00565368: push ecx
  loc_00565369: call [004010A0h] ; __vbaObjSet
  loc_0056536F: push eax
  loc_00565370: call [00401288h] ; __vbaLateIdSt
  loc_00565376: lea ecx, var_14
  loc_00565379: call [004012B0h] ; __vbaFreeObj
  loc_0056537F: sub esp, 00000010h
  loc_00565382: mov ecx, 00000003h
  loc_00565387: mov edx, esp
  loc_00565389: mov eax, 00000002h
  loc_0056538E: push 0000000Bh
  loc_00565390: push esi
  loc_00565391: mov [edx], ecx
  loc_00565393: mov [edx+00000004h], edi
  loc_00565396: mov [edx+00000008h], eax
  loc_00565399: mov eax, [esi]
  loc_0056539B: mov [edx+0000000Ch], ebx
  loc_0056539E: call [eax+00000340h]
  loc_005653A4: lea ecx, var_14
  loc_005653A7: push eax
  loc_005653A8: push ecx
  loc_005653A9: call [004010A0h] ; __vbaObjSet
  loc_005653AF: push eax
  loc_005653B0: call [00401288h] ; __vbaLateIdSt
  loc_005653B6: lea ecx, var_14
  loc_005653B9: call [004012B0h] ; __vbaFreeObj
  loc_005653BF: sub esp, 00000010h
  loc_005653C2: mov ecx, 00000008h
  loc_005653C7: mov edx, esp
  loc_005653C9: mov eax, 0041EDD8h ; "SrNo"
  loc_005653CE: push 00000000h
  loc_005653D0: push esi
  loc_005653D1: mov [edx], ecx
  loc_005653D3: mov [edx+00000004h], edi
  loc_005653D6: mov [edx+00000008h], eax
  loc_005653D9: mov eax, [esi]
  loc_005653DB: mov [edx+0000000Ch], ebx
  loc_005653DE: call [eax+00000340h]
  loc_005653E4: lea ecx, var_14
  loc_005653E7: push eax
  loc_005653E8: push ecx
  loc_005653E9: call [004010A0h] ; __vbaObjSet
  loc_005653EF: push eax
  loc_005653F0: call [00401288h] ; __vbaLateIdSt
  loc_005653F6: lea ecx, var_14
  loc_005653F9: call [004012B0h] ; __vbaFreeObj
  loc_005653FF: sub esp, 00000010h
  loc_00565402: mov ecx, 00000003h
  loc_00565407: mov edx, esp
  loc_00565409: xor eax, eax
  loc_0056540B: sub esp, 00000010h
  loc_0056540E: mov var_44, ecx
  loc_00565411: mov [edx], ecx
  loc_00565413: mov ecx, esp
  loc_00565415: mov [edx+00000004h], edi
  loc_00565418: mov [edx+00000008h], eax
  loc_0056541B: mov [edx+0000000Ch], ebx
  loc_0056541E: mov edx, var_44
  loc_00565421: mov [ecx], edx
  loc_00565423: mov eax, var_40
  loc_00565426: mov edx, var_38
  loc_00565429: mov [ecx+00000004h], eax
  loc_0056542C: mov eax, 00000258h
  loc_00565431: push 00000001h
  loc_00565433: push 00000039h
  loc_00565435: mov [ecx+00000008h], eax
  loc_00565438: mov eax, [esi]
  loc_0056543A: push esi
  loc_0056543B: mov [ecx+0000000Ch], edx
  loc_0056543E: call [eax+00000340h]
  loc_00565444: lea ecx, var_14
  loc_00565447: push eax
  loc_00565448: push ecx
  loc_00565449: call [004010A0h] ; __vbaObjSet
  loc_0056544F: push eax
  loc_00565450: call [00401160h] ; __vbaLateIdCallSt
  loc_00565456: add esp, 0000002Ch
  loc_00565459: lea ecx, var_14
  loc_0056545C: call [004012B0h] ; __vbaFreeObj
  loc_00565462: sub esp, 00000010h
  loc_00565465: mov ecx, 00000003h
  loc_0056546A: mov edx, esp
  loc_0056546C: mov eax, 00000001h
  loc_00565471: sub esp, 00000010h
  loc_00565474: mov var_44, ecx
  loc_00565477: mov [edx], ecx
  loc_00565479: mov ecx, esp
  loc_0056547B: push 00000001h
  loc_0056547D: push 00000039h
  loc_0056547F: mov [edx+00000004h], edi
  loc_00565482: push esi
  loc_00565483: mov [edx+00000008h], eax
  loc_00565486: mov eax, var_40
  loc_00565489: mov [edx+0000000Ch], ebx
  loc_0056548C: mov edx, var_44
  loc_0056548F: mov [ecx], edx
  loc_00565491: mov edx, var_38
  loc_00565494: mov [ecx+00000004h], eax
  loc_00565497: mov eax, 000008FCh
  loc_0056549C: mov [ecx+00000008h], eax
  loc_0056549F: mov eax, [esi]
  loc_005654A1: mov [ecx+0000000Ch], edx
  loc_005654A4: call [eax+00000340h]
  loc_005654AA: lea ecx, var_14
  loc_005654AD: push eax
  loc_005654AE: push ecx
  loc_005654AF: call [004010A0h] ; __vbaObjSet
  loc_005654B5: push eax
  loc_005654B6: call [00401160h] ; __vbaLateIdCallSt
  loc_005654BC: add esp, 0000002Ch
  loc_005654BF: lea ecx, var_14
  loc_005654C2: call [004012B0h] ; __vbaFreeObj
  loc_005654C8: sub esp, 00000010h
  loc_005654CB: mov ecx, 00000003h
  loc_005654D0: mov edx, esp
  loc_005654D2: mov eax, 00000002h
  loc_005654D7: sub esp, 00000010h
  loc_005654DA: mov var_44, ecx
  loc_005654DD: mov [edx], ecx
  loc_005654DF: mov ecx, esp
  loc_005654E1: push 00000001h
  loc_005654E3: push 00000039h
  loc_005654E5: mov [edx+00000004h], edi
  loc_005654E8: push esi
  loc_005654E9: mov [edx+00000008h], eax
  loc_005654EC: mov eax, var_40
  loc_005654EF: mov [edx+0000000Ch], ebx
  loc_005654F2: mov edx, var_44
  loc_005654F5: mov [ecx], edx
  loc_005654F7: mov edx, var_38
  loc_005654FA: mov [ecx+00000004h], eax
  loc_005654FD: mov eax, 000005AAh
  loc_00565502: mov [ecx+00000008h], eax
  loc_00565505: mov eax, [esi]
  loc_00565507: mov [ecx+0000000Ch], edx
  loc_0056550A: call [eax+00000340h]
  loc_00565510: lea ecx, var_14
  loc_00565513: push eax
  loc_00565514: push ecx
  loc_00565515: call [004010A0h] ; __vbaObjSet
  loc_0056551B: push eax
  loc_0056551C: call [00401160h] ; __vbaLateIdCallSt
  loc_00565522: add esp, 0000002Ch
  loc_00565525: lea ecx, var_14
  loc_00565528: call [004012B0h] ; __vbaFreeObj
  loc_0056552E: push 00565540h
  loc_00565533: jmp 0056553Fh
  loc_00565535: lea ecx, var_14
  loc_00565538: call [004012B0h] ; __vbaFreeObj
  loc_0056553E: ret
  loc_0056553F: ret
  loc_00565540: mov ecx, var_10
  loc_00565543: pop edi
  loc_00565544: pop esi
  loc_00565545: xor eax, eax
  loc_00565547: mov fs:[00000000h], ecx
  loc_0056554E: pop ebx
  loc_0056554F: mov esp, ebp
  loc_00565551: pop ebp
  loc_00565552: retn 0004h
End Sub

Private Sub Proc_14_19_565560() '565560
  loc_00565560: push ebp
  loc_00565561: mov ebp, esp
  loc_00565563: sub esp, 00000008h
  loc_00565566: push 00403B36h ; __vbaExceptHandler
  loc_0056556B: mov eax, fs:[00000000h]
  loc_00565571: push eax
  loc_00565572: mov fs:[00000000h], esp
  loc_00565579: sub esp, 00000110h
  loc_0056557F: push ebx
  loc_00565580: push esi
  loc_00565581: push edi
  loc_00565582: mov var_8, esp
  loc_00565585: mov var_4, 004029E0h
  loc_0056558C: mov edi, [004010D4h] ; rtcTrimVar
  loc_00565592: lea eax, var_90
  loc_00565598: lea ecx, var_30
  loc_0056559B: xor esi, esi
  loc_0056559D: mov ebx, 00004008h
  loc_005655A2: push eax
  loc_005655A3: push ecx
  loc_005655A4: mov var_14, esi
  loc_005655A7: mov var_18, esi
  loc_005655AA: mov var_1C, esi
  loc_005655AD: mov var_20, esi
  loc_005655B0: mov var_30, esi
  loc_005655B3: mov var_40, esi
  loc_005655B6: mov var_50, esi
  loc_005655B9: mov var_60, esi
  loc_005655BC: mov var_70, esi
  loc_005655BF: mov var_80, esi
  loc_005655C2: mov var_A0, esi
  loc_005655C8: mov var_B0, esi
  loc_005655CE: mov var_C0, esi
  loc_005655D4: mov var_D0, esi
  loc_005655DA: mov var_104, esi
  loc_005655E0: mov var_88, 0061A05Ch
  loc_005655EA: mov var_90, ebx
  loc_005655F0: call edi
  loc_005655F2: lea edx, var_C0
  loc_005655F8: lea eax, var_60
  loc_005655FB: push edx
  loc_005655FC: push eax
  loc_005655FD: mov var_B8, 0061A0B8h
  loc_00565607: mov var_C0, ebx
  loc_0056560D: call edi
  loc_0056560F: mov edi, 00000008h
  loc_00565614: mov var_98, 00428E08h ; "Select Distinct OnCount,AgentName,SrNo from LG WHERE OnCount='"
  loc_0056561E: mov var_A0, edi
  loc_00565624: mov var_B0, edi
  loc_0056562A: mov var_D0, edi
  loc_00565630: mov edi, [0061A13Ch]
  loc_00565636: mov var_A8, 00428E8Ch ; "' and  AgentName='"
  loc_00565640: mov var_C8, 0041E890h ; "'"
  loc_0056564A: mov ebx, [edi]
  loc_0056564C: lea edi, var_18
  loc_0056564F: push edi
  loc_00565650: mov ecx, 0000000Ah
  loc_00565655: sub esp, 00000010h
  loc_00565658: mov var_F0, ecx
  loc_0056565E: mov edi, esp
  loc_00565660: mov eax, 80020004h
  loc_00565665: mov edx, eax
  loc_00565667: sub esp, 00000010h
  loc_0056566A: mov [edi], ecx
  loc_0056566C: mov ecx, var_FC
  loc_00565672: mov [edi+00000004h], ecx
  loc_00565675: mov ecx, esp
  loc_00565677: sub esp, 00000010h
  loc_0056567A: mov [edi+00000008h], eax
  loc_0056567D: mov eax, var_F4
  loc_00565683: mov [edi+0000000Ch], eax
  loc_00565686: mov eax, var_F0
  loc_0056568C: mov [ecx], eax
  loc_0056568E: mov eax, var_EC
  loc_00565694: mov [ecx+00000004h], eax
  loc_00565697: mov eax, 00000003h
  loc_0056569C: mov [ecx+00000008h], edx
  loc_0056569F: mov edx, var_E4
  loc_005656A5: mov [ecx+0000000Ch], edx
  loc_005656A8: mov edx, var_DC
  loc_005656AE: mov ecx, esp
  loc_005656B0: mov [ecx], eax
  loc_005656B2: mov eax, 00000004h
  loc_005656B7: mov [ecx+00000004h], edx
  loc_005656BA: mov [ecx+00000008h], eax
  loc_005656BD: mov eax, var_D4
  loc_005656C3: mov [ecx+0000000Ch], eax
  loc_005656C6: lea ecx, var_A0
  loc_005656CC: push ecx
  loc_005656CD: mov edi, [004011B4h] ; __vbaVarCat
  loc_005656D3: lea edx, var_30
  loc_005656D6: lea eax, var_40
  loc_005656D9: push edx
  loc_005656DA: push eax
  loc_005656DB: call edi
  loc_005656DD: lea ecx, var_B0
  loc_005656E3: push eax
  loc_005656E4: lea edx, var_50
  loc_005656E7: push ecx
  loc_005656E8: push edx
  loc_005656E9: call edi
  loc_005656EB: push eax
  loc_005656EC: lea eax, var_60
  loc_005656EF: lea ecx, var_70
  loc_005656F2: push eax
  loc_005656F3: push ecx
  loc_005656F4: call edi
  loc_005656F6: push eax
  loc_005656F7: lea edx, var_D0
  loc_005656FD: lea eax, var_80
  loc_00565700: push edx
  loc_00565701: push eax
  loc_00565702: call edi
  loc_00565704: lea ecx, var_14
  loc_00565707: push eax
  loc_00565708: push ecx
  loc_00565709: call [004011B0h] ; __vbaStrVarVal
  loc_0056570F: mov edx, [0061A13Ch]
  loc_00565715: push eax
  loc_00565716: push edx
  loc_00565717: call [ebx+000000BCh]
  loc_0056571D: cmp eax, esi
  loc_0056571F: fnclex
  loc_00565721: jge 0056573Bh
  loc_00565723: mov ecx, [0061A13Ch]
  loc_00565729: push 000000BCh
  loc_0056572E: push 0041E928h
  loc_00565733: push ecx
  loc_00565734: push eax
  loc_00565735: call [00401074h] ; __vbaHresultCheckObj
  loc_0056573B: mov esi, Me
  loc_0056573E: mov edx, var_18
  loc_00565741: push edx
  loc_00565742: lea eax, [esi+00000034h]
  loc_00565745: push eax
  loc_00565746: mov var_120, eax
  loc_0056574C: call [004010B8h] ; __vbaObjSetAddref
  loc_00565752: lea ecx, var_14
  loc_00565755: call [004012ACh] ; __vbaFreeStr
  loc_0056575B: lea ecx, var_18
  loc_0056575E: call [004012B0h] ; __vbaFreeObj
  loc_00565764: lea eax, var_80
  loc_00565767: lea ecx, var_70
  loc_0056576A: push eax
  loc_0056576B: lea edx, var_60
  loc_0056576E: push ecx
  loc_0056576F: lea eax, var_50
  loc_00565772: push edx
  loc_00565773: lea ecx, var_40
  loc_00565776: push eax
  loc_00565777: lea edx, var_30
  loc_0056577A: push ecx
  loc_0056577B: push edx
  loc_0056577C: push 00000006h
  loc_0056577E: call [00401038h] ; __vbaFreeVarList
  loc_00565784: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_0056578A: mov edi, [004010A0h] ; __vbaObjSet
  loc_00565790: add esp, 0000001Ch
  loc_00565793: mov eax, var_120
  loc_00565799: lea edx, var_104
  loc_0056579F: push edx
  loc_005657A0: mov eax, [eax]
  loc_005657A2: push eax
  loc_005657A3: mov ecx, [eax]
  loc_005657A5: call [ecx+00000034h]
  loc_005657A8: test eax, eax
  loc_005657AA: fnclex
  loc_005657AC: jge 005657C5h
  loc_005657AE: mov ecx, var_120
  loc_005657B4: push 00000034h
  loc_005657B6: push 0041E938h
  loc_005657BB: mov edx, [ecx]
  loc_005657BD: push edx
  loc_005657BE: push eax
  loc_005657BF: call [00401074h] ; __vbaHresultCheckObj
  loc_005657C5: cmp var_104, 0000h
  loc_005657CD: jnz 00565D33h
  loc_005657D3: mov eax, [esi+00000038h]
  loc_005657D6: push eax
  loc_005657D7: call [004011F4h] ; __vbaI4Str
  loc_005657DD: sub esp, 00000010h
  loc_005657E0: mov ecx, 00000003h
  loc_005657E5: mov edx, esp
  loc_005657E7: mov var_90, ecx
  loc_005657ED: mov var_88, eax
  loc_005657F3: push 0000000Ah
  loc_005657F5: mov [edx], ecx
  loc_005657F7: mov ecx, var_8C
  loc_005657FD: push esi
  loc_005657FE: mov [edx+00000004h], ecx
  loc_00565801: mov ecx, [esi]
  loc_00565803: mov [edx+00000008h], eax
  loc_00565806: mov eax, var_84
  loc_0056580C: mov [edx+0000000Ch], eax
  loc_0056580F: call [ecx+00000340h]
  loc_00565815: lea edx, var_18
  loc_00565818: push eax
  loc_00565819: push edx
  loc_0056581A: call edi
  loc_0056581C: push eax
  loc_0056581D: call ebx
  loc_0056581F: lea ecx, var_18
  loc_00565822: call [004012B0h] ; __vbaFreeObj
  loc_00565828: sub esp, 00000010h
  loc_0056582B: mov ecx, 00000003h
  loc_00565830: mov edx, esp
  loc_00565832: mov var_90, ecx
  loc_00565838: xor eax, eax
  loc_0056583A: push 0000000Bh
  loc_0056583C: mov [edx], ecx
  loc_0056583E: mov ecx, var_8C
  loc_00565844: mov var_88, eax
  loc_0056584A: push esi
  loc_0056584B: mov [edx+00000004h], ecx
  loc_0056584E: mov ecx, [esi]
  loc_00565850: mov [edx+00000008h], eax
  loc_00565853: mov eax, var_84
  loc_00565859: mov [edx+0000000Ch], eax
  loc_0056585C: call [ecx+00000340h]
  loc_00565862: lea edx, var_18
  loc_00565865: push eax
  loc_00565866: push edx
  loc_00565867: call edi
  loc_00565869: push eax
  loc_0056586A: call ebx
  loc_0056586C: lea ecx, var_18
  loc_0056586F: call [004012B0h] ; __vbaFreeObj
  loc_00565875: sub esp, 00000010h
  loc_00565878: mov ecx, 00000002h
  loc_0056587D: mov edx, esp
  loc_0056587F: mov var_90, ecx
  loc_00565885: mov eax, 00000001h
  loc_0056588A: push 00000028h
  loc_0056588C: mov [edx], ecx
  loc_0056588E: mov ecx, var_8C
  loc_00565894: mov var_88, eax
  loc_0056589A: push esi
  loc_0056589B: mov [edx+00000004h], ecx
  loc_0056589E: mov ecx, [esi]
  loc_005658A0: mov [edx+00000008h], eax
  loc_005658A3: mov eax, var_84
  loc_005658A9: mov [edx+0000000Ch], eax
  loc_005658AC: call [ecx+00000340h]
  loc_005658B2: lea edx, var_18
  loc_005658B5: push eax
  loc_005658B6: push edx
  loc_005658B7: call edi
  loc_005658B9: push eax
  loc_005658BA: call ebx
  loc_005658BC: lea ecx, var_18
  loc_005658BF: call [004012B0h] ; __vbaFreeObj
  loc_005658C5: sub esp, 00000010h
  loc_005658C8: lea eax, [esi+00000038h]
  loc_005658CB: mov edx, esp
  loc_005658CD: mov ecx, 00004008h
  loc_005658D2: mov var_88, eax
  loc_005658D8: mov var_90, ecx
  loc_005658DE: mov [edx], ecx
  loc_005658E0: mov ecx, var_8C
  loc_005658E6: push 00000000h
  loc_005658E8: mov [edx+00000004h], ecx
  loc_005658EB: mov ecx, [esi]
  loc_005658ED: push esi
  loc_005658EE: mov [edx+00000008h], eax
  loc_005658F1: mov eax, var_84
  loc_005658F7: mov [edx+0000000Ch], eax
  loc_005658FA: call [ecx+00000340h]
  loc_00565900: lea edx, var_18
  loc_00565903: push eax
  loc_00565904: push edx
  loc_00565905: call edi
  loc_00565907: push eax
  loc_00565908: call ebx
  loc_0056590A: lea ecx, var_18
  loc_0056590D: call [004012B0h] ; __vbaFreeObj
  loc_00565913: sub esp, 00000010h
  loc_00565916: mov ecx, 00000003h
  loc_0056591B: mov edx, esp
  loc_0056591D: mov var_90, ecx
  loc_00565923: mov eax, 00000001h
  loc_00565928: push 0000000Bh
  loc_0056592A: mov [edx], ecx
  loc_0056592C: mov ecx, var_8C
  loc_00565932: mov var_88, eax
  loc_00565938: push esi
  loc_00565939: mov [edx+00000004h], ecx
  loc_0056593C: mov ecx, [esi]
  loc_0056593E: mov [edx+00000008h], eax
  loc_00565941: mov eax, var_84
  loc_00565947: mov [edx+0000000Ch], eax
  loc_0056594A: call [ecx+00000340h]
  loc_00565950: lea edx, var_18
  loc_00565953: push eax
  loc_00565954: push edx
  loc_00565955: call edi
  loc_00565957: push eax
  loc_00565958: call ebx
  loc_0056595A: lea ecx, var_18
  loc_0056595D: call [004012B0h] ; __vbaFreeObj
  loc_00565963: sub esp, 00000010h
  loc_00565966: mov ecx, 00000002h
  loc_0056596B: mov edx, esp
  loc_0056596D: mov var_90, ecx
  loc_00565973: mov eax, 00000001h
  loc_00565978: push 00000028h
  loc_0056597A: mov [edx], ecx
  loc_0056597C: mov ecx, var_8C
  loc_00565982: mov var_88, eax
  loc_00565988: push esi
  loc_00565989: mov [edx+00000004h], ecx
  loc_0056598C: mov ecx, [esi]
  loc_0056598E: mov [edx+00000008h], eax
  loc_00565991: mov eax, var_84
  loc_00565997: mov [edx+0000000Ch], eax
  loc_0056599A: call [ecx+00000340h]
  loc_005659A0: lea edx, var_18
  loc_005659A3: push eax
  loc_005659A4: push edx
  loc_005659A5: call edi
  loc_005659A7: push eax
  loc_005659A8: call ebx
  loc_005659AA: lea ecx, var_18
  loc_005659AD: call [004012B0h] ; __vbaFreeObj
  loc_005659B3: mov eax, var_120
  loc_005659B9: lea edx, var_18
  loc_005659BC: push edx
  loc_005659BD: mov eax, [eax]
  loc_005659BF: push eax
  loc_005659C0: mov ecx, [eax]
  loc_005659C2: call [ecx+000000B4h]
  loc_005659C8: test eax, eax
  loc_005659CA: fnclex
  loc_005659CC: jge 005659E8h
  loc_005659CE: mov ecx, var_120
  loc_005659D4: push 000000B4h
  loc_005659D9: push 0041E938h
  loc_005659DE: mov edx, [ecx]
  loc_005659E0: push edx
  loc_005659E1: push eax
  loc_005659E2: call [00401074h] ; __vbaHresultCheckObj
  loc_005659E8: lea edx, var_1C
  loc_005659EB: mov eax, 00000008h
  loc_005659F0: push edx
  loc_005659F1: mov ecx, var_18
  loc_005659F4: sub esp, 00000010h
  loc_005659F7: mov var_90, eax
  loc_005659FD: mov edx, esp
  loc_005659FF: mov var_88, 0041EB18h ; "AgentName"
  loc_00565A09: mov var_10C, ecx
  loc_00565A0F: mov ecx, [ecx]
  loc_00565A11: mov [edx], eax
  loc_00565A13: mov eax, var_8C
  loc_00565A19: mov [edx+00000004h], eax
  loc_00565A1C: mov eax, var_88
  loc_00565A22: mov [edx+00000008h], eax
  loc_00565A25: mov eax, var_84
  loc_00565A2B: mov [edx+0000000Ch], eax
  loc_00565A2E: mov edx, var_18
  loc_00565A31: push edx
  loc_00565A32: call [ecx+00000030h]
  loc_00565A35: test eax, eax
  loc_00565A37: fnclex
  loc_00565A39: jge 00565A50h
  loc_00565A3B: mov ecx, var_10C
  loc_00565A41: push 00000030h
  loc_00565A43: push 0041EA14h ; "S"
  loc_00565A48: push ecx
  loc_00565A49: push eax
  loc_00565A4A: call [00401074h] ; __vbaHresultCheckObj
  loc_00565A50: mov eax, var_1C
  loc_00565A53: lea ecx, var_30
  loc_00565A56: push ecx
  loc_00565A57: push eax
  loc_00565A58: mov edx, [eax]
  loc_00565A5A: mov var_114, eax
  loc_00565A60: call [edx+00000044h]
  loc_00565A63: test eax, eax
  loc_00565A65: fnclex
  loc_00565A67: jge 00565A7Eh
  loc_00565A69: mov edx, var_114
  loc_00565A6F: push 00000044h
  loc_00565A71: push 0041EA48h
  loc_00565A76: push edx
  loc_00565A77: push eax
  loc_00565A78: call [00401074h] ; __vbaHresultCheckObj
  loc_00565A7E: lea eax, var_30
  loc_00565A81: push eax
  loc_00565A82: call [00401028h] ; __vbaStrVarMove
  loc_00565A88: sub esp, 00000010h
  loc_00565A8B: mov ecx, 00000008h
  loc_00565A90: mov edx, esp
  loc_00565A92: mov var_40, ecx
  loc_00565A95: mov var_38, eax
  loc_00565A98: push 00000000h
  loc_00565A9A: mov [edx], ecx
  loc_00565A9C: mov ecx, var_3C
  loc_00565A9F: push esi
  loc_00565AA0: mov [edx+00000004h], ecx
  loc_00565AA3: mov ecx, [esi]
  loc_00565AA5: mov [edx+00000008h], eax
  loc_00565AA8: mov eax, var_34
  loc_00565AAB: mov [edx+0000000Ch], eax
  loc_00565AAE: call [ecx+00000340h]
  loc_00565AB4: lea edx, var_20
  loc_00565AB7: push eax
  loc_00565AB8: push edx
  loc_00565AB9: call edi
  loc_00565ABB: push eax
  loc_00565ABC: call ebx
  loc_00565ABE: lea eax, var_20
  loc_00565AC1: lea ecx, var_1C
  loc_00565AC4: push eax
  loc_00565AC5: lea edx, var_18
  loc_00565AC8: push ecx
  loc_00565AC9: push edx
  loc_00565ACA: push 00000003h
  loc_00565ACC: call [00401040h] ; __vbaFreeObjList
  loc_00565AD2: lea eax, var_40
  loc_00565AD5: lea ecx, var_30
  loc_00565AD8: push eax
  loc_00565AD9: push ecx
  loc_00565ADA: push 00000002h
  loc_00565ADC: call [00401038h] ; __vbaFreeVarList
  loc_00565AE2: add esp, 0000000Ch
  loc_00565AE5: mov ecx, 00000003h
  loc_00565AEA: mov edx, esp
  loc_00565AEC: mov var_90, ecx
  loc_00565AF2: mov eax, 00000002h
  loc_00565AF7: push 0000000Bh
  loc_00565AF9: mov [edx], ecx
  loc_00565AFB: mov ecx, var_8C
  loc_00565B01: mov var_88, eax
  loc_00565B07: push esi
  loc_00565B08: mov [edx+00000004h], ecx
  loc_00565B0B: mov ecx, [esi]
  loc_00565B0D: mov [edx+00000008h], eax
  loc_00565B10: mov eax, var_84
  loc_00565B16: mov [edx+0000000Ch], eax
  loc_00565B19: call [ecx+00000340h]
  loc_00565B1F: lea edx, var_18
  loc_00565B22: push eax
  loc_00565B23: push edx
  loc_00565B24: call edi
  loc_00565B26: push eax
  loc_00565B27: call ebx
  loc_00565B29: lea ecx, var_18
  loc_00565B2C: call [004012B0h] ; __vbaFreeObj
  loc_00565B32: sub esp, 00000010h
  loc_00565B35: mov ecx, 00000002h
  loc_00565B3A: mov edx, esp
  loc_00565B3C: mov var_90, ecx
  loc_00565B42: mov eax, 00000001h
  loc_00565B47: push 00000028h
  loc_00565B49: mov [edx], ecx
  loc_00565B4B: mov ecx, var_8C
  loc_00565B51: mov var_88, eax
  loc_00565B57: push esi
  loc_00565B58: mov [edx+00000004h], ecx
  loc_00565B5B: mov ecx, [esi]
  loc_00565B5D: mov [edx+00000008h], eax
  loc_00565B60: mov eax, var_84
  loc_00565B66: mov [edx+0000000Ch], eax
  loc_00565B69: call [ecx+00000340h]
  loc_00565B6F: lea edx, var_18
  loc_00565B72: push eax
  loc_00565B73: push edx
  loc_00565B74: call edi
  loc_00565B76: push eax
  loc_00565B77: call ebx
  loc_00565B79: lea ecx, var_18
  loc_00565B7C: call [004012B0h] ; __vbaFreeObj
  loc_00565B82: mov eax, var_120
  loc_00565B88: lea edx, var_18
  loc_00565B8B: push edx
  loc_00565B8C: mov eax, [eax]
  loc_00565B8E: push eax
  loc_00565B8F: mov ecx, [eax]
  loc_00565B91: call [ecx+000000B4h]
  loc_00565B97: test eax, eax
  loc_00565B99: fnclex
  loc_00565B9B: jge 00565BB7h
  loc_00565B9D: mov ecx, var_120
  loc_00565BA3: push 000000B4h
  loc_00565BA8: push 0041E938h
  loc_00565BAD: mov edx, [ecx]
  loc_00565BAF: push edx
  loc_00565BB0: push eax
  loc_00565BB1: call [00401074h] ; __vbaHresultCheckObj
  loc_00565BB7: lea edx, var_1C
  loc_00565BBA: mov eax, 00000008h
  loc_00565BBF: push edx
  loc_00565BC0: mov ecx, var_18
  loc_00565BC3: sub esp, 00000010h
  loc_00565BC6: mov var_90, eax
  loc_00565BCC: mov edx, esp
  loc_00565BCE: mov var_88, 0041EDD8h ; "SrNo"
  loc_00565BD8: mov var_10C, ecx
  loc_00565BDE: mov ecx, [ecx]
  loc_00565BE0: mov [edx], eax
  loc_00565BE2: mov eax, var_8C
  loc_00565BE8: mov [edx+00000004h], eax
  loc_00565BEB: mov eax, var_88
  loc_00565BF1: mov [edx+00000008h], eax
  loc_00565BF4: mov eax, var_84
  loc_00565BFA: mov [edx+0000000Ch], eax
  loc_00565BFD: mov edx, var_18
  loc_00565C00: push edx
  loc_00565C01: call [ecx+00000030h]
  loc_00565C04: test eax, eax
  loc_00565C06: fnclex
  loc_00565C08: jge 00565C1Fh
  loc_00565C0A: mov ecx, var_10C
  loc_00565C10: push 00000030h
  loc_00565C12: push 0041EA14h ; "S"
  loc_00565C17: push ecx
  loc_00565C18: push eax
  loc_00565C19: call [00401074h] ; __vbaHresultCheckObj
  loc_00565C1F: mov eax, var_1C
  loc_00565C22: lea ecx, var_30
  loc_00565C25: push ecx
  loc_00565C26: push eax
  loc_00565C27: mov edx, [eax]
  loc_00565C29: mov var_114, eax
  loc_00565C2F: call [edx+00000044h]
  loc_00565C32: test eax, eax
  loc_00565C34: fnclex
  loc_00565C36: jge 00565C4Dh
  loc_00565C38: mov edx, var_114
  loc_00565C3E: push 00000044h
  loc_00565C40: push 0041EA48h
  loc_00565C45: push edx
  loc_00565C46: push eax
  loc_00565C47: call [00401074h] ; __vbaHresultCheckObj
  loc_00565C4D: lea eax, var_30
  loc_00565C50: push eax
  loc_00565C51: call [00401028h] ; __vbaStrVarMove
  loc_00565C57: sub esp, 00000010h
  loc_00565C5A: mov ecx, 00000008h
  loc_00565C5F: mov edx, esp
  loc_00565C61: mov var_40, ecx
  loc_00565C64: mov var_38, eax
  loc_00565C67: push 00000000h
  loc_00565C69: mov [edx], ecx
  loc_00565C6B: mov ecx, var_3C
  loc_00565C6E: push esi
  loc_00565C6F: mov [edx+00000004h], ecx
  loc_00565C72: mov ecx, [esi]
  loc_00565C74: mov [edx+00000008h], eax
  loc_00565C77: mov eax, var_34
  loc_00565C7A: mov [edx+0000000Ch], eax
  loc_00565C7D: call [ecx+00000340h]
  loc_00565C83: lea edx, var_20
  loc_00565C86: push eax
  loc_00565C87: push edx
  loc_00565C88: call edi
  loc_00565C8A: push eax
  loc_00565C8B: call ebx
  loc_00565C8D: lea eax, var_20
  loc_00565C90: lea ecx, var_1C
  loc_00565C93: push eax
  loc_00565C94: lea edx, var_18
  loc_00565C97: push ecx
  loc_00565C98: push edx
  loc_00565C99: push 00000003h
  loc_00565C9B: call [00401040h] ; __vbaFreeObjList
  loc_00565CA1: lea eax, var_40
  loc_00565CA4: lea ecx, var_30
  loc_00565CA7: push eax
  loc_00565CA8: push ecx
  loc_00565CA9: push 00000002h
  loc_00565CAB: call [00401038h] ; __vbaFreeVarList
  loc_00565CB1: mov edx, [esi+00000038h]
  loc_00565CB4: add esp, 0000001Ch
  loc_00565CB7: push edx
  loc_00565CB8: call [004011D8h] ; __vbaR8Str
  loc_00565CBE: fadd st0, real8 ptr [004015F8h]
  loc_00565CC4: sub esp, 00000008h
  loc_00565CC7: fnstsw ax
  loc_00565CC9: test al, 0Dh
  loc_00565CCB: jnz 00565DE2h
  loc_00565CD1: fstp real8 ptr [esp]
  loc_00565CD4: call [00401144h] ; __vbaStrR8
  loc_00565CDA: mov edx, eax
  loc_00565CDC: lea ecx, var_14
  loc_00565CDF: call [00401270h] ; __vbaStrMove
  loc_00565CE5: mov edx, eax
  loc_00565CE7: lea ecx, [esi+00000038h]
  loc_00565CEA: call [004011ECh] ; __vbaStrCopy
  loc_00565CF0: lea ecx, var_14
  loc_00565CF3: call [004012ACh] ; __vbaFreeStr
  loc_00565CF9: mov eax, var_120
  loc_00565CFF: mov eax, [eax]
  loc_00565D01: push eax
  loc_00565D02: mov ecx, [eax]
  loc_00565D04: call [ecx+000000ECh]
  loc_00565D0A: test eax, eax
  loc_00565D0C: fnclex
  loc_00565D0E: jge 00565793h
  loc_00565D14: mov edx, var_120
  loc_00565D1A: push 000000ECh
  loc_00565D1F: push 0041E938h
  loc_00565D24: mov ecx, [edx]
  loc_00565D26: push ecx
  loc_00565D27: push eax
  loc_00565D28: call [00401074h] ; __vbaHresultCheckObj
  loc_00565D2E: jmp 00565793h
  loc_00565D33: mov esi, var_120
  loc_00565D39: mov eax, [esi]
  loc_00565D3B: push eax
  loc_00565D3C: mov edx, [eax]
  loc_00565D3E: call [edx+000000C4h]
  loc_00565D44: test eax, eax
  loc_00565D46: fnclex
  loc_00565D48: jge 00565D5Eh
  loc_00565D4A: mov ecx, [esi]
  loc_00565D4C: push 000000C4h
  loc_00565D51: push 0041E938h
  loc_00565D56: push ecx
  loc_00565D57: push eax
  loc_00565D58: call [00401074h] ; __vbaHresultCheckObj
  loc_00565D5E: push 0041E938h
  loc_00565D63: push 00000000h
  loc_00565D65: call [00401274h] ; __vbaCastObj
  loc_00565D6B: lea edx, var_18
  loc_00565D6E: push eax
  loc_00565D6F: push edx
  loc_00565D70: call edi
  loc_00565D72: push eax
  loc_00565D73: push esi
  loc_00565D74: call [004010B8h] ; __vbaObjSetAddref
  loc_00565D7A: lea ecx, var_18
  loc_00565D7D: call [004012B0h] ; __vbaFreeObj
  loc_00565D83: fwait
  loc_00565D84: push 00565DCDh
  loc_00565D89: jmp 00565DCCh
  loc_00565D8B: lea ecx, var_14
  loc_00565D8E: call [004012ACh] ; __vbaFreeStr
  loc_00565D94: lea eax, var_20
  loc_00565D97: lea ecx, var_1C
  loc_00565D9A: push eax
  loc_00565D9B: lea edx, var_18
  loc_00565D9E: push ecx
  loc_00565D9F: push edx
  loc_00565DA0: push 00000003h
  loc_00565DA2: call [00401040h] ; __vbaFreeObjList
  loc_00565DA8: lea eax, var_80
  loc_00565DAB: lea ecx, var_70
  loc_00565DAE: push eax
  loc_00565DAF: lea edx, var_60
  loc_00565DB2: push ecx
  loc_00565DB3: lea eax, var_50
  loc_00565DB6: push edx
  loc_00565DB7: lea ecx, var_40
  loc_00565DBA: push eax
  loc_00565DBB: lea edx, var_30
  loc_00565DBE: push ecx
  loc_00565DBF: push edx
  loc_00565DC0: push 00000006h
  loc_00565DC2: call [00401038h] ; __vbaFreeVarList
  loc_00565DC8: add esp, 0000002Ch
  loc_00565DCB: ret
  loc_00565DCC: ret
  loc_00565DCD: mov ecx, var_10
  loc_00565DD0: pop edi
  loc_00565DD1: pop esi
  loc_00565DD2: xor eax, eax
  loc_00565DD4: mov fs:[00000000h], ecx
  loc_00565DDB: pop ebx
  loc_00565DDC: mov esp, ebp
  loc_00565DDE: pop ebp
  loc_00565DDF: retn 0004h
End Sub

Private Sub Proc_14_20_567110() '567110
  loc_00567110: push ebp
  loc_00567111: mov ebp, esp
  loc_00567113: sub esp, 00000008h
  loc_00567116: push 00403B36h ; __vbaExceptHandler
  loc_0056711B: mov eax, fs:[00000000h]
  loc_00567121: push eax
  loc_00567122: mov fs:[00000000h], esp
  loc_00567129: sub esp, 00000010h
  loc_0056712C: push ebx
  loc_0056712D: push esi
  loc_0056712E: push edi
  loc_0056712F: mov var_8, esp
  loc_00567132: mov var_4, 00402A50h
  loc_00567139: mov edi, Me
  loc_0056713C: mov var_14, 00000000h
  loc_00567143: push edi
  loc_00567144: mov eax, [edi]
  loc_00567146: call [eax+00000304h]
  loc_0056714C: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00567152: lea ecx, var_14
  loc_00567155: push eax
  loc_00567156: push ecx
  loc_00567157: call ebx
  loc_00567159: mov esi, eax
  loc_0056715B: push 0041E5D4h
  loc_00567160: push esi
  loc_00567161: mov edx, [esi]
  loc_00567163: call [edx+000000A4h]
  loc_00567169: test eax, eax
  loc_0056716B: fnclex
  loc_0056716D: jge 00567181h
  loc_0056716F: push 000000A4h
  loc_00567174: push 0041E5E8h
  loc_00567179: push esi
  loc_0056717A: push eax
  loc_0056717B: call [00401074h] ; __vbaHresultCheckObj
  loc_00567181: lea ecx, var_14
  loc_00567184: call [004012B0h] ; __vbaFreeObj
  loc_0056718A: mov eax, [edi]
  loc_0056718C: push edi
  loc_0056718D: call [eax+00000328h]
  loc_00567193: lea ecx, var_14
  loc_00567196: push eax
  loc_00567197: push ecx
  loc_00567198: call ebx
  loc_0056719A: mov esi, eax
  loc_0056719C: push 0041E5D4h
  loc_005671A1: push esi
  loc_005671A2: mov edx, [esi]
  loc_005671A4: call [edx+000000A4h]
  loc_005671AA: test eax, eax
  loc_005671AC: fnclex
  loc_005671AE: jge 005671C2h
  loc_005671B0: push 000000A4h
  loc_005671B5: push 0041E5E8h
  loc_005671BA: push esi
  loc_005671BB: push eax
  loc_005671BC: call [00401074h] ; __vbaHresultCheckObj
  loc_005671C2: lea ecx, var_14
  loc_005671C5: call [004012B0h] ; __vbaFreeObj
  loc_005671CB: push 005671DDh
  loc_005671D0: jmp 005671DCh
  loc_005671D2: lea ecx, var_14
  loc_005671D5: call [004012B0h] ; __vbaFreeObj
  loc_005671DB: ret
  loc_005671DC: ret
  loc_005671DD: mov ecx, var_10
  loc_005671E0: pop edi
  loc_005671E1: pop esi
  loc_005671E2: xor eax, eax
  loc_005671E4: mov fs:[00000000h], ecx
  loc_005671EB: pop ebx
  loc_005671EC: mov esp, ebp
  loc_005671EE: pop ebp
  loc_005671EF: retn 0004h
End Sub

Private Sub Proc_14_21_567AC0() '567AC0
  loc_00567AC0: push ebp
  loc_00567AC1: mov ebp, esp
  loc_00567AC3: sub esp, 00000008h
  loc_00567AC6: push 00403B36h ; __vbaExceptHandler
  loc_00567ACB: mov eax, fs:[00000000h]
  loc_00567AD1: push eax
  loc_00567AD2: mov fs:[00000000h], esp
  loc_00567AD9: sub esp, 00000180h
  loc_00567ADF: push ebx
  loc_00567AE0: push esi
  loc_00567AE1: push edi
  loc_00567AE2: mov var_8, esp
  loc_00567AE5: mov var_4, 00402AA8h
  loc_00567AEC: mov edi, Me
  loc_00567AEF: xor esi, esi
  loc_00567AF1: push edi
  loc_00567AF2: mov var_18, esi
  loc_00567AF5: mov eax, [edi]
  loc_00567AF7: mov var_1C, esi
  loc_00567AFA: mov var_20, esi
  loc_00567AFD: mov var_24, esi
  loc_00567B00: mov var_28, esi
  loc_00567B03: mov var_2C, esi
  loc_00567B06: mov var_3C, esi
  loc_00567B09: mov var_4C, esi
  loc_00567B0C: mov var_5C, esi
  loc_00567B0F: mov var_6C, esi
  loc_00567B12: mov var_7C, esi
  loc_00567B15: mov var_8C, esi
  loc_00567B1B: mov var_9C, esi
  loc_00567B21: mov var_AC, esi
  loc_00567B27: mov var_BC, esi
  loc_00567B2D: mov var_CC, esi
  loc_00567B33: mov var_DC, esi
  loc_00567B39: mov var_EC, esi
  loc_00567B3F: mov var_10C, esi
  loc_00567B45: mov var_11C, esi
  loc_00567B4B: mov var_13C, esi
  loc_00567B51: mov var_15C, esi
  loc_00567B57: mov var_16C, esi
  loc_00567B5D: mov var_170, esi
  loc_00567B63: call [eax+00000304h]
  loc_00567B69: lea ecx, var_24
  loc_00567B6C: push eax
  loc_00567B6D: push ecx
  loc_00567B6E: call [004010A0h] ; __vbaObjSet
  loc_00567B74: mov ebx, eax
  loc_00567B76: lea eax, var_18
  loc_00567B79: push eax
  loc_00567B7A: push ebx
  loc_00567B7B: mov edx, [ebx]
  loc_00567B7D: call [edx+000000A0h]
  loc_00567B83: cmp eax, esi
  loc_00567B85: fnclex
  loc_00567B87: jge 00567B9Bh
  loc_00567B89: push 000000A0h
  loc_00567B8E: push 0041E5E8h
  loc_00567B93: push ebx
  loc_00567B94: push eax
  loc_00567B95: call [00401074h] ; __vbaHresultCheckObj
  loc_00567B9B: mov eax, var_18
  loc_00567B9E: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00567BA4: lea ecx, var_3C
  loc_00567BA7: lea edx, var_4C
  loc_00567BAA: push ecx
  loc_00567BAB: push edx
  loc_00567BAC: mov var_18, esi
  loc_00567BAF: mov var_34, eax
  loc_00567BB2: mov var_3C, 00000008h
  loc_00567BB9: call ebx
  loc_00567BBB: sub esp, 00000010h
  loc_00567BBE: mov ecx, 00000003h
  loc_00567BC3: mov edx, esp
  loc_00567BC5: mov var_DC, ecx
  loc_00567BCB: mov var_FC, ecx
  loc_00567BD1: mov eax, 00000001h
  loc_00567BD6: mov [edx], ecx
  loc_00567BD8: mov ecx, var_D8
  loc_00567BDE: mov var_D4, eax
  loc_00567BE4: sub esp, 00000010h
  loc_00567BE7: mov [edx+00000004h], ecx
  loc_00567BEA: mov ecx, esp
  loc_00567BEC: push 00000002h
  loc_00567BEE: push 00000041h
  loc_00567BF0: mov [edx+00000008h], eax
  loc_00567BF3: mov eax, var_D0
  loc_00567BF9: push edi
  loc_00567BFA: mov var_C4, 0041E5D4h
  loc_00567C04: mov [edx+0000000Ch], eax
  loc_00567C07: mov edx, var_FC
  loc_00567C0D: mov eax, var_F8
  loc_00567C13: mov [ecx], edx
  loc_00567C15: mov edx, var_F0
  loc_00567C1B: mov var_CC, 00008008h
  loc_00567C25: mov [ecx+00000004h], eax
  loc_00567C28: xor eax, eax
  loc_00567C2A: mov [ecx+00000008h], eax
  loc_00567C2D: mov eax, [edi]
  loc_00567C2F: mov [ecx+0000000Ch], edx
  loc_00567C32: call [eax+00000340h]
  loc_00567C38: lea ecx, var_28
  loc_00567C3B: push eax
  loc_00567C3C: push ecx
  loc_00567C3D: call [004010A0h] ; __vbaObjSet
  loc_00567C43: lea edx, var_6C
  loc_00567C46: push eax
  loc_00567C47: push edx
  loc_00567C48: call [00401140h] ; __vbaLateIdCallLd
  loc_00567C4E: add esp, 00000030h
  loc_00567C51: push eax
  loc_00567C52: call [00401028h] ; __vbaStrVarMove
  loc_00567C58: mov edx, eax
  loc_00567C5A: lea ecx, var_1C
  loc_00567C5D: call [00401270h] ; __vbaStrMove
  loc_00567C63: push eax
  loc_00567C64: push 0041E5D4h
  loc_00567C69: call [0040110Ch] ; __vbaStrCmp
  loc_00567C6F: neg eax
  loc_00567C71: sbb eax, eax
  loc_00567C73: lea ecx, var_7C
  loc_00567C76: neg eax
  loc_00567C78: neg eax
  loc_00567C7A: mov var_114, ax
  loc_00567C81: lea eax, var_11C
  loc_00567C87: push eax
  loc_00567C88: push ecx
  loc_00567C89: mov var_11C, 0000000Bh
  loc_00567C93: call ebx
  loc_00567C95: sub esp, 00000010h
  loc_00567C98: mov ecx, 00000003h
  loc_00567C9D: mov edx, esp
  loc_00567C9F: mov var_14C, ecx
  loc_00567CA5: mov eax, 00000001h
  loc_00567CAA: sub esp, 00000010h
  loc_00567CAD: mov [edx], ecx
  loc_00567CAF: mov ecx, var_128
  loc_00567CB5: mov var_144, eax
  loc_00567CBB: mov [edx+00000004h], ecx
  loc_00567CBE: mov [edx+00000008h], eax
  loc_00567CC1: mov eax, var_120
  loc_00567CC7: mov [edx+0000000Ch], eax
  loc_00567CCA: mov edx, var_14C
  loc_00567CD0: mov eax, var_148
  loc_00567CD6: mov ecx, esp
  loc_00567CD8: push 00000002h
  loc_00567CDA: push 00000041h
  loc_00567CDC: push edi
  loc_00567CDD: mov [ecx], edx
  loc_00567CDF: mov edx, var_144
  loc_00567CE5: mov [ecx+00000004h], eax
  loc_00567CE8: mov eax, var_140
  loc_00567CEE: mov [ecx+00000008h], edx
  loc_00567CF1: mov [ecx+0000000Ch], eax
  loc_00567CF4: mov ecx, [edi]
  loc_00567CF6: call [ecx+00000340h]
  loc_00567CFC: lea edx, var_2C
  loc_00567CFF: push eax
  loc_00567D00: push edx
  loc_00567D01: call [004010A0h] ; __vbaObjSet
  loc_00567D07: push eax
  loc_00567D08: lea eax, var_9C
  loc_00567D0E: push eax
  loc_00567D0F: call [00401140h] ; __vbaLateIdCallLd
  loc_00567D15: add esp, 00000030h
  loc_00567D18: push eax
  loc_00567D19: call [00401028h] ; __vbaStrVarMove
  loc_00567D1F: mov edx, eax
  loc_00567D21: lea ecx, var_20
  loc_00567D24: call [00401270h] ; __vbaStrMove
  loc_00567D2A: push eax
  loc_00567D2B: push 0041E5D4h
  loc_00567D30: call [0040110Ch] ; __vbaStrCmp
  loc_00567D36: neg eax
  loc_00567D38: sbb eax, eax
  loc_00567D3A: lea ecx, var_16C
  loc_00567D40: neg eax
  loc_00567D42: lea edx, var_AC
  loc_00567D48: push ecx
  loc_00567D49: neg eax
  loc_00567D4B: push edx
  loc_00567D4C: mov var_164, ax
  loc_00567D53: mov var_16C, 0000000Bh
  loc_00567D5D: call ebx
  loc_00567D5F: lea eax, var_4C
  loc_00567D62: lea ecx, var_CC
  loc_00567D68: push eax
  loc_00567D69: lea edx, var_5C
  loc_00567D6C: push ecx
  loc_00567D6D: push edx
  loc_00567D6E: call [00401050h] ; __vbaVarCmpNe
  loc_00567D74: push eax
  loc_00567D75: lea eax, var_7C
  loc_00567D78: lea ecx, var_8C
  loc_00567D7E: push eax
  loc_00567D7F: push ecx
  loc_00567D80: call [0040115Ch] ; __vbaVarAnd
  loc_00567D86: push eax
  loc_00567D87: lea edx, var_AC
  loc_00567D8D: lea eax, var_BC
  loc_00567D93: push edx
  loc_00567D94: push eax
  loc_00567D95: call [0040115Ch] ; __vbaVarAnd
  loc_00567D9B: push eax
  loc_00567D9C: call [004010E0h] ; __vbaBoolVarNull
  loc_00567DA2: lea ecx, var_20
  loc_00567DA5: lea edx, var_1C
  loc_00567DA8: push ecx
  loc_00567DA9: push edx
  loc_00567DAA: push 00000002h
  loc_00567DAC: mov var_17C, eax
  loc_00567DB2: call [004011FCh] ; __vbaFreeStrList
  loc_00567DB8: lea eax, var_2C
  loc_00567DBB: lea ecx, var_28
  loc_00567DBE: push eax
  loc_00567DBF: lea edx, var_24
  loc_00567DC2: push ecx
  loc_00567DC3: push edx
  loc_00567DC4: push 00000003h
  loc_00567DC6: call [00401040h] ; __vbaFreeObjList
  loc_00567DCC: lea eax, var_AC
  loc_00567DD2: lea ecx, var_16C
  loc_00567DD8: push eax
  loc_00567DD9: lea edx, var_9C
  loc_00567DDF: push ecx
  loc_00567DE0: lea eax, var_7C
  loc_00567DE3: push edx
  loc_00567DE4: lea ecx, var_11C
  loc_00567DEA: push eax
  loc_00567DEB: lea edx, var_6C
  loc_00567DEE: push ecx
  loc_00567DEF: lea eax, var_4C
  loc_00567DF2: push edx
  loc_00567DF3: lea ecx, var_3C
  loc_00567DF6: push eax
  loc_00567DF7: push ecx
  loc_00567DF8: push 00000008h
  loc_00567DFA: call [00401038h] ; __vbaFreeVarList
  loc_00567E00: add esp, 00000040h
  loc_00567E03: cmp var_17C, si
  loc_00567E0A: jz 00568800h
  loc_00567E10: mov edx, [edi+00000038h]
  loc_00567E13: push edx
  loc_00567E14: call [004011D8h] ; __vbaR8Str
  loc_00567E1A: fsub st0, real8 ptr [004015F8h]
  loc_00567E20: fnstsw ax
  loc_00567E22: test al, 0Dh
  loc_00567E24: jnz 005688F4h
  loc_00567E2A: call [00401244h] ; __vbaFpI2
  loc_00567E30: mov var_184, eax
  loc_00567E36: mov esi, 00000001h
  loc_00567E3B: cmp si, var_184
  loc_00567E42: mov var_14, esi
  loc_00567E45: jg 00568737h
  loc_00567E4B: lea eax, var_CC
  loc_00567E51: lea ecx, var_3C
  loc_00567E54: push eax
  loc_00567E55: push ecx
  loc_00567E56: mov var_C4, 0061A05Ch
  loc_00567E60: mov var_CC, 00004008h
  loc_00567E6A: call ebx
  loc_00567E6C: movsx edx, si
  loc_00567E6F: sub esp, 00000010h
  loc_00567E72: mov eax, 00000003h
  loc_00567E77: mov esi, esp
  loc_00567E79: mov var_190, edx
  loc_00567E7F: mov edx, eax
  loc_00567E81: sub esp, 00000010h
  loc_00567E84: mov [esi], eax
  loc_00567E86: mov eax, var_F8
  loc_00567E8C: mov var_11C, edx
  loc_00567E92: mov ecx, 00000002h
  loc_00567E97: mov [esi+00000004h], eax
  loc_00567E9A: mov eax, var_190
  loc_00567EA0: mov var_114, ecx
  loc_00567EA6: mov [esi+00000008h], eax
  loc_00567EA9: mov eax, var_F0
  loc_00567EAF: mov [esi+0000000Ch], eax
  loc_00567EB2: mov eax, esp
  loc_00567EB4: push 00000002h
  loc_00567EB6: push 00000041h
  loc_00567EB8: mov [eax], edx
  loc_00567EBA: mov edx, var_118
  loc_00567EC0: push edi
  loc_00567EC1: mov [eax+00000004h], edx
  loc_00567EC4: mov edx, [edi]
  loc_00567EC6: mov [eax+00000008h], ecx
  loc_00567EC9: mov ecx, var_110
  loc_00567ECF: mov [eax+0000000Ch], ecx
  loc_00567ED2: call [edx+00000340h]
  loc_00567ED8: push eax
  loc_00567ED9: lea eax, var_24
  loc_00567EDC: push eax
  loc_00567EDD: call [004010A0h] ; __vbaObjSet
  loc_00567EE3: lea ecx, var_6C
  loc_00567EE6: push eax
  loc_00567EE7: push ecx
  loc_00567EE8: call [00401140h] ; __vbaLateIdCallLd
  loc_00567EEE: add esp, 00000030h
  loc_00567EF1: push eax
  loc_00567EF2: call [00401028h] ; __vbaStrVarMove
  loc_00567EF8: mov var_74, eax
  loc_00567EFB: lea edx, var_7C
  loc_00567EFE: lea eax, var_8C
  loc_00567F04: mov esi, 00000008h
  loc_00567F09: push edx
  loc_00567F0A: push eax
  loc_00567F0B: mov var_7C, esi
  loc_00567F0E: call ebx
  loc_00567F10: mov edx, [0061A13Ch]
  loc_00567F16: mov var_D4, 00428F44h ; "Select * from LG WHERE OnCount='"
  loc_00567F20: mov var_DC, esi
  loc_00567F26: mov var_E4, 00428F8Ch ; "' and SrNo="
  loc_00567F30: mov var_EC, esi
  loc_00567F36: mov esi, [edx]
  loc_00567F38: lea edx, var_28
  loc_00567F3B: mov ecx, 0000000Ah
  loc_00567F40: push edx
  loc_00567F41: mov var_14C, ecx
  loc_00567F47: sub esp, 00000010h
  loc_00567F4A: mov eax, 80020004h
  loc_00567F4F: mov edx, esp
  loc_00567F51: mov var_144, eax
  loc_00567F57: sub esp, 00000010h
  loc_00567F5A: mov var_134, 00000002h
  loc_00567F64: mov [edx], ecx
  loc_00567F66: mov ecx, var_158
  loc_00567F6C: mov [edx+00000004h], ecx
  loc_00567F6F: mov ecx, esp
  loc_00567F71: mov [edx+00000008h], eax
  loc_00567F74: mov eax, var_150
  loc_00567F7A: mov [edx+0000000Ch], eax
  loc_00567F7D: mov edx, var_14C
  loc_00567F83: mov eax, var_148
  loc_00567F89: mov [ecx], edx
  loc_00567F8B: mov edx, var_144
  loc_00567F91: mov [ecx+00000004h], eax
  loc_00567F94: mov eax, var_140
  loc_00567F9A: sub esp, 00000010h
  loc_00567F9D: mov [ecx+00000008h], edx
  loc_00567FA0: mov edx, var_138
  loc_00567FA6: mov [ecx+0000000Ch], eax
  loc_00567FA9: mov ecx, esp
  loc_00567FAB: mov eax, 00000003h
  loc_00567FB0: mov [ecx], eax
  loc_00567FB2: mov eax, var_134
  loc_00567FB8: mov [ecx+00000004h], edx
  loc_00567FBB: mov edx, var_130
  loc_00567FC1: mov [ecx+00000008h], eax
  loc_00567FC4: lea eax, var_DC
  loc_00567FCA: push eax
  loc_00567FCB: mov [ecx+0000000Ch], edx
  loc_00567FCE: lea ecx, var_3C
  loc_00567FD1: lea edx, var_4C
  loc_00567FD4: push ecx
  loc_00567FD5: push edx
  loc_00567FD6: call [004011B4h] ; __vbaVarCat
  loc_00567FDC: push eax
  loc_00567FDD: lea eax, var_EC
  loc_00567FE3: lea ecx, var_5C
  loc_00567FE6: push eax
  loc_00567FE7: push ecx
  loc_00567FE8: call [004011B4h] ; __vbaVarCat
  loc_00567FEE: push eax
  loc_00567FEF: lea edx, var_8C
  loc_00567FF5: lea eax, var_9C
  loc_00567FFB: push edx
  loc_00567FFC: push eax
  loc_00567FFD: call [004011B4h] ; __vbaVarCat
  loc_00568003: lea ecx, var_18
  loc_00568006: push eax
  loc_00568007: push ecx
  loc_00568008: call [004011B0h] ; __vbaStrVarVal
  loc_0056800E: mov edx, [0061A13Ch]
  loc_00568014: push eax
  loc_00568015: push edx
  loc_00568016: call [esi+000000BCh]
  loc_0056801C: test eax, eax
  loc_0056801E: fnclex
  loc_00568020: jge 0056803Ah
  loc_00568022: mov ecx, [0061A13Ch]
  loc_00568028: push 000000BCh
  loc_0056802D: push 0041E928h
  loc_00568032: push ecx
  loc_00568033: push eax
  loc_00568034: call [00401074h] ; __vbaHresultCheckObj
  loc_0056803A: mov edx, var_28
  loc_0056803D: lea esi, [edi+00000034h]
  loc_00568040: push edx
  loc_00568041: push esi
  loc_00568042: call [004010B8h] ; __vbaObjSetAddref
  loc_00568048: lea ecx, var_18
  loc_0056804B: call [004012ACh] ; __vbaFreeStr
  loc_00568051: lea eax, var_28
  loc_00568054: lea ecx, var_24
  loc_00568057: push eax
  loc_00568058: push ecx
  loc_00568059: push 00000002h
  loc_0056805B: call [00401040h] ; __vbaFreeObjList
  loc_00568061: lea edx, var_9C
  loc_00568067: lea eax, var_8C
  loc_0056806D: push edx
  loc_0056806E: lea ecx, var_5C
  loc_00568071: push eax
  loc_00568072: lea edx, var_7C
  loc_00568075: push ecx
  loc_00568076: lea eax, var_6C
  loc_00568079: push edx
  loc_0056807A: lea ecx, var_4C
  loc_0056807D: push eax
  loc_0056807E: lea edx, var_3C
  loc_00568081: push ecx
  loc_00568082: push edx
  loc_00568083: push 00000007h
  loc_00568085: call [00401038h] ; __vbaFreeVarList
  loc_0056808B: add esp, 0000002Ch
  loc_0056808E: mov eax, [esi]
  loc_00568090: lea edx, var_170
  loc_00568096: push edx
  loc_00568097: push eax
  loc_00568098: mov ecx, [eax]
  loc_0056809A: call [ecx+00000034h]
  loc_0056809D: test eax, eax
  loc_0056809F: fnclex
  loc_005680A1: jge 005680B4h
  loc_005680A3: mov ecx, [esi]
  loc_005680A5: push 00000034h
  loc_005680A7: push 0041E938h
  loc_005680AC: push ecx
  loc_005680AD: push eax
  loc_005680AE: call [00401074h] ; __vbaHresultCheckObj
  loc_005680B4: mov eax, [esi]
  loc_005680B6: cmp var_170, 0000h
  loc_005680BE: push eax
  loc_005680BF: mov edx, [eax]
  loc_005680C1: jnz 00568273h
  loc_005680C7: call [edx+000000D0h]
  loc_005680CD: test eax, eax
  loc_005680CF: fnclex
  loc_005680D1: jge 005680E7h
  loc_005680D3: mov ecx, [esi]
  loc_005680D5: push 000000D0h
  loc_005680DA: push 0041E938h
  loc_005680DF: push ecx
  loc_005680E0: push eax
  loc_005680E1: call [00401074h] ; __vbaHresultCheckObj
  loc_005680E7: sub esp, 00000010h
  loc_005680EA: mov eax, var_190
  loc_005680F0: mov edx, esp
  loc_005680F2: mov ecx, 00000003h
  loc_005680F7: mov var_CC, ecx
  loc_005680FD: mov var_EC, ecx
  loc_00568103: mov [edx], ecx
  loc_00568105: mov ecx, var_C8
  loc_0056810B: mov var_C4, eax
  loc_00568111: sub esp, 00000010h
  loc_00568114: mov [edx+00000004h], ecx
  loc_00568117: mov ecx, esp
  loc_00568119: mov var_E4, 00000000h
  loc_00568123: push 00000002h
  loc_00568125: mov [edx+00000008h], eax
  loc_00568128: mov eax, var_C0
  loc_0056812E: push 00000041h
  loc_00568130: push edi
  loc_00568131: mov [edx+0000000Ch], eax
  loc_00568134: mov edx, var_EC
  loc_0056813A: mov eax, var_E8
  loc_00568140: mov [ecx], edx
  loc_00568142: mov edx, var_E4
  loc_00568148: mov [ecx+00000004h], eax
  loc_0056814B: mov eax, var_E0
  loc_00568151: mov [ecx+00000008h], edx
  loc_00568154: mov [ecx+0000000Ch], eax
  loc_00568157: mov ecx, [edi]
  loc_00568159: call [ecx+00000340h]
  loc_0056815F: lea edx, var_24
  loc_00568162: push eax
  loc_00568163: push edx
  loc_00568164: call [004010A0h] ; __vbaObjSet
  loc_0056816A: push eax
  loc_0056816B: lea eax, var_3C
  loc_0056816E: push eax
  loc_0056816F: call [00401140h] ; __vbaLateIdCallLd
  loc_00568175: add esp, 00000030h
  loc_00568178: push eax
  loc_00568179: call [00401028h] ; __vbaStrVarMove
  loc_0056817F: lea ecx, var_4C
  loc_00568182: lea edx, var_5C
  loc_00568185: push ecx
  loc_00568186: push edx
  loc_00568187: mov var_44, eax
  loc_0056818A: mov var_4C, 00000008h
  loc_00568191: call ebx
  loc_00568193: mov eax, [esi]
  loc_00568195: sub esp, 00000010h
  loc_00568198: mov edx, esp
  loc_0056819A: sub esp, 00000010h
  loc_0056819D: mov ecx, [eax]
  loc_0056819F: mov eax, var_5C
  loc_005681A2: mov [edx], eax
  loc_005681A4: mov eax, var_58
  loc_005681A7: mov [edx+00000004h], eax
  loc_005681AA: mov eax, var_54
  loc_005681AD: mov [edx+00000008h], eax
  loc_005681B0: mov eax, var_50
  loc_005681B3: mov [edx+0000000Ch], eax
  loc_005681B6: mov edx, esp
  loc_005681B8: mov eax, 00000008h
  loc_005681BD: mov [edx], eax
  loc_005681BF: mov eax, var_108
  loc_005681C5: mov [edx+00000004h], eax
  loc_005681C8: mov eax, 0041EB18h ; "AgentName"
  loc_005681CD: mov [edx+00000008h], eax
  loc_005681D0: mov eax, var_100
  loc_005681D6: mov [edx+0000000Ch], eax
  loc_005681D9: mov eax, [esi]
  loc_005681DB: push eax
  loc_005681DC: call [ecx+00000128h]
  loc_005681E2: test eax, eax
  loc_005681E4: fnclex
  loc_005681E6: jge 005681FCh
  loc_005681E8: mov ecx, [esi]
  loc_005681EA: push 00000128h
  loc_005681EF: push 0041E938h
  loc_005681F4: push ecx
  loc_005681F5: push eax
  loc_005681F6: call [00401074h] ; __vbaHresultCheckObj
  loc_005681FC: lea ecx, var_24
  loc_005681FF: call [004012B0h] ; __vbaFreeObj
  loc_00568205: lea edx, var_5C
  loc_00568208: lea eax, var_4C
  loc_0056820B: push edx
  loc_0056820C: lea ecx, var_3C
  loc_0056820F: push eax
  loc_00568210: push ecx
  loc_00568211: push 00000003h
  loc_00568213: call [00401038h] ; __vbaFreeVarList
  loc_00568219: mov eax, [esi]
  loc_0056821B: add esp, 00000010h
  loc_0056821E: mov edx, [eax]
  loc_00568220: push 00000000h
  loc_00568222: push 00000001h
  loc_00568224: push eax
  loc_00568225: call [edx+00000164h]
  loc_0056822B: test eax, eax
  loc_0056822D: fnclex
  loc_0056822F: jge 00568245h
  loc_00568231: mov ecx, [esi]
  loc_00568233: push 00000164h
  loc_00568238: push 0041E938h
  loc_0056823D: push ecx
  loc_0056823E: push eax
  loc_0056823F: call [00401074h] ; __vbaHresultCheckObj
  loc_00568245: mov eax, [esi]
  loc_00568247: push eax
  loc_00568248: mov edx, [eax]
  loc_0056824A: call [edx+000000ECh]
  loc_00568250: test eax, eax
  loc_00568252: fnclex
  loc_00568254: jge 0056808Eh
  loc_0056825A: mov ecx, [esi]
  loc_0056825C: push 000000ECh
  loc_00568261: push 0041E938h
  loc_00568266: push ecx
  loc_00568267: push eax
  loc_00568268: call [00401074h] ; __vbaHresultCheckObj
  loc_0056826E: jmp 0056808Eh
  loc_00568273: call [edx+000000C4h]
  loc_00568279: test eax, eax
  loc_0056827B: fnclex
  loc_0056827D: jge 00568293h
  loc_0056827F: mov ecx, [esi]
  loc_00568281: push 000000C4h
  loc_00568286: push 0041E938h
  loc_0056828B: push ecx
  loc_0056828C: push eax
  loc_0056828D: call [00401074h] ; __vbaHresultCheckObj
  loc_00568293: push 0041E938h
  loc_00568298: push 00000000h
  loc_0056829A: call [00401274h] ; __vbaCastObj
  loc_005682A0: lea edx, var_24
  loc_005682A3: push eax
  loc_005682A4: push edx
  loc_005682A5: call [004010A0h] ; __vbaObjSet
  loc_005682AB: push eax
  loc_005682AC: push esi
  loc_005682AD: call [004010B8h] ; __vbaObjSetAddref
  loc_005682B3: lea ecx, var_24
  loc_005682B6: call [004012B0h] ; __vbaFreeObj
  loc_005682BC: lea eax, var_CC
  loc_005682C2: lea ecx, var_3C
  loc_005682C5: push eax
  loc_005682C6: push ecx
  loc_005682C7: mov var_C4, 0061A05Ch
  loc_005682D1: mov var_CC, 00004008h
  loc_005682DB: call ebx
  loc_005682DD: sub esp, 00000010h
  loc_005682E0: mov eax, 00000003h
  loc_005682E5: mov edx, esp
  loc_005682E7: mov var_11C, eax
  loc_005682ED: sub esp, 00000010h
  loc_005682F0: mov ecx, 00000002h
  loc_005682F5: mov [edx], eax
  loc_005682F7: mov eax, var_F8
  loc_005682FD: mov var_114, ecx
  loc_00568303: mov [edx+00000004h], eax
  loc_00568306: mov eax, var_190
  loc_0056830C: mov [edx+00000008h], eax
  loc_0056830F: mov eax, var_F0
  loc_00568315: mov [edx+0000000Ch], eax
  loc_00568318: mov eax, var_11C
  loc_0056831E: mov edx, esp
  loc_00568320: push 00000002h
  loc_00568322: push 00000041h
  loc_00568324: push edi
  loc_00568325: mov [edx], eax
  loc_00568327: mov eax, var_118
  loc_0056832D: mov [edx+00000004h], eax
  loc_00568330: mov [edx+00000008h], ecx
  loc_00568333: mov ecx, var_110
  loc_00568339: mov [edx+0000000Ch], ecx
  loc_0056833C: mov edx, [edi]
  loc_0056833E: call [edx+00000340h]
  loc_00568344: push eax
  loc_00568345: lea eax, var_24
  loc_00568348: push eax
  loc_00568349: call [004010A0h] ; __vbaObjSet
  loc_0056834F: lea ecx, var_6C
  loc_00568352: push eax
  loc_00568353: push ecx
  loc_00568354: call [00401140h] ; __vbaLateIdCallLd
  loc_0056835A: add esp, 00000030h
  loc_0056835D: push eax
  loc_0056835E: call [00401028h] ; __vbaStrVarMove
  loc_00568364: mov var_74, eax
  loc_00568367: lea edx, var_7C
  loc_0056836A: lea eax, var_8C
  loc_00568370: push edx
  loc_00568371: push eax
  loc_00568372: mov var_7C, 00000008h
  loc_00568379: call ebx
  loc_0056837B: mov edx, 00000008h
  loc_00568380: mov var_D4, 00428FA8h ; "Select * from LGDetail WHERE OnCount='"
  loc_0056838A: mov var_DC, edx
  loc_00568390: mov var_EC, edx
  loc_00568396: mov edx, [0061A13Ch]
  loc_0056839C: mov var_E4, 00428F8Ch ; "' and SrNo="
  loc_005683A6: mov ecx, 0000000Ah
  loc_005683AB: mov eax, 80020004h
  loc_005683B0: mov ebx, [edx]
  loc_005683B2: lea edx, var_28
  loc_005683B5: push edx
  loc_005683B6: mov var_14C, ecx
  loc_005683BC: sub esp, 00000010h
  loc_005683BF: mov var_144, eax
  loc_005683C5: mov edx, esp
  loc_005683C7: mov [edx], ecx
  loc_005683C9: mov ecx, var_158
  loc_005683CF: mov [edx+00000004h], ecx
  loc_005683D2: sub esp, 00000010h
  loc_005683D5: mov ecx, esp
  loc_005683D7: sub esp, 00000010h
  loc_005683DA: mov [edx+00000008h], eax
  loc_005683DD: mov eax, var_150
  loc_005683E3: mov [edx+0000000Ch], eax
  loc_005683E6: mov edx, var_14C
  loc_005683EC: mov eax, var_148
  loc_005683F2: mov [ecx], edx
  loc_005683F4: mov edx, var_144
  loc_005683FA: mov [ecx+00000004h], eax
  loc_005683FD: mov eax, var_140
  loc_00568403: mov [ecx+00000008h], edx
  loc_00568406: mov edx, var_138
  loc_0056840C: mov [ecx+0000000Ch], eax
  loc_0056840F: mov ecx, esp
  loc_00568411: mov eax, 00000003h
  loc_00568416: mov [ecx], eax
  loc_00568418: mov eax, 00000002h
  loc_0056841D: mov [ecx+00000004h], edx
  loc_00568420: lea edx, var_3C
  loc_00568423: mov [ecx+00000008h], eax
  loc_00568426: mov eax, var_130
  loc_0056842C: mov [ecx+0000000Ch], eax
  loc_0056842F: lea ecx, var_DC
  loc_00568435: push ecx
  loc_00568436: lea eax, var_4C
  loc_00568439: push edx
  loc_0056843A: push eax
  loc_0056843B: call [004011B4h] ; __vbaVarCat
  loc_00568441: lea ecx, var_EC
  loc_00568447: push eax
  loc_00568448: lea edx, var_5C
  loc_0056844B: push ecx
  loc_0056844C: push edx
  loc_0056844D: call [004011B4h] ; __vbaVarCat
  loc_00568453: push eax
  loc_00568454: lea eax, var_8C
  loc_0056845A: lea ecx, var_9C
  loc_00568460: push eax
  loc_00568461: push ecx
  loc_00568462: call [004011B4h] ; __vbaVarCat
  loc_00568468: lea edx, var_18
  loc_0056846B: push eax
  loc_0056846C: push edx
  loc_0056846D: call [004011B0h] ; __vbaStrVarVal
  loc_00568473: push eax
  loc_00568474: mov eax, [0061A13Ch]
  loc_00568479: push eax
  loc_0056847A: call [ebx+000000BCh]
  loc_00568480: test eax, eax
  loc_00568482: fnclex
  loc_00568484: jge 0056849Eh
  loc_00568486: mov ecx, [0061A13Ch]
  loc_0056848C: push 000000BCh
  loc_00568491: push 0041E928h
  loc_00568496: push ecx
  loc_00568497: push eax
  loc_00568498: call [00401074h] ; __vbaHresultCheckObj
  loc_0056849E: mov edx, var_28
  loc_005684A1: push edx
  loc_005684A2: push esi
  loc_005684A3: call [004010B8h] ; __vbaObjSetAddref
  loc_005684A9: lea ecx, var_18
  loc_005684AC: call [004012ACh] ; __vbaFreeStr
  loc_005684B2: lea eax, var_28
  loc_005684B5: lea ecx, var_24
  loc_005684B8: push eax
  loc_005684B9: push ecx
  loc_005684BA: push 00000002h
  loc_005684BC: call [00401040h] ; __vbaFreeObjList
  loc_005684C2: lea edx, var_9C
  loc_005684C8: lea eax, var_8C
  loc_005684CE: push edx
  loc_005684CF: lea ecx, var_5C
  loc_005684D2: push eax
  loc_005684D3: lea edx, var_7C
  loc_005684D6: push ecx
  loc_005684D7: lea eax, var_6C
  loc_005684DA: push edx
  loc_005684DB: lea ecx, var_4C
  loc_005684DE: push eax
  loc_005684DF: lea edx, var_3C
  loc_005684E2: push ecx
  loc_005684E3: push edx
  loc_005684E4: push 00000007h
  loc_005684E6: call [00401038h] ; __vbaFreeVarList
  loc_005684EC: mov ebx, [004010D4h] ; rtcTrimVar
  loc_005684F2: add esp, 0000002Ch
  loc_005684F5: mov eax, [esi]
  loc_005684F7: lea edx, var_170
  loc_005684FD: push edx
  loc_005684FE: push eax
  loc_005684FF: mov ecx, [eax]
  loc_00568501: call [ecx+00000034h]
  loc_00568504: test eax, eax
  loc_00568506: fnclex
  loc_00568508: jge 0056851Bh
  loc_0056850A: mov ecx, [esi]
  loc_0056850C: push 00000034h
  loc_0056850E: push 0041E938h
  loc_00568513: push ecx
  loc_00568514: push eax
  loc_00568515: call [00401074h] ; __vbaHresultCheckObj
  loc_0056851B: mov eax, [esi]
  loc_0056851D: cmp var_170, 0000h
  loc_00568525: push eax
  loc_00568526: mov edx, [eax]
  loc_00568528: jnz 005686D8h
  loc_0056852E: call [edx+000000D0h]
  loc_00568534: test eax, eax
  loc_00568536: fnclex
  loc_00568538: jge 0056854Eh
  loc_0056853A: mov ecx, [esi]
  loc_0056853C: push 000000D0h
  loc_00568541: push 0041E938h
  loc_00568546: push ecx
  loc_00568547: push eax
  loc_00568548: call [00401074h] ; __vbaHresultCheckObj
  loc_0056854E: movsx eax, var_14
  loc_00568552: sub esp, 00000010h
  loc_00568555: mov ecx, 00000003h
  loc_0056855A: mov edx, esp
  loc_0056855C: mov var_CC, ecx
  loc_00568562: mov var_EC, ecx
  loc_00568568: mov var_C4, eax
  loc_0056856E: mov [edx], ecx
  loc_00568570: mov ecx, var_C8
  loc_00568576: sub esp, 00000010h
  loc_00568579: mov var_E4, 00000000h
  loc_00568583: mov [edx+00000004h], ecx
  loc_00568586: mov ecx, esp
  loc_00568588: push 00000002h
  loc_0056858A: push 00000041h
  loc_0056858C: mov [edx+00000008h], eax
  loc_0056858F: mov eax, var_C0
  loc_00568595: push edi
  loc_00568596: mov [edx+0000000Ch], eax
  loc_00568599: mov edx, var_EC
  loc_0056859F: mov eax, var_E8
  loc_005685A5: mov [ecx], edx
  loc_005685A7: mov edx, var_E4
  loc_005685AD: mov [ecx+00000004h], eax
  loc_005685B0: mov eax, var_E0
  loc_005685B6: mov [ecx+00000008h], edx
  loc_005685B9: mov [ecx+0000000Ch], eax
  loc_005685BC: mov ecx, [edi]
  loc_005685BE: call [ecx+00000340h]
  loc_005685C4: lea edx, var_24
  loc_005685C7: push eax
  loc_005685C8: push edx
  loc_005685C9: call [004010A0h] ; __vbaObjSet
  loc_005685CF: push eax
  loc_005685D0: lea eax, var_3C
  loc_005685D3: push eax
  loc_005685D4: call [00401140h] ; __vbaLateIdCallLd
  loc_005685DA: add esp, 00000030h
  loc_005685DD: push eax
  loc_005685DE: call [00401028h] ; __vbaStrVarMove
  loc_005685E4: lea ecx, var_4C
  loc_005685E7: lea edx, var_5C
  loc_005685EA: push ecx
  loc_005685EB: push edx
  loc_005685EC: mov var_44, eax
  loc_005685EF: mov var_4C, 00000008h
  loc_005685F6: call ebx
  loc_005685F8: mov eax, [esi]
  loc_005685FA: sub esp, 00000010h
  loc_005685FD: mov edx, esp
  loc_005685FF: sub esp, 00000010h
  loc_00568602: mov ecx, [eax]
  loc_00568604: mov eax, var_5C
  loc_00568607: mov [edx], eax
  loc_00568609: mov eax, var_58
  loc_0056860C: mov [edx+00000004h], eax
  loc_0056860F: mov eax, var_54
  loc_00568612: mov [edx+00000008h], eax
  loc_00568615: mov eax, var_50
  loc_00568618: mov [edx+0000000Ch], eax
  loc_0056861B: mov edx, esp
  loc_0056861D: mov eax, 00000008h
  loc_00568622: mov [edx], eax
  loc_00568624: mov eax, var_108
  loc_0056862A: mov [edx+00000004h], eax
  loc_0056862D: mov eax, 0041EB18h ; "AgentName"
  loc_00568632: mov [edx+00000008h], eax
  loc_00568635: mov eax, var_100
  loc_0056863B: mov [edx+0000000Ch], eax
  loc_0056863E: mov eax, [esi]
  loc_00568640: push eax
  loc_00568641: call [ecx+00000128h]
  loc_00568647: test eax, eax
  loc_00568649: fnclex
  loc_0056864B: jge 00568661h
  loc_0056864D: mov ecx, [esi]
  loc_0056864F: push 00000128h
  loc_00568654: push 0041E938h
  loc_00568659: push ecx
  loc_0056865A: push eax
  loc_0056865B: call [00401074h] ; __vbaHresultCheckObj
  loc_00568661: lea ecx, var_24
  loc_00568664: call [004012B0h] ; __vbaFreeObj
  loc_0056866A: lea edx, var_5C
  loc_0056866D: lea eax, var_4C
  loc_00568670: push edx
  loc_00568671: lea ecx, var_3C
  loc_00568674: push eax
  loc_00568675: push ecx
  loc_00568676: push 00000003h
  loc_00568678: call [00401038h] ; __vbaFreeVarList
  loc_0056867E: mov eax, [esi]
  loc_00568680: add esp, 00000010h
  loc_00568683: mov edx, [eax]
  loc_00568685: push 00000000h
  loc_00568687: push 00000001h
  loc_00568689: push eax
  loc_0056868A: call [edx+00000164h]
  loc_00568690: test eax, eax
  loc_00568692: fnclex
  loc_00568694: jge 005686AAh
  loc_00568696: mov ecx, [esi]
  loc_00568698: push 00000164h
  loc_0056869D: push 0041E938h
  loc_005686A2: push ecx
  loc_005686A3: push eax
  loc_005686A4: call [00401074h] ; __vbaHresultCheckObj
  loc_005686AA: mov eax, [esi]
  loc_005686AC: push eax
  loc_005686AD: mov edx, [eax]
  loc_005686AF: call [edx+000000ECh]
  loc_005686B5: test eax, eax
  loc_005686B7: fnclex
  loc_005686B9: jge 005684F5h
  loc_005686BF: mov ecx, [esi]
  loc_005686C1: push 000000ECh
  loc_005686C6: push 0041E938h
  loc_005686CB: push ecx
  loc_005686CC: push eax
  loc_005686CD: call [00401074h] ; __vbaHresultCheckObj
  loc_005686D3: jmp 005684F5h
  loc_005686D8: call [edx+000000C4h]
  loc_005686DE: test eax, eax
  loc_005686E0: fnclex
  loc_005686E2: jge 005686F8h
  loc_005686E4: mov ecx, [esi]
  loc_005686E6: push 000000C4h
  loc_005686EB: push 0041E938h
  loc_005686F0: push ecx
  loc_005686F1: push eax
  loc_005686F2: call [00401074h] ; __vbaHresultCheckObj
  loc_005686F8: push 0041E938h
  loc_005686FD: push 00000000h
  loc_005686FF: call [00401274h] ; __vbaCastObj
  loc_00568705: lea edx, var_24
  loc_00568708: push eax
  loc_00568709: push edx
  loc_0056870A: call [004010A0h] ; __vbaObjSet
  loc_00568710: push eax
  loc_00568711: push esi
  loc_00568712: call [004010B8h] ; __vbaObjSetAddref
  loc_00568718: lea ecx, var_24
  loc_0056871B: call [004012B0h] ; __vbaFreeObj
  loc_00568721: mov eax, 00000001h
  loc_00568726: add ax, var_14
  loc_0056872A: jo 005688F9h
  loc_00568730: mov esi, eax
  loc_00568732: jmp 00567E3Bh
  loc_00568737: mov ecx, 0000000Ah
  loc_0056873C: mov eax, 80020004h
  loc_00568741: mov var_6C, ecx
  loc_00568744: mov var_5C, ecx
  loc_00568747: mov var_4C, ecx
  loc_0056874A: lea edx, var_CC
  loc_00568750: lea ecx, var_3C
  loc_00568753: mov var_64, eax
  loc_00568756: mov var_54, eax
  loc_00568759: mov var_44, eax
  loc_0056875C: mov var_C4, 0041F378h ; "Save Successfully."
  loc_00568766: mov var_CC, 00000008h
  loc_00568770: call [00401240h] ; __vbaVarDup
  loc_00568776: lea eax, var_6C
  loc_00568779: lea ecx, var_5C
  loc_0056877C: push eax
  loc_0056877D: lea edx, var_4C
  loc_00568780: push ecx
  loc_00568781: push edx
  loc_00568782: lea eax, var_3C
  loc_00568785: push 00000040h
  loc_00568787: push eax
  loc_00568788: call [004010A4h] ; rtcMsgBox
  loc_0056878E: lea ecx, var_6C
  loc_00568791: lea edx, var_5C
  loc_00568794: push ecx
  loc_00568795: lea eax, var_4C
  loc_00568798: push edx
  loc_00568799: lea ecx, var_3C
  loc_0056879C: push eax
  loc_0056879D: push ecx
  loc_0056879E: push 00000004h
  loc_005687A0: call [00401038h] ; __vbaFreeVarList
  loc_005687A6: mov edx, [edi]
  loc_005687A8: add esp, 00000014h
  loc_005687AB: lea eax, var_3C
  loc_005687AE: lea ecx, var_170
  loc_005687B4: push eax
  loc_005687B5: push ecx
  loc_005687B6: push edi
  loc_005687B7: mov var_170, FFFFFFFFh
  loc_005687C1: call [edx+000006FCh]
  loc_005687C7: mov esi, [00401020h] ; __vbaFreeVar
  loc_005687CD: lea ecx, var_3C
  loc_005687D0: call __vbaFreeVar
  loc_005687D2: mov edx, [edi]
  loc_005687D4: lea eax, var_3C
  loc_005687D7: lea ecx, var_170
  loc_005687DD: push eax
  loc_005687DE: push ecx
  loc_005687DF: push edi
  loc_005687E0: mov var_170, 00000000h
  loc_005687EA: call [edx+000006F8h]
  loc_005687F0: lea ecx, var_3C
  loc_005687F3: call __vbaFreeVar
  loc_005687F5: fwait
  loc_005687F6: push 005688DFh
  loc_005687FB: jmp 005688DEh
  loc_00568800: mov ecx, 80020004h
  loc_00568805: mov eax, 0000000Ah
  loc_0056880A: mov var_64, ecx
  loc_0056880D: mov var_54, ecx
  loc_00568810: mov var_44, ecx
  loc_00568813: lea edx, var_CC
  loc_00568819: lea ecx, var_3C
  loc_0056881C: mov var_6C, eax
  loc_0056881F: mov var_5C, eax
  loc_00568822: mov var_4C, eax
  loc_00568825: mov var_C4, 0041EA5Ch ; "Cann't Save Successfully."
  loc_0056882F: mov var_CC, 00000008h
  loc_00568839: call [00401240h] ; __vbaVarDup
  loc_0056883F: lea edx, var_6C
  loc_00568842: lea eax, var_5C
  loc_00568845: push edx
  loc_00568846: lea ecx, var_4C
  loc_00568849: push eax
  loc_0056884A: push ecx
  loc_0056884B: lea edx, var_3C
  loc_0056884E: push 00000010h
  loc_00568850: push edx
  loc_00568851: call [004010A4h] ; rtcMsgBox
  loc_00568857: lea eax, var_6C
  loc_0056885A: lea ecx, var_5C
  loc_0056885D: push eax
  loc_0056885E: lea edx, var_4C
  loc_00568861: push ecx
  loc_00568862: lea eax, var_3C
  loc_00568865: push edx
  loc_00568866: push eax
  loc_00568867: push 00000004h
  loc_00568869: call [00401038h] ; __vbaFreeVarList
  loc_0056886F: add esp, 00000014h
  loc_00568872: fwait
  loc_00568873: push 005688DFh
  loc_00568878: jmp 005688DEh
  loc_0056887A: lea ecx, var_20
  loc_0056887D: lea edx, var_1C
  loc_00568880: push ecx
  loc_00568881: lea eax, var_18
  loc_00568884: push edx
  loc_00568885: push eax
  loc_00568886: push 00000003h
  loc_00568888: call [004011FCh] ; __vbaFreeStrList
  loc_0056888E: lea ecx, var_2C
  loc_00568891: lea edx, var_28
  loc_00568894: push ecx
  loc_00568895: lea eax, var_24
  loc_00568898: push edx
  loc_00568899: push eax
  loc_0056889A: push 00000003h
  loc_0056889C: call [00401040h] ; __vbaFreeObjList
  loc_005688A2: lea ecx, var_BC
  loc_005688A8: lea edx, var_AC
  loc_005688AE: push ecx
  loc_005688AF: lea eax, var_9C
  loc_005688B5: push edx
  loc_005688B6: lea ecx, var_8C
  loc_005688BC: push eax
  loc_005688BD: lea edx, var_7C
  loc_005688C0: push ecx
  loc_005688C1: lea eax, var_6C
  loc_005688C4: push edx
  loc_005688C5: lea ecx, var_5C
  loc_005688C8: push eax
  loc_005688C9: lea edx, var_4C
  loc_005688CC: push ecx
  loc_005688CD: lea eax, var_3C
  loc_005688D0: push edx
  loc_005688D1: push eax
  loc_005688D2: push 00000009h
  loc_005688D4: call [00401038h] ; __vbaFreeVarList
  loc_005688DA: add esp, 00000048h
  loc_005688DD: ret
  loc_005688DE: ret
  loc_005688DF: mov ecx, var_10
  loc_005688E2: pop edi
  loc_005688E3: pop esi
  loc_005688E4: xor eax, eax
  loc_005688E6: mov fs:[00000000h], ecx
  loc_005688ED: pop ebx
  loc_005688EE: mov esp, ebp
  loc_005688F0: pop ebp
  loc_005688F1: retn 0004h
End Sub

Private Sub Proc_14_22_568900() '568900
  loc_00568900: push ebp
  loc_00568901: mov ebp, esp
  loc_00568903: sub esp, 00000008h
  loc_00568906: push 00403B36h ; __vbaExceptHandler
  loc_0056890B: mov eax, fs:[00000000h]
  loc_00568911: push eax
  loc_00568912: mov fs:[00000000h], esp
  loc_00568919: sub esp, 00000134h
  loc_0056891F: push ebx
  loc_00568920: push esi
  loc_00568921: push edi
  loc_00568922: mov var_8, esp
  loc_00568925: mov var_4, 00402AB8h
  loc_0056892C: xor edi, edi
  loc_0056892E: mov ebx, 80020004h
  loc_00568933: mov esi, 0000000Ah
  loc_00568938: lea edx, var_A0
  loc_0056893E: lea ecx, var_30
  loc_00568941: mov var_18, edi
  loc_00568944: mov var_1C, edi
  loc_00568947: mov var_20, edi
  loc_0056894A: mov var_30, edi
  loc_0056894D: mov var_70, edi
  loc_00568950: mov var_80, edi
  loc_00568953: mov var_90, edi
  loc_00568959: mov var_B0, edi
  loc_0056895F: mov var_C0, edi
  loc_00568965: mov var_D0, edi
  loc_0056896B: mov var_F0, edi
  loc_00568971: mov var_110, edi
  loc_00568977: mov var_120, edi
  loc_0056897D: mov var_130, edi
  loc_00568983: mov var_134, edi
  loc_00568989: mov var_58, ebx
  loc_0056898C: mov var_60, esi
  loc_0056898F: mov var_48, ebx
  loc_00568992: mov var_50, esi
  loc_00568995: mov var_38, ebx
  loc_00568998: mov var_40, esi
  loc_0056899B: mov var_98, 00428FFCh ; "Are your sure to delete"
  loc_005689A5: mov var_A0, 00000008h
  loc_005689AF: call [00401240h] ; __vbaVarDup
  loc_005689B5: lea eax, var_60
  loc_005689B8: lea ecx, var_50
  loc_005689BB: push eax
  loc_005689BC: lea edx, var_40
  loc_005689BF: push ecx
  loc_005689C0: push edx
  loc_005689C1: lea eax, var_30
  loc_005689C4: push 00000114h
  loc_005689C9: push eax
  loc_005689CA: call [004010A4h] ; rtcMsgBox
  loc_005689D0: xor ecx, ecx
  loc_005689D2: cmp eax, 00000006h
  loc_005689D5: setz cl
  loc_005689D8: neg ecx
  loc_005689DA: lea edx, var_60
  loc_005689DD: mov var_138, cx
  loc_005689E4: lea eax, var_50
  loc_005689E7: push edx
  loc_005689E8: lea ecx, var_40
  loc_005689EB: push eax
  loc_005689EC: lea edx, var_30
  loc_005689EF: push ecx
  loc_005689F0: push edx
  loc_005689F1: push 00000004h
  loc_005689F3: call [00401038h] ; __vbaFreeVarList
  loc_005689F9: add esp, 00000014h
  loc_005689FC: cmp var_138, di
  loc_00568A03: jz 00569285h
  loc_00568A09: mov ebx, Me
  loc_00568A0C: mov eax, [ebx+00000038h]
  loc_00568A0F: push eax
  loc_00568A10: call [004011D8h] ; __vbaR8Str
  loc_00568A16: fsub st0, real8 ptr [004015F8h]
  loc_00568A1C: fnstsw ax
  loc_00568A1E: test al, 0Dh
  loc_00568A20: jnz 0056934Fh
  loc_00568A26: call [00401244h] ; __vbaFpI2
  loc_00568A2C: mov edi, [004011B4h] ; __vbaVarCat
  loc_00568A32: mov esi, 00000001h
  loc_00568A37: mov var_140, eax
  loc_00568A3D: mov var_14, esi
  loc_00568A40: cmp si, var_140
  loc_00568A47: jg 0056921Ch
  loc_00568A4D: lea ecx, var_A0
  loc_00568A53: lea edx, var_30
  loc_00568A56: push ecx
  loc_00568A57: push edx
  loc_00568A58: mov var_98, 0061A05Ch
  loc_00568A62: mov var_A0, 00004008h
  loc_00568A6C: call [004010D4h] ; rtcTrimVar
  loc_00568A72: sub esp, 00000010h
  loc_00568A75: mov ecx, 00000003h
  loc_00568A7A: movsx eax, si
  loc_00568A7D: mov esi, esp
  loc_00568A7F: sub esp, 00000010h
  loc_00568A82: mov edx, 00000002h
  loc_00568A87: mov [esi], ecx
  loc_00568A89: mov ecx, var_CC
  loc_00568A8F: mov [esi+00000004h], ecx
  loc_00568A92: mov ecx, esp
  loc_00568A94: push 00000002h
  loc_00568A96: push 00000041h
  loc_00568A98: mov [esi+00000008h], eax
  loc_00568A9B: mov eax, var_C4
  loc_00568AA1: push ebx
  loc_00568AA2: mov [esi+0000000Ch], eax
  loc_00568AA5: mov eax, 00000003h
  loc_00568AAA: mov [ecx], eax
  loc_00568AAC: mov eax, var_EC
  loc_00568AB2: mov [ecx+00000004h], eax
  loc_00568AB5: mov eax, [ebx]
  loc_00568AB7: mov [ecx+00000008h], edx
  loc_00568ABA: mov edx, var_E4
  loc_00568AC0: mov [ecx+0000000Ch], edx
  loc_00568AC3: call [eax+00000340h]
  loc_00568AC9: lea ecx, var_1C
  loc_00568ACC: push eax
  loc_00568ACD: push ecx
  loc_00568ACE: call [004010A0h] ; __vbaObjSet
  loc_00568AD4: lea edx, var_60
  loc_00568AD7: push eax
  loc_00568AD8: push edx
  loc_00568AD9: call [00401140h] ; __vbaLateIdCallLd
  loc_00568ADF: add esp, 00000030h
  loc_00568AE2: push eax
  loc_00568AE3: call [00401028h] ; __vbaStrVarMove
  loc_00568AE9: mov var_68, eax
  loc_00568AEC: lea eax, var_70
  loc_00568AEF: lea ecx, var_80
  loc_00568AF2: mov esi, 00000008h
  loc_00568AF7: push eax
  loc_00568AF8: push ecx
  loc_00568AF9: mov var_70, esi
  loc_00568AFC: call [004010D4h] ; rtcTrimVar
  loc_00568B02: mov edx, [0061A13Ch]
  loc_00568B08: mov var_A8, 00428F44h ; "Select * from LG WHERE OnCount='"
  loc_00568B12: mov var_B0, esi
  loc_00568B18: mov var_B8, 00428F8Ch ; "' and SrNo="
  loc_00568B22: mov var_C0, esi
  loc_00568B28: mov esi, [edx]
  loc_00568B2A: lea edx, var_20
  loc_00568B2D: mov ecx, 0000000Ah
  loc_00568B32: push edx
  loc_00568B33: mov var_120, ecx
  loc_00568B39: sub esp, 00000010h
  loc_00568B3C: mov eax, 80020004h
  loc_00568B41: mov edx, esp
  loc_00568B43: mov var_118, eax
  loc_00568B49: sub esp, 00000010h
  loc_00568B4C: mov var_108, 00000002h
  loc_00568B56: mov [edx], ecx
  loc_00568B58: mov ecx, var_12C
  loc_00568B5E: mov [edx+00000004h], ecx
  loc_00568B61: mov ecx, esp
  loc_00568B63: mov [edx+00000008h], eax
  loc_00568B66: mov eax, var_124
  loc_00568B6C: mov [edx+0000000Ch], eax
  loc_00568B6F: mov edx, var_120
  loc_00568B75: mov eax, var_11C
  loc_00568B7B: mov [ecx], edx
  loc_00568B7D: mov edx, var_118
  loc_00568B83: mov [ecx+00000004h], eax
  loc_00568B86: mov eax, var_114
  loc_00568B8C: mov [ecx+00000008h], edx
  loc_00568B8F: mov edx, var_10C
  loc_00568B95: sub esp, 00000010h
  loc_00568B98: mov [ecx+0000000Ch], eax
  loc_00568B9B: mov ecx, esp
  loc_00568B9D: mov eax, 00000003h
  loc_00568BA2: mov [ecx], eax
  loc_00568BA4: mov eax, var_108
  loc_00568BAA: mov [ecx+00000004h], edx
  loc_00568BAD: mov edx, var_104
  loc_00568BB3: mov [ecx+00000008h], eax
  loc_00568BB6: lea eax, var_B0
  loc_00568BBC: push eax
  loc_00568BBD: mov [ecx+0000000Ch], edx
  loc_00568BC0: lea ecx, var_30
  loc_00568BC3: lea edx, var_40
  loc_00568BC6: push ecx
  loc_00568BC7: push edx
  loc_00568BC8: call edi
  loc_00568BCA: push eax
  loc_00568BCB: lea eax, var_C0
  loc_00568BD1: lea ecx, var_50
  loc_00568BD4: push eax
  loc_00568BD5: push ecx
  loc_00568BD6: call edi
  loc_00568BD8: push eax
  loc_00568BD9: lea edx, var_80
  loc_00568BDC: lea eax, var_90
  loc_00568BE2: push edx
  loc_00568BE3: push eax
  loc_00568BE4: call edi
  loc_00568BE6: lea ecx, var_18
  loc_00568BE9: push eax
  loc_00568BEA: push ecx
  loc_00568BEB: call [004011B0h] ; __vbaStrVarVal
  loc_00568BF1: mov edx, [0061A13Ch]
  loc_00568BF7: push eax
  loc_00568BF8: push edx
  loc_00568BF9: call [esi+000000BCh]
  loc_00568BFF: test eax, eax
  loc_00568C01: fnclex
  loc_00568C03: jge 00568C1Dh
  loc_00568C05: mov ecx, [0061A13Ch]
  loc_00568C0B: push 000000BCh
  loc_00568C10: push 0041E928h
  loc_00568C15: push ecx
  loc_00568C16: push eax
  loc_00568C17: call [00401074h] ; __vbaHresultCheckObj
  loc_00568C1D: mov edx, var_20
  loc_00568C20: lea esi, [ebx+00000034h]
  loc_00568C23: push edx
  loc_00568C24: push esi
  loc_00568C25: call [004010B8h] ; __vbaObjSetAddref
  loc_00568C2B: lea ecx, var_18
  loc_00568C2E: call [004012ACh] ; __vbaFreeStr
  loc_00568C34: lea eax, var_20
  loc_00568C37: lea ecx, var_1C
  loc_00568C3A: push eax
  loc_00568C3B: push ecx
  loc_00568C3C: push 00000002h
  loc_00568C3E: call [00401040h] ; __vbaFreeObjList
  loc_00568C44: lea edx, var_90
  loc_00568C4A: lea eax, var_80
  loc_00568C4D: push edx
  loc_00568C4E: lea ecx, var_50
  loc_00568C51: push eax
  loc_00568C52: lea edx, var_70
  loc_00568C55: push ecx
  loc_00568C56: lea eax, var_60
  loc_00568C59: push edx
  loc_00568C5A: lea ecx, var_40
  loc_00568C5D: push eax
  loc_00568C5E: lea edx, var_30
  loc_00568C61: push ecx
  loc_00568C62: push edx
  loc_00568C63: push 00000007h
  loc_00568C65: call [00401038h] ; __vbaFreeVarList
  loc_00568C6B: add esp, 0000002Ch
  loc_00568C6E: mov eax, [esi]
  loc_00568C70: lea edx, var_134
  loc_00568C76: push edx
  loc_00568C77: push eax
  loc_00568C78: mov ecx, [eax]
  loc_00568C7A: call [ecx+00000034h]
  loc_00568C7D: test eax, eax
  loc_00568C7F: fnclex
  loc_00568C81: jge 00568C94h
  loc_00568C83: mov ecx, [esi]
  loc_00568C85: push 00000034h
  loc_00568C87: push 0041E938h
  loc_00568C8C: push ecx
  loc_00568C8D: push eax
  loc_00568C8E: call [00401074h] ; __vbaHresultCheckObj
  loc_00568C94: cmp var_134, 0000h
  loc_00568C9C: mov eax, [esi]
  loc_00568C9E: jnz 00568DE1h
  loc_00568CA4: mov edx, [eax]
  loc_00568CA6: push eax
  loc_00568CA7: call [edx+000000D0h]
  loc_00568CAD: test eax, eax
  loc_00568CAF: fnclex
  loc_00568CB1: jge 00568CC7h
  loc_00568CB3: mov ecx, [esi]
  loc_00568CB5: push 000000D0h
  loc_00568CBA: push 0041E938h
  loc_00568CBF: push ecx
  loc_00568CC0: push eax
  loc_00568CC1: call [00401074h] ; __vbaHresultCheckObj
  loc_00568CC7: lea edx, var_A0
  loc_00568CCD: lea ecx, var_30
  loc_00568CD0: mov var_98, 00426C1Ch ; "NIL"
  loc_00568CDA: mov var_A0, 00000008h
  loc_00568CE4: call [00401240h] ; __vbaVarDup
  loc_00568CEA: lea edx, var_30
  loc_00568CED: lea eax, var_40
  loc_00568CF0: push edx
  loc_00568CF1: push eax
  loc_00568CF2: call [004010D4h] ; rtcTrimVar
  loc_00568CF8: mov eax, [esi]
  loc_00568CFA: sub esp, 00000010h
  loc_00568CFD: mov var_A8, 0041EB18h ; "AgentName"
  loc_00568D07: mov var_B0, 00000008h
  loc_00568D11: mov ecx, [eax]
  loc_00568D13: mov eax, var_40
  loc_00568D16: mov edx, esp
  loc_00568D18: sub esp, 00000010h
  loc_00568D1B: mov [edx], eax
  loc_00568D1D: mov eax, var_3C
  loc_00568D20: mov [edx+00000004h], eax
  loc_00568D23: mov eax, var_38
  loc_00568D26: mov [edx+00000008h], eax
  loc_00568D29: mov eax, var_34
  loc_00568D2C: mov [edx+0000000Ch], eax
  loc_00568D2F: mov eax, var_B0
  loc_00568D35: mov edx, esp
  loc_00568D37: mov [edx], eax
  loc_00568D39: mov eax, var_AC
  loc_00568D3F: mov [edx+00000004h], eax
  loc_00568D42: mov eax, var_A8
  loc_00568D48: mov [edx+00000008h], eax
  loc_00568D4B: mov eax, var_A4
  loc_00568D51: mov [edx+0000000Ch], eax
  loc_00568D54: mov eax, [esi]
  loc_00568D56: push eax
  loc_00568D57: call [ecx+00000128h]
  loc_00568D5D: test eax, eax
  loc_00568D5F: fnclex
  loc_00568D61: jge 00568D77h
  loc_00568D63: mov ecx, [esi]
  loc_00568D65: push 00000128h
  loc_00568D6A: push 0041E938h
  loc_00568D6F: push ecx
  loc_00568D70: push eax
  loc_00568D71: call [00401074h] ; __vbaHresultCheckObj
  loc_00568D77: lea edx, var_40
  loc_00568D7A: lea eax, var_30
  loc_00568D7D: push edx
  loc_00568D7E: push eax
  loc_00568D7F: push 00000002h
  loc_00568D81: call [00401038h] ; __vbaFreeVarList
  loc_00568D87: mov eax, [esi]
  loc_00568D89: add esp, 0000000Ch
  loc_00568D8C: mov ecx, [eax]
  loc_00568D8E: push 00000000h
  loc_00568D90: push 00000001h
  loc_00568D92: push eax
  loc_00568D93: call [ecx+00000164h]
  loc_00568D99: test eax, eax
  loc_00568D9B: fnclex
  loc_00568D9D: jge 00568DB3h
  loc_00568D9F: mov edx, [esi]
  loc_00568DA1: push 00000164h
  loc_00568DA6: push 0041E938h
  loc_00568DAB: push edx
  loc_00568DAC: push eax
  loc_00568DAD: call [00401074h] ; __vbaHresultCheckObj
  loc_00568DB3: mov eax, [esi]
  loc_00568DB5: push eax
  loc_00568DB6: mov ecx, [eax]
  loc_00568DB8: call [ecx+000000ECh]
  loc_00568DBE: test eax, eax
  loc_00568DC0: fnclex
  loc_00568DC2: jge 00568C6Eh
  loc_00568DC8: mov edx, [esi]
  loc_00568DCA: push 000000ECh
  loc_00568DCF: push 0041E938h
  loc_00568DD4: push edx
  loc_00568DD5: push eax
  loc_00568DD6: call [00401074h] ; __vbaHresultCheckObj
  loc_00568DDC: jmp 00568C6Eh
  loc_00568DE1: mov ecx, [eax]
  loc_00568DE3: push eax
  loc_00568DE4: call [ecx+000000C4h]
  loc_00568DEA: test eax, eax
  loc_00568DEC: fnclex
  loc_00568DEE: jge 00568E04h
  loc_00568DF0: mov edx, [esi]
  loc_00568DF2: push 000000C4h
  loc_00568DF7: push 0041E938h
  loc_00568DFC: push edx
  loc_00568DFD: push eax
  loc_00568DFE: call [00401074h] ; __vbaHresultCheckObj
  loc_00568E04: push 0041E938h
  loc_00568E09: push 00000000h
  loc_00568E0B: call [00401274h] ; __vbaCastObj
  loc_00568E11: push eax
  loc_00568E12: lea eax, var_1C
  loc_00568E15: push eax
  loc_00568E16: call [004010A0h] ; __vbaObjSet
  loc_00568E1C: push eax
  loc_00568E1D: push esi
  loc_00568E1E: call [004010B8h] ; __vbaObjSetAddref
  loc_00568E24: lea ecx, var_1C
  loc_00568E27: call [004012B0h] ; __vbaFreeObj
  loc_00568E2D: lea ecx, var_A0
  loc_00568E33: lea edx, var_30
  loc_00568E36: push ecx
  loc_00568E37: push edx
  loc_00568E38: mov var_98, 0061A05Ch
  loc_00568E42: mov var_A0, 00004008h
  loc_00568E4C: call [004010D4h] ; rtcTrimVar
  loc_00568E52: movsx eax, var_14
  loc_00568E56: sub esp, 00000010h
  loc_00568E59: mov ecx, 00000003h
  loc_00568E5E: mov edx, esp
  loc_00568E60: mov var_F0, ecx
  loc_00568E66: sub esp, 00000010h
  loc_00568E69: mov [edx], ecx
  loc_00568E6B: mov ecx, var_CC
  loc_00568E71: mov [edx+00000004h], ecx
  loc_00568E74: mov ecx, esp
  loc_00568E76: mov [edx+00000008h], eax
  loc_00568E79: mov eax, var_C4
  loc_00568E7F: mov [edx+0000000Ch], eax
  loc_00568E82: mov edx, var_F0
  loc_00568E88: mov eax, var_EC
  loc_00568E8E: mov [ecx], edx
  loc_00568E90: mov edx, var_E4
  loc_00568E96: mov [ecx+00000004h], eax
  loc_00568E99: mov eax, 00000002h
  loc_00568E9E: push eax
  loc_00568E9F: push 00000041h
  loc_00568EA1: mov [ecx+00000008h], eax
  loc_00568EA4: mov eax, [ebx]
  loc_00568EA6: push ebx
  loc_00568EA7: mov [ecx+0000000Ch], edx
  loc_00568EAA: call [eax+00000340h]
  loc_00568EB0: lea ecx, var_1C
  loc_00568EB3: push eax
  loc_00568EB4: push ecx
  loc_00568EB5: call [004010A0h] ; __vbaObjSet
  loc_00568EBB: lea edx, var_60
  loc_00568EBE: push eax
  loc_00568EBF: push edx
  loc_00568EC0: call [00401140h] ; __vbaLateIdCallLd
  loc_00568EC6: add esp, 00000030h
  loc_00568EC9: push eax
  loc_00568ECA: call [00401028h] ; __vbaStrVarMove
  loc_00568ED0: mov var_68, eax
  loc_00568ED3: lea eax, var_70
  loc_00568ED6: lea ecx, var_80
  loc_00568ED9: mov ebx, 00000008h
  loc_00568EDE: push eax
  loc_00568EDF: push ecx
  loc_00568EE0: mov var_70, ebx
  loc_00568EE3: call [004010D4h] ; rtcTrimVar
  loc_00568EE9: mov edx, [0061A13Ch]
  loc_00568EEF: mov var_A8, 00428FA8h ; "Select * from LGDetail WHERE OnCount='"
  loc_00568EF9: mov var_B0, ebx
  loc_00568EFF: mov var_B8, 00428F8Ch ; "' and SrNo="
  loc_00568F09: mov var_C0, ebx
  loc_00568F0F: mov ebx, [edx]
  loc_00568F11: lea edx, var_20
  loc_00568F14: mov ecx, 0000000Ah
  loc_00568F19: push edx
  loc_00568F1A: mov var_120, ecx
  loc_00568F20: sub esp, 00000010h
  loc_00568F23: mov eax, 80020004h
  loc_00568F28: mov edx, esp
  loc_00568F2A: mov var_118, eax
  loc_00568F30: mov [edx], ecx
  loc_00568F32: mov ecx, var_12C
  loc_00568F38: mov [edx+00000004h], ecx
  loc_00568F3B: mov [edx+00000008h], eax
  loc_00568F3E: mov eax, var_124
  loc_00568F44: sub esp, 00000010h
  loc_00568F47: mov [edx+0000000Ch], eax
  loc_00568F4A: mov edx, var_120
  loc_00568F50: mov eax, var_11C
  loc_00568F56: mov ecx, esp
  loc_00568F58: sub esp, 00000010h
  loc_00568F5B: mov [ecx], edx
  loc_00568F5D: mov edx, var_118
  loc_00568F63: mov [ecx+00000004h], eax
  loc_00568F66: mov eax, var_114
  loc_00568F6C: mov [ecx+00000008h], edx
  loc_00568F6F: mov edx, var_10C
  loc_00568F75: mov [ecx+0000000Ch], eax
  loc_00568F78: mov ecx, esp
  loc_00568F7A: mov eax, 00000003h
  loc_00568F7F: mov [ecx], eax
  loc_00568F81: mov eax, 00000002h
  loc_00568F86: mov [ecx+00000004h], edx
  loc_00568F89: lea edx, var_30
  loc_00568F8C: mov [ecx+00000008h], eax
  loc_00568F8F: mov eax, var_104
  loc_00568F95: mov [ecx+0000000Ch], eax
  loc_00568F98: lea ecx, var_B0
  loc_00568F9E: push ecx
  loc_00568F9F: lea eax, var_40
  loc_00568FA2: push edx
  loc_00568FA3: push eax
  loc_00568FA4: call edi
  loc_00568FA6: lea ecx, var_C0
  loc_00568FAC: push eax
  loc_00568FAD: lea edx, var_50
  loc_00568FB0: push ecx
  loc_00568FB1: push edx
  loc_00568FB2: call edi
  loc_00568FB4: push eax
  loc_00568FB5: lea eax, var_80
  loc_00568FB8: lea ecx, var_90
  loc_00568FBE: push eax
  loc_00568FBF: push ecx
  loc_00568FC0: call edi
  loc_00568FC2: lea edx, var_18
  loc_00568FC5: push eax
  loc_00568FC6: push edx
  loc_00568FC7: call [004011B0h] ; __vbaStrVarVal
  loc_00568FCD: push eax
  loc_00568FCE: mov eax, [0061A13Ch]
  loc_00568FD3: push eax
  loc_00568FD4: call [ebx+000000BCh]
  loc_00568FDA: test eax, eax
  loc_00568FDC: fnclex
  loc_00568FDE: jge 00568FFCh
  loc_00568FE0: mov ecx, [0061A13Ch]
  loc_00568FE6: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00568FEC: push 000000BCh
  loc_00568FF1: push 0041E928h
  loc_00568FF6: push ecx
  loc_00568FF7: push eax
  loc_00568FF8: call ebx
  loc_00568FFA: jmp 00569002h
  loc_00568FFC: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00569002: mov edx, var_20
  loc_00569005: push edx
  loc_00569006: push esi
  loc_00569007: call [004010B8h] ; __vbaObjSetAddref
  loc_0056900D: lea ecx, var_18
  loc_00569010: call [004012ACh] ; __vbaFreeStr
  loc_00569016: lea eax, var_20
  loc_00569019: lea ecx, var_1C
  loc_0056901C: push eax
  loc_0056901D: push ecx
  loc_0056901E: push 00000002h
  loc_00569020: call [00401040h] ; __vbaFreeObjList
  loc_00569026: lea edx, var_90
  loc_0056902C: lea eax, var_80
  loc_0056902F: push edx
  loc_00569030: lea ecx, var_50
  loc_00569033: push eax
  loc_00569034: lea edx, var_70
  loc_00569037: push ecx
  loc_00569038: lea eax, var_60
  loc_0056903B: push edx
  loc_0056903C: lea ecx, var_40
  loc_0056903F: push eax
  loc_00569040: lea edx, var_30
  loc_00569043: push ecx
  loc_00569044: push edx
  loc_00569045: push 00000007h
  loc_00569047: call [00401038h] ; __vbaFreeVarList
  loc_0056904D: add esp, 0000002Ch
  loc_00569050: mov eax, [esi]
  loc_00569052: lea edx, var_134
  loc_00569058: push edx
  loc_00569059: push eax
  loc_0056905A: mov ecx, [eax]
  loc_0056905C: call [ecx+00000034h]
  loc_0056905F: test eax, eax
  loc_00569061: fnclex
  loc_00569063: jge 00569072h
  loc_00569065: mov ecx, [esi]
  loc_00569067: push 00000034h
  loc_00569069: push 0041E938h
  loc_0056906E: push ecx
  loc_0056906F: push eax
  loc_00569070: call ebx
  loc_00569072: cmp var_134, 0000h
  loc_0056907A: mov eax, [esi]
  loc_0056907C: jnz 005691B8h
  loc_00569082: mov edx, [eax]
  loc_00569084: push eax
  loc_00569085: call [edx+000000D0h]
  loc_0056908B: test eax, eax
  loc_0056908D: fnclex
  loc_0056908F: jge 005690A1h
  loc_00569091: mov ecx, [esi]
  loc_00569093: push 000000D0h
  loc_00569098: push 0041E938h
  loc_0056909D: push ecx
  loc_0056909E: push eax
  loc_0056909F: call ebx
  loc_005690A1: mov ebx, 00000008h
  loc_005690A6: lea edx, var_A0
  loc_005690AC: lea ecx, var_30
  loc_005690AF: mov var_98, 00426C1Ch ; "NIL"
  loc_005690B9: mov var_A0, ebx
  loc_005690BF: call [00401240h] ; __vbaVarDup
  loc_005690C5: lea edx, var_30
  loc_005690C8: lea eax, var_40
  loc_005690CB: push edx
  loc_005690CC: push eax
  loc_005690CD: call [004010D4h] ; rtcTrimVar
  loc_005690D3: sub esp, 00000010h
  loc_005690D6: mov var_B0, ebx
  loc_005690DC: mov ebx, var_40
  loc_005690DF: mov edx, esp
  loc_005690E1: sub esp, 00000010h
  loc_005690E4: mov eax, [esi]
  loc_005690E6: mov [edx], ebx
  loc_005690E8: mov ebx, var_3C
  loc_005690EB: mov var_A8, 0041EB18h ; "AgentName"
  loc_005690F5: mov ecx, [eax]
  loc_005690F7: mov [edx+00000004h], ebx
  loc_005690FA: mov ebx, var_38
  loc_005690FD: mov [edx+00000008h], ebx
  loc_00569100: mov ebx, var_34
  loc_00569103: mov [edx+0000000Ch], ebx
  loc_00569106: mov ebx, var_B0
  loc_0056910C: mov edx, esp
  loc_0056910E: push eax
  loc_0056910F: mov [edx], ebx
  loc_00569111: mov ebx, var_AC
  loc_00569117: mov [edx+00000004h], ebx
  loc_0056911A: mov ebx, var_A8
  loc_00569120: mov [edx+00000008h], ebx
  loc_00569123: mov ebx, var_A4
  loc_00569129: mov [edx+0000000Ch], ebx
  loc_0056912C: call [ecx+00000128h]
  loc_00569132: test eax, eax
  loc_00569134: fnclex
  loc_00569136: jge 00569150h
  loc_00569138: mov ecx, [esi]
  loc_0056913A: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00569140: push 00000128h
  loc_00569145: push 0041E938h
  loc_0056914A: push ecx
  loc_0056914B: push eax
  loc_0056914C: call ebx
  loc_0056914E: jmp 00569156h
  loc_00569150: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00569156: lea edx, var_40
  loc_00569159: lea eax, var_30
  loc_0056915C: push edx
  loc_0056915D: push eax
  loc_0056915E: push 00000002h
  loc_00569160: call [00401038h] ; __vbaFreeVarList
  loc_00569166: mov eax, [esi]
  loc_00569168: add esp, 0000000Ch
  loc_0056916B: mov ecx, [eax]
  loc_0056916D: push 00000000h
  loc_0056916F: push 00000001h
  loc_00569171: push eax
  loc_00569172: call [ecx+00000164h]
  loc_00569178: test eax, eax
  loc_0056917A: fnclex
  loc_0056917C: jge 0056918Eh
  loc_0056917E: mov edx, [esi]
  loc_00569180: push 00000164h
  loc_00569185: push 0041E938h
  loc_0056918A: push edx
  loc_0056918B: push eax
  loc_0056918C: call ebx
  loc_0056918E: mov eax, [esi]
  loc_00569190: push eax
  loc_00569191: mov ecx, [eax]
  loc_00569193: call [ecx+000000ECh]
  loc_00569199: test eax, eax
  loc_0056919B: fnclex
  loc_0056919D: jge 00569050h
  loc_005691A3: mov edx, [esi]
  loc_005691A5: push 000000ECh
  loc_005691AA: push 0041E938h
  loc_005691AF: push edx
  loc_005691B0: push eax
  loc_005691B1: call ebx
  loc_005691B3: jmp 00569050h
  loc_005691B8: mov ecx, [eax]
  loc_005691BA: push eax
  loc_005691BB: call [ecx+000000C4h]
  loc_005691C1: test eax, eax
  loc_005691C3: fnclex
  loc_005691C5: jge 005691D7h
  loc_005691C7: mov edx, [esi]
  loc_005691C9: push 000000C4h
  loc_005691CE: push 0041E938h
  loc_005691D3: push edx
  loc_005691D4: push eax
  loc_005691D5: call ebx
  loc_005691D7: push 0041E938h
  loc_005691DC: push 00000000h
  loc_005691DE: call [00401274h] ; __vbaCastObj
  loc_005691E4: push eax
  loc_005691E5: lea eax, var_1C
  loc_005691E8: push eax
  loc_005691E9: call [004010A0h] ; __vbaObjSet
  loc_005691EF: push eax
  loc_005691F0: push esi
  loc_005691F1: call [004010B8h] ; __vbaObjSetAddref
  loc_005691F7: lea ecx, var_1C
  loc_005691FA: call [004012B0h] ; __vbaFreeObj
  loc_00569200: mov ebx, Me
  loc_00569203: mov eax, 00000001h
  loc_00569208: add ax, var_14
  loc_0056920C: jo 00569354h
  loc_00569212: mov var_14, eax
  loc_00569215: mov esi, eax
  loc_00569217: jmp 00568A40h
  loc_0056921C: mov ecx, 0000000Ah
  loc_00569221: mov eax, 80020004h
  loc_00569226: mov var_60, ecx
  loc_00569229: mov var_50, ecx
  loc_0056922C: mov var_40, ecx
  loc_0056922F: lea edx, var_A0
  loc_00569235: lea ecx, var_30
  loc_00569238: mov var_58, eax
  loc_0056923B: mov var_48, eax
  loc_0056923E: mov var_38, eax
  loc_00569241: mov var_98, 004249F4h ; "Delete Successfully."
  loc_0056924B: mov var_A0, 00000008h
  loc_00569255: call [00401240h] ; __vbaVarDup
  loc_0056925B: lea ecx, var_60
  loc_0056925E: lea edx, var_50
  loc_00569261: push ecx
  loc_00569262: lea eax, var_40
  loc_00569265: push edx
  loc_00569266: push eax
  loc_00569267: lea ecx, var_30
  loc_0056926A: push 00000040h
  loc_0056926C: push ecx
  loc_0056926D: call [004010A4h] ; rtcMsgBox
  loc_00569273: lea edx, var_60
  loc_00569276: lea eax, var_50
  loc_00569279: push edx
  loc_0056927A: lea ecx, var_40
  loc_0056927D: push eax
  loc_0056927E: lea edx, var_30
  loc_00569281: push ecx
  loc_00569282: push edx
  loc_00569283: jmp 005692E2h
  loc_00569285: lea edx, var_A0
  loc_0056928B: lea ecx, var_30
  loc_0056928E: mov var_58, ebx
  loc_00569291: mov var_60, esi
  loc_00569294: mov var_48, ebx
  loc_00569297: mov var_50, esi
  loc_0056929A: mov var_38, ebx
  loc_0056929D: mov var_40, esi
  loc_005692A0: mov var_98, 00429030h ; "Cann't Delete Successfully."
  loc_005692AA: mov var_A0, 00000008h
  loc_005692B4: call [00401240h] ; __vbaVarDup
  loc_005692BA: lea eax, var_60
  loc_005692BD: lea ecx, var_50
  loc_005692C0: push eax
  loc_005692C1: lea edx, var_40
  loc_005692C4: push ecx
  loc_005692C5: push edx
  loc_005692C6: lea eax, var_30
  loc_005692C9: push 00000020h
  loc_005692CB: push eax
  loc_005692CC: call [004010A4h] ; rtcMsgBox
  loc_005692D2: lea ecx, var_60
  loc_005692D5: lea edx, var_50
  loc_005692D8: push ecx
  loc_005692D9: lea eax, var_40
  loc_005692DC: push edx
  loc_005692DD: lea ecx, var_30
  loc_005692E0: push eax
  loc_005692E1: push ecx
  loc_005692E2: push 00000004h
  loc_005692E4: call [00401038h] ; __vbaFreeVarList
  loc_005692EA: add esp, 00000014h
  loc_005692ED: fwait
  loc_005692EE: push 0056933Ah
  loc_005692F3: jmp 00569339h
  loc_005692F5: lea ecx, var_18
  loc_005692F8: call [004012ACh] ; __vbaFreeStr
  loc_005692FE: lea edx, var_20
  loc_00569301: lea eax, var_1C
  loc_00569304: push edx
  loc_00569305: push eax
  loc_00569306: push 00000002h
  loc_00569308: call [00401040h] ; __vbaFreeObjList
  loc_0056930E: lea ecx, var_90
  loc_00569314: lea edx, var_80
  loc_00569317: push ecx
  loc_00569318: lea eax, var_70
  loc_0056931B: push edx
  loc_0056931C: lea ecx, var_60
  loc_0056931F: push eax
  loc_00569320: lea edx, var_50
  loc_00569323: push ecx
  loc_00569324: lea eax, var_40
  loc_00569327: push edx
  loc_00569328: lea ecx, var_30
  loc_0056932B: push eax
  loc_0056932C: push ecx
  loc_0056932D: push 00000007h
  loc_0056932F: call [00401038h] ; __vbaFreeVarList
  loc_00569335: add esp, 0000002Ch
  loc_00569338: ret
  loc_00569339: ret
  loc_0056933A: mov ecx, var_10
  loc_0056933D: pop edi
  loc_0056933E: pop esi
  loc_0056933F: xor eax, eax
  loc_00569341: mov fs:[00000000h], ecx
  loc_00569348: pop ebx
  loc_00569349: mov esp, ebp
  loc_0056934B: pop ebp
  loc_0056934C: retn 0004h
End Sub

Private Sub Proc_14_23_569360() '569360
  loc_00569360: push ebp
  loc_00569361: mov ebp, esp
  loc_00569363: sub esp, 00000008h
  loc_00569366: push 00403B36h ; __vbaExceptHandler
  loc_0056936B: mov eax, fs:[00000000h]
  loc_00569371: push eax
  loc_00569372: mov fs:[00000000h], esp
  loc_00569379: sub esp, 0000013Ch
  loc_0056937F: push ebx
  loc_00569380: push esi
  loc_00569381: push edi
  loc_00569382: mov var_8, esp
  loc_00569385: mov var_4, 00402AC8h
  loc_0056938C: sub esp, 00000010h
  loc_0056938F: mov ecx, 00000003h
  loc_00569394: mov edi, esp
  loc_00569396: mov var_A4, ecx
  loc_0056939C: mov edx, ecx
  loc_0056939E: mov eax, 00000001h
  loc_005693A3: mov [edi], ecx
  loc_005693A5: mov ecx, var_A0
  loc_005693AB: sub esp, 00000010h
  loc_005693AE: mov var_9C, eax
  loc_005693B4: mov [edi+00000004h], ecx
  loc_005693B7: mov ecx, esp
  loc_005693B9: mov var_C4, edx
  loc_005693BF: xor esi, esi
  loc_005693C1: mov [edi+00000008h], eax
  loc_005693C4: mov eax, var_98
  loc_005693CA: push 00000002h
  loc_005693CC: push 00000041h
  loc_005693CE: mov [edi+0000000Ch], eax
  loc_005693D1: mov eax, var_B8
  loc_005693D7: mov edi, Me
  loc_005693DA: mov [ecx], edx
  loc_005693DC: mov edx, var_C0
  loc_005693E2: push edi
  loc_005693E3: mov [ecx+00000004h], edx
  loc_005693E6: mov var_18, esi
  loc_005693E9: mov var_1C, esi
  loc_005693EC: mov var_20, esi
  loc_005693EF: mov [ecx+00000008h], esi
  loc_005693F2: mov var_24, esi
  loc_005693F5: mov var_34, esi
  loc_005693F8: mov var_44, esi
  loc_005693FB: mov [ecx+0000000Ch], eax
  loc_005693FE: mov ecx, [edi]
  loc_00569400: mov var_54, esi
  loc_00569403: mov var_64, esi
  loc_00569406: mov var_74, esi
  loc_00569409: mov var_84, esi
  loc_0056940F: mov var_94, esi
  loc_00569415: mov var_B4, esi
  loc_0056941B: mov var_D4, esi
  loc_00569421: mov var_E4, esi
  loc_00569427: mov var_124, esi
  loc_0056942D: mov var_134, esi
  loc_00569433: mov var_138, esi
  loc_00569439: mov var_BC, esi
  loc_0056943F: call [ecx+00000340h]
  loc_00569445: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0056944B: lea edx, var_20
  loc_0056944E: push eax
  loc_0056944F: push edx
  loc_00569450: call ebx
  loc_00569452: push eax
  loc_00569453: lea eax, var_34
  loc_00569456: push eax
  loc_00569457: call [00401140h] ; __vbaLateIdCallLd
  loc_0056945D: add esp, 00000030h
  loc_00569460: push eax
  loc_00569461: call [00401028h] ; __vbaStrVarMove
  loc_00569467: mov edx, eax
  loc_00569469: lea ecx, var_18
  loc_0056946C: call [00401270h] ; __vbaStrMove
  loc_00569472: push eax
  loc_00569473: push 0041E5D4h
  loc_00569478: call [0040110Ch] ; __vbaStrCmp
  loc_0056947E: neg eax
  loc_00569480: sbb eax, eax
  loc_00569482: lea ecx, var_E4
  loc_00569488: neg eax
  loc_0056948A: lea edx, var_44
  loc_0056948D: push ecx
  loc_0056948E: neg eax
  loc_00569490: push edx
  loc_00569491: mov var_DC, ax
  loc_00569498: mov var_E4, 0000000Bh
  loc_005694A2: call [004010D4h] ; rtcTrimVar
  loc_005694A8: sub esp, 00000010h
  loc_005694AB: mov ecx, 00000003h
  loc_005694B0: mov edx, esp
  loc_005694B2: mov var_114, ecx
  loc_005694B8: mov eax, 00000001h
  loc_005694BD: sub esp, 00000010h
  loc_005694C0: mov [edx], ecx
  loc_005694C2: mov ecx, var_F0
  loc_005694C8: mov var_10C, eax
  loc_005694CE: mov [edx+00000004h], ecx
  loc_005694D1: mov ecx, esp
  loc_005694D3: push 00000002h
  loc_005694D5: push 00000041h
  loc_005694D7: mov [edx+00000008h], eax
  loc_005694DA: mov eax, var_E8
  loc_005694E0: push edi
  loc_005694E1: mov [edx+0000000Ch], eax
  loc_005694E4: mov edx, var_114
  loc_005694EA: mov eax, var_110
  loc_005694F0: mov [ecx], edx
  loc_005694F2: mov edx, var_10C
  loc_005694F8: mov [ecx+00000004h], eax
  loc_005694FB: mov eax, var_108
  loc_00569501: mov [ecx+00000008h], edx
  loc_00569504: mov [ecx+0000000Ch], eax
  loc_00569507: mov ecx, [edi]
  loc_00569509: call [ecx+00000340h]
  loc_0056950F: lea edx, var_24
  loc_00569512: push eax
  loc_00569513: push edx
  loc_00569514: call ebx
  loc_00569516: push eax
  loc_00569517: lea eax, var_54
  loc_0056951A: push eax
  loc_0056951B: call [00401140h] ; __vbaLateIdCallLd
  loc_00569521: add esp, 00000030h
  loc_00569524: push eax
  loc_00569525: call [00401028h] ; __vbaStrVarMove
  loc_0056952B: mov edx, eax
  loc_0056952D: lea ecx, var_1C
  loc_00569530: call [00401270h] ; __vbaStrMove
  loc_00569536: push eax
  loc_00569537: push 0041E5D4h
  loc_0056953C: call [0040110Ch] ; __vbaStrCmp
  loc_00569542: neg eax
  loc_00569544: sbb eax, eax
  loc_00569546: lea ecx, var_134
  loc_0056954C: neg eax
  loc_0056954E: lea edx, var_64
  loc_00569551: push ecx
  loc_00569552: neg eax
  loc_00569554: push edx
  loc_00569555: mov var_12C, ax
  loc_0056955C: mov var_134, 0000000Bh
  loc_00569566: call [004010D4h] ; rtcTrimVar
  loc_0056956C: lea eax, var_44
  loc_0056956F: lea ecx, var_64
  loc_00569572: push eax
  loc_00569573: lea edx, var_74
  loc_00569576: push ecx
  loc_00569577: push edx
  loc_00569578: call [0040115Ch] ; __vbaVarAnd
  loc_0056957E: push eax
  loc_0056957F: call [004010E0h] ; __vbaBoolVarNull
  loc_00569585: mov var_13C, ax
  loc_0056958C: lea eax, var_1C
  loc_0056958F: lea ecx, var_18
  loc_00569592: push eax
  loc_00569593: push ecx
  loc_00569594: push 00000002h
  loc_00569596: call [004011FCh] ; __vbaFreeStrList
  loc_0056959C: lea edx, var_24
  loc_0056959F: lea eax, var_20
  loc_005695A2: push edx
  loc_005695A3: push eax
  loc_005695A4: push 00000002h
  loc_005695A6: call [00401040h] ; __vbaFreeObjList
  loc_005695AC: lea ecx, var_64
  loc_005695AF: lea edx, var_44
  loc_005695B2: push ecx
  loc_005695B3: push edx
  loc_005695B4: lea eax, var_134
  loc_005695BA: lea ecx, var_54
  loc_005695BD: push eax
  loc_005695BE: lea edx, var_E4
  loc_005695C4: push ecx
  loc_005695C5: lea eax, var_34
  loc_005695C8: push edx
  loc_005695C9: push eax
  loc_005695CA: push 00000006h
  loc_005695CC: call [00401038h] ; __vbaFreeVarList
  loc_005695D2: add esp, 00000034h
  loc_005695D5: cmp var_13C, si
  loc_005695DC: jz 00569FFCh
  loc_005695E2: mov ecx, [edi+00000038h]
  loc_005695E5: push ecx
  loc_005695E6: call [004011D8h] ; __vbaR8Str
  loc_005695EC: fsub st0, real8 ptr [004015F8h]
  loc_005695F2: fnstsw ax
  loc_005695F4: test al, 0Dh
  loc_005695F6: jnz 0056A0DAh
  loc_005695FC: call [00401244h] ; __vbaFpI2
  loc_00569602: mov var_144, eax
  loc_00569608: mov var_14, 00000001h
  loc_0056960F: mov dx, var_144
  loc_00569616: cmp var_14, dx
  loc_0056961A: jg 00569F37h
  loc_00569620: lea eax, var_A4
  loc_00569626: lea ecx, var_34
  loc_00569629: push eax
  loc_0056962A: push ecx
  loc_0056962B: mov var_9C, 0061A05Ch
  loc_00569635: mov var_A4, 00004008h
  loc_0056963F: call [004010D4h] ; rtcTrimVar
  loc_00569645: movsx edx, var_14
  loc_00569649: sub esp, 00000010h
  loc_0056964C: mov eax, 00000003h
  loc_00569651: mov esi, esp
  loc_00569653: mov var_14C, edx
  loc_00569659: mov edx, eax
  loc_0056965B: sub esp, 00000010h
  loc_0056965E: mov [esi], eax
  loc_00569660: mov eax, var_D0
  loc_00569666: mov ecx, 00000002h
  loc_0056966B: mov [esi+00000004h], eax
  loc_0056966E: mov eax, var_14C
  loc_00569674: mov [esi+00000008h], eax
  loc_00569677: mov eax, var_C8
  loc_0056967D: mov [esi+0000000Ch], eax
  loc_00569680: mov eax, esp
  loc_00569682: push 00000002h
  loc_00569684: push 00000041h
  loc_00569686: mov [eax], edx
  loc_00569688: mov edx, var_F0
  loc_0056968E: push edi
  loc_0056968F: mov [eax+00000004h], edx
  loc_00569692: mov edx, [edi]
  loc_00569694: mov [eax+00000008h], ecx
  loc_00569697: mov ecx, var_E8
  loc_0056969D: mov [eax+0000000Ch], ecx
  loc_005696A0: call [edx+00000340h]
  loc_005696A6: push eax
  loc_005696A7: lea eax, var_20
  loc_005696AA: push eax
  loc_005696AB: call ebx
  loc_005696AD: lea ecx, var_64
  loc_005696B0: push eax
  loc_005696B1: push ecx
  loc_005696B2: call [00401140h] ; __vbaLateIdCallLd
  loc_005696B8: add esp, 00000030h
  loc_005696BB: push eax
  loc_005696BC: call [00401028h] ; __vbaStrVarMove
  loc_005696C2: mov var_6C, eax
  loc_005696C5: lea edx, var_74
  loc_005696C8: lea eax, var_84
  loc_005696CE: mov esi, 00000008h
  loc_005696D3: push edx
  loc_005696D4: push eax
  loc_005696D5: mov var_74, esi
  loc_005696D8: call [004010D4h] ; rtcTrimVar
  loc_005696DE: mov edx, [0061A13Ch]
  loc_005696E4: mov eax, 80020004h
  loc_005696E9: mov ecx, 0000000Ah
  loc_005696EE: mov var_12C, eax
  loc_005696F4: mov var_134, ecx
  loc_005696FA: mov var_AC, 00428F44h ; "Select * from LG WHERE OnCount='"
  loc_00569704: mov var_B4, esi
  loc_0056970A: mov var_BC, 00428F8Ch ; "' and SrNo="
  loc_00569714: mov var_C4, esi
  loc_0056971A: mov esi, [edx]
  loc_0056971C: lea edx, var_24
  loc_0056971F: mov var_124, ecx
  loc_00569725: push edx
  loc_00569726: mov var_11C, eax
  loc_0056972C: sub esp, 00000010h
  loc_0056972F: mov var_10C, 00000002h
  loc_00569739: mov edx, esp
  loc_0056973B: sub esp, 00000010h
  loc_0056973E: mov [edx], ecx
  loc_00569740: mov ecx, var_130
  loc_00569746: mov [edx+00000004h], ecx
  loc_00569749: mov ecx, esp
  loc_0056974B: mov [edx+00000008h], eax
  loc_0056974E: mov eax, var_128
  loc_00569754: mov [edx+0000000Ch], eax
  loc_00569757: mov edx, var_124
  loc_0056975D: mov eax, var_120
  loc_00569763: mov [ecx], edx
  loc_00569765: mov edx, var_11C
  loc_0056976B: mov [ecx+00000004h], eax
  loc_0056976E: mov eax, var_118
  loc_00569774: sub esp, 00000010h
  loc_00569777: mov [ecx+00000008h], edx
  loc_0056977A: mov edx, var_110
  loc_00569780: mov [ecx+0000000Ch], eax
  loc_00569783: mov ecx, esp
  loc_00569785: mov eax, 00000003h
  loc_0056978A: mov [ecx], eax
  loc_0056978C: mov eax, var_10C
  loc_00569792: mov [ecx+00000004h], edx
  loc_00569795: mov edx, var_108
  loc_0056979B: mov [ecx+00000008h], eax
  loc_0056979E: lea eax, var_B4
  loc_005697A4: push eax
  loc_005697A5: mov [ecx+0000000Ch], edx
  loc_005697A8: lea ecx, var_34
  loc_005697AB: lea edx, var_44
  loc_005697AE: push ecx
  loc_005697AF: push edx
  loc_005697B0: call [004011B4h] ; __vbaVarCat
  loc_005697B6: push eax
  loc_005697B7: lea eax, var_C4
  loc_005697BD: lea ecx, var_54
  loc_005697C0: push eax
  loc_005697C1: push ecx
  loc_005697C2: call [004011B4h] ; __vbaVarCat
  loc_005697C8: push eax
  loc_005697C9: lea edx, var_84
  loc_005697CF: lea eax, var_94
  loc_005697D5: push edx
  loc_005697D6: push eax
  loc_005697D7: call [004011B4h] ; __vbaVarCat
  loc_005697DD: lea ecx, var_18
  loc_005697E0: push eax
  loc_005697E1: push ecx
  loc_005697E2: call [004011B0h] ; __vbaStrVarVal
  loc_005697E8: mov edx, [0061A13Ch]
  loc_005697EE: push eax
  loc_005697EF: push edx
  loc_005697F0: call [esi+000000BCh]
  loc_005697F6: test eax, eax
  loc_005697F8: fnclex
  loc_005697FA: jge 00569814h
  loc_005697FC: mov ecx, [0061A13Ch]
  loc_00569802: push 000000BCh
  loc_00569807: push 0041E928h
  loc_0056980C: push ecx
  loc_0056980D: push eax
  loc_0056980E: call [00401074h] ; __vbaHresultCheckObj
  loc_00569814: mov edx, var_24
  loc_00569817: lea esi, [edi+00000034h]
  loc_0056981A: push edx
  loc_0056981B: push esi
  loc_0056981C: call [004010B8h] ; __vbaObjSetAddref
  loc_00569822: lea ecx, var_18
  loc_00569825: call [004012ACh] ; __vbaFreeStr
  loc_0056982B: lea eax, var_24
  loc_0056982E: lea ecx, var_20
  loc_00569831: push eax
  loc_00569832: push ecx
  loc_00569833: push 00000002h
  loc_00569835: call [00401040h] ; __vbaFreeObjList
  loc_0056983B: lea edx, var_94
  loc_00569841: lea eax, var_84
  loc_00569847: push edx
  loc_00569848: lea ecx, var_54
  loc_0056984B: push eax
  loc_0056984C: lea edx, var_74
  loc_0056984F: push ecx
  loc_00569850: lea eax, var_64
  loc_00569853: push edx
  loc_00569854: lea ecx, var_44
  loc_00569857: push eax
  loc_00569858: lea edx, var_34
  loc_0056985B: push ecx
  loc_0056985C: push edx
  loc_0056985D: push 00000007h
  loc_0056985F: call [00401038h] ; __vbaFreeVarList
  loc_00569865: add esp, 0000002Ch
  loc_00569868: mov eax, [esi]
  loc_0056986A: lea edx, var_138
  loc_00569870: push edx
  loc_00569871: push eax
  loc_00569872: mov ecx, [eax]
  loc_00569874: call [ecx+00000034h]
  loc_00569877: test eax, eax
  loc_00569879: fnclex
  loc_0056987B: jge 0056988Eh
  loc_0056987D: mov ecx, [esi]
  loc_0056987F: push 00000034h
  loc_00569881: push 0041E938h
  loc_00569886: push ecx
  loc_00569887: push eax
  loc_00569888: call [00401074h] ; __vbaHresultCheckObj
  loc_0056988E: mov eax, [esi]
  loc_00569890: cmp var_138, 0000h
  loc_00569898: push eax
  loc_00569899: mov edx, [eax]
  loc_0056989B: jnz 00569A63h
  loc_005698A1: call [edx+000000D0h]
  loc_005698A7: test eax, eax
  loc_005698A9: fnclex
  loc_005698AB: jge 005698C1h
  loc_005698AD: mov ecx, [esi]
  loc_005698AF: push 000000D0h
  loc_005698B4: push 0041E938h
  loc_005698B9: push ecx
  loc_005698BA: push eax
  loc_005698BB: call [00401074h] ; __vbaHresultCheckObj
  loc_005698C1: sub esp, 00000010h
  loc_005698C4: mov eax, var_14C
  loc_005698CA: mov edx, esp
  loc_005698CC: mov ecx, 00000003h
  loc_005698D1: mov var_A4, ecx
  loc_005698D7: mov var_C4, ecx
  loc_005698DD: mov [edx], ecx
  loc_005698DF: mov ecx, var_A0
  loc_005698E5: mov var_9C, eax
  loc_005698EB: sub esp, 00000010h
  loc_005698EE: mov [edx+00000004h], ecx
  loc_005698F1: mov ecx, esp
  loc_005698F3: mov var_BC, 00000001h
  loc_005698FD: push 00000002h
  loc_005698FF: mov [edx+00000008h], eax
  loc_00569902: mov eax, var_98
  loc_00569908: push 00000041h
  loc_0056990A: push edi
  loc_0056990B: mov [edx+0000000Ch], eax
  loc_0056990E: mov edx, var_C4
  loc_00569914: mov eax, var_C0
  loc_0056991A: mov [ecx], edx
  loc_0056991C: mov edx, var_BC
  loc_00569922: mov [ecx+00000004h], eax
  loc_00569925: mov eax, var_B8
  loc_0056992B: mov [ecx+00000008h], edx
  loc_0056992E: mov [ecx+0000000Ch], eax
  loc_00569931: mov ecx, [edi]
  loc_00569933: call [ecx+00000340h]
  loc_00569939: lea edx, var_20
  loc_0056993C: push eax
  loc_0056993D: push edx
  loc_0056993E: call ebx
  loc_00569940: push eax
  loc_00569941: lea eax, var_34
  loc_00569944: push eax
  loc_00569945: call [00401140h] ; __vbaLateIdCallLd
  loc_0056994B: add esp, 00000030h
  loc_0056994E: push eax
  loc_0056994F: call [00401028h] ; __vbaStrVarMove
  loc_00569955: lea ecx, var_44
  loc_00569958: lea edx, var_54
  loc_0056995B: push ecx
  loc_0056995C: push edx
  loc_0056995D: mov var_3C, eax
  loc_00569960: mov var_44, 00000008h
  loc_00569967: call [004010D4h] ; rtcTrimVar
  loc_0056996D: mov eax, [esi]
  loc_0056996F: sub esp, 00000010h
  loc_00569972: mov var_DC, 0041EB18h ; "AgentName"
  loc_0056997C: mov var_E4, 00000008h
  loc_00569986: mov ecx, [eax]
  loc_00569988: mov eax, var_54
  loc_0056998B: mov edx, esp
  loc_0056998D: sub esp, 00000010h
  loc_00569990: mov [edx], eax
  loc_00569992: mov eax, var_50
  loc_00569995: mov [edx+00000004h], eax
  loc_00569998: mov eax, var_4C
  loc_0056999B: mov [edx+00000008h], eax
  loc_0056999E: mov eax, var_48
  loc_005699A1: mov [edx+0000000Ch], eax
  loc_005699A4: mov eax, var_E4
  loc_005699AA: mov edx, esp
  loc_005699AC: mov [edx], eax
  loc_005699AE: mov eax, var_E0
  loc_005699B4: mov [edx+00000004h], eax
  loc_005699B7: mov eax, var_DC
  loc_005699BD: mov [edx+00000008h], eax
  loc_005699C0: mov eax, var_D8
  loc_005699C6: mov [edx+0000000Ch], eax
  loc_005699C9: mov eax, [esi]
  loc_005699CB: push eax
  loc_005699CC: call [ecx+00000128h]
  loc_005699D2: test eax, eax
  loc_005699D4: fnclex
  loc_005699D6: jge 005699ECh
  loc_005699D8: mov ecx, [esi]
  loc_005699DA: push 00000128h
  loc_005699DF: push 0041E938h
  loc_005699E4: push ecx
  loc_005699E5: push eax
  loc_005699E6: call [00401074h] ; __vbaHresultCheckObj
  loc_005699EC: lea ecx, var_20
  loc_005699EF: call [004012B0h] ; __vbaFreeObj
  loc_005699F5: lea edx, var_54
  loc_005699F8: lea eax, var_44
  loc_005699FB: push edx
  loc_005699FC: lea ecx, var_34
  loc_005699FF: push eax
  loc_00569A00: push ecx
  loc_00569A01: push 00000003h
  loc_00569A03: call [00401038h] ; __vbaFreeVarList
  loc_00569A09: mov eax, [esi]
  loc_00569A0B: add esp, 00000010h
  loc_00569A0E: mov edx, [eax]
  loc_00569A10: push 00000000h
  loc_00569A12: push 00000001h
  loc_00569A14: push eax
  loc_00569A15: call [edx+00000164h]
  loc_00569A1B: test eax, eax
  loc_00569A1D: fnclex
  loc_00569A1F: jge 00569A35h
  loc_00569A21: mov ecx, [esi]
  loc_00569A23: push 00000164h
  loc_00569A28: push 0041E938h
  loc_00569A2D: push ecx
  loc_00569A2E: push eax
  loc_00569A2F: call [00401074h] ; __vbaHresultCheckObj
  loc_00569A35: mov eax, [esi]
  loc_00569A37: push eax
  loc_00569A38: mov edx, [eax]
  loc_00569A3A: call [edx+000000ECh]
  loc_00569A40: test eax, eax
  loc_00569A42: fnclex
  loc_00569A44: jge 00569868h
  loc_00569A4A: mov ecx, [esi]
  loc_00569A4C: push 000000ECh
  loc_00569A51: push 0041E938h
  loc_00569A56: push ecx
  loc_00569A57: push eax
  loc_00569A58: call [00401074h] ; __vbaHresultCheckObj
  loc_00569A5E: jmp 00569868h
  loc_00569A63: call [edx+000000C4h]
  loc_00569A69: test eax, eax
  loc_00569A6B: fnclex
  loc_00569A6D: jge 00569A83h
  loc_00569A6F: mov ecx, [esi]
  loc_00569A71: push 000000C4h
  loc_00569A76: push 0041E938h
  loc_00569A7B: push ecx
  loc_00569A7C: push eax
  loc_00569A7D: call [00401074h] ; __vbaHresultCheckObj
  loc_00569A83: push 0041E938h
  loc_00569A88: push 00000000h
  loc_00569A8A: call [00401274h] ; __vbaCastObj
  loc_00569A90: lea edx, var_20
  loc_00569A93: push eax
  loc_00569A94: push edx
  loc_00569A95: call ebx
  loc_00569A97: push eax
  loc_00569A98: push esi
  loc_00569A99: call [004010B8h] ; __vbaObjSetAddref
  loc_00569A9F: lea ecx, var_20
  loc_00569AA2: call [004012B0h] ; __vbaFreeObj
  loc_00569AA8: lea eax, var_A4
  loc_00569AAE: lea ecx, var_34
  loc_00569AB1: push eax
  loc_00569AB2: push ecx
  loc_00569AB3: mov var_9C, 0061A05Ch
  loc_00569ABD: mov var_A4, 00004008h
  loc_00569AC7: call [004010D4h] ; rtcTrimVar
  loc_00569ACD: sub esp, 00000010h
  loc_00569AD0: mov eax, 00000003h
  loc_00569AD5: mov edx, esp
  loc_00569AD7: sub esp, 00000010h
  loc_00569ADA: mov ecx, 00000002h
  loc_00569ADF: mov [edx], eax
  loc_00569AE1: mov eax, var_D0
  loc_00569AE7: mov [edx+00000004h], eax
  loc_00569AEA: mov eax, var_14C
  loc_00569AF0: mov [edx+00000008h], eax
  loc_00569AF3: mov eax, var_C8
  loc_00569AF9: mov [edx+0000000Ch], eax
  loc_00569AFC: mov edx, esp
  loc_00569AFE: mov eax, 00000003h
  loc_00569B03: push 00000002h
  loc_00569B05: mov [edx], eax
  loc_00569B07: mov eax, var_F0
  loc_00569B0D: push 00000041h
  loc_00569B0F: push edi
  loc_00569B10: mov [edx+00000004h], eax
  loc_00569B13: mov [edx+00000008h], ecx
  loc_00569B16: mov ecx, var_E8
  loc_00569B1C: mov [edx+0000000Ch], ecx
  loc_00569B1F: mov edx, [edi]
  loc_00569B21: call [edx+00000340h]
  loc_00569B27: push eax
  loc_00569B28: lea eax, var_20
  loc_00569B2B: push eax
  loc_00569B2C: call ebx
  loc_00569B2E: lea ecx, var_64
  loc_00569B31: push eax
  loc_00569B32: push ecx
  loc_00569B33: call [00401140h] ; __vbaLateIdCallLd
  loc_00569B39: add esp, 00000030h
  loc_00569B3C: push eax
  loc_00569B3D: call [00401028h] ; __vbaStrVarMove
  loc_00569B43: mov var_6C, eax
  loc_00569B46: lea edx, var_74
  loc_00569B49: lea eax, var_84
  loc_00569B4F: mov ebx, 00000008h
  loc_00569B54: push edx
  loc_00569B55: push eax
  loc_00569B56: mov var_74, ebx
  loc_00569B59: call [004010D4h] ; rtcTrimVar
  loc_00569B5F: mov edx, [0061A13Ch]
  loc_00569B65: mov eax, 80020004h
  loc_00569B6A: mov ecx, 0000000Ah
  loc_00569B6F: mov var_12C, eax
  loc_00569B75: mov var_134, ecx
  loc_00569B7B: mov var_AC, 00428FA8h ; "Select * from LGDetail WHERE OnCount='"
  loc_00569B85: mov var_B4, ebx
  loc_00569B8B: mov var_BC, 00428F8Ch ; "' and SrNo="
  loc_00569B95: mov var_C4, ebx
  loc_00569B9B: mov ebx, [edx]
  loc_00569B9D: lea edx, var_24
  loc_00569BA0: mov var_124, ecx
  loc_00569BA6: push edx
  loc_00569BA7: mov var_11C, eax
  loc_00569BAD: sub esp, 00000010h
  loc_00569BB0: mov edx, esp
  loc_00569BB2: mov [edx], ecx
  loc_00569BB4: mov ecx, var_130
  loc_00569BBA: mov [edx+00000004h], ecx
  loc_00569BBD: sub esp, 00000010h
  loc_00569BC0: mov ecx, esp
  loc_00569BC2: sub esp, 00000010h
  loc_00569BC5: mov [edx+00000008h], eax
  loc_00569BC8: mov eax, var_128
  loc_00569BCE: mov [edx+0000000Ch], eax
  loc_00569BD1: mov edx, var_124
  loc_00569BD7: mov eax, var_120
  loc_00569BDD: mov [ecx], edx
  loc_00569BDF: mov edx, var_11C
  loc_00569BE5: mov [ecx+00000004h], eax
  loc_00569BE8: mov eax, var_118
  loc_00569BEE: mov [ecx+00000008h], edx
  loc_00569BF1: mov edx, var_110
  loc_00569BF7: mov [ecx+0000000Ch], eax
  loc_00569BFA: mov ecx, esp
  loc_00569BFC: mov eax, 00000003h
  loc_00569C01: mov [ecx], eax
  loc_00569C03: mov eax, 00000002h
  loc_00569C08: mov [ecx+00000004h], edx
  loc_00569C0B: lea edx, var_34
  loc_00569C0E: mov [ecx+00000008h], eax
  loc_00569C11: mov eax, var_108
  loc_00569C17: mov [ecx+0000000Ch], eax
  loc_00569C1A: lea ecx, var_B4
  loc_00569C20: push ecx
  loc_00569C21: lea eax, var_44
  loc_00569C24: push edx
  loc_00569C25: push eax
  loc_00569C26: call [004011B4h] ; __vbaVarCat
  loc_00569C2C: lea ecx, var_C4
  loc_00569C32: push eax
  loc_00569C33: lea edx, var_54
  loc_00569C36: push ecx
  loc_00569C37: push edx
  loc_00569C38: call [004011B4h] ; __vbaVarCat
  loc_00569C3E: push eax
  loc_00569C3F: lea eax, var_84
  loc_00569C45: lea ecx, var_94
  loc_00569C4B: push eax
  loc_00569C4C: push ecx
  loc_00569C4D: call [004011B4h] ; __vbaVarCat
  loc_00569C53: lea edx, var_18
  loc_00569C56: push eax
  loc_00569C57: push edx
  loc_00569C58: call [004011B0h] ; __vbaStrVarVal
  loc_00569C5E: push eax
  loc_00569C5F: mov eax, [0061A13Ch]
  loc_00569C64: push eax
  loc_00569C65: call [ebx+000000BCh]
  loc_00569C6B: test eax, eax
  loc_00569C6D: fnclex
  loc_00569C6F: jge 00569C89h
  loc_00569C71: mov ecx, [0061A13Ch]
  loc_00569C77: push 000000BCh
  loc_00569C7C: push 0041E928h
  loc_00569C81: push ecx
  loc_00569C82: push eax
  loc_00569C83: call [00401074h] ; __vbaHresultCheckObj
  loc_00569C89: mov edx, var_24
  loc_00569C8C: push edx
  loc_00569C8D: push esi
  loc_00569C8E: call [004010B8h] ; __vbaObjSetAddref
  loc_00569C94: lea ecx, var_18
  loc_00569C97: call [004012ACh] ; __vbaFreeStr
  loc_00569C9D: lea eax, var_24
  loc_00569CA0: lea ecx, var_20
  loc_00569CA3: push eax
  loc_00569CA4: push ecx
  loc_00569CA5: push 00000002h
  loc_00569CA7: call [00401040h] ; __vbaFreeObjList
  loc_00569CAD: lea edx, var_94
  loc_00569CB3: lea eax, var_84
  loc_00569CB9: push edx
  loc_00569CBA: lea ecx, var_54
  loc_00569CBD: push eax
  loc_00569CBE: lea edx, var_74
  loc_00569CC1: push ecx
  loc_00569CC2: lea eax, var_64
  loc_00569CC5: push edx
  loc_00569CC6: lea ecx, var_44
  loc_00569CC9: push eax
  loc_00569CCA: lea edx, var_34
  loc_00569CCD: push ecx
  loc_00569CCE: push edx
  loc_00569CCF: push 00000007h
  loc_00569CD1: call [00401038h] ; __vbaFreeVarList
  loc_00569CD7: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00569CDD: add esp, 0000002Ch
  loc_00569CE0: mov eax, [esi]
  loc_00569CE2: lea edx, var_138
  loc_00569CE8: push edx
  loc_00569CE9: push eax
  loc_00569CEA: mov ecx, [eax]
  loc_00569CEC: call [ecx+00000034h]
  loc_00569CEF: test eax, eax
  loc_00569CF1: fnclex
  loc_00569CF3: jge 00569D06h
  loc_00569CF5: mov ecx, [esi]
  loc_00569CF7: push 00000034h
  loc_00569CF9: push 0041E938h
  loc_00569CFE: push ecx
  loc_00569CFF: push eax
  loc_00569D00: call [00401074h] ; __vbaHresultCheckObj
  loc_00569D06: mov eax, [esi]
  loc_00569D08: cmp var_138, 0000h
  loc_00569D10: push eax
  loc_00569D11: mov edx, [eax]
  loc_00569D13: jnz 00569ED9h
  loc_00569D19: call [edx+000000D0h]
  loc_00569D1F: test eax, eax
  loc_00569D21: fnclex
  loc_00569D23: jge 00569D39h
  loc_00569D25: mov ecx, [esi]
  loc_00569D27: push 000000D0h
  loc_00569D2C: push 0041E938h
  loc_00569D31: push ecx
  loc_00569D32: push eax
  loc_00569D33: call [00401074h] ; __vbaHresultCheckObj
  loc_00569D39: movsx eax, var_14
  loc_00569D3D: sub esp, 00000010h
  loc_00569D40: mov ecx, 00000003h
  loc_00569D45: mov edx, esp
  loc_00569D47: mov var_A4, ecx
  loc_00569D4D: mov var_C4, ecx
  loc_00569D53: mov var_9C, eax
  loc_00569D59: mov [edx], ecx
  loc_00569D5B: mov ecx, var_A0
  loc_00569D61: sub esp, 00000010h
  loc_00569D64: mov var_BC, 00000001h
  loc_00569D6E: mov [edx+00000004h], ecx
  loc_00569D71: mov ecx, esp
  loc_00569D73: push 00000002h
  loc_00569D75: push 00000041h
  loc_00569D77: mov [edx+00000008h], eax
  loc_00569D7A: mov eax, var_98
  loc_00569D80: push edi
  loc_00569D81: mov [edx+0000000Ch], eax
  loc_00569D84: mov edx, var_C4
  loc_00569D8A: mov eax, var_C0
  loc_00569D90: mov [ecx], edx
  loc_00569D92: mov edx, var_BC
  loc_00569D98: mov [ecx+00000004h], eax
  loc_00569D9B: mov eax, var_B8
  loc_00569DA1: mov [ecx+00000008h], edx
  loc_00569DA4: mov [ecx+0000000Ch], eax
  loc_00569DA7: mov ecx, [edi]
  loc_00569DA9: call [ecx+00000340h]
  loc_00569DAF: lea edx, var_20
  loc_00569DB2: push eax
  loc_00569DB3: push edx
  loc_00569DB4: call ebx
  loc_00569DB6: push eax
  loc_00569DB7: lea eax, var_34
  loc_00569DBA: push eax
  loc_00569DBB: call [00401140h] ; __vbaLateIdCallLd
  loc_00569DC1: add esp, 00000030h
  loc_00569DC4: push eax
  loc_00569DC5: call [00401028h] ; __vbaStrVarMove
  loc_00569DCB: lea ecx, var_44
  loc_00569DCE: lea edx, var_54
  loc_00569DD1: push ecx
  loc_00569DD2: push edx
  loc_00569DD3: mov var_3C, eax
  loc_00569DD6: mov var_44, 00000008h
  loc_00569DDD: call [004010D4h] ; rtcTrimVar
  loc_00569DE3: mov eax, [esi]
  loc_00569DE5: sub esp, 00000010h
  loc_00569DE8: mov var_DC, 0041EB18h ; "AgentName"
  loc_00569DF2: mov var_E4, 00000008h
  loc_00569DFC: mov ecx, [eax]
  loc_00569DFE: mov eax, var_54
  loc_00569E01: mov edx, esp
  loc_00569E03: sub esp, 00000010h
  loc_00569E06: mov [edx], eax
  loc_00569E08: mov eax, var_50
  loc_00569E0B: mov [edx+00000004h], eax
  loc_00569E0E: mov eax, var_4C
  loc_00569E11: mov [edx+00000008h], eax
  loc_00569E14: mov eax, var_48
  loc_00569E17: mov [edx+0000000Ch], eax
  loc_00569E1A: mov eax, var_E4
  loc_00569E20: mov edx, esp
  loc_00569E22: mov [edx], eax
  loc_00569E24: mov eax, var_E0
  loc_00569E2A: mov [edx+00000004h], eax
  loc_00569E2D: mov eax, var_DC
  loc_00569E33: mov [edx+00000008h], eax
  loc_00569E36: mov eax, var_D8
  loc_00569E3C: mov [edx+0000000Ch], eax
  loc_00569E3F: mov eax, [esi]
  loc_00569E41: push eax
  loc_00569E42: call [ecx+00000128h]
  loc_00569E48: test eax, eax
  loc_00569E4A: fnclex
  loc_00569E4C: jge 00569E62h
  loc_00569E4E: mov ecx, [esi]
  loc_00569E50: push 00000128h
  loc_00569E55: push 0041E938h
  loc_00569E5A: push ecx
  loc_00569E5B: push eax
  loc_00569E5C: call [00401074h] ; __vbaHresultCheckObj
  loc_00569E62: lea ecx, var_20
  loc_00569E65: call [004012B0h] ; __vbaFreeObj
  loc_00569E6B: lea edx, var_54
  loc_00569E6E: lea eax, var_44
  loc_00569E71: push edx
  loc_00569E72: lea ecx, var_34
  loc_00569E75: push eax
  loc_00569E76: push ecx
  loc_00569E77: push 00000003h
  loc_00569E79: call [00401038h] ; __vbaFreeVarList
  loc_00569E7F: mov eax, [esi]
  loc_00569E81: add esp, 00000010h
  loc_00569E84: mov edx, [eax]
  loc_00569E86: push 00000000h
  loc_00569E88: push 00000001h
  loc_00569E8A: push eax
  loc_00569E8B: call [edx+00000164h]
  loc_00569E91: test eax, eax
  loc_00569E93: fnclex
  loc_00569E95: jge 00569EABh
  loc_00569E97: mov ecx, [esi]
  loc_00569E99: push 00000164h
  loc_00569E9E: push 0041E938h
  loc_00569EA3: push ecx
  loc_00569EA4: push eax
  loc_00569EA5: call [00401074h] ; __vbaHresultCheckObj
  loc_00569EAB: mov eax, [esi]
  loc_00569EAD: push eax
  loc_00569EAE: mov edx, [eax]
  loc_00569EB0: call [edx+000000ECh]
  loc_00569EB6: test eax, eax
  loc_00569EB8: fnclex
  loc_00569EBA: jge 00569CE0h
  loc_00569EC0: mov ecx, [esi]
  loc_00569EC2: push 000000ECh
  loc_00569EC7: push 0041E938h
  loc_00569ECC: push ecx
  loc_00569ECD: push eax
  loc_00569ECE: call [00401074h] ; __vbaHresultCheckObj
  loc_00569ED4: jmp 00569CE0h
  loc_00569ED9: call [edx+000000C4h]
  loc_00569EDF: test eax, eax
  loc_00569EE1: fnclex
  loc_00569EE3: jge 00569EF9h
  loc_00569EE5: mov ecx, [esi]
  loc_00569EE7: push 000000C4h
  loc_00569EEC: push 0041E938h
  loc_00569EF1: push ecx
  loc_00569EF2: push eax
  loc_00569EF3: call [00401074h] ; __vbaHresultCheckObj
  loc_00569EF9: push 0041E938h
  loc_00569EFE: push 00000000h
  loc_00569F00: call [00401274h] ; __vbaCastObj
  loc_00569F06: lea edx, var_20
  loc_00569F09: push eax
  loc_00569F0A: push edx
  loc_00569F0B: call ebx
  loc_00569F0D: push eax
  loc_00569F0E: push esi
  loc_00569F0F: call [004010B8h] ; __vbaObjSetAddref
  loc_00569F15: lea ecx, var_20
  loc_00569F18: call [004012B0h] ; __vbaFreeObj
  loc_00569F1E: mov eax, 00000001h
  loc_00569F23: add ax, var_14
  loc_00569F27: jo 0056A0DFh
  loc_00569F2D: mov var_14, eax
  loc_00569F30: xor esi, esi
  loc_00569F32: jmp 0056960Fh
  loc_00569F37: mov ecx, 0000000Ah
  loc_00569F3C: mov eax, 80020004h
  loc_00569F41: mov var_64, ecx
  loc_00569F44: mov var_54, ecx
  loc_00569F47: mov var_44, ecx
  loc_00569F4A: lea edx, var_A4
  loc_00569F50: lea ecx, var_34
  loc_00569F53: mov var_5C, eax
  loc_00569F56: mov var_4C, eax
  loc_00569F59: mov var_3C, eax
  loc_00569F5C: mov var_9C, 0042906Ch ; "Edit Successfully."
  loc_00569F66: mov var_A4, 00000008h
  loc_00569F70: call [00401240h] ; __vbaVarDup
  loc_00569F76: lea eax, var_64
  loc_00569F79: lea ecx, var_54
  loc_00569F7C: push eax
  loc_00569F7D: lea edx, var_44
  loc_00569F80: push ecx
  loc_00569F81: push edx
  loc_00569F82: lea eax, var_34
  loc_00569F85: push 00000040h
  loc_00569F87: push eax
  loc_00569F88: call [004010A4h] ; rtcMsgBox
  loc_00569F8E: lea ecx, var_64
  loc_00569F91: lea edx, var_54
  loc_00569F94: push ecx
  loc_00569F95: lea eax, var_44
  loc_00569F98: push edx
  loc_00569F99: lea ecx, var_34
  loc_00569F9C: push eax
  loc_00569F9D: push ecx
  loc_00569F9E: push 00000004h
  loc_00569FA0: call [00401038h] ; __vbaFreeVarList
  loc_00569FA6: mov edx, [edi]
  loc_00569FA8: add esp, 00000014h
  loc_00569FAB: lea eax, var_34
  loc_00569FAE: lea ecx, var_138
  loc_00569FB4: push eax
  loc_00569FB5: push ecx
  loc_00569FB6: push edi
  loc_00569FB7: mov var_138, FFFFFFFFh
  loc_00569FC1: call [edx+000006FCh]
  loc_00569FC7: mov ebx, [00401020h] ; __vbaFreeVar
  loc_00569FCD: lea ecx, var_34
  loc_00569FD0: call ebx
  loc_00569FD2: mov edx, [edi]
  loc_00569FD4: lea eax, var_34
  loc_00569FD7: lea ecx, var_138
  loc_00569FDD: push eax
  loc_00569FDE: push ecx
  loc_00569FDF: push edi
  loc_00569FE0: mov var_138, esi
  loc_00569FE6: call [edx+000006F8h]
  loc_00569FEC: lea ecx, var_34
  loc_00569FEF: call ebx
  loc_00569FF1: fwait
  loc_00569FF2: push 0056A0C5h
  loc_00569FF7: jmp 0056A0C4h
  loc_00569FFC: mov ecx, 80020004h
  loc_0056A001: mov eax, 0000000Ah
  loc_0056A006: mov var_5C, ecx
  loc_0056A009: mov var_4C, ecx
  loc_0056A00C: mov var_3C, ecx
  loc_0056A00F: lea edx, var_A4
  loc_0056A015: lea ecx, var_34
  loc_0056A018: mov var_64, eax
  loc_0056A01B: mov var_54, eax
  loc_0056A01E: mov var_44, eax
  loc_0056A021: mov var_9C, 00429098h ; "Cann't Edit Successfully."
  loc_0056A02B: mov var_A4, 00000008h
  loc_0056A035: call [00401240h] ; __vbaVarDup
  loc_0056A03B: lea edx, var_64
  loc_0056A03E: lea eax, var_54
  loc_0056A041: push edx
  loc_0056A042: lea ecx, var_44
  loc_0056A045: push eax
  loc_0056A046: push ecx
  loc_0056A047: lea edx, var_34
  loc_0056A04A: push 00000010h
  loc_0056A04C: push edx
  loc_0056A04D: call [004010A4h] ; rtcMsgBox
  loc_0056A053: lea eax, var_64
  loc_0056A056: lea ecx, var_54
  loc_0056A059: push eax
  loc_0056A05A: lea edx, var_44
  loc_0056A05D: push ecx
  loc_0056A05E: lea eax, var_34
  loc_0056A061: push edx
  loc_0056A062: push eax
  loc_0056A063: push 00000004h
  loc_0056A065: call [00401038h] ; __vbaFreeVarList
  loc_0056A06B: add esp, 00000014h
  loc_0056A06E: fwait
  loc_0056A06F: push 0056A0C5h
  loc_0056A074: jmp 0056A0C4h
  loc_0056A076: lea ecx, var_1C
  loc_0056A079: lea edx, var_18
  loc_0056A07C: push ecx
  loc_0056A07D: push edx
  loc_0056A07E: push 00000002h
  loc_0056A080: call [004011FCh] ; __vbaFreeStrList
  loc_0056A086: lea eax, var_24
  loc_0056A089: lea ecx, var_20
  loc_0056A08C: push eax
  loc_0056A08D: push ecx
  loc_0056A08E: push 00000002h
  loc_0056A090: call [00401040h] ; __vbaFreeObjList
  loc_0056A096: lea edx, var_94
  loc_0056A09C: lea eax, var_84
  loc_0056A0A2: push edx
  loc_0056A0A3: lea ecx, var_74
  loc_0056A0A6: push eax
  loc_0056A0A7: lea edx, var_64
  loc_0056A0AA: push ecx
  loc_0056A0AB: lea eax, var_54
  loc_0056A0AE: push edx
  loc_0056A0AF: lea ecx, var_44
  loc_0056A0B2: push eax
  loc_0056A0B3: lea edx, var_34
  loc_0056A0B6: push ecx
  loc_0056A0B7: push edx
  loc_0056A0B8: push 00000007h
  loc_0056A0BA: call [00401038h] ; __vbaFreeVarList
  loc_0056A0C0: add esp, 00000038h
  loc_0056A0C3: ret
  loc_0056A0C4: ret
  loc_0056A0C5: mov ecx, var_10
  loc_0056A0C8: pop edi
  loc_0056A0C9: pop esi
  loc_0056A0CA: xor eax, eax
  loc_0056A0CC: mov fs:[00000000h], ecx
  loc_0056A0D3: pop ebx
  loc_0056A0D4: mov esp, ebp
  loc_0056A0D6: pop ebp
  loc_0056A0D7: retn 0004h
End Sub
