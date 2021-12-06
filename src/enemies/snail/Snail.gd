extends Area2D
class_name Snail



export(NodePath) onready var raycasts = get_node(raycasts) as Node2D

var health_points := 5.0


func _ready():
	print(get_owner())
	print(get_parent())


func _physics_process(_delta: float) -> void:
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			match raycast.cast_to:
				Vector2(20, 0):
					$Sprite.rotation_degrees = 270
				Vector2(-20, 0):
					$Sprite.rotation_degrees = 90
				Vector2(0, 20):
					$Sprite.rotation_degrees = 0
				Vector2(0, -20):
					$Sprite.rotation_degrees = 180
					
					

func _on_Snail_area_entered(area):
	health_points -= area.damage
	
	if health_points <= 0:
		queue_free()
