extends Control

func _ready():
	$Fade/Fade_Animation.play("Intro Fade")

func _on_Start_pressed():
	$Fade.visible=true;
	$Fade/Fade_Animation.play("Fade_Start")


func _on_Options_pressed():
	$Fade.visible=true;
	$Fade/Fade_Animation.play("Fade_Option")

func _on_Quit_pressed():
	$Fade.visible=true;
	$Fade/Fade_Animation.play("Fade_Quit")


func _on_Fade_Animation_animation_finished(anim_name):
	if (anim_name=="Fade_Intro"):
		$Fade.visible=false
	if (anim_name=="Fade_Start"):
		get_tree().change_scene("res://Test Node.tscn")
	elif (anim_name=="Fade_Option"):
		get_tree().change_scene("res://Main Menu/Options Menu.tscn")
	else:
		get_tree().quit();
