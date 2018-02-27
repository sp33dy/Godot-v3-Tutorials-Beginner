extends Node

const INVADERS = preload("res://Invaders/Invaders.tscn")

const MOVE_UNITS_LEFT = Vector2(-10, 0)
const MOVE_UNITS_RIGHT = Vector2(10, 0)

func _ready():
	var invaders = INVADERS.instance()
	invaders.addAsGrid(Vector2(8, 4))
	add_child(invaders)
	$Player.position = Vector2(40, 550)

func checkControlPressed():
	if has_node("Player"):
		if Input.is_key_pressed(KEY_LEFT):
			$Player.move(MOVE_UNITS_LEFT)
		if Input.is_key_pressed(KEY_RIGHT):
			$Player.move(MOVE_UNITS_RIGHT)

func _process(delta):
	checkControlPressed()
