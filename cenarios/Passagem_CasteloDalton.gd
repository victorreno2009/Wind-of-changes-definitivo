extends Area2D

func _on_Passagem_CasteloDalton_body_entered(body):
	get_tree().change_scene("res://cenarios/castelo.tscn")
