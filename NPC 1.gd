extends StaticBody2D


var refjogador = null
var falas = ["Mulher: Caro senhor, tu podes me ajudar a levantar esta mercadoria?"]
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
