extends Control

var combo : Array = []
@onready var opponent = $ProgressBar

func _on_attack_button_down() -> void:
	combo.append("attack")


func _on_play_hand_pressed() -> void:
	for move in combo:
		print(combo)
		match move:
			"attack":
				opponent.value-= 10.0
		print(opponent.value)
		await get_tree().create_timer(1).timeout
	combo.clear()
