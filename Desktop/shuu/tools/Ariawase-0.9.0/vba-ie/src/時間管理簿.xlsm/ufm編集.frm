VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm�ҏW 
   Caption         =   "�ҏW"
   ClientHeight    =   3795
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7635
   OleObjectBlob   =   "ufm�ҏW.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm�ҏW"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const �Ζ��ݒ�_�{�� = 1
Const �Ζ��ݒ�_���Α��� = 2
Const �Ζ��ݒ�_���Βx�� = 3
Const �Ζ��ݒ�_�X���C�h = 4
Const �Ζ��ݒ�_�{��10�� = 5

Private Sub UserForm_Initialize()

    '�E�B���h�E�ʒu����(Excel�)
    Me.StartUpPosition = 0
    Me.Top = Application.Top + (Application.Height / 2) - Me.Height - 4
    Me.Left = Application.Left + (Application.Width / 2) - Me.Width - 4
    If Me.Top < 0 Then
        Me.Top = 0
    End If
    If Me.Left < 0 Then
        Me.Left = 0
    End If
    
    '�N�������X�g������
    cmb�ҏW_�N.Clear
    For i = Year(Date) - 2 To Year(Date) + 1
        cmb�ҏW_�N.AddItem i
    Next i
    cmb�ҏW_�N.Value = Year(Date)

    cmb�ҏW_��.Clear
    For i = 1 To 12
        cmb�ҏW_��.AddItem i
    Next i
    cmb�ҏW_��.Value = Month(Date)

    cmb�ҏW_��.Clear
    Dim ��������, �j�� As String
    �������� = Day(DateSerial(Year(cmb�ҏW_�N.Value), Month(cmb�ҏW_��.Value) + 1, 0))
    For i = 1 To ��������
        �j�� = Format(Weekday(DateSerial(cmb�ҏW_�N.Value, cmb�ҏW_��.Value, i)), "aaa")
        cmb�ҏW_��.AddItem
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 0) = i
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 1) = �j��
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 2) = i & "(" & �j�� & ")"
    Next i
    cmb�ҏW_��.Value = Day(DateAdd("d", -1, Date))
    '���j�̏ꍇ�ɋ��j���ɐݒ�
    If cmb�ҏW_��.List(cmb�ҏW_��.ListIndex, 1) = "��" Then
        cmb�ҏW_��.Value = Day(DateAdd("d", -3, Date))
    Else
        cmb�ҏW_��.Value = Day(DateAdd("d", -1, Date))
    End If
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    '�Ζ��ݒ菉����
    sql = "SELECT ���ږ�,�l" _
        & " FROM V_�Ζ��ݒ�"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    Do Until oRS.EOF
        cmb�Ζ��ݒ�.AddItem
        cmb�Ζ��ݒ�.List(cmb�Ζ��ݒ�.ListCount - 1, 0) = oRS.Fields("�l")
        cmb�Ζ��ݒ�.List(cmb�Ζ��ݒ�.ListCount - 1, 1) = oRS.Fields("���ږ�")
        oRS.MoveNext
    Loop
    cmb�Ζ��ݒ�.Value = cmb�Ζ��ݒ�.List(0, 0)
    
        
    '�v���W�F�N�g���X�g������
    sql = "SELECT �v���W�F�N�g��, �v���W�F�N�g�ԍ�,���ږ�" _
        & " FROM �v���W�F�N�g�Ǘ� LEFT JOIN V_����R�[�h ON V_����R�[�h.�l = �v���W�F�N�g�Ǘ�.����R�[�h"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    cmb�v���W�F�N�g.Clear
    cmb�v���W�F�N�g.AddItem
    Do Until oRS.EOF
        cmb�v���W�F�N�g.AddItem
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 0) = oRS.Fields("�v���W�F�N�g�ԍ�").Value
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 1) = oRS.Fields("�v���W�F�N�g��").Value
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 2) = oRS.Fields("���ږ�").Value
        oRS.MoveNext
    Loop
    cmb�v���W�F�N�g.Value = cmb�v���W�F�N�g.List(1, 0)
    
    
    '�`�P�b�g�����X�g�擾
    sql = "SELECT �`�P�b�g�ԍ�,�`�P�b�g��,(�`�P�b�g�ԍ� & "" "" & �`�P�b�g��) As �\����,�X�e�[�^�X,���ږ�" _
        & " FROM �`�P�b�g�Ǘ�" _
        & " LEFT JOIN V_�X�e�[�^�X ON val(V_�X�e�[�^�X.�l) = �`�P�b�g�Ǘ�.�X�e�[�^�X" _
        & " WHERE �`�P�b�g�Ǘ�.�`�P�b�g�ԍ� <> '" & "" & "'" _
        & " AND �`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ� ='" & cmb�v���W�F�N�g.Value & "'" _
        & " ORDER BY �`�P�b�g�Ǘ�.�X�e�[�^�X,�`�P�b�g�ԍ�"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    cmb�`�P�b�g��.Clear
    Do Until oRS.EOF
        cmb�`�P�b�g��.AddItem
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 0) = oRS.Fields("���ږ�").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 1) = oRS.Fields("�`�P�b�g�ԍ�").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 2) = oRS.Fields("�`�P�b�g��").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 3) = oRS.Fields("�\����").Value
        oRS.MoveNext
    Loop

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    '�J�n�I�����ԏ�����
    cmb�J�n_��.Clear
    cmb�I��_��.Clear
    cmb�J�n_��.AddItem
    cmb�I��_��.AddItem
    For i = 8 To 22
        cmb�J�n_��.AddItem Format(i, "00")
        cmb�I��_��.AddItem Format(i, "00")
    Next i

    cmb�J�n_��.Clear
    cmb�I��_��.Clear
    cmb�J�n_��.AddItem
    cmb�I��_��.AddItem
    For i = 0 To 45 Step 15
        cmb�J�n_��.AddItem Format(i, "00")
        cmb�I��_��.AddItem Format(i, "00")
    Next i
    
    Exit Sub

ErrDataInvalid:
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B", vbExclamation
    Unload Me
    Exit Sub
    
ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Unload Me
    Exit Sub
    
ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical
    Unload Me
    
End Sub

Private Sub cmb�v���W�F�N�g_Change()

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen


    '�`�P�b�g�����X�g�擾
    sql = "SELECT �`�P�b�g�ԍ�,�`�P�b�g��,(�`�P�b�g�ԍ� & "" "" & �`�P�b�g��) As �\����,�X�e�[�^�X,���ږ�" _
        & " FROM �`�P�b�g�Ǘ�" _
        & " LEFT JOIN V_�X�e�[�^�X ON val(V_�X�e�[�^�X.�l) = �`�P�b�g�Ǘ�.�X�e�[�^�X" _
        & " WHERE �`�P�b�g�Ǘ�.�`�P�b�g�ԍ� <> '" & "" & "'" _
        & " AND �`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ� ='" & cmb�v���W�F�N�g.Value & "'" _
        & " ORDER BY �`�P�b�g�Ǘ�.�X�e�[�^�X"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    cmb�`�P�b�g��.Clear
    Do Until oRS.EOF
        cmb�`�P�b�g��.AddItem
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 0) = oRS.Fields("���ږ�").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 1) = oRS.Fields("�`�P�b�g�ԍ�").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 2) = oRS.Fields("�`�P�b�g��").Value
        cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListCount - 1, 3) = oRS.Fields("�\����").Value
        oRS.MoveNext
    Loop
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    Exit Sub

ErrDataInvalid:
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B", vbExclamation
    Unload Me
    Exit Sub

ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Unload Me
    Exit Sub

ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical
    Unload Me

End Sub

Sub UserForm_Initialize2(�L�^�ԍ� As String)
    
    txt�L�^�ԍ�.Value = �L�^�ԍ�
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    '���R�[�h�Z�b�g�擾
    Set oRS = oDB.OpenRecordset("���ԊǗ�", dbOpenTable)
    oRS.Index = "�L�^�ԍ�"
    oRS.Seek "=", txt�L�^�ԍ�.Value
    If oRS.NoMatch Then
        GoTo ErrDataInvalid
    End If
    
    cmb�`�P�b�g��.Value = Null
    
    '�ҏW���֏o��
    cmb�ҏW_�N.Value = Year(oRS.Fields("�L�^���t").Value)
    cmb�ҏW_��.Value = Month(oRS.Fields("�L�^���t").Value)
    cmb�ҏW_��.Value = Day(oRS.Fields("�L�^���t").Value)
    cmb�Ζ��ݒ�.Value = oRS.Fields("�Ζ��ݒ�").Value
    cmb�v���W�F�N�g.Value = oRS.Fields("�v���W�F�N�g�ԍ�").Value
    cmb�`�P�b�g��.Value = Null2Blank(oRS.Fields("�`�P�b�g�ԍ�"))
    cmb�J�n_��.Value = Format(Hour(oRS.Fields("�J�n����")), "00")
    cmb�J�n_��.Value = Format(Minute(oRS.Fields("�J�n����")), "00")
    cmb�I��_��.Value = Format(Hour(oRS.Fields("�I������")), "00")
    cmb�I��_��.Value = Format(Minute(oRS.Fields("�I������")), "00")
    cb����.Value = oRS.Fields("�폜�t���O").Value
    txt�R�����g.Value = oRS.Fields("�R�����g").Value
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    '�X�V�{�^���L����
    btn�ǉ�.Visible = False
    btn�X�V.Visible = True
    
    Exit Sub
    
ErrDataInvalid:
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ŐV�̏����m�F���Ă��������B", vbExclamation
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

    '���t���̓`�F�b�N
    Dim �L�^���t As String
    If cmb�ҏW_�N.Value = "" Or cmb�ҏW_�� = "" Or cmb�ҏW_�� = "" Then
        MsgBox "�L�^���t����͂��Ă��������B", vbExclamation
    End If
    �L�^���t = cmb�ҏW_�N.Value & "/" & Format(cmb�ҏW_��.Value, "00") & "/" & Format(cmb�ҏW_��, "00")
    
    '�Ζ��ݒ���̓`�F�b�N
    Dim �Ζ��ݒ� As Long
    If cmb�Ζ��ݒ�.Text = "" Then
        MsgBox "�Ζ��ݒ����͂��Ă��������B", vbExclamation
        cmb�Ζ��ݒ�.SetFocus
        Exit Sub
    Else
        �Ζ��ݒ� = cmb�Ζ��ݒ�.Value
    End If
    
    '�v���W�F�N�g���̓`�F�b�N
    Dim �v���W�F�N�g As String
    If cmb�v���W�F�N�g.Text = "" Then
        �v���W�F�N�g = ""
    ElseIf IsNull(cmb�v���W�F�N�g.Value) Then
        If Not �v���W�F�N�g�����`�F�b�N(cmb�v���W�F�N�g.Text) Then
            MsgBox "�v���W�F�N�g���͂��s���ł��B", vbExclamation
            cmb�v���W�F�N�g.SetFocus
            Exit Sub
        Else
            �v���W�F�N�g = cmb�v���W�F�N�g.Text
        End If
    Else
        �v���W�F�N�g = cmb�v���W�F�N�g.Value
    End If
    
    '�`�P�b�g�����̓`�F�b�N
    Dim �`�P�b�g�� As String
    If cmb�`�P�b�g��.Text = "" Then
        �`�P�b�g�� = ""
    ElseIf IsNull(cmb�`�P�b�g��.Value) Then
        If Not �`�P�b�g�������`�F�b�N(cmb�`�P�b�g��.Text) Then
            MsgBox "�`�P�b�g�����͂��s���ł��B", vbExclamation
            cmb�`�P�b�g��.SetFocus
            Exit Sub
        Else
            �`�P�b�g�� = cmb�`�P�b�g��.Text
        End If
    Else
        �`�P�b�g�� = cmb�`�P�b�g��.Value
    End If
    
    '�J�n���ԓ��̓`�F�b�N
    Dim �J�n���� As String
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Then
        MsgBox "�J�n���Ԃ���͂��Ă��������B", vbExclamation
        cmb�J�n_��.SetFocus
        Exit Sub
    End If
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    
    '�I�����ԓ��̓`�F�b�N
    Dim �I������ As String
    If cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        MsgBox "�I�����Ԃ���͂��Ă��������B", vbExclamation
        cmb�I��_��.SetFocus
        Exit Sub
    End If
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    
    If �J�n���� > �I������ Then
        MsgBox "�I�����Ԃ���͂��Ă��������B", vbExclamation
        cmb�I��_��.SetFocus
        Exit Sub
    End If
    
    Dim ���Ԑ� As Double
    If txt���Ԑ�.Value <> "" Then
        ���Ԑ� = txt���Ԑ�.Value
    End If
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen
    
    Set oRS = oDB.OpenRecordset("���ԊǗ�", dbOpenTable)
    
    '�g�����U�N�V�����J�n
    oWks.BeginTrans
    
    '�V�K���R�[�h�ǉ�
    oRS.AddNew
    txt�L�^�ԍ�.Value = "K" & Format(Now(), "yyyymmdd") & "-" & Right(Format(oRS.Fields("ID").Value, "0000"), 4)
    oRS.Fields("�L�^�ԍ�").Value = txt�L�^�ԍ�.Value
    oRS.Fields("�L�^���t").Value = �L�^���t
    oRS.Fields("�v���W�F�N�g�ԍ�").Value = �v���W�F�N�g
    oRS.Fields("�`�P�b�g�ԍ�").Value = �`�P�b�g��
    oRS.Fields("�J�n����").Value = �J�n����
    oRS.Fields("�I������").Value = �I������
    oRS.Fields("���Ԑ�").Value = Null2Blank(���Ԑ�)
    oRS.Fields("�Ζ��ݒ�").Value = �Ζ��ݒ�
    oRS.Fields("�R�����g").Value = txt�R�����g.Value
    oRS.Fields("�폜�t���O").Value = cb����.Value
    If Left(oRS.Fields("�`�P�b�g�ԍ�").Value, 1) = "#" Then
        oRS.Fields("����\�t").Value = �J�n���� & "�`" & �I������ & "[" & Format(���Ԑ�, "00.00") & "H" & "]" & cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListIndex, 3)
    Else
        oRS.Fields("����\�t").Value = �J�n���� & "�`" & �I������ & "[" & Format(���Ԑ�, "00.00") & "H" & "]" & Trim(txt�R�����g.Value)
    End If
    oRS.Update
    
    '�g�����U�N�V��������
    oWks.CommitTrans
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    ufm���ԊǗ��c�[��.btn����_Click
    MsgBox "�f�[�^�̓o�^�ɐ������܂����B", vbInformation
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

Private Sub btn�X�V_Click()

    '���t���̓`�F�b�N
    Dim �L�^���t As String
    If cmb�ҏW_�N.Value = "" Or cmb�ҏW_�� = "" Or cmb�ҏW_�� = "" Then
        MsgBox "�L�^���t����͂��Ă��������B", vbExclamation
    End If
    �L�^���t = cmb�ҏW_�N.Value & "/" & Format(cmb�ҏW_��.Value, "00") & "/" & Format(cmb�ҏW_��, "00")
    
    '�Ζ��ݒ���̓`�F�b�N
    Dim �Ζ��ݒ� As Long
    If cmb�Ζ��ݒ�.Text = "" Then
        MsgBox "�Ζ��ݒ����͂��Ă��������B", vbExclamation
        cmb�Ζ��ݒ�.SetFocus
        Exit Sub
    Else
        �Ζ��ݒ� = cmb�Ζ��ݒ�.Value
    End If
    
    
    '�v���W�F�N�g���̓`�F�b�N
    Dim �v���W�F�N�g As String
    If cmb�v���W�F�N�g.Text = "" Then
        �v���W�F�N�g = ""
    ElseIf IsNull(cmb�v���W�F�N�g.Value) Then
        If Not �v���W�F�N�g�����`�F�b�N(cmb�v���W�F�N�g.Text) Then
            MsgBox "�v���W�F�N�g���͂��s���ł��B", vbExclamation
            cmb�v���W�F�N�g.SetFocus
            Exit Sub
        Else
            �v���W�F�N�g = cmb�v���W�F�N�g.Text
        End If
    Else
        �v���W�F�N�g = cmb�v���W�F�N�g.Value
    End If
    
    '�`�P�b�g�����̓`�F�b�N
    Dim �`�P�b�g�� As String
    If cmb�`�P�b�g��.Text = "" Then
        �`�P�b�g�� = ""
    ElseIf IsNull(cmb�`�P�b�g��.Value) Then
        If Not �`�P�b�g�������`�F�b�N(cmb�`�P�b�g��.Text) Then
            MsgBox "�`�P�b�g�����͂��s���ł��B", vbExclamation
            cmb�`�P�b�g��.SetFocus
            Exit Sub
        Else
            �`�P�b�g�� = cmb�`�P�b�g��.Text
        End If
    Else
        �`�P�b�g�� = cmb�`�P�b�g��.Value
    End If
    
    '�J�n���ԓ��̓`�F�b�N
    Dim �J�n���� As String
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Then
        MsgBox "�J�n���Ԃ���͂��Ă��������B", vbExclamation
        cmb�J�n_��.SetFocus
        Exit Sub
    End If
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    
    '�I�����ԓ��̓`�F�b�N
    Dim �I������ As String
    If cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        MsgBox "�I�����Ԃ���͂��Ă��������B", vbExclamation
        cmb�I��_��.SetFocus
        Exit Sub
    End If
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    
    If �J�n���� > �I������ Then
        MsgBox "�I�����Ԃ���͂��Ă��������B", vbExclamation
        cmb�I��_��.SetFocus
        Exit Sub
    End If
    
    Dim ���Ԑ� As Double
    If txt���Ԑ�.Value <> "" Then
        ���Ԑ� = txt���Ԑ�.Value
    End If
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen
    
    Set oRS = oDB.OpenRecordset("���ԊǗ�", dbOpenTable)
    oRS.Index = "�L�^�ԍ�"
    oRS.Seek "=", txt�L�^�ԍ�.Value
    If oRS.NoMatch Then
        GoTo ErrDataInvalid
    End If
    
    '�g�����U�N�V�����J�n
    oWks.BeginTrans
    
    '�V�K���R�[�h�ǉ�
    oRS.Edit
    oRS.Fields("�L�^���t").Value = �L�^���t
    oRS.Fields("�v���W�F�N�g�ԍ�").Value = �v���W�F�N�g
    oRS.Fields("�`�P�b�g�ԍ�").Value = �`�P�b�g��
    oRS.Fields("�J�n����").Value = �J�n����
    oRS.Fields("�I������").Value = �I������
    oRS.Fields("���Ԑ�").Value = Null2Blank(���Ԑ�)
    oRS.Fields("�Ζ��ݒ�").Value = �Ζ��ݒ�
    oRS.Fields("�R�����g").Value = txt�R�����g.Value
    oRS.Fields("�폜�t���O").Value = cb����.Value
    If Left(oRS.Fields("�`�P�b�g�ԍ�").Value, 1) <> "" Then
        oRS.Fields("����\�t").Value = �J�n���� & "�`" & �I������ & "[" & Format(���Ԑ�, "00.00") & "H" & "]" & cmb�`�P�b�g��.List(cmb�`�P�b�g��.ListIndex, 3)
    Else
        oRS.Fields("����\�t").Value = �J�n���� & "�`" & �I������ & "[" & Format(���Ԑ�, "00.00") & "H" & "]" & Trim(txt�R�����g.Value)
    End If
    oRS.Update
    
    '�g�����U�N�V��������
    oWks.CommitTrans
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    ufm���ԊǗ��c�[��.btn����_Click
    MsgBox "�f�[�^�̍X�V�ɐ������܂����B", vbInformation
    Exit Sub
    
ErrDataInvalid:
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�L�^�Č������o�^�ł��B", vbExclamation
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

Private Sub cmb�J�n_��_Change()

    Dim �Q�ƃV�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�o�Ύ��Ԑݒ�")
    
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Or cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        Exit Sub
    End If
    
    Dim �J�n����, �I������ As String
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    If �J�n���� > �I������ Then
        Exit Sub
    End If
    
    Dim �J�n�������l, �I���������l, �J�n���Ԑ�, �I�����Ԑ� As Double
    
    �J�n�������l = val(cmb�J�n_��.Value) + val(cmb�J�n_��.Value / 60)
    �I���������l = val(cmb�I��_��.Value) + val(cmb�I��_��.Value / 60)
    
    
    Select Case cmb�Ζ��ݒ�.Value
        
        '----------------'
        Case �Ζ��ݒ�_�{��
        
        For i = 3 To 61
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
    
        '----------------'
        Case �Ζ��ݒ�_���Α���
        
        For i = 3 To 63
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_�X���C�h
        
        For i = 3 To 43
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '-----------------'
        Case �Ζ��ݒ�_�{��10��
        
        For i = 3 To 49
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 49
            If �I���������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
    End Select
        
End Sub

Private Sub cmb�J�n_��_Change()

    Dim �Q�ƃV�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�o�Ύ��Ԑݒ�")
    
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Or cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        Exit Sub
    End If
    
    Dim �J�n����, �I������ As String
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    If �J�n���� > �I������ Then
        Exit Sub
    End If
    
    Dim �J�n�������l, �I���������l, �J�n���Ԑ�, �I�����Ԑ� As Double
    
    �J�n�������l = val(cmb�J�n_��.Value) + val(cmb�J�n_��.Value / 60)
    �I���������l = val(cmb�I��_��.Value) + val(cmb�I��_��.Value / 60)
    
    
    Select Case cmb�Ζ��ݒ�.Value
        
        '----------------'
        Case �Ζ��ݒ�_�{��
        
        For i = 3 To 61
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_���Α���
        
        For i = 3 To 63
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_�X���C�h
        
        For i = 3 To 43
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '-----------------'
        Case �Ζ��ݒ�_�{��10��
        
        For i = 3 To 49
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 49
            If �I���������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
    End Select
        
End Sub

Private Sub cmb�I��_��_Change()

    Dim �Q�ƃV�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�o�Ύ��Ԑݒ�")
    
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Or cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        Exit Sub
    End If
    
    Dim �J�n����, �I������ As String
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    If �J�n���� > �I������ Then
        Exit Sub
    End If
    
    Dim �J�n�������l, �I���������l, �J�n���Ԑ�, �I�����Ԑ� As Double
    
    �J�n�������l = val(cmb�J�n_��.Value) + val(cmb�J�n_��.Value / 60)
    �I���������l = val(cmb�I��_��.Value) + val(cmb�I��_��.Value / 60)
    
    
    Select Case cmb�Ζ��ݒ�.Value
        
        '----------------'
        Case �Ζ��ݒ�_�{��
        
        For i = 3 To 61
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_���Α���
        
        For i = 3 To 63
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_�X���C�h
        
        For i = 3 To 43
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '-----------------'
        Case �Ζ��ݒ�_�{��10��
        
        For i = 3 To 49
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 49
            If �I���������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
    End Select
        
End Sub

Private Sub cmb�I��_��_Change()

    Dim �Q�ƃV�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�o�Ύ��Ԑݒ�")
    
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Or cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        Exit Sub
    End If
    
    Dim �J�n����, �I������ As String
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    If �J�n���� > �I������ Then
        Exit Sub
    End If
    
    Dim �J�n�������l, �I���������l, �J�n���Ԑ�, �I�����Ԑ� As Double
    
    �J�n�������l = val(cmb�J�n_��.Value) + val(cmb�J�n_��.Value / 60)
    �I���������l = val(cmb�I��_��.Value) + val(cmb�I��_��.Value / 60)
    
    
    Select Case cmb�Ζ��ݒ�.Value
        
        '----------------'
        Case �Ζ��ݒ�_�{��
        
        For i = 3 To 61
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_���Α���
        
        For i = 3 To 63
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_�X���C�h
        
        For i = 3 To 43
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '-----------------'
        Case �Ζ��ݒ�_�{��10��
        
        For i = 3 To 49
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 49
            If �I���������l = �Q�ƃV�[�g.Cells(i, 8).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 9).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
    End Select
        
End Sub

Private Sub cmb�Ζ��ݒ�_Change()
    
    Dim �Q�ƃV�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�o�Ύ��Ԑݒ�")
    
    If cmb�J�n_��.Value = "" Or cmb�J�n_��.Value = "" Or cmb�I��_��.Value = "" Or cmb�I��_��.Value = "" Then
        Exit Sub
    End If
    
    Dim �J�n����, �I������ As String
    �J�n���� = Format(cmb�J�n_��.Value, "00") & ":" & Format(cmb�J�n_��.Value, "00")
    �I������ = Format(cmb�I��_��.Value, "00") & ":" & Format(cmb�I��_��.Value, "00")
    If �J�n���� > �I������ Then
        Exit Sub
    End If
    
    Dim �J�n�������l, �I���������l, �J�n���Ԑ�, �I�����Ԑ� As Double
    
    �J�n�������l = val(cmb�J�n_��.Value) + val(cmb�J�n_��.Value / 60)
    �I���������l = val(cmb�I��_��.Value) + val(cmb�I��_��.Value / 60)
    
    
    Select Case cmb�Ζ��ݒ�.Value
        
        '----------------'
        Case �Ζ��ݒ�_�{��
        
        For i = 3 To 61
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 2).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 3).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_���Α���
        
        For i = 3 To 63
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 4).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 5).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
        '----------------'
        Case �Ζ��ݒ�_�X���C�h
        
        For i = 3 To 43
            If �J�n�������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �J�n���Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        For i = 3 To 61
            If �I���������l = �Q�ƃV�[�g.Cells(i, 6).Value Then
                �I�����Ԑ� = �Q�ƃV�[�g.Cells(i, 7).Value
                Exit For
            End If
        Next i
        
        txt���Ԑ�.Value = Format(�I�����Ԑ� - �J�n���Ԑ�, "00.00")
        
    End Select
    
End Sub

Private Sub cmb�ҏW_��_Change()

    cmb�ҏW_��.Clear
    cmb�ҏW_��.AddItem
    Dim ��������, �j�� As String

    �������� = Day(DateSerial(cmb�ҏW_�N.Value, cmb�ҏW_��.Value + 1, 0))
    For i = 1 To ��������
        �j�� = Format(Weekday(DateSerial(cmb�ҏW_�N.Value, cmb�ҏW_��.Value, i)), "aaa")
        cmb�ҏW_��.AddItem
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 0) = i
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 1) = �j��
        cmb�ҏW_��.List(cmb�ҏW_��.ListCount - 1, 2) = i & "(" & �j�� & ")"
    Next i

End Sub

Private Sub cmb�`�P�b�g��_KeyDown(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    If KeyCode = vbKeyReturn Then
        If cmb�`�P�b�g��.Text = "" Then
            Exit Sub
        End If
        If �`�P�b�g�������`�F�b�N(cmb�`�P�b�g��.Text) Then
            Exit Sub
        End If
        '�L�[���[�h���͂ŃG���^�[�L�[�������ꂽ��e�L�X�g����
        Dim �`�P�b�g�� As String
        �`�P�b�g�� = SearchComboboxText(cmb�`�P�b�g��, 2, cmb�`�P�b�g��.Text)
        If �`�P�b�g�� <> "" Then
            cmb�`�P�b�g��.Value = �`�P�b�g��
        End If
    End If
End Sub

