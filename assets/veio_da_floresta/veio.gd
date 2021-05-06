extends StaticBody2D
var refjogador = null
var velho = "veioDaFloresta"
var falas = ["Velho: Estou com fome...", "Velho: Preciso de algo para comer, por favor!"]
var escolha = 2
var escolha1 = "Dar a cesta de alimentos"
var escolha2 = "Ignorar"
var conversou_npc = false
var boolean = false
var boolean2

func _process(delta):
	var inpt = Input.is_action_pressed("Interact")
	if inpt and boolean and conversou_npc == false:
		refjogador.spawnDialogo(falas, escolha, escolha1, escolha2, velho)
		boolean = false
		conversou_npc = true

func _on_Area2D_body_entered(body):
	boolean = true
	refjogador = body

func _on_Area2D_body_exited(body):
	boolean = false
	refjogador = null

func escolha_boa():
	$Label.text = "Muito agradecido, caro senhor."
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""


func escolha_ruim():
	$Label.text = "..."
	yield(get_tree().create_timer(3), "timeout")
	$Label.text = ""
