extends Node2D

@onready var timer_control = get_node("/root/GlobalTimer")

var time_stop = false
var raw_time = 0
var seconds = 60
var final_seconds = 0
var final_minutes = 0

func calculate_time():
    final_minutes = raw_time / seconds
    final_minutes = floori(final_minutes)
    final_seconds = raw_time - (final_minutes * seconds)

    if final_minutes > 9:
        var min_str = str(final_minutes)
        $"Colon/10_Minute".set_frame(int(min_str[0]))
        $"Colon/1_Minute".set_frame(int(min_str[1]))
    else:
        $"Colon/1_Minute".set_frame(final_minutes)

    if final_seconds > 9:
        var sec_str = str(final_seconds)
        $"Colon/10_Second".set_frame(int(sec_str[0]))
        $"Colon/1_Second".set_frame(int(sec_str[1]))
    else:
        $"Colon/1_Second".set_frame(final_seconds)

func _process(_delta: float):
    if timer_control.timer_on:
        raw_time = ceili(timer_control.timer)
        calculate_time()
        timer_control.timer_on = false
