extends HBoxContainer

@onready var game = $"../../.."
var combo: Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (get_child_count(true) > 0):
		get_child(0)._set_rotation(0)
	queue_sort()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	var card_node = area.get_parent()
	card_node.reparent(self)
	#add_child(card_node)
	
func _parse_cards() -> void:
	combo = get_children()
	


func _on_reset_cards_button_down() -> void:
	var hand = get_children()
	for card in hand:
		#card.get_node("Area2D").monitorable = false
		card.reparent(game)
		card.position = Vector2(0,0)
