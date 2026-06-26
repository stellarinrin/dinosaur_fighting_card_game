extends Card

@export var combo_piece : Global.ComboPiece = Global.ComboPiece.LINKER
@export var startup_frames : int = 4
## Area covering an attack's range. Negative y values extend downward
@export var hitbox : Vector2 = Vector2(1,1)
@export var attack_level : Global.AttackLevel = Global.AttackLevel.MID
@export var damage : float = 67
@export var proration : float = 0
@export var recovery_frames : int = 6

#old variables from deprecated move attributes class
#@export var damage : float
#@export var startup_frames : int
#@export var active_frames : int
#@export var recovery_frames : int
#@export var invincible_frame_start : int
#@export var invincible_frame_end : int
# #@export var is_invincible : bool
#@export var is_ground_unblockable : bool
#@export var is_air_unblockable : bool
#@export var is_grounded : bool
#@export var block_level : BlockLevel
# #untech proration, cancel windows
