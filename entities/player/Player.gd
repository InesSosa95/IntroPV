extends Sprite

export (float) var speed : float

onready var arm = $Arm

func initialize(projectile_container):
	arm.container = projectile_container

func _process(delta):
	
	var leftLimit : int = 0
	var rightLimit:int = 500
	
	var rightPressed : bool = Input.is_action_pressed("right")
	var leftPressed  : bool = Input.is_action_pressed("left")
	var direction : int = int(rightPressed) - int(leftPressed)
	var newPosition : float =position.x +  (direction * speed * delta)
	
	var mouse_position:Vector2 = get_local_mouse_position()
	arm.rotation = mouse_position.normalized().angle()
	
	if Input.is_action_just_pressed("fire"):
		arm.fire()
	
	if newPosition < rightLimit || newPosition > leftLimit:
		position.x = newPosition


	
