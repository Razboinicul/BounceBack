extends Control

var sel_button = 0
var margins
var first_press = true

func _ready() -> void:
	margins = [Vector2($VBoxContainer/Label.global_position.x, $VBoxContainer/Label.global_position.y), 
			$Node2D.position]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"): 
		sel_button = 1 if sel_button==0 else 0
		print(sel_button)
	if event.is_action_pressed("ui_accept"):
		if sel_button == 0: 
			Global.phealth=100;Global.lvl = 0
			if not Global.did_tutorial: get_tree().change_scene_to_file("res://tutorials/Tutorial1.tscn")
			else: get_tree().change_scene_to_file("res://tutorials/Tutorial1.tscn")
		if sel_button == 1:
			if Global.lines != [] && first_press:
				$WHY.show()
			first_press = false
			var label = $VBoxContainer/Label
			var pos = label.global_position - global_position
			var w = label.size.x
			var h = label.size.y

			var y = randf_range(pos.y + h * 0.25, pos.y + h * 0.75)
			var line = [
				Vector2(pos.x + randf_range(0, w * 0.2), y),
				Vector2(pos.x + randf_range(w * 0.8, w), y + randf_range(-8, 8))
			]
			Global.lines.append(line)
			queue_redraw()

func _process(delta: float) -> void:
	if sel_button==0: $VBoxContainer/PlayButton.text = "> PLAY"
	else: $VBoxContainer/PlayButton.text = "  PLAY"
	
	if sel_button==1: $VBoxContainer/Label.text = "> ESCAPE"
	else: $VBoxContainer/Label.text = " ESCAPE"

func _draw() -> void:
	#draw_line(Vector2(0, 0), Vector2(500, 500), Color.RED, 5.0)
	for i in Global.lines:
		draw_line(i[0], i[1], Color.RED, 2.0, true)
