extends Control

@export var lvl: String = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file(lvl)
	if event.is_action_pressed("back"):
		get_tree().change_scene_to_file("") #TODO ADD MAINMENU
