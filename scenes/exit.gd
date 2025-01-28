extends Area3D

var score = ScoreManager.get_score()

@onready var win_or_retry_text: Label = $WinOrRetryText
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_or_retry_text.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScoreManager._score == 6:
		change_color(Color.GREEN)


func _on_body_entered(body: Node3D) -> void:
	if body is CAT:
		if score < 6:
			win_or_retry_text.show()
			win_or_retry_text.text = "You have only collected %d fishes" %[score]
			win_or_retry_text.modulate = Color.RED
			timer.start()
		elif score == 6:
			body.queue_free()
			win_or_retry_text.show()
			win_or_retry_text.text = "You have collected %d fishes. You win" %[score]
			win_or_retry_text.modulate = Color.GREEN
			timer.start()
		


func _on_timer_timeout() -> void:
	win_or_retry_text.hide()

func change_color(color: Color)-> void:
	var child = self.get_child(0)
	# Check if the child is a MeshInstance3D
	if child is MeshInstance3D:
		if child.get_surface_override_material(0) == null:
			var metarial = StandardMaterial3D.new()
			child.set_surface_override_material(0, metarial)
		var material = child.get_surface_material(0)
		if material is StandardMaterial3D:
			material.albedo_color = color
