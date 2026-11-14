extends Reference
class_name Gated_Input_Reader

# Field input as seen by the Active_Character. Every read is zero while a Menu is open.


static func read_move(gate: Input_Gate_Data) -> Vector2:
	if Input_Gate_Reader.is_blocked(gate):
		return Vector2.ZERO
	return Movement_Input_Reader.read_direction()


static func read_aim(gate: Input_Gate_Data) -> Vector2:
	if Input_Gate_Reader.is_blocked(gate):
		return Vector2.ZERO
	return Aim_Input_Reader.read_direction()


static func read_mouse(gate: Input_Gate_Data, character: Node2D, mouse_state: Mouse_Aim_State_Data, config: Movement_Config_Data) -> Vector2:
	if Input_Gate_Reader.is_blocked(gate):
		return Vector2.ZERO
	return Mouse_Aim_Direction_Reader.read_direction(character, mouse_state, config)
