extends Sprite

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var direction = Vector2(10,0)

func _process(delta):
	position += direction
	if position.x >= screenWidth or position.x <= 0:
		direction = -(direction)