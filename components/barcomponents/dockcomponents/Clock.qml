import Quickshell
import QtQuick

Item {
	anchors.top: parent.top  	
	anchors.horizontalCenter: parent.horizontalCenter
	anchors.topMargin: 20
	SystemClock {
		id: sysclock
		precision: SystemClock.Seconds
	}
	//as i said before in the comments this text was a bit problematic lol 	
	Text {
		id: time
		anchors.centerIn: parent
		//here what we're doing is describing the relationship between the status of the hoverometer and the text   		
		text: {Qt.formatDateTime(sysclock.date, "hh:mm:ss ap")}	
		font.bold: true	    
		font.pixelSize: 15    	
		color: "#D6296B"
	}
	Text {
		anchors.top: time.bottom
		anchors.topMargin: 6
		anchors.horizontalCenter: parent.horizontalCenter
		text: {Qt.formatDateTime(sysclock.date, "ddd MMM | dd/MM/yyyy")}
		font.bold: true
		font.pixelSize: 15
		color: "#D6296B"
	}
}
