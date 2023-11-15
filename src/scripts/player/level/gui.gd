extends Node2D

func _ready():
	pass

func _process(delta):
	# fix appearance
	scale.x=ProjectSettings.get_setting("display/window/size/viewport_width")
