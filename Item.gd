extends Area2D

signal pickup

func _ready():
	pass

func _process(delta):
	pass

func _on_Item_body_entered( body ):
	hide()
	emit_signal("pickup")
	$CollisionShape2D.disabled = true
