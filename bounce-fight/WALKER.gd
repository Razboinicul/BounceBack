extends CharacterBody2D

const SPEED = 100
const JUMP_VELOCITY = -400.0
var health = 30
@export var player: Node2D
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	var dir = 1 if player.position.x > self.position.x else -1
	$Gingermad.flip_h = !(player.position.x > self.position.x)
	position.x += SPEED * dir * delta
	if health <= 0: queue_free()
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		body.take_damage(30)
