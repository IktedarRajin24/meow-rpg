extends Area3D

var score = ScoreManager.get_score()
var isaActive = false

@onready var win_or_retry_text: Label = $WinOrRetryText
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_or_retry_text.hide()
	SignalManager.ON_SCORE_UPDATE.connect(on_score_update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


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
	pass
	var child = self.get_child(0)
	if child is MeshInstance3D:
		var material = child.get_active_material(0)
		if !isaActive:
			material.albedo_color = color
			isaActive == true
	
func on_score_update()-> void:
	score = ScoreManager.get_score()
	print(score)
	if score == 6:
		change_color(Color.GREEN)
