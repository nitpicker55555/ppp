Attribute VB_Name = "NewMacros"
Sub ��1()
Attribute ��1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��1"
'
' ��1 ��
'
'
End Sub
Sub ��2()
Attribute ��2.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��2"
'
' ��2 ��
'
'
Selection.HomeKey Unit:=wdLine
    Selection.Style = ActiveDocument.Styles("���� 1")
    Selection.EndKey Unit:=wdLine
End Sub
Sub ��3()
Attribute ��3.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��3"
'
' ��3 ��
'
'
    Selection.HomeKey Unit:=wdLine
    Selection.Style = ActiveDocument.Styles("���� 2")
    Selection.EndKey Unit:=wdLine
End Sub
Sub ��4()
Attribute ��4.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��4"
'
' ��4 ��
'
'
Selection.HomeKey Unit:=wdLine
    Selection.Style = ActiveDocument.Styles("���� 3")
    Selection.EndKey Unit:=wdLine
End Sub
Sub ��5()
Attribute ��5.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��5"
'
' ��5 ��
'
'
    Options.DefaultHighlightColorIndex = wdYellow
    Selection.Range.HighlightColorIndex = wdYellow
    Selection.Font.Bold = wdToggle
End Sub
Sub ��6()
Attribute ��6.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��6"
'
' ��6 ��
'
'
    Selection.HomeKey Unit:=wdLine
    Selection.EndKey Unit:=wdLine
End Sub
Sub ��7()
Attribute ��7.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��7"
'
' ��7 ��
'
'
    Selection.Font.Superscript = wdToggle
    Selection.TypeText Text:="[1]"
    Selection.Font.Superscript = wdToggle
End Sub
Sub ��8()
Attribute ��8.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��8"
'
' ��8 ��
'
'
    Selection.Font.Superscript = wdToggle
    Selection.TypeText Text:="[]"
    Selection.MoveLeft Unit:=wdCharacter, Count:=1
End Sub
Sub ��9()
Attribute ��9.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.��9"
'
' ��9 ��
'
Selection.HomeKey Unit:=wdLine
    Selection.Style = ActiveDocument.Styles("���� 4")
    Selection.EndKey Unit:=wdLine
End Sub
