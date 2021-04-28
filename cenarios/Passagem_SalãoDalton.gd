extends Area2D

func _on_Passagem_SalaoDalton_body_entered(body):
	get_tree().change_scene("res://cenarios/salaoDalton.tscn")
