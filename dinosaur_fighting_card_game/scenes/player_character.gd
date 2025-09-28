extends CharacterBody2D
func _ready() -> void:
	Events.parsed_card.connect(_on_parsed_card.bind())
	
func _on_parsed_card(index: int, attributes: MoveAttributes) -> void:
	match index:
		1:
			%PlayerAnimation.play("5A")


func _on_player_animation_finished(anim_name: StringName) -> void:
	Events.animation_finished.emit()
