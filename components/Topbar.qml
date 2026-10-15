import Quickshell
import QtQuick
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
			right: true;	
		}
		implicitHeight: 60	
		color: "transparent"	
		BackgroundEffect.blurRegion: Region { item: bar.contentItem }	
	}
	Overlay {
		mask: Region {
			item: dock
			intersection: Intersection.Intersect
		}
		Dock {
			id: dock
		}
	}
}
