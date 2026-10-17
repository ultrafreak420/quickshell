import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Rectangle {
    id: traymenuarea

    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: 10
    anchors.rightMargin: 75
    implicitWidth: 150
    implicitHeight: 45
    radius: sysTray.height / 2
    color: "#1A0713"
    border.width: 2
    border.color: "#D6296B"

    Rectangle {
        id: sysTray

        anchors.centerIn: parent
        width: row.width + 20
        height: row.height + 10
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

                anchors.centerIn: parent
                model: SystemTray.items

                Rectangle {
                    color: "transparent"
                    implicitHeight: img.sourceSize.height
                    implicitWidth: img.sourceSize.width

                    Image {
                        id: img

                        source: modelData.icon
                        sourceSize.width: 20
                        sourceSize.height: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: modelData.display(bar,1700,60) 
                    }

                }

            }

        }

    }

}
