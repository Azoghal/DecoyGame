extends Control

signal picked_decoy(int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("One"):
		_on_button_blue_button_down()
	if Input.is_action_just_pressed("Two"):
		_on_button_green_button_down()
	if Input.is_action_just_pressed("Three"):
		_on_button_red_button_down()

func _on_button_blue_button_down():
	print("BLUE PICKED")
	$ButtonSound.play()
	picked_decoy.emit(GameInfo.COLOUR.BLUE)


func _on_button_green_button_down():
	print("GREEN PICKED")
	$ButtonSound.play()
	picked_decoy.emit(GameInfo.COLOUR.GREEN)


func _on_button_red_button_down():
	print("RED PICKED")
	$ButtonSound.play()
	picked_decoy.emit(GameInfo.COLOUR.RED)
