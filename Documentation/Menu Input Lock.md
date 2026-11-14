# Menu Input Lock

Pauses Field input (movement, aiming, interacting) while a Menu is open.

## Add it to a Menu

1. Add a `Menu_Input_Lock` node as a child of the Menu's root node.
2. Set its inspector fields:
   - **menu_path**: the Menu's root node (pick it in the tree display).
   - **input_gate**: `res://Common/config/Input_Gate/DATA.tres`.

Every Menu or Page that should pause the Field needs its own `Menu_Input_Lock`.

## When it locks

| Menu node type | Counts as open |
| --- | --- |
| Control or Node2D | While visible in the tree. Calling `show()` or `hide()` is enough. |
| Node or CanvasLayer | While it is in the scene tree. |

The lock is released when the Menu is hidden, closed, or freed.

## Stacked Menus

Each `Menu_Input_Lock` adds one lock. Field input stays paused until all of them are released, so closing a sub-Menu while its parent Menu is open keeps the Field paused.

## What is paused

| Script | Effect while paused |
| --- | --- |
| `Movement_Step` | Move, right stick and mouse direction read as zero. The character stands still and facing holds. |
| `Interaction` | The interact key (F) is ignored. |

The mouse still counts as "moved" while a Menu is open. If you move it in a Menu and then close it, the character faces the mouse.

## Pausing new Field input

For a new input script, such as an attack key, add `export(Resource) var input_gate`, point it at the same `DATA.tres`, and start the handler with:

```gdscript
if Input_Gate_Reader.is_blocked(input_gate):
	return
```

To react when the pause starts or ends, connect to the gate's `blocked_changed(is_blocked)` signal.

## Related files

- `Common/input/Menu_Input_Lock.gd` (the node)
- `Common/input/Menu_Lock_Syncer.gd`
- `Common/input/Menu_Visibility_Reader.gd`
- `Common/input/Input_Gate_Locker.gd`
- `Common/input/Input_Gate_Reader.gd`
- `Common/Resource/Input_Gate_Data.gd`
- `Common/config/Input_Gate/DATA.tres`
- `Field/Movement/Gated_Input_Reader.gd`

Files containing paths: `Common/config/Input_Gate/DATA.tres` and the `input_gate` reference in `Field/Field.tscn`.
