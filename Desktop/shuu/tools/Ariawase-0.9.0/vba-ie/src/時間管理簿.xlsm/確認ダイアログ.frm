VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} �m�F�_�C�A���O 
   Caption         =   "Microsoft Excel"
   ClientHeight    =   1575
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4875
   OleObjectBlob   =   "�m�F�_�C�A���O.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "�m�F�_�C�A���O"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public ���� As Boolean
Dim FormHeight As Long '�t�H�[���̍���

Private Sub UserForm_Initialize()
    If Me.Tag = "" Then Me.Tag = 1
    FormHeight = Me.Height
    Me.StartUpPosition = 2 '�����\���Œ�
End Sub

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If CloseMode = vbFormControlMenu Then
        Cancel = True
        btn�L�����Z��_Click
    End If
End Sub

Private Sub UserForm_Activate()
    Me.Height = IIf(Me.Height = FormHeight, FormHeight + 1, FormHeight)
End Sub

Private Sub UserForm_Resize()
    Dim �� As Integer
    �� = lbl���b�Z�[�W.Height + 65
    If �� > Me.Height Then
        Me.Height = ��
        cb�ŏI�m�F.Height = lbl���b�Z�[�W.Height + 20
        btnOK.Top = lbl���b�Z�[�W.Height + cb�ŏI�m�F.Height + 20
        btn�L�����Z��.Top = lbl���b�Z�[�W.Height + cb�ŏI�m�F.Height + 20
    End If
    Me.Repaint
    ShowSystemIcon Me.Caption, Me.Tag
End Sub

Sub �\��(���b�Z�[�W As String, Optional �ŏI�m�F As String = "")
    ���� = False
    lbl���b�Z�[�W.Caption = ���b�Z�[�W
    If �ŏI�m�F = "" Then
        cb�ŏI�m�F.Value = True
        cb�ŏI�m�F.Visible = False
    Else
        cb�ŏI�m�F.Caption = �ŏI�m�F
        cb�ŏI�m�F.Value = False
        cb�ŏI�m�F.Visible = True
    End If
    Me.Show
    ShowSystemIcon Me.Caption, Me.Tag

End Sub

Private Sub cb�ŏI�m�F_Click()
    btnOK.Enabled = cb�ŏI�m�F.Value
End Sub

Private Sub btn�L�����Z��_Click()
    '�����ɃL�����Z���������L�q
    ���� = False
    Me.Hide
'    Unload Me
End Sub

Private Sub btnOK_Click()
    '������OK�������L�q
    ���� = True
    Me.Hide
'    Unload Me
End Sub

