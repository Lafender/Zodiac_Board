extends Node
class_name Skill_Share

export(Resource) var selected_skill_chip
export(Resource) var inventory

export(String, DIR) var skills_directory = "res://Action/Item/Equipment/Skill/LIST/"
export(String, DIR) var inventory_directory = "res://Action/Item/Equipment/Skill/INVENTORY/"
const skill_chip_panel = "res://Action/Item/Equipment/Skill/Skill_Chip/Skill_Chip_Panel/Skill_Chip_Panel.tscn"

export(NodePath) onready var skills_list_grid_container = $HBoxContainer/ScrollContainer/GridContainer
export(NodePath) onready var inventory_view = $HBoxContainer/Skill_Inventory_View
export(NodePath) onready var skill_info_panel = $HBoxContainer/Skill_Info_Panel

# An Array of String Paths in the file system from root "res://" to
var all_skill_paths: Array
var all_skills: Array

func _ready() -> void:
	_refresh_skills_list()
	pass

func _refresh_skills_list() -> void:
	for child in skills_list_grid_container.get_children():
		child.queue_free()
	var dir_arr = Directory_Array.new()
	dir_arr.set_array(skills_directory, ".tres")
	all_skill_paths = dir_arr.get_array()
	for i in all_skill_paths.size():
		all_skills.append(load(all_skill_paths[i]))
		var skill_chip_packed_scene = preload(skill_chip_panel)
		var skill_chip = skill_chip_packed_scene.instance()
		skills_list_grid_container.add_child(skill_chip)
		skill_chip.set_chip(all_skills[i])




func _add_skill_to_inventory() -> void:
	inventory._add_item_to_inventory(selected_skill_chip)
	inventory_view._update_inventory_view()
	var new_inventory = save_resource(inventory, inventory_directory, "DATA", ".tres")
	print("Inventory saved to \"" + new_inventory + "\".")
	pass # Replace with function body.

static func save_resource(resource: Resource, folder_path: String, file_name: String = "", file_extension: String = ".tres") -> String:
	# Ensure folder ends with a slash
	if not folder_path.ends_with("/"):
		folder_path += "/"
	# Create folder if missing
	var dir := Directory.new()
	if not dir.dir_exists(folder_path):
		dir.make_dir_recursive(folder_path)
	# Auto‑generate filename if none provided
	if file_name == "":
		file_name = resource.resource_name
		if file_name == "":
			file_name = resource.get_class()
	file_name += file_extension
	var full_path := folder_path + file_name
	# Save resource
	var err := ResourceSaver.save(full_path, resource)
	if err != OK:
		push_error("Failed to save resource to: %s" % full_path)
		return ""
	return full_path
