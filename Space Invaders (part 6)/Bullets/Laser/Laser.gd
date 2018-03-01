extends Sprite

const VELOCITY = Vector2(0, -300)

func _process(delta):
	move(delta)
	removeWhenOffScreen()

func move(delta):
	global_position += VELOCITY * delta

func removeWhenOffScreen():
	if global_position.y < 0:
		queue_free()
