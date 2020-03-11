import QtQuick 2.0

Text {
    textFormat: Text.RichText
    font.pointSize: 14
    wrapMode: Text.Wrap
    function printCard(cardColor,aliasColor,company,kanban,clientRef,reference,sebango,m_alias,count,project){ return "<html>
            <div>
            <table width = 500  border= 1 cellspacing= 2 cellpadding=1 bgcolor= '"+cardColor+"'>
            <tbody>
            <tr>
            <td  colspan='2' rowspan='2'>
            <h2 valign= 'middle' align= 'center'>"+kanban+"</h2>
            </td>
            <td>"+company+"</td>
            <td>"+kanban+"</td>
            </tr>
            <tr>
            <td align= 'center' colspan='2'>"+clientRef+"/"+reference+"</td>
            </tr>
            <tr>
            <td colspan='2'>
            <h1 valign= 'middle' align= 'center'>"+sebango+"</h1>
            </td>
            <td colspan='2' rowspan='3' align= 'center' bgcolor= "+aliasColor+">"+m_alias+"</td>
            </tr>
            <tr>
            <td align= 'center'>колво_деталей</td>
            <td align= 'center'>линия</td>
            </tr>
            <tr>
            <td align= 'center'>"+count+"</td>
            <td align= 'center'>"+project+"</td>
            </tr>
            </tbody>
            </table>
            </div>
            </html>"
        }
}
