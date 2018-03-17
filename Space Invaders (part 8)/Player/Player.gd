extends Sprite

const BULLET_LASER = preload("res://Bullets/Laser/Laser.tscn")
const RELOAD_TIME = 0.1
const CHANGE_COLOUR_TIME = 0.2

const PLAYER_TYPES = [
	preload("res://Player/images/spaceship-white-07.png"),
	preload("res://Player/images/spaceship-red-07.png"),
	preload("res://Player/images/spaceship-yellow-07.png"),
	preload("res://Player/images/spaceship-blue-07.png"),
	preload("res://Player/images/spaceship-grey-07.png"),
	preload("res://Player/images/spaceship-black-07.png")
]

export (int, "WHITE", "RED", "YELLOW", "BLUE", "GREY", "BLACK") var colourType setget setColourType

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var reloading = 0.0
var changingColour = 0.0

func setColourType(newColourType):
	if newColourType != null:
		colourType = newColourType
		texture = PLAYER_TYPES[colourType]
		changingColour = CHANGE_COLOUR_TIME

func _init():
	setColourType(0)

func adjustColour(adjust):
	if changingColour < 0.0:
		var newColourType = colourType + adjust
		if newColourType < 0:
			newColourType += PLAYER_TYPES.size()
		elif newColourType >= PLAYER_TYPES.size():
			newColourType -= PLAYER_TYPES.size()
		setColourType(newColourType)

func _ready():
	moveToStartPosition()
	$Area2D.connect("area_entered", self, "hit")

func moveToStartPosition():
	var halfSpriteSize = (texture.get_size() / 2) * scale
	position = Vector2(screenWidth/2, screenHeight - halfSpriteSize.y)

func hit(object):
	if object.name != 'LaserArea':
		modulate.a = 0.2

func move(adjustment):
	position.x = position.x + adjustment.x

func fire():
	if reloading <= 0.0:
		var bullet = BULLET_LASER.instance()
		bullet.colourType = colourType
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		reloading = RELOAD_TIME

func _process(delta):
	reloading -= delta
	changingColour -= delta
