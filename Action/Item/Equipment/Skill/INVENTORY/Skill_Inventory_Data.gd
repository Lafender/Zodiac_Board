extends Inventory_Data
class_name Skill_Inventory_Data

func get_all_skills() -> Array:
	var skill_array: Array = []
	for unique_item in item_sums:
		skill_array.append(get_item_resource(unique_item[0]))
	return skill_array

func equip_skill_to_board(skill, idx_x, idx_y):
	pass

func deequip_skill_from_board(skill, idx_x, idx_y):
	pass
