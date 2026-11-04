extends Node
class_name Active_Map_Holder

# Loads, holds and swaps the current Map scene (res://World/Maps/<World>/<Map>/Tilemap.tscn).
# Camera_Follow and Movement listen to map_changed to refresh their bounds.

signal map_changed(new_map)

export(String, FILE, "*.tscn") var initial_map_scene_path := ""
export(NodePath) var map_container_path

var map: Node
var current_map_scene_path := ""
var map_container: Node


func _ready() -> void:
	map_container = get_node(map_container_path)
	call_deferred("change_map_scene", initial_map_scene_path) # deferred: container may still be busy in _ready


func change_map_scene(scene_path: String) -> void:
	var new_map := Map_Scene_Loader.instance_scene(scene_path)
	if new_map == null:
		return
	_remove_current_map()
	map_container.add_child(new_map)
	map = new_map
	current_map_scene_path = scene_path
	emit_signal("map_changed", new_map)


func _remove_current_map() -> void:
	if map == null:
		return
	map_container.remove_child(map)
	map.queue_free()
	map = null
