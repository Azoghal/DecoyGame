extends VBoxContainer

var settings: Settings
@export var show_exit:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	settings = get_node("/root/Settings")
	if not show_exit:
		$Exit.visible = false
	setup_from_settings()

func setup_from_settings():
	$HBoxContainer3/MasterMute.button_pressed = not settings.master_mute
	$HBoxContainer/MusicMute.button_pressed = not settings.music_mute
	$HBoxContainer2/SFXMute.button_pressed = not settings.sfx_mute
	$HBoxContainer4/MenuMute.button_pressed = not settings.menu_mute
	$HBoxContainer3/MasterSlider.value = settings.master_level
	$HBoxContainer/MusicSlider.value = settings.music_level
	$HBoxContainer2/SFXSlider.value = settings.sfx_level
	$HBoxContainer4/MenuSlider.value = settings.menu_level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_down():
	print("Exiting, but I don't yet know what to do!")

func _on_master_mute_toggled(button_pressed):
	settings.set_master_mute(not button_pressed)


func _on_music_mute_toggled(button_pressed):
	settings.set_music_mute(not button_pressed)


func _on_sfx_mute_toggled(button_pressed):
	settings.set_sfx_mute(not button_pressed)
	

func _on_menu_mute_toggled(button_pressed):
	settings.set_menu_mute(not button_pressed)


func _on_master_slider_value_changed(value):
	settings.set_master_level(value)


func _on_music_slider_value_changed(value):
	settings.set_music_level(value)


func _on_sfx_slider_value_changed(value):
	settings.set_sfx_level(value)


func _on_menu_slider_value_changed(value):
	settings.set_menu_level(value)
