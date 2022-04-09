import QtQuick

Rectangle {
    id: idDocArea
    property int speed: 0
    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: idDocArea
            property: "speed"
            to: 145
            easing.type: Easing.InOutQuad
            duration: 4000
        }
        NumberAnimation {
            target: idDocArea
            property: "speed"
            to: 10
            easing.type: Easing.InOutQuad
            duration: 2000
        }
    }
    Loader {
        id: idDocLoader

        anchors.fill: parent

        onLoaded: {
            binder.target = idDocLoader.item
        }
    }
    Binding {
        id: binder
        property: "speed"
        value: idDocArea.speed
    }
    state: "explorer"

    states: [
        State {
            name: "explorer"
            PropertyChanges {
                target: idDocLoader
                source: "SGExplorer.qml"
            }
        },
        State {
            name: "workspace"
            PropertyChanges {
                target: idDocLoader
                source: "SGWorkspace.qml"
            }
        }
    ]
}
