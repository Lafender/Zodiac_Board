extends Reference
class_name Character_Movement_Detector

# A character is walking when its body actually changed position this physics frame.
# Pushing into a wall therefore shows idle, and teleports are ignored.


static func update(state: Character_Animation_State_Data, current_position: Vector2, animation_set: Animation_Set_Data) -> bool:
	var distance := current_position.distance_to(state.last_position)
	state.last_position = current_position
	return distance >= animation_set.min_move_distance and distance <= animation_set.max_move_distance
