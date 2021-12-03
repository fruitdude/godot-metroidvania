#Air.gd
extends PlayerState


func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.jump_impulse
	elif msg.has("do_small_jump"):
		player.velocity.y = -player.small_jump_impulse


func update(_delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		player.sprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		player.sprite.flip_h = false


func physics_update(delta: float) -> void:
	var input_direction_x: float = (
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		) 
	if not Input.is_action_pressed("stay_stationary"):
		player.velocity.x = player.speed * input_direction_x
		
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
