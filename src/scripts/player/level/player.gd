extends CharacterBody2D

var spd = 100.0
var jumpspd = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var flipped = false
var spriteframe = 0
var spritetype = 0
@onready var sprite = $player_sprite
@onready var claw = $claw

func _process(delta):

	if not is_on_floor():
		velocity.y+=gravity*delta
	
	# movement
	if Input.is_action_just_pressed("movement_jump") and is_on_floor():
		velocity.y = jumpspd
		
	if Input.is_action_pressed("movement_left"):
		flipped = true
		velocity.x=spd*-60*delta
		
	elif Input.is_action_pressed("movement_right"):
		flipped = false
		velocity.x=spd*60*delta
	else:
		velocity.x = 0
	
	# flip to properly display
	if flipped:
		scale.y = -1
		rotation_degrees = 180
	else:
		scale.y = 1
		rotation_degrees = 0
	
	# sprint
	if Input.is_action_pressed("movement_sprint") and (Input.is_action_pressed("movement_left") or Input.is_action_pressed("movement_right")): # sprint
		if spd < 250.0:
			spd+=90*delta
			jumpspd-=75*delta
		else:
			spd = 250
	else:
		spd=100.0
		jumpspd=-400.0
	
	# sprite frame
	if spriteframe>=7.75:
		spriteframe=0
	else:
		spriteframe+=0.25
	
	# detect what sprite type to use
	if velocity.y>0: # falling
		spritetype=8
	elif velocity.y<0: # jumping
		spritetype=6
	elif velocity.x>=200 or velocity.x<=-200: # sprinting
		spritetype=4
	elif velocity.x!=0: # walking
		spritetype=2
	else: # idle
		spritetype=0
	
	if claw.claw_extended: # change to remove arm for claw
		spritetype+=1
	
	sprite.frame_coords=Vector2i(floor(spriteframe),spritetype)
	
	# move
	move_and_slide()
