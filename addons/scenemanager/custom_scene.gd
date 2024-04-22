extends Resource

class_name CustomScene

var name:String = "no_name"
var path:String = "no_path"

func _init(scene_path:String):
	path = scene_path
	name = path.get_file().get_basename()
