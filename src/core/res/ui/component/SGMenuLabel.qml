import QtQuick


Rectangle {
	id: root
    property alias text: label.text
	signal clicked
	height: parent.height
	width: label.width + 10
	state: "default"
	states: [
        State {
            name: "clicked"
            PropertyChanges { target: root; color: "#43698D" }
        },
        State {
            name: "default"
            PropertyChanges { target: root; color: "#3C3F41" }
        }
    ]
	Text {
        id: label
        text: qsTr("Solana GUI")
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            root.state = (root.state == "default" ? "clicked" : "default")
            root.clicked()
        }
    }
}

