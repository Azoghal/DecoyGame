extends Node2D

var badboi =  preload("res://game_objects/EnemyBoy.tscn")
var pointer = preload("res://game_objects/pointer.tscn")
var parent_of_spawned = self
var target_of_spawned
@export var wave_size = 10
@export var time_interval = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = time_interval
	$Timer.start()
	
func initialise(parent_of_spawned:Node2D):
	self.parent_of_spawned = parent_of_spawned

func spawn_bois():
	var wave_colour = GameInfo.random_colour()
	for i in range(wave_size):
		var b = badboi.instantiate()
		b.initialise(wave_colour)
		$Path2D/PathFollow2D.progress_ratio = randf()
		parent_of_spawned.add_child(b)
		b.position = $Path2D/PathFollow2D.global_position
		if target_of_spawned:
			b.movement_target_object = target_of_spawned 
			b.go_to_object = true
		if i == 0:
			var p = pointer.instantiate()
			parent_of_spawned.add_child(p)
			p.initialise(b)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_bois()
	#queue_free()
