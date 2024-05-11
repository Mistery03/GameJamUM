class_name Attack
extends State
@export
var idle_state: State
@export
var move_state: State
@export
var jump_state: State
@export
var fall_state: State
@export
var damage_state: State

var prevState:State

var lerp_timer: Timer


func enter() -> void:
	super()
	print(animations.is_playing())
	

	
func process_frame(delta: float) -> State:
	if move_component.get_movement_direction():
		parent.animation.flip_h = move_component.axis.x < 0
		if move_component.axis.x < 0:
			parent.attackLOS.rotation = 1.5708
		elif move_component.axis.x > 0:
			parent.attackLOS.rotation = -1.5708
		return move_state

	if parent.attackLOS.is_colliding():
		if parent.attackLOS.get_collider() is Enemy:
			parent.attackLOS.get_collider().isHit = true
	else:
		return idle_state
	
	if parent.isHit:
		damage_state.prevState = self
		return damage_state
	
	return null
	
	




