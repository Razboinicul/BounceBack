extends Node2D

func update_health(health: int):
	health = clamp(health, 0, 100)
	for i in range(1, 11):
		var heart_health = clamp(health - (i - 1) * 10, 0, 10)
		var node = get_node("H" + str(i))
		if heart_health >= 10:
			set_hearts(node, 0) # Full
		elif heart_health >= 5:
			set_hearts(node, 1) # Half
		else:
			set_hearts(node, -1) # Empty

func set_hearts(nod, half:int=0):
	if half == 0:
		nod.get_node("Fullheart").visible = true
		nod.get_node("Halfheart").visible = false
		nod.get_node("Emptyheart").visible = false
	elif half == 1:
		nod.get_node("Fullheart").visible = false
		nod.get_node("Halfheart").visible = true
		nod.get_node("Emptyheart").visible = false
	elif half == -1:
		nod.get_node("Fullheart").visible = false
		nod.get_node("Halfheart").visible = false
		nod.get_node("Emptyheart").visible = true
