import QtQuick
import QtQuick.Controls

ItemDelegate {
    id: control
    text: qsTr("ItemDelegate")

    // qmllint disable deferred-property-id
    contentItem: Text {
        id: text
        rightPadding: control.spacing
        text: control.text
        font: control.font
        color: "#BBB"
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: text.height
        opacity: enabled ? 1 : 0.3
        color: control.hovered ? "#4B6EAF" : "#3C3F41"
    }
}
