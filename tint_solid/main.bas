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

' Flush
_PutImage , surface, scaled
_Display

sub TintImage(imgHandle as long, newColour as _unsigned long)
  dim as integer a, b

  for b=0 to _height(imgHandle)
  for a=0 to _width(imgHandle)

  next a, b
end sub