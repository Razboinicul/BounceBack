extends Control

func update_ui(health: int, ammo: int):
	$Health.value = health
	$AmmoLabel.text = "Ammo\n"+str(ammo)+"/100"
