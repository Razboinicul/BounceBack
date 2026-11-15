extends Node2D

func _player_exit() -> void:
	get_tree().change_scene_to_file("res://tutorials/Tutorial 2.tscn")
