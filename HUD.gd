extends CanvasLayer

func _ready():
	$DeathLabel.hide()

func update_pickup_label(score):
    $PickupLabel.text = str("Pickups: ", score)

func game_over_notice():
	$DeathLabel.show()