extends Reference
class_name Movement_Step

# One physics frame of movement: input -> facing -> move -> report tile hits -> clamp to the Map.


static func run(character: KinematicBody2D, character_data: Resource, config: Movement_Config_Data, state: Map_State_Data) -> void:
	var move_direction := Movement_Input_Reader.read_direction()
	Facing_Direction_Updater.update(character_data, move_direction, Aim_Input_Reader.read_direction())
	character.move_and_slide(Movement_Velocity_Calculator.calculate(move_direction, config.move_speed))
	Movement_Tile_Collision_Reporter.report(character, state)
	character.global_position = Movement_Bounds_Clamper.clamp_position(character.global_position, state.map_bounds)
