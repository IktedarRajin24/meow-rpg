extends CharacterBody3D

@onready var dog_anim: AnimationPlayer = $Dog2/AnimationPlayer
@onready var detection_area: Area3D = $MeshInstance3D/Area3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		dog_anim.play("Walk")
	

	move_and_slide()


func _on_cat_detection(body: Node3D) -> void:
	if body is CAT:
		print(body)
