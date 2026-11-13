extends Resource
class_name Character_Animation_State_Data

# Runtime state of one Character_Animator. Each animator creates its own copy.
var last_position := Vector2.ZERO
var is_moving := false
var is_attacking := false
var warned_names := {}
