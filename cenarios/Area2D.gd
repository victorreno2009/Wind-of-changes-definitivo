extends Area2D
var boolean = false

func _process(delta):
	var inpt = Input.is_action_pressed("ui_accept")
	if inpt and boolean:
		get_parent().get_node("Astran/Control").show()

func _on_Area2D_body_entered(body):
	boolean = true

func _on_Area2D_body_exited(body):
	boolean = false
