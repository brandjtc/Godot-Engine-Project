
#REQUIRES A FADE SCENE MADE LOCAL IN THE SAME SCENE TO WORK
extends AnimatedSprite
func _ready():
	pass


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$TeleportFx.play()	
	$HideParallax/Fade.visible=true;
	$HideParallax/Fade/Fade_Animation.play("Fade_Option")


func _on_Fade_Animation_animation_finished(anim_name):
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
