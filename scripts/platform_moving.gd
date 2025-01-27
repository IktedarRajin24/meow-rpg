extends AnimatableBody3D

var platform_position = Vector3(0, 10, 0)
var duration = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.TRANS_SINE
	tween.EASE_IN_OUT
	tween.tween_property(self, "position",  position + platform_position,duration)
	tween.tween_property(self, "position", position - platform_position ,duration)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
