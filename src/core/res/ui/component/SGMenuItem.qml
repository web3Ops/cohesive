import QtQuick
import QtQuick.Controls

MenuItem {
    id: idMenuItem
    text: qsTr("Solana GUI")
    contentItem: Text {
        text: idMenuItem.text
        font: idMenuItem.font
        opacity: enabled ? 1.0 : 0.3
        color: idMenuItem.down ? "#17a81a" : "white"
        elide: Text.ElideRight
        anchors.leftMargin: 10
    }
}
