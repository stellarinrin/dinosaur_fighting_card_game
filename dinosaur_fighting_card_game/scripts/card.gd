extends Control
class_name Card

@export var card_texture:  Texture2D
@export var card_text : String
@export var move_index : String
@export var move_attributes : MoveAttributes
@export var card_reset_sound : AudioStream
@export var card_area : CanvasLayer
var mouse_in: bool = false
var is_dragging: bool = false

func _ready() -> void:
	if card_texture:
		$Sprite2D.texture = card_texture

func _physics_process(delta: float) -> void:
	$Area2D.monitorable = false
	drag_logic(delta)

var current_goal_scale: Vector2 = Vector2(0.2, 0.2)
var scale_tween: Tween
func _change_scale(desired_scale: Vector2):
	if desired_scale == current_goal_scale:
		return
	
	if scale_tween:
		scale_tween.kill()
	scale_tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	scale_tween.tween_property($Sprite2D, "scale", desired_scale, 1.15)
	
	current_goal_scale = desired_scale

func drag_logic(delta: float) -> void:
	var screen_size = get_viewport_rect().size
	var mouse_pos = get_global_mouse_position()
	if (mouse_in or is_dragging) and (MouseBrain.node_being_dragged == null or MouseBrain.node_being_dragged == self):
		if Input.is_action_pressed("click"):
			$Area2D.monitorable = true
			global_position = lerp(global_position, Vector2(clamp(mouse_pos.x - (size.x/2.0), 0, screen_size.x - 84), 
					clamp(mouse_pos.y - (size.x/2.0), 0, screen_size.y - 132)), 22.0 * delta)
			_change_scale(Vector2(2.3, 2.3))
			_set_rotation(delta)
			$Sprite2D.z_index = 100
			if not is_dragging:
				%CardSFX.stream = %CardSFX.card_grab_sound
				%CardSFX.play()
			is_dragging = true
			MouseBrain.node_being_dragged = self
			#global_position = Vector2(clamp(get_global_mouse_position().x, 0, get_viewport_rect().size.x-100),
				#clamp(get_global_mouse_position().y, 0, get_viewport_rect().size.y - 175))
			$Sprite2D/Shadow.position = Vector2(0, 3).rotated($Sprite2D.rotation)
			
		else:
			_change_scale(Vector2(2.27, 2.27))
			$Sprite2D.rotation_degrees = lerp($Sprite2D.rotation_degrees, 0.0, 22.0*delta)
			is_dragging = false
			if MouseBrain.node_being_dragged == self:
				MouseBrain.node_being_dragged = null
				$Sprite2D/Shadow.position = Vector2(0, 0).rotated($Sprite2D.rotation)
				%CardSFX.stream = %CardSFX.card_drop_sound
				%CardSFX.play()
		return
		
	$Sprite2D.z_index = 0
	_change_scale(Vector2(2.25, 2.25))

var last_pos: Vector2
var max_card_rotation: float = 12.5
func _set_rotation(delta: float) -> void:
	var desired_rotation: float = clamp((global_position-last_pos).x*0.85, -max_card_rotation, max_card_rotation)
	$Sprite2D.rotation_degrees = lerp($Sprite2D.rotation_degrees, desired_rotation, 12.0*delta)
	
	last_pos = global_position

func _on_mouse_entered() -> void:
	mouse_in = true
func _on_mouse_exited() -> void:
	mouse_in = false

# Remove card on click from combo box
func _on_gui_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton):
		return
	if get_parent().get_parent() is ComboBox:
		reparent(card_area)
		%CardSFX.stream = card_reset_sound
		%CardSFX.play()
		position = Vector2(0,0) 
		
# Reposition card if out of bounds (maybe use an area2d either in the level or on the card itself
