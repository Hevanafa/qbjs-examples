import Console from "lib\web\console.bas"

option _explicit

Const surfaceWidth = 240
Const surfaceHeight = 160
Const displayScale = 3

Dim As Long surface, scaled
Dim As Long imgRadioactive, imgTinted, imgTinted2

imgRadioactive = _LoadImage("radioactive.png")
imgTinted = _CopyImage(imgRadioactive)
imgTinted2 = _CopyImage(imgRadioactive)

console.log "What is imgTinted2? " + imgTinted2

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

TintSolid imgTinted, &hFFFFFFFF
TintBlend imgTinted2, &h80FF5555

_putimage (50, 10), imgTinted
_putimage (100, 10), imgTinted2

' Flush
_PutImage , surface, scaled
_Display

sub TintSolid(imgHandle as long, colour as _unsigned long)
  dim as integer a, b
  dim as long lastSource, lastDest

  lastSource = _source
  lastDest = _dest
  _source imgHandle
  _dest imgHandle

  for b=0 to _height(imgHandle)
  for a=0 to _width(imgHandle)
    if _alpha(point(a, b)) = &hFF then pset (a, b), colour
  next a, b

  _source lastSource
  _dest lastDest
end sub


sub TintBlend(imgHandle as long, colour as _unsigned long)
  dim as long lastSource, lastDest
  dim as long destHandle

  if _alpha(colour) = &hFF then 
    TintSolid imgHandle, colour
    exit sub
  end if

  lastSource = _source
  lastDest = _dest
  _source imgHandle
  _dest imgHandle

  destHandle = _dest

$if javascript
  const img = QB.getImage(destHandle);
  const ctx = img.getContext("2d");

  // >>> is the "unsigned shift right" operator
  const
    a = (colour >>> 24) & 0xFF,
    r = (colour >>> 16) & 0xFF,
    g = (colour >>> 8) & 0xFF,
    b = colour & 0xFF;

  ctx.globalCompositeOperation = "source-atop";
  ctx.fillStyle = "rgba(" + [r, g, b, a / 255].join(", ") + ")";
  ctx.fillRect(0, 0, img.width, img.height);

  // Restore default composite mode
  ctx.globalCompositeOperation = "source-over";
$endif

  _source lastSource
  _dest lastDest
end sub
