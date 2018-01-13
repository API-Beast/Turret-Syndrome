extends KinematicBody2D

export (int) var SPEED  # how fast the player will move (pixels/sec)
var dead = false
var dead_timer = 0.0
var start_pos = Vector2(0, 0)
var num_picks = 0

func _ready():
	start_pos = position

func kill():
	$Sprite.frame = 3
	dead = true
	
func revive():
	dead = false
	position = start_pos
	dead_timer = 0.0
	$Sprite.frame = 0
	for node in get_tree().get_nodes_in_group("pickup"):
		node.reset()

func pickup_item(item):
	num_picks += 1
	HUD.update_pickup_label(num_picks)

func _process(delta):
	if dead:
		dead_timer += delta
		if dead_timer > 0.5:
			revive()
		return
	
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Sprite.frame = 1
		$Sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Sprite.frame = 1
		$Sprite.flip_h = true
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$Sprite.frame = 0
		$Sprite.flip_h = false
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$Sprite.frame = 2
		$Sprite.flip_h = false
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		#$AnimatedSprite.play()
	#else:
		#$AnimatedSprite.stop()
		
	#position += velocity * delta
	var movement = velocity*delta
	move_and_slide(velocity)
	#move_and_collide(Vector2(movement.x, 0))
	#move_and_collide(Vector2(0, movement.y))
	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y)
