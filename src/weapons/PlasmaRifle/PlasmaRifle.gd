extends Position2D


export(PackedScene) onready var bullet
export(NodePath) onready var muzzle = get_node(muzzle) as Position2D
export(NodePath) onready var timer = get_node(timer) as Timer

export var is_continuous_shooting := false

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


func _physics_process(_delta):
	_weapon_rotation()
	
	if is_continuous_shooting:
		if Input.is_action_pressed("shoot") and can_shoot:
			_shooting()
	else:
		if Input.is_action_just_pressed("shoot") and can_shoot:
			_shooting()


func _weapon_rotation() -> void:
	var input_direction = Vector2.ZERO
	input_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_direction.y = Input.get_action_strength("move_up") - Input.get_action_strength("move_down")
	
	if Input.is_action_pressed("move_left"):
		$Sprite.flip_v = true
	elif Input.is_action_pressed("move_right"):
		$Sprite.flip_v = false

	if !owner.sprite.flip_h:
		if input_direction.x > 0.25 and input_direction.y > 0.25:
			rotation_degrees = rifle_rotations.TOP_RIGHT
		elif input_direction.x > 0.25 and input_direction.y < -0.25:
			rotation_degrees = rifle_rotations.DOWN_RIGHT
		elif input_direction.y > 0.25:
			rotation_degrees = rifle_rotations.TOP
		elif input_direction.y < -0.25:
			rotation_degrees = rifle_rotations.DOWN
		elif input_direction.x > 0.25:
			rotation_degrees = rifle_rotations.RIGHT
		else:
			rotation_degrees = rifle_rotations.RIGHT
	elif owner.sprite.flip_h:
		if input_direction.x < -0.25 and input_direction.y > 0.25:
			rotation_degrees = rifle_rotations.TOP_LEFT
		elif input_direction.x < -0.25 and input_direction.y < -0.25:
			rotation_degrees = rifle_rotations.DOWN_LEFT
		elif input_direction.y > 0.25:
			rotation_degrees = rifle_rotations.TOP
		elif input_direction.y < -0.25:
			rotation_degrees = rifle_rotations.DOWN
		elif input_direction.x < -0.25:
			rotation_degrees = rifle_rotations.LEFT
		else:
			rotation_degrees = rifle_rotations.LEFT
	

func _shooting() -> void:
	_instance_bullets()
	can_shoot = false
	timer.start()
	
	
func _instance_bullets() -> void:
	var new_bullet = bullet.instance()
	get_parent().owner.add_child(new_bullet)
	new_bullet.global_transform = $Muzzle.global_transform


func _on_Timer_timeout():
	can_shoot = true
