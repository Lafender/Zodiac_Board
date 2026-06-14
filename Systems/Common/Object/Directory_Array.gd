extends Object
class_name  Directory_Array

var array:= []

func set_array(directory: String, file_extension:= ""):
	var dir = Directory.new()
	
	if dir.open(directory) != OK:
		push_error("Could not open folder: " + directory)
		return
		
	dir.list_dir_begin(true, true) # skip hidden, skip navigational
	
	var file_name = dir.get_next()
	while file_name != "":
		if file_name.ends_with(file_extension):
			var full_path = directory + "/" + file_name
			# var tex = ResourceLoader.load(full_path)
			
			if full_path:
				array.push_back(full_path)
			else:
				push_error("Failed to load: " + full_path)
			
		file_name = dir.get_next()
		
	dir.list_dir_end()

func get_array() -> Array:
	return array
