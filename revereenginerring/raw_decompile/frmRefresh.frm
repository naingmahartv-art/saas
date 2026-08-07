VERSION 5.00
Begin VB.Form frmRefresh
  Caption = "Network User Setting"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ControlBox = 0   'False
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 5310
  ClientHeight = 3180
  StartUpPosition = 2 'CenterScreen
  Begin VB.ComboBox cboOver
    Style = 2
    Left = 3375
    Top = 1935
    Width = 780
    Height = 315
    TabIndex = 8
  End
  Begin VB.ComboBox cboNotSale
    Style = 2
    Left = 3375
    Top = 1425
    Width = 780
    Height = 315
    TabIndex = 6
  End
  Begin VB.ComboBox cboHotKey
    Style = 2
    Left = 3375
    Top = 960
    Width = 780
    Height = 315
    TabIndex = 4
  End
  Begin VB.ComboBox cboRefresh
    Style = 2
    Left = 3375
    Top = 495
    Width = 780
    Height = 315
    TabIndex = 2
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2745
    Top = 2565
    Width = 825
    Height = 375
    TabIndex = 1
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 1905
    Top = 2565
    Width = 825
    Height = 375
    TabIndex = 0
  End
  Begin VB.Line Line3
    X1 = 495
    Y1 = 1845
    X2 = 4635
    Y2 = 1845
  End
  Begin VB.Line Line2
    X1 = 495
    Y1 = 1350
    X2 = 4635
    Y2 = 1350
  End
  Begin VB.Line Line1
    X1 = 495
    Y1 = 855
    X2 = 4635
    Y2 = 855
  End
  Begin VB.Shape Shape1
    Left = 495
    Top = 360
    Width = 4155
    Height = 1950
  End
  Begin VB.Label Label4
    Caption = "SaleAmount Over Alarm"
    Left = 900
    Top = 1965
    Width = 2445
    Height = 195
    TabIndex = 9
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
    Caption = "Not Sale Alarm"
    Left = 900
    Top = 1500
    Width = 2445
    Height = 195
    TabIndex = 7
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
  Begin VB.Label Label2
    Caption = "Hot Key Alarm "
    Left = 900
    Top = 1020
    Width = 2445
    Height = 195
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
  Begin VB.Label Label1
    Caption = "All data Refresh everytime ?"
    Left = 900
    Top = 540
    Width = 2445
    Height = 195
    TabIndex = 3
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
End

Attribute VB_Name = "frmRefresh"


Private Sub Form_Load() '4B0100
  loc_004B0100: push ebp
  loc_004B0101: mov ebp, esp
  loc_004B0103: sub esp, 0000000Ch
  loc_004B0106: push 00403B36h ; __vbaExceptHandler
  loc_004B010B: mov eax, fs:[00000000h]
  loc_004B0111: push eax
  loc_004B0112: mov fs:[00000000h], esp
  loc_004B0119: sub esp, 000000F4h
  loc_004B011F: push ebx
  loc_004B0120: push esi
  loc_004B0121: push edi
  loc_004B0122: mov var_C, esp
  loc_004B0125: mov var_8, 00401B48h
  loc_004B012C: mov esi, Me
  loc_004B012F: mov eax, esi
  loc_004B0131: and eax, 00000001h
  loc_004B0134: mov var_4, eax
  loc_004B0137: and esi, FFFFFFFEh
  loc_004B013A: push esi
  loc_004B013B: mov Me, esi
  loc_004B013E: mov ecx, [esi]
  loc_004B0140: call [ecx+00000004h]
  loc_004B0143: mov edx, [esi]
  loc_004B0145: xor eax, eax
  loc_004B0147: push esi
  loc_004B0148: mov var_18, eax
  loc_004B014B: mov var_1C, eax
  loc_004B014E: mov var_20, eax
  loc_004B0151: mov var_24, eax
  loc_004B0154: mov var_28, eax
  loc_004B0157: mov var_2C, eax
  loc_004B015A: mov var_3C, eax
  loc_004B015D: mov var_4C, eax
  loc_004B0160: mov var_5C, eax
  loc_004B0163: mov var_6C, eax
  loc_004B0166: mov var_8C, eax
  loc_004B016C: mov var_9C, eax
  loc_004B0172: mov var_A0, eax
  loc_004B0178: mov var_A4, eax
  loc_004B017E: call [edx+00000308h]
  loc_004B0184: push eax
  loc_004B0185: lea eax, var_24
  loc_004B0188: push eax
  loc_004B0189: call [004010A0h] ; __vbaObjSet
  loc_004B018F: sub esp, 00000010h
  loc_004B0192: mov ebx, [eax]
  loc_004B0194: mov edi, esp
  loc_004B0196: mov edx, 0000000Ah
  loc_004B019B: mov ecx, 80020004h
  loc_004B01A0: mov var_E0, ebx
  loc_004B01A6: mov [edi], edx
  loc_004B01A8: mov ebx, var_70
  loc_004B01AB: mov var_DC, edi
  loc_004B01B1: mov edi, var_78
  loc_004B01B4: mov edx, esp
  loc_004B01B6: push 004244C0h ; "Yes"
  loc_004B01BB: mov var_A8, eax
  loc_004B01C1: push eax
  loc_004B01C2: mov eax, var_E0
  loc_004B01C8: mov [edx+00000004h], edi
  loc_004B01CB: mov [edx+00000008h], ecx
  loc_004B01CE: mov [edx+0000000Ch], ebx
  loc_004B01D1: call [eax+000001ECh]
  loc_004B01D7: test eax, eax
  loc_004B01D9: fnclex
  loc_004B01DB: jge 004B01F5h
  loc_004B01DD: mov ecx, var_A8
  loc_004B01E3: push 000001ECh
  loc_004B01E8: push 0041F844h
  loc_004B01ED: push ecx
  loc_004B01EE: push eax
  loc_004B01EF: call [00401074h] ; __vbaHresultCheckObj
  loc_004B01F5: lea ecx, var_24
  loc_004B01F8: call [004012B0h] ; __vbaFreeObj
  loc_004B01FE: mov edx, [esi]
  loc_004B0200: push esi
  loc_004B0201: call [edx+00000308h]
  loc_004B0207: push eax
  loc_004B0208: lea eax, var_24
  loc_004B020B: push eax
  loc_004B020C: call [004010A0h] ; __vbaObjSet
  loc_004B0212: mov edx, [eax]
  loc_004B0214: sub esp, 00000010h
  loc_004B0217: mov var_E4, edx
  loc_004B021D: mov edx, esp
  loc_004B021F: mov ecx, 0000000Ah
  loc_004B0224: mov var_A8, eax
  loc_004B022A: mov [edx], ecx
  loc_004B022C: mov ecx, var_E4
  loc_004B0232: mov eax, 80020004h
  loc_004B0237: push 0042457Ch ; "No"
  loc_004B023C: mov [edx+00000004h], edi
  loc_004B023F: mov [edx+00000008h], eax
  loc_004B0242: mov eax, var_A8
  loc_004B0248: push eax
  loc_004B0249: mov [edx+0000000Ch], ebx
  loc_004B024C: call [ecx+000001ECh]
  loc_004B0252: test eax, eax
  loc_004B0254: fnclex
  loc_004B0256: jge 004B0270h
  loc_004B0258: mov edx, var_A8
  loc_004B025E: push 000001ECh
  loc_004B0263: push 0041F844h
  loc_004B0268: push edx
  loc_004B0269: push eax
  loc_004B026A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0270: lea ecx, var_24
  loc_004B0273: call [004012B0h] ; __vbaFreeObj
  loc_004B0279: mov eax, [esi]
  loc_004B027B: push esi
  loc_004B027C: call [eax+00000304h]
  loc_004B0282: lea ecx, var_24
  loc_004B0285: push eax
  loc_004B0286: push ecx
  loc_004B0287: call [004010A0h] ; __vbaObjSet
  loc_004B028D: mov edx, [eax]
  loc_004B028F: sub esp, 00000010h
  loc_004B0292: mov var_E8, edx
  loc_004B0298: mov edx, esp
  loc_004B029A: mov ecx, 0000000Ah
  loc_004B029F: mov var_A8, eax
  loc_004B02A5: mov [edx], ecx
  loc_004B02A7: mov ecx, var_E8
  loc_004B02AD: mov eax, 80020004h
  loc_004B02B2: push 004244C0h ; "Yes"
  loc_004B02B7: mov [edx+00000004h], edi
  loc_004B02BA: mov [edx+00000008h], eax
  loc_004B02BD: mov eax, var_A8
  loc_004B02C3: push eax
  loc_004B02C4: mov [edx+0000000Ch], ebx
  loc_004B02C7: call [ecx+000001ECh]
  loc_004B02CD: test eax, eax
  loc_004B02CF: fnclex
  loc_004B02D1: jge 004B02EBh
  loc_004B02D3: mov edx, var_A8
  loc_004B02D9: push 000001ECh
  loc_004B02DE: push 0041F844h
  loc_004B02E3: push edx
  loc_004B02E4: push eax
  loc_004B02E5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B02EB: lea ecx, var_24
  loc_004B02EE: call [004012B0h] ; __vbaFreeObj
  loc_004B02F4: mov eax, [esi]
  loc_004B02F6: push esi
  loc_004B02F7: call [eax+00000304h]
  loc_004B02FD: lea ecx, var_24
  loc_004B0300: push eax
  loc_004B0301: push ecx
  loc_004B0302: call [004010A0h] ; __vbaObjSet
  loc_004B0308: mov edx, [eax]
  loc_004B030A: sub esp, 00000010h
  loc_004B030D: mov var_EC, edx
  loc_004B0313: mov edx, esp
  loc_004B0315: mov ecx, 0000000Ah
  loc_004B031A: mov var_A8, eax
  loc_004B0320: mov [edx], ecx
  loc_004B0322: mov ecx, var_EC
  loc_004B0328: mov eax, 80020004h
  loc_004B032D: push 0042457Ch ; "No"
  loc_004B0332: mov [edx+00000004h], edi
  loc_004B0335: mov [edx+00000008h], eax
  loc_004B0338: mov eax, var_A8
  loc_004B033E: push eax
  loc_004B033F: mov [edx+0000000Ch], ebx
  loc_004B0342: call [ecx+000001ECh]
  loc_004B0348: test eax, eax
  loc_004B034A: fnclex
  loc_004B034C: jge 004B0366h
  loc_004B034E: mov edx, var_A8
  loc_004B0354: push 000001ECh
  loc_004B0359: push 0041F844h
  loc_004B035E: push edx
  loc_004B035F: push eax
  loc_004B0360: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0366: lea ecx, var_24
  loc_004B0369: call [004012B0h] ; __vbaFreeObj
  loc_004B036F: mov eax, [esi]
  loc_004B0371: push esi
  loc_004B0372: call [eax+00000300h]
  loc_004B0378: lea ecx, var_24
  loc_004B037B: push eax
  loc_004B037C: push ecx
  loc_004B037D: call [004010A0h] ; __vbaObjSet
  loc_004B0383: mov edx, [eax]
  loc_004B0385: sub esp, 00000010h
  loc_004B0388: mov var_F0, edx
  loc_004B038E: mov edx, esp
  loc_004B0390: mov ecx, 0000000Ah
  loc_004B0395: mov var_A8, eax
  loc_004B039B: mov [edx], ecx
  loc_004B039D: mov ecx, var_F0
  loc_004B03A3: mov eax, 80020004h
  loc_004B03A8: push 004244C0h ; "Yes"
  loc_004B03AD: mov [edx+00000004h], edi
  loc_004B03B0: mov [edx+00000008h], eax
  loc_004B03B3: mov eax, var_A8
  loc_004B03B9: push eax
  loc_004B03BA: mov [edx+0000000Ch], ebx
  loc_004B03BD: call [ecx+000001ECh]
  loc_004B03C3: test eax, eax
  loc_004B03C5: fnclex
  loc_004B03C7: jge 004B03E1h
  loc_004B03C9: mov edx, var_A8
  loc_004B03CF: push 000001ECh
  loc_004B03D4: push 0041F844h
  loc_004B03D9: push edx
  loc_004B03DA: push eax
  loc_004B03DB: call [00401074h] ; __vbaHresultCheckObj
  loc_004B03E1: lea ecx, var_24
  loc_004B03E4: call [004012B0h] ; __vbaFreeObj
  loc_004B03EA: mov eax, [esi]
  loc_004B03EC: push esi
  loc_004B03ED: call [eax+00000300h]
  loc_004B03F3: lea ecx, var_24
  loc_004B03F6: push eax
  loc_004B03F7: push ecx
  loc_004B03F8: call [004010A0h] ; __vbaObjSet
  loc_004B03FE: mov edx, [eax]
  loc_004B0400: sub esp, 00000010h
  loc_004B0403: mov var_F4, edx
  loc_004B0409: mov edx, esp
  loc_004B040B: mov ecx, 0000000Ah
  loc_004B0410: mov var_A8, eax
  loc_004B0416: mov [edx], ecx
  loc_004B0418: mov ecx, var_F4
  loc_004B041E: mov eax, 80020004h
  loc_004B0423: push 0042457Ch ; "No"
  loc_004B0428: mov [edx+00000004h], edi
  loc_004B042B: mov [edx+00000008h], eax
  loc_004B042E: mov eax, var_A8
  loc_004B0434: push eax
  loc_004B0435: mov [edx+0000000Ch], ebx
  loc_004B0438: call [ecx+000001ECh]
  loc_004B043E: test eax, eax
  loc_004B0440: fnclex
  loc_004B0442: jge 004B045Ch
  loc_004B0444: mov edx, var_A8
  loc_004B044A: push 000001ECh
  loc_004B044F: push 0041F844h
  loc_004B0454: push edx
  loc_004B0455: push eax
  loc_004B0456: call [00401074h] ; __vbaHresultCheckObj
  loc_004B045C: lea ecx, var_24
  loc_004B045F: call [004012B0h] ; __vbaFreeObj
  loc_004B0465: mov eax, [esi]
  loc_004B0467: push esi
  loc_004B0468: call [eax+000002FCh]
  loc_004B046E: lea ecx, var_24
  loc_004B0471: push eax
  loc_004B0472: push ecx
  loc_004B0473: call [004010A0h] ; __vbaObjSet
  loc_004B0479: mov edx, [eax]
  loc_004B047B: sub esp, 00000010h
  loc_004B047E: mov var_F8, edx
  loc_004B0484: mov edx, esp
  loc_004B0486: mov ecx, 0000000Ah
  loc_004B048B: mov var_A8, eax
  loc_004B0491: mov [edx], ecx
  loc_004B0493: mov ecx, var_F8
  loc_004B0499: mov eax, 80020004h
  loc_004B049E: push 004244C0h ; "Yes"
  loc_004B04A3: mov [edx+00000004h], edi
  loc_004B04A6: mov [edx+00000008h], eax
  loc_004B04A9: mov eax, var_A8
  loc_004B04AF: push eax
  loc_004B04B0: mov [edx+0000000Ch], ebx
  loc_004B04B3: call [ecx+000001ECh]
  loc_004B04B9: test eax, eax
  loc_004B04BB: fnclex
  loc_004B04BD: jge 004B04D7h
  loc_004B04BF: mov edx, var_A8
  loc_004B04C5: push 000001ECh
  loc_004B04CA: push 0041F844h
  loc_004B04CF: push edx
  loc_004B04D0: push eax
  loc_004B04D1: call [00401074h] ; __vbaHresultCheckObj
  loc_004B04D7: lea ecx, var_24
  loc_004B04DA: call [004012B0h] ; __vbaFreeObj
  loc_004B04E0: mov eax, [esi]
  loc_004B04E2: push esi
  loc_004B04E3: call [eax+000002FCh]
  loc_004B04E9: lea ecx, var_24
  loc_004B04EC: push eax
  loc_004B04ED: push ecx
  loc_004B04EE: call [004010A0h] ; __vbaObjSet
  loc_004B04F4: mov edx, [eax]
  loc_004B04F6: sub esp, 00000010h
  loc_004B04F9: mov var_A8, eax
  loc_004B04FF: mov eax, esp
  loc_004B0501: mov ecx, 0000000Ah
  loc_004B0506: mov var_74, 80020004h
  loc_004B050D: mov [eax], ecx
  loc_004B050F: mov ecx, var_74
  loc_004B0512: push 0042457Ch ; "No"
  loc_004B0517: mov [eax+00000004h], edi
  loc_004B051A: mov [eax+00000008h], ecx
  loc_004B051D: mov [eax+0000000Ch], ebx
  loc_004B0520: mov eax, var_A8
  loc_004B0526: push eax
  loc_004B0527: call [edx+000001ECh]
  loc_004B052D: test eax, eax
  loc_004B052F: fnclex
  loc_004B0531: jge 004B054Bh
  loc_004B0533: mov ecx, var_A8
  loc_004B0539: push 000001ECh
  loc_004B053E: push 0041F844h
  loc_004B0543: push ecx
  loc_004B0544: push eax
  loc_004B0545: call [00401074h] ; __vbaHresultCheckObj
  loc_004B054B: lea ecx, var_24
  loc_004B054E: call [004012B0h] ; __vbaFreeObj
  loc_004B0554: mov eax, [0061B394h]
  loc_004B0559: test eax, eax
  loc_004B055B: jnz 004B056Dh
  loc_004B055D: push 0061B394h
  loc_004B0562: push 0041E4A0h
  loc_004B0567: call [004011DCh] ; __vbaNew2
  loc_004B056D: mov eax, [0061B394h]
  loc_004B0572: lea ecx, var_24
  loc_004B0575: push ecx
  loc_004B0576: push eax
  loc_004B0577: mov edx, [eax]
  loc_004B0579: mov var_A8, eax
  loc_004B057F: call [edx+00000014h]
  loc_004B0582: test eax, eax
  loc_004B0584: fnclex
  loc_004B0586: jge 004B059Dh
  loc_004B0588: mov edx, var_A8
  loc_004B058E: push 00000014h
  loc_004B0590: push 0041E490h
  loc_004B0595: push edx
  loc_004B0596: push eax
  loc_004B0597: call [00401074h] ; __vbaHresultCheckObj
  loc_004B059D: mov eax, var_24
  loc_004B05A0: lea edx, var_1C
  loc_004B05A3: push edx
  loc_004B05A4: push eax
  loc_004B05A5: mov ecx, [eax]
  loc_004B05A7: mov var_B0, eax
  loc_004B05AD: call [ecx+00000050h]
  loc_004B05B0: test eax, eax
  loc_004B05B2: fnclex
  loc_004B05B4: jge 004B05CBh
  loc_004B05B6: mov ecx, var_B0
  loc_004B05BC: push 00000050h
  loc_004B05BE: push 0041F3A0h
  loc_004B05C3: push ecx
  loc_004B05C4: push eax
  loc_004B05C5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B05CB: mov eax, [0061B3B4h]
  loc_004B05D0: test eax, eax
  loc_004B05D2: jnz 004B05E4h
  loc_004B05D4: push 0061B3B4h
  loc_004B05D9: push 004245F0h
  loc_004B05DE: call [004011DCh] ; __vbaNew2
  loc_004B05E4: mov eax, [0061B3B4h]
  loc_004B05E9: mov ecx, 00000008h
  loc_004B05EE: mov edx, 0000000Bh
  loc_004B05F3: mov var_94, 004245B4h ; ";pwd=DIGITSYS"
  loc_004B05FD: mov var_9C, ecx
  loc_004B0603: mov var_84, 00000000h
  loc_004B060D: mov var_8C, edx
  loc_004B0613: mov var_7C, edx
  loc_004B0616: mov edx, [eax]
  loc_004B0618: mov var_B8, eax
  loc_004B061E: lea eax, var_28
  loc_004B0621: mov var_74, 00000000h
  loc_004B0628: push eax
  loc_004B0629: mov var_FC, edx
  loc_004B062F: sub esp, 00000010h
  loc_004B0632: mov eax, esp
  loc_004B0634: sub esp, 00000010h
  loc_004B0637: mov [eax], ecx
  loc_004B0639: mov ecx, var_98
  loc_004B063F: mov [eax+00000004h], ecx
  loc_004B0642: mov ecx, var_94
  loc_004B0648: mov [eax+00000008h], ecx
  loc_004B064B: mov ecx, var_90
  loc_004B0651: mov [eax+0000000Ch], ecx
  loc_004B0654: mov ecx, var_8C
  loc_004B065A: mov eax, esp
  loc_004B065C: sub esp, 00000010h
  loc_004B065F: mov [eax], ecx
  loc_004B0661: mov ecx, var_88
  loc_004B0667: mov [eax+00000004h], ecx
  loc_004B066A: mov ecx, var_84
  loc_004B0670: mov [eax+00000008h], ecx
  loc_004B0673: mov ecx, var_80
  loc_004B0676: mov [eax+0000000Ch], ecx
  loc_004B0679: mov ecx, var_7C
  loc_004B067C: mov eax, esp
  loc_004B067E: mov [eax], ecx
  loc_004B0680: mov ecx, var_74
  loc_004B0683: mov [eax+00000004h], edi
  loc_004B0686: mov [eax+00000008h], ecx
  loc_004B0689: mov [eax+0000000Ch], ebx
  loc_004B068C: mov eax, var_1C
  loc_004B068F: push eax
  loc_004B0690: push 00424588h ; "\Data\DataPath.mdb"
  loc_004B0695: call [00401054h] ; __vbaStrCat
  loc_004B069B: mov edx, eax
  loc_004B069D: lea ecx, var_20
  loc_004B06A0: call [00401270h] ; __vbaStrMove
  loc_004B06A6: mov ebx, var_B8
  loc_004B06AC: mov ecx, var_FC
  loc_004B06B2: push eax
  loc_004B06B3: push ebx
  loc_004B06B4: call [ecx+00000058h]
  loc_004B06B7: test eax, eax
  loc_004B06B9: fnclex
  loc_004B06BB: jge 004B06CCh
  loc_004B06BD: push 00000058h
  loc_004B06BF: push 004245E0h
  loc_004B06C4: push ebx
  loc_004B06C5: push eax
  loc_004B06C6: call [00401074h] ; __vbaHresultCheckObj
  loc_004B06CC: mov edx, var_28
  loc_004B06CF: lea ebx, [esi+00000034h]
  loc_004B06D2: push edx
  loc_004B06D3: push ebx
  loc_004B06D4: call [004010B8h] ; __vbaObjSetAddref
  loc_004B06DA: lea eax, var_20
  loc_004B06DD: lea ecx, var_1C
  loc_004B06E0: push eax
  loc_004B06E1: push ecx
  loc_004B06E2: push 00000002h
  loc_004B06E4: call [004011FCh] ; __vbaFreeStrList
  loc_004B06EA: lea edx, var_28
  loc_004B06ED: lea eax, var_24
  loc_004B06F0: push edx
  loc_004B06F1: push eax
  loc_004B06F2: push 00000002h
  loc_004B06F4: call [00401040h] ; __vbaFreeObjList
  loc_004B06FA: add esp, 00000018h
  loc_004B06FD: lea edx, var_24
  loc_004B0700: mov eax, 0000000Ah
  loc_004B0705: mov ecx, 80020004h
  loc_004B070A: push edx
  loc_004B070B: mov var_9C, eax
  loc_004B0711: sub esp, 00000010h
  loc_004B0714: mov var_8C, eax
  loc_004B071A: mov edx, esp
  loc_004B071C: mov var_94, ecx
  loc_004B0722: sub esp, 00000010h
  loc_004B0725: mov var_84, ecx
  loc_004B072B: mov [edx], eax
  loc_004B072D: mov eax, var_98
  loc_004B0733: mov ecx, [ebx]
  loc_004B0735: mov [edx+00000004h], eax
  loc_004B0738: mov eax, var_94
  loc_004B073E: mov ecx, [ecx]
  loc_004B0740: mov [edx+00000008h], eax
  loc_004B0743: mov eax, var_90
  loc_004B0749: mov [edx+0000000Ch], eax
  loc_004B074C: mov eax, var_8C
  loc_004B0752: mov edx, esp
  loc_004B0754: sub esp, 00000010h
  loc_004B0757: mov [edx], eax
  loc_004B0759: mov eax, var_88
  loc_004B075F: mov [edx+00000004h], eax
  loc_004B0762: mov eax, var_84
  loc_004B0768: mov [edx+00000008h], eax
  loc_004B076B: mov eax, var_80
  loc_004B076E: mov [edx+0000000Ch], eax
  loc_004B0771: mov edx, esp
  loc_004B0773: mov eax, 00000003h
  loc_004B0778: push 00424654h ; "Refresh"
  loc_004B077D: mov [edx], eax
  loc_004B077F: mov eax, 00000004h
  loc_004B0784: mov [edx+00000004h], edi
  loc_004B0787: mov [edx+00000008h], eax
  loc_004B078A: mov eax, var_70
  loc_004B078D: mov [edx+0000000Ch], eax
  loc_004B0790: mov eax, [ebx]
  loc_004B0792: push eax
  loc_004B0793: call [ecx+000000BCh]
  loc_004B0799: test eax, eax
  loc_004B079B: fnclex
  loc_004B079D: jge 004B07B7h
  loc_004B079F: mov ecx, [ebx]
  loc_004B07A1: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B07A7: push 000000BCh
  loc_004B07AC: push 0041E928h
  loc_004B07B1: push ecx
  loc_004B07B2: push eax
  loc_004B07B3: call ebx
  loc_004B07B5: jmp 004B07BDh
  loc_004B07B7: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B07BD: mov eax, var_24
  loc_004B07C0: lea edx, var_18
  loc_004B07C3: push eax
  loc_004B07C4: push edx
  loc_004B07C5: mov var_24, 00000000h
  loc_004B07CC: call [004010A0h] ; __vbaObjSet
  loc_004B07D2: mov eax, var_18
  loc_004B07D5: lea edx, var_A0
  loc_004B07DB: push edx
  loc_004B07DC: push eax
  loc_004B07DD: mov ecx, [eax]
  loc_004B07DF: call [ecx+00000020h]
  loc_004B07E2: test eax, eax
  loc_004B07E4: fnclex
  loc_004B07E6: jge 004B07F6h
  loc_004B07E8: mov ecx, var_18
  loc_004B07EB: push 00000020h
  loc_004B07ED: push 0041E938h
  loc_004B07F2: push ecx
  loc_004B07F3: push eax
  loc_004B07F4: call ebx
  loc_004B07F6: mov eax, var_18
  loc_004B07F9: lea ecx, var_A4
  loc_004B07FF: push ecx
  loc_004B0800: push eax
  loc_004B0801: mov edx, [eax]
  loc_004B0803: call [edx+00000034h]
  loc_004B0806: test eax, eax
  loc_004B0808: fnclex
  loc_004B080A: jge 004B081Ah
  loc_004B080C: mov edx, var_18
  loc_004B080F: push 00000034h
  loc_004B0811: push 0041E938h
  loc_004B0816: push edx
  loc_004B0817: push eax
  loc_004B0818: call ebx
  loc_004B081A: xor eax, eax
  loc_004B081C: cmp var_A4, ax
  loc_004B0823: setz al
  loc_004B0826: xor ecx, ecx
  loc_004B0828: cmp var_A0, cx
  loc_004B082F: setz cl
  loc_004B0832: or eax, ecx
  loc_004B0834: jz 004B0DE3h
  loc_004B083A: mov eax, var_18
  loc_004B083D: lea ecx, var_24
  loc_004B0840: push ecx
  loc_004B0841: push eax
  loc_004B0842: mov edx, [eax]
  loc_004B0844: call [edx+000000B4h]
  loc_004B084A: test eax, eax
  loc_004B084C: fnclex
  loc_004B084E: jge 004B0861h
  loc_004B0850: mov edx, var_18
  loc_004B0853: push 000000B4h
  loc_004B0858: push 0041E938h
  loc_004B085D: push edx
  loc_004B085E: push eax
  loc_004B085F: call ebx
  loc_004B0861: lea ebx, var_28
  loc_004B0864: mov eax, var_24
  loc_004B0867: push ebx
  loc_004B0868: mov ecx, 00000008h
  loc_004B086D: sub esp, 00000010h
  loc_004B0870: mov edx, [eax]
  loc_004B0872: mov ebx, esp
  loc_004B0874: mov var_AC, eax
  loc_004B087A: push eax
  loc_004B087B: mov [ebx], ecx
  loc_004B087D: mov ecx, 00424654h ; "Refresh"
  loc_004B0882: mov [ebx+00000004h], edi
  loc_004B0885: mov [ebx+00000008h], ecx
  loc_004B0888: mov ecx, var_70
  loc_004B088B: mov [ebx+0000000Ch], ecx
  loc_004B088E: call [edx+00000030h]
  loc_004B0891: test eax, eax
  loc_004B0893: fnclex
  loc_004B0895: jge 004B08ACh
  loc_004B0897: mov edx, var_AC
  loc_004B089D: push 00000030h
  loc_004B089F: push 0041EA14h ; "S"
  loc_004B08A4: push edx
  loc_004B08A5: push eax
  loc_004B08A6: call [00401074h] ; __vbaHresultCheckObj
  loc_004B08AC: mov eax, [esi]
  loc_004B08AE: push esi
  loc_004B08AF: call [eax+00000308h]
  loc_004B08B5: lea ecx, var_2C
  loc_004B08B8: push eax
  loc_004B08B9: push ecx
  loc_004B08BA: call [004010A0h] ; __vbaObjSet
  loc_004B08C0: mov ebx, eax
  loc_004B08C2: lea edx, var_9C
  loc_004B08C8: lea ecx, var_5C
  loc_004B08CB: mov var_B4, ebx
  loc_004B08D1: mov var_94, 0042457Ch ; "No"
  loc_004B08DB: mov var_9C, 00000008h
  loc_004B08E5: call [00401240h] ; __vbaVarDup
  loc_004B08EB: lea edx, var_8C
  loc_004B08F1: lea ecx, var_4C
  loc_004B08F4: mov var_84, 004244C0h ; "Yes"
  loc_004B08FE: mov var_8C, 00000008h
  loc_004B0908: call [00401240h] ; __vbaVarDup
  loc_004B090E: mov eax, var_28
  loc_004B0911: lea edx, var_5C
  loc_004B0914: mov var_34, eax
  loc_004B0917: lea eax, var_4C
  loc_004B091A: push edx
  loc_004B091B: lea ecx, var_3C
  loc_004B091E: push eax
  loc_004B091F: lea edx, var_6C
  loc_004B0922: push ecx
  loc_004B0923: push edx
  loc_004B0924: mov var_28, 00000000h
  loc_004B092B: mov var_3C, 00000009h
  loc_004B0932: call [004011F0h] ; rtcImmediateIf
  loc_004B0938: mov ebx, [ebx]
  loc_004B093A: lea eax, var_6C
  loc_004B093D: lea ecx, var_1C
  loc_004B0940: push eax
  loc_004B0941: push ecx
  loc_004B0942: call [004011B0h] ; __vbaStrVarVal
  loc_004B0948: mov edx, ebx
  loc_004B094A: mov ebx, var_B4
  loc_004B0950: push eax
  loc_004B0951: push ebx
  loc_004B0952: call [edx+000000ACh]
  loc_004B0958: test eax, eax
  loc_004B095A: fnclex
  loc_004B095C: jge 004B0970h
  loc_004B095E: push 000000ACh
  loc_004B0963: push 0041F844h
  loc_004B0968: push ebx
  loc_004B0969: push eax
  loc_004B096A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0970: lea ecx, var_1C
  loc_004B0973: call [004012ACh] ; __vbaFreeStr
  loc_004B0979: lea eax, var_2C
  loc_004B097C: lea ecx, var_24
  loc_004B097F: push eax
  loc_004B0980: push ecx
  loc_004B0981: push 00000002h
  loc_004B0983: call [00401040h] ; __vbaFreeObjList
  loc_004B0989: lea edx, var_6C
  loc_004B098C: lea eax, var_5C
  loc_004B098F: push edx
  loc_004B0990: lea ecx, var_4C
  loc_004B0993: push eax
  loc_004B0994: lea edx, var_3C
  loc_004B0997: push ecx
  loc_004B0998: push edx
  loc_004B0999: push 00000004h
  loc_004B099B: call [00401038h] ; __vbaFreeVarList
  loc_004B09A1: mov eax, var_18
  loc_004B09A4: add esp, 00000020h
  loc_004B09A7: lea edx, var_24
  loc_004B09AA: mov ecx, [eax]
  loc_004B09AC: push edx
  loc_004B09AD: push eax
  loc_004B09AE: call [ecx+000000B4h]
  loc_004B09B4: test eax, eax
  loc_004B09B6: fnclex
  loc_004B09B8: jge 004B09CFh
  loc_004B09BA: mov ecx, var_18
  loc_004B09BD: push 000000B4h
  loc_004B09C2: push 0041E938h
  loc_004B09C7: push ecx
  loc_004B09C8: push eax
  loc_004B09C9: call [00401074h] ; __vbaHresultCheckObj
  loc_004B09CF: lea ebx, var_28
  loc_004B09D2: mov eax, var_24
  loc_004B09D5: push ebx
  loc_004B09D6: mov ecx, 00000008h
  loc_004B09DB: sub esp, 00000010h
  loc_004B09DE: mov edx, [eax]
  loc_004B09E0: mov ebx, esp
  loc_004B09E2: mov var_AC, eax
  loc_004B09E8: push eax
  loc_004B09E9: mov [ebx], ecx
  loc_004B09EB: mov ecx, 00424668h ; "HotKey"
  loc_004B09F0: mov [ebx+00000004h], edi
  loc_004B09F3: mov [ebx+00000008h], ecx
  loc_004B09F6: mov ecx, var_70
  loc_004B09F9: mov [ebx+0000000Ch], ecx
  loc_004B09FC: call [edx+00000030h]
  loc_004B09FF: test eax, eax
  loc_004B0A01: fnclex
  loc_004B0A03: jge 004B0A1Ah
  loc_004B0A05: mov edx, var_AC
  loc_004B0A0B: push 00000030h
  loc_004B0A0D: push 0041EA14h ; "S"
  loc_004B0A12: push edx
  loc_004B0A13: push eax
  loc_004B0A14: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0A1A: mov eax, [esi]
  loc_004B0A1C: push esi
  loc_004B0A1D: call [eax+00000304h]
  loc_004B0A23: lea ecx, var_2C
  loc_004B0A26: push eax
  loc_004B0A27: push ecx
  loc_004B0A28: call [004010A0h] ; __vbaObjSet
  loc_004B0A2E: mov ebx, eax
  loc_004B0A30: lea edx, var_9C
  loc_004B0A36: lea ecx, var_5C
  loc_004B0A39: mov var_B4, ebx
  loc_004B0A3F: mov var_94, 0042457Ch ; "No"
  loc_004B0A49: mov var_9C, 00000008h
  loc_004B0A53: call [00401240h] ; __vbaVarDup
  loc_004B0A59: lea edx, var_8C
  loc_004B0A5F: lea ecx, var_4C
  loc_004B0A62: mov var_84, 004244C0h ; "Yes"
  loc_004B0A6C: mov var_8C, 00000008h
  loc_004B0A76: call [00401240h] ; __vbaVarDup
  loc_004B0A7C: mov eax, var_28
  loc_004B0A7F: lea edx, var_5C
  loc_004B0A82: mov var_34, eax
  loc_004B0A85: lea eax, var_4C
  loc_004B0A88: push edx
  loc_004B0A89: lea ecx, var_3C
  loc_004B0A8C: push eax
  loc_004B0A8D: lea edx, var_6C
  loc_004B0A90: push ecx
  loc_004B0A91: push edx
  loc_004B0A92: mov var_28, 00000000h
  loc_004B0A99: mov var_3C, 00000009h
  loc_004B0AA0: call [004011F0h] ; rtcImmediateIf
  loc_004B0AA6: mov ebx, [ebx]
  loc_004B0AA8: lea eax, var_6C
  loc_004B0AAB: lea ecx, var_1C
  loc_004B0AAE: push eax
  loc_004B0AAF: push ecx
  loc_004B0AB0: call [004011B0h] ; __vbaStrVarVal
  loc_004B0AB6: mov edx, ebx
  loc_004B0AB8: mov ebx, var_B4
  loc_004B0ABE: push eax
  loc_004B0ABF: push ebx
  loc_004B0AC0: call [edx+000000ACh]
  loc_004B0AC6: test eax, eax
  loc_004B0AC8: fnclex
  loc_004B0ACA: jge 004B0ADEh
  loc_004B0ACC: push 000000ACh
  loc_004B0AD1: push 0041F844h
  loc_004B0AD6: push ebx
  loc_004B0AD7: push eax
  loc_004B0AD8: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0ADE: lea ecx, var_1C
  loc_004B0AE1: call [004012ACh] ; __vbaFreeStr
  loc_004B0AE7: lea eax, var_2C
  loc_004B0AEA: lea ecx, var_24
  loc_004B0AED: push eax
  loc_004B0AEE: push ecx
  loc_004B0AEF: push 00000002h
  loc_004B0AF1: call [00401040h] ; __vbaFreeObjList
  loc_004B0AF7: lea edx, var_6C
  loc_004B0AFA: lea eax, var_5C
  loc_004B0AFD: push edx
  loc_004B0AFE: lea ecx, var_4C
  loc_004B0B01: push eax
  loc_004B0B02: lea edx, var_3C
  loc_004B0B05: push ecx
  loc_004B0B06: push edx
  loc_004B0B07: push 00000004h
  loc_004B0B09: call [00401038h] ; __vbaFreeVarList
  loc_004B0B0F: mov eax, var_18
  loc_004B0B12: add esp, 00000020h
  loc_004B0B15: lea edx, var_24
  loc_004B0B18: mov ecx, [eax]
  loc_004B0B1A: push edx
  loc_004B0B1B: push eax
  loc_004B0B1C: call [ecx+000000B4h]
  loc_004B0B22: test eax, eax
  loc_004B0B24: fnclex
  loc_004B0B26: jge 004B0B3Dh
  loc_004B0B28: mov ecx, var_18
  loc_004B0B2B: push 000000B4h
  loc_004B0B30: push 0041E938h
  loc_004B0B35: push ecx
  loc_004B0B36: push eax
  loc_004B0B37: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0B3D: lea ebx, var_28
  loc_004B0B40: mov eax, var_24
  loc_004B0B43: push ebx
  loc_004B0B44: mov ecx, 00000008h
  loc_004B0B49: sub esp, 00000010h
  loc_004B0B4C: mov edx, [eax]
  loc_004B0B4E: mov ebx, esp
  loc_004B0B50: mov var_AC, eax
  loc_004B0B56: push eax
  loc_004B0B57: mov [ebx], ecx
  loc_004B0B59: mov ecx, 0042467Ch ; "NotSale"
  loc_004B0B5E: mov [ebx+00000004h], edi
  loc_004B0B61: mov [ebx+00000008h], ecx
  loc_004B0B64: mov ecx, var_70
  loc_004B0B67: mov [ebx+0000000Ch], ecx
  loc_004B0B6A: call [edx+00000030h]
  loc_004B0B6D: test eax, eax
  loc_004B0B6F: fnclex
  loc_004B0B71: jge 004B0B88h
  loc_004B0B73: mov edx, var_AC
  loc_004B0B79: push 00000030h
  loc_004B0B7B: push 0041EA14h ; "S"
  loc_004B0B80: push edx
  loc_004B0B81: push eax
  loc_004B0B82: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0B88: mov eax, [esi]
  loc_004B0B8A: push esi
  loc_004B0B8B: call [eax+00000300h]
  loc_004B0B91: lea ecx, var_2C
  loc_004B0B94: push eax
  loc_004B0B95: push ecx
  loc_004B0B96: call [004010A0h] ; __vbaObjSet
  loc_004B0B9C: mov ebx, eax
  loc_004B0B9E: lea edx, var_9C
  loc_004B0BA4: lea ecx, var_5C
  loc_004B0BA7: mov var_B4, ebx
  loc_004B0BAD: mov var_94, 0042457Ch ; "No"
  loc_004B0BB7: mov var_9C, 00000008h
  loc_004B0BC1: call [00401240h] ; __vbaVarDup
  loc_004B0BC7: lea edx, var_8C
  loc_004B0BCD: lea ecx, var_4C
  loc_004B0BD0: mov var_84, 004244C0h ; "Yes"
  loc_004B0BDA: mov var_8C, 00000008h
  loc_004B0BE4: call [00401240h] ; __vbaVarDup
  loc_004B0BEA: mov eax, var_28
  loc_004B0BED: lea edx, var_5C
  loc_004B0BF0: mov var_34, eax
  loc_004B0BF3: lea eax, var_4C
  loc_004B0BF6: push edx
  loc_004B0BF7: lea ecx, var_3C
  loc_004B0BFA: push eax
  loc_004B0BFB: lea edx, var_6C
  loc_004B0BFE: push ecx
  loc_004B0BFF: push edx
  loc_004B0C00: mov var_28, 00000000h
  loc_004B0C07: mov var_3C, 00000009h
  loc_004B0C0E: call [004011F0h] ; rtcImmediateIf
  loc_004B0C14: mov ebx, [ebx]
  loc_004B0C16: lea eax, var_6C
  loc_004B0C19: lea ecx, var_1C
  loc_004B0C1C: push eax
  loc_004B0C1D: push ecx
  loc_004B0C1E: call [004011B0h] ; __vbaStrVarVal
  loc_004B0C24: mov edx, ebx
  loc_004B0C26: mov ebx, var_B4
  loc_004B0C2C: push eax
  loc_004B0C2D: push ebx
  loc_004B0C2E: call [edx+000000ACh]
  loc_004B0C34: test eax, eax
  loc_004B0C36: fnclex
  loc_004B0C38: jge 004B0C4Ch
  loc_004B0C3A: push 000000ACh
  loc_004B0C3F: push 0041F844h
  loc_004B0C44: push ebx
  loc_004B0C45: push eax
  loc_004B0C46: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0C4C: lea ecx, var_1C
  loc_004B0C4F: call [004012ACh] ; __vbaFreeStr
  loc_004B0C55: lea eax, var_2C
  loc_004B0C58: lea ecx, var_24
  loc_004B0C5B: push eax
  loc_004B0C5C: push ecx
  loc_004B0C5D: push 00000002h
  loc_004B0C5F: call [00401040h] ; __vbaFreeObjList
  loc_004B0C65: lea edx, var_6C
  loc_004B0C68: lea eax, var_5C
  loc_004B0C6B: push edx
  loc_004B0C6C: lea ecx, var_4C
  loc_004B0C6F: push eax
  loc_004B0C70: lea edx, var_3C
  loc_004B0C73: push ecx
  loc_004B0C74: push edx
  loc_004B0C75: push 00000004h
  loc_004B0C77: call [00401038h] ; __vbaFreeVarList
  loc_004B0C7D: mov eax, var_18
  loc_004B0C80: add esp, 00000020h
  loc_004B0C83: lea edx, var_24
  loc_004B0C86: mov ecx, [eax]
  loc_004B0C88: push edx
  loc_004B0C89: push eax
  loc_004B0C8A: call [ecx+000000B4h]
  loc_004B0C90: test eax, eax
  loc_004B0C92: fnclex
  loc_004B0C94: jge 004B0CABh
  loc_004B0C96: mov ecx, var_18
  loc_004B0C99: push 000000B4h
  loc_004B0C9E: push 0041E938h
  loc_004B0CA3: push ecx
  loc_004B0CA4: push eax
  loc_004B0CA5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0CAB: lea ebx, var_28
  loc_004B0CAE: mov eax, var_24
  loc_004B0CB1: push ebx
  loc_004B0CB2: mov ecx, 00000008h
  loc_004B0CB7: sub esp, 00000010h
  loc_004B0CBA: mov edx, [eax]
  loc_004B0CBC: mov ebx, esp
  loc_004B0CBE: mov var_AC, eax
  loc_004B0CC4: push eax
  loc_004B0CC5: mov [ebx], ecx
  loc_004B0CC7: mov ecx, 00424690h ; "Over"
  loc_004B0CCC: mov [ebx+00000004h], edi
  loc_004B0CCF: mov [ebx+00000008h], ecx
  loc_004B0CD2: mov ecx, var_70
  loc_004B0CD5: mov [ebx+0000000Ch], ecx
  loc_004B0CD8: call [edx+00000030h]
  loc_004B0CDB: test eax, eax
  loc_004B0CDD: fnclex
  loc_004B0CDF: jge 004B0CF6h
  loc_004B0CE1: mov edx, var_AC
  loc_004B0CE7: push 00000030h
  loc_004B0CE9: push 0041EA14h ; "S"
  loc_004B0CEE: push edx
  loc_004B0CEF: push eax
  loc_004B0CF0: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0CF6: mov eax, [esi]
  loc_004B0CF8: push esi
  loc_004B0CF9: call [eax+000002FCh]
  loc_004B0CFF: lea ecx, var_2C
  loc_004B0D02: push eax
  loc_004B0D03: push ecx
  loc_004B0D04: call [004010A0h] ; __vbaObjSet
  loc_004B0D0A: mov edi, [00401240h] ; __vbaVarDup
  loc_004B0D10: mov ebx, 00000008h
  loc_004B0D15: lea edx, var_9C
  loc_004B0D1B: lea ecx, var_5C
  loc_004B0D1E: mov esi, eax
  loc_004B0D20: mov var_94, 0042457Ch ; "No"
  loc_004B0D2A: mov var_9C, ebx
  loc_004B0D30: call edi
  loc_004B0D32: lea edx, var_8C
  loc_004B0D38: lea ecx, var_4C
  loc_004B0D3B: mov var_84, 004244C0h ; "Yes"
  loc_004B0D45: mov var_8C, ebx
  loc_004B0D4B: call edi
  loc_004B0D4D: mov eax, var_28
  loc_004B0D50: lea edx, var_5C
  loc_004B0D53: mov var_34, eax
  loc_004B0D56: lea eax, var_4C
  loc_004B0D59: push edx
  loc_004B0D5A: lea ecx, var_3C
  loc_004B0D5D: push eax
  loc_004B0D5E: lea edx, var_6C
  loc_004B0D61: push ecx
  loc_004B0D62: push edx
  loc_004B0D63: mov var_28, 00000000h
  loc_004B0D6A: mov var_3C, 00000009h
  loc_004B0D71: call [004011F0h] ; rtcImmediateIf
  loc_004B0D77: mov edi, [esi]
  loc_004B0D79: lea eax, var_6C
  loc_004B0D7C: lea ecx, var_1C
  loc_004B0D7F: push eax
  loc_004B0D80: push ecx
  loc_004B0D81: call [004011B0h] ; __vbaStrVarVal
  loc_004B0D87: push eax
  loc_004B0D88: push esi
  loc_004B0D89: call [edi+000000ACh]
  loc_004B0D8F: test eax, eax
  loc_004B0D91: fnclex
  loc_004B0D93: jge 004B0DA7h
  loc_004B0D95: push 000000ACh
  loc_004B0D9A: push 0041F844h
  loc_004B0D9F: push esi
  loc_004B0DA0: push eax
  loc_004B0DA1: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0DA7: lea ecx, var_1C
  loc_004B0DAA: call [004012ACh] ; __vbaFreeStr
  loc_004B0DB0: lea edx, var_2C
  loc_004B0DB3: lea eax, var_24
  loc_004B0DB6: push edx
  loc_004B0DB7: push eax
  loc_004B0DB8: push 00000002h
  loc_004B0DBA: call [00401040h] ; __vbaFreeObjList
  loc_004B0DC0: lea ecx, var_6C
  loc_004B0DC3: lea edx, var_5C
  loc_004B0DC6: push ecx
  loc_004B0DC7: lea eax, var_4C
  loc_004B0DCA: push edx
  loc_004B0DCB: lea ecx, var_3C
  loc_004B0DCE: push eax
  loc_004B0DCF: push ecx
  loc_004B0DD0: push 00000004h
  loc_004B0DD2: call [00401038h] ; __vbaFreeVarList
  loc_004B0DD8: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B0DDE: add esp, 00000020h
  loc_004B0DE1: jmp 004B0E2Ah
  loc_004B0DE3: mov edx, [esi]
  loc_004B0DE5: push esi
  loc_004B0DE6: call [edx+00000308h]
  loc_004B0DEC: push eax
  loc_004B0DED: lea eax, var_24
  loc_004B0DF0: push eax
  loc_004B0DF1: call [004010A0h] ; __vbaObjSet
  loc_004B0DF7: mov esi, eax
  loc_004B0DF9: push 00000000h
  loc_004B0DFB: push esi
  loc_004B0DFC: mov ecx, [esi]
  loc_004B0DFE: call [ecx+000000F4h]
  loc_004B0E04: test eax, eax
  loc_004B0E06: fnclex
  loc_004B0E08: jge 004B0E18h
  loc_004B0E0A: push 000000F4h
  loc_004B0E0F: push 0041F844h
  loc_004B0E14: push esi
  loc_004B0E15: push eax
  loc_004B0E16: call ebx
  loc_004B0E18: lea ecx, var_24
  loc_004B0E1B: call [004012B0h] ; __vbaFreeObj
  loc_004B0E21: mov [0061A106h], FFFFFFh
  loc_004B0E2A: mov eax, var_18
  loc_004B0E2D: push eax
  loc_004B0E2E: mov edx, [eax]
  loc_004B0E30: call [edx+000000C4h]
  loc_004B0E36: test eax, eax
  loc_004B0E38: fnclex
  loc_004B0E3A: jge 004B0E4Dh
  loc_004B0E3C: mov ecx, var_18
  loc_004B0E3F: push 000000C4h
  loc_004B0E44: push 0041E938h
  loc_004B0E49: push ecx
  loc_004B0E4A: push eax
  loc_004B0E4B: call ebx
  loc_004B0E4D: push 0041E938h
  loc_004B0E52: push 00000000h
  loc_004B0E54: call [00401274h] ; __vbaCastObj
  loc_004B0E5A: lea edx, var_18
  loc_004B0E5D: push eax
  loc_004B0E5E: push edx
  loc_004B0E5F: call [004010A0h] ; __vbaObjSet
  loc_004B0E65: mov var_4, 00000000h
  loc_004B0E6C: push 004B0EBDh
  loc_004B0E71: jmp 004B0EB3h
  loc_004B0E73: lea eax, var_20
  loc_004B0E76: lea ecx, var_1C
  loc_004B0E79: push eax
  loc_004B0E7A: push ecx
  loc_004B0E7B: push 00000002h
  loc_004B0E7D: call [004011FCh] ; __vbaFreeStrList
  loc_004B0E83: lea edx, var_2C
  loc_004B0E86: lea eax, var_28
  loc_004B0E89: push edx
  loc_004B0E8A: lea ecx, var_24
  loc_004B0E8D: push eax
  loc_004B0E8E: push ecx
  loc_004B0E8F: push 00000003h
  loc_004B0E91: call [00401040h] ; __vbaFreeObjList
  loc_004B0E97: lea edx, var_6C
  loc_004B0E9A: lea eax, var_5C
  loc_004B0E9D: push edx
  loc_004B0E9E: lea ecx, var_4C
  loc_004B0EA1: push eax
  loc_004B0EA2: lea edx, var_3C
  loc_004B0EA5: push ecx
  loc_004B0EA6: push edx
  loc_004B0EA7: push 00000004h
  loc_004B0EA9: call [00401038h] ; __vbaFreeVarList
  loc_004B0EAF: add esp, 00000030h
  loc_004B0EB2: ret
  loc_004B0EB3: lea ecx, var_18
  loc_004B0EB6: call [004012B0h] ; __vbaFreeObj
  loc_004B0EBC: ret
  loc_004B0EBD: mov eax, Me
  loc_004B0EC0: push eax
  loc_004B0EC1: mov ecx, [eax]
  loc_004B0EC3: call [ecx+00000008h]
  loc_004B0EC6: mov eax, var_4
  loc_004B0EC9: mov ecx, var_14
  loc_004B0ECC: pop edi
  loc_004B0ECD: pop esi
  loc_004B0ECE: mov fs:[00000000h], ecx
  loc_004B0ED5: pop ebx
  loc_004B0ED6: mov esp, ebp
  loc_004B0ED8: pop ebp
  loc_004B0ED9: retn 0004h
End Sub

Private Sub cmdCancel_Click() '4AF650
  loc_004AF650: push ebp
  loc_004AF651: mov ebp, esp
  loc_004AF653: sub esp, 0000000Ch
  loc_004AF656: push 00403B36h ; __vbaExceptHandler
  loc_004AF65B: mov eax, fs:[00000000h]
  loc_004AF661: push eax
  loc_004AF662: mov fs:[00000000h], esp
  loc_004AF669: sub esp, 00000018h
  loc_004AF66C: push ebx
  loc_004AF66D: push esi
  loc_004AF66E: push edi
  loc_004AF66F: mov var_C, esp
  loc_004AF672: mov var_8, 00401B28h
  loc_004AF679: mov edi, Me
  loc_004AF67C: mov eax, edi
  loc_004AF67E: and eax, 00000001h
  loc_004AF681: mov var_4, eax
  loc_004AF684: and edi, FFFFFFFEh
  loc_004AF687: push edi
  loc_004AF688: mov Me, edi
  loc_004AF68B: mov ecx, [edi]
  loc_004AF68D: call [ecx+00000004h]
  loc_004AF690: mov eax, [edi+00000034h]
  loc_004AF693: lea esi, [edi+00000034h]
  loc_004AF696: mov var_18, 00000000h
  loc_004AF69D: push eax
  loc_004AF69E: mov edx, [eax]
  loc_004AF6A0: call [edx+00000058h]
  loc_004AF6A3: test eax, eax
  loc_004AF6A5: fnclex
  loc_004AF6A7: jge 004AF6BAh
  loc_004AF6A9: mov ecx, [esi]
  loc_004AF6AB: push 00000058h
  loc_004AF6AD: push 0041E928h
  loc_004AF6B2: push ecx
  loc_004AF6B3: push eax
  loc_004AF6B4: call [00401074h] ; __vbaHresultCheckObj
  loc_004AF6BA: push 0041E928h
  loc_004AF6BF: push 00000000h
  loc_004AF6C1: call [00401274h] ; __vbaCastObj
  loc_004AF6C7: lea edx, var_18
  loc_004AF6CA: push eax
  loc_004AF6CB: push edx
  loc_004AF6CC: call [004010A0h] ; __vbaObjSet
  loc_004AF6D2: mov ebx, [004010B8h] ; __vbaObjSetAddref
  loc_004AF6D8: push eax
  loc_004AF6D9: push esi
  loc_004AF6DA: call ebx
  loc_004AF6DC: lea ecx, var_18
  loc_004AF6DF: call [004012B0h] ; __vbaFreeObj
  loc_004AF6E5: mov eax, [0061B394h]
  loc_004AF6EA: test eax, eax
  loc_004AF6EC: jnz 004AF6FEh
  loc_004AF6EE: push 0061B394h
  loc_004AF6F3: push 0041E4A0h
  loc_004AF6F8: call [004011DCh] ; __vbaNew2
  loc_004AF6FE: mov esi, [0061B394h]
  loc_004AF704: lea eax, var_18
  loc_004AF707: push edi
  loc_004AF708: push eax
  loc_004AF709: mov edx, [esi]
  loc_004AF70B: mov var_2C, edx
  loc_004AF70E: call ebx
  loc_004AF710: mov ecx, var_2C
  loc_004AF713: push eax
  loc_004AF714: push esi
  loc_004AF715: call [ecx+00000010h]
  loc_004AF718: test eax, eax
  loc_004AF71A: fnclex
  loc_004AF71C: jge 004AF72Dh
  loc_004AF71E: push 00000010h
  loc_004AF720: push 0041E490h
  loc_004AF725: push esi
  loc_004AF726: push eax
  loc_004AF727: call [00401074h] ; __vbaHresultCheckObj
  loc_004AF72D: lea ecx, var_18
  loc_004AF730: call [004012B0h] ; __vbaFreeObj
  loc_004AF736: mov var_4, 00000000h
  loc_004AF73D: push 004AF74Fh
  loc_004AF742: jmp 004AF74Eh
  loc_004AF744: lea ecx, var_18
  loc_004AF747: call [004012B0h] ; __vbaFreeObj
  loc_004AF74D: ret
  loc_004AF74E: ret
  loc_004AF74F: mov eax, Me
  loc_004AF752: push eax
  loc_004AF753: mov edx, [eax]
  loc_004AF755: call [edx+00000008h]
  loc_004AF758: mov eax, var_4
  loc_004AF75B: mov ecx, var_14
  loc_004AF75E: pop edi
  loc_004AF75F: pop esi
  loc_004AF760: mov fs:[00000000h], ecx
  loc_004AF767: pop ebx
  loc_004AF768: mov esp, ebp
  loc_004AF76A: pop ebp
  loc_004AF76B: retn 0004h
End Sub

Private Sub cmdSave_Click() '4AF770
  loc_004AF770: push ebp
  loc_004AF771: mov ebp, esp
  loc_004AF773: sub esp, 0000000Ch
  loc_004AF776: push 00403B36h ; __vbaExceptHandler
  loc_004AF77B: mov eax, fs:[00000000h]
  loc_004AF781: push eax
  loc_004AF782: mov fs:[00000000h], esp
  loc_004AF789: sub esp, 000000B4h
  loc_004AF78F: push ebx
  loc_004AF790: push esi
  loc_004AF791: push edi
  loc_004AF792: mov var_C, esp
  loc_004AF795: mov var_8, 00401B38h
  loc_004AF79C: mov esi, Me
  loc_004AF79F: mov eax, esi
  loc_004AF7A1: and eax, 00000001h
  loc_004AF7A4: mov var_4, eax
  loc_004AF7A7: and esi, FFFFFFFEh
  loc_004AF7AA: push esi
  loc_004AF7AB: mov Me, esi
  loc_004AF7AE: mov ecx, [esi]
  loc_004AF7B0: call [ecx+00000004h]
  loc_004AF7B3: mov edx, [esi]
  loc_004AF7B5: xor edi, edi
  loc_004AF7B7: push esi
  loc_004AF7B8: mov var_18, edi
  loc_004AF7BB: mov var_1C, edi
  loc_004AF7BE: mov var_20, edi
  loc_004AF7C1: mov var_30, edi
  loc_004AF7C4: mov var_40, edi
  loc_004AF7C7: mov var_50, edi
  loc_004AF7CA: mov var_60, edi
  loc_004AF7CD: mov var_70, edi
  loc_004AF7D0: mov var_A0, edi
  loc_004AF7D6: call [edx+00000308h]
  loc_004AF7DC: push eax
  loc_004AF7DD: lea eax, var_20
  loc_004AF7E0: push eax
  loc_004AF7E1: call [004010A0h] ; __vbaObjSet
  loc_004AF7E7: mov ebx, eax
  loc_004AF7E9: lea edx, var_18
  loc_004AF7EC: push edx
  loc_004AF7ED: push ebx
  loc_004AF7EE: mov ecx, [ebx]
  loc_004AF7F0: call [ecx+000000A8h]
  loc_004AF7F6: cmp eax, edi
  loc_004AF7F8: fnclex
  loc_004AF7FA: jge 004AF80Eh
  loc_004AF7FC: push 000000A8h
  loc_004AF801: push 0041F844h
  loc_004AF806: push ebx
  loc_004AF807: push eax
  loc_004AF808: call [00401074h] ; __vbaHresultCheckObj
  loc_004AF80E: mov eax, var_18
  loc_004AF811: mov var_38, edi
  loc_004AF814: mov edi, 0000000Bh
  loc_004AF819: push eax
  loc_004AF81A: push 004244C0h ; "Yes"
  loc_004AF81F: mov var_40, edi
  loc_004AF822: mov var_28, FFFFFFFFh
  loc_004AF829: mov var_30, edi
  loc_004AF82C: call [0040110Ch] ; __vbaStrCmp
  loc_004AF832: neg eax
  loc_004AF834: sbb eax, eax
  loc_004AF836: lea ecx, var_40
  loc_004AF839: inc eax
  loc_004AF83A: lea edx, var_30
  loc_004AF83D: neg eax
  loc_004AF83F: mov var_68, ax
  loc_004AF843: push ecx
  loc_004AF844: lea eax, var_70
  loc_004AF847: push edx
  loc_004AF848: lea ecx, var_50
  loc_004AF84B: push eax
  loc_004AF84C: push ecx
  loc_004AF84D: mov var_70, edi
  loc_004AF850: call [004011F0h] ; rtcImmediateIf
  loc_004AF856: mov edx, [esi+00000034h]
  loc_004AF859: mov var_98, 00424484h ; "UPDATE Refresh SET Refresh="
  loc_004AF863: mov var_A0, 00000008h
  loc_004AF86D: sub esp, 00000010h
  loc_004AF870: mov ebx, [edx]
  loc_004AF872: mov edx, esp
  loc_004AF874: mov ecx, 0000000Ah
  loc_004AF879: mov eax, 80020004h
  loc_004AF87E: mov [edx], ecx
  loc_004AF880: mov ecx, var_AC
  loc_004AF886: mov [edx+00000004h], ecx
  loc_004AF889: lea ecx, var_A0
  loc_004AF88F: push ecx
  loc_004AF890: mov [edx+00000008h], eax
  loc_004AF893: mov eax, var_A4
  loc_004AF899: mov [edx+0000000Ch], eax
  loc_004AF89C: lea edx, var_50
  loc_004AF89F: lea eax, var_60
  loc_004AF8A2: push edx
  loc_004AF8A3: push eax
  loc_004AF8A4: call [004011B4h] ; __vbaVarCat
  loc_004AF8AA: lea ecx, var_1C
  loc_004AF8AD: push eax
  loc_004AF8AE: push ecx
  loc_004AF8AF: call [004011B0h] ; __vbaStrVarVal
  loc_004AF8B5: mov edx, [esi+00000034h]
  loc_004AF8B8: push eax
  loc_004AF8B9: push edx
  loc_004AF8BA: call [ebx+0000005Ch]
  loc_004AF8BD: test eax, eax
  loc_004AF8BF: fnclex
  loc_004AF8C1: jge 004AF8D5h
  loc_004AF8C3: mov ecx, [esi+00000034h]
  loc_004AF8C6: push 0000005Ch
  loc_004AF8C8: push 0041E928h
  loc_004AF8CD: push ecx
  loc_004AF8CE: push eax
  loc_004AF8CF: call [00401074h] ; __vbaHresultCheckObj
  loc_004AF8D5: lea edx, var_1C
  loc_004AF8D8: lea eax, var_18
  loc_004AF8DB: push edx
  loc_004AF8DC: push eax
  loc_004AF8DD: push 00000002h
  loc_004AF8DF: call [004011FCh] ; __vbaFreeStrList
  loc_004AF8E5: add esp, 0000000Ch
  loc_004AF8E8: lea ecx, var_20
  loc_004AF8EB: call [004012B0h] ; __vbaFreeObj
  loc_004AF8F1: lea ecx, var_60
  loc_004AF8F4: lea edx, var_50
  loc_004AF8F7: push ecx
  loc_004AF8F8: lea eax, var_40
  loc_004AF8FB: push edx
  loc_004AF8FC: lea ecx, var_30
  loc_004AF8FF: push eax
  loc_004AF900: lea edx, var_70
  loc_004AF903: push ecx
  loc_004AF904: push edx
  loc_004AF905: push 00000005h
  loc_004AF907: call [00401038h] ; __vbaFreeVarList
  loc_004AF90D: mov eax, [esi]
  loc_004AF90F: add esp, 00000018h
  loc_004AF912: push esi
  loc_004AF913: call [eax+00000304h]
  loc_004AF919: lea ecx, var_20
  loc_004AF91C: push eax
  loc_004AF91D: push ecx
  loc_004AF91E: call [004010A0h] ; __vbaObjSet
  loc_004AF924: mov ebx, eax
  loc_004AF926: lea eax, var_18
  loc_004AF929: push eax
  loc_004AF92A: push ebx
  loc_004AF92B: mov edx, [ebx]
  loc_004AF92D: call [edx+000000A8h]
  loc_004AF933: test eax, eax
  loc_004AF935: fnclex
  loc_004AF937: jge 004AF94Bh
  loc_004AF939: push 000000A8h
  loc_004AF93E: push 0041F844h
  loc_004AF943: push ebx
  loc_004AF944: push eax
  loc_004AF945: call [00401074h] ; __vbaHresultCheckObj
  loc_004AF94B: mov ecx, var_18
  loc_004AF94E: mov var_38, 00000000h
  loc_004AF955: push ecx
  loc_004AF956: push 004244C0h ; "Yes"
  loc_004AF95B: mov var_40, edi
  loc_004AF95E: mov var_28, FFFFFFFFh
  loc_004AF965: mov var_30, edi
  loc_004AF968: call [0040110Ch] ; __vbaStrCmp
  loc_004AF96E: neg eax
  loc_004AF970: sbb eax, eax
  loc_004AF972: lea edx, var_40
  loc_004AF975: inc eax
  loc_004AF976: push edx
  loc_004AF977: neg eax
  loc_004AF979: mov var_68, ax
  loc_004AF97D: lea eax, var_30
  loc_004AF980: lea ecx, var_70
  loc_004AF983: push eax
  loc_004AF984: lea edx, var_50
  loc_004AF987: push ecx
  loc_004AF988: push edx
  loc_004AF989: mov var_70, edi
  loc_004AF98C: call [004011F0h] ; rtcImmediateIf
  loc_004AF992: mov edx, [esi+00000034h]
  loc_004AF995: mov var_98, 004244CCh ; "UPDATE Refresh SET HotKey="
  loc_004AF99F: mov var_A0, 00000008h
  loc_004AF9A9: sub esp, 00000010h
  loc_004AF9AC: mov ebx, [edx]
  loc_004AF9AE: mov edx, esp
  loc_004AF9B0: mov ecx, 0000000Ah
  loc_004AF9B5: mov eax, 80020004h
  loc_004AF9BA: mov [edx], ecx
  loc_004AF9BC: mov ecx, var_AC
  loc_004AF9C2: mov [edx+00000004h], ecx
  loc_004AF9C5: lea ecx, var_A0
  loc_004AF9CB: push ecx
  loc_004AF9CC: mov [edx+00000008h], eax
  loc_004AF9CF: mov eax, var_A4
  loc_004AF9D5: mov [edx+0000000Ch], eax
  loc_004AF9D8: lea edx, var_50
  loc_004AF9DB: lea eax, var_60
  loc_004AF9DE: push edx
  loc_004AF9DF: push eax
  loc_004AF9E0: call [004011B4h] ; __vbaVarCat
  loc_004AF9E6: lea ecx, var_1C
  loc_004AF9E9: push eax
  loc_004AF9EA: push ecx
  loc_004AF9EB: call [004011B0h] ; __vbaStrVarVal
  loc_004AF9F1: mov edx, [esi+00000034h]
  loc_004AF9F4: push eax
  loc_004AF9F5: push edx
  loc_004AF9F6: call [ebx+0000005Ch]
  loc_004AF9F9: test eax, eax
  loc_004AF9FB: fnclex
  loc_004AF9FD: jge 004AFA11h
  loc_004AF9FF: mov ecx, [esi+00000034h]
  loc_004AFA02: push 0000005Ch
  loc_004AFA04: push 0041E928h
  loc_004AFA09: push ecx
  loc_004AFA0A: push eax
  loc_004AFA0B: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFA11: lea edx, var_1C
  loc_004AFA14: lea eax, var_18
  loc_004AFA17: push edx
  loc_004AFA18: push eax
  loc_004AFA19: push 00000002h
  loc_004AFA1B: call [004011FCh] ; __vbaFreeStrList
  loc_004AFA21: add esp, 0000000Ch
  loc_004AFA24: lea ecx, var_20
  loc_004AFA27: call [004012B0h] ; __vbaFreeObj
  loc_004AFA2D: lea ecx, var_60
  loc_004AFA30: lea edx, var_50
  loc_004AFA33: push ecx
  loc_004AFA34: lea eax, var_40
  loc_004AFA37: push edx
  loc_004AFA38: lea ecx, var_30
  loc_004AFA3B: push eax
  loc_004AFA3C: lea edx, var_70
  loc_004AFA3F: push ecx
  loc_004AFA40: push edx
  loc_004AFA41: push 00000005h
  loc_004AFA43: call [00401038h] ; __vbaFreeVarList
  loc_004AFA49: mov eax, [esi]
  loc_004AFA4B: add esp, 00000018h
  loc_004AFA4E: push esi
  loc_004AFA4F: call [eax+00000300h]
  loc_004AFA55: lea ecx, var_20
  loc_004AFA58: push eax
  loc_004AFA59: push ecx
  loc_004AFA5A: call [004010A0h] ; __vbaObjSet
  loc_004AFA60: mov ebx, eax
  loc_004AFA62: lea eax, var_18
  loc_004AFA65: push eax
  loc_004AFA66: push ebx
  loc_004AFA67: mov edx, [ebx]
  loc_004AFA69: call [edx+000000A8h]
  loc_004AFA6F: test eax, eax
  loc_004AFA71: fnclex
  loc_004AFA73: jge 004AFA87h
  loc_004AFA75: push 000000A8h
  loc_004AFA7A: push 0041F844h
  loc_004AFA7F: push ebx
  loc_004AFA80: push eax
  loc_004AFA81: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFA87: mov ecx, var_18
  loc_004AFA8A: mov var_38, 00000000h
  loc_004AFA91: push ecx
  loc_004AFA92: push 004244C0h ; "Yes"
  loc_004AFA97: mov var_40, edi
  loc_004AFA9A: mov var_28, FFFFFFFFh
  loc_004AFAA1: mov var_30, edi
  loc_004AFAA4: call [0040110Ch] ; __vbaStrCmp
  loc_004AFAAA: neg eax
  loc_004AFAAC: sbb eax, eax
  loc_004AFAAE: lea edx, var_40
  loc_004AFAB1: inc eax
  loc_004AFAB2: push edx
  loc_004AFAB3: neg eax
  loc_004AFAB5: mov var_68, ax
  loc_004AFAB9: lea eax, var_30
  loc_004AFABC: lea ecx, var_70
  loc_004AFABF: push eax
  loc_004AFAC0: lea edx, var_50
  loc_004AFAC3: push ecx
  loc_004AFAC4: push edx
  loc_004AFAC5: mov var_70, edi
  loc_004AFAC8: call [004011F0h] ; rtcImmediateIf
  loc_004AFACE: mov edx, [esi+00000034h]
  loc_004AFAD1: mov var_98, 00424508h ; "UPDATE Refresh SET NotSale="
  loc_004AFADB: mov var_A0, 00000008h
  loc_004AFAE5: sub esp, 00000010h
  loc_004AFAE8: mov ebx, [edx]
  loc_004AFAEA: mov edx, esp
  loc_004AFAEC: mov ecx, 0000000Ah
  loc_004AFAF1: mov eax, 80020004h
  loc_004AFAF6: mov [edx], ecx
  loc_004AFAF8: mov ecx, var_AC
  loc_004AFAFE: mov [edx+00000004h], ecx
  loc_004AFB01: lea ecx, var_A0
  loc_004AFB07: push ecx
  loc_004AFB08: mov [edx+00000008h], eax
  loc_004AFB0B: mov eax, var_A4
  loc_004AFB11: mov [edx+0000000Ch], eax
  loc_004AFB14: lea edx, var_50
  loc_004AFB17: lea eax, var_60
  loc_004AFB1A: push edx
  loc_004AFB1B: push eax
  loc_004AFB1C: call [004011B4h] ; __vbaVarCat
  loc_004AFB22: lea ecx, var_1C
  loc_004AFB25: push eax
  loc_004AFB26: push ecx
  loc_004AFB27: call [004011B0h] ; __vbaStrVarVal
  loc_004AFB2D: mov edx, [esi+00000034h]
  loc_004AFB30: push eax
  loc_004AFB31: push edx
  loc_004AFB32: call [ebx+0000005Ch]
  loc_004AFB35: test eax, eax
  loc_004AFB37: fnclex
  loc_004AFB39: jge 004AFB4Dh
  loc_004AFB3B: mov ecx, [esi+00000034h]
  loc_004AFB3E: push 0000005Ch
  loc_004AFB40: push 0041E928h
  loc_004AFB45: push ecx
  loc_004AFB46: push eax
  loc_004AFB47: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFB4D: lea edx, var_1C
  loc_004AFB50: lea eax, var_18
  loc_004AFB53: push edx
  loc_004AFB54: push eax
  loc_004AFB55: push 00000002h
  loc_004AFB57: call [004011FCh] ; __vbaFreeStrList
  loc_004AFB5D: add esp, 0000000Ch
  loc_004AFB60: lea ecx, var_20
  loc_004AFB63: call [004012B0h] ; __vbaFreeObj
  loc_004AFB69: lea ecx, var_60
  loc_004AFB6C: lea edx, var_50
  loc_004AFB6F: push ecx
  loc_004AFB70: lea eax, var_40
  loc_004AFB73: push edx
  loc_004AFB74: lea ecx, var_30
  loc_004AFB77: push eax
  loc_004AFB78: lea edx, var_70
  loc_004AFB7B: push ecx
  loc_004AFB7C: push edx
  loc_004AFB7D: push 00000005h
  loc_004AFB7F: call [00401038h] ; __vbaFreeVarList
  loc_004AFB85: mov eax, [esi]
  loc_004AFB87: add esp, 00000018h
  loc_004AFB8A: push esi
  loc_004AFB8B: call [eax+000002FCh]
  loc_004AFB91: lea ecx, var_20
  loc_004AFB94: push eax
  loc_004AFB95: push ecx
  loc_004AFB96: call [004010A0h] ; __vbaObjSet
  loc_004AFB9C: mov ebx, eax
  loc_004AFB9E: lea eax, var_18
  loc_004AFBA1: push eax
  loc_004AFBA2: push ebx
  loc_004AFBA3: mov edx, [ebx]
  loc_004AFBA5: call [edx+000000A8h]
  loc_004AFBAB: test eax, eax
  loc_004AFBAD: fnclex
  loc_004AFBAF: jge 004AFBC3h
  loc_004AFBB1: push 000000A8h
  loc_004AFBB6: push 0041F844h
  loc_004AFBBB: push ebx
  loc_004AFBBC: push eax
  loc_004AFBBD: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFBC3: mov ecx, var_18
  loc_004AFBC6: mov var_38, 00000000h
  loc_004AFBCD: push ecx
  loc_004AFBCE: push 004244C0h ; "Yes"
  loc_004AFBD3: mov var_40, edi
  loc_004AFBD6: mov var_28, FFFFFFFFh
  loc_004AFBDD: mov var_30, edi
  loc_004AFBE0: call [0040110Ch] ; __vbaStrCmp
  loc_004AFBE6: neg eax
  loc_004AFBE8: sbb eax, eax
  loc_004AFBEA: lea edx, var_40
  loc_004AFBED: inc eax
  loc_004AFBEE: push edx
  loc_004AFBEF: neg eax
  loc_004AFBF1: mov var_68, ax
  loc_004AFBF5: lea eax, var_30
  loc_004AFBF8: lea ecx, var_70
  loc_004AFBFB: push eax
  loc_004AFBFC: lea edx, var_50
  loc_004AFBFF: push ecx
  loc_004AFC00: push edx
  loc_004AFC01: mov var_70, edi
  loc_004AFC04: call [004011F0h] ; rtcImmediateIf
  loc_004AFC0A: mov edx, [esi+00000034h]
  loc_004AFC0D: mov var_98, 00424544h ; "UPDATE Refresh SET Over="
  loc_004AFC17: mov var_A0, 00000008h
  loc_004AFC21: sub esp, 00000010h
  loc_004AFC24: mov ebx, [edx]
  loc_004AFC26: mov edx, esp
  loc_004AFC28: mov ecx, 0000000Ah
  loc_004AFC2D: mov eax, 80020004h
  loc_004AFC32: mov [edx], ecx
  loc_004AFC34: mov ecx, var_AC
  loc_004AFC3A: mov [edx+00000004h], ecx
  loc_004AFC3D: lea ecx, var_A0
  loc_004AFC43: push ecx
  loc_004AFC44: mov [edx+00000008h], eax
  loc_004AFC47: mov eax, var_A4
  loc_004AFC4D: mov [edx+0000000Ch], eax
  loc_004AFC50: lea edx, var_50
  loc_004AFC53: lea eax, var_60
  loc_004AFC56: push edx
  loc_004AFC57: push eax
  loc_004AFC58: call [004011B4h] ; __vbaVarCat
  loc_004AFC5E: lea ecx, var_1C
  loc_004AFC61: push eax
  loc_004AFC62: push ecx
  loc_004AFC63: call [004011B0h] ; __vbaStrVarVal
  loc_004AFC69: mov edx, [esi+00000034h]
  loc_004AFC6C: push eax
  loc_004AFC6D: push edx
  loc_004AFC6E: call [ebx+0000005Ch]
  loc_004AFC71: test eax, eax
  loc_004AFC73: fnclex
  loc_004AFC75: jge 004AFC89h
  loc_004AFC77: mov ecx, [esi+00000034h]
  loc_004AFC7A: push 0000005Ch
  loc_004AFC7C: push 0041E928h
  loc_004AFC81: push ecx
  loc_004AFC82: push eax
  loc_004AFC83: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFC89: lea edx, var_1C
  loc_004AFC8C: lea eax, var_18
  loc_004AFC8F: push edx
  loc_004AFC90: push eax
  loc_004AFC91: push 00000002h
  loc_004AFC93: call [004011FCh] ; __vbaFreeStrList
  loc_004AFC99: add esp, 0000000Ch
  loc_004AFC9C: lea ecx, var_20
  loc_004AFC9F: call [004012B0h] ; __vbaFreeObj
  loc_004AFCA5: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_004AFCAB: lea ecx, var_60
  loc_004AFCAE: lea edx, var_50
  loc_004AFCB1: push ecx
  loc_004AFCB2: lea eax, var_40
  loc_004AFCB5: push edx
  loc_004AFCB6: lea ecx, var_30
  loc_004AFCB9: push eax
  loc_004AFCBA: lea edx, var_70
  loc_004AFCBD: push ecx
  loc_004AFCBE: push edx
  loc_004AFCBF: push 00000005h
  loc_004AFCC1: call ebx
  loc_004AFCC3: mov eax, [esi]
  loc_004AFCC5: add esp, 00000018h
  loc_004AFCC8: push esi
  loc_004AFCC9: call [eax+00000308h]
  loc_004AFCCF: lea ecx, var_20
  loc_004AFCD2: push eax
  loc_004AFCD3: push ecx
  loc_004AFCD4: call [004010A0h] ; __vbaObjSet
  loc_004AFCDA: mov edx, [eax]
  loc_004AFCDC: lea ecx, var_18
  loc_004AFCDF: push ecx
  loc_004AFCE0: push eax
  loc_004AFCE1: mov var_B4, eax
  loc_004AFCE7: call [edx+000000A8h]
  loc_004AFCED: test eax, eax
  loc_004AFCEF: fnclex
  loc_004AFCF1: jge 004AFD0Bh
  loc_004AFCF3: mov edx, var_B4
  loc_004AFCF9: push 000000A8h
  loc_004AFCFE: push 0041F844h
  loc_004AFD03: push edx
  loc_004AFD04: push eax
  loc_004AFD05: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFD0B: mov eax, var_18
  loc_004AFD0E: mov var_38, 00000000h
  loc_004AFD15: push eax
  loc_004AFD16: push 004244C0h ; "Yes"
  loc_004AFD1B: mov var_40, edi
  loc_004AFD1E: mov var_28, FFFFFFFFh
  loc_004AFD25: mov var_30, edi
  loc_004AFD28: call [0040110Ch] ; __vbaStrCmp
  loc_004AFD2E: neg eax
  loc_004AFD30: sbb eax, eax
  loc_004AFD32: lea ecx, var_40
  loc_004AFD35: inc eax
  loc_004AFD36: lea edx, var_30
  loc_004AFD39: neg eax
  loc_004AFD3B: mov var_68, ax
  loc_004AFD3F: push ecx
  loc_004AFD40: lea eax, var_70
  loc_004AFD43: push edx
  loc_004AFD44: lea ecx, var_50
  loc_004AFD47: push eax
  loc_004AFD48: push ecx
  loc_004AFD49: mov var_70, edi
  loc_004AFD4C: call [004011F0h] ; rtcImmediateIf
  loc_004AFD52: lea edx, var_50
  loc_004AFD55: push edx
  loc_004AFD56: call [004010CCh] ; __vbaBoolVar
  loc_004AFD5C: lea ecx, var_18
  loc_004AFD5F: mov [0061A106h], ax
  loc_004AFD65: call [004012ACh] ; __vbaFreeStr
  loc_004AFD6B: lea ecx, var_20
  loc_004AFD6E: call [004012B0h] ; __vbaFreeObj
  loc_004AFD74: lea eax, var_50
  loc_004AFD77: lea ecx, var_40
  loc_004AFD7A: push eax
  loc_004AFD7B: lea edx, var_30
  loc_004AFD7E: push ecx
  loc_004AFD7F: lea eax, var_70
  loc_004AFD82: push edx
  loc_004AFD83: push eax
  loc_004AFD84: push 00000004h
  loc_004AFD86: call ebx
  loc_004AFD88: mov ecx, [esi]
  loc_004AFD8A: add esp, 00000014h
  loc_004AFD8D: push esi
  loc_004AFD8E: call [ecx+00000304h]
  loc_004AFD94: lea edx, var_20
  loc_004AFD97: push eax
  loc_004AFD98: push edx
  loc_004AFD99: call [004010A0h] ; __vbaObjSet
  loc_004AFD9F: mov ecx, [eax]
  loc_004AFDA1: lea edx, var_18
  loc_004AFDA4: push edx
  loc_004AFDA5: push eax
  loc_004AFDA6: mov var_B4, eax
  loc_004AFDAC: call [ecx+000000A8h]
  loc_004AFDB2: test eax, eax
  loc_004AFDB4: fnclex
  loc_004AFDB6: jge 004AFDD0h
  loc_004AFDB8: mov ecx, var_B4
  loc_004AFDBE: push 000000A8h
  loc_004AFDC3: push 0041F844h
  loc_004AFDC8: push ecx
  loc_004AFDC9: push eax
  loc_004AFDCA: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFDD0: mov edx, var_18
  loc_004AFDD3: mov var_38, 00000000h
  loc_004AFDDA: push edx
  loc_004AFDDB: push 004244C0h ; "Yes"
  loc_004AFDE0: mov var_40, edi
  loc_004AFDE3: mov var_28, FFFFFFFFh
  loc_004AFDEA: mov var_30, edi
  loc_004AFDED: call [0040110Ch] ; __vbaStrCmp
  loc_004AFDF3: neg eax
  loc_004AFDF5: sbb eax, eax
  loc_004AFDF7: lea ecx, var_30
  loc_004AFDFA: inc eax
  loc_004AFDFB: lea edx, var_70
  loc_004AFDFE: neg eax
  loc_004AFE00: mov var_68, ax
  loc_004AFE04: lea eax, var_40
  loc_004AFE07: push eax
  loc_004AFE08: push ecx
  loc_004AFE09: lea eax, var_50
  loc_004AFE0C: push edx
  loc_004AFE0D: push eax
  loc_004AFE0E: mov var_70, edi
  loc_004AFE11: call [004011F0h] ; rtcImmediateIf
  loc_004AFE17: lea ecx, var_50
  loc_004AFE1A: push ecx
  loc_004AFE1B: call [004010CCh] ; __vbaBoolVar
  loc_004AFE21: lea ecx, var_18
  loc_004AFE24: mov [0061A108h], ax
  loc_004AFE2A: call [004012ACh] ; __vbaFreeStr
  loc_004AFE30: lea ecx, var_20
  loc_004AFE33: call [004012B0h] ; __vbaFreeObj
  loc_004AFE39: lea edx, var_50
  loc_004AFE3C: lea eax, var_40
  loc_004AFE3F: push edx
  loc_004AFE40: lea ecx, var_30
  loc_004AFE43: push eax
  loc_004AFE44: lea edx, var_70
  loc_004AFE47: push ecx
  loc_004AFE48: push edx
  loc_004AFE49: push 00000004h
  loc_004AFE4B: call ebx
  loc_004AFE4D: mov eax, [esi]
  loc_004AFE4F: add esp, 00000014h
  loc_004AFE52: push esi
  loc_004AFE53: call [eax+00000300h]
  loc_004AFE59: lea ecx, var_20
  loc_004AFE5C: push eax
  loc_004AFE5D: push ecx
  loc_004AFE5E: call [004010A0h] ; __vbaObjSet
  loc_004AFE64: mov edx, [eax]
  loc_004AFE66: lea ecx, var_18
  loc_004AFE69: push ecx
  loc_004AFE6A: push eax
  loc_004AFE6B: mov var_B4, eax
  loc_004AFE71: call [edx+000000A8h]
  loc_004AFE77: test eax, eax
  loc_004AFE79: fnclex
  loc_004AFE7B: jge 004AFE95h
  loc_004AFE7D: mov edx, var_B4
  loc_004AFE83: push 000000A8h
  loc_004AFE88: push 0041F844h
  loc_004AFE8D: push edx
  loc_004AFE8E: push eax
  loc_004AFE8F: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFE95: mov eax, var_18
  loc_004AFE98: mov var_38, 00000000h
  loc_004AFE9F: push eax
  loc_004AFEA0: push 004244C0h ; "Yes"
  loc_004AFEA5: mov var_40, edi
  loc_004AFEA8: mov var_28, FFFFFFFFh
  loc_004AFEAF: mov var_30, edi
  loc_004AFEB2: call [0040110Ch] ; __vbaStrCmp
  loc_004AFEB8: neg eax
  loc_004AFEBA: sbb eax, eax
  loc_004AFEBC: lea ecx, var_40
  loc_004AFEBF: inc eax
  loc_004AFEC0: lea edx, var_30
  loc_004AFEC3: neg eax
  loc_004AFEC5: mov var_68, ax
  loc_004AFEC9: push ecx
  loc_004AFECA: lea eax, var_70
  loc_004AFECD: push edx
  loc_004AFECE: lea ecx, var_50
  loc_004AFED1: push eax
  loc_004AFED2: push ecx
  loc_004AFED3: mov var_70, edi
  loc_004AFED6: call [004011F0h] ; rtcImmediateIf
  loc_004AFEDC: lea edx, var_50
  loc_004AFEDF: push edx
  loc_004AFEE0: call [004010CCh] ; __vbaBoolVar
  loc_004AFEE6: lea ecx, var_18
  loc_004AFEE9: mov [0061A10Ah], ax
  loc_004AFEEF: call [004012ACh] ; __vbaFreeStr
  loc_004AFEF5: lea ecx, var_20
  loc_004AFEF8: call [004012B0h] ; __vbaFreeObj
  loc_004AFEFE: lea eax, var_50
  loc_004AFF01: lea ecx, var_40
  loc_004AFF04: push eax
  loc_004AFF05: lea edx, var_30
  loc_004AFF08: push ecx
  loc_004AFF09: lea eax, var_70
  loc_004AFF0C: push edx
  loc_004AFF0D: push eax
  loc_004AFF0E: push 00000004h
  loc_004AFF10: call ebx
  loc_004AFF12: mov ecx, [esi]
  loc_004AFF14: add esp, 00000014h
  loc_004AFF17: push esi
  loc_004AFF18: call [ecx+000002FCh]
  loc_004AFF1E: lea edx, var_20
  loc_004AFF21: push eax
  loc_004AFF22: push edx
  loc_004AFF23: call [004010A0h] ; __vbaObjSet
  loc_004AFF29: mov ecx, [eax]
  loc_004AFF2B: lea edx, var_18
  loc_004AFF2E: push edx
  loc_004AFF2F: push eax
  loc_004AFF30: mov var_B4, eax
  loc_004AFF36: call [ecx+000000A8h]
  loc_004AFF3C: test eax, eax
  loc_004AFF3E: fnclex
  loc_004AFF40: jge 004AFF5Ah
  loc_004AFF42: mov ecx, var_B4
  loc_004AFF48: push 000000A8h
  loc_004AFF4D: push 0041F844h
  loc_004AFF52: push ecx
  loc_004AFF53: push eax
  loc_004AFF54: call [00401074h] ; __vbaHresultCheckObj
  loc_004AFF5A: mov edx, var_18
  loc_004AFF5D: mov var_38, 00000000h
  loc_004AFF64: push edx
  loc_004AFF65: push 004244C0h ; "Yes"
  loc_004AFF6A: mov var_40, edi
  loc_004AFF6D: mov var_28, FFFFFFFFh
  loc_004AFF74: mov var_30, edi
  loc_004AFF77: call [0040110Ch] ; __vbaStrCmp
  loc_004AFF7D: neg eax
  loc_004AFF7F: sbb eax, eax
  loc_004AFF81: lea ecx, var_30
  loc_004AFF84: inc eax
  loc_004AFF85: lea edx, var_70
  loc_004AFF88: neg eax
  loc_004AFF8A: mov var_68, ax
  loc_004AFF8E: lea eax, var_40
  loc_004AFF91: push eax
  loc_004AFF92: push ecx
  loc_004AFF93: lea eax, var_50
  loc_004AFF96: push edx
  loc_004AFF97: push eax
  loc_004AFF98: mov var_70, edi
  loc_004AFF9B: call [004011F0h] ; rtcImmediateIf
  loc_004AFFA1: lea ecx, var_50
  loc_004AFFA4: push ecx
  loc_004AFFA5: call [004010CCh] ; __vbaBoolVar
  loc_004AFFAB: lea ecx, var_18
  loc_004AFFAE: mov [0061A10Ch], ax
  loc_004AFFB4: call [004012ACh] ; __vbaFreeStr
  loc_004AFFBA: mov edi, [004012B0h] ; __vbaFreeObj
  loc_004AFFC0: lea ecx, var_20
  loc_004AFFC3: call edi
  loc_004AFFC5: lea edx, var_50
  loc_004AFFC8: lea eax, var_40
  loc_004AFFCB: push edx
  loc_004AFFCC: lea ecx, var_30
  loc_004AFFCF: push eax
  loc_004AFFD0: lea edx, var_70
  loc_004AFFD3: push ecx
  loc_004AFFD4: push edx
  loc_004AFFD5: push 00000004h
  loc_004AFFD7: call ebx
  loc_004AFFD9: mov ecx, 80020004h
  loc_004AFFDE: mov eax, 0000000Ah
  loc_004AFFE3: mov var_58, ecx
  loc_004AFFE6: mov var_48, ecx
  loc_004AFFE9: mov var_38, ecx
  loc_004AFFEC: add esp, 00000014h
  loc_004AFFEF: lea edx, var_70
  loc_004AFFF2: lea ecx, var_30
  loc_004AFFF5: mov var_60, eax
  loc_004AFFF8: mov var_50, eax
  loc_004AFFFB: mov var_40, eax
  loc_004AFFFE: mov var_68, 0041F378h ; "Save Successfully."
  loc_004B0005: mov var_70, 00000008h
  loc_004B000C: call [00401240h] ; __vbaVarDup
  loc_004B0012: lea eax, var_60
  loc_004B0015: lea ecx, var_50
  loc_004B0018: push eax
  loc_004B0019: lea edx, var_40
  loc_004B001C: push ecx
  loc_004B001D: push edx
  loc_004B001E: lea eax, var_30
  loc_004B0021: push 00000040h
  loc_004B0023: push eax
  loc_004B0024: call [004010A4h] ; rtcMsgBox
  loc_004B002A: lea ecx, var_60
  loc_004B002D: lea edx, var_50
  loc_004B0030: push ecx
  loc_004B0031: lea eax, var_40
  loc_004B0034: push edx
  loc_004B0035: lea ecx, var_30
  loc_004B0038: push eax
  loc_004B0039: push ecx
  loc_004B003A: push 00000004h
  loc_004B003C: call ebx
  loc_004B003E: mov eax, [0061B394h]
  loc_004B0043: add esp, 00000014h
  loc_004B0046: test eax, eax
  loc_004B0048: jnz 004B005Ah
  loc_004B004A: push 0061B394h
  loc_004B004F: push 0041E4A0h
  loc_004B0054: call [004011DCh] ; __vbaNew2
  loc_004B005A: mov ebx, [0061B394h]
  loc_004B0060: lea eax, var_20
  loc_004B0063: push esi
  loc_004B0064: push eax
  loc_004B0065: mov edx, [ebx]
  loc_004B0067: mov var_C8, edx
  loc_004B006D: call [004010B8h] ; __vbaObjSetAddref
  loc_004B0073: mov ecx, var_C8
  loc_004B0079: push eax
  loc_004B007A: push ebx
  loc_004B007B: call [ecx+00000010h]
  loc_004B007E: test eax, eax
  loc_004B0080: fnclex
  loc_004B0082: jge 004B0093h
  loc_004B0084: push 00000010h
  loc_004B0086: push 0041E490h
  loc_004B008B: push ebx
  loc_004B008C: push eax
  loc_004B008D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B0093: lea ecx, var_20
  loc_004B0096: call edi
  loc_004B0098: mov var_4, 00000000h
  loc_004B009F: push 004B00DFh
  loc_004B00A4: jmp 004B00DEh
  loc_004B00A6: lea edx, var_1C
  loc_004B00A9: lea eax, var_18
  loc_004B00AC: push edx
  loc_004B00AD: push eax
  loc_004B00AE: push 00000002h
  loc_004B00B0: call [004011FCh] ; __vbaFreeStrList
  loc_004B00B6: add esp, 0000000Ch
  loc_004B00B9: lea ecx, var_20
  loc_004B00BC: call [004012B0h] ; __vbaFreeObj
  loc_004B00C2: lea ecx, var_60
  loc_004B00C5: lea edx, var_50
  loc_004B00C8: push ecx
  loc_004B00C9: lea eax, var_40
  loc_004B00CC: push edx
  loc_004B00CD: lea ecx, var_30
  loc_004B00D0: push eax
  loc_004B00D1: push ecx
  loc_004B00D2: push 00000004h
  loc_004B00D4: call [00401038h] ; __vbaFreeVarList
  loc_004B00DA: add esp, 00000014h
  loc_004B00DD: ret
  loc_004B00DE: ret
  loc_004B00DF: mov eax, Me
  loc_004B00E2: push eax
  loc_004B00E3: mov edx, [eax]
  loc_004B00E5: call [edx+00000008h]
  loc_004B00E8: mov eax, var_4
  loc_004B00EB: mov ecx, var_14
  loc_004B00EE: pop edi
  loc_004B00EF: pop esi
  loc_004B00F0: mov fs:[00000000h], ecx
  loc_004B00F7: pop ebx
  loc_004B00F8: mov esp, ebp
  loc_004B00FA: pop ebp
  loc_004B00FB: retn 0004h
End Sub
