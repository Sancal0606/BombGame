extends Node2D


func react():
	print("game over")
	get_tree().reload_current_scene()



func _on_area_entered(area):
	$"..".save_citizen(self)
	queue_free()
