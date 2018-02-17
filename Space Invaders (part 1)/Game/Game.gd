extends Node

const INVADER = preload("res://Invader/Invader.tscn")

const formation = Vector2(8, 4)

func _init():
	for y in range (formation.y):
		var newPos = Vector2(0, y * 70)
		for x in range (formation.x):
			newPos.x = x * 70
			var invader = INVADER.instance()
			invader.position = newPos
			add_child(invader)
