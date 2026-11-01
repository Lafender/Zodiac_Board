extends Reference
class_name Movement_Bounds_Clamper

# Keeps the Active_Character's origin inside the Map bounds.


static func clamp_position(position: Vector2, bounds: Rect2) -> Vector2:
	if bounds.has_no_area():
		return position
	return Vector2(
		clamp(position.x, bounds.position.x, bounds.end.x),
		clamp(position.y, bounds.position.y, bounds.end.y)
	)
