extends SnailState


var move_direction_x := 1.0


func enter(_msg := {}) -> void:
	snail.velocity = Vector2.ZERO
	
	if snail.rotation_degrees == 0 and move_direction_x == 1.0:
		snail.rotation_degrees = 90
		
	snail.raycast_left.enabled = false
	snail.raycast_right.enabled = true
	
	
func physics_update(_delta: float) -> void:
	snail.velocity.y = snail.speed * move_direction_x
	
	if snail.raycast_right.enabled:
		if snail.raycast_right.is_colliding():
			snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)
