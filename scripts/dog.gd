extends CharacterBody3D

@onready var dog_anim: AnimationPlayer = $Dog2/AnimationPlayer
@onready var detection_area: Area3D = $MeshInstance3D/Area3D

@export var path_follow: PathFollow3D
@export var move_speed: float = 8.0

const SPEED: float = 5.0
const JUMP_VELOCITY: float = 4.5
var is_following_path: bool = true


func _physics_process(delta: float) -> void:
	if is_following_path:
		path_follow.progress += move_speed * delta
		
		
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		dog_anim.play("Walk")
	

	move_and_slide()


func _on_cat_detection(body: Node3D) -> void:
	if body is CAT:
		is_following_path = false
		
