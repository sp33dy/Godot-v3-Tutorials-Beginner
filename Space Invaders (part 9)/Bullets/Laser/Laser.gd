extends Sprite

const VELOCITY = Vector2(0, -600)

const LASER_TYPES = [
	preload("res://Bullets/Laser/images/laser-white-02.png"),
	preload("res://Bullets/Laser/images/laser-red-02.png"),
	preload("res://Bullets/Laser/images/laser-yellow-02.png"),
	preload("res://Bullets/Laser/images/laser-blue-02.png"),
	preload("res://Bullets/Laser/images/laser-grey-02.png"),
	preload("res://Bullets/Laser/images/laser-black-02.png")
]

export (int, "WHITE", "RED", "YELLOW", "BLUE", "GREY", "BLACK") var colourType setget setColourType

func setColourType(newColourType):
	if newColourType != null:
		colourType = newColourType
		texture = LASER_TYPES[colourType]

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
