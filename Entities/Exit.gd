extends Area2D

signal unlocked

export (int) var REQUIRED_PICKUPS

func _on_Exit_body_entered( body ):
	if (body.num_picks >= REQUIRED_PICKUPS):
		emit_signal("unlocked")
