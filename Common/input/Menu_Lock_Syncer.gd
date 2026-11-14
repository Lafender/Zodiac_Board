extends Reference
class_name Menu_Lock_Syncer

# Makes "holds a lock" match "menu is open". Returns the new holds_lock value.


static func sync(gate: Input_Gate_Data, holds_lock: bool, menu_is_open: bool) -> bool:
	if menu_is_open and not holds_lock:
		Input_Gate_Locker.lock(gate)
	elif holds_lock and not menu_is_open:
		Input_Gate_Locker.unlock(gate)
	return menu_is_open
