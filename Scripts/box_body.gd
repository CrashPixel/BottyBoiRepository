extends RigidBody2D

@onready var player = get_node("/root/Node2D/Player")
@onready var button = get_node("../..")

var box_speed = 0

func _on_area_2d_body_entered(_body: Node2D) -> void :
	if player.has_dashed:
		box_speed = player.DASH_PUSH_FORCE
		apply_impulse(Vector2(box_speed * player.facing_dir, 0))
	else:
		box_speed = player.PUSH_FORCE
		apply_force(Vector2(box_speed * player.facing_dir, 0))
	

func _on_area_2d_2_area_entered(_area: Area2D) -> void :
	button.kill_box.call_deferred()
