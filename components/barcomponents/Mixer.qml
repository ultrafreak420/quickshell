import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "dockcomponents"

ClippingRectangle {
	id: floating
	anchors.left: parent.left
	anchors.leftMargin: -10
	implicitHeight: 250
	radius: 15
	border.width: 2
	border.color: "#D6296B" 
	color: "#1A0713"

	state: "state1"

	states: [ 
		State {
			name: "state1"
			PropertyChanges { target: floating; implicitWidth: 60}
		},
		State {
			name: "state2"
			PropertyChanges { target: floating; implicitWidth: 1110}
		}
	]
	transitions: Transition {
		NumberAnimation { properties: "implicitWidth"; easing.type: Easing.InBack; duration: 450 }
	}
	
	ClippingRectangle {
		id:scroll
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.topMargin: -2
		anchors.rightMargin: 50
		anchors.leftMargin: -2
		anchors.bottomMargin: -2
		border.width: 2
		border.color: "#D6296B"
		color: "#330917"
		Rectangle {
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.rightMargin: -2
			anchors.topMargin: -2
			implicitHeight: 90
			border.width: 2
			border.color: "#D6296B"
			color: "#4D2835"
			MixerEntry {
				anchors.fill: parent
				anchors.topMargin: 10
				anchors.leftMargin: 15
				anchors.bottomMargin: 10
				anchors.rightMargin: 20
					node: Pipewire.defaultAudioSink		
				}
		}
		ScrollView {				
			anchors.fill: parent
			anchors.topMargin: 90
			contentWidth: availableWidth
			// get a list of nodes that output to the default sink
					ColumnLayout {
						anchors.fill: parent
						spacing: 2
						anchors.top: parent.top
						anchors.bottom: parent.bottom
						anchors.right: parent.right
						anchors.left: parent.left
						anchors.topMargin: 20
						//anchors.bottomMargin: 70
						anchors.rightMargin: 20
						anchors.leftMargin: 20

				PwNodeLinkTracker {		
					id: linkTracker				
					node: Pipewire.defaultAudioSink
				}
				Repeater {			
					model: linkTracker.linkGroups
					MixerEntry {			
						required property PwLinkGroup modelData			
						// Each link group contains a source and a target.
						// Since the target is the default sink, we want the source.
						node: modelData.source
					}
				}
				Item { Layout.preferredHeight: 45 }
			}
		}
	}
	Rectangle {
		anchors.top: parent.top
		anchors.right: parent.right
		anchors.topMargin: floating.height / 2 -32
		anchors.rightMargin: 10
		implicitWidth: 30
		implicitHeight: 65
		radius: height / 2
		color: "#1A0713"
		border.width: 2
		border.color: "#D6296B"
		Text {
			anchors.centerIn: parent
			text: "V\nO\n L"
			font.bold: true
			color: "#D6296B"
		}
		MouseArea {
			anchors.fill: parent
			enabled: true
			cursorShape: Qt.PointingHandCursor
			onClicked: if (floating.state == "state1") 
			floating.state = "state2"
			else floating.state = "state1"
		}
	}
}

