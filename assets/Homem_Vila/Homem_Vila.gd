extends StaticBody2D

var refjogador = null
var Homem_Vila = "Homem_Vila"
var falas = ["Homem: Senhor, preciso de ajuda para organizar minhas ferramentas de trabalho, podes ajudar?"]
var escolha = 1
var escolha1 = "Organizar"
var escolha2 = "Roubar"
var conversou_npc = false
var boolean = false
var boolean2

func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false:
		refjogador.spawnDialogo(falas, escolha, escolha1, escolha2, Homem_Vila)
		boolean = false
		conversou_npc = true


func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null
	
func escolha_boa():
	$Label.text = "Obrigado"
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""

func escolha_ruim():
	$Label.text = "Ladrão"
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""
