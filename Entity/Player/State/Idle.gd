extends State

@export
var move_state: State
@export
var jump_state: State
@export
var fall_state: State
@export
var attack_state: State
@export
var damage_state: State


var lerp_timer: Timer


func enter() -> void:
	super()
	camera.position_smoothing_enabled = true
	lerp_to_zero()
	await parent.get_tree().create_timer(0.2).timeout
	parent.velocity.x = 0.0
	
func lerp_to_zero():
	# Gradually lerp the velocity to 0
	parent.velocity.x = lerp(parent.velocity.x, 0.0, 0.2)
	parent.velocity.y = lerp(parent.velocity.y, 0.0, 0.2)

# Check if the velocity is close enough to 0
	if abs(parent.velocity.x) < 0.01:
		parent.velocity.x = 0.0

func process_input(event: InputEvent) -> State:
	move_component.axis = move_component.get_movement_direction()
	if Input.is_action_just_pressed("JUMP") and parent.is_on_floor():
		return jump_state
	if move_component.axis and camera.position == Vector2.ZERO:
		if move_component.axis.x < 0:
			parent.attackLOS.rotation = 1.5708
		elif move_component.axis.x > 0:
			parent.attackLOS.rotation = -1.5708
		return move_state
		
	if Input.is_action_pressed("ACTION"):
		attack_state.prevState = self
		return attack_state
	
		

	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += parent.gravity * delta
	parent.move_and_slide()
	
	

	camera.position = parent.camera_movement_component.get_movement_direction() * move_speed * delta

	if !parent.is_on_floor():
		return fall_state
	
	if parent.isHit:
		damage_state.prevState = self
		return damage_state
	
	
	return null
