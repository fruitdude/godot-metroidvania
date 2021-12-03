extends StaticBody2D


export(NodePath) onready var timer = get_node(timer) as Timer
export(NodePath) onready var sprite = get_node(sprite) as Sprite
export(NodePath) onready var collision = get_node(collision) as CollisionShape2D
export(NodePath) onready var area_collision = get_node(area_collision) as CollisionShape2D

var hit_points := 3.0
var can_respawn := true
var is_on_box := false


func _on_Area2D_area_entered(_area: Area2D) -> void:
	hit_points = clamp(hit_points, 1.0, 3.0)
	hit_points -= 1.0
	
	if hit_points <= 0.0:
		if is_on_box:
			GameEvents.emit_signal("box_destroyed")
		_disable_sprite_and_collisions()
		timer.start(2.2)
		
		
func _disable_sprite_and_collisions() -> void:
	sprite.visible = false
	collision.set_deferred("disabled", true)
	area_collision.set_deferred("disabled", true)
	
	
func _enable_sprite_and_collisions() -> void:
	sprite.visible = true
	collision.set_deferred("disabled", false)
	area_collision.set_deferred("disabled", false)


func _on_Timer_timeout():
	hit_points = 3.0
	
	if can_respawn:
		_enable_sprite_and_collisions()


func _on_RespawnCollision_body_entered(_body: Node):
	can_respawn = false
	timer.start(0.5)


func _on_RespawnCollision_body_exited(_body: Node):
	can_respawn = true
	timer.start(0.5)


func _on_OnBoxArea_body_entered(_body: Node):
	is_on_box = true


func _on_OnBoxArea_body_exited(_body: Node):
	is_on_box = false
