@tool
extends EditorPlugin

const AUTOLOAD_NAME = "Manager"

var sceneManager

func _enter_tree():
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/scenemanager/manager.tscn")
	
	sceneManager = preload("res://addons/scenemanager/scene_manger.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BR, sceneManager)


func _exit_tree():
	remove_autoload_singleton(AUTOLOAD_NAME)
	
	remove_control_from_docks(sceneManager)
	sceneManager.queue_free()
	
