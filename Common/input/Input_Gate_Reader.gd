extends Reference
class_name Input_Gate_Reader

# True while at least one Menu is open. A missing gate never blocks.


static func is_blocked(gate: Input_Gate_Data) -> bool:
	return gate != null and gate.lock_count > 0
