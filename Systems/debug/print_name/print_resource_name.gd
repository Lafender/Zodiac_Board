extends Node
class_name Print_Resource_Name

@export_group("Targets")
@export var targets: Array[Resource]


func print_name():
	for local_resource in targets:
		print(local_resource.resource_name)
