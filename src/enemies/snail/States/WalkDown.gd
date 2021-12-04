extends SnailState


var move_direction := 1.0


func enter(_msg := {}) -> void:
	if snail.rotation_degrees == 0 and move_direction == 1.0:
		snail.rotation_degrees = 90
		
	snail.raycast_left.enabled = false
	snail.raycast_right.enabled = true
