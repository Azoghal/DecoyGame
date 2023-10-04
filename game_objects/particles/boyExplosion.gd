extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = $CPUParticles2D.lifetime
	$CPUParticles2D.restart()
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	self.queue_free()
