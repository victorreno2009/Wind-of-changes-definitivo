extends StaticBody2D


var refjogador = null
var falas = ["Rei Zeal: Sir Astran, lhe convoco para uma missão importante para o reino.", "Rei Zeal: Tu deves saber da ameaça do tirano Dalton, está dominando e pondo terror aonde passa.", "Rei Zeal: Reconheço vossas habilidades, e preciso de alguém com este talento para destruir este mal.", "Rei Zeal: Em troca, como deves saber, sua liberdade.", "Rei Zeal: Agora vá, e cumpra seu dever para com o reino!"]
var escolha = 1
var boolean = false
var boolean2

func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean:
		refjogador.spawnDialogo(falas, escolha)
		boolean = false

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null
