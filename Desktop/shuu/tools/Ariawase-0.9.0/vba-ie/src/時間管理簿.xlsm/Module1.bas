Attribute VB_Name = "Module1"
' ���h�ێ�_��Ǘ��c�[�� Macro
' �}�N���L�^�� : 2017/07/05  ���[�U�[�� :���P�P
Public Const �V�X�e���f�[�^�J�n�s = 5
Public Const �V�X�e���f�[�^�J�n�� = 2
Public Const �V�X�e���J�n�N = 2015
Public �ݒ�Dic As Object
Public Const �V�X�e�����_�o�[�W���� = 1
Public Const �V�X�e�����_�`�[��ʊ��Z�␳�{�� = 11
Public Const �V�X�e����_���m�� = 1
Public Const �V�X�e����_�V�K = 2
Public Const �V�X�e����_�p�� = 3
Public Const �V�X�e����_�S�X�V = 4
Public Const �V�X�e����_�����X�V�w�� = 5 '���g�pF
Public Const �V�X�e����_�����X�V = 6
Public Const �V�X�e����_��� = 7

Public Const �Ζ��ݒ�_�{�� = 1
Public Const �Ζ��ݒ�_���Α��� = 2
Public Const �Ζ��ݒ�_���Βx�� = 3
Public Const �Ζ��ݒ�_�X���C�h = 4
Public Const �Ζ��ݒ�_�{��10�� = 5

Public Const �X�e�[�^�X_�V�K = 1
Public Const �X�e�[�^�X_�i�s�� = 2
Public Const �X�e�[�^�X_�����[�X�҂� = 3
Public Const �X�e�[�^�X_�I�� = 4


Public Const �f�o�b�O���[�h = False
Public Const �p�X���[�h = "zhh99072"
Public Const �f�[�^�x�[�X�� = "���ԊǗ�.accdb"
Public Const DAO�G���W�� = "DAO.DBEngine.120"
Public Const DB�p�X���[�h = "tcomm"
Public Const �ی�p�X���[�h = "tcomm"
'---------------------------------------------------------------------------------------------
'WindowsAPI��`
'�E�B���h�E����p
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" _
        (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" _
        (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
        (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32" ( _
        ByVal hWnd As Long, ByVal hWndInsertAfter As Long, _
        ByVal X As Long, ByVal Y As Long, _
        ByVal cx As Long, ByVal cy As Long, _
        ByVal wFlags As Long) As Long
Private Declare Function DrawMenuBar Lib "user32" (ByVal hWnd As Long) As Long
Private Const GWL_STYLE = (-16) '�E�B���h�E�X�^�C�����擾
Private Const WS_THICKFRAME = &H40000 '�E�B���h�E�̃T�C�Y�ύX
Private Const WS_MINIMIZEBOX = &H20000 '�ŏ����{�^��
Private Const WS_MAXIMIZEBOX = &H10000 '�ő剻�{�^��
Private Const LP_CLASSNAME = "ThunderDFrame"

'hWndInsertAfter�̐ݒ�
Private Const TEMAE_SET = 0 '��O�ɃZ�b�g
Private Const USIRO_SET = 1 '���ɃZ�b�g
Private Const TUNENI_TEMAE_SET = -1 '��Ɏ�O�ɃZ�b�g
Private Const KAIJYO = -2 '����
'wFlags�̐ݒ�
Private Const HYOUZI_SURU = &H40 '�\������
Private Const NO_SIZE = &H1 '�T�C�Y��ݒ肵�Ȃ�
Private Const NO_MOVE = &H2 '�ʒu��ݒ肵�Ȃ�

'�A�C�R������p
Private Declare Function LoadIconBynum Lib "user32" Alias _
        "LoadIconA" (ByVal hInstance As Long, ByVal lpIconName As Long) As Long
Private Declare Function GetActiveWindow Lib "user32" () As Long
Private Declare Function GetWindowDC Lib "user32" _
        (ByVal hWnd As Long) As Long
Private Declare Function DrawIcon Lib "user32" _
        (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal hIcon As Long) As Long
Private Declare Function ReleaseDC Lib "user32" _
        (ByVal hWnd As Long, ByVal hdc As Long) As Long
Private Declare Function DestroyIcon Lib "user32.dll" _
        (ByVal hIcon As Long) As Long

Private Const IDI_ASTERISK = 32516&     '1:���
Private Const IDI_EXCLAMATION = 32515&  '2:����
Private Const IDI_HAND = 32513&         '3:�x��
Private Const IDI_QUESTION = 32514&     '4:�₢���킹
Private Const IDI_APPLICATION = 32512&  '���g�p
Private Const IDI_WINLOGO = 32517&      '���g�p

'---------------------------------------------------------------------------------------------
'���[�U�[�t�H�[���E�B���h�E����ݒ�
Sub FrmDec(�t�H�[���� As String, Optional �ŏ��� As Boolean = False, Optional �ő剻 As Boolean = False, Optional �T�C�Y�� As Boolean = False)
    Dim fRet As Long
    Dim hWnd As Long
    Dim fStyle As Long

    hWnd = FindWindow(LP_CLASSNAME, �t�H�[����)
    fStyle = GetWindowLong(hWnd, GWL_STYLE)
    If �ŏ��� Then
        fStyle = (fStyle Or WS_MINIMIZEBOX)
    End If
    If �ő剻 Then
        fStyle = (fStyle Or WS_MAXIMIZEBOX)
    End If
    If �T�C�Y�� Then
        fStyle = (fStyle Or WS_THICKFRAME)
    End If
    fRet = SetWindowLong(hWnd, GWL_STYLE, fStyle)
    fRet = DrawMenuBar(hWnd)

End Sub

'���[�U�[�t�H�[���E�B���h�E�K�w�ݒ�
Sub FrmPos(�t�H�[���� As String, Optional �őO�� As Boolean = False)
    Dim hWnd As Long

    hWnd = FindWindow(LP_CLASSNAME, �t�H�[����)
    If �őO�� Then
        Call SetWindowPos(hWnd, TUNENI_TEMAE_SET, 0, 0, 0, 0, HYOUZI_SURU Or NO_MOVE Or NO_SIZE)
    Else
        Call SetWindowPos(hWnd, KAIJYO, 0, 0, 0, 0, HYOUZI_SURU Or NO_MOVE Or NO_SIZE)
    End If
End Sub

'���[�U�[�t�H�[���E�B���h�E�ŏ���
Sub FrmMin(�t�H�[���� As String, �ŏ��� As Boolean)
    Dim hWnd As Long

    hWnd = FindWindow(LP_CLASSNAME, �t�H�[����)
    If �ŏ��� Then
        Call CloseWindow(hWnd)
    Else
        Call OpenIcon(hWnd)
    End If
End Sub

'---------------------------------------------------------------------------------------------
Function DB�ڑ�(oWks As DAO.Workspace, Optional ReadOnly As Boolean = True) As DAO.Database

    Set DB�ڑ� = oWks.OpenDatabase(ThisWorkbook.Path & "\" & �f�[�^�x�[�X��, False, ReadOnly, ";PWD=" & DB�p�X���[�h)

End Function

'---------------------------------------------------------------------------------------------
Sub �V�X�e��_�ŐV_Click()

    '��ʕ`��X�V��~(����������)
    Application.ScreenUpdating = False

    Dim �V�X�e���V�[�g As Worksheet
    Set �V�X�e���V�[�g = ThisWorkbook.Worksheets("�V�X�e��")
    Dim �ŏI�s As Long
    �ŏI�s = �V�X�e���V�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    If �ŏI�s >= �V�X�e���f�[�^�J�n�s Then
        �V�X�e���V�[�g.Rows(�V�X�e���f�[�^�J�n�s & ":" & �ŏI�s).Delete Shift:=xlUp
    End If

    'SQL����
    Dim sql As String
    sql = "SELECT ���ږ�, �l" _
        & " FROM M_�V�X�e��" _
        & " WHERE [���] = " & �V�X�e�����_�o�[�W����

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, True)

    '���R�[�h�Z�b�g�擾
    On Error GoTo ErrRSOpen

    '�V�X�e�����X�V
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    �V�X�e���V�[�g.Cells(�V�X�e���f�[�^�J�n�s, �V�X�e���f�[�^�J�n��).CopyFromRecordset oRS

    '�o�[�W�����`�F�b�N���A�b�v�f�[�g
    Dim ���o�[�W���� As String, �V�o�[�W���� As String
    oRS.MoveFirst
    ���o�[�W���� = �V�X�e���V�[�g.Range("C5").Value
    �V�o�[�W���� = �V�X�e���V�[�g.Range("C2").Value

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0

    If ���o�[�W���� <> �V�o�[�W���� Then
        If MsgBox("�f�[�^�x�[�X�̃o�[�W��������v���܂���B�A�b�v�O���[�h���܂����H" & vbCrLf & "�����s�O�Ƀf�[�^�x�[�X�̃o�b�N�A�b�v�������߂��܂��B", vbOKCancel + vbInformation) = vbOK Then
            DB�o�[�W�����X�V ���o�[�W����
        End If
    End If
    Exit Sub

ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�x�[�X���̓Ǐo�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub

ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Function DB�o�[�W�����m�F() As Boolean

    Dim �V�X�e���V�[�g As Worksheet
    Set �V�X�e���V�[�g = ThisWorkbook.Worksheets("�V�X�e��")
    Dim ���o�[�W���� As String, �V�o�[�W���� As String
    ���o�[�W���� = �V�X�e���V�[�g.Range("C5").Value
    �V�o�[�W���� = �V�X�e���V�[�g.Range("C2").Value
    DB�o�[�W�����m�F = (���o�[�W���� = �V�o�[�W����)

End Function

Private Sub DB�o�[�W�����X�V(���o�[�W���� As String)

    Dim �V�X�e���V�[�g As Worksheet
    Set �V�X�e���V�[�g = ThisWorkbook.Worksheets("�V�X�e��")

    '�f�[�^�x�[�X�ڑ�
    On Error GoTo ErrDBOpen
    Dim oWks As DAO.Workspace, oDB As DAO.Database, oRS As DAO.Recordset
    Set oWks = CreateObject(DAO�G���W��).Workspaces(0)
    Set oDB = DB�ڑ�(oWks, False)

    On Error GoTo ErrRSOpen

    '�g�����U�N�V�����J�n
    oWks.BeginTrans

    '�o�[�W�����ɉ����čX�V�������L�q

    '�g�����U�N�V��������
    oWks.CommitTrans

    '�V�X�e�����X�V
    Dim �ŏI�s As Long
    �ŏI�s = �V�X�e���V�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    If �ŏI�s >= �V�X�e���f�[�^�J�n�s Then
        �V�X�e���V�[�g.Rows(�V�X�e���f�[�^�J�n�s & ":" & �ŏI�s).Delete Shift:=xlUp
    End If
    Dim sql As String
    sql = "SELECT ���ږ�, �l" _
        & " FROM M_�V�X�e��" _
        & " WHERE [���] = " & �V�X�e�����_�o�[�W����
    Set oRS = oDB.OpenRecordset(sql, dbOpenDynaset)
    �V�X�e���V�[�g.Cells(�V�X�e���f�[�^�J�n�s, �V�X�e���f�[�^�J�n��).CopyFromRecordset oRS

    '�f�[�^�x�[�X�ؒf
    oRS.Close
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing
    On Error GoTo 0

    MsgBox "�f�[�^�x�[�X�̃A�b�v�O���[�h���������܂����B", vbInformation
    Exit Sub

ErrRSOpen:
    '�f�[�^�x�[�X�ؒf
    Set oRS = Nothing
    oDB.Close
    Set oDB = Nothing

    MsgBox "�f�[�^�x�[�X�̃A�b�v�O���[�h�Ɏ��s���܂����B�ēx���s���Ă��������B(" & Err.Number & ")", vbExclamation
    Exit Sub

ErrDBOpen:
    MsgBox "�f�[�^�x�[�X�̐ڑ��Ɏ��s���܂����B(" & Err.Number & ")", vbCritical

End Sub

Private Sub DB�t�B�[���h�ǉ�(oDB As DAO.Database, �e�[�u���� As String, �t�B�[���h�� As String, �^ As Variant, Optional �ʒu As Integer = -1)

    Dim tdef As DAO.TableDef
    Dim fld As DAO.Field
    Dim prp As DAO.Property

    '�t�B�[���h�ǉ�
    Set tdef = oDB.TableDefs(�e�[�u����)
    tdef.Fields.Append tdef.CreateField(�t�B�[���h��, �^)

    '�ʒu�ύX
    If �ʒu = -1 Then
        '�f�t�H���g�͖����֐ݒ�
        �ʒu = tdef.Fields.Count - 1
    End If
    Set fld = tdef.Fields(�t�B�[���h��)
    fld.OrdinalPosition = �ʒu
    tdef.Fields.Refresh

End Sub

'---------------------------------------------------------------------------------------------
Function ID�ԍ������`�F�b�N(�ړ��� As String, ID�ԍ� As String) As Boolean

    Dim RE, reMatch
    Set RE = CreateObject("VBScript.RegExp")
    With RE
        .Pattern = "^" & �ړ��� & "\d\d\d\d\d\d\d\d-\d\d\d\d$" '�����p�^�[����ݒ�
        .IgnoreCase = False '�啶���Ə���������ʂ���
        .Global = True '������S�̂�����
        Set reMatch = .Execute(ID�ԍ�)
        If reMatch.Count = 0 Then
            ID�ԍ������`�F�b�N = False
            Exit Function
        End If
    End With
    Set RE = Nothing
    ID�ԍ������`�F�b�N = True
    
End Function

'---------------------------------------------------------------------------------------------
Function �v���W�F�N�g�����`�F�b�N(�v���W�F�N�g As String) As Boolean

    Dim RE, reMatch
    Set RE = CreateObject("VBScript.RegExp")
    With RE
        .Pattern = "\d\d\d\d$" '�����p�^�[����ݒ�
        .IgnoreCase = False '�啶���Ə���������ʂ���
        .Global = True '������S�̂�����
        Set reMatch = .Execute(�v���W�F�N�g)
        If reMatch.Count = 0 Then
            �v���W�F�N�g�����`�F�b�N = False
            Exit Function
        End If
    End With
    Set RE = Nothing
    �v���W�F�N�g�����`�F�b�N = True
    
End Function

'---------------------------------------------------------------------------------------------
Function �`�P�b�g�������`�F�b�N(�`�P�b�g�� As String) As Boolean

    Dim RE, reMatch
    Set RE = CreateObject("VBScript.RegExp")
    With RE
        .Pattern = "^#" & "\d\d\d\d(||\d)$" '�����p�^�[����ݒ�
        .IgnoreCase = False '�啶���Ə���������ʂ���
        .Global = True '������S�̂�����
        Set reMatch = .Execute(�`�P�b�g��)
        If reMatch.Count = 0 Then
            �`�P�b�g�������`�F�b�N = False
            Exit Function
        End If
    End With
    Set RE = Nothing
    �`�P�b�g�������`�F�b�N = True
    
End Function

' NULL�u�����N������ϊ�
Function Null2Blank(val As Variant) As Variant

    If IsNull(val) Then
        Null2Blank = ""
    Else
        Null2Blank = val
    End If

End Function

' �u�����N������NULL�ϊ�
Function Blank2Null(val As Variant) As Variant
    
    If val = "" Then
        Blank2Null = Null
    Else
        Blank2Null = val
    End If

End Function

'---------------------------------------------------------------------------------------------
' ��ԍ��A���t�@�x�b�g�ϊ�
'
' ����   lngColNum : ��ԍ�
' �߂�l ��A���t�@�x�b�g������
'---------------------------------------------------------------------------------------------
Function ColNum2Txt(lngColNum As Long) As String

  On Error GoTo ErrHandler

  Dim strAddr As String

  strAddr = ThisWorkbook.ActiveSheet.Cells(1, lngColNum).Address(False, False)
  ColNum2Txt = Left(strAddr, Len(strAddr) - 1)

  Exit Function

ErrHandler:

  ColNum2Txt = ""

End Function

' ���t����DB�ݒ�p���`
Function DBDateInput(dateStr As String) As Variant
    If dateStr = "" Or dateStr = "-" Then
        DBDateInput = Null
    Else
        DBDateInput = dateStr
    End If
End Function

'���[�U�[�t�H�[���A�C�R���`��
Sub ShowSystemIcon(�t�H�[���� As String, IDI As Long)
  Dim objHandle As Long
  Dim hWnd As Long
  Dim PictDC As Long

  objHandle& = LoadIconBynum(0, IDI&)
  hWnd = FindWindow(LP_CLASSNAME, �t�H�[����)
  PictDC = GetWindowDC(hWnd)
  DrawIcon PictDC, 10, 30, objHandle&
  ReleaseDC hWnd, PictDC
  DestroyIcon objHandle&
End Sub

' �ʉݍ���DB�\���p���`
Function SearchComboboxText(Combobox As Variant, SearchIdx As Long, Keyword As String) As String

    SearchComboboxText = ""
    For i = 0 To Combobox.ListCount - 1
        If Combobox.List(i, SearchIdx) Like ("*" & Keyword & "*") Then
            SearchComboboxText = Combobox.List(i)
            Exit Function
        End If
    Next i
    
End Function

Function �\��`�F�b�N(���t As String) As Boolean
    
    Dim �Q�ƃV�[�g As Worksheet, �o�͍s, �o�͗� As Long
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�\����t")
    �\��`�F�b�N = False
    �o�͍s = 2
    �o�͗� = 1
    '�f�[�^���
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Columns(�Q�ƃV�[�g.UsedRange.Columns.Count).Column
    
    For i = �o�͍s To �ŏI�s
        If ���t = �Q�ƃV�[�g.Cells(i, 1).Value Then
            �\��`�F�b�N = True
            Exit For
        End If
    Next i
    
End Function

Sub �L�^���t()

    Dim �Q�ƃV�[�g As Worksheet, �o�͍s As Long
    Set �Q�ƃV�[�g = ThisWorkbook.Worksheets("�v���W�F�N�g���ԋL�^")
    
    '�f�[�^���
    �ŏI�s = �Q�ƃV�[�g.UsedRange.Find("*", , xlFormulas, , xlByRows, xlPrevious).Row
    �ŏI�� = �Q�ƃV�[�g.UsedRange.Columns(�Q�ƃV�[�g.UsedRange.Columns.Count).Column
    
    '���t�ݒ�
    ThisWorkbook.Worksheets("���t").Activate
    For i = 1 To 8
        Worksheets("���t").Cells(i, 1).Value = DateAdd("d", i - 8, Date)
    Next i

    
    '���t������
    �o�͍s = 2
    �Q�ƃV�[�g.Activate
    �Q�ƃV�[�g.Unprotect (�p�X���[�h)
    With �Q�ƃV�[�g.Range("A2", "A1000").Validation
        .Delete
        .Add Type:=xlValidateList, Formula1:="=���t!$A$1:$A$8"
    End With
    
    With �Q�ƃV�[�g.Range("E2", "E1000").Validation
        .Delete
        .Add Type:=xlValidateList, Formula1:="=�Ζ��ݒ�!$A$2:$A$3"
    End With
        
    �Q�ƃV�[�g.Protect Password:=�ی�p�X���[�h, UserInterfaceOnly:=True, AllowFiltering:=True
    
End Sub


