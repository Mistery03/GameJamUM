class_name MovingBoss
extends State

@export
var move_state: State
@export 
var chase_state: State
@export var died: State
@export
var damage_state:State
@export
var attack_state:State


#defaut flip false, rayPos = 50
@export var direction : int = 1
@export var speed: int = 50
var lerp_timer: Timer
var is_chasing : bool = false;

func enter() -> void:
	super()
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

func process_physics(delta: float) -> State:
	var player_position = parent.detectPlayer.position
	var direction_to_player = (player_position - parent.position).normalized()
	
	# Flip boss sprite if needed
	if direction_to_player.x > 0:
		parent.animation.flip_h = true
		parent.detectPlayer.rotation = 3.142
		parent.attackPlayer.rotation = 3.83972
		parent.velocity.x = move_speed * delta * -direction_to_player.x
	else:
		parent.animation.flip_h = false
		parent.detectPlayer.rotation = 0
		parent.attackPlayer.rotation = 0
		parent.velocity.x = move_speed * delta * direction_to_player.x
		
	
	parent.move_and_slide()
	
	if parent.attackPlayer.is_colliding():
		return attack_state
	if parent.isHit:
		damage_state.prevState = self
		return damage_state
		
	return null
		
			
