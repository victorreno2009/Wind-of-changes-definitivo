extends Control

var dialog = []
var fraseEscolhida
var dialog_index = 0
var falasdialog = false
var finished = false
onready var button1 = get_node("Button1")
onready var button2 = get_node("Button2")
var npcAtual
var bol = false

func getDialog(dialogue, escolha, escolha1, escolha2, NPC1):
	dialog = dialogue
	fraseEscolhida = escolha 
	print(dialog)
	load_dialog()
	button1.text = escolha1
	button2.text = escolha2
	npcAtual = NPC1
	falasdialog = true
	
func getDialogo(dialogue, escolha):
	dialog = dialogue
	fraseEscolhida = escolha 
	print(dialog)
	load_dialogo()


func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("Interact"):
		load_dialog()
	if dialog_index - 1 == fraseEscolhida and bol == false:
		if falasdialog == true:
			
			print("buttons.show")
			button1.show()
			button2.show()
			$TextureRect.hide()
			$RichTextLabel.hide()
			$"next-indicator".hide()
			bol = true
		else:
			queue_free()
	elif dialog_index - 1 != fraseEscolhida and bol == true:
		print('saiu')
		button1.hide()
		button2.hide()
		bol = false

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	
	
	dialog_index += 1

func load_dialogo():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	
	
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true


func _on_Button1_pressed():
	get_tree().call_group(npcAtual, "escolha_boa")
	queue_free()


func _on_Button2_pressed():
	get_tree().call_group(npcAtual, "escolha_ruim")
	queue_free()
