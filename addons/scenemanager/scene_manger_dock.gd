@tool
extends PanelContainer

@export var sceneNamesLabel:RichTextLabel

func _ready():
	Manager.update_ui.connect(_on_update_ui)

func _on_add_current_scene_button_pressed():
	Manager.add_scene(EditorInterface.get_edited_scene_root().scene_file_path)
	update_sceneNamesLabel()
	print("added current scene: ",EditorInterface.get_edited_scene_root().scene_file_path)

func update_sceneNamesLabel():
	sceneNamesLabel.set_text(Manager.getSceneNames())
	
func _on_update_ui():
	update_sceneNamesLabel()

func _on_clear_all_scenes_button_button_down():
	Manager.clearAllScenes()
