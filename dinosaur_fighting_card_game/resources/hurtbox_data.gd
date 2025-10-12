class_name HurtboxData
extends Resource
## Resource for defining a hurtbox's defence traits.
##
## All values can be negative. Negative defence increases damage taken.
enum BlockLevel {HIGH, LOW, AIR}
@export var is_blocking : bool = false
@export var block_level : BlockLevel
