import { currentOSDIcon, currentOSDMute } from "./osd";

const OSDIcon = () => {
  return (
    <centerbox
      //onDestroy={() => {
      //  speakerChanged.drop();
      //  microphoneChanged.drop();
      //}}
      className="icon-box"
      setup={(self) => {
        self.hook(currentOSDMute, (self) =>
          self.toggleClassName("danger", currentOSDMute.get()),
        );
      }}
    >
      <box />
      <label className="icon" label={currentOSDIcon()} />
      <box />
    </centerbox>
  );
};

export default OSDIcon;
