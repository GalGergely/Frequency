extends PathFollow2D
@onready var dial: TextureRect = $"../../Ui/Dial"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var t = dial.get_dial_rotation_degrees() / 360.0
	progress_ratio = t
