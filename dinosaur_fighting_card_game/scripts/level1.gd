extends Control

var combo : Array = []
@onready var combobox = $Input/ComboBox
@onready var opponent = $UI/ProgressBar

func _on_attack_pressed() -> void:
	combo.append("attack")


func _on_play_hand_pressed() -> void:
	combo = combobox.container.get_children()
	for move in combo:
		print(combo)
		match move.move_index:
			"attack":
				opponent.value-= 10.0
		print(opponent.value)
		await get_tree().create_timer(1).timeout
	combo.clear()
