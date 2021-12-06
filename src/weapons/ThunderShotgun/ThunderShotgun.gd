extends Weapon


export(NodePath) onready var enemy_detection_area = get_node(enemy_detection_area) as Area2D
export(NodePath) onready var line_1 = get_node(line_1) as Line2D
export(NodePath) onready var line_2 = get_node(line_2) as Line2D

var enemies := []
var counter := 0

#loops stunlock me
func _input(event):
	if event.is_action_pressed("shoot"):
		enemies = enemy_detection_area.get_overlapping_areas()
		
		var counter = 0
		
		for enemy in enemies:
			print(enemy.global_position)
			
			#don't understand why this loop does not the same as the 
			#commented code below it
			for line in $Thunder.get_children():
				line.points[0] = $Muzzle.position
				line.points[1] = to_local(enemies[counter].global_position)
			
#			line_1.points[0] = $Muzzle.position
#			line_1.points[1] = to_local(enemies[0].global_position)
#
#			line_2.points[0] = $Muzzle.position
#			line_2.points[1] = to_local(enemies[1].global_position)
