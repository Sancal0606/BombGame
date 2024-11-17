extends Node2D

signal next_turn

@export var grid_width = 9
@export var grid_height = 7
@export var elements: Array[Node] = []
@export var citizens: Array[Node] = []
@export var bombs: Array[Node] = []
var grid = []
var died = false

func _ready():
	for bomb in bombs:
		bomb.initialize()
	for i in range(grid_height):
		grid.append([])
		for j in range(grid_width):
			grid[i].append(null)
			
	for element in elements:
		var vecPos = GetGridPosition(element.position.x,element.position.y)
		grid[vecPos.y][vecPos.x] = element
		
		
	
func GetGridPosition(x,y):
	return Vector2(x / 16, -y / 16)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"	):
		next_turn.emit()
	

func IsOccupied(_pos):
	if _pos.x/16 < 0 or _pos.x/16 >= grid_width:
		return true
		
	if -_pos.y/16 < 0 or -_pos.y/16 >= grid_height:
		return true
		
	if (grid[-_pos.y / 16][_pos.x / 16]):
		return true
		
	return false

func save_citizen(_citizen):
	citizens.erase(_citizen)
	if citizens.size() <= 0:
		$Next_level.next_level()
