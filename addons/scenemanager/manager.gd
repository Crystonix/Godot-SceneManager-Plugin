@tool
extends Node

var collection:SceneCollection

const resPath:String = "res://addons/scenemanager/Resources/scenesResource.tres"
var main_scene = null

signal scene_changed
signal update_ui

func _enter_tree():
	loadCollection(resPath)
	emit_signal("update_ui")

func _ready():
	scene_changed.connect(_on_scene_changed)	
	main_scene = get_tree().get_current_scene()

#region editor functionality
func getSceneNames() -> String:
	return collection.get_scene_names()

func add_scene(path:String):
	collection.add_Scene(path)
	emit_signal("update_ui")

func clearAllScenes():
	collection.scenesDictionary.clear()
	emit_signal("update_ui")

func loadCollection(path:String):
	var res = load(path)
	if !res:
		print_debug("Collection not found, creating a new one...")
		collection = SceneCollection.new()
		saveCollection(collection, resPath)
	else:
		collection = res
		print_debug("scene res load success")
		
func saveCollection(col:SceneCollection = collection, path:String = resPath):
	assert(col, "collection is null")
	var result = ResourceSaver.save(col, path)
	if result != OK:
		print_debug("Failed to save resource:", result, " creating new one")
	else:
		print_debug("successfully saved")
		
#endregion

#region in-game functionality
func switch_scene(current:String, target_scene:String):
	if collection.scenesDictionary.has(target_scene):
		var cScene:CustomScene = collection.scenesDictionary.get(target_scene)
		get_tree().change_scene_to_file(cScene.path)
		emit_signal("scene_changed")
	else:
		printerr(target_scene," scene not in sceneDictionary")
	
func _on_scene_changed():
	await get_tree().create_timer(0.1).timeout 
	print_debug("current_scene: ", get_tree().get_current_scene())
#endregion

func _exit_tree():
	saveCollection(collection,resPath)
