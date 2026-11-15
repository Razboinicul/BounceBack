extends Node2D

func _process(delta: float) -> void:
	$Hud.update_ui($Player.health, $Player/G/Gun.total_bullets)

func _on_exit_player_exit() -> void:
	get_tree().quit()
