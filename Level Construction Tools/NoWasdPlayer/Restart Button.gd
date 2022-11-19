extends Button


onready var red = preload("res://Assets/UI/red restart.png")
onready var blue = preload("res://Assets/UI/restart button.png")
func _ready():
	pass



func _on_Restart_Button_mouse_entered():
	$Button_Texture.set_texture(red)


func _on_Restart_Button_mouse_exited():
	$Button_Texture.set_texture(blue)


func _on_Restart_Button_pressed():
	get_tree().reload_current_scene();
