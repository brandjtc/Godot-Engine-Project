extends ColorRect


func _ready():
	$AnimationPlayer.play("Fade In")


func _on_AnimationPlayer_animation_finished(anim_name):
	self.visible=false;
