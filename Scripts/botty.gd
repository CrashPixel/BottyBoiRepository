extends CharacterBody2D

const SPEED = 54
const JUMP_VELOCITY = -200
const COYOTE_TIME = 6
const JUMP_BUFFER_TIME = 4
const DASH_SPEED = 240
const DASH_TIME = 16
const PUSH_FORCE = 40
const DASH_PUSH_FORCE = 6

var coyote_timer = 0
var dash_timer = 0
var facing_dir = 1
var has_dashed = false
var has_jumped = false
var jump_pressed_buffer = 0
@onready var animations = $PlayerSprite / PlayerAnimations
@onready var color_picked = get_node("/root/GlobalColorPicker")

var dead = false
var halt_input = 20

func _physics_process(delta: float) -> void :

	if halt_input > 0:
		halt_input -= 1
		

	if not dead and halt_input == 0:
		$PlayerSprite.set_texture(color_picked.color)

		if not is_on_floor():
			velocity += get_gravity() * delta
			coyote_timer -= 1
			jump_pressed_buffer -= 1

		if is_on_floor():
			has_jumped = false
			coyote_timer = COYOTE_TIME
			if dash_timer < 0:
				has_dashed = false
				$Passive / Break_Box.disabled = true


		if Input.is_action_just_pressed("Jump"):
			jump_pressed_buffer = JUMP_BUFFER_TIME
			
		if coyote_timer > 0 and jump_pressed_buffer > 0 and not has_jumped:
			has_jumped = true
			velocity.y = JUMP_VELOCITY
			
		dash_timer -= 1

		if Input.is_action_just_pressed("Dash") and not has_dashed:
			dash_timer = DASH_TIME
			has_dashed = true

		if dash_timer > 0:
			velocity.x = DASH_SPEED * facing_dir
			velocity.y = 0
			animations.play("Dash")
			if is_on_wall():
				dash_timer = 0
		if dash_timer == 0:
			$Passive / Break_Box.disabled = true



		var direction: = Input.get_axis("Left", "Right")
		if direction and dash_timer < 0:
			velocity.x = direction * SPEED
			facing_dir = direction
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if facing_dir < 0:
			$PlayerSprite.set_flip_h(true)
		else:
			$PlayerSprite.set_flip_h(false)


		if (velocity.x > 0 or velocity.x < 0) and is_on_floor() and not has_dashed:
			animations.play("Walk")
		else: if velocity.y < 0:
			animations.play("Jump")
		else: if velocity.y > 0:
			animations.play("Fall")
		else: if is_on_floor() and velocity.x == 0:
			animations.play("Idle")

	move_and_slide()
