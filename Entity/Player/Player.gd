class_name Player
extends Entity


@onready var animation = $Animation
@onready var state_manager = $StateManager
@onready var camera = $Camera
@onready var move_component = $moveComponent


func _ready() -> void:
	state_manager.init(self,animation,move_component,camera)


func _unhandled_input(event: InputEvent) -> void:
	state_manager.process_input(event)

func _physics_process(delta: float) -> void:
	state_manager.process_physics(delta)

func _process(delta: float) -> void:
	state_manager.process_frame(delta)
