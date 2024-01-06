extends Area2D

var spriteframe=0
@onready var sprite = $sprite
@onready var savegame_vars=get_node("/root/savegame_load")

# for the power
@export var power : String = ""

func _process(delta):
	pass

func _on_area_entered(area):
	savegame_vars.player_score+=10
	savegame_vars.player_power=power
	queue_free()
