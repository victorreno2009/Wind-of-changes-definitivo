extends Control

func _on_Button_Start_pressed():
	get_tree().change_scene("res://Tela_prologo.tscn")


func _on_Button_Quit_pressed():
	get_tree().quit()
