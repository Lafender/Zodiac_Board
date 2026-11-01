extends Reference
class_name Json_File_Reader


static func read_dictionary(path: String) -> Dictionary:
	var file := File.new()
	if file.open(path, File.READ) != OK:
		push_error("Json_File_Reader: cannot open " + path)
		return {}
	var parsed := JSON.parse(file.get_as_text())
	file.close()
	if parsed.error != OK or typeof(parsed.result) != TYPE_DICTIONARY:
		push_error("Json_File_Reader: invalid JSON dictionary in " + path)
		return {}
	return parsed.result
