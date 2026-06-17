extends AnimatedSprite2D

@export var pick_level = 0
@export var test_levels = ["res://Levels/Test_Level_Movement.tscn", 
"res://Levels/Test_Level_Hazards.tscn"]

@export var levels = []

@export var play_test_levels = false

func _on_area_2d_body_entered(_body: Node2D) -> void :
	if play_test_levels:
		get_tree().change_scene_to_file.call_deferred(test_levels[pick_level])
	else:
		get_tree().change_scene_to_file.call_deferred(levels[pick_level])
