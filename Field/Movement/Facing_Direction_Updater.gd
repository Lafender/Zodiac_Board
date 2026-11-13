extends Reference
class_name Facing_Direction_Updater


static func update(character_data: Resource, move_direction: Vector2, aim_direction: Vector2, mouse_direction: Vector2) -> void:
	var current_facing := Facing_Direction_Accessor.read(character_data)
	var new_facing := Facing_Direction_Calculator.calculate(current_facing, move_direction, aim_direction, mouse_direction)
	if new_facing != current_facing:
		Facing_Direction_Accessor.write(character_data, new_facing)
