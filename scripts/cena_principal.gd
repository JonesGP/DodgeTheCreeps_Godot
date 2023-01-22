extends Node

export (PackedScene) var Inimigo
var score

func _ready():
	randomize()


func novo_jogo():
	score = 0
	$jogador.start($posicaoinicial.position)
	$iniciottimer.start()
	$HUD.exibir_menssagem("Prepare-se")
	$HUD.atualiza_score(score)
	$musica.playing = true
	
func game_over():
	$pontuacaotimer.stop()
	$inimigotimer.stop()
	$HUD.exibir_gameover()
	$musica.stop()
	$sommorte.play()

func _on_iniciottimer_timeout():
	$inimigotimer.start()
	$pontuacaotimer.start()

func _on_pontuacaotimer_timeout():
	score += 1
	$HUD.atualiza_score(score)


func _on_inimigotimer_timeout():
	$caminhoinimigo/spawninimigo.offset = randi()
	var inimigo = Inimigo.instance()
	add_child(inimigo)
	var direcaoinimigo = $caminhoinimigo/spawninimigo.rotation + PI/2
	inimigo.position = $caminhoinimigo/spawninimigo.position
	direcaoinimigo += rand_range(-PI / 4, PI / 4)
	inimigo.rotation = direcaoinimigo
	inimigo.linear_velocity = Vector2(rand_range(inimigo.min_speed, inimigo.max_speed) , 0)
	inimigo.linear_velocity = inimigo.linear_velocity.rotated(direcaoinimigo)
