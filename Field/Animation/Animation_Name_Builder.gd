extends Reference
class_name Animation_Name_Builder


static func build(animation_set: Animation_Set_Data, prefix: String, direction: String) -> String:
	return prefix + animation_set.separator + direction
