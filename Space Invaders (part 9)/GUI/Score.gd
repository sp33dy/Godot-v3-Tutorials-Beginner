tool extends Label

export (int) var paddingLength = 8

var value = 0

func _ready():
	update()

func reset():
	value = 0
	update()

func adjust(adjustment):
	value += adjustment
	update()

func update():
	$Value.text = ("%0*d" % [paddingLength, value])
