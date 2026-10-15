import Quickshell
import QtQuick
import Quickshell.Services.Notifications
import Quickshell.Wayland
import QtQuick.Layouts

Scope {
	NotificationServer {
		id: server
		ListModel { id: history }
		actionsSupported: true
		bodySupported: true
		imageSupported: true

		onNotification: n => { history.insert(0, {
			summary: n.summary,
			body: n.body,
			appName: n.appName,
			urgency: n.urgency
			time: Qt.formatDateTime(new Date(), "dd/MM/yyyy\nhh:mm:ss")
		})
		n.tracked = true
             }
	}
}
