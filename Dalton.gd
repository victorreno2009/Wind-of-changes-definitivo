extends StaticBody2D

var refjogador = null
var falas = ["Dalton: Ora ora, quem ousa entrar em meus dominios?", "Dalton: Um indivíduo a mando de Zeal, que deplorável.", "Dalton: Como ousa confiar naquele maldito que se diz rei, se diz um salvador do reino, mas não me engana.", "Dalton: Eu errado? Haa, minhas intenções são as melhores possíveis para este reino, e se tu juntar-se a mim, verás com outros olhos o lado deste reino."]
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
