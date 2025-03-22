import { Gtk } from "astal/gtk3";
import { currentOSDBarLevel } from "./osd";

const OSDLabel = () => {
  return (
    <box className="label-box">
      <label
        halign={Gtk.Align.END}
        hexpand
        label={currentOSDBarLevel().as((v) => `${Math.floor(v * 100)}%`)}
      />
    </box>
  );
};

export default OSDLabel;
