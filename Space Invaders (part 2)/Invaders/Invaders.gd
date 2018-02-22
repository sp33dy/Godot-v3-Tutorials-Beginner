extends Node2D

const INVADER = preload("res://Invader/Invader.tscn")

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var direction = Vector2(400, 0)

func addAsGrid(size):
	for y in range (size.y):
		var newPos = Vector2(0, y)
		for x in range (size.x):
			newPos.x = x
			var invader = createInvader()
			invader.position = (newPos * invader.size) + Vector2(x*5, y*5)

func createInvader():
	var invader = INVADER.instance()
	add_child(invader)
	return invader

func moveFormation(delta):
	position += direction * delta
	if direction.y > 0.0:
		position.y += direction.y
		direction.y -= 1.0

func checkBorderReached():
	for invader in get_children():
		if hitLeftBorder(invader) or hitRightBorder(invader):
			direction.x = -direction.x
			direction.y = 8.0
			break

func hitLeftBorder(invader):
	if direction.x < 0.0:
		if invader.global_position.x < 0:
			return true
	return false

func hitRightBorder(invader):
	if direction.x > 0.0:
		if invader.global_position.x > screenWidth:
			return true
	return false

func checkForWin():
	for invader in get_children():
		if hitBottomBorder(invader):
			direction.x = 0
			break

func hitBottomBorder(invader):
	if invader.global_position.y > screenHeight:
		return true
	return false

func _process(delta):
	moveFormation(delta)
	checkBorderReached()
	checkForWin()
