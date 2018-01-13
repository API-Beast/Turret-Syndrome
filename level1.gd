extends Node2D

var pickups

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pickups = 0

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func item_pickup():
	pickups += 1
	$HUD.update_pickup_label(pickups)