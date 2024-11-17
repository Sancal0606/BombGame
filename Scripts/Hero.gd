extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Up"):
		if(!$"..".IsOccupied(position + Vector2(0,-16))): 
			position.y -= 16
			$"..".next_turn.emit()
	elif Input.is_action_just_pressed("Down"):
		if(!$"..".IsOccupied(position + Vector2(0,16))): 
			position.y += 16
			$"..".next_turn.emit()
	elif Input.is_action_just_pressed("Left"):
		if(!$"..".IsOccupied(position + Vector2(-16,0))): 
			position.x -= 16
			$"..".next_turn.emit()
	elif Input.is_action_just_pressed("Right"):
		if(!$"..".IsOccupied(position + Vector2(16,0))): 
			position.x += 16
			$"..".next_turn.emit()
		
func react():
	get_tree().reload_current_scene()
