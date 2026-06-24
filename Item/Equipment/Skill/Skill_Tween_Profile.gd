extends Resource
class_name Skill_Tween_Profile

## Tween profile for movement animation while skill is active/started
export var tween_duration: float = 0.4
export var tween_offset: Vector2 = Vector2.ZERO
export var tween_loop: bool = false
export var tween_is_active_animation: bool = false # looped
export var tween_is_start_animation: bool = true   # one‑shot, interruptible
