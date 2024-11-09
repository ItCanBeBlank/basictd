extends Node2D

@onready var attack_cooldown_timer: Timer = $AttackCooldownTimer

var enemy_in_range = []
var attack_ready = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attack()

func _on_area_2d_body_entered(body: Node2D) -> void:
	enemy_in_range.append(body)
	print(enemy_in_range)

func _on_area_2d_body_exited(body: Node2D) -> void:
	enemy_in_range.erase(body)
	print(enemy_in_range)

func attack():
	if enemy_in_range.size() != 0:
		if attack_ready:
			attack_ready = false
			var target_position = enemy_in_range[0].global_position
			var projectile = Globals.BASIC_PROJECTILE.instantiate()
			add_child(projectile)
			attack_cooldown_timer.start()

func _on_attack_cooldown_timer_timeout() -> void:
	attack_ready = true
	
