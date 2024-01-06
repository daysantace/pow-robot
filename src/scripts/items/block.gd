extends Area2D

var spriteframe=0
@onready var sprite = $sprite
@onready var savegame_vars=get_node("/root/savegame_load")

func _process(delta):
	# sprite
	if spriteframe<11.75:
		spriteframe+=0.25
	else:
		spriteframe=0
	sprite.frame_coords=Vector2i(floor(spriteframe),0)

func _on_area_entered(area):
	savegame_vars.player_score+=100
	queue_free()
