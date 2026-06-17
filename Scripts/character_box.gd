extends CharacterBody2D

@onready var player = get_node("/root/Node2D/Player")
@onready var button = get_node("../..")

const BOX_PUSH = 25
const BOX_RAMMED_PUSH = 80

var box_speed = 0
var player_touched = false

func _physics_process(delta: float) -> void:
	if player_touched == true:
		if player.has_dashed:
			box_speed = BOX_RAMMED_PUSH
		else:
			box_speed = BOX_PUSH
		round(box_speed)
		velocity.x = box_speed * player.facing_dir
	else: if velocity.x > 0:
		velocity.x -= 1
	else: if velocity.x < 0:
		velocity.x += 1
	else:
		velocity.x = 0
	velocity += get_gravity() * delta

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == player.name:
		player_touched = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == player.name:
		player_touched = false

func _on_area_2d_2_area_entered(_area: Area2D) -> void :
	button.kill_box.call_deferred()
