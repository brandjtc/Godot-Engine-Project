extends Node
var counter=0;

func _ready():
	_on_DialogueTime_timeout()


func _on_DialogueTime_timeout():
	counter+=1
	if (counter==1):
		$Dialogue1.visible=true;
		$DialogueTime/noti.play()
	if (counter==2):
		$Dialogue1.visible=false;
		$DialogueTime/noti.play()
		$Dialogue2.visible=true;
	if (counter==3):
		$Dialogue2.visible=false;
		$DialogueTime.stop()

		
		
	
		
