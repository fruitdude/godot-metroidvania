extends Weapon


export(PackedScene) onready var bullet


func _ready():
	connect("is_shooting", self, "_on_is_shooting")


func _on_is_shooting() -> void:
	_shooting()


func _shooting() -> void:
	_instance_bullets()
	can_shoot = false
	timer.start()
	
	
func _instance_bullets() -> void:
	var new_bullet = bullet.instance()
	get_parent().owner.add_child(new_bullet)
	new_bullet.global_transform = $Muzzle.global_transform


func _on_Firerate_timeout():
	can_shoot = true
