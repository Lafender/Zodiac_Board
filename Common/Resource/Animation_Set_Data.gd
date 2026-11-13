extends Resource
class_name Animation_Set_Data

# Names of the animations every on-screen character's SpriteFrames must provide:
# <prefix><separator><direction>, for example idle_down, walk_left, attack_up.
export var idle_prefix := "idle"
export var walk_prefix := "walk"
export var attack_prefix := "attack"
export var separator := "_"
export var direction_down := "down"
export var direction_left := "left"
export var direction_right := "right"
export var direction_up := "up"

# Movement per physics frame that counts as walking. Bigger jumps (door teleports) are ignored.
export var min_move_distance := 0.05
export var max_move_distance := 32.0


func get_direction_names() -> Array:
	return [direction_down, direction_left, direction_right, direction_up]
