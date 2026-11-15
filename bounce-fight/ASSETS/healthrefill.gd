extends Area2D

var hup = 0
var rng = RandomNumberGenerator.new()

func _ready() -> void: hup = rng.randi_range(3, 30)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name.contains("Player"):
		body.health += hup;self.queue_free()
