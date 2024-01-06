extends CharacterBody2D

var spd=100
var spriteframe=0
var spritetype=0
@onready var sprite=$player_sprite

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
	
	# sprite frame
	if spriteframe>=3.9:
		spriteframe=0
	else:
		spriteframe+=0.1
	
	# decide sprite
	if velocity.x>0:
		spritetype=1
	elif velocity.x<0:
		spritetype=2
	elif velocity.y>0:
		spritetype=3
	elif velocity.y<0:
		spritetype=0
	else:
		spriteframe=0
	
	# load sprite
	sprite.frame_coords=Vector2i(floor(spriteframe),spritetype)
	
	move_and_slide()
