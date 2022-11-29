extends ParallaxLayer
export(float) var speed=20

func _process(delta)->void:
	self.motion_offset.x+=speed*delta
	self.rotate(delta*speed/90)
