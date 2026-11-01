extends Reference
class_name Movement_Input_Reader

# Combines THUMBSTICK_LEFT_AXIS and W,A,S,D into one direction vector (length <= 1).


static func read_direction() -> Vector2:
	var direction := Vector2(
		Input.get_action_strength(Movement_Action_Names.RIGHT) - Input.get_action_strength(Movement_Action_Names.LEFT),
		Input.get_action_strength(Movement_Action_Names.DOWN) - Input.get_action_strength(Movement_Action_Names.UP)
	)
	return direction.limit_length(1.0)
