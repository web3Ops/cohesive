import QtQuick
import "window"
import module.help

QtObject {
    id: root

    property var idMainWindow: SGMain {
        id: idMainWindow
    }

    property var splashWindow: SGSplash {
        onTimeout: idMainWindow.visible = true
    }
}
