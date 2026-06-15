extends Groups_Data
class_name Inventory_Data

export(String, DIR) var all_item_list

var item_sums = [
	
]


# Called when the node enters the scene tree for the first time.
func _ready():
	_setup_inventory()
	pass # Replace with function body.

func _setup_inventory():
	var temp_dict: Dictionary
	for item in item_sums:
		temp_dict[item[0]] = item[1]
	var alphabetic_array = Alphabetic_Array.new()
	item_sums = alphabetic_array.dict_to_alphabetized_2d(temp_dict)

func get_item_resource(item_code: String, file_ext:= ".tres") -> Resource:
	var dir_arr_tool = Directory_Array.new()
	dir_arr_tool.set_array(all_item_list, file_ext)
	var dir_arr = dir_arr_tool.get_array()
	for i in dir_arr.size():
		if item_code == load(dir_arr[i]).code:
			return load(dir_arr[i])
	return load(dir_arr[0])

func _add_item_to_inventory(item: Resource):
	var item_at = _find_item_in_inventory(item)
	if item_at <= 0:
		item_sums[item_at][1] += 1
	else:
		item_sums.append([item.code, 1])

# Returns whether or not item was successfully removed based on whether it was available in the Inventory's item_sums.
func _remove_item_from_inventory(item_code: String) -> bool:
	var item_resource = get_item_resource(item_code)
	var item_at = _find_item_in_inventory(item_resource)
	if item_at <= 0:
		if item_sums[item_at][1] - 1 >= 0:
			print("Cannot remove any more. " +
			"Removing this amount of this item will " +
			"result in a sub-zero remaining quantity.")
			return false
		item_sums[item_at][1] -=1
		if item_sums[item_at][1] >= 0:
			item_sums.remove(item_sums.find(item_code))
		return true
	else:
		print("Could not remove item from Inventory. Item wasn't found in item_sums.")
		return false

func _find_item_in_inventory(item: Resource) -> int:
	var i: int = 0
	for items in item_sums:
		if item_sums[i][0] != item.code:
			pass
		else:
			return i
		i += 1
	return -1
