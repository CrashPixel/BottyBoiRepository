extends Node

@onready var timer = get_node("/root/GlobalTimer")

var green = load("res://Assets/Botty_Boi_Sheets/Botty Boi Animations.png")
var yellow = load("res://Assets/Botty_Boi_Sheets/Botty Boi Animations (Yellow).png")
var red = load("res://Assets/Botty_Boi_Sheets/Botty Boi Animations (Red).png")
var blue = load("res://Assets/Botty_Boi_Sheets/Botty Boi Animations (Blue).png")

var color = green

var on_main = false
var fullscreen = false

func _process(_delta: float) -> void :
	#if Input.is_action_just_pressed("Fullscreen") and not fullscreen:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		#fullscreen = true
	#if Input.is_action_just_pressed("Fullscreen") and fullscreen:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#fullscreen = false

	if on_main:
		var gp = get_node("/root/Node2D/Green_Player")
		var yp = get_node("/root/Node2D/Yellow_Player")
		var rp = get_node("/root/Node2D/Red_Player")
		var bp = get_node("/root/Node2D/Blue_Player")

		#if Input.is_action_just_pressed("Num1"):
			#color = green
			#gp.set_frame(0)
			#yp.set_frame(5)
			#rp.set_frame(6)
			#bp.set_frame(7)
		#if Input.is_action_just_pressed("Num2"):
			#color = yellow
			#gp.set_frame(4)
			#yp.set_frame(1)
			#rp.set_frame(6)
			#bp.set_frame(7)
		#if Input.is_action_just_pressed("Num3"):
			#color = red
			#gp.set_frame(4)
			#yp.set_frame(5)
			#rp.set_frame(2)
			#bp.set_frame(7)
		#if Input.is_action_just_pressed("Num4"):
			#color = blue
			#gp.set_frame(4)
			#yp.set_frame(5)
			#rp.set_frame(6)
			#bp.set_frame(3)

		#if Input.is_action_just_pressed("Jump"):
			#on_main = false
			#timer.timer_on = true
			#get_tree().change_scene_to_file.call_deferred("res://Levels/Level_1.tscn")
