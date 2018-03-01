extends Sprite

const BULLET_LASER = preload("res://Bullets/Laser/Laser.tscn")
const RELOAD_TIME = 0.1

var screenWidth = ProjectSettings.get_setting("display/window/size/width")

var leftBorder = 0.0
var rightBorder = 0.0
var reloading = 0.0

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

func fire():
	if reloading <= 0.0:
		var bullet = BULLET_LASER.instance()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		reloading = RELOAD_TIME

func _process(delta):
	reloading -= delta
