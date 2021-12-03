extends SnailState


var move_direction := 1.0


func enter(_msg := {}) -> void:
	snail.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:
	print(snail.is_on_floor())
	
	snail.velocity.y = snail.speed * move_direction
	
	if snail.is_on_floor():
		snail.velocity.x = snail.speed * move_direction
		snail.velocity.y = 0
	else:
		state_machine.transition_to("WalkDown")

		
	snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)


