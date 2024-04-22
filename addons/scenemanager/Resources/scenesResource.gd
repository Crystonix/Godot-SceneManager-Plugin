@tool
extends Resource

class_name SceneCollection

@export var scenesDictionary:Dictionary # name:CustomScene

func _init():
	scenesDictionary = {"default": CustomScene.new("no_path")}

func get_scene_names() -> String:
	var keys:Array = scenesDictionary.keys()
	var keys_string:String = ""
	for key in keys:
		keys_string += key + ", "
	keys_string = keys_string.rstrip(", ")
	return keys_string

func add_Scene(path:String):
	var new_scene:CustomScene = CustomScene.new(path)
	scenesDictionary[new_scene.name] = new_scene

func remove_scene(scene_name:String):
	var result = scenesDictionary.erase(scene_name)
	if result != OK:
		print_debug("failed to erase: ", scene_name)
	else:
		print_debug("successfully erased: ", scene_name)

