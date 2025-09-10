class_name MoveAttributes
extends Resource

enum BlockLevel {MID, LOW, OVERHEAD}

@export var damage : float
@export var startup_frames : int
@export var active_frames : int
@export var recovery_frames : int
@export var invincible_frame_start : int
@export var invincible_frame_end : int
#@export var is_invincible : bool
@export var is_ground_unblockable : bool
@export var is_air_unblockable : bool
@export var is_grounded : bool
@export var block_level : BlockLevel
#untech proration, cancel windows
