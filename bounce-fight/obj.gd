extends Node2D

@export var size: Vector2 = Vector2.ZERO
@export var pos: Vector2 = Vector2.ZERO
@onready var original = get_node("N1")
#@export var exitt: bool = true
#@export var exit_x: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position = position
	for i in range(1, int(size.x/32)):
		var copy = original.duplicate()
		copy.position.x = 32*i
		add_child(copy)

	self.global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: pass
	#$Exit.visible = true
