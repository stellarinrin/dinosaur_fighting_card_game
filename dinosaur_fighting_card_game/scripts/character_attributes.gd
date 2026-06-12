class_name CharacterAttributes
extends Resource

enum BlockLevel {
	NONE, 
	LOW, 
	HIGH, 
	AIR,
}

@export var h_p : int = 100
@export var grid_position : Vector2 = Vector2(0,0)
@export var block_level : BlockLevel = BlockLevel.NONE
#@export var deck : Array = []
