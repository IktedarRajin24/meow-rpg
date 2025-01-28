extends Node
var _score: int = 0

var score_board : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


func get_score() -> int:
	return _score
func set_score(value: int) -> void:
	_score = value
	SignalManager.ON_SCORE_UPDATE.emit()

func incerement_score()-> void:
	set_score(_score+1)
	#score_board.text = str(_score)
