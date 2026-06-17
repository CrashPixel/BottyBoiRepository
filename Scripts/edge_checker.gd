extends Node2D

@export var camera = Node2D
@export var move_x = 0
@export var move_y = 0
@export var disable_right = false

func _ready() -> void:
	if disable_right:
		$Left_Detection/Check_Left.set_deferred("disabled", false)
		$Right_Detection/Check_Right.set_deferred("disabled", true)
		
	else:
		$Right_Detection/Check_Right.set_deferred("disabled", false)
		$Left_Detection/Check_Left.set_deferred("disabled", true)

func _on_left_detection_body_entered(body: Node2D) -> void:
	camera.position += Vector2(-move_x, -move_y)
	$Right_Detection/Check_Right.set_deferred("disabled", false)
	$Left_Detection/Check_Left.set_deferred("disabled", true)


func _on_right_detection_body_entered(body: Node2D) -> void:
	camera.position += Vector2(move_x, move_y)
	$Right_Detection/Check_Right.set_deferred("disabled", true)
	$Left_Detection/Check_Left.set_deferred("disabled", false)
