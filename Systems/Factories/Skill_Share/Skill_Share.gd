extends Node
class_name Skill_Share

export(Resource) var selected_skill_chip
export(Resource) var inventory

export(String, DIR) var skills_directory = "res://Action/Item/Equipment/Skill/LIST/"
const skill_chip_panel = "res://Action/Item/Equipment/Skill/Skill_Chip/Skill_Chip_Panel/Skill_Chip_Panel.tscn"

export(NodePath) onready var skills_list_grid_container = $HBoxContainer/ScrollContainer/GridContainer
export(NodePath) onready var inventory_grid_container = $HBoxContainer/ScrollContainer2/GridContainer
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
	dir_arr.set_array(skills_directory)
	all_skill_paths = dir_arr.get_array()
	for i in all_skill_paths.size():
		all_skills[i] = load(all_skill_paths[i])
		var skill_chip = preload(skill_chip_panel)
		skills_list_grid_container.add_child(skill_chip)
		skill_chip.set_chip(all_skills[i])
	pass
