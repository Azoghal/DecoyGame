extends Node2D

@export var health:int = 2000
@export var max_health:int = 2000

var health_bar
var dead

signal base_damaged(int) # use for camera shake?

# Called when the node enters the scene tree for the first time.
func _ready():
#	health = max_health
	dead = health < 0
	health_bar = $HealthBar
	health_bar.max_value = max_health
	health_bar.min_value = 0
	health_bar.value = health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(amount: int):
	# add multipliers etc
	if not dead:
		self.health = self.health-amount
		base_damaged.emit(amount)
		health_bar.value = health
		$hitsound.play()
		if self.health < 0:
			print("Base done got dead")
			$deadsound.play()
			dead = true
		

	
func _on_hitbox_area_entered(area):
	print("Base done got hit")
	if area.is_in_group("Enemy"):
		take_damage(10)
		area.queue_free()

func _on_hitbox_body_entered(body):
	print("Base done got hit")
	if body.is_in_group("Enemy"):
		take_damage(10)
		body.queue_free()

