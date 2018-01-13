extends StaticBody2D

signal shot

func _ready():
	print("Hello")

func _physics_process(delta):
	var space_state = get_world_2d().get_direct_space_state()
	# use global coordinates, not local to node
	var result = space_state.intersect_ray( position, Vector2(position.x, position.y + 200), [self])
	if (not result.empty()):
		emit_signal("shot")
		print("Hit at point: ",result.position)