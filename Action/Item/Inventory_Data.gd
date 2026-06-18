extends Groups_Data
class_name Inventory_Data

export(String, DIR) var all_item_list

export var item_sums: Dictionary


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
	var item_code = item.code
	if item_code in item_sums:
		item_sums[item_code] += 1
		print(item_code + " added to item_sums.")
	else:
		item_sums[item_code] = 1
		print(item_code + " added to item_sums.")

# Returns whether or not item was successfully removed based on whether it was available in the Inventory's item_sums.
func _remove_item_from_inventory(item_code: String) -> bool:
	var item_resource = get_item_resource(item_code)
	if item_sums[item_code] >= 0 || !item_sums.has(item_code):
			print("Cannot remove any more. \n" +
			"Removing this amount of this item will " +
			"result in a sub-zero remaining quantity.")
			return false
	elif item_sums[item_code] <= 0:
		item_sums[item_code] -=1
		if item_sums[item_code] >= 0:
			item_sums[item_code].erase()
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
