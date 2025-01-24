extends Node3D

const MOUSE_SENSITIVITY: float = 0.002
@onready var spring_arm: SpringArm3D = $SpringArm3D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * -MOUSE_SENSITIVITY)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x - event.relative.y * MOUSE_SENSITIVITY, -0.7, 0.7)
