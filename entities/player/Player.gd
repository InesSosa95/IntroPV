extends Sprite

export (float) var speed : float

func _process(delta):
	var rightPressed : bool = Input.is_action_pressed("right")
	var leftPressed  : bool = Input.is_action_pressed("left")
	
	var direction : int = int(rightPressed) - int(leftPressed)
	position.x += direction * speed * delta
