VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm�X�P�W���[�� 
   Caption         =   "�X�P�W���[��"
   ClientHeight    =   4065
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5280
   OleObjectBlob   =   "ufm�X�P�W���[��.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm�X�P�W���[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Sub UserForm_Initialize()

    '�E�B���h�E�ʒu����(Excel�)
    If ufm�J�����_�[.Visible = False Then
        Me.StartUpPosition = 0
        Me.Top = Application.Top + (Application.Height / 2) - Me.Height - 4
        Me.Left = Application.Left + (Application.Width / 2) - Me.Width - 4
        If Me.Top < 0 Then
            Me.Top = 0
        End If
        If Me.Left < 0 Then
            Me.Left = 0
        End If
    Else
        Me.StartUpPosition = 0
        Me.Top = ufm�J�����_�[.Top
        Me.Left = ufm�J�����_�[.Left + ufm�J�����_�[.Width - 10
        Me.Height = 142.5
        Me.Width = 272.5
    End If
    
    '�E�B���h�E�ŏ����{�^���L��
    Call FrmDec(Me.Caption, True, True, True)
    
    '���X�g�r���[������
    lv�X�P�W���[��.ColumnHeaders.Clear
    lv�X�P�W���[��.ColumnHeaders.Add , "���t", "���t", 65
    lv�X�P�W���[��.ColumnHeaders.Add , "�J�n����", "�J�n����", 45
    lv�X�P�W���[��.ColumnHeaders.Add , "���e", "���e", 180
    lv�X�P�W���[��.ColumnHeaders.Add , "�X�P�W���[���ԍ�", "�X�P�W���[���ԍ�", 0

    '�J�n�I�����ԏ�����
    cmb�J�n_��.Clear
    cmb�J�n_��.AddItem
    For i = 8 To 22
        cmb�J�n_��.AddItem Format(i, "00")
    Next i

    cmb�J�n_��.Clear
    cmb�J�n_��.AddItem
    For i = 0 To 45 Step 15
        cmb�J�n_��.AddItem Format(i, "00")
    Next i

End Sub

Sub UserForm_Initialize2(���t As String)

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    
    txt���t.Value = ���t
    On Error GoTo ErrRSOpen
    sql = "SELECT *" _
        & " FROM �X�P�W���[��" _
        & " WHERE �X�P�W���[��.���t =#" & ���t & "#"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    lv�X�P�W���[��.ListItems.Clear
    Do Until oRS.EOF
        With lv�X�P�W���[��.ListItems.Add
            .Text = oRS.Fields("���t").Value
            .SubItems(1) = Format(oRS.Fields("�J�n����").Value, "hh:mm")
            .SubItems(2) = oRS.Fields("���e").Value
            .SubItems(3) = oRS.Fields("�X�P�W���[���ԍ�").Value
        End With
        oRS.MoveNext
    Loop
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    Exit Sub
    
ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub

ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Private Sub btn�ǉ�_Click()

   '�J�n���ԓ��̓`�F�b�N
    Dim �J�n���� As String
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Then
        MsgBox "�J�n���Ԃ���͂��Ă��������B", vbExclamation
        cmb�J�n_��.SetFocus
        Exit Sub
    End If
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen
    
    Set oRS = oDB.OpenRecordset("�X�P�W���[��", dbOpenTable)
    
    '�V�K���R�[�h�ǉ�
    oRS.AddNew
    txt�X�P�W���[���ԍ�.Value = Right(Format(oRS.Fields("ID").Value, "0000"), 4)
    oRS.Fields("�X�P�W���[���ԍ�").Value = txt�X�P�W���[���ԍ�.Value
    oRS.Fields("���t").Value = Null2Blank(txt���t.Value)
    oRS.Fields("�J�n����").Value = Null2Blank(�J�n����)
    oRS.Fields("���e").Value = Null2Blank(txt���e.Value)
    oRS.Update
    
    '�\����t���X�g�N���A
    Const �Q�ƃV�[�g�� = "�\����t"
    Const �o�͊J�n�s = 2
    Const �o�͊J�n�� = 1
    Dim �Q�ƃV�[�g As Worksheet, �ŏI�s As Long, �ŏI�� As Long
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets(�Q�ƃV�[�g��)
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Columns(�Q�ƃV�[�g.UsedRange.Columns.Count).Column
    If �ŏI�s >= �o�͊J�n�s Then
        '�ēǍ����K�v�ꍇ�̂݃N���A
        �Q�ƃV�[�g.Rows(�o�͊J�n�s & ":" & �ŏI�s).Delete Shift:=xlUp
    End If
    
    Dim sql As String
    '�\����t���X�g�擾
    sql = "SELECT ���t" _
        & " FROM �X�P�W���[��"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    �Q�ƃV�[�g.Cells(�o�͊J�n�s, �o�͊J�n��).CopyFromRecordset oRS
    

    Call ufm�J�����_�[.������

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    MsgBox "�f�[�^�̓o�^�ɐ������܂���", vbInformation
    
    UserForm_Initialize2 txt���t.Value
    
    Exit Sub
    
ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̓o�^�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub
    
ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Private Sub btn�폜_Click()

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    
    Dim �X�P�W���[���ԍ� As String, n As Long
    n = 0
    If lv�X�P�W���[��.ListItems.Count <> 0 Then
        For i = 1 To lv�X�P�W���[��.ListItems.Count
            If lv�X�P�W���[��.ListItems.Item(i).Checked = True Then
                �X�P�W���[���ԍ� = lv�X�P�W���[��.ListItems(i).SubItems(3)
                On Error GoTo ErrRSOpen
                Set oRS = oDB.OpenRecordset("�X�P�W���[��", dbOpenTable)
                oRS.Index = "�X�P�W���[���ԍ�����"
                oRS.Seek "=", �X�P�W���[���ԍ�
                oRS.Delete
                n = n + 1
            End If
        Next i
    Else
        Exit Sub
    End If
    
    If n = 0 Then
        MsgBox "�폜����f�[�^��I�����Ă��������B", vbExclamation
        Exit Sub
    End If
    
    '�\����t���X�g�N���A
    Const �Q�ƃV�[�g�� = "�\����t"
    Const �o�͊J�n�s = 2
    Const �o�͊J�n�� = 1
    Dim �Q�ƃV�[�g As Worksheet, �ŏI�s As Long, �ŏI�� As Long
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets(�Q�ƃV�[�g��)
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Columns(�Q�ƃV�[�g.UsedRange.Columns.Count).Column
    If �ŏI�s >= �o�͊J�n�s Then
        '�ēǍ����K�v�ꍇ�̂݃N���A
        �Q�ƃV�[�g.Rows(�o�͊J�n�s & ":" & �ŏI�s).Delete Shift:=xlUp
    End If
    
    Dim sql As String
    '�\����t���X�g�擾
    sql = "SELECT ���t" _
        & " FROM �X�P�W���[��"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    �Q�ƃV�[�g.Cells(�o�͊J�n�s, �o�͊J�n��).CopyFromRecordset oRS
    
    For i = 1 To 42
        If �\��`�F�b�N(ufm�J�����_�[.Controls("Label" & i).Tag) Then
            ufm�J�����_�[.Controls("Label" & i).BackColor = &HFF80FF
        End If
    Next i
    
    Call ufm�J�����_�[.������
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    MsgBox "�I�������f�[�^���폜���܂����B", vbInformation
    
    UserForm_Initialize2 txt���t.Value
    
    Exit Sub
    
ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̓o�^�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub
    
ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Private Sub btn�ŏ���_Click()
    
    Me.Height = 142.5
    Me.Width = 272.5
    btn�ŏ���.Visible = False
    btn�ő剻.Visible = True

End Sub

Private Sub btn�ő剻_Click()
    
    Me.Height = 227.5
    Me.Width = 272.5
    btn�ő剻.Visible = False
    btn�ŏ���.Visible = True

End Sub

