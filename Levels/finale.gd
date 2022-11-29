extends Node2D


func _ready():
	pass


func _on_Area2D_area_entered(area):
	$"Background Music".stop()
	$"AudioStreamPlayer".play();
	


func _on_AudioStreamPlayer_finished():
	$Fade.visible=true
	$Fade/Fade_Animation.play("Fade_Quit")

func _on_Fade_Animation_animation_finished(anim_name):
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
