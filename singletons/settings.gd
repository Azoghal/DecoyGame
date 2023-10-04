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

var config = ConfigFile.new()

var audio_manager: AudioManager

signal modified_settings

func _ready():
	load_settings()
	audio_manager = get_node("/root/AudioManager")
	self.connect("modified_settings", save_settings)
	
func set_master_mute(value:bool):
	master_mute = value
	audio_manager.set_master_mute(master_mute)
	modified_settings.emit()
	
func set_music_mute(value:bool):
	music_mute = value
	audio_manager.set_music_mute(music_mute)
	modified_settings.emit()
	
func set_sfx_mute(value:bool):
	sfx_mute = value
	audio_manager.set_sfx_mute(sfx_mute)
	modified_settings.emit()
	
func set_menu_mute(value:bool):
	menu_mute = value
	audio_manager.set_menu_mute(menu_mute)
	modified_settings.emit()
	
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

func save_settings():
	config.set_value("MasterSound", "mute", self.master_mute)
	config.set_value("MasterSound", "level", self.master_level)	
	config.set_value("MusicSound","mute", self.music_mute)
	config.set_value("MusicSound","level", self.music_level)
	config.set_value("SfxSound","mute", self.sfx_mute)
	config.set_value("SfxSound","level", self.sfx_level)
	config.set_value("MenuSound","mute", self.menu_mute)
	config.set_value("MenuSound","level", self.menu_level)
	config.save("user://settings.cfg")

func load_settings():
	# Load settings from file
	var err = config.load("user://settings.cfg")
	if err != OK:
		return 
	master_mute = config.get_value("MasterSound", "mute", false)
	master_level = config.get_value("MasterSound", "level", 100)
	music_mute = config.get_value("MusicSound","mute",false)
	music_level = config.get_value("MusicSound","level", 50)
	sfx_mute = config.get_value("SfxSound","mute",false)
	sfx_level = config.get_value("SfxSound","level", 50)
	menu_mute = config.get_value("MenuSound","mute",false)
	menu_level = config.get_value("MenuSound","level", 50)
