extends Resource
class_name Input_Gate_Data

# Shared switch for Field input. Every open Menu holds one lock; Field input is paused while any lock is held.
# lock_count is runtime-only (not exported) so a stale count is never saved into DATA.tres.

signal blocked_changed(is_blocked)

var lock_count := 0
