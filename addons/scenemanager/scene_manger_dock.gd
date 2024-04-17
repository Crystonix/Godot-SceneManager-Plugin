@tool
extends PanelContainer

@export var sceneNamesLabel:Label

func _on_add_current_scene_button_pressed():
	Manager.add_scene(EditorInterface.get_edited_scene_root().scene_file_path)
	update_sceneNamesLabel()
	print("added current scene: ",EditorInterface.get_edited_scene_root().scene_file_path)

func update_sceneNamesLabel():
	sceneNamesLabel.set_text(Manager.get_scene_names())
	
