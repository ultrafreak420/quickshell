import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

ClippingRectangle {
	id: root
	anchors.top: parent.top
	anchors.right: parent.right
	anchors.rightMargin: 10
	anchors.topMargin: 80
	implicitWidth: 400
	implicitHeight: Math.max(0, column.implicitHeight)
	color: "transparent"

	NotificationServer {
		id: server
		//ListModel { id: history }
		actionsSupported: true
		bodySupported: true
		imageSupported: true
		keepOnReload: false

		onNotification: n => n.tracked = true
	}

	ColumnLayout {
		id: column
		width: parent.width
		spacing: 10

		Repeater {
			model: server.trackedNotifications 
			delegate: Rectangle {
				id: card
				required property var modelData

				Timer {
					running: card.modelData.urgency !== NotificationUrgency.Critical
					interval: 5000
					onTriggered: card.modelData.dismiss()
				}

				Layout.fillWidth: true
				Layout.preferredHeight: layout.implicitHeight + 20
				radius: 8
				color: modelData.urgency === NotificationUrgency.Critical ? "#330917" : "#1A0713"
				border.width: 2
				border.color: "#D6296B"

				RowLayout {
					id: layout
					anchors.verticalCenter: parent.verticalCenter
					anchors.left: parent.left
					anchors.leftMargin: 10
					Image {
						Layout.preferredWidth: 44
						Layout.preferredHeight: 44
						fillMode: Image.PreserveAspectFit
						visible: source.toString() !== ""
						source: card.modelData.image || card.modelData.appIcon || ""
					}
					ColumnLayout {
						Layout.fillWidth: true
						anchors.top: parent.top
						spacing: 5
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
				}
				MouseArea {
					anchors.fill: parent
					onClicked: card.modelData.dismiss()
				}
			}
		}
	}
}
