extends Node

var sound_channels = ["master", "music", "sfx"]

var master_mute = false
var music_mute = false
var sfx_mute = false
var menu_mute = false

var master_level: int = 100
var music_level: int = 50
var sfx_level: int = 50
var menu_level: int = 50

var audio_manager: AudioManager

func _ready():
	audio_manager = get_node("/root/AudioManager")
	
func set_master_mute(value:bool):
	master_mute = value
	audio_manager.set_master_mute(master_mute)
	
func set_music_mute(value:bool):
	music_mute = value
	audio_manager.set_music_mute(music_mute)
	
func set_sfx_mute(value:bool):
	sfx_mute = value
	audio_manager.set_sfx_mute(sfx_mute)
	
func set_menu_mute(value:bool):
	menu_mute = value
	audio_manager.set_menu_mute(menu_mute)
	
func set_master_level(value:int):
	master_level = value
	audio_manager.set_master_level(master_level)
	
func set_music_level(value:int):
	music_level = value
	audio_manager.set_music_level(music_level)
	
func set_sfx_level(value:int):
	sfx_level = value
	audio_manager.set_sfx_level(sfx_level)

func set_menu_level(value:int):
	menu_level = value
	audio_manager.set_menu_level(menu_level)
