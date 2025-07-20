extends Area2D
@onready var character_body_2d: CharacterBody2D = $"../../CharacterBody2D"

@export var moved: bool = false
@export var fanspeed : float = 100

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Fan entered, applying speed: ", fanspeed)
		character_body_2d.fan_speed = fanspeed

func _on_body_exited(body: Node2D) -> void:
	print("Fan exited, resetting fan speed")
	character_body_2d.fan_speed = 0
