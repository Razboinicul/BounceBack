import pygame, json

AXIS_X = "X"
AXIS_Y = "Y"
AXIS_XY = "XY"

def centre_object(axis: str, position: pygame.Vector2, size: pygame.Vector2, canvas_size: pygame.Vector2):
    newpos = pygame.Vector2(0, 0)
    if axis == AXIS_X:
        newpos.y = position.y
        p = (canvas_size.x/2)-(size.x/2)
        newpos.x = p
    if axis == AXIS_Y:
        newpos.x = position.x
        p = (canvas_size.y/2)-(position.y/2)
        newpos.y = p
    if axis == AXIS_XY:
        px = (canvas_size.x/2)-(position.x/2)
        py = (canvas_size.y/2)-(position.y/2)
        newpos.x = px
        newpos.y = py
    return newpos


