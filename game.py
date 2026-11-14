from DSEngine import *
from pygame import Vector2
from pygame.display import update
from sys import exit
from random import randint

from DSEngine.animated import AnimationSheet
from DSEngine.etypes import pygame
default_title="Project: SCP"

class MainChar(Rect2D):
    def __init__(self, position: Vector2, color: tuple, size: Vector2, speed: int, gravity: int):
        self.position = position
        self.size = size
        self.color = color
        self.speed = speed
        #self.statics = staticobj
        self.gravity = gravity
        super().__init__(position=self.position, size=self.size, color=self.color)
    
    def init(self, window: Window):
        super().init(window)
    
    def render(self, window: Window):
        if not self.visible: return
        
        if not self.is_on_floor(): self.move(Vector2(0, self.gravity*window.delta))
        k = window.pressed_keys
        if k[key_to_scancode("D")]:
            print("right:", k[key_to_scancode("D")])
        elif k[key_to_scancode("A")]:
            print("left:", k[key_to_scancode("A")])
        elif k[pygame.K_SPACE]:
            print("jump:", k[pygame.K_SPACE])
        super().render(window)

class StaticBody2D(Rect2D):
    def __init__(self, position: Vector2, size: Vector2, color: tuple):
        self.position = position
        self.size = size
        self.color = color
        super().__init__(position=self.position, size=self.size, color=self.color)
    
    def init(self, window: Window):
        super().init(window)
    
    def render(self, window: Window):
        super().render(window)

def main():
    global default_title
    window = Window(title=default_title, fps=120, size=(1280, 720), bg=(100, 100, 100))
    audio_man = AudioManager()
    text = Text2D("WAT??", position=Vector2(0,0))
    text.position = centre_object(AXIS_X, text.position, text.size, Vector2(window.size[0], window.size[1]))
    statics = [
        StaticBody2D(
            position=Vector2(0,window.size[1]-int(window.size[1]/8)), size=Vector2(window.size[0],int(window.size[1]/8)), color=(0, 255, 0)
            )
    ]
    player = MainChar(position=Vector2(200, 200), color=(255, 255, 0), size=Vector2(50, 80), speed=100, gravity=0.9)
    text.init(window)
    player.init(window)
    for i in statics: i.init(window)

    while window.running:
        keys = window.frame()
        print(window.delta)
        if keys[27]:
            return 1

if __name__ == "__main__":
    main()