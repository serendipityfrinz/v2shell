import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

// folders
import "../../theme/"

// scope can't have a size!
Column {
  id: root
  property var speaker: Pipewire.defaultAudioSink
  property int vol: speaker.audio.volume * 100
  property bool ready: speaker.ready
  property var center: ""

  height: volIcon.height
  width: volIcon.width
  
  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  Text {
    id: volIcon
    text: root.ready && root.speaker.audio.muted ? "󰝟" : root.ready && root.vol >= 50 ? "󰕾" : root.ready && root.vol >= 35 ? "󰖀" : root.ready && root.vol <= 34 ? "󰕿" : "?"
    color: Theme.primary
    x: (center.width - width) / 2
    font.pointSize: 15
  }
}
