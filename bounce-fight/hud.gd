extends Control

func update_ui(health: int, _ammo: int):
	$Label.text = "FIGHT "+str(Global.lvl)
	$HealthBar.update_health(health)
	$AmmoLabel.text = "Ammo\n"+"inf/100"#str(ammo)+"/100"
