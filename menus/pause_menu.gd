extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_pause():
	get_tree().paused = not get_tree().paused
	print("Toggle Pause Menu Visibility")
	$CenterContainer.visible = not $CenterContainer.visible
	
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		toggle_pause()

func _on_main_menu_button_down():
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_quit_button_down():
	get_tree().quit()


func _on_resume_button_down():
	toggle_pause()
