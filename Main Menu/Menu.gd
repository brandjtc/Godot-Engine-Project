extends Control

func _ready():
	$Menu/VBoxContainer/Start.grab_focus()


func _on_Start_pressed():
	get_tree().change_scene("res://Test Node.tscn")


func _on_Options_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit();
