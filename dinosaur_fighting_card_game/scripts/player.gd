extends CharacterBody2D
@export var isPlayer : bool
@onready var player_state_machine := $PlayerStateMachine
@onready var animations := %PlayerAnimation
var isAnimationFinished : bool = true
func _ready() -> void:
	Events.parsed_card.connect(_on_parsed_card.bind())
	player_state_machine.init(self)

func _on_parsed_card(index: String, attributes: MoveAttributes, player: bool) -> void:
	player_state_machine._on_parsed_card(index,attributes,player)

func _process(delta: float) -> void:
	player_state_machine.process_frame(delta)

func _physics_process(delta: float) -> void:
	player_state_machine.process_physics(delta)
	
func _on_player_animation_finished(_anim_name: StringName) -> void:
	Events.animation_finished.emit()
	isAnimationFinished = true
