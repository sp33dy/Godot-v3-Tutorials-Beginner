extends Sprite

const WOBBLE_AMPLITUDE = 8
const WOBBLE_FREQUENCY = 2


var size
var time = 0.0

func _init():
	size = texture.get_size() * get_scale()

func _ready():
	$InvaderArea.connect("area_entered", self, "hit")

func hit(object):
	queue_free()

func _process(delta):
	time += delta
	wobble()

func wobble():
	offset.y = WOBBLE_AMPLITUDE * sin(time * WOBBLE_FREQUENCY) 
