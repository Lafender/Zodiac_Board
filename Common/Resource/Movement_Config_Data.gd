extends Resource
class_name Movement_Config_Data

export var move_speed := 120.0

# Mouse aim: how far (in pixels) one mouse motion must travel to count as "the mouse moved".
export var mouse_motion_threshold := 1.0
# Mouse closer than this to the character (world pixels) gives no direction, so facing doesn't flicker.
export var mouse_aim_dead_radius := 8.0
# A joypad stick pushed past this (0..1), or any joypad button, hands facing back to the gamepad.
export var joypad_release_threshold := 0.5
