extends Reference
class_name Menu_Visibility_Reader

# A Control or Node2D menu counts as open while it is visible in the tree.
# Any other kind of node (Node, CanvasLayer) counts as open for as long as it is in the tree.


static func is_open(menu: Node) -> bool:
	if menu == null or not menu.is_inside_tree():
		return false
	if menu is CanvasItem:
		return menu.is_visible_in_tree()
	return true
