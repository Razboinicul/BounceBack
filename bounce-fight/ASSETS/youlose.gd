extends Control

@export var lvl: String = "res://gen_level.tscn"

func _ready() -> void:
	$Label2.text = "Died "+str(Global.lvl)+" fights in. Cruel."

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file(lvl)
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu.tscn") #DONE TODO ADD MAINMENU
