extends Node3D

@onready var timer: Timer = $Timer
@onready var anim := $AnimationPlayer


@export var main_scene_camera: Camera3D
@export var player_camera: Camera3D
@export var start_text: Control
@export var cat: CAT
@onready var audio_stream_player_3d: AudioStreamPlayer = $AudioStreamPlayer3D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player_3d.play()
	ScoreManager.set_score(0)
	set_active_camera(main_scene_camera)
	deactivate_camera(player_camera)
	start_text.set_process(false)
	start_text.visible = false
	cat.set_physics_process(false)
	timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_active_camera(camera: Camera3D) -> void:
	camera.current = true

func deactivate_camera(camera: Camera3D) -> void:
	camera.current = false


func _on_timer_timeout() -> void:
	set_active_camera(player_camera)
	deactivate_camera(main_scene_camera)
	start_text.visible = true
	start_text.set_process(true)
	cat.set_physics_process(true)
	timer.stop()
	


func camera_pause(interval: int) -> void:
	anim.pause()
	await get_tree().create_timer(1).timeout
	anim.play("cut_scene")
	#match interval:
		#1:
			#await get_tree().create_timer(1).timeout
			#anim.play("cut_scene")
		#2:
			#await get_tree().create_timer(1).timeout
			#anim.play("cut_scene")
		#3:
			#await get_tree().create_timer(1).timeout
			#anim.play("cut_scene")


func _on_fish_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
