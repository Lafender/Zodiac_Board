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

func _get_item_resource(item_code: String, file_ext:= "") -> Resource:
	var dir_arr_tool = Directory_Array.new()
	dir_arr_tool.set_array(all_item_list, file_ext)
	var dir_arr = dir_arr_tool.get_array()
	for i in dir_arr.size():
		if item_code == load(dir_arr[i]).code:
			return load(dir_arr[i])
	return load(dir_arr[0])

func _add_item_to_inventory(item: Resource):
	if item_sums.has(item.code):
		item_sums[item.code] += 1
	else:
		item_sums.append(item[item.code])
		item[item.code] = 1
