extends Position2D
class_name Weapon


signal is_shooting

export var is_continious_shooting := false

export(NodePath) onready var sprite = get_node(sprite) as Sprite
export(NodePath) onready var muzzle = get_node(muzzle) as Position2D
export(NodePath) onready var timer = get_node(timer) as Timer

const JOYSTICK_THRESHOLD := 0.25

var input_direction : Vector2
var can_shoot := true

var rifle_rotations := {
	"RIGHT": 0,
	"DOWN_RIGHT": 45,
	"DOWN": 90,
	"DOWN_LEFT": 135,
	"LEFT": 180,
	"TOP_LEFT": 225,
	"TOP": 270,
	"TOP_RIGHT": 315
}


func _physics_process(_delta: float) -> void:
	_weapon_rotation()
	_continious_shooting()
	_flip_weapon_sprite_vertical()
	
	
func _continious_shooting():
	if is_continious_shooting:
		if Input.is_action_pressed("shoot") and can_shoot:
			emit_signal("is_shooting")
	else:
		if Input.is_action_just_pressed("shoot") and can_shoot:
			emit_signal("is_shooting")

	
	
func _flip_weapon_sprite_vertical() -> void:
	if Input.is_action_pressed("move_left"):
		sprite.flip_v = true
	elif Input.is_action_pressed("move_right"):
		sprite.flip_v = false
	
	
func _weapon_rotation() -> void:
	input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_up") - Input.get_action_strength("move_down")
	)
	
	if is_instance_valid(owner): #checks if the instance is valid
		if !owner.sprite.flip_h:
			if input_direction.x > JOYSTICK_THRESHOLD and input_direction.y > JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.TOP_RIGHT
			elif input_direction.x > JOYSTICK_THRESHOLD and input_direction.y < -JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.DOWN_RIGHT
			elif input_direction.y > JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.TOP
			elif input_direction.y < -JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.DOWN
			elif input_direction.x > JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.RIGHT
			else:
				rotation_degrees = rifle_rotations.RIGHT
		elif owner.sprite.flip_h:
			if input_direction.x < -JOYSTICK_THRESHOLD and input_direction.y > JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.TOP_LEFT
			elif input_direction.x < -JOYSTICK_THRESHOLD and input_direction.y < -JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.DOWN_LEFT
			elif input_direction.y > JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.TOP
			elif input_direction.y < -JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.DOWN
			elif input_direction.x < -JOYSTICK_THRESHOLD:
				rotation_degrees = rifle_rotations.LEFT
			else:
				rotation_degrees = rifle_rotations.LEFT


