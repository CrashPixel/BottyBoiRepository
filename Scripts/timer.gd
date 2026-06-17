extends Node

var timer = 0.0
var timer_on = false

func reset_timer():
	timer = 0.0

func _process(delta: float) -> void :
	if timer_on:
		timer += delta
