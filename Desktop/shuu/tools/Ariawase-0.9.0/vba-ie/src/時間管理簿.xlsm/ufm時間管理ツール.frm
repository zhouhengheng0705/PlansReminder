VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ufm���ԊǗ��c�[�� 
   Caption         =   "���ԊǗ��c�[��"
   ClientHeight    =   6945
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   9690
   OleObjectBlob   =   "ufm���ԊǗ��c�[��.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "ufm���ԊǗ��c�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private ���ԊǗ��ꗗ�z�u��Dic As Object
Const ���ԊǗ��o�͍s = 4
Const ���ԊǗ��o�͗� = 2
Const ���ԊǗ��w�b�_�s = 3
Const ���ԊǗ��ꗗ�Ǐo�s�� = 50

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
    
    '���X�g�r���[������
    lv�����ꗗ.ColumnHeaders.Clear
    lv�����ꗗ.ColumnHeaders.Add , "�L�^���t", "�L�^���t", 78
    lv�����ꗗ.ColumnHeaders.Add , "�J�n����", "�J�n����", 48
    lv�����ꗗ.ColumnHeaders.Add , "�I������", "�I������", 48
    lv�����ꗗ.ColumnHeaders.Add , "���Ԑ�", "���Ԑ�", 38
    lv�����ꗗ.ColumnHeaders.Add , "�v���W�F�N�g��", "�v���W�F�N�g��", 90
    lv�����ꗗ.ColumnHeaders.Add , "�`�P�b�g�ԍ�", "�`�P�b�g�ԍ�", 55
    lv�����ꗗ.ColumnHeaders.Add , "�`�P�b�g��", "�`�P�b�g��", 240
    lv�����ꗗ.ColumnHeaders.Add , "�R�����g", "�R�����g", 120
    lv�����ꗗ.ColumnHeaders.Add , "�Ζ��ݒ�", "�Ζ��ݒ�", 70
    lv�����ꗗ.ColumnHeaders.Add , "����\�t", "����\�t", 0
    lv�����ꗗ.ColumnHeaders.Add , "�L�^�ԍ�", "�L�^�ԍ�", 0
    lv�����ꗗ.ColumnHeaders.Add , "����", "����", 40
    lv�����ꗗ.ColumnHeaders.Add , "���l", "���l"
    
    
    '�����\��N�������X�g������
    cmb��������_�J�n_�N.Clear
    cmb��������_�I��_�N.Clear
    cmb��������_�J�n_�N.AddItem
    cmb��������_�I��_�N.AddItem
    For i = Year(Date) - 2 To Year(Date) + 1
        cmb��������_�J�n_�N.AddItem i
        cmb��������_�I��_�N.AddItem i
    Next i
    cmb��������_�J�n_�N.Value = Year(DateAdd("d", -7, Date)) 'Year(DateAdd("m", -1, Date))
    cmb��������_�I��_�N.Value = Year(Date)

    cmb��������_�J�n_��.Clear
    cmb��������_�I��_��.Clear
    cmb��������_�J�n_��.AddItem
    cmb��������_�I��_��.AddItem
    For i = 1 To 12
        cmb��������_�J�n_��.AddItem i
        cmb��������_�I��_��.AddItem i
    Next i
    cmb��������_�J�n_��.Value = Month(DateAdd("d", -7, Date)) 'Month(DateAdd("m", -1, Date))
    cmb��������_�I��_��.Value = Month(Date)
    
    cmb��������_�J�n_��.Clear
    cmb��������_�I��_��.Clear
    cmb��������_�J�n_��.AddItem
    cmb��������_�I��_��.AddItem
    For i = 1 To 31
        cmb��������_�J�n_��.AddItem i
        cmb��������_�I��_��.AddItem i
    Next i
    cmb��������_�J�n_��.Value = Day(DateAdd("d", -7, Date))
    cmb��������_�I��_��.Value = Day(Date)
    
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    
    '�v���W�F�N�g���X�g������
    sql = "SELECT �v���W�F�N�g��, �v���W�F�N�g�ԍ�,���ږ�" _
        & " FROM �v���W�F�N�g�Ǘ� LEFT JOIN V_����R�[�h ON V_����R�[�h.�l = �v���W�F�N�g�Ǘ�.����R�[�h"
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    cmb��������_�v���W�F�N�g.Clear
    cmb��������_�v���W�F�N�g.AddItem
    Do Until oRS.EOF
        cmb��������_�v���W�F�N�g.AddItem
        cmb��������_�v���W�F�N�g.List(cmb��������_�v���W�F�N�g.ListCount - 1, 0) = oRS.Fields("�v���W�F�N�g�ԍ�").Value
        cmb��������_�v���W�F�N�g.List(cmb��������_�v���W�F�N�g.ListCount - 1, 1) = oRS.Fields("�v���W�F�N�g��").Value
        cmb��������_�v���W�F�N�g.List(cmb��������_�v���W�F�N�g.ListCount - 1, 2) = oRS.Fields("���ږ�").Value
        oRS.MoveNext
    Loop

    '�E�B���h�E�ŏ����{�^���L��
    Call FrmDec(Me.Caption, True, True, True)

    '�E�B���h�E���T�C�Y
    UserForm_Resize
    
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
    �� = Me.InsideWidth - lv�����ꗗ.Left * 2
    �� = Me.InsideHeight - fm��������.Height - 25
    If �� >= fm��������.Width + lbl����.Width Then
        lbl����.Left = �� - lbl����.Width
        lv�����ꗗ.Width = ��
        For j = 1 To lv�����ꗗ.ColumnHeaders.Count - 1
            If �� - 5 <= lv�����ꗗ.ColumnHeaders.Item(j).Width Then
                Exit For
            End If
            �� = �� - lv�����ꗗ.ColumnHeaders.Item(j).Width
        Next
        If lv�����ꗗ.ColumnHeaders.Count >= 1 Then
            lv�����ꗗ.ColumnHeaders.Item(lv�����ꗗ.ColumnHeaders.Count).Width = �� - 5
        End If
    End If
    
    If �� >= 100 Then
        lv�����ꗗ.Height = ��
    End If
    
End Sub

Private Function �t�B���^����() As String

    '�t�B���^��������
    Dim �J�n�N����, �I���N���� As String
    If cmb��������_�J�n_�N.Value = "" Or cmb��������_�J�n_��.Value = "" Or cmb��������_�J�n_��.Value = "" Then
        MsgBox "�J�n�N�����𐳂������͂��Ă��������B", vbExclamation
        Exit Function
    End If
    �J�n�N���� = cmb��������_�J�n_�N.Value & "/" & Format(cmb��������_�J�n_��.Value, "00") & "/" & Format(cmb��������_�J�n_��.Value, "00")
    If �J�n�N���� <> "" Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[���ԊǗ�.�L�^���t] >=#" & �J�n�N���� & "#"
    End If
    
    If cmb��������_�I��_�N.Value = "" Or cmb��������_�I��_��.Value = "" Or cmb��������_�I��_��.Value = "" Then
        MsgBox "�I���N�����𐳂������͂��Ă��������B", vbExclamation
        Exit Function
    End If
    �I���N���� = cmb��������_�I��_�N.Value & "/" & Format(cmb��������_�I��_��.Value, "00") & "/" & Format(cmb��������_�I��_��.Value, "00")
    If �I���N���� <> "" Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[���ԊǗ�.�L�^���t] <=#" & �I���N���� & "#"
    End If
    
    If �J�n�N���� > �I���N���� Then
        MsgBox "�I���N�����𐳂������͂��Ă��������B", vbExclamation
        Exit Function
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
        �t�B���^���� = �t�B���^���� & "[���ԊǗ�.�v���W�F�N�g�ԍ�] ='" & �v���W�F�N�g & "'"
    End If
    
    Dim �`�P�b�g�ԍ� As String
    If txt��������_�`�P�b�g�ԍ�.Value <> "" Then
        �`�P�b�g�ԍ� = StrConv(txt��������_�`�P�b�g�ԍ�.Value, vbNarrow)
        If Left(�`�P�b�g�ԍ�, 1) <> "#" Then
            �`�P�b�g�ԍ� = "#" & �`�P�b�g�ԍ�
        End If
        If �`�P�b�g�������`�F�b�N(�`�P�b�g�ԍ�) = False Then
            MsgBox "�`�P�b�g�ԍ����s���ł��B", vbExclamation
            txt��������_�`�P�b�g�ԍ�.SetFocus
            Exit Function
        End If
    End If
        
    If �`�P�b�g�ԍ� <> "" Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[���ԊǗ�.�`�P�b�g�ԍ�] ='" & �`�P�b�g�ԍ� & "'"
    End If
    
    If Not cb��������_����.Value Then
        If �t�B���^���� <> "" Then
            �t�B���^���� = �t�B���^���� & " And "
        End If
        �t�B���^���� = �t�B���^���� & "[���ԊǗ�.�폜�t���O] = False"
    End If

    If �t�B���^���� <> "" Then
        �t�B���^���� = " WHERE " & �t�B���^����
    End If
    
End Function
'
Sub btn����_Click()

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)

    '���R�[�h�Z�b�g�擾
    On Error GoTo ErrRSOpen
    sql = "SELECT *" _
        & " FROM (((���ԊǗ�" _
        & " LEFT JOIN �`�P�b�g�Ǘ� ON �`�P�b�g�Ǘ�.�`�P�b�g�ԍ�= ���ԊǗ�.�`�P�b�g�ԍ�)" _
        & " LEFT JOIN �v���W�F�N�g�Ǘ� ON �v���W�F�N�g�Ǘ�.�v���W�F�N�g�ԍ� = ���ԊǗ�.�v���W�F�N�g�ԍ�)" _
        & " LEFT JOIN V_�Ζ��ݒ� ON V_�Ζ��ݒ�.�l = ���ԊǗ�.�Ζ��ݒ�)" _
        & " LEFT JOIN V_����R�[�h ON V_����R�[�h.�l = �v���W�F�N�g�Ǘ�.����R�[�h"

    Dim sort As String
    sort = " ORDER BY ���ԊǗ�.�L�^���t DESC,���ԊǗ�.�J�n���� "
    sql = sql & �t�B���^���� & sort
    
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    lv�����ꗗ.ListItems.Clear
    lv�����ꗗ.Sorted = False
    Do Until oRS.EOF
        With lv�����ꗗ.ListItems.Add
            .Text = oRS.Fields("�L�^���t").Value & "(" & Format(Weekday(oRS.Fields("�L�^���t").Value), "aaa") & ")"
            .SubItems(1) = Format(oRS.Fields("�J�n����").Value, "hh:mm:ss")
            .SubItems(2) = Format(oRS.Fields("�I������").Value, "hh:mm:ss")
            .SubItems(3) = Format(oRS.Fields("���Ԑ�").Value, "00.00") & "H"
            If Null2Blank(oRS.Fields("�v���W�F�N�g��")) = "" Then
                .SubItems(4) = "---"
            Else
                .SubItems(4) = Null2Blank(oRS.Fields("�v���W�F�N�g��"))
            End If
            If Null2Blank(oRS.Fields("�`�P�b�g�Ǘ�.�`�P�b�g�ԍ�").Value) = "" Then
                .SubItems(5) = "---"
            Else
                .SubItems(5) = Null2Blank(oRS.Fields("�`�P�b�g�Ǘ�.�`�P�b�g�ԍ�").Value)
            End If
            If Null2Blank(oRS.Fields("�`�P�b�g��").Value) = "" Then
                .SubItems(6) = "---"
            Else
                .SubItems(6) = Null2Blank(oRS.Fields("�`�P�b�g��").Value)
            End If
            .SubItems(7) = Null2Blank(oRS.Fields("�R�����g").Value)
            .SubItems(8) = oRS.Fields("V_�Ζ��ݒ�.���ږ�").Value
            .SubItems(9) = Null2Blank(oRS.Fields("����\�t").Value)
            .SubItems(10) = oRS.Fields("�L�^�ԍ�").Value
            If oRS.Fields("���ԊǗ�.�폜�t���O").Value Then
                .SubItems(11) = "��"
            End If
            .SubItems(12) = Null2Blank(oRS.Fields("���ԊǗ�.���l").Value)
        End With
        oRS.MoveNext
    Loop

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0

    lbl����.Caption = lv�����ꗗ.ListItems.Count & " ��"
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

Private Sub btn�S�I��_Click()

    Dim i, j As Long
    j = 0
    If lv�����ꗗ.ListItems.Count = 0 Then
        MsgBox "�f�[�^�Ȃ��A�������Ă��������B", vbInformation
        Exit Sub
    End If
    For i = 1 To lv�����ꗗ.ListItems.Count
         If lv�����ꗗ.ListItems.Item(i).Checked = False Then
            Exit For
        End If
        j = j + 1
    Next i
    If j = lv�����ꗗ.ListItems.Count Then
        For i = 1 To lv�����ꗗ.ListItems.Count
            lv�����ꗗ.ListItems.Item(i).Checked = False
        Next i
    Else
        For i = 1 To lv�����ꗗ.ListItems.Count
             lv�����ꗗ.ListItems.Item(i).Checked = True
        Next i
    End If

End Sub

Private Sub lv�����ꗗ_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    With lv�����ꗗ
        .Sorted = True
        .SortKey = ColumnHeader.Index - 1
        If .SortOrder = lvwAscending Then
            .SortOrder = lvwDescending
        Else
            .SortOrder = lvwAscending
        End If
    End With
End Sub

Function ���ԊǗ��ꗗ�z�u��Dic����()

    Dim �ŏI�s As Long, �ŏI�� As Long, �w�b�_�sDic As Object, �Q�ƃL�[ As Variant, �f�[�^�sDic As Object, �Q�ƃV�[�g As Worksheet
    Dim i As Integer, j As Integer
    
    '�W�v�\Dic����
    Set ���ԊǗ��ꗗ�z�u��Dic = CreateObject("Scripting.Dictionary")
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("���ԊǗ��ꗗ�z�u��")
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByColumns, xlPrevious).Column
    Set �w�b�_�sDic = CreateObject("Scripting.Dictionary")
    For j = 1 To �ŏI��
        �w�b�_�sDic.Add �Q�ƃV�[�g.Cells(1, j).Value, j
    Next j
    For i = 2 To �ŏI�s
        Set �f�[�^�sDic = CreateObject("Scripting.Dictionary")
        For Each �Q�ƃL�[ In �w�b�_�sDic
            �f�[�^�sDic.Add �Q�ƃL�[, �Q�ƃV�[�g.Cells(i, �w�b�_�sDic(�Q�ƃL�[)).Value
        Next �Q�ƃL�[
        ���ԊǗ��ꗗ�z�u��Dic.Add �Q�ƃV�[�g.Cells(i, 1).Value, �f�[�^�sDic
    Next i

End Function

Private Sub btn�G�N�X�|�[�g_Click()

'��ʕ`��X�V��~(����������)
    Application.ScreenUpdating = False
    
    ���ԊǗ��ꗗ�z�u��Dic����
    �t�B���^����
    Dim Key As Variant
    Dim sql As String

    sql = "SELECT *," _
        & " IIF(���ԊǗ�.�폜�t���O = True,'��','') As ����" _
        & " FROM (((���ԊǗ�" _
        & " LEFT JOIN �`�P�b�g�Ǘ� ON �`�P�b�g�Ǘ�.�`�P�b�g�ԍ� = ���ԊǗ�.�`�P�b�g�ԍ�)" _
        & " LEFT JOIN �v���W�F�N�g�Ǘ� ON �v���W�F�N�g�Ǘ�.�v���W�F�N�g�ԍ� = ���ԊǗ�.�v���W�F�N�g�ԍ�)" _
        & " LEFT JOIN V_�Ζ��ݒ� ON V_�Ζ��ݒ�.�l = ���ԊǗ�.�Ζ��ݒ�)" _
        & " LEFT JOIN V_����R�[�h ON V_����R�[�h.�l = �v���W�F�N�g�Ǘ�.����R�[�h"
       
    Dim sort As String
    sort = " ORDER BY ���ԊǗ�.�L�^���t DESC,���ԊǗ�.�J�n���� "

    If �t�B���^���� <> "" Then
        sql = sql & �t�B���^���� & sort
    Else
        sql = sql & sort
    End If
        
    Dim Sq As String
    Sq = "SELECT "
    For Each Key In ���ԊǗ��ꗗ�z�u��Dic
        Sq = Sq & ���ԊǗ��ꗗ�z�u��Dic(Key)("�t�B�[���h�p�X") & ", "
    Next
    
    sql = Left(Sq, Len(Sq) - 2) & " FROM(" & sql & ")"
    
    Dim �w�b�_�s, �o�͍s, i As Long
    �o�͍s = ���ԊǗ��o�͍s
    �w�b�_�s = ���ԊǗ��w�b�_�s
    
    Dim �Q�ƃV�[�g, �f�[�^�V�[�g As Worksheet
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�G�N�X�|�[�g")
    Set �f�[�^�V�[�g = ThisWorkbook.Worksheets("���ԊǗ��ꗗ�z�u��")
    
    '�����f�[�^�N���A
    �Q�ƃV�[�g.Activate
    ActiveWindow.FreezePanes = False
    If �Q�ƃV�[�g.AutoFilterMode Then
        �Q�ƃV�[�g.AutoFilterMode = False
    End If
    ActiveSheet.Cells.Select
    Selection.Clear
    
    '���������ݒ�
    With �Q�ƃV�[�g
        .Rows(2).RowHeight = 21
        .Range("B2").Value = "���ԊǗ��ꗗ"
        .Range("B2").Font.Size = 14
        .Range("B2").Font.Bold = True
        .Range("B2").HorizontalAlignment = xlLeft
        .Range("B2:C2").Select
        Selection.Merge
        .Range("D2:F2").Select
        Selection.Merge
    End With
    
    '�w�b�_�s������
    For Each Key In ���ԊǗ��ꗗ�z�u��Dic
            �Q�ƃV�[�g.Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & �w�b�_�s) = ���ԊǗ��ꗗ�z�u��Dic(Key)("�w�b�_��")
            �Q�ƃV�[�g.Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & �w�b�_�s).Interior.Color = ���ԊǗ��ꗗ�z�u��Dic(Key)("�w�b�_�F")
            �Q�ƃV�[�g.Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & �w�b�_�s).Borders.LineStyle = xlContinuous
    Next Key

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)
    On Error GoTo ErrRSOpen
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    �Q�ƃV�[�g.Activate
    Do Until oRS.EOF
        �Q�ƃV�[�g.Cells(�o�͍s, ���ԊǗ��o�͗�).CopyFromRecordset oRS, ���ԊǗ��ꗗ�Ǐo�s��
        If oRS.EOF Then
            Exit Do
        End If
        oRS.MoveNext
        �o�͍s = �o�͍s + ���ԊǗ��ꗗ�Ǐo�s��
    Loop
    �Q�ƃV�[�g.Range("D2").Value = oRS.RecordCount & "��" & "              " & Now()
    
    '�f�[�^�s�\���`���ݒ�
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByColumns, xlPrevious).Column
    For Each Key In ���ԊǗ��ꗗ�z�u��Dic
        
        '�f�[�^�s�\���`���ݒ�
        If ���ԊǗ��ꗗ�z�u��Dic(Key)("�\���`��") <> "" Then
            �Q�ƃV�[�g.Columns(���ԊǗ��ꗗ�z�u��Dic(Key)("��")).NumberFormatLocal = ���ԊǗ��ꗗ�z�u��Dic(Key)("�\���`��")
        End If
        '�f�[�^�s�z�u�ݒ�
        If ���ԊǗ��ꗗ�z�u��Dic(Key)("�z�u") <> "" Then
            �Q�ƃV�[�g.Range(Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & ���ԊǗ��o�͍s), Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & �ŏI�s)).HorizontalAlignment = ���ԊǗ��ꗗ�z�u��Dic(Key)("�z�u")
        End If
        '�񕝎�������
        �Q�ƃV�[�g.Columns(���ԊǗ��ꗗ�z�u��Dic(Key)("��")).AutoFit
        '�f�[�^�s�g���ݒ�
        �Q�ƃV�[�g.Range(Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & ���ԊǗ��o�͍s), Range(���ԊǗ��ꗗ�z�u��Dic(Key)("��") & �ŏI�s)).Borders.LineStyle = xlContinuous
    Next Key
    �Q�ƃV�[�g.Range("B4").Value = Format(�Q�ƃV�[�g.Range("B4").Value, "yyyy/mm/dd")
    
    
    With �Q�ƃV�[�g
        '�t�B���^�[�����ɂ���
        .Range("B3:M" & �ŏI�s).Select
        Selection.AutoFilter
        ActiveWindow.ScrollColumn = 1
        ActiveWindow.ScrollRow = 1
        .Rows(���ԊǗ��o�͍s).Select
        ActiveWindow.FreezePanes = True
        .Range("B2").Select
    End With

  '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0
    MsgBox "���ԊǗ��̃G�N�X�|�[�g���������܂����B", vbInformation
    Exit Sub

ErrRSOpen:
'   �f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub

ErrDBOpen:

    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Private Sub btn�V�K_Click()

    ufm�ҏW.Show
    ufm�ҏW.Caption = "�V�K�ǉ�"
 
End Sub

Private Sub btn�ҏW_Click()

    Dim �I���s As Integer, �L�^�ԍ� As String
    For �I���s = 1 To lv�����ꗗ.ListItems.Count - 1
        If lv�����ꗗ.ListItems(�I���s).Selected Then
            Exit For
        End If
    Next �I���s
    �L�^�ԍ� = lv�����ꗗ.ListItems(�I���s).ListSubItems(10).Text

    ufm�ҏW.Show
    ufm�ҏW.Caption = "�ҏW"
    ufm�ҏW.UserForm_Initialize2 �L�^�ԍ�
    
End Sub

Private Sub btn�폜_Click()
    
    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)
    
    Dim �L�^�ԍ� As String
    For i = 1 To lv�����ꗗ.ListItems.Count
        If lv�����ꗗ.ListItems.Item(i).Checked = True Then
            �L�^�ԍ� = lv�����ꗗ.ListItems(i).ListSubItems(10).Text
            
            '�f�[�^�̊��S�폜���m�F
            Dim ���� As Boolean
            �m�F�_�C�A���O.�\�� "���̃f�[�^���f�[�^�x�[�X����폜���܂��B" & vbCrLf & "��낵���ł���? ���폜�����f�[�^�������ł��܂���B", "�f�[�^�̊��S�����ɓ���"
            ���� = �m�F�_�C�A���O.����
            If ���� Then
                Set oRS = oDB.OpenRecordset("���ԊǗ�", dbOpenTable)
                oRS.Index = "�L�^�ԍ�"
                oRS.Seek "=", �L�^�ԍ�
                oRS.Delete
            Else
                Exit Sub
            End If
        End If
    Next i
    
    btn����_Click
    
    MsgBox "�I�������f�[�^���폜���܂����B", vbInformation
    
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
    Unload Me
    Exit Sub
    
ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical
    Unload Me

End Sub

Private Sub btn���񐶐�_Click()

    ufm���񐶐�.Show
End Sub

Private Sub btn���[��_Click()

    Shell "EXPLORER.EXE https://www.tcomm.jp/webmail/"
    
End Sub
