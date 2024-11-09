extends Node2D

var level_1
var current_wave = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_wave():
	
	var wave = level_1[current_wave]
	for monster in wave:
		var monster_count = monster[1]
		match monster[0]:
			Enums.MonsterType.CLUMPS:
				for x in range(monster_count):
					var clumps = Globals.CLUMP.instantiate()
					add_child(clumps)
					await get_tree().create_timer(0.5).timeout
		 
func _on_spawn_interval_timeout() -> void:
	spawn_wave()

func initialize_level():
	level_1 = WaveManager.level_1
