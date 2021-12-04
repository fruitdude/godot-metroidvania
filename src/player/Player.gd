extends KinematicBody2D
class_name Player


export var speed := 500.0
export var crouch_speed := 150.0
export var gravity := 3500.0
export var jump_impulse := 1200.0

var velocity : Vector2

export(NodePath) onready var sprite = get_node(sprite) as Sprite
export(NodePath) onready var fsm = get_node(fsm) as StateMachine
export(NodePath) onready var label = get_node(label) as Label
export(NodePath) onready var label2 = get_node(label2) as Label


func _ready():
	$AnimationPlayer.play("idle")
	

func _process(_delta: float) -> void:
	label.text = str(velocity)
	label2.text = fsm.state.name
