extends Node2D

@export var dist_threshold = 100
@export var target_boy: Node2D
var do_ray = true
var gone = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.visible = false
	pass

func initialise(target: Node2D, pos):
	self.target_boy = target
	GameInfo.set_colour(self, target.colour)
	self.position = Vector2(get_viewport_rect().size/2)
	$RayCast2D.target_position = pos - self.position
	
func _physics_process(delta):
	if do_ray:
		do_ray = false
		$RayCast2D.force_raycast_update()
		var hit = $RayCast2D.get_collider()
		var hit_position = $RayCast2D.get_collision_point()
		if hit:
			print("I hit ", hit.name, hit_position)
			$Sprite2D.visible = true
			self.position = hit_position
			self.look_at(self.position + $RayCast2D.target_position)
		else: 
			print("Miss")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_deactivate_area_body_entered(body):
	if body.is_in_group("Enemy") and not gone:
		gone = true
		self.queue_free()
