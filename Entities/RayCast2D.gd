extends RayCast2D

func _physics_process(delta):
	var space_state = get_world().get_direct_space_state()
	# use global coordinates, not local to node
	var result = space_state.intersect_ray( Vector2(0,0), Vector2(50,100) )
	
	if (not result.empty()):
		print("Hit at point: ",result.position)