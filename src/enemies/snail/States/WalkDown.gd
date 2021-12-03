extends SnailState


var move_direction := 1.0


func enter(_msg := {}) -> void:
	snail.velocity = Vector2.ZERO


#func physics_update(_delta: float) -> void:
#
#
#	if snail.is_on_wall():
#		snail.velocity.y = snail.speed * -move_direction
#		snail.velocity.x = snail.speed * move_direction
#	else:
#		snail.velocity = Vector2.ZERO
#
#	snail.velocity = snail.move_and_slide(snail.velocity, Vector2.UP)

