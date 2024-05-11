# jump.gd
extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 700.0
@export 
var jumpHeight:float
@export 
var jumpTimeToPeak:float
@export 
var jumpTimeToDescent:float


@onready var jumpVelocity:float = ((2.0 * jumpHeight)/jumpTimeToPeak) * -1.0
@onready var jumpGravity:float= ((-2.0 * jumpHeight)/(jumpTimeToPeak * jumpTimeToPeak)) * -1.0
@onready var fallGravity:float= ((-2.0 * jumpHeight)/(jumpTimeToDescent * jumpTimeToDescent)) * -1.0

func getGravity()->float:
	return jumpGravity if parent.velocity.y < 0.0 else fallGravity

func enter() -> void:
	super()
	parent.velocity.y = jumpVelocity

func process_physics(delta: float) -> State:
	parent.velocity.y += parent.gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	parent.velocity.x = move_component.get_movement_direction().x * move_speed * delta
	
	if move_component.get_movement_direction():
		parent.animation.flip_h = move_component.axis.x < 0
	parent.velocity.x = clamp(parent.velocity.x,-move_speed,move_speed)
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if  move_component.get_movement_direction():
			return move_state
		return idle_state
	
	return null
