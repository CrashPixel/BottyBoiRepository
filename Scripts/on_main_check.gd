extends Camera2D

@onready var activate_color = get_node("/root/GlobalColorPicker")
@onready var timer = get_node("/root/GlobalTimer")

func _ready():
	activate_color.on_main = true
	timer.reset_timer()
