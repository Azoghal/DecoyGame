@tool
extends Node2D

@export var particle_size:float = 1
@export var circle_size:float = 200
@export var particle_count = 40
var circle_default_size:float = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.position = Vector2(-circle_size/2,-circle_size/2)
	$CPUParticles2D.scale = Vector2(circle_size/circle_default_size,circle_size/circle_default_size)
	$CPUParticles2D.scale_amount_max=particle_size
	$CPUParticles2D.scale_amount_min=particle_size
	$CPUParticles2D.amount = particle_count


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$CPUParticles2D.position = Vector2(-circle_size/2,-circle_size/2)
		$CPUParticles2D.scale = Vector2(circle_size/circle_default_size,circle_size/circle_default_size)
		$CPUParticles2D.scale_amount_max=particle_size
		$CPUParticles2D.scale_amount_min=particle_size
		$CPUParticles2D.amount = particle_count
