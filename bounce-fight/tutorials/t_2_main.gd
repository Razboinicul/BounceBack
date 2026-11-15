extends Node2D

func _process(delta: float) -> void:
	$OBJS/Exit.active = $Enemies.get_children()==[]
	$Hud.update_ui($Player.health, $Player/G/Gun.total_bullets)

func _on_exit_player_exit() -> void:
	get_tree().change_scene_to_file("res://ASSETS/INTRO.tscn")
