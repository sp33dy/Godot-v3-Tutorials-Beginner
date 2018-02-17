extends Sprite

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var move = true

var recentlyReversed = false

var direction = Vector2(8, 0)

func _process(delta):
	if move:
		position += direction
		checkForBorderHit()
		checkForBottomReached()
		recentlyReversed = false

func checkForBorderHit():
	if position.x < 0 or position.x >= screenWidth:
		get_tree().call_group("Invaders","reverseDirection")

func reverseDirection():
	if !recentlyReversed:
		recentlyReversed = true
		direction = -direction
		position.y += 64

func checkForBottomReached():
	if position.y >= screenHeight:
		move = false
