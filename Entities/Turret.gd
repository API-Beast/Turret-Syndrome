extends StaticBody2D

signal shot

var last_ray = Vector2(0, 0)

func _ready():
	print("Hello")
	
func _draw():
	draw_line(Vector2(0, 0), last_ray - global_position, Color(1.0, 0, 0, 0.25), 5, true)

func _physics_process(delta):
	var space_state = get_world_2d().get_direct_space_state()
	# use global coordinates, not local to node
	var ray = Vector2(position.x, position.y)+Vector2(0, 500).rotated($Gun.rotation)
	var result = space_state.intersect_ray( position, ray, [self], 1)
	
	last_ray = ray
	if (not result.empty()):
		var collider = result["collider"]
		if collider.has_method("kill"):
			collider.kill()
			if not $ShootAudio.playing:
				$ShootAudio.play()
		last_ray = result["position"]
	update()
		#emit_signal("shot")
		#print("Hit at point: ",result.position)