VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm�`�P�b�g�Ǘ� 
   Caption         =   "�`�P�b�g�Ǘ�"
   ClientHeight    =   9855
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9795
   OleObjectBlob   =   "ufm�`�P�b�g�Ǘ�.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm�`�P�b�g�Ǘ�"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

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
    
    '�E�B���h�E�ŏ����{�^���L��
    Call FrmDec(Me.Caption, True, True, True)
    
    '���X�g�r���[������
    lv�`�P�b�g.ColumnHeaders.Clear
    lv�`�P�b�g.ColumnHeaders.Add , "�g���b�J�[", "�g���b�J�[", 50
    lv�`�P�b�g.ColumnHeaders.Add , "�D��x", "�D��x", 40
    lv�`�P�b�g.ColumnHeaders.Add , "�v���W�F�N�g��", "�v���W�F�N�g��", 85
    lv�`�P�b�g.ColumnHeaders.Add , "�`�P�b�g�ԍ�", "�`�P�b�g�ԍ�", 55
    lv�`�P�b�g.ColumnHeaders.Add , "�`�P�b�g��", "�`�P�b�g��", 180
    lv�`�P�b�g.ColumnHeaders.Add , "�X�e�[�^�X", "�X�e�[�^�X", 45
    lv�`�P�b�g.ColumnHeaders.Add , "�i����", "�i����", 40
    lv�`�P�b�g.ColumnHeaders.Add , "�J�n", "�J�n", 80
    lv�`�P�b�g.ColumnHeaders.Add , "����", "����", 80
    lv�`�P�b�g.ColumnHeaders.Add , "�����[�X�\���", "�����[�X�\���", 80
    lv�`�P�b�g.ColumnHeaders.Add , "�\��H��", "�\��H��", 65
    lv�`�P�b�g.ColumnHeaders.Add , "�L�^�H��", "�L�^�H��", 65
    lv�`�P�b�g.ColumnHeaders.Add , "����", "����", 40
    lv�`�P�b�g.ColumnHeaders.Add , "�`�P�b�g�Ǘ��ԍ�", "�`�P�b�g�Ǘ��ԍ�", 0
    lv�`�P�b�g.ColumnHeaders.Add , "����̍��", "����̍��", 0
    lv�`�P�b�g.ColumnHeaders.Add , "���l", "���l"
    
    '�����N�����X�g������
    cmb��������_�N.Clear
    cmb��������_�N.AddItem
    For i = Year(Date) - 2 To Year(Date) + 1
        cmb��������_�N.AddItem i
    Next i
    
    '�����͈�:��������3�����O�������J�n���Ƃ���
    If Month(Date) < 4 Then
        cmb��������_�N.Value = Year(Date) - 1
    Else
        cmb��������_�N.Value = Year(Date)
    End If
    
    cmb��������_��.Clear
    cmb��������_��.AddItem
    For i = 1 To 12
        cmb��������_��.AddItem i
    Next i
    cmb��������_��.Value = Month(DateAdd("m", -3, Date))
    
    
    '�N���X�g������
    cmb�J�n_�N.Clear
    cmb����_�N.Clear
    cmb�����[�X�\���_�N.Clear
    cmb�J�n_�N.AddItem
    cmb����_�N.AddItem
    cmb�����[�X�\���_�N.AddItem
    For i = Year(Date) - 2 To Year(Date) + 1
        cmb�J�n_�N.AddItem i
        cmb����_�N.AddItem i
        cmb�����[�X�\���_�N.AddItem i
    Next i
    cmb�J�n_�N.Value = Year(Date)
    cmb����_�N.Value = Year(Date)
    cmb�����[�X�\���_�N.Value = ""

    
    '�����X�g������
    cmb�J�n_��.Clear
    cmb����_��.Clear
    cmb�����[�X�\���_��.Clear
    cmb�J�n_��.AddItem
    cmb����_��.AddItem
    cmb�����[�X�\���_��.AddItem
    For i = 1 To 12
        cmb�J�n_��.AddItem i
        cmb����_��.AddItem i
        cmb�����[�X�\���_��.AddItem i
    Next i
    cmb�J�n_��.Value = Month(Date)
    cmb����_��.Value = Month(Date)
    cmb�����[�X�\���_��.Value = ""
    
    '�����X�g������
    cmb�J�n_��.Clear
    cmb����_��.Clear
    cmb�����[�X�\���_��.Clear
    cmb�J�n_��.AddItem
    cmb����_��.AddItem
    cmb�����[�X�\���_��.AddItem
    For i = 1 To 31
        cmb�J�n_��.AddItem i
        cmb����_��.AddItem i
        cmb�����[�X�\���_��.AddItem i
    Next i
    cmb�J�n_��.Value = Day(Date)
    cmb����_��.Value = Day(Date)
    cmb�����[�X�\���_��.Value = ""
    
    '�i�������X�g������
    cmb�i����.Clear
    For i = 0 To 1 Step 0.1
        cmb�i����.AddItem
        cmb�i����.List(cmb�i����.ListCount - 1, 0) = i
        cmb�i����.List(cmb�i����.ListCount - 1, 1) = FormatPercent(i, 0, vbTrue, vbFalse, vbFalse)
    Next i
    cmb�i����.Value = cmb�i����.List(0, 0)
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    '�g���b�J�[���X�g������
    sql = "SELECT ���ږ�,�l" _
        & " FROM V_�g���b�J�["
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    Do Until oRS.EOF
        cmb�g���b�J�[.AddItem
        cmb�g���b�J�[.List(cmb�g���b�J�[.ListCount - 1, 0) = oRS.Fields("�l")
        cmb�g���b�J�[.List(cmb�g���b�J�[.ListCount - 1, 1) = oRS.Fields("���ږ�")
        oRS.MoveNext
    Loop
    cmb�g���b�J�[.Value = cmb�g���b�J�[.List(0, 0)
        
    '�D��x���X�g������
    sql = "SELECT ���ږ�,�l" _
        & " FROM V_�D��x"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    Do Until oRS.EOF
        cmb�D��x.AddItem
        cmb�D��x.List(cmb�D��x.ListCount - 1, 0) = oRS.Fields("�l")
        cmb�D��x.List(cmb�D��x.ListCount - 1, 1) = oRS.Fields("���ږ�")
        oRS.MoveNext
    Loop
    cmb�D��x.Value = cmb�D��x.List(1, 0)
    
    '�X�e�[�^�X���X�g������
    sql = "SELECT ���ږ�,�l" _
        & " FROM V_�X�e�[�^�X"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    Do Until oRS.EOF
        cmb�X�e�[�^�X.AddItem
        cmb�X�e�[�^�X.List(cmb�X�e�[�^�X.ListCount - 1, 0) = oRS.Fields("�l")
        cmb�X�e�[�^�X.List(cmb�X�e�[�^�X.ListCount - 1, 1) = oRS.Fields("���ږ�")
        oRS.MoveNext
    Loop
    cmb�X�e�[�^�X.Value = cmb�X�e�[�^�X.List(0, 0)
    
    
    
    '�v���W�F�N�g���X�g������
    sql = "SELECT �v���W�F�N�g��, �v���W�F�N�g�ԍ�,���ږ�" _
        & " FROM �v���W�F�N�g�Ǘ� LEFT JOIN V_����R�[�h ON V_����R�[�h.�l = �v���W�F�N�g�Ǘ�.����R�[�h"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    cmb�v���W�F�N�g.Clear
    cmb��������_�v���W�F�N�g.Clear
    cmb�v���W�F�N�g.AddItem
    cmb��������_�v���W�F�N�g.AddItem
    Do Until oRS.EOF
        cmb�v���W�F�N�g.AddItem
        cmb��������_�v���W�F�N�g.AddItem
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 0) = oRS.Fields("�v���W�F�N�g�ԍ�").Value
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 1) = oRS.Fields("�v���W�F�N�g��").Value
        cmb�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 2) = oRS.Fields("���ږ�").Value
        cmb��������_�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 0) = oRS.Fields("�v���W�F�N�g�ԍ�").Value
        cmb��������_�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 1) = oRS.Fields("�v���W�F�N�g��").Value
        cmb��������_�v���W�F�N�g.List(cmb�v���W�F�N�g.ListCount - 1, 2) = oRS.Fields("���ږ�").Value
        oRS.MoveNext
    Loop
    cmb�v���W�F�N�g.Value = cmb�v���W�F�N�g.List(1, 0)
    
    btn�ǉ�.Enabled = True
    btn�X�V.Enabled = False
    
    btn����_Click
    
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

Private Sub UserForm_Resize()
    
    Dim �� As Integer, �� As Integer
    �� = Me.InsideWidth - lv�`�P�b�g.Left * 2
    �� = Me.InsideHeight - fm��������.Height - fm�ҏW.Height - 25
    If �� >= fm��������.Width + lbl����.Width Then
        lbl����.Left = �� - lbl����.Width
        lv�`�P�b�g.Width = ��
        For j = 1 To lv�`�P�b�g.ColumnHeaders.Count - 1
            If �� - 5 <= lv�`�P�b�g.ColumnHeaders.Item(j).Width Then
                Exit For
            End If
            �� = �� - lv�`�P�b�g.ColumnHeaders.Item(j).Width
        Next
        If lv�`�P�b�g.ColumnHeaders.Count >= 1 Then
            lv�`�P�b�g.ColumnHeaders.Item(lv�`�P�b�g.ColumnHeaders.Count).Width = �� - 5
        End If
    End If
    If �� >= 100 Then
        lv�`�P�b�g.Height = ��
        fm�ҏW.Top = fm��������.Height + lv�`�P�b�g.Height + 25
    End If
    
End Sub

Private Sub btn�S�I��_Click()

    Dim i, j As Long
    j = 0
    If lv�`�P�b�g.ListItems.Count = 0 Then
        MsgBox "�f�[�^�Ȃ��A�������Ă��������B", vbInformation
        Exit Sub
    End If
    For i = 1 To lv�`�P�b�g.ListItems.Count
         If lv�`�P�b�g.ListItems.Item(i).Checked = False Then
            Exit For
        End If
        j = j + 1
    Next i
    If j = lv�`�P�b�g.ListItems.Count Then
        For i = 1 To lv�`�P�b�g.ListItems.Count
            lv�`�P�b�g.ListItems.Item(i).Checked = False
        Next i
    Else
        For i = 1 To lv�`�P�b�g.ListItems.Count
             lv�`�P�b�g.ListItems.Item(i).Checked = True
        Next i
    End If

End Sub

Private Function �t�B���^����() As String

    '�t�B���^��������
    Dim �J�n�N���� As String
    If cmb��������_�N.Value = "" Or cmb��������_��.Value = "" Then
        MsgBox "�����͈͂���͂��Ă��������B", vbExclamation
    End If
    �J�n�N���� = cmb��������_�N.Value & "/" & Format(cmb��������_��.Value, "00") & "/" & "01"
    If �J�n�N���� <> "" Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[�`�P�b�g�Ǘ�.�J�n] >=#" & �J�n�N���� & "#"
    End If

    Dim �v���W�F�N�g As String
    If cmb��������_�v���W�F�N�g.Text = "" Then
        �v���W�F�N�g = ""
    ElseIf IsNull(cmb��������_�v���W�F�N�g.Value) Then
        If Not �v���W�F�N�g�����`�F�b�N(cmb��������_�v���W�F�N�g.Text) Then
            MsgBox "�v���W�F�N�g���͂��s���ł��B", vbExclamation
            cmb��������_�v���W�F�N�g.SetFocus
            Exit Function
        Else
            �v���W�F�N�g = cmb��������_�v���W�F�N�g.Text
        End If
    Else
        �v���W�F�N�g = cmb��������_�v���W�F�N�g.Value
    End If

    If �v���W�F�N�g <> "" Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[�`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ�] ='" & �v���W�F�N�g & "'"
    End If

    Dim �`�P�b�g�ԍ� As String
    If txt��������_�`�P�b�g�ԍ�.Value <> "" Then
        �`�P�b�g�ԍ� = StrConv(txt��������_�`�P�b�g�ԍ�, vbNarrow)
        If Left(�`�P�b�g�ԍ�, 1) <> "#" Then
            �`�P�b�g�ԍ� = "#" & �`�P�b�g�ԍ�
        End If
        If �`�P�b�g�������`�F�b�N(�`�P�b�g�ԍ�) = False Then
            MsgBox "�`�P�b�g�ԍ����s���ł��B", vbExclamation
            txt�`�P�b�g�ԍ�.SetFocus
            Exit Function
        End If
    End If
    If �`�P�b�g�ԍ� <> "" Then
            If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[�`�P�b�g�Ǘ�.�`�P�b�g�ԍ�] ='" & �`�P�b�g�ԍ� & "'"
    End If
    
    If Not cb��������_����.Value Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[�`�P�b�g�Ǘ�.�폜�t���O] = False"
    End If
        
    Dim �`�F�b�N�t�B���^ As String
    If cb�g���b�J�[_1.Value Or _
        cb�g���b�J�[_2.Value Or _
        cb�g���b�J�[_3.Value Or _
        cb�g���b�J�[_4.Value Or _
        cb�g���b�J�[_5.Value Then

        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �`�F�b�N�t�B���^ = ""
        If cb�g���b�J�[_1.Value Then
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�g���b�J�[] = 1"
        End If
        If cb�g���b�J�[_2.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�g���b�J�[] = 2"
        End If
        If cb�g���b�J�[_3.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�g���b�J�[] = 3"
        End If
        If cb�g���b�J�[_4.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�g���b�J�[] = 4"
        End If
        If cb�g���b�J�[_5.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�g���b�J�[] = 5"
        End If
        �t�B���^���� = �t�B���^���� & " ( " & �`�F�b�N�t�B���^ & " ) "
    End If
    
    If cb�X�e�[�^�X_1.Value Or _
        cb�X�e�[�^�X_2.Value Or _
        cb�X�e�[�^�X_3.Value Or _
        cb�X�e�[�^�X_4.Value Then

        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �`�F�b�N�t�B���^ = ""
        If cb�X�e�[�^�X_1.Value Then
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�X�e�[�^�X] = 1"
        End If
        If cb�X�e�[�^�X_2.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�X�e�[�^�X] = 2"
        End If
        If cb�X�e�[�^�X_3.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�X�e�[�^�X] = 3"
        End If
        If cb�X�e�[�^�X_4.Value Then
            If �`�F�b�N�t�B���^ <> "" Then
                �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & " Or "
            End If
            �`�F�b�N�t�B���^ = �`�F�b�N�t�B���^ & "[�`�P�b�g�Ǘ�.�X�e�[�^�X] = 4"
        End If
        �t�B���^���� = �t�B���^���� & " ( " & �`�F�b�N�t�B���^ & " ) "
    End If
    
    If �t�B���^���� <> "" Then
        �t�B���^���� = " WHERE " & �t�B���^����
    End If
 
End Function

Private Sub btn����_Click()

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)

    '���R�[�h�Z�b�g�擾
    On Error GoTo ErrRSOpen
    sql = "SELECT *" _
        & " FROM (((�`�P�b�g�Ǘ�" _
        & " LEFT JOIN �v���W�F�N�g�Ǘ� ON �v���W�F�N�g�Ǘ�.�v���W�F�N�g�ԍ� = �`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ�)" _
        & " LEFT JOIN V_�X�e�[�^�X ON V_�X�e�[�^�X.�l = CStr(�`�P�b�g�Ǘ�.�X�e�[�^�X))" _
        & " LEFT JOIN V_�g���b�J�[ ON V_�g���b�J�[.�l = CStr(�`�P�b�g�Ǘ�.�g���b�J�[))" _
        & " LEFT JOIN V_�D��x ON V_�D��x.�l = CStr(�`�P�b�g�Ǘ�.�D��x)"
        
    Dim sort As String
    sort = " ORDER BY �`�P�b�g�Ǘ�.�X�e�[�^�X,�`�P�b�g�ԍ�"
    
    If �t�B���^���� <> "" Then
        sql = sql & �t�B���^����
    End If
    
    sql = sql & sort
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)

    lv�`�P�b�g.ListItems.Clear
    lv�`�P�b�g.Sorted = False
    Do Until oRS.EOF
        With lv�`�P�b�g.ListItems.Add
            .Text = oRS.Fields("V_�g���b�J�[.���ږ�").Value
            .SubItems(1) = oRS.Fields("V_�D��x.���ږ�").Value
            .SubItems(2) = Null2Blank(oRS.Fields("�v���W�F�N�g��").Value)
            .SubItems(3) = Null2Blank(oRS.Fields("�`�P�b�g�ԍ�").Value)
            .SubItems(4) = Null2Blank(oRS.Fields("�`�P�b�g��").Value)
            .SubItems(5) = oRS.Fields("V_�X�e�[�^�X.���ږ�").Value
            .SubItems(6) = FormatPercent(oRS.Fields("�i����").Value, 0, vbTrue, vbFalse, vbFalse)
            .SubItems(7) = oRS.Fields("�J�n").Value & "(" & Format(Weekday(oRS.Fields("�J�n").Value), "aaa") & ")"
            .SubItems(8) = oRS.Fields("����").Value & "(" & Format(Weekday(oRS.Fields("����").Value), "aaa") & ")"
            If IsNull(oRS.Fields("�����[�X�\���").Value) Then
                .SubItems(9) = ""
            Else
                .SubItems(9) = oRS.Fields("�����[�X�\���").Value & "(" & Format(Weekday(oRS.Fields("�����[�X�\���").Value), "aaa") & ")"
            End If
            If IsNull(oRS.Fields("�\��H��").Value) Then
                .SubItems(10) = ""
            Else
                .SubItems(10) = Format(oRS.Fields("�\��H��").Value, "00.00") & "H"
            End If
            If IsNull(oRS.Fields("�L�^�H��").Value) Then
                .SubItems(11) = ""
            Else
                .SubItems(11) = Format(oRS.Fields("�L�^�H��").Value, "00.00") & "H"
            End If
            If oRS.Fields("�`�P�b�g�Ǘ�.�폜�t���O").Value = True Then
                .SubItems(12) = "��"
            End If
            .SubItems(13) = Null2Blank(oRS.Fields("�`�P�b�g�Ǘ��ԍ�").Value)
            .SubItems(14) = Null2Blank(oRS.Fields("����̍��").Value)
            .SubItems(15) = Null2Blank(oRS.Fields("���l").Value)
        End With
        oRS.MoveNext
    Loop

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0

    lbl����.Caption = lv�`�P�b�g.ListItems.Count & " ��"
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
    
    '�`�P�b�g�ԍ����̓`�F�b�N
    Dim �`�P�b�g�ԍ� As String
    If txt�`�P�b�g�ԍ�.Value <> "" Then
        �`�P�b�g�ԍ� = StrConv(txt�`�P�b�g�ԍ�, vbNarrow)
        If Left(�`�P�b�g�ԍ�, 1) <> "#" Then
            �`�P�b�g�ԍ� = "#" & �`�P�b�g�ԍ�
        End If
        If �`�P�b�g�������`�F�b�N(�`�P�b�g�ԍ�) = False Then
            MsgBox "�`�P�b�g�ԍ����s���ł��B", vbExclamation
            txt�`�P�b�g�ԍ�.SetFocus
            Exit Sub
        End If
    Else
        �`�P�b�g�ԍ� = ""
    End If
    
    '�`�P�b�g�����̓`�F�b�N
    Dim �`�P�b�g�� As String
    If txt�`�P�b�g��.Value <> "" Then
        �`�P�b�g�� = txt�`�P�b�g��.Value
    Else
        MsgBox "�`�P�b�g���������́B", vbExclamation
    End If
    
    '���t���̓`�F�b�N
    Dim �J�n As String
    If cmb�J�n_�N.Value = "" Or cmb�J�n_�� = "" Or cmb�J�n_�� = "" Then
        MsgBox "�J�n���t����͂��Ă��������B", vbExclamation
    End If
    �J�n = cmb�J�n_�N.Value & "/" & Format(cmb�J�n_��.Value, "00") & "/" & Format(cmb�J�n_��, "00")
    
    Dim ���� As String
    If cmb����_�N.Value = "" Or cmb����_�� = "" Or cmb����_�� = "" Then
        MsgBox "�������t����͂��Ă��������B", vbExclamation
    End If
    ���� = cmb����_�N.Value & "/" & Format(cmb����_��.Value, "00") & "/" & Format(cmb����_��, "00")
    
    Dim �����[�X�\��� As String
    If cmb�����[�X�\���_�N.Value = "" Or cmb�����[�X�\���_�� = "" Or cmb�����[�X�\���_�� = "" Then
        �����[�X�\��� = ""
    Else
        �����[�X�\��� = cmb�����[�X�\���_�N.Value & "/" & Format(cmb�����[�X�\���_��.Value, "00") & "/" & Format(cmb�����[�X�\���_��, "00")
    End If
    
    Dim �\��H�� As Double
    If txt�\��H��.Value <> "" Then
        �\��H�� = txt�\��H��.Value
    End If
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen
    
    Set oRS = oDB.OpenRecordset("�`�P�b�g�Ǘ�", dbOpenTable)
    '�g�����U�N�V�����J�n
    oWks.BeginTrans
    
    '�V�K���R�[�h�ǉ�
    oRS.AddNew
    oRS.Fields("�v���W�F�N�g�ԍ�").Value = Null2Blank(�v���W�F�N�g)
    oRS.Fields("�g���b�J�[").Value = cmb�g���b�J�[.Value
    oRS.Fields("�X�e�[�^�X").Value = cmb�X�e�[�^�X.Value
    oRS.Fields("�`�P�b�g�ԍ�").Value = Null2Blank(�`�P�b�g�ԍ�)
    oRS.Fields("�`�P�b�g��").Value = Null2Blank(txt�`�P�b�g��.Value)
    oRS.Fields("�D��x").Value = cmb�D��x.Value
    oRS.Fields("�i����").Value = cmb�i����.Value
    oRS.Fields("�J�n").Value = �J�n
    oRS.Fields("����").Value = ����
    oRS.Fields("�����[�X�\���").Value = DBDateInput(�����[�X�\���)
    oRS.Fields("�\��H��").Value = Null2Blank(�\��H��)
    txt�`�P�b�g�Ǘ��ԍ�.Value = "C" & Format(Now(), "yyyymmdd") & "-" & Right(Format(oRS.Fields("ID").Value, "0000"), 4)
    oRS.Fields("�`�P�b�g�Ǘ��ԍ�").Value = txt�`�P�b�g�Ǘ��ԍ�.Value
    oRS.Fields("����̍��").Value = Null2Blank(�`�P�b�g�ԍ�) & "�\" & Trim(Null2Blank(txt�`�P�b�g��.Value)) & "[" & Trim(�J�n) & "�`" & Trim(����) & "]"
    oRS.Fields("���l").Value = Null2Blank(txt���l.Value)
    oRS.Update
    
    '�g�����U�N�V��������
    oWks.CommitTrans
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    '���상�j���[�\��
    MsgBox "�f�[�^�̓o�^�ɐ������܂����B", vbInformation
    btn�ǉ�.Enabled = False
    btn�X�V.Enabled = True
    btn����_Click
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

Private Sub lv�`�P�b�g_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    With lv�`�P�b�g
        .Sorted = True
        .SortKey = ColumnHeader.Index - 1
        If .SortOrder = lvwAscending Then
            .SortOrder = lvwDescending
        Else
            .SortOrder = lvwAscending
        End If
    End With
End Sub

Private Sub lv�`�P�b�g_ItemClick(ByVal Item As MSComctlLib.ListItem)
    
    Dim �`�P�b�g�Ǘ��ԍ� As String
    �`�P�b�g�Ǘ��ԍ� = Item.ListSubItems(13).Text
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    '���R�[�h�Z�b�g�擾
    Set oRS = oDB.OpenRecordset("�`�P�b�g�Ǘ�", dbOpenTable)
    oRS.Index = "�`�P�b�g����"
    oRS.Seek "=", �`�P�b�g�Ǘ��ԍ�
    If oRS.NoMatch Then
        GoTo ErrDataInvalid
    End If
    
    '�ҏW���֏o��
    txt�`�P�b�g�Ǘ��ԍ�.Value = oRS.Fields("�`�P�b�g�Ǘ��ԍ�").Value
    cmb�v���W�F�N�g.Value = oRS.Fields("�v���W�F�N�g�ԍ�").Value
    cmb�g���b�J�[.Value = oRS.Fields("�g���b�J�[").Value
    cmb�X�e�[�^�X.Value = oRS.Fields("�X�e�[�^�X").Value
    txt�`�P�b�g�ԍ�.Value = oRS.Fields("�`�P�b�g�ԍ�").Value
    txt�`�P�b�g��.Value = oRS.Fields("�`�P�b�g��").Value
    cmb�D��x.Value = oRS.Fields("�D��x").Value
    cmb�i����.Value = oRS.Fields("�i����").Value
    txt�\��H��.Value = oRS.Fields("�\��H��").Value
    cmb�J�n_�N.Value = Year(oRS.Fields("�J�n").Value)
    cmb�J�n_��.Value = Month(oRS.Fields("�J�n").Value)
    cmb�J�n_��.Value = Day(oRS.Fields("�J�n").Value)
    cmb����_�N.Value = Year(oRS.Fields("����").Value)
    cmb����_��.Value = Month(oRS.Fields("����").Value)
    cmb����_��.Value = Day(oRS.Fields("����").Value)
    '----------------------------------------------'
    cmb�J�n_�N.Value = Year(oRS.Fields("�J�n").Value)
    cmb�J�n_��.Value = Month(oRS.Fields("�J�n").Value)
    cmb�J�n_��.Value = Day(oRS.Fields("�J�n").Value)
    cmb����_�N.Value = Year(oRS.Fields("����").Value)
    cmb����_��.Value = Month(oRS.Fields("����").Value)
    cmb����_��.Value = Day(oRS.Fields("����").Value)
    '----------------------------------------------'
    cmb�����[�X�\���_�N.Value = Year(oRS.Fields("�����[�X�\���").Value)
    cmb�����[�X�\���_��.Value = Month(oRS.Fields("�����[�X�\���").Value)
    cmb�����[�X�\���_��.Value = Day(oRS.Fields("�����[�X�\���").Value)
    cb����.Value = oRS.Fields("�폜�t���O").Value
    txt���l.Value = oRS.Fields("���l").Value
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    '�X�V�{�^���L����
    btn�X�V.Enabled = True
    
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

Private Sub btn�N���A_Click()

    '�ҏW����������
    cmb�v���W�F�N�g.Value = cmb�v���W�F�N�g.List(1, 0)
    cmb�g���b�J�[.Value = cmb�g���b�J�[.List(0, 0)
    cmb�X�e�[�^�X.Value = cmb�X�e�[�^�X.List(0, 0)
    cmb�i����.Value = cmb�i����.List(0, 0)
    txt�`�P�b�g�ԍ�.Value = ""
    txt�`�P�b�g��.Value = ""
    txt�\��H��.Value = ""
    cmb�J�n_�N.Value = Year(Date)
    cmb�J�n_��.Value = Month(Date)
    cmb�J�n_��.Value = Day(Date)
    cmb����_�N.Value = Year(Date)
    cmb����_��.Value = Month(Date)
    cmb����_��.Value = Day(Date)
    cmb�����[�X�\���_�N.Value = ""
    cmb�����[�X�\���_��.Value = ""
    cmb�����[�X�\���_��.Value = ""
    txt���l.Value = ""
    
    '�X�V�{�^��������
    btn�X�V.Enabled = False
    btn�ǉ�.Enabled = True
    
End Sub

Private Sub btn�X�V_Click()

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
    
    '�`�P�b�g�ԍ����̓`�F�b�N
    Dim �`�P�b�g�ԍ� As String
    If txt�`�P�b�g�ԍ�.Value <> "" Then
        �`�P�b�g�ԍ� = StrConv(txt�`�P�b�g�ԍ�, vbNarrow)
        If Left(�`�P�b�g�ԍ�, 1) <> "#" Then
            �`�P�b�g�ԍ� = "#" & �`�P�b�g�ԍ�
        End If
        If �`�P�b�g�������`�F�b�N(�`�P�b�g�ԍ�) = False Then
            MsgBox "�`�P�b�g�ԍ����s���ł��B", vbExclamation
            txt�`�P�b�g�ԍ�.SetFocus
            Exit Sub
        End If
    Else
        �`�P�b�g�ԍ� = ""
    End If
    
    '���t���̓`�F�b�N
    Dim �J�n As String
    If cmb�J�n_�N.Value = "" Or cmb�J�n_�� = "" Or cmb�J�n_�� = "" Then
        MsgBox "�J�n���t����͂��Ă��������B", vbExclamation
    End If
    �J�n = cmb�J�n_�N.Value & "/" & Format(cmb�J�n_��.Value, "00") & "/" & Format(cmb�J�n_��, "00")
    
    Dim ���� As String
    If cmb����_�N.Value = "" Or cmb����_�� = "" Or cmb����_�� = "" Then
        MsgBox "�������t����͂��Ă��������B", vbExclamation
    End If
    ���� = cmb����_�N.Value & "/" & Format(cmb����_��.Value, "00") & "/" & Format(cmb����_��, "00")
    
    Dim �����[�X�\��� As String
    If cmb�����[�X�\���_�N.Value = "" Or cmb�����[�X�\���_�� = "" Or cmb�����[�X�\���_�� = "" Then
        �����[�X�\��� = ""
    Else
        �����[�X�\��� = cmb�����[�X�\���_�N.Value & "/" & Format(cmb�����[�X�\���_��.Value, "00") & "/" & Format(cmb�����[�X�\���_��, "00")
    End If
    
    Dim �\��H�� As Double
    If txt�\��H��.Value <> "" Then
        �\��H�� = txt�\��H��.Value
    End If
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    On Error GoTo ErrRSOpen
    
    '�g�����U�N�V�����J�n
    oWks.BeginTrans
    
    '�`�P�b�g�Ǘ��ԍ����݃`�F�b�N
    Set oRS = oDB.OpenRecordset("�`�P�b�g�Ǘ�", dbOpenTable)
    oRS.Index = "�`�P�b�g����"
    oRS.Seek "=", txt�`�P�b�g�Ǘ��ԍ�.Value
    If oRS.NoMatch Then
        GoTo ErrDataInvalid
    End If
    
    '���R�[�h�X�V
    oRS.Edit
    oRS.Fields("�v���W�F�N�g�ԍ�").Value = Null2Blank(�v���W�F�N�g)
    oRS.Fields("�g���b�J�[").Value = cmb�g���b�J�[.Value
    oRS.Fields("�X�e�[�^�X").Value = cmb�X�e�[�^�X.Value
    oRS.Fields("�`�P�b�g�ԍ�").Value = Null2Blank(�`�P�b�g�ԍ�)
    oRS.Fields("�`�P�b�g��").Value = Null2Blank(txt�`�P�b�g��.Value)
    oRS.Fields("�D��x").Value = cmb�D��x.Value
    oRS.Fields("�i����").Value = cmb�i����.Value
    oRS.Fields("�J�n").Value = �J�n
    oRS.Fields("����").Value = ����
    oRS.Fields("�����[�X�\���").Value = DBDateInput(�����[�X�\���)
    oRS.Fields("�\��H��").Value = Null2Blank(�\��H��)
    oRS.Fields("�폜�t���O").Value = cb����.Value
    oRS.Fields("����̍��").Value = Null2Blank(�`�P�b�g�ԍ�) & "�\" & Trim(Null2Blank(txt�`�P�b�g��.Value)) & "[" & Trim(�J�n) & "�`" & Trim(����) & "]"
    oRS.Fields("���l").Value = Null2Blank(txt���l.Value)
    oRS.Update
    
    '�g�����U�N�V��������
    oWks.CommitTrans
    
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    
    '���상�j���[�\��
    MsgBox "�f�[�^�̍X�V�ɐ������܂����B", vbInformation
    btn����_Click
    Exit Sub
     
ErrDataInvalid:
    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�`�P�b�g�����o�^�ł��B", vbExclamation
    Exit Sub
    
ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    
    MsgBox "�f�[�^�̍X�V�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub
    
ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub
