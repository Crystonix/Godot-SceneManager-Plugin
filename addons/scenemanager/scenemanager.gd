@tool
extends EditorPlugin

const AUTOLOAD_NAME = "Manager"

func _enter_tree():
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/scenemanager/manager.tscn")


func _exit_tree():
	remove_autoload_singleton(AUTOLOAD_NAME)
	
