extends Reference
class_name Facing_Direction_Name_Resolver

# Turns a facing vector into one of the four direction names. Ties pick up/down.


static func resolve(facing: Vector2, animation_set: Animation_Set_Data) -> String:
	if abs(facing.x) > abs(facing.y):
		return animation_set.direction_right if facing.x > 0.0 else animation_set.direction_left
	return animation_set.direction_down if facing.y >= 0.0 else animation_set.direction_up
