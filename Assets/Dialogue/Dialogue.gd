extends Node
var counter=0;

func _ready():
	_on_DialogueTime_timeout()


func _on_DialogueTime_timeout():
	counter+=1
	if (counter==1):
		$DialogueTime/Dialogue1.visible=true;
		$DialogueTime/noti.play()
	if (counter==2):
		$DialogueTime/Dialogue1.visible=false;
		$DialogueTime/noti.play()
		$DialogueTime/Dialogue2.visible=true;
	if (counter==3):
		$DialogueTime/Dialogue2.visible=false;
		$DialogueTime/noti.play()
		$DialogueTime/Dialogue3.visible=true;
	if (counter==4):
		$DialogueTime/Dialogue3.visible=false;
		$DialogueTime/noti.play()
		$DialogueTime/Dialogue4.visible=true;
	if (counter==4):
		$DialogueTime/Dialogue4.visible=false;
		$DialogueTime.stop()

		
		
	
		
