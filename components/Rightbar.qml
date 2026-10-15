import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "barcomponents"

//everythings in a scope so that the children propogate properly
Scope {
    //this panel is purely cosmetic nothing actually depends on this it's just to give the rest of the objects in the bar space visually,
    //and a blurred background
    PanelWindow {
        id: bar

        implicitWidth: 60
        color: "transparent"

        anchors {
            top: true
            right: true
            bottom: true
        }

        BackgroundEffect.blurRegion: Region {
            item: bar.contentItem
        }

    }

    Overlay {
        ColumnLayout {
            id: column

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            spacing: 10

            Item {
                Layout.fillHeight: true
            }

            Calculator {
            }

            Item {
                Layout.fillHeight: true
            }

        }

        Notification {
            id: notify
        }

        //this mask is so that the overlay doesn't obstruct the rest of the windows behind it
        mask: Region {
            item: column
            intersection: Intersection.Intersect
        }

    }

}
