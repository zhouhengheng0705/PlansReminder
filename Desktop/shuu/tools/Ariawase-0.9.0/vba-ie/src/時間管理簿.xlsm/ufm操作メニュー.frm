VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm���상�j���[ 
   Caption         =   "���상�j���["
   ClientHeight    =   2115
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   3060
   OleObjectBlob   =   "ufm���상�j���[.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm���상�j���["
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub UserForm_Initialize()
    
    '�E�B���h�E�ʒu�E��(Excel�)
    Me.StartUpPosition = 0
    Me.Top = Application.Top + 5
    Me.Left = Application.Left + Application.Width - Me.Width - 92
    
    '�E�B���h�E�ŏ����{�^���L��
    Call FrmDec(Me.Caption, True)
    
'    cb�őO�ʕ\��_Change
    cbExcel�\��.Value = True
'    cbExcel�\��_Change
    
End Sub

Private Sub btn�p�X���[�h�ύX_Click()
    ufm�p�X���[�h�ύX.Show
End Sub

Private Sub btn���ԊǗ�_Click()
    ufm���ԊǗ��c�[��.Show
End Sub

Private Sub btn�`�P�b�g�Ǘ�_Click()
    ufm�`�P�b�g�Ǘ�.Show
End Sub

Private Sub btn�J�����_�[_Click()
    ufm�J�����_�[.Show
End Sub
