extends Sprite

var size

func _init():
	size = texture.get_size() * get_scale()
