VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm3 
   Caption         =   "UserForm3"
   ClientHeight    =   3088
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7500
   OleObjectBlob   =   "UserForm3.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '����������
End
Attribute VB_Name = "UserForm3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Public kk As Integer
Public sr1 As String
Public zong1 As Integer 'zscr������룬zong1Ϊ��ֵ

Sub shuzu()
    Dim zan(3, 2) As Variant
    Dim ming As String
    Dim i As Integer
    
    i = 0
    zan(1, 1) = 1
    zan(1, 2) = wo
    zan(2, 1) = 1000
    zan(2, 2) = "s"
    zan(3, 1) = 201
    zan(3, 2) = er
    For X = 1 To 3
        If zan(X, 1) > i Then
            i = zan(X, 1)
            ix = X
            ming = zan(ix, 2)
        End If
    Next
    Debug.Print i
    Debug.Print ix
    Debug.Print zan(ix, 2)
    
    'c = max(zan(i, 1))
End Sub
Sub duqu()       '��ȡ���ֵ
    Dim ming, fen() As String
    Dim i, zhong, xu, zan() As Integer
    Dim h As Long
    
    Dim mingz(), str() As Variant
    
    zhong = 0
    Open "C:\bbdata\dz.txt" For Input As #1
    Do While Not EOF(1)
        h = h + 1       '����
        ReDim Preserve str(h)
        
        Line Input #1, str(h)  '��ȡԭʼ��
    Loop
    Close #1
    ReDim zan(h)
    ReDim mingz(h)
    
    For i = 1 To h
        fen = Split(str(i), " ")
        zan(i) = fen(0)
        mingz(i) = fen(1)
        'Debug.Print zan(i)
        If zan(i) > zhong Then
            'Debug.Print zhong
            zhong = zan(i)
            xu = i
        End If
    Next
    
    ming = mingz(xu)
    Debug.Print ming & zhong & xu
    
    
    
End Sub
Sub chushi() '��ȡ�Լ���ֵ�����ߴ�����ֵ�������ֵ
    
End Sub
Sub butgm() '������
    
End Sub

Sub dz()
    
    
End Sub

Private Sub CommandButton1_Click() '������
    Dim sr, xr As String   'sr����������,xr��д��text  'UserForm3.textnc.text�ǳ� UserForm3.labelzan.caption������ǩ
    
    Dim i, zhong, xu, xuda, zan() As Integer
    Dim h As Long
    Dim mingz(), str(), cp() As Variant
    
    '��ȡ�������Ƿ�������
    zhong = 0
    sr = UserForm3.Textnc.Text   '��ȡ��������
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
    xr = UserForm3.Textnc.Text                                 '���nc
    Print #1, xr
    Close #1
    NewMacros.duqu
    
End Sub

Private Sub CommandButton2_Click()
    '��ȡ���ֵ����������ֵ
    Dim ming As String
    Dim i, zhong, zong, xu, zan() As Integer
    Dim h As Long
    
    Dim mingz(), str(), fen As Variant
    
    
    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/dz.txt", "C:\bbdata\dz.txt", 0, 0) '�鿴���°汾
    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/dz.txt" '�������
    'If lngReturn = 0 Then
    
    '  Else
    
    '      MsgBox "����������ʧ��"
    '      Exit Sub
    ' End If
    zhong = 0
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
        If zan(i) > zhong Then
            'Debug.Print zhong
            zhong = zan(i)
            xu = i
        End If
        zong = zong + zan(i)
    Next
    
    ming = mingz(xu)
    UserForm3.Labelming.Caption = "    " & mingz(xu)
    UserForm3.Labelda.Caption = "ͬѧ�ܹ�����" & zhong & "���ޣ���"
    UserForm3.Labelzong.Caption = zong
    UserForm2.Label4.Caption = zong
    
    'Debug.Print zong
    
    
    
    
    
End Sub

Private Sub Label5_Click()  'dz
    Dim ming, sr, xr As String  'sr����������,xr��д��dztext  'UserForm3.textnc.text UserForm3.labelzan.caption
    
    Dim i, zhong, xu, zan() As Integer
    Dim h As Long
    Dim mingz(), str(), cp(), fen As Variant
    
    UserForm3.Labelzan.Caption = UserForm3.Labelzan.Caption + 1
    UserForm2.zcsr = UserForm2.zcsr + 1
    
    '��ȡ�������Ƿ�������
    sr = UserForm3.Textnc.Text   '��ȡ��������
    
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
        If mingz(i) = sr Then
            '�ҵ�������
            zhong = zan(i)  '�����ֵ�����
            xu = i            '���
        End If
    Next
    zan(xu) = UserForm3.Labelzan.Caption
    For i = 1 To h
        If i = 1 Then
            Open "C:\bbdata\dz.txt" For Output As #1
            xr = zan(i) & " " & mingz(i) & " " & cp(i)                                '���
            Print #1, xr
            Close #1
        Else
            
            Open "C:\bbdata\dz.txt" For Append As #1
            xr = zan(i) & " " & mingz(i) & " " & cp(i)                               '���
            Print #1, xr
            Close #1
        End If
    Next
    If UserForm2.zcsr = 10 Then
        MsgBox "������̫�Ҹ��ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 12 Then
        MsgBox "�Ҵ˿̾����Ƕ�ʮ���󺣵����ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 15 Then
        MsgBox "����ÿһ����ɳ��������ÿһ�κ�ˮ�������ϵ�����", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 22 Then
        MsgBox "��ҷ��Ļ��������۷䣬", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 25 Then
        MsgBox "���������˵�����Ż�������������Գ��ܵ�����", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 30 Then
        MsgBox "��ҫ�����̫����", vbOKOnly, "������̫�Ҹ��ˣ�"
    ElseIf UserForm2.zcsr = 32 Then
        MsgBox "�����������Ҳ��������һ�����Ժ����������ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 35 Then
        MsgBox "����ֱ�ԣ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 38 Then
        MsgBox "˭��������һ����㣬������һ��Ұ����ӡ���ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 39 Then
        MsgBox "�������ĳ�����ʼ����������������װݷ��������ϵ������������أ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 40 Then
        MsgBox "��һ��ӥ���������������۹⣬����ѣҫ�������������������ü�������ã�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 50 Then
        MsgBox "˵��ģ�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 53 Then
        MsgBox "�Ȳ���Ϊ���㣬���綼Ҫʧȥ���Ĺ���", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 68 Then
        MsgBox "����˵���ף�", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 70 Then
        MsgBox "�κ����������Ȳ��������������", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 76 Then
        MsgBox "��Ҫ�����ҿ�����!", vbOKOnly, "������ͬѧ"
    ElseIf UserForm2.zcsr = 79 Then
        MsgBox "���۵������ѣ����ֿ�ʽ��������Ҫ�����ϵ�ҹ�����", vbOKOnly, "������ͬѧ"
    End If
    UserForm2.Label7.Caption = "+1"
    UserForm3.Label7.Caption = "+1"
    
    
    NewMacros.duqu
    
End Sub


Private Sub UserForm_Activate()
    
    Dim bb As String
    
    kk = 1
    
    Labelming.WordWrap = False
    
    bb = Labelming
    
    
    
    Do
        
        If kk = 2 Then Exit Sub
        
        '      bb = Right(bb, 1) & Left(bb, Len(bb) - 1)
        
        '        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        
        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        
        Labelming = bb
        
        
        
        vv = Timer
        
        Do While Timer < vv + 0.2
            
            DoEvents
            
        Loop
        
        
        
    Loop
    
    
    
End Sub

Private Sub UserForm_Initialize()
    Dim sr, xr As String  'sr����������,xr��д��text  'UserForm3.textnc.text�ǳ� UserForm3.labelzan.caption������ǩ
    
    Dim i, zhong, zong1, xu, xuda, you As Integer
    Dim zan(), da, h As Long
    Dim mingz(), str(), cp(), fen As Variant
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
    
    
    '��ȡ�������Ƿ�������
    sr = UserForm3.Textnc.Text   '��ȡ��������
    
    you = 0    'youΪ1��Ϊ�Ѿ�������
    da = 0     '���ֵ
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
        If mingz(i) = sr Then
            '������
            you = 1
            zhong = zan(i)  '�����ֵ�����
            xu = i            '���
            UserForm3.Labelzan.Caption = zhong '��ʾ��������
            Debug.Print zhong   'zhong������ֵ
            'Exit For
        End If
        ' Debug.Print da
        'Debug.Print zan(i)
        
        'If zan(i) > da Then     '�����ֵ
        '     'Debug.Print zhong
        '     da = zan(i)
        '     xuda = i
        ' End If
        
    Next
    If you <> 1 Then     '���û���ҵ�����
        UserForm3.Labelzan.Caption = 0
        Open "C:\bbdata\dz.txt" For Append As #1
        xr = 0 & " " & sr & " " & Environ("computername")                                    '���
        Print #1, xr
        Close #1
    End If
    NewMacros.duqu
    Label7.Caption = "+" & Labelzong.Caption - UserForm2.zong1
End Sub


Private Sub UserForm_Terminate()
    kk = 2
    'Shell ("cmd /c C:\bbdata\dz.bat"), vbHide
End Sub
