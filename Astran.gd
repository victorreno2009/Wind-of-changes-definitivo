extends KinematicBody2D
onready var cenaDialogo = load("res://DialogBox/Main.tscn")

export var velocidade_andar = 60
var pos = "Idle_Up"

var movement = Vector2(0,0)

func _ready():
	Serial.connect("Cima", self, "update_moviment")
	Serial.connect("Baixo", self, "update_moviment")
	Serial.connect("Esquerda", self, "update_moviment")
	Serial.connect("Direita", self, "update_moviment")
	

func update_moviment(tipo):
	movement = Vector2(0,0);		
	if (tipo == "Baixo"):
		movement.y = velocidade_andar
	elif (tipo == "Cima"):
		movement.y = - velocidade_andar
	elif (tipo == "Esquerda"):
		movement.x = - velocidade_andar
	elif (tipo == "Direita"):
		movement.x = velocidade_andar

		
	move_and_slide(movement,Vector2.UP)
	
	update_animation()
	
	
	
		

func update_animation():
	if movement.x > 0:
		$AnimatedSprite.scale.x = -1
	elif movement.x < 0:
		$AnimatedSprite.scale.x = 1
		
	if movement.y == 0 and abs(movement.x) > 0:
		$AnimatedSprite.play("Walk_Left")
		pos = "Idle_Left"
	if movement.y > 0 and movement.x == 0:
		$AnimatedSprite.play("Walk_Down")
		pos = "Idle_Down"
	elif movement.y < 0 and movement.x == 0:
		$AnimatedSprite.play("Walk_Up")
		pos = "Idle_Up"
	elif movement.y == 0 and movement.x == 0: 
		$AnimatedSprite.play(pos)
	print(movement)
		# $AnimatedSprite.play("Walk_Up")
		# $AnimatedSprite.play("Walk_Down")

func spawnDialogo(dialog, escolha, escolha1, escolha2, NPC1):
	var dialogBox = cenaDialogo.instance()
	$CanvasLayer.add_child(dialogBox)
	dialogBox.get_node("DialogBox").getDialog(dialog, escolha, escolha1, escolha2, NPC1)

func spawnDialog(dialog, escolha):
	var dialogBox = cenaDialogo.instance()
	$CanvasLayer.add_child(dialogBox)
	dialogBox.get_node("DialogBox").getDialogo(dialog, escolha)
