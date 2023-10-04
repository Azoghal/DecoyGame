extends Node

var spawners = []

var decoy_placeable = preload("res://game_objects/decoyplaceable.tscn")
var enemy_spawner = preload("res://game_objects/EnemySpawner.tscn")

var current_spawner_count = 5

var holding_decoy:bool = false
var held_decoy

func _ready():
	call_deferred("spawner_setup")
	
func spawner_setup():
	for i in range(current_spawner_count):
		var spawner = enemy_spawner.instantiate()
		$Node2D/World/SpawnerPath/SpawnerPathFollow.progress_ratio = randf()
		$Node2D/World.add_child(spawner)
		spawner.position = $Node2D/World/SpawnerPath/SpawnerPathFollow.global_position
		spawner.initialise()
		spawners.append(spawner)
	for s in spawners:
		s.parent_of_spawned = $Node2D/World
		s.target_of_spawned = $Node2D/World/base
	
func _process(delta):
	pass

func _on_shop_picked_decoy(col: int):
	print(GameInfo.colournames[col], "signal recieved")
	if not holding_decoy:
		var placeable = decoy_placeable.instantiate()
		held_decoy = placeable
		placeable.initialise(col)
		$Node2D/World.add_child(placeable)
		placeable.connect("placed", func():self.holding_decoy = false)
		holding_decoy = true
	if holding_decoy and held_decoy:
		# reinitialise to change colour
		held_decoy.initialise(col)
