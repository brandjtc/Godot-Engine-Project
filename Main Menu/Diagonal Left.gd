extends ParallaxLayer
export(float) var speed=300

func _process(delta)->void:
	self.motion_offset.x-=speed*delta
	self.motion_offset.y-=speed*delta
