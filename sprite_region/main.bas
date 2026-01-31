Const surfaceWidth = 320
Const surfaceHeight = 200
Const displayScale = 2

dim as long surface, scaled
dim as long imgCGAFont

imgCGAFont = _loadimage("CGA8x8thin.png")

surface = _NewImage(surfaceWidth, surfaceHeight, 32)
scaled = _NewImage(surfaceWidth * displayScale, surfaceHeight * displayScale, 32)

Screen scaled
_Dest surface
_Delay 0.1
_Display

cls , &hFF6495ED

_putimage (10, 10), imgCGAFont

_putimage , surface, scaled
_display
