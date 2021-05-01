extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 1.5

func _ready():
	
	$AnimatedSprite.play("Walk left")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial 
	
	

func _process(_delta):
	
	if(posicao_inicial <= posicao_final and flip):
		#$".".position.x += velocidade
		$AnimatedSprite.play("Up")
		$AnimatedSprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = true

	
	if($".".position.x == posicao_inicial and !flip):
		$".".position.x += velocidade
		$AnimatedSprite.flip_h = false
		if($".".position.x <= posicao_inicial):
			flip = false
			$AnimatedSprite.play("Up")
