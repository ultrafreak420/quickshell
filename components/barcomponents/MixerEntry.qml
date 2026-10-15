import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Services.Pipewire

ColumnLayout {
	required property PwNode node;

	// bind the node so we can read its properties
	PwObjectTracker { objects: [ node ] }

	RowLayout {
		Image {
			visible: source != ""
			source: {
				const icon = node.properties["application.icon-name"] ?? "audio-volume-high-symbolic";
				return `image://icon/${icon}`;
			}

			sourceSize.width: 20
			sourceSize.height: 20
		}

		Text {
			id: label
			text: {
				// application.name -> description -> name
				const app = node.properties["application.name"] ?? (node.description != "" ? node.description : node.name);
				const media = node.properties["media.name"];
				return media != undefined ? `${app} - ${media}` : app;
			}
			color: "#D6296B"
			font.bold: true
			font.pixelSize: 18
		}

		Rectangle {
			anchors.left: parent.left
			anchors.leftMargin: label.width + 45
			implicitHeight: button.height + 15
			implicitWidth: button.width + 15
			radius: height / 2
			border.width: 2
			border.color: "#D6296B"
			color: "#631222"
			Text {
				id: button
				anchors.centerIn: parent
				text: node.audio.muted ? "unmute" : "mute"
				color: "#D6296B"
				font.pixelSize: 15
				font.bold: true
			}
			MouseArea {
				anchors.fill: parent
				cursorShape: Qt.PointingHandCursor
				enabled: true
				onClicked: node.audio.muted = !node.audio.muted
			}
		}
	}

	RowLayout {
		Text {
			Layout.preferredWidth: 50
			text: `${Math.floor(node.audio.volume * 100)}%`
			color: "#D6296B"
		}

		Slider {
			Layout.fillWidth: true
			value: node.audio.volume
			onValueChanged: node.audio.volume = value
		}
	}
}
