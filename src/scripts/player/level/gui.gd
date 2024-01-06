extends Node2D

# appearance
@onready var player=$".."
@onready var label_score=$score
@onready var label_power=$power
@onready var background=$gui_background
@onready var savegame_vars=get_node("/root/savegame_load")

func _process(_delta):
	# fix appearance
	background.scale.x=ProjectSettings.get_setting("display/window/size/viewport_width")
	background.position.x=0-(ProjectSettings.get_setting("display/window/size/viewport_width"))
	label_score.text="Score: "+str(savegame_vars.player_score)
	label_power.text="Power: "+str(savegame_vars.player_power)
	
	# stop weird flipping thing
	if player.flipped:
		scale.x=-1
	else:
		scale.x=1
