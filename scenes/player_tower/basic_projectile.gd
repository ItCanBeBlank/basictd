extends Node2D

var speed:float = 200
var target
var direction 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_to_target(delta)

func move_to_target(delta):
	if target != null and direction == null:
		direction = global_position.direction_to(target)
	if target !=null and direction != null:
		position = position + direction * speed * delta

func _on_lifetime_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
	queue_free()
