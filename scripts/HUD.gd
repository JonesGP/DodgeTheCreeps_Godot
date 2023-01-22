extends CanvasLayer

signal start_game

func exibir_menssagem(text):
	$messagelabel.text = text
	$messagelabel.show()
	$messagetimer.start()
	
func exibir_gameover():
	exibir_menssagem("Fim de Jogo!")
	yield($messagetimer, "timeout")
	$messagelabel.text = "Desvie e sobreviva aos monstros!"
	$messagelabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$startbutton.show()
	
func atualiza_score(score):
	$scorelabel.text = str(score)




func _on_startbutton_pressed():
	$startbutton.hide()
	emit_signal("start_game")


func _on_messagetimer_timeout():
	$messagelabel.hide()
