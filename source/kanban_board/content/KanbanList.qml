import QtQuick 2.0

/*
Excel Macros

Function getRGB1(FCell As Range) As String
'UpdatebyExtendoffice20170714
    Dim xColor As String
    xColor = CStr(FCell.Interior.Color)
    xColor = Right("000000" & Hex(xColor), 6)
    getRGB1 = Right(xColor, 2) & Mid(xColor, 3, 2) & Left(xColor, 2)
End Function

Function SHEETNAME(number As Long) As String
    SHEETNAME = Sheets(number).Name
End Function

=INDIRECT("'" & SHEETNAME(ROW()) & "'!J1")
=ListElement {
kanbanIndex: "& SHEET() &"
sebango: '"&A5&"'
kanban: '"&G1&"'
cardColor: '#"&  getRGB1(A5) &"'
aliasColor: '#"&  getRGB1(E5) &"'
clientRef: '"& LEFT(E3;10) &"'
reference: '"& RIGHT(E3;10) &"'
count: " & A11/2 & "
project: '" & C11 & "'
alias: '" & SUBSTITUTE(SUBSTITUTE(E5;"  ";" ");CHAR(10);" ") & "'
company: '" & E1 & "'
blocked: false
picture1: 'armrest " & A5 & "'
picture2: 'armrest side " & A5 & "'
picture3: 'cover " & A5 & "'
picture4: 'extra " & A5 & "'
}
*/

ListModel {
ListElement {
kanbanIndex: 2
sebango: 'A993XA'
kanban: '1598001115'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76RA993XA'
reference: '1346945XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A993XA'
picture2: 'armrest side A993XA'
picture3: 'cover A993XA'
picture4: 'extra A993XA'
}
ListElement {
kanbanIndex: 3
sebango: 'A994XA'
kanban: '1598001116'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76RA994XA'
reference: '1346952XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ ХРОМИРОВАННАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A994XA'
picture2: 'armrest side A994XA'
picture3: 'cover A994XA'
picture4: 'extra A994XA'
}
ListElement {
kanbanIndex: 4
sebango: 'A995XB'
kanban: '1598001545'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76RA995XB'
reference: '1946949XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A995XB'
picture2: 'armrest side A995XB'
picture3: 'cover A995XB'
picture4: 'extra A995XB'
}
ListElement {
kanbanIndex: 5
sebango: 'A996XB'
kanban: '1598001546'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76RA996XB'
reference: '1946951XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A996XB'
picture2: 'armrest side A996XB'
picture3: 'cover A996XB'
picture4: 'extra A996XB'
}
ListElement {
kanbanIndex: 6
sebango: 'A997XA'
kanban: '1598001119'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76RA997XA'
reference: '1346941XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ЧЁРНАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A997XA'
picture2: 'armrest side A997XA'
picture3: 'cover A997XA'
picture4: 'extra A997XA'
}
ListElement {
kanbanIndex: 7
sebango: 'A998XA'
kanban: '1598001120'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76RA998XA'
reference: '1346953XKW'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ ЧЁРНАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest A998XA'
picture2: 'armrest side A998XA'
picture3: 'cover A998XA'
picture4: 'extra A998XA'
}
ListElement {
kanbanIndex: 8
sebango: 'D586'
kanban: '1598001544'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76QD586XA'
reference: '1946910XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ЧЁРНАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ ЧЁРНАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D586'
picture2: 'armrest side D586'
picture3: 'cover D586'
picture4: 'extra D586'
}
ListElement {
kanbanIndex: 9
sebango: 'D585'
kanban: '1598001543'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76QD585XA'
reference: '1946893XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ЧЁРНАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ ЧЁРНАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D585'
picture2: 'armrest side D585'
picture3: 'cover D585'
picture4: 'extra D585'
}
ListElement {
kanbanIndex: 10
sebango: 'D583'
kanban: '1598001539'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76QD583XA'
reference: '1956889XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ СЕРЕБРИСТАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D583'
picture2: 'armrest side D583'
picture3: 'cover D583'
picture4: 'extra D583'
}
ListElement {
kanbanIndex: 11
sebango: 'D584'
kanban: '1598001540'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76QD584XA'
reference: '1946911XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ СЕРЕБРИСТАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D584'
picture2: 'armrest side D584'
picture3: 'cover D584'
picture4: 'extra D584'
}
ListElement {
kanbanIndex: 12
sebango: 'D757'
kanban: '1598001541'
cardColor: '#FFFF00'
aliasColor: '#FFFF00'
clientRef: 'W76QD757XA'
reference: '1946892XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ ЧЁРНАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D757'
picture2: 'armrest side D757'
picture3: 'cover D757'
picture4: 'extra D757'
}
ListElement {
kanbanIndex: 13
sebango: 'D758'
kanban: '1598001542'
cardColor: '#0070C0'
aliasColor: '#0070C0'
clientRef: 'W76QD758XA'
reference: '1946907XKW'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ХРОМИРОВАННАЯ РУЧКА ТЕКСТИЛЬНОЕ ПОКРЫТИЕ ЧЁРНАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest D758'
picture2: 'armrest side D758'
picture3: 'cover D758'
picture4: 'extra D758'
}
ListElement {
kanbanIndex: 14
sebango: '83 YA'
kanban: '1598001623'
cardColor: '#FFFF00'
aliasColor: '#FCD5B4'
clientRef: 'W76QD583YA'
reference: '1955889XBE'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ мод. год 19.5 ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ СЕРЕБРИСТАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest 83 YA'
picture2: 'armrest side 83 YA'
picture3: 'cover 83 YA'
picture4: 'extra 83 YA'
}
ListElement {
kanbanIndex: 15
sebango: '84 YA'
kanban: '1598001624'
cardColor: '#0070C0'
aliasColor: '#FCD5B4'
clientRef: 'W76QD584YA'
reference: '1956911XBE'
count: 5
project: 'DP 4B45X'
alias: 'ПЕРЕДНЯЯ мод. год 19.5 ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ СЕРЕБРИСТАЯ НАКЛАДКА'
company: 'Faurecia:'
blocked: false
picture1: 'armrest 84 YA'
picture2: 'armrest side 84 YA'
picture3: 'cover 84 YA'
picture4: 'extra 84 YA'
}
ListElement {
kanbanIndex: 16
sebango: '95 YA'
kanban: '1598001625'
cardColor: '#0070C0'
aliasColor: '#FABF8F'
clientRef: 'W76RA995YA'
reference: '1956949XBE'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ мод. год 19.5 ДВЕРНАЯ ПАНЕЛЬ ЛЕВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest 95 YA'
picture2: 'armrest side 95 YA'
picture3: 'cover 95 YA'
picture4: 'extra 95 YA'
}
ListElement {
kanbanIndex: 17
sebango: '96 YA'
kanban: '1598001626'
cardColor: '#FFFF00'
aliasColor: '#FABF8F'
clientRef: 'W76RA996YA'
reference: '1956951XBE'
count: 5
project: 'DP 4B45X'
alias: 'ЗАДНЯЯ мод. год 19.5 ДВЕРНАЯ ПАНЕЛЬ ПРАВАЯ  ХРОМИРОВАННАЯ РУЧКА КОЖАННОЕ ПОКРЫТИЕ'
company: 'Faurecia:'
blocked: false
picture1: 'armrest 96 YA'
picture2: 'armrest side 96 YA'
picture3: 'cover 96 YA'
picture4: 'extra 96 YA'
}
}
