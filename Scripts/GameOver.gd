extends Node2D

func gameover():
	$Timer.start()
	


func _on_timer_timeout():
	get_tree().reload_current_scene() 
