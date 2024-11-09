extends CharacterBody2D

var speed: float = 100
var accel = 10
var target 

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:
	find_target()
	if target != null: 
		var direction = Vector2()
		navigation_agent_2d.target_position = target.global_position
		
		direction = navigation_agent_2d.get_next_path_position() - global_position
		direction = direction.normalized()
		
		velocity = velocity.lerp(direction * speed, accel * delta)
	move_and_slide()

func find_target(): 
	if get_tree().get_nodes_in_group("base") != null: 
		target = get_tree().get_first_node_in_group("base")
