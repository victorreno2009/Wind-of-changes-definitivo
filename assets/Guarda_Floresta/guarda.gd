extends StaticBody2D

var refjogador = null
var guardaZeal = "Guarda_Zeal"
var falas = ["Guarda de Zeal: Acha mesmo que tu és confiável para exercer esta missão?", "Guarda de Zeal: Tu não passa de um ladrão!"]
var escolha = 2
var escolha1 = "Ignorar"
var escolha2 = "Matar"
var conversou_npc = false
onready var texture = load("res://assets/Guarda_Floresta/guarda.png")
var boolean = false
var boolean2

func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false:
		refjogador.spawnDialogo(falas, escolha, escolha1, escolha2, guardaZeal)
		boolean = false
		conversou_npc = true

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null

func escolha_boa():
	pass


func escolha_ruim():
	get_node("Sprite").texture = texture
