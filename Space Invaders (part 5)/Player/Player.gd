extends Sprite

var screenWidth = ProjectSettings.get_setting("display/window/size/width")

var leftBorder = 0.0
var rightBorder = 0.0

func _ready():
	var halfSize = (get_texture().get_size() * scale) / 2
	leftBorder = halfSize.x
	rightBorder = screenWidth - halfSize.x

func move(adjustment):
	var newX = position.x + adjustment.x
	if newX <= leftBorder:
		newX = leftBorder
	elif newX >= rightBorder:
		newX = rightBorder
	position.x = newX
