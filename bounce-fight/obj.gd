extends StaticBody2D

@export var size: Vector2 = Vector2.ZERO
@export var pos: Vector2 = Vector2.ZERO
#@export var exitt: bool = true
#@export var exit_x: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.shape.size = size
	$ColorRect.size = size
	$ColorRect.position = -(size/2)
	#exit_x = min(max(exit_x, size.x), 0)
	#$Exit.position = Vector2(0, 0)#pos.y-(pos.y/2))
	#$Exit.visible = true #self.exitt
	#$Exit.active = self.exitt

	self.global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: pass
	#$Exit.visible = true
