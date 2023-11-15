extends CharacterBody2D

var spd=100

func _process(delta):
	# movement
	if Input.is_action_pressed("movement_left"):
		velocity.x=-60*spd*delta
	elif Input.is_action_pressed("movement_right"):
		velocity.x=60*spd*delta
	else:
		velocity.x=0
		
	if Input.is_action_pressed("movement_up"):
		velocity.y=-60*spd*delta
	elif Input.is_action_pressed("movement_down"):
		velocity.y=60*spd*delta
	else:
		velocity.y=0
	
	if velocity.x!=0 and velocity.y!=0: # make diagonal better, 1.412 ≈ sqrt(2)
		velocity/=1.412
		
	move_and_slide()
