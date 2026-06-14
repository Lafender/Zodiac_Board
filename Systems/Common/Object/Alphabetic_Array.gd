extends Object
class_name Alphabetic_Array

# --- INTERNAL HELPERS ---------------------------------------------------------

func _normalize_array_types(arr: Array) -> Array:
	# Detect if mixing strings with numbers
	var has_string := false
	var has_number := false
	
	for v in arr:
		if typeof(v) in [TYPE_STRING]:
			has_string = true
		elif typeof(v) in [TYPE_INT, TYPE_REAL]:
			has_number = true
	
	# If mixed → convert all to strings
	if has_string and has_number:
		var out := []
		for v in arr:
			out.append(str(v))
		return out
	
	# Otherwise keep original types
	return arr


func _alphabetize(arr: Array) -> Array:
	var normalized := _normalize_array_types(arr)
	normalized.sort() # Godot 3 sorts lexicographically for strings, numerically for numbers
	return normalized


# --- PUBLIC API ---------------------------------------------------------------

# 1) Alphabetize any array with mixed-type rules
func alphabetize_array(arr: Array) -> Array:
	return _alphabetize(arr)


# 2) Convert Dictionary → Alphabetized 2D Array
# mode = "key" or "value"
func dict_to_alphabetized_2d(dict: Dictionary, mode: String = "key") -> Array:
	var pairs := []
	
	# Convert dictionary into [key, value] pairs
	for k in dict.keys():
		pairs.append([k, dict[k]])
	
	# Extract the column to sort by
	var sort_column := []
	for p in pairs:
		if mode == "value":
			sort_column.append(p[1])
		else:
			sort_column.append(p[0])
	
	# Normalize types for sorting
	sort_column = _normalize_array_types(sort_column)
	
	# Build index map for stable sorting
	var indexed := []
	for i in range(len(pairs)):
		indexed.append({"pair": pairs[i], "sort_val": sort_column[i]})
	
	# Sort by the normalized sort_val
	indexed.sort_custom(self, "_sort_by_value")
	
	# Extract sorted pairs
	var result := []
	for item in indexed:
		result.append(item["pair"])
	
	return result


func _sort_by_value(a, b) -> bool:
	return a["sort_val"] < b["sort_val"]
