class_name Player
extends Entity

@export var camera_speed:float

@onready var animation = $Animation
@onready var state_manager = $StateManager
@onready var camera = $Camera
@onready var move_component = $moveComponent
@onready var camera_movement_component = $cameraMovementComponent
@onready var attackLOS = $Attack

var jumpBufferCounter:int = 0
var jumpBufferTime:int = 15
var cayoteTime:int = 15
var cayoteCounter:int = 0

var mousePos:Vector2
var isHit:bool
var damage:float
var currentScene


func _ready() -> void:
	state_manager.init(self,animation,move_component,camera)
	currHealth = maxHealth


func _unhandled_input(event: InputEvent) -> void:
	state_manager.process_input(event)

func _physics_process(delta: float) -> void:
	state_manager.process_physics(delta)
	
	
	

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	state_manager.process_frame(delta)
