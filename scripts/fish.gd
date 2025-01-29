extends Area3D

@onready var eaing_audio: AudioStreamPlayer3D = $EaingAudio

var fish_scale: Vector3 = Vector3(.2,.2,.2)
var duration: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.TRANS_SINE
	tween.EASE_IN_OUT
	tween.tween_property(self, "scale", scale + fish_scale,duration)
	tween.tween_property(self, "scale", scale - fish_scale,duration)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if body is CAT:
		eaing_audio.play()
		body.cat_eat_sound()
		ScoreManager.incerement_score()
		queue_free()
