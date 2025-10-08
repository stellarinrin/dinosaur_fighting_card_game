extends Button

@export var animation_start_time: float
func _ready() -> void:
	%ButtonAnimation.play("Idle")
	%ButtonAnimation.seek(animation_start_time,true)
	%ButtonAnimation.speed_scale = 0.25
	


func _on_mouse_entered() -> void:
	%ButtonAnimation.speed_scale = 1
	

func _on_mouse_exited() -> void:
	%ButtonAnimation.speed_scale = 0.25

func _on_button_down() -> void:
	%ButtonAnimation.speed_scale = 0.25
	$TopLayer.z_index = 5
	%ButtonAnimation.play("menu_popup")
