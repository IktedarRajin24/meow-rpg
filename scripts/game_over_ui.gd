extends Control


@onready var timer: Timer = $Timer
@onready var retry_button: Button = $VBoxContainer/Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	retry_button.hide()
	SignalManager.ON_CAT_DIE.connect(on_cat_die)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_cat_die() -> void:
	show()
	timer.start()


func _on_timer_timeout() -> void:
	retry_button.show()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
