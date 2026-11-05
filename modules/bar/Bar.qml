import Quickshell
import QtQuick

// folders
import "../../theme"
import "../../components/"
import "./power/"

Scope {
  id: root

  PanelWindow {
    id: bar
    anchors { top: true; bottom: true; right: true; }
    implicitWidth: 50
    color: "transparent"

    Rectangle {
      id: barRect
      anchors.fill: parent
      color: Theme.surface_container
      
      Column {
        id: firstWidgets
        spacing: 3
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10

        Workspaces {}
      }

      DateAndClock {
        center: parent
        anchors.centerIn: parent
      }

      Column {
        id: topWidgets
        spacing: 7
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10

        Volume {
          center: parent
        }

        Battery {
          center: parent
        }

        Power {
          center: parent
          mama: bar
        }
      }
    }
  }
}
