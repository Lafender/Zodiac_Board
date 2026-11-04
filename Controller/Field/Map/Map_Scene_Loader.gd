extends Reference
class_name Map_Scene_Loader


static func instance_scene(scene_path: String) -> Node:
	var packed_scene := load(scene_path) as PackedScene
	if packed_scene == null:
		push_error("Map_Scene_Loader: cannot load " + scene_path)
		return null
	return packed_scene.instance()
