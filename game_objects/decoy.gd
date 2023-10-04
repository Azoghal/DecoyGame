extends Node2D

@export var active: bool = false
@export var colour: GameInfo.COLOUR

@export var max_time_before_explode: float = 15.0
@export var enemy_count_to_explode:int = 5
@export var fuse_time: float = 3
var fuse_started:bool = false
var current_enemies = {} # of the right colour - to work out when to explode
var in_range_enemies = {} # of any colour - to harm when exploding
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func initialise(col: GameInfo.COLOUR, pos:Vector2):
	self.position = pos
	self.colour = col
	GameInfo.set_colour(self,colour)
	toggle_active(active)
	$ExplodeTimer.wait_time = max_time_before_explode
	$FuseTimer.wait_time = fuse_time

func toggle_active(value:bool):
	active = value
	$ringParticles.visible = value
	
func start_fuse():
	$FuseTimer.start()
	fuse_started = true
	self.modulate = Color.DARK_RED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not fuse_started and len(self.current_enemies) >= self.enemy_count_to_explode:
		print("starting fuse")
		start_fuse()

func _on_taunt_area_body_entered(body):
	if body.is_in_group("Enemy"):
		if body.colour == self.colour:
			body.set_movement_target_object(self)
			$tauntsound.play()


func _on_hurt_box_body_entered(body):
	print("Adding an enemy")
	if body.is_in_group("Enemy"):
		in_range_enemies[body] = true
		if body.colour == self.colour:
			current_enemies[body] = true


func _on_hurt_box_body_exited(body):
	print("Removing an enemy")
	if current_enemies.has(body):
		current_enemies.erase(body)
	if in_range_enemies.has(body):
		in_range_enemies.erase(body)


func _on_explode_timer_timeout():
	print("Should start fuse unless fuse active")
	if not fuse_started:
		start_fuse()


func _on_fuse_timer_timeout():
	print("Exploding!")
	self.visible = false
	for enemy in in_range_enemies:
		enemy.take_damage(20)
	self.queue_free()
	
