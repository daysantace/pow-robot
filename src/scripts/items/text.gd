extends Node

# text
@export var text : String = ""
@onready var label=$text

func _process(_delta):
	label.text=text
