extends Node

const INVADERS = preload("res://Invaders/Invaders.tscn")

const MOVE_UNITS_LEFT = Vector2(-10, 0)
const MOVE_UNITS_RIGHT = Vector2(10, 0)

func _ready():
	var invaders = INVADERS.instance()
	invaders.addAsGrid(Vector2(8, 4))
	add_child(invaders)
#	$Player.position = Vector2(40, 550)

func checkControlPressed():
	if has_node("Player"):
		if Input.is_key_pressed(KEY_LEFT):
			$Player.move(MOVE_UNITS_LEFT)
		if Input.is_key_pressed(KEY_RIGHT):
			$Player.move(MOVE_UNITS_RIGHT)
		if Input.is_key_pressed(KEY_UP):
			$Player.adjustColour(-1)
		if Input.is_key_pressed(KEY_DOWN):
			$Player.adjustColour(1)
		if Input.is_key_pressed(KEY_SPACE):
			$Player.fire()

func _process(delta):
	checkControlPressed()

func invaderDead():
	$GUI/Score.adjust(1)
