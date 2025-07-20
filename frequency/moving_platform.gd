extends PathFollow2D
@onready var dial: TextureRect = $"../../../Ui/Dial"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var t = dial.get_dial_rotation_degrees() / 360.0
	print(t)
	progress_ratio = t
