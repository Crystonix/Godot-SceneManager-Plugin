@tool
extends EditorPlugin

const AUTOLOAD_NAME = "Manager"

var sceneManager

func _enter_tree():
	add_custom_type("CustomScene", "Resource", preload("res://addons/scenemanager/custom_scene.gd"), preload("res://icon.svg"))
	
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/scenemanager/manager.tscn")
	
	sceneManager = preload("res://addons/scenemanager/scene_manger.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BR, sceneManager)


func _exit_tree():
	remove_custom_type("CustomScene")
	remove_autoload_singleton(AUTOLOAD_NAME)
	
	remove_control_from_docks(sceneManager)
	sceneManager.queue_free()
	
