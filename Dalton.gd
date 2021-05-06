extends StaticBody2D

var refjogador = null
var falas = ["Dalton: Ora ora, quem ousa entrar em meus dominios?", "Dalton: Um indivíduo a mando de Zeal, que deplorável.", "Dalton: Como ousa confiar naquele maldito que se diz rei, se diz um salvador do reino, mas não me engana.", "Dalton: Eu errado? Haa, minhas intenções são as melhores possíveis para este reino, e se tu juntar-se a mim, verás com outros olhos o lado deste reino."]
var dalton = "Dalton"
var escolha = 4
var escolha1 = "Matar Dalton"
var escolha2 = "Unir-se a Dalton"
var conversou_npc = false
onready var texture1 = load("res://assets/Dalton_Boss/Dalton_Sprites-removebg-preview (2).png")
onready var texture2 = load("res://assets/Dalton_Boss/Dalton_Sprites-removebg-preview (1).png")
var boolean = false
var boolean2


func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false: 
		refjogador.spawnDialogo(falas, escolha, escolha1, escolha2, dalton)
		boolean = false
		conversou_npc = true

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null

func escolha_boa():
	get_node("Sprite").texture = texture2


func escolha_ruim():
	get_node("Sprite").texture = texture1
	$Label.text = "Hahaha vamos dominar este reino juntos!!!"
	yield(get_tree().create_timer(4), "timeout")
	$Label.text = "Agora vá, e mate aquele rei"
	yield(get_tree().create_timer(4), "timeout")
	$Label.text = ""
