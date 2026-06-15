extends Panel
class_name Skill_Inventory_View

signal chip_selection_changed(chip)

export var visible_columns: int = 3
export var total_rows: int = 10 # 3x10 = 30

export(Resource) var inventory


export(NodePath) onready var scroll = $ScrollContainer
export(NodePath) onready var grid = $ScrollContainer/GridContainer
export(NodePath) onready var highlight = $Selection_Highlight

var selected_index: int = 0
var chip_list: Array

func _ready() -> void:
	grid.columns = visible_columns
	_build_grid()
#	_update_highlight()

func _build_grid() -> void:
	for child in grid.get_children():
		child.queue_free()
	for k in inventory.item_sums.keys():
		var chip: Resource = inventory.get_item_resource(inventory.item_sums[k])
		var panel: Panel  = preload("res://Action/Item/Equipment/Skill/Skill_Chip/Skill_Chip_Panel/Skill_Chip_Panel.tscn").instance()
		grid.add_child(panel)
		panel.set_chip(chip)

func move_selection(dx: int, dy: int) -> void:
	var cols := visible_columns
	var rows := int(ceil(float(chip_list.size()) / float(cols)))
	var x := selected_index % cols
	var y := selected_index / cols
	x = clamp(x + dx, 0, cols - 1)
	y = clamp(y + dy, 0, rows - 1)
	var new_index := y * cols + x
	if new_index < 0 or new_index >= chip_list.size():
		return
	selected_index = new_index
#	_update_highlight()
	_emit_selection_signal()

func _update_highlight() -> void:
	if selected_index < 0 or selected_index >= grid.get_child_count():
		highlight.visible = false
		return
	highlight.visible = true
	var target_panel: Control = grid.get_child(selected_index)
	highlight.global_position = target_panel.global_position
	highlight.rect_size = target_panel.rect_size
	# Ensure selected panel is visible
	scroll.ensure_control_visible(target_panel)

func _emit_selection_signal() -> void:
	var chip := get_selected_chip()
	emit_signal("chip_selection_changed", chip)

func get_selected_chip() -> Resource:
	if selected_index < 0 or selected_index >= chip_list.size():
		return null
	return chip_list[selected_index]

func mark_chip_equipped(chip: Resource) -> void:
	for child in grid.get_children():
		var panel := child as Panel
		if panel and panel.chip == chip:
			panel.set_equipped(true)
