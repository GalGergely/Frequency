extends TextureRect

@export var rotation_speed: float = 300.0

func get_dial_rotation_degrees():
	return rotation_degrees

func _ready():
	pivot_offset = size / 2
	rotation_degrees = 180

func _process(delta: float) -> void:
	# Controller + keyboard support
	var input: float = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	if abs(input) < 0.2:
		input = 0.0
	if Input.is_action_pressed("ui_left"):
		input -= 1
	if Input.is_action_pressed("ui_right"):
		input += 1

	rotation_degrees += input * rotation_speed * delta
	rotation_degrees = clamp(rotation_degrees, 0, 360)
