extends SnailState


var move_direction_x := 1.0


func enter(_msg := {}) -> void:
	snail.velocity = Vector2.ZERO
	snail.raycast_left.enabled = true
#	snail.raycast_right.enabled = true
	
	
func physics_update(_delta: float) -> void:
	snail.velocity.x = snail.speed * move_direction_x

	if snail.raycast_left.is_colliding():
		snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)





#	if snail.raycast_right.enabled:
#		if snail.raycast_right.is_colliding():
#			snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)
#		else:
#			snail.raycast_left.enabled = true
#			snail.raycast_right.enabled = false
#	elif snail.raycast_left.enabled:
#		if snail.raycast_left.is_colliding():
#			snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)
#		else:
#			snail.raycast_left.enabled = false
#			snail.raycast_right.enabled = false
#	else:
#		state_machine.transition_to("WalkDown")
			
