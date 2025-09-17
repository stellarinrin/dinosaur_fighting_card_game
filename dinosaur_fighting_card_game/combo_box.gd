extends HBoxContainer


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
	
