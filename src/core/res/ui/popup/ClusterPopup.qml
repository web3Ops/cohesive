import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    anchors.centerIn: Overlay.overlay
    width: 500
    height: 150
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 200
        color: "#3C3F41"
        border.width: 2
        border.color: Qt.lighter(color)
    }
    padding: 10
    ColumnLayout {
        spacing: 2
        Text {
            text: qsTr("Choose network")
            color: "white"
        }
    }
}
