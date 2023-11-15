extends StaticBody2D

var claw_extended = false
var claw_length = 1
var extend_dir = 1
@onready var player = get_parent()

func _ready():
	self.scale = Vector2(claw_length, 1)
	return
	
func _process(delta):
	if claw_extended:
		# extend and retract the claw
		claw_length += 180 * delta * extend_dir
		if claw_length >= 30:
			extend_dir = -1
		if claw_length <= 1:
			extend_dir = 1
			claw_extended = false
			
	else: # look at mouse
		self.look_at(get_global_mouse_position())

	self.scale = Vector2(claw_length, 1)
	
	if claw_extended: # make claw invisible when unextended
		self.visible = true
	else:
		self.visible = false
	
	if player: # handle left/right postioning
		if player.scale.x == -1:
			self.position=player.position-Vector2(claw_length,0)
		else:
			self.position=player.position+Vector2(20,0)
			
	if Input.is_action_just_pressed("claw_extended"): # when claw extends
		claw_extended = true
		claw_length = 2
	
	self.global_position = player.global_position-Vector2(-4*player.scale.y,1)
