extends Area2D

export (int) var REQUIRED_PICKUPS

func _on_Exit_body_entered( body ):
	if (body.num_picks >= REQUIRED_PICKUPS):
		emit_signal("unlocked")
		HUD.next_level_notice("You reached the next level")
	else:
		HUD.next_level_notice("Not enough scrap to leave")
