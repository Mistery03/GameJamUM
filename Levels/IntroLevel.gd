extends Node2D

@onready var tile_map = $TileMap
@onready var player = $Player

var map_limits = tile_map
var map_cellsize = Vector2(32,32)
var playerPrevPos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	map_limits = tile_map.get_used_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_camera_limits()
	if player.position.x <= map_limits.position.x :
		player.position.x = playerPrevPos.x
	if player.position.x > map_limits.end.x * map_cellsize.x:
		player.position.x = playerPrevPos.x
	
	playerPrevPos = player.position

func set_camera_limits():
	
	player.camera.limit_left = map_limits.position.x * map_cellsize.x
	player.camera.limit_right = map_limits.end.x * map_cellsize.x
	player.camera.limit_top = map_limits.position.y * map_cellsize.y
	player.camera.limit_bottom = map_limits.end.y * map_cellsize.y

