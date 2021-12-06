extends Area2D


export(NodePath) onready var anim_player = get_node(anim_player) as AnimationPlayer


func _ready():
	anim_player.play("explosion")
