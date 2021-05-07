extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var  text = ""

signal Cima()
signal Baixo()
signal Esquerda()
signal Direita()


func _ready():
	open()
	pass
	
func _exit_tree():
	close()

func open():
	is_port_open = serial_port.open_port("/dev/ttyUSB0", 38400)
	print(is_port_open)
	
func write(text):
	serial_port.write_text(text)
	
func close():
	is_port_open = false
	serial_port.close_port()

func _process(delta):
	if is_port_open:
		var t = serial_port.read_text()
		
		if t.length() > 0:
			for c in t:
				if c == "\n":
					on_text_received(text)
					text = ""
				else:
					text+=c

func on_text_received(text):
	var command_array = text
	if str(command_array) == "Cima":
		emit_signal("Cima", command_array)
	elif command_array == "Baixo":
		emit_signal("Baixo", command_array)
	elif command_array == "Esquerda":
		emit_signal("Esquerda", command_array)
	else:
		emit_signal("Direita", command_array)
