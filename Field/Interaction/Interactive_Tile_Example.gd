extends TileMap

# Attach a script like this to each TileMap inside FLOOR/INTERACTIVE.
# Interaction calls interact() when the player presses A / F while facing and near this TileMap.


func interact(_active_character: Node2D, character_data: Resource) -> void:
	print(name, " was interacted with. Facing: ", Facing_Direction_Accessor.read(character_data))
	# Open your dialog or menu here.
