extends Area2D

signal pickup

var was_picked = false

func _ready():
	pass

func _process(delta):
	pass

func _on_Item_body_entered( body ):
	if not was_picked:
		hide()
		body.pickup_item(self)
		was_picked = true

func reset():
	was_picked = false
	show()