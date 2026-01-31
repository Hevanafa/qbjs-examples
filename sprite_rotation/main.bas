Const surfaceWidth = 240
Const surfaceHeight = 160
Const displayScale = 3

$if javascript
document.getElementById("gx-canvas").style.imageRendering = "pixelated";
$endif

Dim As Long surface, scaled
Dim As Long imgRadioactive

imgRadioactive = _LoadImage("radioactive.png")

' Init scaled display
surface = _NewImage(surfaceWidth, surfaceHeight, 32)
scaled = _NewImage(surfaceWidth * displayScale, surfaceHeight * displayScale, 32)

Screen scaled
_Dest surface
_Delay 0.1
_Display

_PrintMode _KeepBackground

' Begin draw
Cls , &HFF6495ED

$if javascript
function rotate45() {
  const imgRad = QB.getImage(imgRadioactive);
  const dest = QB.getImage(surface);
  const ctx = dest.getContext("2d");

  ctx.save();

    ctx.translate(120 + imgRad.width / 2, 80 + imgRad.height / 2);
    ctx.rotate(45 * Math.PI / 180);  // angle is in radians
    ctx.drawImage(imgRad, -imgRad.width / 2, -imgRad.height / 2);

  ctx.restore();
}

rotate45();
$endif

' Flush
_PutImage , surface, scaled
_Display
