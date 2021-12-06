extends Weapon


export(PackedScene) onready var grenade


func _ready():
	connect("is_shooting", self, "_on_is_shooting")


func _on_is_shooting() -> void:
	_shooting()


func _shooting() -> void:
	_instance_bullets()
	can_shoot = false
	timer.start()
	
	
func _instance_bullets() -> void:
	var new_grenade = grenade.instance()
	get_parent().owner.add_child(new_grenade)
	new_grenade.global_transform = $Muzzle.global_transform
	new_grenade.apply_impulse(Vector2.ZERO, $Muzzle.global_transform.x * 750)


func _on_Firerate_timeout():
	can_shoot = true
