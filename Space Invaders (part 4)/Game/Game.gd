extends Node

const INVADERS = preload("res://Invaders/Invaders.tscn")

func _ready():
	var invaders = INVADERS.instance()
	invaders.addAsGrid(Vector2(8, 4))
	add_child(invaders)
