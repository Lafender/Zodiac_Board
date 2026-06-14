extends Resource
class_name Skill_List

export(String, DIR) var directory := "res://Action/Item/Skill/LIST/"

var skills = []

func refresh_skills():
	var dir_array = Directory_Array.new()
	dir_array.set_array(directory, ".tres")
	skills = dir_array.get_array()
	print("Skill_List Refreshed")
	print(skills)
	
