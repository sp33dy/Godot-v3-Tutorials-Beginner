extends Sprite

const BULLET_LASER = preload("res://Bullets/Laser/Laser.tscn")
const SHIELD = preload("res://Shield/Shield.tscn")

const WOBBLE_AMPLITUDE = 8
const WOBBLE_FREQUENCY = 2

const INVADER_TYPES = [
	preload("res://Invader/images/spaceship-white-03.png"),
	preload("res://Invader/images/spaceship-red-03.png"),
	preload("res://Invader/images/spaceship-yellow-03.png"),
	preload("res://Invader/images/spaceship-blue-03.png"),
	preload("res://Invader/images/spaceship-grey-03.png"),
	preload("res://Invader/images/spaceship-black-03.png")
]

export (int, "WHITE", "RED", "YELLOW", "BLUE", "GREY", "BLACK") var colourType setget setColourType

var size
var time = 0.0

func setColourType(newColourType):
	if newColourType != null:
		colourType = newColourType
		texture = INVADER_TYPES[colourType]

func setSize():
	size = texture.get_size() * get_scale()

func initType():
	if colourType == null:
		var pick = randi() % INVADER_TYPES.size()
		setColourType(pick)

func _init():
	initType()
	setSize()

func addShield():
	var shield = SHIELD.instance()
	shield.colourType = colourType
	shield.modulate.a = 0.0
	add_child(shield)

func _ready():
	addShield()
	$InvaderArea.connect("area_entered", self, "hit")

func hit(object):
	if object.name == 'LaserArea':
		if object.get_parent().colourType == colourType:
			queue_free()
		else:
			$Shield.modulate.a = 0.9

func _process(delta):
	time += delta
	wobble()

func wobble():
	offset.y = WOBBLE_AMPLITUDE * sin(time * WOBBLE_FREQUENCY) 
