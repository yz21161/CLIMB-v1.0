extends CanvasLayer
@onready var control = $Control
@onready var how_to_play = $"HOW TO PLAY"
@onready var level = $"../level"



func _on_button_start_pressed():
	control.visible = false
	how_to_play.visible = false
	level.visible = true

func _on_button_how_pressed():
	control.visible = false
	how_to_play.visible = true
	level.visible = false

func _on_button_back_pressed():
	control.visible = true
	how_to_play.visible = false
	level.visible = false

func _on_button_main_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_button_casual_pressed():
	get_tree().change_scene_to_file("res://casual.tscn")



func _on_button_challenge_pressed():
	get_tree().change_scene_to_file("res://World1.tscn")
