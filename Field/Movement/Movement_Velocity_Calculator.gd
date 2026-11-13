extends Reference
class_name Movement_Velocity_Calculator


static func calculate(direction: Vector2, speed: float) -> Vector2:
	return direction * speed
