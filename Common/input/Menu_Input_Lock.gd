extends Node
class_name Menu_Input_Lock

# Add one as a child of every Menu (or Page). While that Menu is open, Field input is paused.
# Closing it, hiding it, or freeing it releases the lock.

export(NodePath) var menu_path
export(Resource) var input_gate

var menu: Node
var holds_lock := false


func _ready() -> void:
	menu = get_node(menu_path)
	if menu is CanvasItem:
		menu.connect("visibility_changed", self, "_refresh")
	_refresh()


func _refresh() -> void:
	holds_lock = Menu_Lock_Syncer.sync(input_gate, holds_lock, Menu_Visibility_Reader.is_open(menu))


func _exit_tree() -> void:
	holds_lock = Menu_Lock_Syncer.sync(input_gate, holds_lock, false)
