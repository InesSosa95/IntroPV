extends Camera2D


onready var player_animation = $PlayerAnimation

func on_ice_started():
	player_animation.play("zoom")
	
func on_ice_stopped():
	player_animation.stop()
	offset = Vector2.ZERO
	zoom = Vector2.ONE
