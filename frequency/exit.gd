extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var game_manager: Node = get_node("/../../../GameManager") 
@export var finished_anim: bool = false

var animation_played := false


func _on_body_entered(body: Node2D) -> void:
	print(animation_played)
	if body is CharacterBody2D:
		if animation_played:
			return # prevent re-triggering
		print("settrue")
		animation_played = true
		animated_sprite_2d.play("default")
		if animated_sprite_2d.animation == "default":
			finished_anim = true
