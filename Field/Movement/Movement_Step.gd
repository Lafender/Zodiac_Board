extends Reference
class_name Movement_Step

# One physics frame of movement: input -> facing -> move -> report tile hits -> clamp to the Map.
# While a Menu is open the input is all zero: facing holds and the character stands still.


static func run(character: KinematicBody2D, character_data: Resource, config: Movement_Config_Data, state: Map_State_Data, mouse_state: Mouse_Aim_State_Data, gate: Input_Gate_Data) -> void:
	var move_direction := Gated_Input_Reader.read_move(gate)
	var aim_direction := Gated_Input_Reader.read_aim(gate)
	var mouse_direction := Gated_Input_Reader.read_mouse(gate, character, mouse_state, config)
	Facing_Direction_Updater.update(character_data, move_direction, aim_direction, mouse_direction)
	character.move_and_slide(Movement_Velocity_Calculator.calculate(move_direction, config.move_speed))
	Movement_Tile_Collision_Reporter.report(character, state)
	character.global_position = Movement_Bounds_Clamper.clamp_position(character.global_position, state.map_bounds)
