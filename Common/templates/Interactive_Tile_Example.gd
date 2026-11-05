extends TileMap

# Attach a script like this to each TileMap inside FLOOR/INTERACTIVE.
# Interaction.gd calls interact() when the player presses A / F while facing and near this TileMap.


func interact(active_character: Node2D, character_data: Resource) -> void:
	print(name, " was interacted with. Facing: ", character_data.facing_direction)
	# Open your dialog or menu here.
