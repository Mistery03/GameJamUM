class_name IdleEnemy
extends State

@export
var move_state: State
@export 
var chase_state: State
@export var died: State
@export
var damage_state:State

#defaut flip false, rayPos = 50
@export var direction : int = 1
@export var speed: int = 50
var lerp_timer: Timer
var is_chasing : bool = false;
@onready var meme = $"../../AudioStreamPlayer2D"

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
	parent.velocity.y += parent.gravity * delta
	parent.move_and_slide()
	idle_move(delta)
	#chase
	if parent.detectPlayer.is_colliding():
		if parent.detectPlayer.get_collider() is Player:
			meme.play()
			return chase_state
	if parent.isHit:
		damage_state.prevState = self
		return damage_state
	return null
	
func idle_move(delta: float)-> void:
	parent.animation.flip_h = direction < 0
	if parent.detectPlayer.is_colliding():
		if !parent.detectPlayer.get_collider() is Player: #not collide with player
			if direction == -1:
				direction = 1
				parent.detectPlayer.rotation = 0
				parent.attackPlayer.rotation = 0
				parent.position += Vector2(1* direction, 0)
				
			elif direction == 1:
				direction = -1
				parent.detectPlayer.rotation = 3.142
				parent.attackPlayer.rotation = 3.142
				parent.position += Vector2(1* direction, 0)
				
		
			
	else:
		parent.position += Vector2(1* direction, 0)
		
			
