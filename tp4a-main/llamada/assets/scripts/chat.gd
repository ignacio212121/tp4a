extends Node

@export var color: Color = Color("#ffffff")


var titulo = "USO DE IA EN EMPRESAS"
var chat = "NombreDelJuego v2.4\n[Sistema] Cargando Chat...\n"
var current_index_chat = 0
var current_line_chat = 0
var current_index_titulo = 0
var current_line_titulo = 0

func _ready() -> void:
	$LabelTitulo.text = ""
	$Titulo.modulate = color
	$Chat.modulate = color
	$LabelTitulo.modulate = color	
	$TimerChat.start()
	$TimerTitulo.start()

func _on_timer_chat_timeout() -> void:
	if current_index_chat < chat.length():
		$RichTextLabel.text += chat[current_index_chat]
		current_index_chat += 1

func _on_timer_titulo_timeout() -> void:
	if current_line_titulo == 0:
		if current_index_titulo < titulo.length():
			$LabelTitulo.text += titulo[current_index_titulo]
			current_index_titulo += 1

func cambiar_titulo(nuevo_titulo):
	current_index_titulo = 0
	$LabelTitulo.text = ""
	titulo = nuevo_titulo

func nuevo_mensaje_chat(mensaje):
	chat += mensaje
