import Quickshell
import QtQuick

// folders
import "../../theme/"
import "../../components/"

Column {
  property bool showTime: true
  property bool showDate: true
  property bool twelveFormat: true
  property var center: ""

  id: root
  spacing: 5
  x: (center.width - width) / 2
  
  Text {
    id: timeIcon
    text: "󰥔 "
    horizontalAlignment: Text.AlignHCenter
    color: Theme.on_surface
    anchors.horizontalCenter: parent.horizontalCenter
    font.family: "Figtree"
    font.variableAxes: { "wght": 500 }
    visible: showTime
  }

  Text {
    id: time
    text: Qt.formatDateTime(clock.date, root.twelveFormat ? "hh\nmm\nAP" : "HH\nmm")
    horizontalAlignment: Text.AlignHCenter
    color: Theme.primary
    font.family: "Figtree"
    font.variableAxes: { "wght": 500 }
    visible: showTime
  }

  Seperator {
    center: parent
    visible: showDate
  }

  Text {
    id: date
    text: Qt.formatDateTime(clock.date, "MM\ndd\nyy")
    anchors.horizontalCenter: parent.horizontalCenter
    color: Theme.primary
    font.family: "Figtree"
    font.variableAxes: { "wght": 500 }
    visible: showDate
  }

  Text {
    id: err
    text: "?\n?\n?\n?\n?"
    anchors.horizontalCenter: parent.horizontalCenter
    color: Theme.error
    font.family: "Figtree"
    font.variableAxes: { "wght": 500 }
    visible: !showTime && !showDate
  }

  Text {
    id: dateIcon
    text: "󰃭 "
    horizontalAlignment: Text.AlignHCenter
    color: Theme.on_surface
    anchors.horizontalCenter: parent.horizontalCenter
    font.family: "Figtree"
    font.variableAxes: { "wght": 500 }
    visible: showTime
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
