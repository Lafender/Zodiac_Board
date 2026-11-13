extends Reference
class_name Aim_Input_Reader

# Reads THUMBSTICK_RIGHT_AXIS as a direction vector (length <= 1).


static func read_direction() -> Vector2:
	var direction := Vector2(
		Input.get_action_strength(Aim_Action_Names.RIGHT) - Input.get_action_strength(Aim_Action_Names.LEFT),
		Input.get_action_strength(Aim_Action_Names.DOWN) - Input.get_action_strength(Aim_Action_Names.UP)
	)
	return direction.limit_length(1.0)
