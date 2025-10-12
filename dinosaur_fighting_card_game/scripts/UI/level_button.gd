extends Button

@export var animation_start_time: float
@export var level: PackedScene
var animation_progress: float

func _ready() -> void:
	$ButtonName.text = text
	%ButtonAnimation.play("idle")
	%ButtonAnimation.seek(animation_start_time,true)
	%ButtonAnimation.speed_scale = 0.25

func _on_mouse_entered() -> void:
	animation_progress = %ButtonAnimation.current_animation_position
	%ButtonAnimation.play("active")
	%ButtonAnimation.seek(animation_progress,true)
	%ButtonAnimation.speed_scale = 1
	
func _on_mouse_exited() -> void:
	animation_progress = %ButtonAnimation.current_animation_position
	%ButtonAnimation.play("RESET")
	%ButtonAnimation.play("idle")
	%ButtonAnimation.seek(animation_progress,true)
	%ButtonAnimation.speed_scale = .25
	
func _on_pressed() -> void:
	Global.game_controller._change_scene(level)
	
