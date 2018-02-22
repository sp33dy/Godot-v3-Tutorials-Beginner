extends Node2D

const INVADER = preload("res://Invader/Invader.tscn")

const MAX_VELOCITY = Vector2(400, 40)
const ACCELERATION = Vector2(12, 8)

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var velocity = Vector2(0, 0)
var direction = Vector2(1, 1)

func addAsGrid(size):
	for y in range (size.y):
		var newPos = Vector2(0, y)
		for x in range (size.x):
			newPos.x = x
			var invader = createInvader()
			invader.position = (newPos * invader.size) + Vector2(x*5, y*5)
			invader.time = x

func createInvader():
	var invader = INVADER.instance()
	add_child(invader)
	return invader

func moveFormation(delta):
	applyHorizontalAcceleration()
	applyVerticalAcceleration()
	position += velocity * delta

func applyHorizontalAcceleration():
	if direction.x > 0.0:
		if velocity.x < MAX_VELOCITY.x:
			velocity.x = min(velocity.x + ACCELERATION.x, MAX_VELOCITY.x)
	elif direction.x < 0.0:
		if velocity.x > -MAX_VELOCITY.x:
			velocity.x = max(velocity.x - ACCELERATION.x, -MAX_VELOCITY.x)

func applyVerticalAcceleration():
	if direction.y > 0.0:
		if abs(velocity.x) != abs(MAX_VELOCITY.x):
			velocity.y = min(velocity.y + ACCELERATION.y, MAX_VELOCITY.y)
		else:
			velocity.y = 0.0
			direction.y = 0.0

func checkBorderReached():
	for invader in get_children():
		if hitLeftBorder(invader) or hitRightBorder(invader):
			direction.x = -direction.x
			direction.y = 8.0
			break

func hitLeftBorder(invader):
	if direction.x < 0.0:
		if invader.global_position.x < invader.size.x * 2 :
			return true
	return false

func hitRightBorder(invader):
	if direction.x > 0.0:
		if invader.global_position.x > screenWidth - (invader.size.x * 2) :
			return true
	return false

func checkForWin():
	for invader in get_children():
		if hitBottomBorder(invader):
			direction = Vector2(0, 0)
			velocity = Vector2(0, 0)
			break

func hitBottomBorder(invader):
	if invader.global_position.y > screenHeight:
		return true
	return false

func _process(delta):
	moveFormation(delta)
	checkBorderReached()
	checkForWin()
