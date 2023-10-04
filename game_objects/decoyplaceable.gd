extends Node2D

var colour : GameInfo.COLOUR
var decoy = preload("res://game_objects/decoy.tscn")
var placeable = false

signal placed

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = get_global_mouse_position()
	placeable=false

func initialise(col: GameInfo.COLOUR):
	colour = col
	GameInfo.set_colour(self, self.colour)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()
	if Input.is_action_just_pressed("Place") and placeable:
		$PlaceSound.play()
		place()
	if Input.is_action_just_pressed("StopPlace"):
		$StopPlaceSound.play()
		self.visible = false
		placeable = false
		$QueueFreeTimer.start()

func place():
	var placed_decoy = decoy.instantiate()
	placed_decoy.initialise(self.colour, self.position)
	self.get_parent().add_child(placed_decoy)
	placed_decoy.toggle_active(true)
	self.visible = false
	placeable = false
	$QueueFreeTimer.start()
	placed.emit()
	


func _on_placeable_timer_timeout():
	placeable = true


func _on_queue_free_timer_timeout():
	queue_free()
