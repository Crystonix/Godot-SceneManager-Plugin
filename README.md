# Godot-SceneManager-Plugin
 
How use this example:
	You can use the tab and esc key to switch Scenes (tab: MainMenu->Game->Pause->Game->... , esc: Game->MainMenu)

How to setup and use in your own project:
	1. enable this plugin -> the "Manager" script will automatically be added to your autoloads
	2. add your scene paths in the "Manager" script in the designated section (you can drag and drop the tscn files from the FileSystem EditorDock)
	3. add a script to your scene and trigger the switch_scene() function from the "Manger" autoload in response to an event (e.g. input)
