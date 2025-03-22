import { currentOSDBarLevel } from "./osd";

const OSDBar = () => {
  return (
    <box className="bar-box">
      <slider
        drawValue={false}
        min={0}
        max={100}
        value={currentOSDBarLevel().as((v) => v * 100)}
        step={1}
        setup={(self) => {}}
      />
    </box>
  );
};

export default OSDBar;
