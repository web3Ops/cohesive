import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: main
    flags: Qt.FramelessWindowHint
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Solana GUI")

    Rectangle {
        width: parent.width
        height: 25
        color: "#2d2d2d"
        Rectangle {
            width: parent.width / 2
            height: parent.height
            anchors.left: parent.left
            color: parent.color
            Row {
                id: menubar
                anchors.fill: parent
                spacing: 5
                Text {
                    text: "File"
                    color: "white"
                }
                Text {
                     text: "Edit"
                     color: "white"

                }
            }
        }
        Rectangle {
            width: 120
            height: parent.height
            anchors.right: parent.right
            color: parent.color
        }


    }

}