extends Area2D


func _on_Passagem_Floresta_body_entered(body):
	get_tree().change_scene("res://cenarios/florestaEscura.tscn")


