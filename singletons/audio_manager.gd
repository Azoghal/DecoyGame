extends Node

var master_index = AudioServer.get_bus_index("Master")
var music_index = AudioServer.get_bus_index("Music")
var sfx_index = AudioServer.get_bus_index("SFX")
var menu_index = AudioServer.get_bus_index("Menu")

func set_master_mute(value:bool):
	AudioServer.set_bus_mute(master_index, value)

func set_music_mute(value:bool):
	AudioServer.set_bus_mute(music_index, value)
	
func set_sfx_mute(value:bool):
	AudioServer.set_bus_mute(sfx_index, value)
	
func set_menu_mute(value:bool):
	AudioServer.set_bus_mute(menu_index, value)
	
# HELPER TO MAP VOLUMES
func map_volume_range_to_db(volume:int, min:int=0, max:int=100):
	return remap(volume, min, max, -72, 0)
	
func set_master_level(value:int):
	var mapped_volume = map_volume_range_to_db(value)
	AudioServer.set_bus_volume_db(master_index, mapped_volume)
	
func set_music_level(value:int):
	var mapped_volume = map_volume_range_to_db(value)
	AudioServer.set_bus_volume_db(music_index, mapped_volume)

func set_sfx_level(value:int):
	var mapped_volume = map_volume_range_to_db(value)
	AudioServer.set_bus_volume_db(sfx_index, mapped_volume)
	
func set_menu_level(value:int):
	var mapped_volume = map_volume_range_to_db(value)
	AudioServer.set_bus_volume_db(menu_index, mapped_volume)
