import QtQuick
import QtQuick.Controls


MenuItem {
    id: idMenuItem
    text: qsTr("Solana GUI")
    contentItem: Text {
        text: idMenuItem.text
        font: idMenuItem.font
        opacity: enabled ? 1.0 : 0.3
        color: idMenuItem.down ? "#4B6EAF" : "white"
        elide: Text.ElideRight
        anchors.leftMargin: 10
    }
    background: Rectangle {
        width: parent.width
        height: parent.height
        opacity: enabled ? 1 : 0.3
        color: idMenuItem.hovered ? "#43698D" : "#3C3F41"
    }
}
