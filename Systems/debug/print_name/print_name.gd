extends Node
class_name Print_Name

@export_group("Targets")
@export var multiple_targets: bool
@export var targets: Array[Resource]

func _ready() -> void:
	connect("pressed", print_name)

func print_name():
	print(targets[0].resource_name)
