extends Area2D

@export var active: bool = true
signal player_exit

func _process(delta): pass
	#print(self.visible)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player" and active:
		player_exit.emit()
