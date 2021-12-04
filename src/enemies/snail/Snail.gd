extends KinematicBody2D
class_name Snail


export var speed := 100.0
export var gravity := 3500.0


export(NodePath) onready var raycast_left = get_node(raycast_left) as RayCast2D
export(NodePath) onready var raycast_right = get_node(raycast_right) as RayCast2D
export(NodePath) onready var fsm = get_node(fsm) as StateMachine
export(NodePath) onready var label = get_node(label) as Label

var velocity : Vector2


func _process(_delta: float) -> void:
	label.text = fsm.state.name
	$Label2.text = str(raycast_left.is_colliding())
	$Label3.text = str(raycast_right.is_colliding())
