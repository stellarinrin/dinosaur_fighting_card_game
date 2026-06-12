extends ProgressBar

@export var character : Character
var hp : float

func _process(delta: float) -> void:
	hp = character.attributes.h_p
	value = lerp(value, hp, 22.0 * delta)
