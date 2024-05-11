class_name EnemyChase
extends State

@export
var move_state: State
@export
var attack_state: State
@export
var damage_state:State
 
@onready var attack = $"../../Attack"
@onready var meme = $"../../AudioStreamPlayer2D"


func enter() -> void:
	super()
	
func process_input(event: InputEvent) -> State:
 
	
	return null
			
func process_physics(delta: float) -> State:
	
	chase_player(delta, move_state.direction)
	#chase
	if !parent.detectPlayer.is_colliding():
		if !parent.detectPlayer.get_collider() is Player:
			meme.stop()
		return move_state
	
	if parent.attackPlayer.is_colliding():
		return attack_state
	if parent.isHit:
		damage_state.prevState = self
		return damage_state
	
	return null
	
func chase_player(delta: float, direction: int)->void:
	parent.velocity.x = move_speed * delta * direction
	
	
	
	
	parent.move_and_slide()
	

