@tool
extends Resource

class_name CustomScene

@export var name:String = "no_name"
@export var path:String = "no_path"

func _init(scene_path:String = ""):
	name = scene_path.get_file().get_basename()
	path = scene_path
