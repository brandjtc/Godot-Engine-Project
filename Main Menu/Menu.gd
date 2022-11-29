extends Control

func _ready():
	$CanvasLayer/Fade/Fade_Animation.play("Intro Fade")

func _on_Start_pressed():
	$CanvasLayer/Fade.visible=true;
	$CanvasLayer/Fade/Fade_Animation.play("Fade_Start")


func _on_Options_pressed():
	$CanvasLayer/Fade.visible=true;
	$CanvasLayer/Fade/Fade_Animation.play("Fade_Option")

func _on_Level_Select_pressed():
	$CanvasLayer/Fade.visible=true;
	$CanvasLayer/Fade/Fade_Animation.play("Fade_Select")

func _on_Quit_pressed():
	$CanvasLayer/Fade.visible=true;
	$CanvasLayer/Fade/Fade_Animation.play("Fade_Quit")


func _on_Fade_Animation_animation_finished(anim_name):
	if (anim_name=="Fade_Intro"):
		$Fade.visible=false
	elif (anim_name=="Fade_Start"):
		get_tree().change_scene("res://Levels/TileMap Test.tscn")
	elif (anim_name=="Fade_Option"):
		get_tree().change_scene("res://Main Menu/Options Menu.tscn")
	elif (anim_name=="Fade_Select"):
		get_tree().change_scene("res://Main Menu/Level Select.tscn")
	else:
		get_tree().quit();

