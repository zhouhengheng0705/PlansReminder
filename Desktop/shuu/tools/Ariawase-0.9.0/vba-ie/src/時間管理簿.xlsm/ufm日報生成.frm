VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm���񐶐� 
   Caption         =   "���񐶐�"
   ClientHeight    =   6810
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5400
   OleObjectBlob   =   "ufm���񐶐�.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm���񐶐�"
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
    
    '�N�������X�g������
    cmb�N.Clear
    For i = Year(Date) - 2 To Year(Date) + 1
        cmb�N.AddItem i
    Next i
    cmb�N.Value = Year(Date)

    cmb��.Clear
    For i = 1 To 12
        cmb��.AddItem i
    Next i
    cmb��.Value = Month(Date)
    
    Dim ��������, �j�� As String
    �������� = Day(DateSerial(Year(cmb�N.Value), Month(cmb��.Value) + 1, 0))
    cmb��.Clear
    For i = 1 To ��������
        �j�� = Format(Weekday(DateSerial(cmb�N.Value, cmb��.Value, i)), "aaa")
        cmb��.AddItem i
        cmb��.List(cmb��.ListCount - 1, 0) = i
        cmb��.List(cmb��.ListCount - 1, 1) = �j��
        cmb��.List(cmb��.ListCount - 1, 2) = i & "(" & �j�� & ")"
    Next i
    cmb��.Value = Day(DateAdd("d", -1, Date))
    '���j�̏ꍇ�ɋ��j���ɐݒ�
    If cmb��.List(cmb��.ListIndex, 1) = "��" Then
        cmb��.Value = Day(DateAdd("d", -3, Date))
    End If

End Sub

Private Sub btn����_Click()

    Dim �L�^���t As String
    If cmb�N.Value = "" Or cmb��.Value = "" Or cmb��.Value = "" Then
        MsgBox "�L�^���t����͂��Ă��������B", vbExclamation
        cmb�N.SetFocus
        Exit Sub
    End If
    �L�^���t = cmb�N.Value & "/" & Format(cmb��.Value, "00") & "/" & Format(cmb��.Value, "00")
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    sql = "SELECT ����\�t,���Ԑ�" _
        & " FROM ���ԊǗ�" _
        & " WHERE �L�^���t =#" & �L�^���t & "#" _
        & " AND �폜�t���O = False" _
        & " ORDER BY [�J�n����]"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    txt���񐶐�.Value = ""
    txt���v����.Value = "0"
    Do Until oRS.EOF
        If txt���񐶐�.Value <> "" Then
            txt���񐶐�.Value = Trim(txt���񐶐�.Value) & vbCrLf & Trim(oRS.Fields("����\�t").Value)
        Else
            txt���񐶐�.Value = "�i���Ȃ�" & vbCrLf & Trim(oRS.Fields("����\�t").Value)
        End If
        txt���v����.Value = val(txt���v����.Value) + val(oRS.Fields("���Ԑ�"))
        oRS.MoveNext
    Loop
    
    sql = "SELECT ����̍��,�v���W�F�N�g��" _
        & " FROM �`�P�b�g�Ǘ�" _
        & " LEFT JOIN �v���W�F�N�g�Ǘ� ON �v���W�F�N�g�Ǘ�.�v���W�F�N�g�ԍ� = �`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ�" _
        & " WHERE �`�P�b�g�Ǘ�.�X�e�[�^�X <> " & �X�e�[�^�X_�I�� _
        & " AND �`�P�b�g�Ǘ�.�폜�t���O <> True" _
        & " ORDER BY �`�P�b�g�Ǘ�.�v���W�F�N�g�ԍ�,�J�n"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    Dim �v���W�F�N�g�� As String
    txt�����Ɛ���.Value = ""
    Do Until oRS.EOF
        If Not IsNull(oRS.Fields("����̍��").Value) Then
            If txt�����Ɛ���.Value <> "" Then
                If �v���W�F�N�g�� <> oRS.Fields("�v���W�F�N�g��").Value Then
                    txt�����Ɛ���.Value = Trim(txt�����Ɛ���.Value) & vbCrLf & vbCrLf & Trim(oRS.Fields("�v���W�F�N�g��")) & vbCrLf & Trim(Null2Blank(oRS.Fields("����̍��").Value))
                Else
                    txt�����Ɛ���.Value = Trim(txt�����Ɛ���.Value) & vbCrLf & Trim(Null2Blank(oRS.Fields("����̍��").Value))
                End If
            Else
                txt�����Ɛ���.Value = "����̍��" & vbCrLf & vbCrLf & Trim(oRS.Fields("�v���W�F�N�g��").Value) & vbCrLf & Trim(Null2Blank(oRS.Fields("����̍��").Value))
            End If
            �v���W�F�N�g�� = oRS.Fields("�v���W�F�N�g��").Value
        End If
        oRS.MoveNext
    Loop
    
    txt���v����.BackColor = &HFFFFFF
    If txt���v����.Value <> 7.75 Then
        txt���v����.BackColor = &H8080FF
    End If
    
    Dim h As Double
    h = val(txt���v����.Value) - 7.75
    If h > 0 Then
        txt�c�Ǝ���.Value = h
    Else
        txt�c�Ǝ���.Value = "0"
    End If
    
    
    If txt���񐶐�.Value = "" Then
        MsgBox "���̓��t�̓��񂪂���܂���B���m�F���������B", vbExclamation
    End If
    
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

Private Sub cmb��_Change()

    cmb��.Clear
    cmb��.AddItem
    Dim ��������, �j�� As String

    �������� = Day(DateSerial(cmb�N.Value, cmb��.Value + 1, 0))
    For i = 1 To ��������
        �j�� = Format(Weekday(DateSerial(cmb�N.Value, cmb��.Value, i)), "aaa")
        cmb��.AddItem
        cmb��.List(cmb��.ListCount - 1, 0) = i
        cmb��.List(cmb��.ListCount - 1, 1) = �j��
        cmb��.List(cmb��.ListCount - 1, 2) = i & "(" & �j�� & ")"
    Next i

End Sub
