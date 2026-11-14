extends Area2D

@export var direction: float
var dir
@export var vel: int = 400
func _ready() -> void: dir = Vector2.RIGHT.rotated(direction)
func _physics_process(delta: float) -> void:
	position += dir * vel * delta
