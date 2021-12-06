extends Area2D


export(NodePath) onready var anim_player = get_node(anim_player) as AnimationPlayer

var damage = 3


func _ready():
	anim_player.play("explosion")


#func _on_Explosion_area_entered(_area):
#	print("area in explosion area")
#
#
#func _on_Explosion_body_entered(_body):
#	print("body in explosion area")
