extends CharacterBody2D


@export var speed:float = 300
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager
@onready var fan: Area2D = $"../Fan"
@export var fan_speed:float = 0
@export var can_move = true

func _physics_process(delta: float) -> void:
	if can_move:
		# Add the gravity.
		if not is_on_floor():
			animated_sprite_2d.animation = "jump"
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("move_left", "move_right")
		var target_velocity: float
		if direction != 0:
			target_velocity = direction * speed + fan_speed
		else:
			# Only use fan_speed if it's non-zero (i.e., player is in a fan)
			target_velocity = fan_speed if fan_speed != 0 else 0
	
		velocity.x = move_toward(velocity.x, target_velocity, speed)

		move_and_slide()
	
		var isLeft = velocity.x < 0
		if velocity.x == 0:
			animated_sprite_2d.animation = "idle"
		else:
			animated_sprite_2d.animation = "default"
			animated_sprite_2d.flip_h = isLeft


func _on_collectible_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	game_manager.game_over()
	pass # Replace with function body.
