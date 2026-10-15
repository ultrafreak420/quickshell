import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "dockcomponents"

ClippingRectangle {
    /*this is the button that toggles the state of the widget
    *it is a rectangle with a mouse area that changes the state of the widget when clicked
    */

    id: calculatorWidget

    anchors.right: parent.right
    anchors.rightMargin: -10
    implicitHeight: 650
    radius: 15
    border.width: 2
    border.color: "#D6296B"
    color: "#1A0713"
    state: "state1"
    states: [
        State {
            name: "state1"

            PropertyChanges {
                target: calculatorWidget
                implicitWidth: 60
            }

        },
        State {
            name: "state2"

            PropertyChanges {
                target: calculatorWidget
                implicitWidth: 475
            }

        }
    ]

    /* this is the content of the widget that is shown when the widget is expanded the clipping
     * rectangle is the space for the buttons and the rectangle is the space for
     * the text of the calculator
     */
    ClippingRectangle {
        id: content

        anchors.fill: parent
        anchors.topMargin: -2
        anchors.rightMargin: -2
        anchors.leftMargin: 50
        anchors.bottomMargin: -2
        border.width: 2
        border.color: '#d3296a'
        color: '#701943'

        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            height: 100
            color: '#751e31'
            border.color: '#c60f6a'
            border.width: 2

            Text {
                id: txt

                property string label

                text: label
                color: '#251b21'
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 125
            anchors.leftMargin: 10
            radius: height / 2

            Text {
                text: "1"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "1"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 125
            anchors.leftMargin: 90
            radius: height / 2

            Text {
                text: "2"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "2"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 125
            anchors.leftMargin: 170
            radius: height / 2

            Text {
                text: "3"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "3"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 205
            anchors.leftMargin: 10
            radius: height / 2

            Text {
                text: "4"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "4"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 205
            anchors.leftMargin: 90
            radius: height / 2

            Text {
                text: "5"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "5"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 205
            anchors.leftMargin: 170
            radius: height / 2

            Text {
                text: "6"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "6"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 285
            anchors.leftMargin: 10
            radius: height / 2

            Text {
                text: "7"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "7"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 285
            anchors.leftMargin: 90
            radius: height / 2

            Text {
                text: "8"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "8"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 285
            anchors.leftMargin: 170
            radius: height / 2

            Text {
                text: "9"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "9"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 365
            anchors.leftMargin: 10
            radius: height / 2

            Text {
                text: "."
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "."
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 365
            anchors.leftMargin: 90
            radius: height / 2

            Text {
                text: "0"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "0"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 365
            anchors.leftMargin: 170
            radius: height / 2

            Text {
                text: "^"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "**"
            }

        }

        Rectangle {
            id: clear

            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 50
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 125
            anchors.leftMargin: 280
            radius: height / 2

            Text {
                text: "C"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = ""
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 60
            height: 60
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 205
            anchors.leftMargin: 325
            radius: height / 2

            Text {
                text: "+"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "+"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 60
            height: 60
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 205
            anchors.leftMargin: 265
            radius: height / 2

            Text {
                text: "-"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "-"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 60
            height: 60
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 265
            anchors.leftMargin: 265
            radius: height / 2

            Text {
                text: "/"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "/"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 60
            height: 60
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 265
            anchors.leftMargin: 325
            radius: height / 2

            Text {
                text: "*"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "*"
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 60
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 360
            anchors.leftMargin: 280
            radius: height / 2

            Text {
                text: "="
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                function equals() {
                    try {
                        txt.label = eval(txt.label);
                    } catch (error) {
                        txt.label = "ERROR";
                    }
                }

                enabled: true
                anchors.fill: parent
                onClicked: equals()
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 465
            anchors.leftMargin: 50
            radius: height / 2

            Text {
                text: "("
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + "("
            }

        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 80
            height: 80
            color: '#3c0b1f'
            border.color: '#c02989'
            border.width: 2
            anchors.topMargin: 465
            anchors.leftMargin: 130
            radius: height / 2

            Text {
                text: ")"
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
                color: '#b41f8f'
            }

            MouseArea {
                enabled: true
                anchors.fill: parent
                onClicked: txt.label = txt.label + ")"
            }

        }

    }

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height / 2 - 32
        anchors.leftMargin: 10
        implicitWidth: 30
        implicitHeight: text.height + 10
        radius: height / 2
        color: "#1A0713"
        border.width: 2
        border.color: "#D6296B"

        Text {
            id: text

            anchors.centerIn: parent
            text: "C\nA\nL\nC"
            font.bold: true
            color: "#D6296B"
        }

        MouseArea {
            anchors.fill: parent
            enabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (calculatorWidget.state == "state1")
                    calculatorWidget.state = "state2";
                else
                    calculatorWidget.state = "state1";
            }
        }

    }

    transitions: Transition {
        NumberAnimation {
            properties: "implicitWidth"
            easing.type: Easing.InBack
            duration: 450
        }

    }

}
