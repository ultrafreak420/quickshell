import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import "barcomponents"

//everythings in a scope so that the children propogate properly 
Scope {	
	//this panel is purely cosmetic nothing actually depends on this it's just to give the rest of the objects in the bar space visually,
	//and a blurred background
	PanelWindow {	
		id: bar	
		anchors {	
			top: true;
			left: true;	
			bottom: true;	
		}
		implicitWidth: 60	
		color: "transparent"	       
		BackgroundEffect.blurRegion: Region { item: bar.contentItem }
	}
	Overlay {
		//this mask is so that the overlay doesn't obstruct the rest of the windows behind it 
		mask: Region {					
			item: column		
			intersection: Intersection.Intersect
			Region {
				item: notify
				intersection: Intersection.Combine
			}
		}
		ColumnLayout {
			id: column
			anchors.left: parent.left
			anchors.bottom: parent.bottom
			anchors.top: parent.top
			spacing: 10
			Item { Layout.fillHeight: true }
			Mixer {}
			NotificationCenter {id: notif}
			Item { Layout.fillHeight: true }
		}
		Notification {id: notify}
	}
}

