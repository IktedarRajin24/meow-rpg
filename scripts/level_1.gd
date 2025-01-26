extends Node3D

@onready var path_follow_01: PathFollow3D = $Path3D/Path3D/PathFollow3D
@onready var path_follow_02: PathFollow3D = $Path3D/Path3D2/PathFollow3D

const move_speed_01: float = 8.0
const move_speed_02: float = 10.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow_01.progress += move_speed_01 * delta
	path_follow_02.progress += move_speed_02 * delta
