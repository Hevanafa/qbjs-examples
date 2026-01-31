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

dim t as long
t = 0

' Begin draw
do
  _limit 60

  Cls , &HFF6495ED

  RotateImage imgRadioactive, 120, 80, (t * 2) * _pi / 180

  t=t+1

  ' Flush
  _PutImage , surface, scaled
  _Display
loop until _keydown(27)


' angle is in radians
sub RotateImage(imgHandle as long, x as integer, y as integer, angle as double)
  dim destHandle as long
  destHandle = _dest

$if javascript
  const srcImg = QB.getImage(imgHandle);
  const dest = QB.getImage(destHandle);
  const ctx = dest.getContext("2d");

  ctx.save();

    ctx.translate(x + srcImg.width / 2, y + srcImg.height / 2);
    ctx.rotate(angle);
    ctx.drawImage(srcImg, -srcImg.width / 2, -srcImg.height / 2);

  ctx.restore();
$endif

end sub