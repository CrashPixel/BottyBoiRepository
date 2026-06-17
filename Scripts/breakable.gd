extends Sprite2D

func _on_area_2d_area_entered(_area: Area2D) -> void :
	self.queue_free()
