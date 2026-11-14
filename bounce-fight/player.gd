extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -550.0

var jumped = false
var fallheight = 0.0
var cons_bounces = 0
var sliding_wall = false
var slidewall = 0
var bounce_multiplier = 0.7
var wall_gravity_multiplier = 0.3
var normal_gravity_multiplier = 1.0
var jump_h = 0.0
var was_sliding = false
var push_vel = 150
var omit = true

func point_gun():
	var ptr = get_global_mouse_position()
	$G.look_at(ptr)


func _physics_process(delta: float) -> void:
	point_gun()

	# Wall detection
	if is_on_wall():
		sliding_wall = true
		var normal = get_wall_normal()

		if normal.x < -0.5:
			slidewall = -1
		elif normal.x > 0.5:
			slidewall = 1
		else:
			slidewall = 0
	else:
		sliding_wall = false
		slidewall = 0

	# Gravity
	if not is_on_floor():
		if sliding_wall:
			velocity += get_gravity() * wall_gravity_multiplier * delta
		else:
			velocity += get_gravity() * normal_gravity_multiplier * delta

	# Landing and bouncing
	if is_on_floor():
		if not omit:
			if not was_sliding:
				if fallheight != 0:
					cons_bounces += 1
				else:
					cons_bounces = 0

				if cons_bounces > 3:
					velocity.y = 0
				else:
					velocity.y = -abs(fallheight) * bounce_multiplier
		else:
			omit = false
			velocity.y = 0

		fallheight = 0
		jump_h = 0

	# Track maximum fall height
	if not is_on_floor() and not sliding_wall:
		if fallheight < position.y:
			fallheight = position.y

	# Jump
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			cons_bounces = 0
			fallheight = 0
			jump_h = position.y + JUMP_VELOCITY
			velocity.y = JUMP_VELOCITY
			velocity.x = push_vel * -(slidewall)

	var direction := Input.get_axis("left", "right")

	if Input.is_action_just_pressed("jump") and sliding_wall:
		velocity.x = slidewall * SPEED * 4
	elif direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	was_sliding = sliding_wall
	
	print(velocity.x)

	move_and_slide()
