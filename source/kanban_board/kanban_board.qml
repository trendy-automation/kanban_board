import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
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
                    model.blocked=false
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
                        ComboBox {
                            textRole: "sebango"
                            valueRole: "sebango"
                            // When an item is selected, update the backend.
                            onActivated: backend.modifier = currentValue
                            // Set the initial currentIndex to the value stored in the backend.
                            Component.onCompleted: currentIndex = indexOfValue(backend.modifier)
                            model: kanbanBase
                            opacity: kanban.detailsOpacity
                            //filterRoleName: textRole
                            //filterPattern: model.sebango
                            //filterCaseSensitivity: Qt.CaseInsensitive
                        }

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
                    model.blocked=false
                }
                SwipeDelegate.onPressedChanged: {
                    //console.log("SwipeDelegate.onPressedChanged")
                    undoTimer.stop()
                    model.blocked=false
                  }
            }
            //! [delegate]

            //! [removal]
            Timer {
                id: undoTimer
                interval: 3600
                onTriggered: {
                    //console.log("undoTimer.onTriggered")
                    kanbanApp.newKanbanReady(model.kanbanIndex)
                    kanbanModel.remove(index)
                }
            }
            swipe.onCompleted: {
                //console.log("swipe.onCompleted index="+index)
                if (model.count!==kanbanCount) {
                    deleteDialog.open()
                }
                else {
                    model.blocked=true
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
                    console.log("KanbanItem " + kanbanModel.get(index).kanban + " deleted")
                    kanbanModel.remove(index)
                }
                onNo: {
                    delegate.swipe.close()
                }
            }
        }

        model: ListModel {
            id: kanbanModel
            function addKanban(kanbanItem,id) {
                if(kanbanItem){
                    for(var i = 0; i < kanbanModel.count; ++i)
                        if (kanbanModel.get(i).kanban===kanbanItem.kanban)
                            if (kanbanModel.get(i).count<kanbanCount){
                                if (!kanbanModel.get(i).blocked) {
                                    kanbanModel.get(i).count=kanbanModel.get(i).count+1
                                    console.log("kanban " + kanbanModel.get(i).kanban + " add 1 part")
                                    return
                                } else
                                    console.log("kanban " + kanbanModel.get(i).kanban + " blocked")
                            }
                    kanbanItem.count=1
                    kanbanItem.blocked=false
                    kanbanModel.append(kanbanItem)
                    console.log("kanbanItem " + id + " appended")
                } else
                    console.log("wrong kanban " + id)
            }
            onDataChanged: {
                //console.log("onDataChanged")
                saveModel()
            }
            onRowsRemoved: {
                //console.log("onRowsRemoved")
                saveModel()
            }
            onRowsInserted: {
                //console.log("onRowsInserted")
                saveModel()
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
          return null;
        }
    }
    Connections {
        target: kanbanApp
        onKanbanProduced: {
            //console.log("App data " + kanbanIndex + " recived")
            kanbanModel.addKanban(kanbanBase.at(kanbanIndex),kanbanIndex)
        }
    }
    Connections {
        target: plcPartner
        onDataReceived: {
            //console.log("PLC data " + data + " recived")
            kanbanModel.addKanban(kanbanBase.indexOf(data.toString().trim()),data)
        }
    }
    Connections {
        target: udpReceiver
        onDataReceived: {
            //console.log("PLC data " + data + " recived")
            kanbanModel.addKanban(kanbanBase.indexOf(data.toString().trim()),data)
        }
    }


    Component.onCompleted: {
        if (datastore) {
            kanbanModel.clear()
            settingsReading=true
            var datamodel = JSON.parse(datastore)
            for (var i = 0; i < datamodel.length; ++i)
                kanbanModel.append(datamodel[i])
            settingsReading=false
        }
    }

    Settings {
      property alias datastore: window.datastore
    }
    function saveModel() {
        if(!settingsReading){
            var datamodel = []
                for (var i = 0; i < kanbanModel.count; ++i) datamodel.push(kanbanModel.get(i))
                    datastore = JSON.stringify(datamodel)
        }
    }

//    onClosing: {
//        console.log("onClosing")
//    }
}


