extends Control

func update_ui(health: int, ammo: int):
	#$Health.value = health
	$HealthBar.update_health(health)
	$AmmoLabel.text = "Ammo\n"+"inf/100"#str(ammo)+"/100"
