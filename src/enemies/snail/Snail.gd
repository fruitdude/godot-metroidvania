extends KinematicBody2D
class_name Snail


export var speed := 100.0
export var gravity := 3500.0

export(NodePath) onready var fsm = get_node(fsm) as StateMachine
export(NodePath) onready var label = get_node(label) as Label

var velocity : Vector2


#func _process(_delta: float) -> void:
#	label.text = fsm.state.name
