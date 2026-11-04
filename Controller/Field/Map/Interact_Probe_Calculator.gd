extends Reference
class_name Interact_Probe_Calculator

# World points in front of the character, nearest first, used to look for an interactive tile.


static func get_points(origin: Vector2, facing: Vector2, reach: float, samples: int) -> Array:
	var points := []
	if facing == Vector2.ZERO or samples < 1:
		return points
	var direction := facing.normalized()
	for step in range(1, samples + 1):
		points.append(origin + direction * reach * float(step) / float(samples))
	return points
