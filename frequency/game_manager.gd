extends Node
@onready var static_body_2d: StaticBody2D = $"../StaticBody2D"
var points = 0
@onready var label: Label = $"../Ui/TextureRect/Label"
@onready var end_of_game: Node2D = $"../EndOfGame"
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

	
func game_over():
	get_tree().reload_current_scene()

func add_point():
	points += 1
	label.text = str(points)

func _process(delta: float):
	var area := static_body_2d.get_node("Area2D")  # or $"Area2D"
	if area and area is Area2D:
		if area.finished_anim:
			print("Animation finished!")
			character_body_2d.can_move = false
			end_of_game.visible = true
