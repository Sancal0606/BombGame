extends Node2D

@export var next_scene:PackedScene
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func next_level():
	$Animator.play("next_level")




func _on_animator_animation_finished(anim_name):
	get_tree().change_scene_to_packed(next_scene)
