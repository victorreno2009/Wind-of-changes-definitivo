extends Control

var dialog = []
var fraseEscolhida
var dialog_index = 0
var finished = false
var bol = false

func getDialog(dialogue, escolha):
	dialog = dialogue
	fraseEscolhida = escolha 
	print(dialog)
	load_dialog()

func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("Interact"):
		load_dialog()
	if dialog_index - 1 == fraseEscolhida and bol == false:
		print("buttons.show")
		bol = true
	elif dialog_index - 1 != fraseEscolhida and bol == true:
		print('saiu')
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
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
