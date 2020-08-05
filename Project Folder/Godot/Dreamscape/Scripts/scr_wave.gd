extends AnimatedSprite3D

func _ready():
	play()

func _process(delta):
	scale.x = lerp(scale.x, 3.5, 10 * delta)
	scale.y = lerp(scale.y, 3.5, 10 * delta)
	
	if frame == 6:
		self.queue_free()
