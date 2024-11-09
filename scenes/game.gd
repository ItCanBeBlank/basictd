extends Node2D
@onready var clump: CharacterBody2D = $Clump


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: 
		var mouse_position = get_global_mouse_position()
		clump.set_target(mouse_position)
