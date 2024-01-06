extends Area2D

# level to load
# in the editor levelid should be the level's scene in relation to res://scenes/scenes/levels/
@export var levelid : String = ""

func _process(_delta):
	if has_overlapping_bodies(): # when the player is near
		if Input.is_action_pressed("control_enter"):
			if levelid != null and typeof(levelid) == TYPE_STRING:
				get_tree().change_scene_to_file("res://scenes/scenes/levels/" + str(levelid))
			else:
				print("invalid levelid: ", levelid)
