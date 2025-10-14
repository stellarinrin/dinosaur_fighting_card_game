extends Node2D
func _ready() -> void:
	Events.parsed_card.connect(_on_parsed_card.bind())
	
func _on_parsed_card(index: String, attributes: MoveAttributes) -> void:
	match index:
		"5B":
			%PlayerAnimation.play(index)
		"2B":
			%PlayerAnimation.play(index)


func _on_player_animation_finished(anim_name: StringName) -> void:
	Events.animation_finished.emit()
