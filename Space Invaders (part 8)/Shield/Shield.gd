extends Sprite

const SHIELD_TYPE = [
	preload("res://Shield/images/shieldWhite.png"),
	preload("res://Shield/images/shieldRed.png"),
	preload("res://Shield/images/shieldYellow.png"),
	preload("res://Shield/images/shieldBlue.png"),
	preload("res://Shield/images/shieldGrey.png"),
	preload("res://Shield/images/shieldBlack.png")
]

var colourType setget setColourType

func setColourType(newColourType):
	colourType = newColourType

func _ready():
	if colourType != null:
		texture = SHIELD_TYPE[colourType]

func _process(delta):
	modulate.a -= 1.0 * delta
