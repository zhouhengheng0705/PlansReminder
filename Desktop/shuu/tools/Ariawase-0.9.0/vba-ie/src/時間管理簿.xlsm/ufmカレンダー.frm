VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm�J�����_�[ 
   Caption         =   "�J�����_�["
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   3540
   OleObjectBlob   =   "ufm�J�����_�[.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
   WhatsThisHelp   =   -1  'True
End
Attribute VB_Name = "ufm�J�����_�["
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const �J�n�N = 2012

Private Sub Label1_BeforeDragOver(ByVal Cancel As MSForms.ReturnBoolean, ByVal Data As MSForms.DataObject, ByVal X As Single, ByVal Y As Single, ByVal DragState As MSForms.fmDragState, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Sub UserForm_Initialize()

    Dim i As Long
    
    cmb��.Clear
    For i = 1 To 12
        cmb��.AddItem i
    Next i
    cmb��.Value = Month(Date)
    cmb�N.Clear
    For i = �J�n�N To Year(Date) + 10
        cmb�N.AddItem i
    Next i
    cmb�N.Value = Year(Date)
'    txt���ݎ���.Value = Format(Now(), "hh:mm")
    
    Call ������
    
End Sub

'Sub Sample1()
'
'    Application.OnTime (TimeValue(Format(Now(), "hh:mm:ss")) + TimeValue("00:00:02")), "Test"
'
'End Sub
'
'Sub Test()
'
'    txt���ݎ���.Value = Format(Now(), "hh:mm")
'
'End Sub

Private Sub SpinButton1_SpinUp()

    If cmb�N.Value = "" Or cmb��.Value = "" Then
        MsgBox "�N���𐳂������͂��Ă��������B", vbExclamation
        Exit Sub
    End If
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Dim ���ݓ��t, �O�����t As String
    ���ݓ��t = DateSerial(cmb�N.Value, cmb��.Value, 1)
    �O�����t = DateAdd("m", -1, ���ݓ��t)
    cmb�N.Value = Year(�O�����t)
    cmb��.Value = Month(�O�����t)
    
    Call ������

End Sub

Private Sub SpinButton1_SpinDown()

    If cmb�N.Value = "" Or cmb��.Value = "" Then
        MsgBox "�N���𐳂������͂��Ă��������B", vbExclamation
        Exit Sub
    End If
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Dim ���ݓ��t, �������t As String
    ���ݓ��t = DateSerial(cmb�N.Value, cmb��.Value, 1)
    �������t = DateAdd("m", 1, ���ݓ��t)
    cmb�N.Value = Year(�������t)
    cmb��.Value = Month(�������t)
    
    Call ������

End Sub

Private Sub cmb�N_Change()
    
    If cmb�N.Value <> "" And cmb��.Value <> "" Then
        Call �J�����_�[�t�H�[��������
        Call ������
    End If

End Sub

Private Sub cmb��_Change()
    
    If cmb�N.Value <> "" And cmb��.Value <> "" Then
        Call �J�����_�[�t�H�[��������
        Call ������
    End If

End Sub

Private Sub Label1_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label1.SpecialEffect = fmSpecialEffectBump
    Label1.Font.Bold = True
    
End Sub

Private Sub Label2_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label2.SpecialEffect = fmSpecialEffectBump
    Label2.Font.Bold = True
    
End Sub

Private Sub Label3_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label3.SpecialEffect = fmSpecialEffectBump
    Label3.Font.Bold = True

End Sub

Private Sub Label4_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label4.SpecialEffect = fmSpecialEffectBump
    Label4.Font.Bold = True
    
End Sub

Private Sub Label5_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label5.SpecialEffect = fmSpecialEffectBump
    Label5.Font.Bold = True
    
End Sub

Private Sub Label6_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label6.SpecialEffect = fmSpecialEffectBump
    Label6.Font.Bold = True

End Sub

Private Sub Label7_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label7.SpecialEffect = fmSpecialEffectBump
    Label7.Font.Bold = True
    
End Sub

Private Sub Label8_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label8.SpecialEffect = fmSpecialEffectBump
    Label8.Font.Bold = True
    
End Sub

Private Sub Label9_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label9.SpecialEffect = fmSpecialEffectBump
    Label9.Font.Bold = True

End Sub

Private Sub Label10_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label10.SpecialEffect = fmSpecialEffectBump
    Label10.Font.Bold = True
    
End Sub

Private Sub Label11_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label11.SpecialEffect = fmSpecialEffectBump
    Label11.Font.Bold = True
    
End Sub

Private Sub Label12_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label12.SpecialEffect = fmSpecialEffectBump
    Label12.Font.Bold = True

End Sub

Private Sub Label13_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label13.SpecialEffect = fmSpecialEffectBump
    Label13.Font.Bold = True
    
End Sub

Private Sub Label14_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label14.SpecialEffect = fmSpecialEffectBump
    Label14.Font.Bold = True
    
End Sub

Private Sub Label15_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label15.SpecialEffect = fmSpecialEffectBump
    Label15.Font.Bold = True

End Sub

Private Sub Label16_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label16.SpecialEffect = fmSpecialEffectBump
    Label16.Font.Bold = True
    
End Sub

Private Sub Label17_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label17.SpecialEffect = fmSpecialEffectBump
    Label17.Font.Bold = True
    
End Sub

Private Sub Label18_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label18.SpecialEffect = fmSpecialEffectBump
    Label18.Font.Bold = True

End Sub

Private Sub Label19_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label19.SpecialEffect = fmSpecialEffectBump
    Label19.Font.Bold = True
    
End Sub

Private Sub Label20_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label20.SpecialEffect = fmSpecialEffectBump
    Label20.Font.Bold = True
    
End Sub

Private Sub Label21_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label21.SpecialEffect = fmSpecialEffectBump
    Label21.Font.Bold = True

End Sub

Private Sub Label22_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label22.SpecialEffect = fmSpecialEffectBump
    Label22.Font.Bold = True
    
End Sub

Private Sub Label23_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label23.SpecialEffect = fmSpecialEffectBump
    Label23.Font.Bold = True
    
End Sub

Private Sub Label24_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label24.SpecialEffect = fmSpecialEffectBump
    Label24.Font.Bold = True

End Sub

Private Sub Label25_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label25.SpecialEffect = fmSpecialEffectBump
    Label25.Font.Bold = True
    
End Sub

Private Sub Label26_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label26.SpecialEffect = fmSpecialEffectBump
    Label26.Font.Bold = True
    
End Sub

Private Sub Label27_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label27.SpecialEffect = fmSpecialEffectBump
    Label27.Font.Bold = True

End Sub

Private Sub Label28_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label28.SpecialEffect = fmSpecialEffectBump
    Label28.Font.Bold = True
    
End Sub

Private Sub Label29_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label29.SpecialEffect = fmSpecialEffectBump
    Label29.Font.Bold = True
    
End Sub

Private Sub Label30_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label30.SpecialEffect = fmSpecialEffectBump
    Label30.Font.Bold = True

End Sub

Private Sub Label31_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label31.SpecialEffect = fmSpecialEffectBump
    Label31.Font.Bold = True
    
End Sub

Private Sub Label32_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label32.SpecialEffect = fmSpecialEffectBump
    Label32.Font.Bold = True
    
End Sub

Private Sub Label33_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label33.SpecialEffect = fmSpecialEffectBump
    Label33.Font.Bold = True

End Sub

Private Sub Label34_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label34.SpecialEffect = fmSpecialEffectBump
    Label34.Font.Bold = True
    
End Sub

Private Sub Label35_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label35.SpecialEffect = fmSpecialEffectBump
    Label35.Font.Bold = True
    
End Sub

Private Sub Label36_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label36.SpecialEffect = fmSpecialEffectBump
    Label36.Font.Bold = True

End Sub

Private Sub Label37_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label37.SpecialEffect = fmSpecialEffectBump
    Label37.Font.Bold = True
    
End Sub

Private Sub Label38_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label38.SpecialEffect = fmSpecialEffectBump
    Label38.Font.Bold = True
    
End Sub

Private Sub Label39_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label39.SpecialEffect = fmSpecialEffectBump
    Label39.Font.Bold = True

End Sub

Private Sub Label40_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������

    '�N���b�N�������ω�
    Label40.SpecialEffect = fmSpecialEffectBump
    Label40.Font.Bold = True
    
End Sub

Private Sub Label41_Click()
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label41.SpecialEffect = fmSpecialEffectBump
    Label41.Font.Bold = True
    
End Sub

Private Sub Label42_Click()

    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label42.SpecialEffect = fmSpecialEffectBump
    Label42.Font.Bold = True

End Sub


Private Sub Label1_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    
    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label1.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label1.Tag
    ufm�X�P�W���[��.Caption = Label1.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label1.SpecialEffect = fmSpecialEffectBump
    Label1.Font.Bold = True

End Sub

Private Sub Label2_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label2.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label2.Tag
    ufm�X�P�W���[��.Caption = Label2.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label2.SpecialEffect = fmSpecialEffectBump
    Label2.Font.Bold = True
    
End Sub


Private Sub Label3_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label3.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label3.Tag
    ufm�X�P�W���[��.Caption = Label3.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label3.SpecialEffect = fmSpecialEffectBump
    Label3.Font.Bold = True
    
End Sub


Private Sub Label4_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label4.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label4.Tag
    ufm�X�P�W���[��.Caption = Label4.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label4.SpecialEffect = fmSpecialEffectBump
    Label4.Font.Bold = True
End Sub

Private Sub Label5_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label5.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label5.Tag
    ufm�X�P�W���[��.Caption = Label5.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    '�N���b�N�������ω�
    Label5.SpecialEffect = fmSpecialEffectBump
    Label5.Font.Bold = True
End Sub

Private Sub Label6_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label6.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label6.Tag
    ufm�X�P�W���[��.Caption = Label6.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label6.SpecialEffect = fmSpecialEffectBump
    Label6.Font.Bold = True
End Sub

Private Sub Label7_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    
    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label7.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label7.Tag
    ufm�X�P�W���[��.Caption = Label7.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label7.SpecialEffect = fmSpecialEffectBump
    Label7.Font.Bold = True
End Sub

Private Sub Label8_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label8.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label8.Tag
    ufm�X�P�W���[��.Caption = Label8.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label8.SpecialEffect = fmSpecialEffectBump
    Label8.Font.Bold = True
End Sub

Private Sub Label9_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    
    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label9.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label9.Tag
    ufm�X�P�W���[��.Caption = Label9.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label9.SpecialEffect = fmSpecialEffectBump
    Label9.Font.Bold = True
End Sub

Private Sub Label10_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label10.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label10.Tag
    ufm�X�P�W���[��.Caption = Label10.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label10.SpecialEffect = fmSpecialEffectBump
    Label10.Font.Bold = True
End Sub

Private Sub Label11_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label11.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label11.Tag
    ufm�X�P�W���[��.Caption = Label11.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label11.SpecialEffect = fmSpecialEffectBump
    Label11.Font.Bold = True
End Sub

Private Sub Label12_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label12.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label12.Tag
    ufm�X�P�W���[��.Caption = Label12.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label12.SpecialEffect = fmSpecialEffectBump
    Label12.Font.Bold = True
End Sub

Private Sub Label13_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label13.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label13.Tag
    ufm�X�P�W���[��.Caption = Label13.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label13.SpecialEffect = fmSpecialEffectBump
    Label13.Font.Bold = True
End Sub

Private Sub Label14_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label14.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label14.Tag
    ufm�X�P�W���[��.Caption = Label14.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label14.SpecialEffect = fmSpecialEffectBump
    Label14.Font.Bold = True
End Sub

Private Sub Label15_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label15.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label15.Tag
    ufm�X�P�W���[��.Caption = Label15.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label15.SpecialEffect = fmSpecialEffectBump
    Label15.Font.Bold = True
End Sub

Private Sub Label16_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label16.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label16.Tag
    ufm�X�P�W���[��.Caption = Label16.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label16.SpecialEffect = fmSpecialEffectBump
    Label16.Font.Bold = True
End Sub

Private Sub Label17_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label17.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label17.Tag
    ufm�X�P�W���[��.Caption = Label17.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label17.SpecialEffect = fmSpecialEffectBump
    Label17.Font.Bold = True
End Sub

Private Sub Label18_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label18.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label18.Tag
    ufm�X�P�W���[��.Caption = Label18.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label18.SpecialEffect = fmSpecialEffectBump
    Label18.Font.Bold = True
End Sub

Private Sub Label19_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label19.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label19.Tag
    ufm�X�P�W���[��.Caption = Label19.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label19.SpecialEffect = fmSpecialEffectBump
    Label19.Font.Bold = True
End Sub

Private Sub Label20_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label20.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label20.Tag
    ufm�X�P�W���[��.Caption = Label20.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label20.SpecialEffect = fmSpecialEffectBump
    Label20.Font.Bold = True
End Sub

Private Sub Label21_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label21.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label21.Tag
    ufm�X�P�W���[��.Caption = Label21.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label21.SpecialEffect = fmSpecialEffectBump
    Label21.Font.Bold = True
End Sub

Private Sub Label22_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label22.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label22.Tag
    ufm�X�P�W���[��.Caption = Label22.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label22.SpecialEffect = fmSpecialEffectBump
    Label22.Font.Bold = True
End Sub

Private Sub Label23_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label23.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label23.Tag
    ufm�X�P�W���[��.Caption = Label23.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label23.SpecialEffect = fmSpecialEffectBump
    Label23.Font.Bold = True
End Sub

Private Sub Label24_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label24.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label24.Tag
    ufm�X�P�W���[��.Caption = Label24.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label24.SpecialEffect = fmSpecialEffectBump
    Label24.Font.Bold = True
End Sub

Private Sub Label25_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label25.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label25.Tag
    ufm�X�P�W���[��.Caption = Label25.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label25.SpecialEffect = fmSpecialEffectBump
    Label25.Font.Bold = True
End Sub

Private Sub Label26_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label26.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label26.Tag
    ufm�X�P�W���[��.Caption = Label26.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label26.SpecialEffect = fmSpecialEffectBump
    Label26.Font.Bold = True
End Sub

Private Sub Label27_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label27.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label27.Tag
    ufm�X�P�W���[��.Caption = Label27.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label27.SpecialEffect = fmSpecialEffectBump
    Label27.Font.Bold = True
End Sub

Private Sub Label28_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label28.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label28.Tag
    ufm�X�P�W���[��.Caption = Label28.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label28.SpecialEffect = fmSpecialEffectBump
    Label28.Font.Bold = True
End Sub

Private Sub Label29_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label29.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label29.Tag
    ufm�X�P�W���[��.Caption = Label29.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label29.SpecialEffect = fmSpecialEffectBump
    Label29.Font.Bold = True
End Sub

Private Sub Label30_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label30.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label30.Tag
    ufm�X�P�W���[��.Caption = Label30.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label30.SpecialEffect = fmSpecialEffectBump
    Label30.Font.Bold = True
End Sub

Private Sub Label31_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label31.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label31.Tag
    ufm�X�P�W���[��.Caption = Label31.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label31.SpecialEffect = fmSpecialEffectBump
    Label31.Font.Bold = True
End Sub

Private Sub Label32_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label32.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label32.Tag
    ufm�X�P�W���[��.Caption = Label32.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label32.SpecialEffect = fmSpecialEffectBump
    Label32.Font.Bold = True
End Sub

Private Sub Label33_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label33.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label33.Tag
    ufm�X�P�W���[��.Caption = Label33.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label33.SpecialEffect = fmSpecialEffectBump
    Label33.Font.Bold = True
End Sub

Private Sub Label34_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label34.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label34.Tag
    ufm�X�P�W���[��.Caption = Label34.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label34.SpecialEffect = fmSpecialEffectBump
    Label34.Font.Bold = True
End Sub

Private Sub Label35_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label35.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label35.Tag
    ufm�X�P�W���[��.Caption = Label35.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label35.SpecialEffect = fmSpecialEffectBump
    Label35.Font.Bold = True
End Sub

Private Sub Label36_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label36.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label36.Tag
    ufm�X�P�W���[��.Caption = Label36.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label36.SpecialEffect = fmSpecialEffectBump
    Label36.Font.Bold = True
End Sub

Private Sub Label37_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label37.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label37.Tag
    ufm�X�P�W���[��.Caption = Label37.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label37.SpecialEffect = fmSpecialEffectBump
    Label37.Font.Bold = True
End Sub

Private Sub Label38_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label38.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label38.Tag
    ufm�X�P�W���[��.Caption = Label38.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label38.SpecialEffect = fmSpecialEffectBump
    Label38.Font.Bold = True
End Sub

Private Sub Label39_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label39.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label39.Tag
    ufm�X�P�W���[��.Caption = Label39.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label39.SpecialEffect = fmSpecialEffectBump
    Label39.Font.Bold = True
End Sub

Private Sub Label40_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label40.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label40.Tag
    ufm�X�P�W���[��.Caption = Label40.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label40.SpecialEffect = fmSpecialEffectBump
    Label40.Font.Bold = True
End Sub

Private Sub Label41_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label41.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label41.Tag
    ufm�X�P�W���[��.Caption = Label41.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    '�J�����_�[�t�H�[��������
    Call �J�����_�[�t�H�[��������
    
    Label41.SpecialEffect = fmSpecialEffectBump
    Label41.Font.Bold = True
End Sub

Private Sub Label42_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

    '���t�̗j���擾
    Dim �j�� As String
    �j�� = Format(Weekday(Label42.Tag), "aaa")
    
    '�X�P�W���[���Ăяo��
    ufm�X�P�W���[��.Show
    ufm�X�P�W���[��.UserForm_Initialize2 Label42.Tag
    ufm�X�P�W���[��.Caption = Label42.Tag & "(" & �j�� & ")" & "  �X�P�W���[��"
    
    Call �J�����_�[�t�H�[��������

    Label42.SpecialEffect = fmSpecialEffectBump
    Label42.Font.Bold = True
End Sub

Sub ������()

    Dim ������ As String, �������j��, n As Long
    ������ = DateSerial(cmb�N.Value, cmb��.Value, 1)
    �O������ = Day(DateAdd("d", -1, ������))
    �������� = Day(DateAdd("d", -1, DateAdd("m", 1, ������)))
    �������j�� = Weekday(������, vbSunday)
    '�����������疖���܂Ŋi�[
    n = 1
    For i = �������j�� To (�������j�� + �������� - 1)
        Me.Controls("Label" & i).Caption = n
        Me.Controls("Label" & i).Tag = DateSerial(Year(������), Month(������), n)
        Me.Controls("Label" & i).BackColor = &HC0FFC0
        '�������t�擾
        If Me.Controls("Label" & i).Tag = Trim(Date) Then
            Me.Controls("Label" & i).BackColor = vbYellow
        End If
        n = n + 1
    Next i
    '�������t�i�[
    n = 1
    For i = (�������j�� + ��������) To 42
        Me.Controls("Label" & i).Caption = n
        Me.Controls("Label" & i).Tag = DateSerial(Year(DateAdd("m", 1, ������)), Month(DateAdd("m", 1, ������)), n)
        Me.Controls("Label" & i).BackColor = &HE0E0E0
        n = n + 1
    Next i
    '�O�����t�i�[
    n = �O������
    For i = (�������j�� - 1) To 1 Step -1
        Me.Controls("Label" & i).Caption = n
        Me.Controls("Label" & i).Tag = DateSerial(Year(DateAdd("m", -1, ������)), Month(DateAdd("m", -1, ������)), n)
        Me.Controls("Label" & i).BackColor = &HE0E0E0
        n = n - 1
    Next i
    '�y�j���J���[�̓u���[�ݒ�
    For i = 7 To 42 Step 7
        Me.Controls("Label" & i).ForeColor = vbBlue
    Next i
    '���j���J���[�͐ԐF�ݒ�
    For i = 1 To 36 Step 7
        Me.Controls("Label" & i).ForeColor = vbRed
    Next i
    
    For i = 1 To 42
        If �\��`�F�b�N(Me.Controls("Label" & i).Tag) Then
            Me.Controls("Label" & i).BackColor = &HFF80FF
        End If
        Me.Controls("Label" & i).SpecialEffect = fmSpecialEffectFlat
    Next i
    
End Sub

Sub �J�����_�[�t�H�[��������()

    '�J�����_�[�t�H�[��������
    For i = 1 To 42
        Me.Controls("Label" & i).SpecialEffect = fmSpecialEffectFlat
        Me.Controls("Label" & i).FontBold = False
    Next i

End Sub
