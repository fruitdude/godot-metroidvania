extends State
class_name SnailState


var snail: Snail

func _ready():
	yield(owner, "ready")
	snail = owner as Snail
	assert(snail != null)

