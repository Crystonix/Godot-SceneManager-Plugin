@tool
extends Node

@export var scenesResource:sceneResource
@export var sceneDictionary:Dictionary = {}

const resPath:String = "res://addons/scenemanager/Resources/scenesResource.tres"
var main_scene = null

signal scene_changed

func _enter_tree():
	sceneDictionary = load_scenes()

func _ready():
	
	print_debug("data: ", sceneDictionary)
	
	scene_changed.connect(_on_scene_changed)
	
	main_scene = get_tree().get_current_scene()
	
	#add_scene("res://Scenes/main/main.tscn")
	#add_scene("res://Scenes/game/game.tscn")
	#add_scene("res://Scenes/pause/pause.tscn")

#region editor functionality
func add_scene(scene_path:String):
	print_debug("test dict print: ", scenesResource.scenesDictionary)
	var scene_name = scene_path.get_file().get_basename()
	scenesResource.scenesDictionary[scene_name] = scene_path
	saveResource(scenesResource)
	print(sceneDictionary)
	
func get_scene(scene_name:String):
	return sceneDictionary.get(scene_name, null)
	
func remove_scene(scene_name:String):
	if sceneDictionary.has(scene_name):
		sceneDictionary.erase(scene_name)
		
func get_scene_names() -> String:
	var keys:Array = sceneDictionary.keys()
	var keys_string:String = ""
	for key in keys:
		keys_string += key + ", "
	keys_string = keys_string.rstrip(", ")
	return keys_string
	
func load_scenes() -> Dictionary:
	var loaded_resource = preload(resPath)
	if loaded_resource:
		scenesResource = loaded_resource
		print("scene res load success")
		print(scenesResource.scenesDictionary)
		return loaded_resource.scenesDictionary
	else:
		print("Resource not found, creating a new one...")
		scenesResource = scenesResource.new()
		saveResource(scenesResource)
		return scenesResource.scenesDictionary
	
func saveResource(res:Resource):
	var error = ResourceSaver.save(scenesResource, resPath)
	if error != OK:
		print("Failed to create and save resource:", error)
	else:
		print("New resource created and saved successfully")
#endregion

#region in-game functionality
func switch_scene(current:String, target_scene:String):
	if sceneDictionary.has(target_scene):
		get_tree().change_scene_to_file(sceneDictionary.get(target_scene))
		emit_signal("scene_changed")
	else:
		printerr(target_scene," scene not in sceneDictionary")
	
func _on_scene_changed():
	await get_tree().create_timer(0.1).timeout 
	print("current_scene: ", get_tree().get_current_scene())
#endregion


func _on_property_list_changed():
	pass # Replace with function body.
