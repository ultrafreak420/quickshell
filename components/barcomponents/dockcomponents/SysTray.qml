import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Rectangle {
    id: sysTray

    anchors.top: parent.top
    anchors.topMargin: 65
    anchors.horizontalCenter: parent.horizontalCenter
    width: row.width + 20
    height: row.height + 20
    radius: height / 2
    color: "#1A0713"
    border.width: 2
    border.color: "#D6296B"

    RowLayout {
        id: row

        anchors.centerIn: parent
        anchors.margins: 10
        spacing: 10

        Repeater {
            id: trayIcons

            model: SystemTray.items

            Image {
                source: modelData.icon
                sourceSize.width: 20
                sourceSize.height: 20
            }

        }

    }

}
