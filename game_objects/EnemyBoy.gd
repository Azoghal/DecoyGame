extends CharacterBody2D

@export var movement_speed: float = 100.0
@export var movement_target_position: Vector2 = Vector2(0,0)
@export var movement_target_object: Node2D
@export var go_to_object: bool = false

@export var health: int = 10

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@export var colour: GameInfo.COLOUR

var particles = preload("res://game_objects/particles/boyExplosion.tscn")
# https://natureofcode.com/book/chapter-6-autonomous-agents/

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 12.0
	navigation_agent.target_desired_distance = 12.0
	
	# Make sure to not await during _ready.
	call_deferred("actor_setup")
	
func initialise(colour: GameInfo.COLOUR):
	self.colour = colour
	GameInfo.set_colour(self, colour)

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	# Now that the navigation map is no longer empty, set the movement target.
	refresh_movement_target()

func refresh_movement_target():
	navigation_agent.target_position = movement_target_object.position if go_to_object else movement_target_position

func set_movement_target_object(ob: Node2D):
	self.movement_target_object = ob
	self.go_to_object = true
	refresh_movement_target()
	
func take_damage(dmg:int):
	# TODO add any scaling
	self.health -= dmg
	if health <= 0:
		die()

func die():
	var parts = particles.instantiate()
	parts.position = self.position
	parts.modulate = self.modulate
	print("Adding parts")
	get_parent().add_child(parts)
	self.queue_free()

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
		
	# TODO: do Boidilicious stuff

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed

	velocity = new_velocity
	$Sprite2D.look_at(self.position + velocity)
	move_and_slide()



