extends VBoxContainer

@onready var game = $"../../.."
@onready var level_canvas = $"../.."
var combo_hand: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.parsed_enemy_card.connect(_on_parsed_enemy_card.bind())
	#combo_hand = get_children() # Preset combo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (get_child_count(true) > 0):
		get_child(0)._set_rotation(0)
	queue_sort()

#func _on_combo_box_area_entered(area: Area2D) -> void:
	#var card_node = area.get_parent()
	#card_node.reparent(self)
	#combo_hand = get_children()
	
#func _on_reset_cards_button_down() -> void:
	#var hand = get_children()
	#for card in hand:
		#card.reparent($"../..")
		#card.position = Vector2(913,905) #Reset Deck Position

func _on_parsed_enemy_card(_move_id: String) -> void:
	remove_child(get_children().front())
