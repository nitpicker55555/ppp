VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm2 
   Caption         =   "�汾"
   ClientHeight    =   2824
   ClientLeft      =   105
   ClientTop       =   450
   ClientWidth     =   5670
   OleObjectBlob   =   "UserForm2.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '����������
End
Attribute VB_Name = "UserForm2"
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
Dim gs, tzz As String
Public kk As Integer
Public zong1, zcsr As Integer

Private Sub CommandButton1_Click()
    
    UserForm4.Show
    Open "C:\bbdata\" & UserForm1.Label21.Caption & "\cishu.txt" For Append As #1
    gs = "����"                                       'wuyiyi
    Print #1, gs
    Close #1
    
End Sub

Private Sub gengxin_Click()
    
End Sub

Private Sub CommandButton2_Click()
    Open "C:\bbdata\" & UserForm1.Label21.Caption & "\cishu.txt" For Append As #1
    gs = "����"                                       'wuyiyi
    Print #1, gs
    Close #1
    
    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/banben.txt", "C:\bbdata\bb.txt", 0, 0)
    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/banben.txt" '�������
    
    
    ' ע�⣺URLDownloadToFile��������0��ʾ�ļ����سɹ�
    
    '�жϷ��صĽ���Ƿ�Ϊ0,�򷵻�True�����򷵻�False
    
    If lngReturn = 0 Then
        
    Else
        
        MsgBox "����������ʧ��"
        Exit Sub
    End If
    
    Open "C:\bbdata\bb.txt" For Input As #1
    Do While Not EOF(1)
        Line Input #1, all  '���Ѵ򿪵�˳���ļ��ж���һ�в���������� String ����
        'Line Input # ���һ��ֻ���ļ��ж���һ���ַ���ֱ�������س��� (Chr(13))
        '��س��C���з� (Chr(13) + Chr(10)) Ϊֹ���س��C���з����������������ᱻ���ӵ��ַ�����
        Debug.Print all
    Loop
    Close #1
    If all > UserForm1.Label20.Caption Then                                         'Ŀǰ�İ汾��
        lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/bbn.txt", "C:\bbdata\bbn.txt", 0, 0)
        DeleteUrlCacheEntry "http://39.103.174.58/sever/05/bbn.txt" '�������
        
        Open "C:\bbdata\bbn.txt" For Input As #1
        Do While Not EOF(1)
            Line Input #1, bbn  '���Ѵ򿪵�˳���ļ��ж���һ�в���������� String ����
            'Line Input # ���һ��ֻ���ļ��ж���һ���ַ���ֱ�������س��� (Chr(13))
            '��س��C���з� (Chr(13) + Chr(10)) Ϊֹ���س��C���з����������������ᱻ���ӵ��ַ�����
            Debug.Print bbn
        Loop
        Close #1
        If MsgBox("" & bbn, vbOKCancel, "�汾" & all & "�ĳ������") = vbOK Then
            lngReturn2 = URLDownloadToFile(0, "http://39.103.174.58/sever/05/pb.docm", "" & ThisDocument.Path & "\�����Զ��Ű�" & all & ".docm", 0, 0)
            MsgBox "�汾Ϊ" & all & "���µĳ����Ѿ�������ͬһ�ļ����У��ɳ��򲻻��Զ�ɾ����", vbOKOnly, "������ͬѧ"
        End If
    Else
        MsgBox "��İ汾�����µ�Ŷ", vbOKOnly, "������ͬѧ"
        
    End If
    
    If lngReturn2 = 0 Then
        
    Else
        
        MsgBox "����������ʧ��"
        
    End If
    
End Sub



Private Sub CommandButton3_Click()
    
    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/tzz.txt", "C:\bbdata\tzz.txt", 0, 0)
    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/tzz.txt" '�������
    
    Open "C:\bbdata\tzz.txt" For Input As #1
    Do While Not EOF(1)
        Line Input #1, tzz
        Debug.Print tzz
    Loop
    Close #1
    Open "C:\bbdata\" & UserForm1.Label21.Caption & "\cishu.txt" For Append As #1
    gs = tzz & "_�鿴��Ϣ"                                       'wuyiyi
    Print #1, gs
    Close #1
    
    MsgBox "" & tzz, vbOKOnly, "������ͬѧ����Ϣ"
    
End Sub

Private Sub CommandButton4_Click()
    UserForm3.Show
    Open "C:\bbdata\" & UserForm1.Label21.Caption & "\cishu.txt" For Append As #1
    gs = "С�ʵ�"                                       'wuyiyi
    Print #1, gs
    Close #1
End Sub

Private Sub Image1_BeforeDragOver(ByVal Cancel As MSForms.ReturnBoolean, ByVal Data As MSForms.DataObject, ByVal X As Single, ByVal Y As Single, ByVal DragState As MSForms.fmDragState, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)
    
End Sub

Private Sub Image1_click()
    
End Sub

Private Sub Label3_Click()
    
End Sub

Private Sub Label5_Click()
    Dim ming, sr, xr As String  'sr����������,xr��д��dztext  'UserForm3.textnc.text UserForm3.labelzan.caption
    
    Dim i, zhong, xu, zan() As Integer
    Dim h As Long
    Dim mingz(), str(), cp(), fen As Variant
    
    UserForm3.Labelzan.Caption = UserForm3.Labelzan.Caption + 1
    zcsr = zcsr + 1
    
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
    If zcsr = 10 Then
        MsgBox "������̫�Ҹ��ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 12 Then
        MsgBox "�Ҵ˿̾����Ƕ�ʮ���󺣵����ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 15 Then
        MsgBox "����ÿһ����ɳ��������ÿһ�κ�ˮ�������ϵ�����", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 22 Then
        MsgBox "��ҷ��Ļ��������۷䣬", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 25 Then
        MsgBox "���������˵�����Ż�������������Գ��ܵ�����", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 30 Then
        MsgBox "��ҫ�����̫����", vbOKOnly, "������̫�Ҹ��ˣ�"
    ElseIf zcsr = 32 Then
        MsgBox "�����������Ҳ��������һ�����Ժ����������ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 35 Then
        MsgBox "����ֱ�ԣ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 38 Then
        MsgBox "˭��������һ����㣬������һ��Ұ����ӡ���ˣ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 39 Then
        MsgBox "�������ĳ�����ʼ����������������װݷ��������ϵ������������أ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 40 Then
        MsgBox "��һ��ӥ���������������۹⣬����ѣҫ�������������������ü�������ã�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 50 Then
        MsgBox "˵��ģ�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 53 Then
        MsgBox "�Ȳ���Ϊ���㣬���綼Ҫʧȥ���Ĺ���", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 68 Then
        MsgBox "����˵���ף�", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 70 Then
        MsgBox "�κ����������Ȳ��������������", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 76 Then
        MsgBox "��Ҫ�����ҿ�����!", vbOKOnly, "������ͬѧ"
    ElseIf zcsr = 79 Then
        MsgBox "���۵������ѣ����ֿ�ʽ��������Ҫ�����ϵ�ҹ�����", vbOKOnly, "������ͬѧ"
    End If
    UserForm2.Label7.Caption = "+1"
    UserForm3.Label7.Caption = "+1"
    
    
    NewMacros.duqu
    
    
    
End Sub


Private Sub Label8_Click()
    UserForm3.Show
    
End Sub

Private Sub UserForm_Click()
    
End Sub
Private Sub UserForm_Activate()
    
    Dim bb As String
    
    kk = 1
    
    Label8.WordWrap = True
    
    bb = Label8
    
    
    
    Do
        
        If kk = 2 Then Exit Sub
        
        '      bb = Right(bb, 1) & Left(bb, Len(bb) - 1)
        
        '        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        
        bb = Right(bb, Len(bb) - 1) & Left(bb, 1)
        
        Label8 = bb
        Label8.Width = CommandButton4.Width
        
        
        
        vv = Timer
        
        Do While Timer < vv + 0.2
            
            DoEvents
            
        Loop
        
        
        
    Loop
    
    
    
End Sub


Private Sub UserForm_Error(ByVal Number As Integer, ByVal Description As MSForms.ReturnString, ByVal SCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, ByVal CancelDisplay As MSForms.ReturnBoolean)
    
End Sub

Private Sub UserForm_Initialize()
    On Error Resume Next
    Dim all, t, tzz, ttz, dztz, dzztz, bat As String
    Dim tz, xr As String
    Dim ming As String
    Dim i, zhong, xu, zan() As Integer
    Dim h As Long
    
    Dim mingz(), str(), fen As Variant
    zcsr = 0
    Label8.Top = CommandButton4.Height / 2 + 10
    Label8.Width = CommandButton4.Width
    Label8.Left = CommandButton4.Left
    lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/dz.txt", "C:\bbdata\dz.txt", 0, 0)
    DeleteUrlCacheEntry "http://39.103.174.58/sever/05/dz.txt" '�������
    
    If Dir("C:\bbdata\dz.txt") = "" Then     '�����ĵ�
        Open "C:\bbdata\dz.txt" For Output As #1
        xr = ""                                '���
        Print #1, xr
        Close #1
    End If
    Dim z As Integer
    ' On Error Resume Next
    Dim bb As Integer
    UserForm2.Caption = "�汾��" & UserForm1.Label20.Caption
    If Dir("C:\bbdata\dz.bat") = "" Then   'dz�ϴ�
        Open "C:\bbdata\dz.bat" For Output As #1
        bat = "echo y | C:\bbdata\pscp.exe -l root -pw ""9aS0dF()"" C:\bbdata\dz.txt" & " " & "root@39.103.174.58:/sever/05/dz.txt"
        Print #1, bat
        Close #1
    End If
    If Dir("C:\bbdata\bb.txt") = "" Then
        MkDir "C:\bbdata" '�����ļ���
        Open "C:\bbdata\bb.txt" For Output As #1
        bb = UserForm1.Label20.Caption                                        'wuyiyi
        Write #1, bb
        Close #1
    End If
    If Dir("C:\bbdata\pscp.exe") = "" Then  '��һ��huichuan
        lngReturn = URLDownloadToFile(0, "http://39.103.174.58/sever/05/231.21", "C:\bbdata\pscp.txt", 0, 0)
        Shell "cmd /c rename C:\bbdata\pscp.txt pscp.exe", vbHide
        MkDir "C:\bbdata\" & UserForm1.Label21.Caption '�����ļ���
    End If
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
        zong1 = zong1 + zan(i)       '��ֵ
    Next
    
    NewMacros.duqu
    UserForm2.Label7.Caption = "+" & UserForm2.Label4.Caption - zong1
    
End Sub

Private Sub UserForm_Terminate()
    kk = 2
    Shell ("cmd /c C:\bbdata\dz.bat"), vbHide
    
End Sub
