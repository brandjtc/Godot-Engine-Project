extends Area2D

var npcDialogeTrigger=true;

func _ready():
	pass


func _on_Area2D_area_entered(area):
	if (npcDialogeTrigger):
		$ShopTalker.start()
		$"NPC talk".play()
		$Dialogue1.visible=true
		npcDialogeTrigger=false




func _on_ShopTalker_timeout():
	$Dialogue1.visible=false
	
