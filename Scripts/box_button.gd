extends Sprite2D

@onready var load_box = preload("res://Level_Assets/Harmless/box.tscn")
@onready var box_spawn = $BoxSpawn
var box
var respawn_timer = 0

func _ready() -> void:
	call_deferred("spawn_box")

func _process(_delta: float) -> void:
	if respawn_timer == 1:
		call_deferred("spawn_box")
	if respawn_timer > 0:
		respawn_timer -= 1

func spawn_box():
	box = load_box.instantiate()
	box_spawn.add_child(box)

func _on_area_2d_area_entered(_area: Area2D) -> void :
	$AnimationPlayer.play.call_deferred("Press")
	call_deferred("kill_box")

func kill_box():
	respawn_timer = 60
	box.queue_free.call_deferred()
