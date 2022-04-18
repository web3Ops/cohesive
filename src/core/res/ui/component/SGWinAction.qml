import QtQuick

Rectangle {
    id: idWinAction
    width: 40
    height: parent.height
    property alias src: idIcon.source
    signal clicked
    property alias hovered: idMouseArea.hovered
    Image {
        id: idIcon
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MouseArea {
        id: idMouseArea
        width: parent.width
        height: parent.height
        hoverEnabled: true
        property bool hovered: false
        onEntered: hovered = true
        onExited: hovered = false
        onClicked: idWinAction.clicked()
    }
}
