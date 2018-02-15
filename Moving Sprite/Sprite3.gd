extends Sprite

var screenHeight = ProjectSettings.get_setting("display/window/size/height")
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var direction = Vector2(-5,-2.3)

func _process(delta):
	position += direction
	if position.x >= screenWidth or position.x <= 0:
		direction.x = -(direction.x)
	if position.y >= screenHeight or position.y <= 0:
		direction.y = -(direction.y)
