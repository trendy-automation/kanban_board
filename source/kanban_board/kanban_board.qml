import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import org.qtproject.example 1.0
import QtQml 2.14
import "kanban_board/content"



ApplicationWindow {
    id: window
    //width: kanbanCard.width
    width: 600
    height: 600
    visible: true
    title: qsTr("Электронная доска канбан")
    visibility: isDebug ? "Windowed" : "FullScreen"

    property string datastore: ""
    property bool settingsReading: false
    ListView {
        id: listView
        anchors.fill: parent
        ButtonGroup {
            buttons: listView.contentItem.children
        }
        delegate: SwipeDelegate {
            id: delegate
            checkable: true
            checked: swipe.complete
            onCheckedChanged: {
                if (!checked) {
                    undoTimer.stop()
                    swipe.close()
                    //model.blocked=false
                }
            }
            //text: model.alias
//            Text {
//                text: alias
//                font.bold: true; font.pointSize: 10
//            }
            width: parent.width
            //width: kanbanCard.width
            height: kanbanCard.height+30
            contentItem:
                    Item {
                        id: kanban

                        // Create a property to contain the visibility of the details.
                        // We can bind multiple element's opacity to this one property,
                        // rather than having a "PropertyChanges" line for each element we
                        // want to fade.
                        property real detailsOpacity : 0
            //! [0]
                        width: listView.width
                        //width: kanbanCard.width
                        //height: kanbanCard.height

                        // A simple rounded rectangle for the background
                        //mycolor


                        Rectangle {
                            id: background
                            x: 2; y: 2; width: parent.width - x*2; height: kanbanCard.height+10-y*2
                            //height: parent.height - y*2
                            color: "ivory"
                            border.color: "black"
                            radius: 5
                        }

                        // This mouse region covers the entire delegate.
                        // When clicked it changes mode to 'Details'.  If we are already
                        // in Details mode, then no change will happen.
            //! [1]

                        // Lay out the page: picture, title and ingredients at the top, and method at the
                        // bottom.  Note that elements that should not be visible in the list
                        // mode have their opacity set to kanban.detailsOpacity.

                        Row {
                            id: topLayout
                            x: 0; y: 5;
                            height: kanbanCard.height+20
                            //width: kanbanCard.width
                            width: parent.width
                            spacing: 10


            //! [1]

                            Column {
                                width: background.width
                                //height: kanbanCard.height
                                spacing: 5
                                Row {
                                    KanbanText {
                                        id: kanbanCard
                                        x: topLayout.x + 5
                                        //y: topLayout.y + 5
                                        //anchors.fill: parent
                                        text: printCard(model.cardColor,model.aliasColor,model.company,
                                                        model.kanban,model.clientRef,model.reference,
                                                        model.sebango,model.alias,model.count,model.project)
                                        color: model.count===kanbanCount ? "black" : "grey"
                                    }

                                    Image {
                                        id: kanbanIcon1
                                        x: topLayout.x + kanbanCard.width + 20
                                        fillMode:Image.PreserveAspectFit;
                                        height: 185
                                        source: "kanban_board/content/pics/"+picture1+".png"
                                        opacity: kanban.detailsOpacity===1 ? 0 : 1
                                    }
                                    Image {
                                        id: kanbanIcon2
                                        x: topLayout.x + kanbanCard.width + 20
                                        fillMode:Image.PreserveAspectFit;
                                        height: 185
                                        source: "kanban_board/content/pics/"+picture2+".png"
                                        opacity: kanban.detailsOpacity===1 ? 0 : 1
                                    }
                                    Image {
                                        id: kanbanIcon3
                                        x: topLayout.x + kanbanCard.width + 20
                                        fillMode:Image.PreserveAspectFit;
                                        height: 185
                                        source: "kanban_board/content/pics/"+picture3+".png"
                                        opacity: kanban.detailsOpacity===1 ? 0 : 1
                                    }
                                    Image {
                                        id: kanbanIcon4
                                        x: topLayout.x + kanbanCard.width + 20
                                        fillMode:Image.PreserveAspectFit;
                                        height: 185
                                        source: "kanban_board/content/pics/"+picture4+".png"
                                        opacity: kanban.detailsOpacity===1 ? 0 : 1
                                    }
                                }
                                Row {
                                    Image {
                                        id: kanbanImage1
                                        fillMode:Image.PreserveAspectFit;
                                        source: "kanban_board/content/pics/"+picture1+".png"
                                        opacity: kanban.detailsOpacity
                                    }
                                    Image {
                                        id: kanbanImage2
                                        fillMode:Image.PreserveAspectFit;
                                        source: "kanban_board/content/pics/"+picture2+".png"
                                        opacity: kanban.detailsOpacity
                                    }
                                }
                                Row {
                                    Image {
                                        id: kanbanImage3
                                        fillMode:Image.PreserveAspectFit;
                                        source: "kanban_board/content/pics/"+picture3+".png"
                                        opacity: kanban.detailsOpacity
                                    }
                                    Image {
                                        id: kanbanImage4
                                        fillMode:Image.PreserveAspectFit;
                                        source: "kanban_board/content/pics/"+picture4+".png"
                                        opacity: kanban.detailsOpacity
                                    }
                                }
//                                SmallText {
//                                    text: "Ingredients"
//                                    font.bold: true
//                                    opacity: kanban.detailsOpacity
//                                }

//                                SmallText {
//                                    text: ingredients
//                                    wrapMode: Text.WordWrap
//                                    width: parent.width
//                                    opacity: kanban.detailsOpacity
//                                }
                            }
                        }

            //! [2]
                        Item {
                            id: details
                            x: 10; width: parent.width - 20

                            anchors { top: topLayout.bottom; topMargin: 10; bottom: parent.bottom; bottomMargin: 10 }
                            opacity: kanban.detailsOpacity
            //! [2]
//                            SmallText {
//                                id: methodTitle
//                                anchors.top: parent.top
//                                text: ""
//                                font.pointSize: 10; font.bold: true
//                            }

//                            Flickable {
//                                id: flick
//                                width: parent.width
//                                anchors { top: methodTitle.bottom; bottom: parent.bottom }
//                                contentHeight: methodText.height
//                                clip: true

//                                Text { id: methodText; text: method; wrapMode: Text.WordWrap; width: details.width }
//                            }

//                            Image {
//                                anchors { right: flick.right; top: flick.top }
//                                source: "kanban_board/content/pics/moreUp.png"
//                                opacity: flick.atYBeginning ? 0 : 1
//                            }

//                            Image {
//                                anchors { right: flick.right; bottom: flick.bottom }
//                                source: "kanban_board/content/pics/moreDown.png"
//                                opacity: flick.atYEnd ? 0 : 1
//                            }
            //! [3]
                        }
                        QtObject {
                                id: backend
                                property string modifier
                            }
//                        ComboBox {
//                            textRole: "sebango"
//                            valueRole: "sebango"
//                            // When an item is selected, update the backend.
//                            onActivated: backend.modifier = currentValue
//                            // Set the initial currentIndex to the value stored in the backend.
//                            Component.onCompleted: currentIndex = indexOfValue(backend.modifier)
//                            model: kanbanBase
//                            opacity: kanban.detailsOpacity
//                        }

                        // A button to close the detailed view, i.e. set the state back to default ('').
                        TextButton {
                            y: 10
                            anchors { right: background.right; rightMargin: 10 }
                            opacity: kanban.detailsOpacity
                            text: "Закрыть"

                            onClicked: kanban.state = '';
                        }

                        states: State {
                            name: "Details"

                            PropertyChanges { target: background; color: "white" }
                            PropertyChanges { target: kanbanImage1; height: 400 } // Make picture bigger
                            PropertyChanges { target: kanbanImage2; height: 400 } // Make picture bigger
                            PropertyChanges { target: kanbanImage3; height: 400 } // Make picture bigger
                            PropertyChanges { target: kanbanImage4; height: 400 } // Make picture bigger
                            PropertyChanges { target: kanban; detailsOpacity: 1; x: 0 } // Make details visible
                            PropertyChanges { target: kanban; height: 100 } // Fill the entire list area with the detailed view
                            PropertyChanges { target: delegate; height: kanbanCard.height+kanbanImage1.height+20 } // Fill the entire list area with the detailed view

                            // Move the list so that this item is at the top.
//                            PropertyChanges { target: kanban.ListView.view; explicit: true; contentY: kanban.y }

                            // Disallow flicking while we're in detailed view
//                            PropertyChanges { target: kanban.ListView.view; interactive: false }
                        }

                        transitions: Transition {
                            // Make the state changes smooth
                            ParallelAnimation {
                                ColorAnimation { property: "color"; duration: 500 }
                                NumberAnimation { duration: 300; properties: "detailsOpacity,x,contentY,height,width" }
                            }
                        }
                    }
            //! [3]

            //! [delegate]
            swipe.right: Rectangle {
                width: parent.width
                height: parent.height

                clip: true
                color: SwipeDelegate.pressed ? "#555" : "#666"

                Label {
                    font.family: "Fontello"
                    text: delegate.swipe.complete ? "\ue805" // icon-cw-circled
                                                  : "\ue801" // icon-cancel-circled-1

                    padding: 20
                    anchors.fill: parent
                    horizontalAlignment: Qt.AlignRight
                    verticalAlignment: Qt.AlignVCenter

                    opacity: 2 * -delegate.swipe.position

                    color: Material.color(delegate.swipe.complete ? Material.Green : Material.Red, Material.Shade200)
                    Behavior on color { ColorAnimation { } }
                }

                Label {
                    text: qsTr("Выполнено")
                    color: "white"
                    font.pointSize: 18
                    padding: 20
                    anchors.fill: parent
                    horizontalAlignment: Qt.AlignLeft
                    verticalAlignment: Qt.AlignVCenter

                    opacity: delegate.swipe.complete ? 1 : 0
                    Behavior on opacity { NumberAnimation { } }
                }

                SwipeDelegate.onClicked: {
                    //console.log("SwipeDelegate.onClicked")
                    delegate.swipe.close()
                    undoTimer.stop()
                    //model.blocked=false
                }
                SwipeDelegate.onPressedChanged: {
                    //console.log("SwipeDelegate.onPressedChanged")
                    undoTimer.stop()
                    //model.blocked=false
                  }
            }
            //! [delegate]

            //! [removal]
            Timer {
                id: undoTimer
                interval: 1500
                onTriggered: {
                    //console.log("undoTimer.onTriggered")
                    kanbanApp.newKanbanReady(model.kanbanIndex)
                    batchModel.remove(index)
                }
            }
            swipe.onCompleted: {
                //console.log("swipe.onCompleted index="+index)
                if (model.count!==kanbanCount) {
                    deleteDialog.open()
                }
                else {
                    //model.blocked=true
                    undoTimer.start()
                }
            }
            //! [removal]
            onClicked: kanban.state = 'Details';
            Dialog {
                id: deleteDialog
                title: "Удаление задания"
                //standardButtons: StandardButton.Yes | StandardButton.No
                contentItem: Rectangle {
                    color: "lightskyblue"
                    implicitWidth: 400
                    implicitHeight: 100
                    Label {
                        text: "Удалить неполное задание?"
                        color: "navy"
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignTop
                        anchors {
//                            centerIn: parent
//                            //top: parent.top
                            fill: parent
                            margins: 20
                        }
                        font.pixelSize: 14
                    }
                    Button {
                        id: no_Button
                        text: qsTr("Нет")
                        onClicked: deleteDialog.click(StandardButton.No)
                        visible: true //deleteDialog.standardButtons & StandardButton.No
                        anchors {
                            left: parent.left
                            //right: parent.right
                            top: parent.top
                            //bottom: parent.bottom
                            margins: 50
                        }
                        font.pixelSize: 14
                    }
                    Button {
                        id: yes_Button
                        text: qsTr("Да")
                        onClicked: deleteDialog.click(StandardButton.Yes)
                        visible: true //deleteDialog.standardButtons & StandardButton.Yes
                        anchors {
                            //left: parent.left
                            right: parent.right
                            top: parent.top
                            //bottom: parent.bottom
                            margins: 50
                        }
                        font.pixelSize: 14
                    }
                }
//                Column {
//                    anchors.fill: parent
//                    Text {
//                       text: "Удалить неполное задание?"
//                       color: "navy"
//                    }
//                }
                onYes: {
                    console.log("KanbanItem " + batchModel.get(index).kanban + " deleted")
                    batchModel.remove(index)
                }
                onNo: {
                    delegate.swipe.close()
                }
            }
        }
        SortFilterProxyModel {
            id: proxyStockModel
            source: proxyPosStockModel.count > 0 ? proxyPosStockModel : null

            sortOrder: Qt.AscendingOrder
            sortCaseSensitivity: Qt.CaseInsensitive
            sortRole: proxyPosStockModel.count > 0 ? "dateTime" : ""

            filterRole: "count"
            filterString: "([5-9]$|\\d{2,}$)" //  "([" + kanbanCount-1 + "-9]$|\\d{2,}$)"
            filterSyntax: SortFilterProxyModel.RegExp
            filterCaseSensitivity: Qt.CaseInsensitive
            function countParts() {
                    console.log("countParts")
                    var count = 0
                    for(var i = 0; i < proxyStockModel.count; ++i){
                        console.log("countParts " + parseInt(proxyStockModel.get(i).count))
                        count=count+parseInt(proxyStockModel.get(i).count)
                    }
                    console.log("countParts " + count + " proxyPosStockModel.posFilterValue " + proxyPosStockModel.posFilterValue)
                    return count
                }
            }
        SortFilterProxyModel {
            id: proxyPosStockModel
            property int posFilterValue: 1
            source: stockModel.count > 0 ? stockModel : null

            filterRole: "pos"
            filterString: posFilterValue
            filterSyntax: SortFilterProxyModel.FixedString
            filterCaseSensitivity: Qt.CaseInsensitive
            function setFilterValue (filterValue) {
                proxyPosStockModel.source = null
                proxyPosStockModel.posFilterValue=filterValue
                proxyPosStockModel.source = stockModel
            }
        }

        model: ListModel {
            id: batchModel
            function saveBatchModel() {
                if(!settingsReading){
                    var datamodel = []
                    for (var i = 0; i < batchModel.count; ++i)
                        datamodel.push(batchModel.get(i))
                    kanbanApp.setValue('batchModel',JSON.stringify(datamodel))
                }
            }
            function loadBatchModel() {
                batchModel.clear()
                settingsReading=true
                var datamodel = JSON.parse(kanbanApp.value('batchModel'))
                for (var i = 0; i < datamodel.length; ++i)
                    batchModel.append(datamodel[i])
                settingsReading=false
            }
            onDataChanged: {
                saveBatchModel()
            }
            onRowsRemoved: {
                saveBatchModel()
            }
            onRowsInserted: {
                saveBatchModel()
            }

        }

        //! [transitions]
        remove: Transition {
            SequentialAnimation {
                PauseAnimation { duration: 125 }
                NumberAnimation { property: "height"; to: 0; easing.type: Easing.InOutQuad }
            }
        }

        displaced: Transition {
            SequentialAnimation {
                PauseAnimation { duration: 125 }
                NumberAnimation { property: "y"; easing.type: Easing.InOutQuad }
            }
        }
        //! [transitions]

        ScrollIndicator.vertical: ScrollIndicator { }
    }


    Label {
        id: placeholder
        text: qsTr("Нет задания на комплектовку тележек")

        anchors.margins: 60
        anchors.fill: parent

        opacity: 0.5
        visible: listView.count === 0

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        wrapMode: Label.WordWrap
        font.pixelSize: 18
    }

    KanbanList {
        id:kanbanBase
        function at(kanbanIndex) {
          for(var i = 0; i < kanbanBase.count; ++i)
              if (kanbanBase.get(i).kanbanIndex===kanbanIndex)
                  return kanbanBase.get(i)
          console.log("kanban not found " +kanbanIndex)
          return null;
        }
        function indexOf(someInfo) {
            for(var i = 0; i < kanbanBase.count; ++i)
                if (kanbanBase.get(i).clientRef===someInfo)
                    return kanbanBase.get(i)
            for(var i = 0; i < kanbanBase.count; ++i)
                if (kanbanBase.get(i).reference===someInfo)
                    return kanbanBase.get(i)
            for(var i = 0; i < kanbanBase.count; ++i)
                if (kanbanBase.get(i).kanban===someInfo)
                    return kanbanBase.get(i)
          console.log("kanban not found " +someInfo)
          return null;
        }
    }

    Timer {
        id: checkBatchTimer
        interval: 1000
        onTriggered: {
            stockModel.checkBatch()
        }
    }

    StockList {
                id: stockModel
                function addKanban(kanbanItem,id) {
                    if(kanbanItem){
                        for(var i = 0; i < stockModel.count; ++i)
                            if (stockModel.get(i).kanban===kanbanItem.kanban){
                                //if (stockModel.get(i).count<kanbanCount){
                                //    if (!stockModel.get(i).blocked) {
                                        stockModel.get(i).count=stockModel.get(i).count+1
                                        if(!settingsReading || stockModel.get(i).dateTime==='')
                                            stockModel.get(i).dateTime = Qt.formatDateTime(new Date(), "yy.MM.dd hh:mm:ss")
                                        console.log("kanban " + stockModel.get(i).kanban + " add 1 part")
                                        //checkBatch()
                                        checkBatchTimer.start()
                                        return
                                //    } else
                                //        console.log("kanban " + stockModel.get(i).kanban + " blocked")
                                //}
                            }

                        kanbanItem.count=1
                        //kanbanItem.blocked=false
                        if(!settingsReading || kanbanItem.dateTime==='')
                            kanbanItem.dateTime = Qt.formatDateTime(new Date(), "yy.MM.dd hh:mm:ss")
                        //console.log('kanbanItem'+JSON.stringify(kanbanItem))
                        stockModel.append(kanbanItem)
                        console.log("kanbanItem " + id + " appended")
                    } else
                        console.log("wrong kanban " + id)
                }
                function checkBatch() {
                    console.log("checkBatch")
                    //proxyPosStockModel.setFilterValue(0)
                    //proxyPosStockModel.setFilterValue(1)
                    //proxyPosStockModel.source = null
                    proxyPosStockModel.posFilterValue=1
                    //proxyPosStockModel.source = stockModel
                    if (proxyStockModel.countParts()>=(kanbanCount*6)){
                        //proxyPosStockModel.source = null
                        //proxyPosStockModel.posFilterValue=2
                        //proxyPosStockModel.source = stockModel
                        proxyPosStockModel.setFilterValue(2)
                        if (proxyStockModel.countParts()>=(kanbanCount*6))
                            //{console.log(0)}
                            createBatch(1)
                    }
                    //proxyPosStockModel.source = null
                    //proxyPosStockModel.posFilterValue=3
                    //proxyPosStockModel.source = stockModel
                    proxyPosStockModel.setFilterValue(3)
                    console.log()
                    if (proxyStockModel.countParts()>=(kanbanCount*6)){
                        //proxyPosStockModel.source = null
                        //proxyPosStockModel.posFilterValue=4
                        //proxyPosStockModel.source = stockModel
                        proxyPosStockModel.setFilterValue(4)
                        if (proxyStockModel.countParts()>=(kanbanCount*6))
                            //{console.log(2)}
                            createBatch(3)
                    }
                }

                function createBatch(pos0) {
                    console.log("createBatch " + pos0)
                    for(var i = 0; i < 12; ++i){
                        proxyPosStockModel.setFilterValue(pos0 + i % 2)
                        console.log("filterValue=" + proxyPosStockModel.posFilterValue)
                        console.log("proxyStockModel.countParts()=" + proxyStockModel.countParts())
                        //proxyPosStockModel.posFilterValue=pos0 + i % 2
                        if(proxyStockModel.count>0){
                            var kanbanItem = proxyStockModel.get(0)
                            console.log("kanbanItem " + kanbanItem.pos + " " +
                                         kanbanItem.kanban + " " +
                                         kanbanItem.dateTime)
                            for(var j = 0; j < stockModel.count; ++j){
                                if (kanbanItem.kanban===stockModel.get(j).kanban &&
                                    kanbanItem.dateTime===stockModel.get(j).dateTime){
                                    stockModel.get(j).count=kanbanItem.count-kanbanCount
                                }
                            }
                            kanbanItem.count=kanbanCount
                            batchModel.append(kanbanItem)
                        } else console.log("kanbanItem not fount in proxyStockModel pos=" + proxyPosStockModel.posFilterValue)
                    }
                }

                function countKanban(kanban) {
                        var count = 0
                        for(var i = 0; i < stockModel.count; ++i)
                            if (stockModel.get(i).kanban===kanban)
                                count=count+stockModel.get(i).count
                        return count
                }

                function saveStockModel() {
                    if(!settingsReading){
                        //var datamodel = []
                        for (var i = 0; i < kanbanBase.count; ++i){
                            //datamodel.push(stockModel.get(i))
                            //datamodel.push({kanban:kanbanBase.get(i).kanban,count: stockModel.countKanban(kanbanBase.get(i).kanban)})
                            kanbanApp.setValue('item'+i,JSON.stringify({kanban:  kanbanBase.get(i).kanban,
                                                                        dateTime: kanbanBase.get(i).dateTime,
                                                                        sebango: kanbanBase.get(i).sebango,
                                                                        pos: kanbanBase.get(i).pos,
                                                                        count:   stockModel.countKanban(kanbanBase.get(i).kanban)}))
                        }
                        //datastore = JSON.stringify(datamodel)
                        //kanbanApp.setValue('shopstock',datastore)
                    }
                }

                function loadStockModel() {
                    stockModel.clear()
                    settingsReading=true
                    var i = 0
                    while (kanbanApp.value('item'+i)!=='{}'){
                        var item = JSON.parse(kanbanApp.value('item'+i))
                        for (var j = 0; j < item.count; ++j)
                            stockModel.addKanban(kanbanBase.indexOf(item.kanban.toString().trim()),item.kanban)
                        ++i
                    }
                    settingsReading=false
                }

                onDataChanged: {
                    saveStockModel()
                }
                onRowsRemoved: {
                    saveStockModel()
                }
                onRowsInserted: {
                    saveStockModel()
                }

    }

    Connections {
        target: kanbanApp
        onKanbanProduced: {
            //console.log("App data " + kanbanIndex + " recived")
            stockModel.addKanban(kanbanBase.at(kanbanIndex),kanbanIndex)
        }
    }
    Connections {
        target: plcPartner
        onDataReceived: {
            //console.log("PLC data " + data + " recived")
            stockModel.addKanban(kanbanBase.indexOf(data.toString().trim()),data)
        }
    }
    Connections {
        target: udpReceiver
        onDataReceived: {
            //console.log("PLC data " + data + " recived")
            stockModel.addKanban(kanbanBase.indexOf(data.toString().trim()),data)
        }
    }


    Component.onCompleted: {
        stockModel.loadStockModel()
        batchModel.loadBatchModel()
        stockModel.saveStockModel()
    }



    Settings {
      property alias datastore: window.datastore
    }

//    onClosing: {
//        console.log("onClosing")
//    }
}


