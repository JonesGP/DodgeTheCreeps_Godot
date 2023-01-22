extends RigidBody2D

export var min_speed = 150
export var max_speed = 300

func _ready():
	var tipo_inimigos = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = tipo_inimigos[randi() % tipo_inimigos.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
