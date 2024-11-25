extends Node2D

@export var num_linea: int = 0 # número a modo de id, para identificar a qué número de llamada pertenece
@export var actividad: int  = 0  # Define que video se reproducirá, no tiene sentido en los miniatura porque siempre tienen el esperando, pero lo dejo igual
@export var color: Color = ("#ffffff")
var esperando: bool = false

var datos: Array

signal llamada_finalizada
signal instruccion_terminada

func _ready():
	$Elementos/RadioAnimation.play("radio")
	$Elementos/RadioAnimation2.play("radio")

func actualizar_linea(info_llamada):
	datos = info_llamada
	$Elementos/Linea.text = "LINEA " + str(num_linea)
	actualizar_animacion(datos[actividad]["video"])
	$Elementos/Chat.cambiar_titulo(datos[actividad]["titulo"])
	$Elementos.modulate = color
	iniciar_video()

func iniciar_video():
	$SubViewport/VideoStreamPlayer.play()
	
#Carga la ruta del video en base al num_linea y al estado (el estado en realidad solo se usaría en los videos de llamada grandes)
func actualizar_animacion(video_name):
	$SubViewport/VideoStreamPlayer.stream.set_file("res://assets/videos/llamada_0" + 
	str(num_linea) + "/" + str(video_name) + ".ogv")


func _on_video_stream_player_finished():
	if not esperando:
		$Elementos/Chat.nuevo_mensaje_chat("[MensajeDeUsuario]" + datos[actividad]["mensaje_usuario"] + "\n")
		esperando = true
		actualizar_animacion("esperando")
		iniciar_video()
		$SubViewport/VideoStreamPlayer.loop = true
		emit_signal("instruccion_terminada")

func siguiente_actividad():
	$Elementos/Chat.nuevo_mensaje_chat("[CodigoCreativo.IA]" + datos[actividad]["respuesta_ia"] + "\n")
	actividad += 1
	esperando = false
	if actividad >= datos.size():
		emit_signal("llamada_finalizada")
	else:
		$SubViewport/VideoStreamPlayer.loop = false
		$Elementos/Chat.cambiar_titulo(datos[actividad]["titulo"])
		actualizar_animacion(datos[actividad]["video"])
		iniciar_video()
