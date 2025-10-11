extends Button

@export var animation_start_time: float
@export var menu: CanvasLayer
@export var is_quit_button: bool
var animation_progress: float

func _ready() -> void:
	$ButtonName.text = text
	%ButtonAnimation.play("idle")
	%ButtonAnimation.seek(animation_start_time,true)
	%ButtonAnimation.speed_scale = 0.25

func _on_mouse_entered() -> void:
	%ButtonAnimation.speed_scale = 1
	
func _on_mouse_exited() -> void:
	%ButtonAnimation.speed_scale = 0.25
	
func _on_toggled(toggled_on: bool) -> void:
	%ButtonAnimation.speed_scale = 0.25
	if toggled_on:
		disabled = true
		%ButtonAnimation.speed_scale = 0.25
		animation_progress = %ButtonAnimation.current_animation_position
		%ButtonAnimation.play("menu_popup")
		if is_quit_button:
			$QuitLabel.queue_free()
			await get_tree().create_timer(.5).timeout
			Events.quit_application.emit()
		await get_tree().create_timer(1).timeout
		$OpenLayer.visible = true
		%ButtonAnimation.play("idle")
		%ButtonAnimation.seek(animation_progress,true)
		disabled = false
		menu.visible = true
	if not toggled_on:
		disabled = true
		animation_progress = %ButtonAnimation.current_animation_position
		menu.visibility_changed.emit()
		await get_tree().create_timer(.4).timeout
		menu.visible = false
		animation_progress = %ButtonAnimation.current_animation_position
		%ButtonAnimation.play("menu_collapse")
		await get_tree().create_timer(0.1).timeout
		$OpenLayer.visible = false
		await get_tree().create_timer(1.2).timeout
		%ButtonAnimation.play("idle")
		%ButtonAnimation.seek(animation_progress,true)
		disabled = false
