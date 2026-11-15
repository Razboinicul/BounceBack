extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		$ONE.hide();$TWO.show();$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://gen_level.tscn")
