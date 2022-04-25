import QtQuick
import "../component"

Column {
    id: root
    property int speed: 0
    width: parent.width
    height: parent.height
    topPadding: 56
    rightPadding: 20
    leftPadding: 20
    bottomPadding: 41
    Rectangle {
        anchors.fill: parent
        color: "#2B2B2B"
        Column {
            id: idContainer
            spacing: 10
            anchors.centerIn: parent
            SGLabel {
                text: "Add Address to Wallet"
            }
            SGLabel {
                text: "Create Address in Wallet"
            }
            SGLabel {
                text: "Drag and Drop Files"
            }
        }
    }
}
