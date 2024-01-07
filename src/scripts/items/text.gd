extends Node

# text
@export var text : String = "" # text to display
@onready var label=$text

func _ready():
	label.text=text
