import { Astal, Gtk } from "astal/gtk3";
import { revealerSetup } from "src/lib/osd";
import OSDIcon from "./osd-icon";
import OSDBar from "./osd-bar";
import OSDLabel from "./osd-label";
import AstalWp from "gi://AstalWp?version=0.1";
import Brightness from "src/services/brightness";
import { bind, Variable } from "astal";
import { speakerIcon } from "src/lib/audio";

const wp = AstalWp.get_default();
const brightness = Brightness.get_default();

export const currentOSDIcon = Variable("");
export const currentOSDBarLevel = Variable(0);
export const currentOSDMute = Variable(false);
//const currentOSDLabel = Variable(0);

const speakerChanged = Variable.derive(
  [bind(wp!.defaultSpeaker, "volume"), bind(wp!.defaultSpeaker, "mute")],
  (volume, mute) => {
    currentOSDIcon.set(speakerIcon.get());
    currentOSDBarLevel.set(volume);
    currentOSDMute.set(mute);
  },
);

const microphoneChanged = Variable.derive(
  [bind(wp!.defaultMicrophone, "volume"), bind(wp!.defaultMicrophone, "mute")],
  (volume, mute) => {
    currentOSDIcon.set(wp!.defaultMicrophone.mute ? "󰍭" : "󰍬");
    currentOSDBarLevel.set(volume);
    currentOSDMute.set(mute);
  },
);

bind(brightness, "screen").subscribe((value) => {
  currentOSDIcon.set("󱍖");
  currentOSDBarLevel.set(value / 100);
});

bind(brightness, "kbd").subscribe((value) => {
  currentOSDIcon.set("󰥻");
  currentOSDBarLevel.set(value);
});

const OSD = (monitor = 0) => {
  return (
    <window
      monitor={monitor}
      name="osd"
      className="osd"
      layer={Astal.Layer.TOP}
      anchor={Astal.WindowAnchor.BOTTOM}
      clickThrough
    >
      <revealer
        transitionType={Gtk.RevealerTransitionType.CROSSFADE}
        revealChild={false}
        setup={revealerSetup}
      >
        <centerbox spacing={10} className="box">
          <OSDIcon />
          <OSDBar />
          <OSDLabel />
        </centerbox>
      </revealer>
    </window>
  );
};

export default OSD;
