import Quickshell
import QtQuick
PanelWindow {
	id: overlay
	anchors {
		top: true;
		bottom: true;
		left: true;
		right: true
	}
	color: "transparent"

	exclusionMode: ExclusionMode.Ignore

	property Item child

	mask: Region {
			item: overlay.child
			intersection: Intersection.Intersect
		}
	}

