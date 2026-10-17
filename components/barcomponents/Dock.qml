import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "dockcomponents"

//this clipping rectangle is very important without it the text would apear as soon as you hover it
//and then for the duration of the animation it would exist partially outside the bounds of the rectangle
ClippingRectangle {
    id: rect

    anchors.top: parent.top
    anchors.topMargin: 10
    anchors.horizontalCenter: parent.horizontalCenter
    //hear we want the height to change if it's being hovered over
    implicitWidth: 500
    radius: 45 / 2
    border.width: 2
    border.color: "#D6296B"
    color: "#1A0713"
    state: hoverometer.dockheight
    states: [
        State {
            name: "state1"

            PropertyChanges {
                target: rect
                implicitHeight: 50
                implicitWidth: 500
            }

        },
        State {
            name: "state2"

            PropertyChanges {
                target: rect
                implicitHeight: 150
                implicitWidth: 500
            }
        },
    ]

    MouseArea {
        id: hoverometer

        property string dockheight: containsMouse ? "state2" : "state1"

        anchors.fill: parent
        hoverEnabled: true 
    }

    Clock {
    }

    HardStat {
    }

    //this is to animate the change in height
    Behavior on implicitHeight {
        NumberAnimation {
            duration: 250
            easing.type: Easing.InOutQuad
        }

    }

}
