extends Node2D


func _process(delta):
	if $"..".died:
		position.y += delta * 100

func react():
	print("game over")
	$"../GameOver".gameover()
	$"..".died = true



func _on_area_entered(area):
	$"..".save_citizen(self)
	queue_free()
