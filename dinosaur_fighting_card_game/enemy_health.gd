extends ProgressBar

@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.max_health
	min_value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	value = player.current_health
	if value == 0:
		await get_tree().create_timer(1).timeout
		$"../../../WinScreen".visible = true
		await get_tree().create_timer(2).timeout
		Global.game_controller._change_scene("res://main_menu.tscn")
