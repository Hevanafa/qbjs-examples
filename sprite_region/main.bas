Const surfaceWidth = 320
Const surfaceHeight = 200
Const displayScale = 2

dim as long surface, scaled
dim shared as long imgCGAFont

imgCGAFont = _loadimage("CGA8x8thin.png")

surface = _NewImage(surfaceWidth, surfaceHeight, 32)
scaled = _NewImage(surfaceWidth * displayScale, surfaceHeight * displayScale, 32)

Screen scaled
_Dest surface
_Delay 0.1
_Display

cls , &hFF6495ED

_putimage (160, 10), imgCGAFont

printCGAChar "@", 10, 10
printCGAChar "z", 30, 30

_putimage , surface, scaled
_display


sub printCGAChar(c as string, x as integer, y as integer)
  dim as integer charcode
  dim as integer row, col

  charcode = asc(c)
  row = charcode \ 16
  col = charcode mod 16

  ' dest first, then src
  _putimage (x, y)-(x + 7, y + 7), imgCGAFont, , (col * 8, row * 8)-((col + 1) * 8 - 1, (row + 1) * 8 - 1)
end sub
