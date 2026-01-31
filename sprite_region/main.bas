Const surfaceWidth = 320
Const surfaceHeight = 200
Const displayScale = 2

Dim As Long surface, scaled
Dim Shared As Long imgCGAFont

imgCGAFont = _LoadImage("CGA8x8thin.png")

surface = _NewImage(surfaceWidth, surfaceHeight, 32)
scaled = _NewImage(surfaceWidth * displayScale, surfaceHeight * displayScale, 32)

Screen scaled
_Dest surface
_Delay 0.1
_Display

Cls , &HFF6495ED

_PutImage (160, 10), imgCGAFont

printCGAChar "@", 10, 10
printCGAChar "z", 30, 10
printCGA "Hello from QBJS!", 10, 30

_PutImage , surface, scaled
_Display


Sub printCGAChar (c As String, x As Integer, y As Integer)
  Dim As Integer charcode
  Dim As Integer row, col

  charcode = Asc(c)
  row = charcode \ 16
  col = charcode Mod 16

  ' dest first, then src
  ' Compared to QB64, QBJS excludes the end of range,
  ' e.g. 0..8 would have the actual range of 0..7
$if WEB then
  _PutImage (x, y)-(x + 8, y + 8), imgCGAFont, , (col * 8, row * 8)-((col + 1) * 8, (row + 1) * 8)
$else
  _PutImage (x, y)-(x + 7, y + 7), imgCGAFont, , (col * 8, row * 8)-((col + 1) * 8 - 1, (row + 1) * 8 - 1)
$endif
End Sub

Sub printCGA (text As String, x As Integer, y As Integer)
  Dim As Integer left, a
  Dim As String c

  If text = "" Then Exit Sub

  left = x

  For a = 1 To Len(text)
    c = Mid$(text, a, 1)
    printCGAChar c, left, y
    left = left + 8
  Next
End Sub
