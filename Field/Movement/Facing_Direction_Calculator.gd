extends Reference
class_name Facing_Direction_Calculator

# Right stick wins while it is held; otherwise the last direction moved; otherwise unchanged.


static func calculate(current_facing: Vector2, move_direction: Vector2, aim_direction: Vector2) -> Vector2:
	if aim_direction != Vector2.ZERO:
		return aim_direction.normalized()
	if move_direction != Vector2.ZERO:
		return move_direction.normalized()
	return current_facing
