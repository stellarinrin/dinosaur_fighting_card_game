class_name HitboxData
extends Resource
## Resource for defining a hitbox's damage traits.
##
## All values can be negative. Negative damage causes healing.

@export var base_damage : float = 10
@export var damage_modifier : float = 0 ## Additive modifier.
@export var damage_multiplier : float = 1 
@export var block_low : bool = true
@export var block_high : bool = true
@export var block_air : bool = false
@export var chip_damage : float
@export var hitstun_proration: int = 1
