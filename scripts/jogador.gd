extends Area2D

export var speed = 300
var screen_size
signal hit 


func _ready():
	hide()
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var direcao = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direcao.x += 1
	if Input.is_action_pressed("ui_left"):
		direcao.x -= 1
	if Input.is_action_pressed("ui_down"):
		direcao.y += 1
	if Input.is_action_pressed("ui_up"):
		direcao.y -= 1
		
	if direcao.length() > 0:
		$AnimatedSprite.play()
		direcao = direcao.normalized() * speed
		$rastro.emitting = true
	else:
		$AnimatedSprite.stop()
		$rastro.emitting = false
		
	if direcao.x != 0:
		$AnimatedSprite.animation = "direita_esquerda"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direcao.x < 0
		
	if direcao.y != 0:
		$AnimatedSprite.animation = "cima_baixo"
		$AnimatedSprite.flip_v = direcao.y > 0
	
	position += direcao * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	



func _on_jogador_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
