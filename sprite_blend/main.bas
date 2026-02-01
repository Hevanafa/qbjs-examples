import Console from "lib\web\console.bas"

Const surfaceWidth = 240
Const surfaceHeight = 160
Const displayScale = 3

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

_PutImage (10, 10), imgRadioactive
SprBlend imgRadioactive, 50, 10, 0.5

' Flush
_PutImage , surface, scaled
_Display


sub SprBlend(imgHandle as long, x as integer, y as integer, opacity as double)
  dim as long destHandle
  destHandle = _dest

$if javascript
  const img = QB.getImage(imgHandle);
  const dest = QB.getImage(destHandle);
  const ctx = dest.getContext("2d");

  ctx.globalAlpha = opacity;
  ctx.drawImage(img, x, y, img.width, img.height);
  ctx.globalAlpha = 1.0;
$endif
end sub