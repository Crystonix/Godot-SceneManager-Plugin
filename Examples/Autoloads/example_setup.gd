extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.add_scene("res://Examples/Scenes/main/main.tscn")
	Manager.add_scene("res://Examples/Scenes/game/game.tscn")
	Manager.add_scene("res://Examples/Scenes/pause/pause.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
