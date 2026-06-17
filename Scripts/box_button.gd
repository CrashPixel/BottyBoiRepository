extends Sprite2D

@export var box = Node2D
@onready var load_box = preload("res://Level_Assets/Harmless/box.tscn")
@export var box_spawn = Node

func spawn_box():
	box = load_box.instantiate()
	print("NewBox: ", box)
	print("PreloadedBox: ", load_box)
	self.add_child(box)
	PhysicsServer2D.body_set_state(box, PhysicsServer2D.BODY_STATE_TRANSFORM, box_spawn.transform)

func _on_area_2d_area_entered(_area: Area2D) -> void :
	$AnimationPlayer.play.call_deferred("Press")
	spawn_box()

func kill_box():
	box.queue_free.call_deferred()
	box = load_box
	var new_box = box.instantiate()
	PhysicsServer2D.body_set_state(new_box, PhysicsServer2D.BODY_STATE_TRANSFORM, box_spawn.transform)
