extends Reference
class_name Facing_Direction_Calculator

# Priority: right stick, then mouse, then the last direction moved, then unchanged.


static func calculate(current_facing: Vector2, move_direction: Vector2, aim_direction: Vector2, mouse_direction: Vector2) -> Vector2:
	if aim_direction != Vector2.ZERO:
		return aim_direction.normalized()
	if mouse_direction != Vector2.ZERO:
		return mouse_direction.normalized()
	if move_direction != Vector2.ZERO:
		return move_direction.normalized()
	return current_facing
