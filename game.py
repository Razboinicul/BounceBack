from DSEngine import *
from pygame import Vector2
from pygame.display import update
from sys import exit
from random import randint

from DSEngine.animated import AnimationSheet
from DSEngine.etypes import pygame
default_title="Project: SCP"

def main():
    global default_title
    window = Window(title=default_title, fps=120, size=(1280, 720), bg=(100, 100, 100))
    audio_man = AudioManager()
    text = Text2D("WAT??", position=Vector2(0,0))
    text.position = centre_object(AXIS_X, text.position, text.size, Vector2(window.size[0], window.size[1]))
    scp = Image2D("Test.png", position=Vector2(100, 100))
    text.init(window)
    scp.init(window)
    #cp.move_towards(Vector2(0, 0))
    while window.running:
        keys = window.frame()
        if keys[27]:
            return 1

if __name__ == "__main__":
    main()