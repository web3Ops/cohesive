SGMenuLabel {
    id: idMenuLabel
    text: qsTr("Label")
    default property alias children: idMenu.contentData
    onClicked: {
        idMenu.open();
    }
    SGMenu {
        id: idMenu
        onClosed: {
            idMenuLabel.state = "default";
        }
    }
}
