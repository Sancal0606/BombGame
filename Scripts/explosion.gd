extends Node2D

var index
var explosion_scene = preload("res://Scenes/explosion.tscn")
var offSet
var sign_tick
var has_expand = false

func initialize(_signal,_index,_originPos, _offSet):
	print("init: "+ str((_originPos + _offSet)/16))
	_signal.connect(tick) 
	sign_tick = _signal
	index = _index
	offSet = _offSet
	position = _originPos + offSet
	return true

func tick():
	index -= 1
	if index <= 0:
		queue_free()
		return
	if !has_expand:
		var explosion = explosion_scene.instantiate()
		if $"..".IsOccupied(position + offSet):
			return
		if explosion.initialize(sign_tick,index,position,offSet):
			$"..".add_child(explosion)

func _on_area_entered(area):
	if area.is_in_group("explosion"):
		area.react()
	queue_free()
