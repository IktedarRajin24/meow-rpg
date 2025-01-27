extends Node
var _score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_score() -> int:
	return _score
func set_score(value: int) -> void:
	_score = value
	SignalManager.ON_SCORE_UPDATE.emit()

func incerement_score()-> void:
	set_score(_score+1)
