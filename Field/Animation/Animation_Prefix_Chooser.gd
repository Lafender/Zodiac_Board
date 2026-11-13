extends Reference
class_name Animation_Prefix_Chooser


static func choose(animation_set: Animation_Set_Data, is_moving: bool) -> String:
	return animation_set.walk_prefix if is_moving else animation_set.idle_prefix
