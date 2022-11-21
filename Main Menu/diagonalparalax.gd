extends ParallaxLayer
export(float) var speed=60

func _process(delta)->void:

	self.rotate(delta*speed/140*-1)
