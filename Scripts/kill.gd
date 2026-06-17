extends CollisionShape2D

@onready var player = get_node("/root/Node2D/Player")
@onready var hurt_box = get_node("/root/Node2D/Player/Area2D/Hurt_Box")
@onready var hit_box = get_node("/root/Node2D/Player/CollisionShape2D")

@export var reset_timer = 0

func reset_stage():
	get_tree().reload_current_scene()

func _on_area_2d_area_entered(_area: Area2D) -> void :
	hurt_box.set_deferred("disabled", true)
	hit_box.set_deferred("disabled", true)
	player.dead = true
	player.velocity = Vector2(0, 0)
	player.animations.play("Death")
	reset_timer = 200

func _process(_delta: float):
	if reset_timer > 0:
		reset_timer -= 1
		print(reset_timer)

	if reset_timer == 1:
		reset_stage()
