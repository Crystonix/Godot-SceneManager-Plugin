@tool
extends Node

@export var sceneDictionary = {}

var main_scene = null

signal scene_changed

func _ready():
	scene_changed.connect(_on_scene_changed)
	
	main_scene = get_tree().get_current_scene()
	
	add_scene("res://Scenes/main/main.tscn")
	add_scene("res://Scenes/game/game.tscn")
	add_scene("res://Scenes/pause/pause.tscn")

#region editor functionality
func add_scene(scene_path:String):
	var scene_name = scene_path.get_file().get_basename()
	sceneDictionary[scene_name] = scene_path
	
func get_scene(scene_name:String):
	return sceneDictionary.get(scene_name, null)
	
func remove_scene(scene_name:String):
	if sceneDictionary.has(scene_name):
		sceneDictionary.erase(scene_name)
#endregion

#region in-game functionality
func switch_scene(current:String, target_scene:String):
	if sceneDictionary.has(target_scene):
		get_tree().change_scene_to_file(sceneDictionary.get(target_scene))
		emit_signal("scene_changed")
	else:
		printerr("current scene not in sceneDictionary")
	
func _on_scene_changed():
	await get_tree().create_timer(0.1).timeout 
	print("current_scene: ", get_tree().get_current_scene())
#endregion
