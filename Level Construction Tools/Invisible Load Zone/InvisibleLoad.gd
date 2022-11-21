extends Area2D


func _ready():
	pass





func _on_crash_finished():
	get_tree().change_scene("res://Levels/Forest.tscn")


func _on_Invisible_Load_Zone_area_entered(area):
	$Fade.visible=true;
	$Fade/Fade_Animation.play("Fade_Option")


func _on_Invisible_Load_Zone_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$Fade.visible=true;
	$piano.play()
	$Fade/Fade_Animation.play("Fade_Option")


func _on_Fade_Animation_animation_finished(anim_name):
	$crash.play()

