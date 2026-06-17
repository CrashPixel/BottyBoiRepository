extends RigidBody2D

@onready var player = get_node("../Player")
@export var button = Node2D

var respawn_timer = 0
var box_speed = 0

func _physics_process(_delta: float) -> void :
	if player.has_dashed:
		box_speed = player.DASH_SPEED * 2
	else:
		box_speed = player.SPEED * 2

	#if respawn_timer < 30 and respawn_timer > 10:
		#PhysicsServer2D.body_set_state(self, PhysicsServer2D.BODY_STATE_TRANSFORM, box_spawn.transform)
#
	#if respawn_timer < 5 and respawn_timer > 0:
		#$Wall_Box.set_disabled(false)
		#$Slip_Box.set_disabled(false)
		#self.set_freeze_enabled(false)
#
	#if respawn_timer <= 0:
		#self.visible = true
		#$Area2D / Player_Touch.set_disabled(false)
		#$Area2D2 / Hurt.set_disabled(false)
#
	#if respawn_timer > 0:
		#respawn_timer -= 1
#
#func kill_box():
	#self.visible = false
	#self.set_freeze_enabled(true)
	#$Wall_Box.set_disabled(true)
	#$Slip_Box.set_disabled(true)
	#$Area2D / Player_Touch.set_disabled(true)
	#$Area2D2 / Hurt.set_disabled(true)
	#respawn_timer = 60

func _on_area_2d_body_entered(_body: Node2D) -> void :
	apply_force(Vector2(box_speed * player.facing_dir, 0))

func _on_area_2d_2_area_entered(_area: Area2D) -> void :
	button.kill_box.call_deferred()
