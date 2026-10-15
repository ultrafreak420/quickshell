import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Item {
    id: hardStat

    anchors.top: parent.top
    anchors.topMargin: 125
    anchors.horizontalCenter: parent.horizontalCenter

    RowLayout {
        id: row

        anchors.centerIn: parent
        anchors.margins: 10
        spacing: 10

        Timer {
            id: timer

            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                cpuProctemp.running = true;
                memProc.running = true;
            }
        }

        Rectangle {
            width: text.width + 10
            height: text.height + 5
            radius: width / 2
            border.width: 2
            color: "#1A0713"
            border.color: "#D6296B"

            Process {
                id: cpuProctemp

                property int cputemp

                command: ["sh", "-c", "head -1 /sys/class/hwmon/hwmon0/temp1_input"]
                Component.onCompleted: running = true

                stdout: SplitParser {
                    onRead: (data) => {
                        cpuProctemp.cputemp = Math.round(parseInt(data) / 1000);
                    }
                }

            }

            Process {
                id: memProc

                property int memUsage

                command: ["sh", "-c", "free | grep Mem"]
                Component.onCompleted: running = true

                stdout: SplitParser {
                    onRead: (data) => {
                        if (!data)
                            return ;

                        var parts = data.trim().split(/\s+/);
                        var total = parseInt(parts[1]) || 1;
                        var used = parseInt(parts[2]) || 0;
                        memProc.memUsage = Math.round(100 * used / total);
                    }
                }

            }

            Text {
                id: text

                anchors.centerIn: parent
                text: "CPU Temp: " + cpuProctemp.cputemp + " °C"
                font.pixelSize: 12
                color: "#D6296B"
            }

        }

        Rectangle {
            width: text2.width + 10
            height: text2.height + 5
            radius: width / 2
            border.width: 2
            color: "#1A0713"
            border.color: "#D6296B"

            Text {
                id: text2

                anchors.centerIn: parent
                text: "Mem Usage: " + memProc.memUsage + " %"
                font.pixelSize: 12
                color: "#D6296B"
            }

        }

    }

}
