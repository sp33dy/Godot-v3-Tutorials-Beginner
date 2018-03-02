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

func _ready():
	$LaserArea.connect("area_entered", self, "hit")

func hit(object):
	if object.name == 'InvaderArea':
		queue_free()
