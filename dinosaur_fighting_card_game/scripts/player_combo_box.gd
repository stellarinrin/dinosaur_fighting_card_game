extends VBoxContainer
class_name PlayerComboBox

@onready var game = $"../../.."
@onready var level_canvas = $"../.."
var combo_hand: Array
var combo_length: int
@export var combo_length_limit: int = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.parsed_player_card.connect(_on_parsed_player_card.bind())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (get_child_count(true) > 0):
		get_child(0)._set_rotation(0)
	queue_sort()

func _on_combo_box_area_entered(area: Area2D) -> void:
	combo_length = get_child_count()
	if combo_length >= combo_length_limit:
		return
	var card_node = area.get_parent()
	card_node.reparent(self)
	combo_hand = get_children()
	
func _on_reset_cards_button_down() -> void:
	var hand = get_children()
	for card in hand:
		card.reparent(level_canvas)
		card.position = Vector2(905,895) #Reset Deck Position

func _on_parsed_player_card(_move_id: String) -> void:
	remove_child(get_children().front())
