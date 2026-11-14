from DSEngine import *
from pygame import Vector2

def main():
    window = Window()
    c1 = Image2D("Test.png")
    c2 = Image2D("Test1.png")
    sheet = Spritesheet(15, c1, c2)
    print(sheet.sheet)
    text = Text2D("Frame: 0\n FN: 0")
    sanim = AnimationSheet(default=c1, test=sheet)
    sprite = AnimatedSprite2D(sanim)
    sprite.position = centre_object(AXIS_XY, sprite.position, Vector2(sprite.size.x, sprite.size.y), Vector2(window.size[0], window.size[1]))
    sprite.init(window);text.init(window)
    sprite.play_sheet("test")
    while window.running:
        print(sprite.playing)
        text.text = f"Frame: {sprite.frame}\n FN: {sprite.fn}"
        text.update()
        k = window.frame()
        if not sprite.playing:
            sprite.play_sheet("test")

if __name__ == "__main__":
    main()
