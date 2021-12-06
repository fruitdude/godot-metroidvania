extends RigidBody2D


export(NodePath) onready var timer = get_node(timer) as Timer
export(PackedScene) onready var explosion 


func _on_Timer_timeout() -> void:
	_instance_explosion()
	queue_free()


func _instance_explosion() -> void:
	var new_explosion = explosion.instance()
	get_parent().add_child(new_explosion)
	new_explosion.global_position = global_position
	

#debugger told me to use call_deferred otherwise there would be a ton of error messages
func _on_Area2D_area_entered(_area):
	call_deferred("_instance_explosion")
	queue_free()
