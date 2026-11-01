extends Reference
class_name Camera_Settings_Applier

# Turns off every built-in Camera2D follow feature so Camera_Follow has full control.


static func apply(camera: Camera2D) -> void:
	camera.set_as_toplevel(true)
	camera.process_priority = 100 # runs after Movement (Godot 3.2+)
	camera.process_mode = Camera2D.CAMERA2D_PROCESS_PHYSICS
	camera.smoothing_enabled = false
	camera.drag_margin_h_enabled = false
	camera.drag_margin_v_enabled = false
	camera.rotating = false
	camera.offset = Vector2.ZERO
	camera.current = true
