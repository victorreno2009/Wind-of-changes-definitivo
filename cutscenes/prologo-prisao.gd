extends Node
var refjogador = null
var falas = ["Guarda: Atenção seu miserável, hoje é seu dia de sorte.", "Guarda: Aqui está um presente do rei, uma cesta com alimentos.", "Guarda: Ha? Por quê isso tudo? Apenas nosso rei solicita sua humilde presença, ou não tão humilde assim.", "Guarda: O rei está a sua espera, vamos logo."]
var escolha = 4
var boolean = false
var boolean2
var conversou_npc = false


func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false:
		refjogador.spawnDialog(falas, escolha)
		boolean = false
		conversou_npc = true

func _on_Fala_Guarda_body_entered(body):
	boolean = true
	refjogador = body

func _on_Fala_Guarda_body_exited(body):
	boolean = false
	refjogador = null
