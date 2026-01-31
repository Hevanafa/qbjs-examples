Dim As Long surface, scaled
surface = _NewImage(320, 200, 32)
scaled = _NewImage(320 * 3, 200 * 3, 32)

Screen scaled
_Dest surface
_Delay 0.1
_Display

Cls , &HFF6495ED

_PutImage , surface, scaled
_Display
