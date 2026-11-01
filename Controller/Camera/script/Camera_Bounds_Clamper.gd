extends Reference
class_name Camera_Bounds_Clamper

# Keeps the camera's VIEW (not just its center) inside the Map bounds.
# If the Map is smaller than the view on an axis, the camera centers on the Map.


static func clamp_center(center: Vector2, view_size: Vector2, bounds: Rect2) -> Vector2:
	if bounds.has_no_area():
		return center
	return Vector2(
		_clamp_axis(center.x, view_size.x, bounds.position.x, bounds.end.x),
		_clamp_axis(center.y, view_size.y, bounds.position.y, bounds.end.y)
	)


static func _clamp_axis(center: float, view: float, low: float, high: float) -> float:
	if high - low <= view:
		return (low + high) * 0.5
	return clamp(center, low + view * 0.5, high - view * 0.5)
