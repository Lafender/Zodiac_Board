extends Reference
class_name Table_Row_Finder

# Finds the first row (Dictionary) whose fields all match the criteria.


static func find_row(rows: Array, criteria: Dictionary) -> Dictionary:
	for row in rows:
		if _row_matches(row, criteria):
			return row
	return {}


static func _row_matches(row: Dictionary, criteria: Dictionary) -> bool:
	for key in criteria:
		if str(row.get(key, "")) != str(criteria[key]):
			return false
	return true
