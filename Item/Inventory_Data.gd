extends Groups_Data
class_name Inventory_Data

export(String, DIR) var all_item_list

export var item_sums: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready():
	#_setup_inventory()
	pass # Replace with function body.

func _setup_inventory():
	var temp_dict: Dictionary
	for item in item_sums:
		temp_dict[item] = item[item]
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
		print(item_code + " added to item inventory.")
	else:
		item_sums[item_code] = 1
		print(item_code + " added to inventory.")

# Returns whether or not item was successfully removed based on whether it was available in the Inventory's item_sums.
func _remove_item_from_inventory(item: Resource) -> bool:
	var err_message = ("Cannot remove any more. \n" +
		"Removing this amount of this item will " +
		"result in a sub-zero remaining quantity.")
	if !item_sums.has(item.code):
		print(err_message)
		return false
	elif item_sums[item.code] <= 0:
		print(err_message)
		return false
	elif item_sums[item.code] >= 0:
		item_sums[item.code] -=1
		if item_sums[item.code] <= 0:
			item_sums.erase(item.code)
		print(item.code + " removed")
		return true
	else:
		print("Could not remove item from Inventory. Reason unknown.")
		return false

func _find_item_in_inventory(item: Resource) -> int:
	if item_sums.has(item.code):
		return item_sums[item.code]
	else:
		return -1
