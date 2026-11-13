extends Reference
class_name Camera_Push_Calculator

# How far the camera must move so the target sits exactly on the dead-zone edge.


static func get_push(offset: Vector2, half_extents: Vector2) -> Vector2:
	return Vector2(
		_get_axis_push(offset.x, half_extents.x),
		_get_axis_push(offset.y, half_extents.y)
	)


static func _get_axis_push(offset: float, limit: float) -> float:
	if abs(offset) <= limit:
		return 0.0
	return offset - sign(offset) * limit
