extends Control

func _ready():
	$Fade/Fade_Animation.play("Intro Fade")
	


func _on_Back_pressed():
	$Fade.visible=true;
	$Fade/Fade_Animation.play("Fade_Option")


func _on_Fade_Animation_animation_finished(anim_name):
	if (anim_name=="Intro Fade"):
		$Fade.visible=false;
	else:
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
