extends StaticBody2D
var refjogador = null
var falas = ["teste", "olá mundo", "boa noite"]
var escolha = 1
var boolean = false
var boolean2
var acao

func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean:
		refjogador.spawnDialogo(falas, escolha)
		boolean = false
		acao = acao()
		print(acao)

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null

func acao():
	var input = ""
	if Input.is_action_just_pressed("Ajudar"):
		input = "ajudar +2 karma"
		boolean2 = false
	elif Input.is_action_just_pressed("Prejudicar"):
		input = "prejudicar -2 karma"
		boolean2 = false
	return input
