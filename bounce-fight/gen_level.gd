extends Node2D

var premade_obj = preload("res://OBJ.tscn")
var health_preload = preload("res://preamade/HREF.tscn")
var m1_pre = preload("res://RunnerEN.tscn")
var m2_pre = preload("res://WALKER.tscn")
var s1_min = 550;var s1_max = 520
var s1_gen = Vector2.ZERO
var s2_gen = Vector2.ZERO
var s3_gen = Vector2.ZERO
var s4_gen = Vector2.ZERO
var s4_len = 0
var rng = RandomNumberGenerator.new()

func gen_s1():
	var s1 = premade_obj.instantiate()
	s1.size = Vector2(rng.randi_range(64, 64*4), 0)
	s1.pos = Vector2(rng.randi_range(0, 720-s1.size.x*1.1), rng.randi_range(s1_max, s1_min))
	s1_gen = s1.pos
	$OBJS.add_child(s1)

func gen_s2():
	var s2 = premade_obj.instantiate()
	s2.size = Vector2(rng.randi_range(64*2, 64*6), 0)
	var plus_minus = 1 if randi_range(0, 1)==1 else -1
	s2.pos = s1_gen-Vector2(rng.randi_range(150, 220)*plus_minus, rng.randi_range(130, 200))
	s2_gen = s2.pos
	$OBJS.add_child(s2)

func gen_s3():
	var s3 = premade_obj.instantiate()
	s3.size = Vector2(rng.randi_range(64*2, 64*6), 0)
	var plus_minus = 1 if randi_range(0, 1)==1 else -1
	s3.pos = s2_gen-Vector2(rng.randi_range(150, 220)*plus_minus, rng.randi_range(130, 200))
	s3_gen = s3.pos
	$OBJS.add_child(s3)

func gen_s4():
	var s4 = premade_obj.instantiate()
	s4.size = Vector2(rng.randi_range(64*2, 64*6), 0)
	s4_len = s4.size.x
	var plus_minus = 1 if randi_range(0, 1)==1 else -1
	s4.pos = s3_gen-Vector2(1280-s4_len, 0)#rng.randi_range(10, 10))
	s4_gen = s4.pos
	$OBJS.add_child(s4)

func gen_monst():
	var num = rng.randi_range(2,4)
	for _i in range(num):
		var mt = rng.rand_weighted(PackedFloat32Array([0.3, 1]))
		var m = m1_pre.instantiate()
		if mt == 0: m = m2_pre.instantiate()
		else: m = m1_pre.instantiate()
		m.position = Vector2(randi_range(0, 1250), randi_range(15, 610))
		m.player = $Player
		$Enemies.add_child(m)

#func gen_door():
	#var door = $OBJS/Exit
	#door.global_position = Vector2(s4_gen.x+rng.randi_range(0,s4_len-15), s4_gen.y-75)

func _ready() -> void:
	#$Player.global_position = Vector2(randi_range(0, 1250), randi_range(15, 610))
	$Player.global_position = s3_gen+Vector2(50, 50)
	gen_s1();gen_s2();gen_s3();gen_monst()

func _process(delta: float) -> void:
	$OBJS/Exit.active = false #$Enemies.get_children()==[]
	$Hud.update_ui($Player.health, $Player/G/Gun.total_bullets)

func _on_exit_player_exit() -> void:
	get_tree().quit()
