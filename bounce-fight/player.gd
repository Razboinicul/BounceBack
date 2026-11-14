extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumped = false
var fallheight = 0
var cons_bounces = 0

func point_gun():
	var ptr = get_global_mouse_position()
	$G.look_at(ptr)

func _physics_process(delta: float) -> void:
	point_gun()
	#print(fallheight)
	if not is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor():
		if fallheight != 0: cons_bounces += 1
		else: cons_bounces = 0
		if cons_bounces > 3: velocity.y = 0
		else: velocity.y += fallheight * -0.8
		fallheight = 0
	if fallheight < position.y:
		fallheight = position.y
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		cons_bounces=0;velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
