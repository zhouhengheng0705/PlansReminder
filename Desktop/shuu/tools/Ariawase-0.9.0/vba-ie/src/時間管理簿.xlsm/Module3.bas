Attribute VB_Name = "Module3"
Sub �\��t��()
    Dim ����\�t�� As Long
    Worksheets("�v���W�F�N�g���ԋL�^").Activate
    For i = 2 To 2000
        ����\�t�� = 12
        If Worksheets("�v���W�F�N�g���ԋL�^").Cells(i, ����\�t��).Value <> "" Then
            Worksheets("�v���W�F�N�g���ԋL�^").Cells(i, ����\�t�� + 1).Value = Worksheets("�v���W�F�N�g���ԋL�^").Cells(i, ����\�t��).Value
        End If
    Next i
End Sub
