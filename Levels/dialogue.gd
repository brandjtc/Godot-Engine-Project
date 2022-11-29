extends Camera2D

var counter=0;

func _ready():
	pass


func _on_DialogueTime_timeout():
	counter+=1
	if (counter==1):
		$Dialogue1.visible=true;
		$DialogueTime/noti.play()
	if (counter==2):
		$Dialogue1.visible=false;
		$DialogueTime.stop()

