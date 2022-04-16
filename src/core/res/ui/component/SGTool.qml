import QtQuick

Rectangle {
    id: root
    width: parent.height
    height: parent.height - 4
    anchors.verticalCenter: parent.verticalCenter
    color: !idTool.hovered ? "#3C3F41" : "#515151"
    radius: 3
    property alias source: idIcon.source
    signal clicked
    Image {
        id: idIcon
        source: ""
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MouseArea {
        id: idTool
        width: parent.width
        height: parent.height
        hoverEnabled: true
        property bool hovered: false
        onEntered: hovered = true
        onExited: hovered = false
        onClicked: root.clicked()
    }
}
