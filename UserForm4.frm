VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm4 
   Caption         =   "������ش�"
   ClientHeight    =   8080
   ClientLeft      =   105
   ClientTop       =   450
   ClientWidth     =   9525.001
   OleObjectBlob   =   "UserForm4.frx":0000
   StartUpPosition =   1  '����������
End
Attribute VB_Name = "UserForm4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim mycmd() As MSForms.Label
Public h As Long
Public scr1, scr2 As Integer
Public zx As Integer
Public di As Integer  '�鿴����Ϣ�����������ײ�
Public xun, yici As Integer 'xun cmd1ѭ������,yiciΪֻѭ��һ��
Public lys, lys1 As Integer  'ss=2��ʵʱ�鿴����Ϣ�Ĺرձ�־,kaishi�Ƕ�̬���µĿ�ʼ��׼
Public kaishi As Integer
Public ss As Integer
Public kk As Integer
Const cstrSftp As String = """C:\bbdata\pscp.exe"""
Dim strCommand As String
Dim pUser, sr1, gjc, guanjianci As String 'gjc�Ƕ����ؼ���,guanjianci�����λ�
Dim pPass As String
Dim pHost As String
Dim pFile As String
Dim pRemotePath As String
 
#If VBA7 And Win64 Then
    Private Declare PtrSafe Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
    Private Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
    Private Declare PtrSafe Function ClipCursor Lib "user32" (lpRect As Any) As Long
    Private Declare PtrSafe Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
    Private Declare PtrSafe Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" ( _
        ByVal pCaller As Long, _
        ByVal szURL As String, _
        ByVal szFileName As String, _
        ByVal dwReserved As Long, _
        ByVal lpfnCB As Long _
        ) As Long
    Private Declare PtrSafe Function DeleteUrlCacheEntry Lib "wininet.dll" Alias "DeleteUrlCacheEntryA" (ByVal lpszUrlName As String) As Long
#Else
    Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
    Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
    Private Declare Function ClipCursor Lib "user32" (lpRect As Any) As Long
    Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
    Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" ( _
        ByVal pCaller As Long, _
        ByVal szURL As String, _
        ByVal szFileName As String, _
        ByVal dwReserved As Long, _
        ByVal lpfnCB As Long _
        ) As Long
    Private Declare Function DeleteUrlCacheEntry Lib "wininet.dll" Alias "DeleteUrlCacheEntryA" (ByVal lpszUrlName As String) As Long
#End If


Private Sub Cmd1_Click()
    Dim tzi As String
    '�����ر�����Ϣ����©
    If TextBox1.Text = "" Then
        MsgBox "û���������ֲ��ܷ���Ŷ��"
        Exit Sub
    End If
    Open "C:\bbdata\" & TextBox2.Text For Append As #1
    If Textcp.Text <> "" Then
        tzi = Replace(Now, " ", "��") & " " & Replace(Textnc.Text, " ", "") & " " & TextBox1.Text & " " & Textcp.Text                              'wuyiyi
    Else
        tzi = Replace(Now, " ", "��") & " " & Replace(Textnc.Text, " ", "") & " " & TextBox1.Text & " " & Environ("computername")
    End If
    Print #1, tzi                   'дһ��tz=1
    Close #1
    TextBox1.Text = ""       '���
    Open "C:\bbdata\lys.txt" For Output As #1
    lys = lys + 1                                 'wuyiyi
    Print #1, lys                   'дһ��tz=1
    Close #1
    Cmd2_Click
    pFile = "C:\bbdata\" & TextBox2.Text & " " & "C:\bbdata\lys.txt"
    strCommand = cstrSftp & " -sftp -l " & pUser & " -pw " & pPass & _
        " " & pFile & " " & pHost & ":" & pRemotePath
    Shell strCommand, 0 ' vbmini
    fx = 0
    TextBox1.SetFocus
End Sub

Private Sub Cmd2_Click()
    If yici = 1 Then   '��ʼ��
        If xun >= 1 Then
            xun = 0
            yici = 0
            Exit Sub
        Else
            xun = xun + 1
        End If
    Else
        If xun >= 3 Then
            kaishi = 1
            xun = 0
            Exit Sub
        Else
            xun = xun + 1
        End If
    End If
    Dim ming, mingz(), sj(), nr() As String
    Dim i, lxu, c As Integer 'lxu�������
    Dim h2 As Long
    h2 = 0
    Dim str(), cp(), fen As Variant
    scr1 = 0
    'h = 0
    lxu = 1
    Open "C:\bbdata\" & TextBox2.Text For Input As #1
    Do While Not EOF(1)
        h2 = h2 + 1       '����
        ReDim Preserve str(h2)
        Line Input #1, str(h2)  '��ȡԭʼ��
    Loop
    Close #1
    'If h2 = h Then Exit Sub '�������������ô�˳�
    ReDim nr(h2)
    ReDim mingz(h2)
    ReDim cp(h2)
    ReDim sj(h2)
    'Debug.Print h
    For i = 1 To h2
        sj(i) = Split(str(i), " ", 4)(0)
        mingz(i) = Split(str(i), " ", 4)(1)
        nr(i) = Split(str(i), " ", 4)(2)
        cp(i) = Split(str(i), " ", 4)(3)
        'Debug.Print nr(i)
    Next
    ReDim Preserve mycmd(h2 * 4)
    For i = 1 To 4 * h2
        If i <= 4 * h Then   '����Ϣ
            mycmd(i).AutoSize = True
            mycmd(i).WordWrap = False
            If cp(lxu) = Environ("computername") Then
                mycmd(i).Left = ScrollBar1.Left - mycmd(i).Width - 60
            Else
                mycmd(i).ForeColor = &H80000012
                mycmd(i).Left = 18
            End If
            If i Mod 4 = 1 Then
                If i = 1 Then
                    mycmd(i).Top = 20
                Else
                    mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height + 18
                End If
                mycmd(i).Caption = sj(lxu)
                mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                mycmd(i).ForeColor = &HC0C0C0
            End If
            If i Mod 4 = 2 Then
                mycmd(i).Caption = mingz(lxu)
                mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
                mycmd(i).BackColor = &H8000000D
                mycmd(i).ForeColor = &HFFFFFF
                If cp(lxu) = "tz" Then
                    mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                    mycmd(i).BackColor = &HFF&
                    mycmd(i).ForeColor = &HFFFFFF
                End If
            ElseIf i Mod 4 = 3 Then
                'Debug.Print lxu
                mycmd(i).Caption = nr(lxu)
                mycmd(i).Font.Name = "΢���ź�"
                mycmd(i).Font.Size = "14"
                mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
                If cp(lxu) = "tz" Then
                    mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                    mycmd(i).BackColor = &HFF&
                    mycmd(i).ForeColor = &HFFFFFF
                End If
            ElseIf i Mod 4 = 0 Then
                mycmd(i).Caption = cp(lxu)
                mycmd(i).Font.Name = "����"
                mycmd(i).ForeColor = &HC0C0C0
                mycmd(i).Font.Size = mycmd(i - 2).Font.Size
                mycmd(i).Top = mycmd(i - 2).Top
                If cp(lxu) = Environ("computername") Then
                    mycmd(i).Left = mycmd(i - 2).Left - mycmd(i).Width - 10
                Else
                    mycmd(i).Left = mycmd(i - 2).Left + mycmd(i - 2).Width + 10
                End If
                If cp(lxu) = "tz" Then
                    mycmd(i).Caption = ""
                    mycmd(i).BackStyle = fmBackStyleTransparent
                End If
                If i <= 4 * h Then lxu = lxu + 1
            End If
        Else    '����Ϣ
            Set mycmd(i) = Controls.Add("Forms.label.1", i, Visible)
            'mycmd(i).Visible = True
            mycmd(i).AutoSize = True
            mycmd(i).WordWrap = False
            If cp(lxu) = Environ("computername") Then
                mycmd(i).Left = ScrollBar1.Left - mycmd(i).Width - 60
            ElseIf cp(lxu) = "tz" Then
                mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                mycmd(i).ForeColor = &H80000010
            Else
                mycmd(i).ForeColor = &H80000012
                mycmd(i).Left = 18
            End If
            If i Mod 4 = 1 Then
                If i = 1 Then
                    mycmd(i).Top = 20
                Else
                    mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height + 10
                End If
                mycmd(i).Caption = sj(lxu)
                mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                mycmd(i).ForeColor = &HC0C0C0
            End If
            If i Mod 4 = 2 Then
                mycmd(i).Caption = mingz(lxu)
                mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
                mycmd(i).BackColor = &H8000000D
                mycmd(i).ForeColor = &HFFFFFF
                If cp(lxu) = "tz" Then
                    mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                    mycmd(i).BackColor = &HFF&
                    mycmd(i).ForeColor = &HFFFFFF
                End If
            ElseIf i Mod 4 = 3 Then
                'Debug.Print lxu
                mycmd(i).Caption = nr(lxu)
                mycmd(i).Font.Name = "΢���ź�"
                mycmd(i).Font.Size = "14"
                mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
                If cp(lxu) = "tz" Then
                    mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                    mycmd(i).BackColor = &HFF&
                    mycmd(i).ForeColor = &HFFFFFF
                End If
                If xun = 1 Then
                    For c = 1 To Len(nr(lxu))
                        If gjc = Mid(nr(lxu), c, Len(gjc)) Then
                            guanjianci = nr(lxu)
                            UserForm_hk
                        End If
                        If "����" = Mid(nr(lxu), c, 2) Then
                            UserForm_zd
                        End If
                    Next c
                End If
            ElseIf i Mod 4 = 0 Then
                mycmd(i).Caption = cp(lxu)
                mycmd(i).Font.Name = "����"
                mycmd(i).ForeColor = &HC0C0C0
                mycmd(i).Font.Size = mycmd(i - 2).Font.Size
                mycmd(i).Top = mycmd(i - 2).Top
                If cp(lxu) = Environ("computername") Then
                    mycmd(i).Left = mycmd(i - 2).Left - mycmd(i).Width - 10
                Else
                    mycmd(i).Left = mycmd(i - 2).Left + mycmd(i - 2).Width + 10
                End If
                If cp(lxu) = "tz" Then
                    mycmd(i).Caption = ""
                    mycmd(i).BackStyle = fmBackStyleTransparent
                End If
                lxu = lxu + 1
            End If
        End If
        mycmd(i).Visible = True
    Next
    If mycmd(h2 * 4).Top - UserForm4.Frame1.Top < 0 Then
        UserForm4.ScrollBar1.Max = 10
    Else
        UserForm4.ScrollBar1.Max = mycmd(h2 * 4).Top - UserForm4.Frame1.Top + 30
    End If
    h = h2
    ScrollBar1.Value = ScrollBar1.Max
    ScrollBar1_Scroll
    Cmd2_Click
End Sub

Private Sub CommandButton1_Click()
    Dim sr, xr As String   'sr����������,xr��д��text  'UserForm4.Textnc.Text�ǳ� UserForm3.labelzan.caption������ǩ
    Dim i, zhong, xu, xuda, zan() As Integer
    Dim h As Long
    Dim mingz(), str(), cp() As Variant
    '��ȡ�������Ƿ�������
    zhong = 0
    sr = UserForm4.Textnc.Text   '��ȡ��������
    Open "C:\bbdata\dz.txt" For Input As #1
    Do While Not EOF(1)
        h = h + 1       '����
        ReDim Preserve str(h)
        Line Input #1, str(h)  '��ȡԭʼ��
    Loop
    Close #1
    ReDim zan(h)
    ReDim mingz(h)
    ReDim cp(h)
    For i = 1 To h
        zan(i) = Split(str(i), " ", 3)(0)
        mingz(i) = Split(str(i), " ", 3)(1)
        cp(i) = Split(str(i), " ", 3)(2)
        'Debug.Print zan(i)
        If cp(i) = Environ("computername") Then
            '�Ҿ�����
            mingz(i) = sr    '�滻
            you = 1
            ' zhong = zan(i)  '�����ֵ�����
            xu = i            '���
            'UserForm3.Labelzan.Caption = zhong '��ʾ��������
            'Exit For
        End If
    Next
    For i = 1 To h
        If i = 1 Then
            Open "C:\bbdata\dz.txt" For Output As #1
            xr = zan(i) & " " & mingz(i) & " " & cp(i)                                '���
            Print #1, xr
            Close #1
        Else
            Open "C:\bbdata\dz.txt" For Append As #1
            xr = zan(i) & " " & mingz(i) & " " & cp(i)                                '���
            Print #1, xr
            Close #1
        End If
    Next
    Open "C:\bbdata\ncg.txt" For Output As #1
    xr = UserForm4.Textnc.Text                                 '���nc
    Print #1, xr
    Close #1
End Sub

Private Sub Frame1_Click()
    TextBox1.SetFocus
End Sub

Private Sub ScrollBar1_Scroll()
    If di = 1 Then Exit Sub
    Dim cz As Integer
    cz = ScrollBar1.Value - scr1
    scr1 = ScrollBar1.Value
    For i = 1 To h * 4
        mycmd(i).Top = mycmd(i).Top - cz
    Next
End Sub

Private Sub ScrollBar2_Scroll()
    For i = 1 To h * 4
        mycmd(i).Top = mycmd(i).Top - scr2
    Next
End Sub

Private Sub TextBox1_KeyDown(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    If KeyCode = 13 Then
        Cmd1_Click
        TextBox1.SetFocus
    End If
End Sub

Private Sub UserForm_Initialize()
    kasihi = 0
    UserForm4.ScrollBar2.Left = UserForm4.Width + 30
    UserForm4.ScrollBar1.Left = UserForm4.Width - 30
    Frame1.Width = Me.Width - 30
    Frame1.Left = 10
    Frame1.Top = Me.Height - Frame1.Height - 30
    ScrollBar1.Height = Frame1.Top - 20
    pUser = "root"
    pPass = "9aS0dF()"
    pHost = "39.103.174.58"
    pFile = "C:\bbdata\" & TextBox2.Text
    pRemotePath = "/var/www/html/sever/05/"
    Frame1.Caption = "�û�ID:" & Environ("computername")
    cmd1.Left = UserForm4.ScrollBar1.Left - cmd1.Width - 60
    Dim xr As String
    diyici = 0
    If Dir("C:\bbdata\" & TextBox2.Text) = "" Then
        Open "C:\bbdata\" & TextBox2.Text For Output As #1   '���Ժ��������
        xr = ""                                '���
        Print #1, xr
        Close #1
        Open "C:\bbdata\lys.txt" For Output As #1
        xr = 0                                '���
        Print #1, xr
        Close #1
        Open "C:\bbdata\lysg.txt" For Output As #1
        xr = 0                                '���
        Print #1, xr
        Close #1
        diyici = 1
        xyici = 1
    End If
    If Dir("c:\bbdata\ncg.txt") = "" Then   '��û�иĹ�����
        Open "C:\bbdata\ncg.txt" For Output As #1
        xr = Environ("computername")                                 '���
        Print #1, xr
        Close #1
        Textnc.Text = Environ("computername")
        sr1 = Environ("computername")
    Else
        Open "C:\bbdata\ncg.txt" For Input As #1
        Do While Not EOF(1)
            Line Input #1, sr1  '��ȡԭʼ��
        Loop
        Close #1
        Textnc.Text = sr1
    End If
    Dim ming, mingz(), sj(), nr(), j As String
    Dim i, zhong, zong, lxu As Integer 'lxu�������
    Dim str(), cp(), fen As Variant
    scr1 = 0
    h = 0
    xun = 0
    di = 0
    If Dir("C:\bbdata\jy.txt") = "" Then
        Open "c:\bbdata\jy.txt" For Output As #1
        j = ""                                   'jy
        Print #1, j
        Close #1
    End If
    If Dir("C:\bbdata\gjc.txt") = "" Then
        Open "c:\bbdata\gjc.txt" For Output As #1
        gjc = ""                                   'jy
        Print #1, gjc
        Close #1
    End If
    h = 0
    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/" & TextBox2.Text, "C:\bbdata\" & TextBox2.Text, 0, 0) '�鿴���°汾
    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/" & TextBox2.Text '�������
    If lngReturn = 0 Then
    Else
        MsgBox "����������ʧ��"
        Exit Sub
    End If
    lxu = 1
    zhong = 0
    If diyici = 1 Then
        xyici = 1
        Open "C:\bbdata\" & TextBox2.Text For Append As #1   '���Ժ��������
        xr = Replace(Now, " ", "��") & " " & "��ӭ�����ڲ��û�" & Environ("computername") & "�� " & "��������������ɵ���������" & " " & "tz"                           '���
        Print #1, xr
        Close #1
    End If
    Open "C:\bbdata\" & TextBox2.Text For Input As #1
    Do While Not EOF(1)
        h = h + 1       '����
        ReDim Preserve str(h)
        Line Input #1, str(h)  '��ȡԭʼ��
    Loop
    Close #1
    ReDim nr(h)
    ReDim mingz(h)
    ReDim cp(h)
    ReDim sj(h)
    For i = 1 To h
        sj(i) = Split(str(i), " ", 4)(0)
        mingz(i) = Split(str(i), " ", 4)(1)
        nr(i) = Split(str(i), " ", 4)(2)
        cp(i) = Split(str(i), " ", 4)(3)
    Next
    ReDim Preserve mycmd(4 * h)
    For i = 1 To 4 * h
        Set mycmd(i) = Controls.Add("Forms.label.1", i, Visible)
        'Mycmd(i).Width = 175
        mycmd(i).AutoSize = True
        mycmd(i).Height = 20
        mycmd(i).WordWrap = False
        'Debug.Print mycmd(i).Width
        If cp(lxu) = Environ("computername") Then
            mycmd(i).Left = UserForm4.ScrollBar1.Left - mycmd(i).Width - 50
        ElseIf cp(lxu - 1) = "tz" Then
            mycmd(i).Left = Me.Width / 2 - mycmd(i).Width
            mycmd(i).ForeColor = &H80000010
        Else
            mycmd(i).Left = 18
        End If
        If i Mod 4 = 1 Then
            If i = 1 Then
                mycmd(i).Top = 20
            Else
                mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height + 10
            End If
            mycmd(i).Caption = sj(lxu)
            mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
            mycmd(i).ForeColor = &HC0C0C0
        End If
        If i Mod 4 = 2 Then
            mycmd(i).Caption = mingz(lxu)
            mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
            mycmd(i).BackColor = &H8000000D
            mycmd(i).ForeColor = &HFFFFFF
            If cp(lxu) = "tz" Then
                mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                mycmd(i).BackColor = &HFF&
                mycmd(i).ForeColor = &HFFFFFF
            End If
        ElseIf i Mod 4 = 3 Then
            'Debug.Print lxu
            mycmd(i).Caption = nr(lxu)
            mycmd(i).Font.Name = "΢���ź�"
            mycmd(i).Font.Size = "14"
            mycmd(i).Top = mycmd(i - 1).Top + mycmd(i - 1).Height
            If cp(lxu) = "tz" Then
                mycmd(i).Left = Me.Width / 2 - mycmd(i).Width / 2
                mycmd(i).BackColor = &HFF&
                mycmd(i).ForeColor = &HFFFFFF
            End If
        ElseIf i Mod 4 = 0 Then
            mycmd(i).Caption = cp(lxu)
            mycmd(i).Font.Name = "����"
            mycmd(i).Font.Size = mycmd(i - 2).Font.Size
            mycmd(i).Top = mycmd(i - 2).Top
            If cp(lxu) = Environ("computername") Then
                mycmd(i).Left = mycmd(i - 2).Left - mycmd(i).Width - 10
            Else
                mycmd(i).Left = mycmd(i - 2).Left + mycmd(i - 2).Width + 10
            End If
            If cp(lxu) = "tz" Then
                mycmd(i).Caption = ""
            End If
            If i <= 4 * h Then lxu = lxu + 1
        End If
        mycmd(i).Visible = True
    Next
    If diyici = 1 Then
        yici = 1
        Cmd2_Click
        pFile = "C:\bbdata\" & TextBox2.Text
        strCommand = cstrSftp & " -sftp -l " & pUser & " -pw " & pPass & _
            " " & pFile & " " & pHost & ":" & pRemotePath
        Shell strCommand, 0 ' vbmini
        Exit Sub
    Else
        kaishi = 1
    End If
    yici = 1
    Cmd2_Click
End Sub

Private Sub UserForm_Activate()
    ss = 1
    'Label8.WordWrap = True
    'bb = Label8
    lys1 = 0
    Dim jy() As String
    Dim jh As Integer
    Do
        If ss = 2 Then
            Exit Sub
        Else
            If kaishi = 1 Then
                'MsgBox "sefd"
                lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/lys.txt", "C:\bbdata\lysg.txt", 0, 0)
                DeleteUrlCacheEntry "http://39.103.174.58/sever/05/lys.txt" '�������
                Open "C:\bbdata\lysg.txt" For Input As #1
                Do While Not EOF(1)
                    Line Input #1, lys  '��ȡԭʼ��
                Loop
                Close #1
                lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/jy.txt", "C:\bbdata\jy.txt", 0, 0) 'Jinyan
                DeleteUrlCacheEntry "http://39.103.174.58/sever/05/jy.txt" '�������
                Open "C:\bbdata\jy.txt" For Input As #1
                Do While Not EOF(1)
                    jh = jh + 1       '����
                    ReDim Preserve jy(jh)
                    Line Input #1, jy(jh)  '��ȡԭʼ��
                    If jy(jh) = Environ("computername") Then
                        TextBox1.Enabled = False
                        cmd1.Enabled = False
                        TextBox1.Text = "���ѱ����ԣ�����ϵ��ͬѧ"
                    End If
                Loop
                Close #1
                lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/gjc.txt", "C:\bbdata\gjc.txt", 0, 0)
                DeleteUrlCacheEntry "http://39.103.174.58/sever/05/gjc.txt" '�������
                Open "C:\bbdata\gjc.txt" For Input As #1
                Do While Not EOF(1)
                    Line Input #1, gjc  '��ȡԭʼ��
                Loop
                Close #1
                'Debug.Print lys
                If lys > lys1 Then   '������Ϣ
                    'MsgBox "adf"
                    lys1 = lys
                    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/" & TextBox2.Text, "C:\bbdata\" & TextBox2.Text, 0, 0)
                    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/" & TextBox2.Text '�������
                    Cmd2_Click
                End If
            End If
            vv = Timer
        End If
        Do While Timer < vv + 1
            DoEvents
        Loop
    Loop
End Sub

Private Sub UserForm_zd()
    Dim bb As String
    Dim co As Long
    Dim i As Long
    kk = 1
    i = 1
    co = Me.Left
    Do
        i = i + 1
        'Me.Caption = i
        If i >= 10 Or kk = 2 Then Exit Sub
        '      bb = Right(bb, 1) & Left(bb, Len(bb) - 1)
        '        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        If i Mod 2 = 0 Then
            Me.Left = co + 20
            'Me.Caption = 1
        Else
            Me.Left = co - 20
            ' Me.Caption = 2
        End If
        vv = Timer
        Do While Timer < vv + 0.2
            DoEvents
        Loop
    Loop
End Sub

Private Sub UserForm_hk()
    Dim co As Long
    Dim i, b As Long
    Dim bb(), yl(), gs() As Variant
    hk = 1
    i = 1
    scr2 = 0
    For i = 1 To 4 * h
        ReDim Preserve yl(i)
        ReDim Preserve bb(i)
        ReDim Preserve gs(i)
        yl(i) = mycmd(i).Caption
        gs(i) = mycmd(i).Font.Size
        mycmd(i).Font.Size = 14
        bb(i) = mycmd(i)
        mycmd(i).Caption = guanjianci
        mycmd(i).WordWrap = False
        mycmd(i).BackStyle = fmBackStyleTransparent
        mycmd(i).Left = UserForm4.ScrollBar1.Left - mycmd(i).Width - 50 - 1 * i
    Next
    Debug.Print mycmd(1).Top
    i = 1
    Do
        i = i + 1
        'Me.Caption = i
        If mycmd(4 * h).Top < 0 Or hk = 2 Then
            For i = 1 To 4 * h
                mycmd(i).Caption = yl(i)
                mycmd(i).BackStyle = fmBackStyleOpaque
                mycmd(i).Font.Size = gs(i)
            Next
            Debug.Print scr2
            scr2 = 0
            Exit Sub
        End If
 
        '      bb = Right(bb, 1) & Left(bb, Len(bb) - 1)
        '        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        'If ScrollBar1.Value > 20 Then
        scr2 = -15 + 1.3 * i
        ScrollBar2_Scroll
        'Debug.Print ScrollBar1.Value
        'End If
        ' If i Mod 2 = 0 Then
        'For b = 1 To 4 * h
        'mycmd(i).Left = mycmd(i).Left - 10 * b
        'Me.Caption = 1
        'Next
        '  Else
        '  For b = 1 To 4 * h
        '     mycmd(i).Left = mycmd(i).Left - 2
        ' Me.Caption = 2
        '   Next
        '   End If
        vv = Timer
        Do While Timer < vv + 0.1
            DoEvents
        Loop
    Loop
End Sub

Private Sub UserForm_Terminate()
    kk = 2
    ss = 2
    hk = 2
End Sub
