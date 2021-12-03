extends Area2D


export(PackedScene) onready var impact_particle

var speed := 750.0


func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	
	
func _on_Bullet_area_entered(_area: Area2D) -> void:
	queue_free()


func _on_Bullet_body_entered(_body: Node) -> void:
	_instance_impact_particles()
	queue_free()
	
	
func _instance_impact_particles() -> void:
	var new_impact_particle = impact_particle.instance()
	get_parent().add_child(new_impact_particle)
	new_impact_particle.global_position = global_position
