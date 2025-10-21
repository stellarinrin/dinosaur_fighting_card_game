class_name Hurtbox2D
extends Area2D

signal damaged(damage: float)
signal blocked()

@export var hurtbox_data : HurtboxData
#var total_defence : float

## Signals that damage was taken and how much was taken with a minimum of 0.
func hurt(hit_area: Hitbox2D) -> void:
	if hurtbox_data.is_blocking:
		match hurtbox_data.block_level:
			hurtbox_data.BlockLevel.HIGH:
				if hit_area.hitbox_data.block_high :
					blocked.emit()
					return
			hurtbox_data.BlockLevel.LOW:
				if hit_area.hitbox_data.block_low :
					blocked.emit()
					return
			hurtbox_data.BlockLevel.AIR:
				if hit_area.hitbox_data.block_air :
					blocked.emit()
					return
	#total_defence = hurtbox_data.base_defence * hurtbox_data.defence_multiplier \
			#+ hurtbox_data.defence_modifier
			
	damaged.emit(max(0, hit_area.total_damage))
