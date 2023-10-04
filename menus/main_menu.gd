extends Control

var tutorial_path = "res://levels/tutorial.tscn"
var credits_path = "res://menus/credits.tscn"
var level_paths = ["res://levels/forest_level_1.tscn", "res://levels/beach_level_2.tscn"]
var level_thumbnails = [preload("res://Assets/level1thumbnail.png"), preload("res://Assets/level2thumbnail.png")]
var current_level = 0 # load in from file?

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_level_select()

func setup_level_select():
	$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/LevelSelect.icon = level_thumbnails[current_level]
	var popup = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/LevelSelect.get_popup()
	popup.id_pressed.connect(_on_popup_item_selected)
	refresh_level_select(popup)

	
func refresh_level_select(popup):
	for i in range(0,popup.item_count):
		if popup.get_item_id(i) == self.current_level:
			popup.set_item_checked(i, true)
		else:
			popup.set_item_checked(i,false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_popup_item_selected(id:int):
	self.current_level = id
	setup_level_select()

func _on_start_button_down():
	# TODO: switch to using level select
	get_tree().change_scene_to_file(level_paths[current_level])


func _on_tutorial_button_down():
	get_tree().change_scene_to_file(tutorial_path)
	

func _on_credits_button_down():
	get_tree().change_scene_to_file(credits_path)


func _on_exit_button_down():
	get_tree().quit()
