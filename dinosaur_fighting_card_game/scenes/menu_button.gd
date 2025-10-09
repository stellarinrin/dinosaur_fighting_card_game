extends Button

@export var animation_start_time: float
@export var menu: CanvasLayer
@export var analogous_button: Button
@export var is_submenu_button: bool

func _ready() -> void:
	$ButtonName.text = text
	%ButtonAnimation.play("idle_front")
	%ButtonAnimation.seek(animation_start_time,true)
	%ButtonAnimation.play("idle_back")
	%ButtonAnimation.seek(animation_start_time,true)
	%ButtonAnimation.speed_scale = 0.25

func _on_mouse_entered() -> void:
	%ButtonAnimation.speed_scale = 1
	
func _on_mouse_exited() -> void:
	%ButtonAnimation.speed_scale = 0.25
	
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ButtonAnimation.speed_scale = 0.25
		%ButtonAnimation.play("menu_popup")
		await get_tree().create_timer(1).timeout
		%ButtonAnimation.play("idle_back")
		menu.visible = true
	if not toggled_on:
		#menu.visible = false
		%ButtonAnimation.play("menu_collapse")
		await get_tree().create_timer(1).timeout
		%ButtonAnimation.play("idle_back")
		await get_tree().create_timer(.2).timeout
		%ButtonAnimation.play("idle_front")
