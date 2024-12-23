extends Node2D

@export var countdown = 3
var explosion_scene = preload("res://Scenes/explosion.tscn")

@export var desarm = false

func _init():
	pass
	
func initialize():
	$"..".next_turn.connect(tick)
	$Label.text = str(countdown)
	
func tick():
	if desarm:
		return
	countdown -= 1
	$Label.text = str(countdown)
	if countdown < 0:
		boom()
	
func boom():
	var explosion_center = explosion_scene.instantiate()
	var explosion_top = explosion_scene.instantiate()
	var explosion_right = explosion_scene.instantiate()
	var explosion_down = explosion_scene.instantiate()
	var explosion_left = explosion_scene.instantiate()
	
	explosion_center.initialize($"..".next_turn,3,position,Vector2(0,0))
	
	if !$"..".IsOccupied(position + Vector2(0,16)):
		explosion_top.initialize($"..".next_turn,3,position,Vector2(0,16))
		$"..".add_child(explosion_top)
	
	if !$"..".IsOccupied(position + Vector2(16,0)):
		explosion_right.initialize($"..".next_turn,3,position,Vector2(16,0))
		$"..".add_child(explosion_right)

	if !$"..".IsOccupied(position + Vector2(0,-16)):
		explosion_down.initialize($"..".next_turn,3,position,Vector2(0,-16))
		$"..".add_child(explosion_down)
		
	if  !$"..".IsOccupied(position + Vector2(-16,0)):
		explosion_left.initialize($"..".next_turn, 3,position,Vector2(-16,0)) 
		$"..".add_child(explosion_left)
	
	$"..".add_child(explosion_center)
	$AnimationPlayer.play("destroy")

func react():
	boom()
	queue_free()

func _on_area_entered(area):
	print("Desarm")
	$AnimationPlayer.play("desarm")
