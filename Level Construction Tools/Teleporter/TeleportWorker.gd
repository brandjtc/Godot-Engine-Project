extends ColorRect



func _on_TeleportFx_finished():
	$Fade_Animation.play("Fade_Start")
	visible=true
	



func _on_Fade_Animation_animation_finished(anim_name):
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
