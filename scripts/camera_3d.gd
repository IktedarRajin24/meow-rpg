extends Node3D

@onready var spring_arm: SpringArm3D = $SpringArm3D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * - GameManager.MOUSE_SENSITIVITY)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x - event.relative.y * GameManager.MOUSE_SENSITIVITY, -0.7, 0.7)
