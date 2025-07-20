extends Node

var points = 0
@onready var label: Label = $"../Ui/TextureRect/Label"

func game_over():
	get_tree().reload_current_scene()

func add_point():
	points += 1
	label.text = str(points)
