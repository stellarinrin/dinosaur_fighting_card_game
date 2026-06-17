class_name CharacterAttributes
extends Resource

# Character attributes are separated into a resource to make it easier to change
#  out characters using code since resources don't affect the node tree structure
#@export var sprite : AnimatedSprite2D
@export var h_p : float = 100
@export var grid_position : Vector2 = Vector2(0,0)
@export var block_level : Global.BlockLevel = Global.BlockLevel.NONE
@export var is_crouching : bool = false
#@export var deck : Array = []
