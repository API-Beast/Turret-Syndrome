extends Area2D

export var needed_keys = 3
export var next_level = ""

func _ready():
	connect("body_entered", self, "on_player_entered")

func on_player_entered(player):
	if player.num_picks >= needed_keys:
		get_tree().change_scene(next_level)