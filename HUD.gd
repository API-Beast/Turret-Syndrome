extends CanvasLayer

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func update_pickup_label(score):
    $PickupLabel.text = str("Pickups: ", score)
