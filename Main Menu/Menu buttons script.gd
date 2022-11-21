extends HBoxContainer


func _ready():
	pass


func _on_Start_mouse_entered():
	$"VBoxContainer/Start Arrow".visible=true;
	$VBoxContainer/Invisible.visible=false;


func _on_Start_mouse_exited():
	$"VBoxContainer/Start Arrow".visible=false;
	$VBoxContainer/Invisible.visible=true;


func _on_Options_mouse_entered():
	$"VBoxContainer/Options Arrow".visible=true;
	$VBoxContainer/Invisible2.visible=false;


func _on_Options_mouse_exited():
	$"VBoxContainer/Options Arrow".visible=false;
	$VBoxContainer/Invisible2.visible=true;

func _on_Quit_mouse_entered():
	$"VBoxContainer/Quit Arrow".visible=true;


func _on_Quit_mouse_exited():
	$"VBoxContainer/Quit Arrow".visible=false;
