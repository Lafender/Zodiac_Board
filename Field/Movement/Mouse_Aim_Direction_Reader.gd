extends Reference
class_name Mouse_Aim_Direction_Reader

# Direction from the character to the mouse in world space.
# Returns Vector2.ZERO when mouse aim is off or the mouse is inside the dead radius.


static func read_direction(character: Node2D, state: Mouse_Aim_State_Data, config: Movement_Config_Data) -> Vector2:
	if not state.active:
		return Vector2.ZERO
	var offset := character.get_global_mouse_position() - character.global_position
	if offset.length() < config.mouse_aim_dead_radius:
		return Vector2.ZERO
	return offset.normalized()
