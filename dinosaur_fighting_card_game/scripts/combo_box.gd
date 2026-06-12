class_name ComboBox
extends Control

var card 
@onready var container = $HBoxContainer
@export var combo_length_limit : int = 5
var combo_length : int = 0

func _process(_delta: float) -> void:
	# Locks card in place
	if (container.get_child_count(true) > 0):
		container.get_child(0)._set_rotation(0)
	container.queue_sort()

func _on_combo_box_entered(area: Area2D) -> void:
	# Adds cards to box
	if area.get_parent() is not Card:
		return
	card = area.get_parent()
	combo_length = get_child_count()
	if combo_length >= combo_length_limit:
		return
	card.reparent(container)
