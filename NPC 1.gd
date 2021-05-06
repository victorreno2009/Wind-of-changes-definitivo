extends StaticBody2D


var refjogador = null
var NPC1 = "NPC1"
var falas = ["Mulher: Caro senhor, tu podes me ajudar a levantar esta mercadoria?"]
var escolha = 1
var escolha1 = "Ajudar"
var escolha2 = "Roubar mercadoria"
var boolean = false
var boolean2
var conversou_npc = false


func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false:
		refjogador.spawnDialogo(falas, escolha, escolha1, escolha2, NPC1)
		boolean = false
		conversou_npc = true

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null

func escolha_boa():
	$Label.text = "Obrigada!"
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""

func escolha_ruim():
	$Label.text = "Socorro!"
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""
