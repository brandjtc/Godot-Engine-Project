extends Node2D
export var multi=4;



func _ready():
	$"Layer 1/ParallaxLayer/Sprite".scale = Vector2(multi, multi)
	$"Layer 1/ParallaxLayer".motion_mirroring=Vector2(multi*320,0)
	$"Layer 2/ParallaxLayer/Sprite".scale = Vector2(multi, multi)
	$"Layer 2/ParallaxLayer".motion_mirroring=Vector2(multi*320,0)
	$"Layer 3/ParallaxLayer/Sprite".scale = Vector2(multi, multi)
	$"Layer 3/ParallaxLayer".motion_mirroring=Vector2(multi*320,0)
