extends Path2D


export(NodePath) onready var path_follow = get_node(path_follow) as PathFollow2D

var speed := 150.0


func _physics_process(delta: float) -> void:
	path_follow.offset += speed * delta
	
	if path_follow.get_child_count() <= 0:
		queue_free()
