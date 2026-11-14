extends Area2D

var total_bullets = 99 #PLEASE MODIFY IN-GAME
var can_shoot = true
var bullet_pre = preload("res://bullet.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot && total_bullets > 0:
		total_bullets -= 1;can_shoot = false;$CooldownTimer.start()
		var b = bullet_pre.instantiate();b.global_position=self.global_position;b.rotation=get_parent().global_rotation
		b.direction = global_rotation
		get_parent().get_parent().get_parent().add_child(b)

func _cooldown_timer_timeout() -> void: can_shoot = true
