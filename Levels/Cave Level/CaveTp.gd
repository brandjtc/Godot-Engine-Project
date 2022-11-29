
extends AnimatedSprite
func _ready():
	pass
	$HideParallax/Fade.visible=false;


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$TeleportFx.play()	
	$HideParallax/Fade.visible=true;
	$HideParallax/Fade/Fade_Animation.play("Fade_Option")


func _on_Fade_Animation_animation_finished(anim_name):
	get_tree().change_scene("res://Levels/Lab Finale.tscn")
