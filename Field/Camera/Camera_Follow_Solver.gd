extends Reference
class_name Camera_Follow_Solver


static func follow(camera: Camera2D, target: Vector2, config: Camera_Config_Data, state: Map_State_Data) -> Vector2:
	var viewport_size := camera.get_viewport_rect().size
	var half_extents := Camera_Dead_Zone_Calculator.get_half_extents(viewport_size, camera.zoom, config.dead_zone_ratio)
	var push := Camera_Push_Calculator.get_push(target - camera.global_position, half_extents)
	return Camera_Bounds_Clamper.clamp_center(
		camera.global_position + push, viewport_size * camera.zoom, state.map_bounds
	)


static func snap(camera: Camera2D, target: Vector2, state: Map_State_Data) -> Vector2:
	var view_size := camera.get_viewport_rect().size * camera.zoom
	return Camera_Bounds_Clamper.clamp_center(target, view_size, state.map_bounds)
