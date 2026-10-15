import QtQuick
import QtQml
import Quickshell.Wayland
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Widgets
import "dockcomponents"

ClippingRectangle {	
	id: anchored
	anchors.left: parent.left
	anchors.leftMargin: -10
	implicitHeight: 500
	radius: 15
	border.width: 2
	border.color: "#D6296B" 
	color: "#1A0713"

	ListModel { id: history }

	NotificationServer {
		id: server
		actionsSupported: true
		bodySupported: true
		imageSupported: true
		keepOnReload: false

		onNotification: n => { history.insert(0, {
			summary: n.summary,
			body: n.body,
			appName: n.appName,
			urgency: n.urgency,
			time: Qt.formatDateTime(new Date(), "dd/MM/yyyy\nhh:mm:ss")
		})
            }
	}

	state: "state1"

	states: [ 
		State {
			name: "state1"
			PropertyChanges { target: anchored; implicitWidth: 60}
		},
		State {
			name: "state2"
			PropertyChanges { target: anchored; implicitWidth: 600}
		}
	]	
	transitions: Transition {
		NumberAnimation { properties: "implicitWidth"; easing.type: Easing.InBack; duration: 450 }
	}
	ClippingRectangle {
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.rightMargin: 50
		anchors.topMargin: -2
		anchors.leftMargin: -2
		border.width: 2
		border.color: "#D6296B"
		color: "#330917"
		Rectangle {
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.left: parent.left
			anchors.leftMargin: -5
			anchors.topMargin: -5
			anchors.rightMargin: -5
			implicitHeight: 75
			color: "#4D2835"
			border.width: 2
			border.color: "#D6296B" //"#1A0713"
			Text {
				anchors.left: parent.left
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 50
				text: "Notification History"
				color: "#D6296B"
				font.pixelSize: 20
				font.bold: true
			}
			Text {
				anchors.right: parent.right
				anchors.verticalCenter: parent.verticalCenter
				anchors.rightMargin: 15
				text: "clear all"
				color: "#E01F2C"
				font.pixelSize: 15
				font.bold: true
				visible: history.count > 0
				MouseArea {
					anchors.fill: parent
					onClicked: history.clear()
				}
			}
		}
		ScrollView {
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.left: parent.left
			anchors.bottom: parent.bottom
			anchors.topMargin: 80
			contentWidth: availableWidth
			ColumnLayout {
				width: parent.width
				spacing: 10
				Rectangle {
					anchors.top: parent.top
					anchors.left: parent.left
					anchors.right: parent.right
			}
				Repeater {
			model: history
			delegate: Rectangle {
				id: card
				required property var modelData
				Layout.preferredWidth: parent.width -10
				Layout.preferredHeight: layout.implicitHeight + 35
				radius: 8
				color: modelData.urgency === NotificationUrgency.Critical ? "#330917" : "#1A0713"
				border.width: 2
				border.color: "#D6296B"
				
				ColumnLayout {
					id: layout
					anchors.left: parent.left
					anchors.leftMargin: 10
					anchors.top: parent.top
					anchors.topMargin: 10
						Layout.preferredWidth: parent.width -10
						spacing: 5
						Text {
							text: {modelData.time}
							color: "#D6296B"
						}
						Text {
							text: {modelData.summary}
							color: "#D6296B"
							font.pixelSize: 15
							font.bold: true
						}
						Text {
							width: column.width -35
							maximumLineCount: 1
							text: {modelData.body}
							color: "#D6296B"
							elide: Text.ElideRight
							wrapMode: Text.Wrap

						}
					}
				Rectangle {
					anchors.top: parent.top
					anchors.right: parent.right
					anchors.topMargin: 15
					anchors.rightMargin: 10
					implicitHeight: 30
					implicitWidth: 30
					border.width: 2
					border.color: "#D6296B"
					radius: height / 2
					color: "#1A0713"
					Text {
						anchors.centerIn: parent
						text: "X"
						font.bold: true
						font.pixelSize: 15
						color: "#D6296B"
					}
					MouseArea {					
						anchors.fill: parent
						enabled: true
						onClicked: history.remove(modelData.index)
						cursorShape: Qt.PointingHandCursor
					}
				}
			}
		}
	}

			}
		}
	Rectangle {
		anchors.top: parent.top
		anchors.right: parent.right
		anchors.topMargin: anchored.height / 2 -50 
		anchors.rightMargin: 10
		implicitWidth: 30
		implicitHeight: 95
		radius: height / 2
		color: "#1A0713"
		border.width: 2
		border.color: "#D6296B"
		Text {
			anchors.centerIn: parent
			text: "N\nO\nT\nI\nF"
			font.bold: true
			color: "#D6296B"
		}
		MouseArea {
			anchors.fill: parent
			enabled: true
			cursorShape: Qt.PointingHandCursor
			onClicked: if (anchored.state == "state1") 
			anchored.state = "state2"
			else anchored.state = "state1"
		}
	}
}

