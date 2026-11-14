extends Reference
class_name Input_Gate_Locker

# Adds or removes one lock. Emits blocked_changed only when the gate flips between open and blocked.


static func lock(gate: Input_Gate_Data) -> void:
	if gate == null:
		return
	gate.lock_count += 1
	if gate.lock_count == 1:
		gate.emit_signal("blocked_changed", true)


static func unlock(gate: Input_Gate_Data) -> void:
	if gate == null or gate.lock_count <= 0:
		return
	gate.lock_count -= 1
	if gate.lock_count == 0:
		gate.emit_signal("blocked_changed", false)
