extends CharacterBody3D

class_name CAT

@onready var cat_anim: AnimationPlayer = $Cat2/AnimationPlayer
@onready var camera_pivot: Node3D = $CameraPivot
@onready var timer: Timer = $Timer


const WALK_SPEED = 3.0
const SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 5.0
const ROTATION_SPEED = 0.05 
var speed = WALK_SPEED

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if Input.is_action_pressed("sprint"):
			velocity.y = JUMP_VELOCITY + 3.0
		else:
			velocity.y = JUMP_VELOCITY
	
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		#self.basis = lerp(self.basis, Basis.looking_at(direction), ROTATION_SPEED * delta)
		play_walk_run_anim()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		play_idle_anim()
	play_jump_anim()

	move_and_slide()

func death()-> void:
	SignalManager.ON_CAT_DIE.emit()
	set_physics_process(false)
	set_process_input(false)
	cat_anim.play("Death")
	
func play_jump_anim() -> void:
	if not is_on_floor() and velocity.y > 0:
		cat_anim.play("Jump")
		
func play_walk_run_anim() -> void:
	if is_on_floor() and velocity.y == 0:
		if speed == SPRINT_SPEED:
			cat_anim.play("Run")
		else:
			cat_anim.play("Walk")		
		
func play_idle_anim() -> void:
	if is_on_floor() and velocity.y == 0:
		cat_anim.play("Idle")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * GameManager.MOUSE_SENSITIVITY


func _on_timer_timeout() -> void:
	set_physics_process(false)
