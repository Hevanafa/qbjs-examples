dim as long surface, scaled
surface = _newimage(320, 200, 32)
scaled = _newimage(320 * 3, 200 * 3, 32)

screen scaled
_dest surface
_delay 0.1
_display

cls , &hFF6495ED

_putimage , surface, scaled
_display
