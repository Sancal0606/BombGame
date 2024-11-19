extends Node2D

var died = false

func _ready():
	pass 


func _process(delta):
	if $"..".died:
		position.y += delta * 100
		return
	if Input.is_action_just_pressed("Up"):
		if(!$"..".IsOccupied(position + Vector2(0,-16))): 
			position.y -= 16
			$"..".next_turn.emit()
			$Step.play()
	elif Input.is_action_just_pressed("Down"):
		if(!$"..".IsOccupied(position + Vector2(0,16))): 
			position.y += 16
			$"..".next_turn.emit()
			$Step.play()
	elif Input.is_action_just_pressed("Left"):
		if(!$"..".IsOccupied(position + Vector2(-16,0))): 
			position.x -= 16
			$"..".next_turn.emit()
			$Step.play()
	elif Input.is_action_just_pressed("Right"):
		if(!$"..".IsOccupied(position + Vector2(16,0))): 
			position.x += 16
			$"..".next_turn.emit()
			$Step.play()
		
func react():
	$"..".died = true
	$"../GameOver".gameover()
