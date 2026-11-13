extends Resource
class_name Input_Binding_Data

const KEY := 0
const JOY_AXIS := 1
const JOY_BUTTON := 2

export var action_name := ""
export(int, "Key", "Joy_Axis", "Joy_Button") var event_type := KEY
# Key: scancode (W=87, A=65, S=83, D=68, F=70). Joy_Axis: axis index (0/1 left stick X/Y, 2/3 right stick X/Y).
# Joy_Button: button index (0 = A).
export var code := 0
export var axis_value := 0.0
export(float, 0.0, 1.0) var dead_zone := 0.5
