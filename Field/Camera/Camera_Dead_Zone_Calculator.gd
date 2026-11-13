extends Reference
class_name Camera_Dead_Zone_Calculator

# Half-size (in world units) of the rectangle the Active_Character may roam in
# around the screen center before the camera starts moving.


static func get_half_extents(viewport_size: Vector2, zoom: Vector2, ratio: float) -> Vector2:
	return viewport_size * zoom * 0.5 * ratio
