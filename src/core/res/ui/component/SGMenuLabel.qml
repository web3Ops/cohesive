import QtQuick

Text {
    id: root
    text: qsTr("Solana GUI")
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    signal clicked
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            root.clicked()
        }
    }
}
