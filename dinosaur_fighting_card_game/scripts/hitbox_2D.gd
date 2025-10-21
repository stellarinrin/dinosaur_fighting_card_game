class_name Hitbox2D
extends Area2D

signal hit_landed(damage: float, hitbox_data: HitboxData)

@export var hitbox_data : HitboxData
var hurtbox : Area2D
var total_damage : float

func _process(_delta: float) -> void:
	#if has_overlapping_areas() and is_timeout:
		#hit(hurtbox)
		#
	pass

## Send the damage to the hurtbox when called and call the hurt() function.
func hit(hurt_area: Hurtbox2D) -> void:
	hit_stop(0.01, .75)
	total_damage = hitbox_data.base_damage * hitbox_data.damage_multiplier \
			+ hitbox_data.damage_modifier	
			
	## Signals that the hit connected and the damage dealt with a minimum of 0.
	hit_landed.emit(max(0, total_damage))

	## Call hurtbox's hurt function.
	hurt_area.hurt(self)

func hit_stop(time_scale, duration):
	Engine.time_scale = time_scale
	var timer = get_tree().create_timer(time_scale * duration)
	await timer.timeout
	Engine.time_scale = 1

func clash() -> void:
	pass
## Call hit() when another area passes into the hitbox
func _on_area_entered(area2D: Area2D) -> void:
	hurtbox = area2D
	hit(area2D)
	#elif area2D == Hitbox2D:
		#clash()
	#
