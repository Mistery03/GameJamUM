extends State

@export
var idle_state: State
@export
var move_state: State
@export
var jump_state:State

func enter() -> void:
	super()
	camera.position_smoothing_enabled = false

func process_physics(delta: float) -> State:
	parent.velocity.y += jump_state.getGravity()  * delta
	parent.cayoteCounter = 1

	var movement = move_component.get_movement_direction() * move_speed * delta
	
	if move_component.get_movement_direction():
		parent.animation.flip_h = move_component.axis.x < 0
		if move_component.axis.x < 0:
			parent.attackLOS.rotation = 1.5708
		elif move_component.axis.x > 0:
			parent.attackLOS.rotation = -1.5708
	parent.velocity.x = movement.x
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if move_component.get_movement_direction():
			return move_state
		return idle_state
	return null
