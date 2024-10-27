extends Node2D

@export var num_linea: int = 0 # número a modo de id, para identificar a qué número de llamada pertenece
@export var estado: String = "esperando" # Define que video se reproducirá, no tiene sentido en los miniatura porque siempre tienen el esperando, pero lo dejo igual

var color_linea: Color

# Señal a emitir cuando se hace click en la llamada
signal clickeado 

func _ready():
	#Concatenar el texto "LINEA" con el string del id de la llamada
	$Linea.text = "LINEA " + str(num_linea)
	actualizar_animacion()
	
	# Dependiendo del valor de num_linea selecciona el color que le correspondería
	match num_linea:
		1:
			color_linea = Color("#13DD0F")
		2:
			color_linea = Color("#E8007D")
		3:
			color_linea = Color("#0017EC")
		4:
			color_linea = Color("#9D08E8")
		5:
			color_linea = Color("#FF3D00")

#Cambiar el color cuando el mouse entra en la zona del video
func _on_frame_mouse_entered():
	$Frame.modulate = color_linea

#Volver a gris cuando el cursor sale de la zona
func _on_frame_mouse_exited():
	$Frame.modulate = Color("#666666")

func inciar_video():
	$SubViewport/VideoStreamPlayer.play()
	
#Carga la ruta del video en base al num_linea y al estado (el estado en realidad solo se usaría en los videos de llamada grandes)
func actualizar_animacion():
	$SubViewport/VideoStreamPlayer.stream.set_file("res://assets/videos/llamada_0" + 
	str(num_linea) + "/" + estado + ".ogg")

func cambiar_estado(nuevo_estado):
	estado = nuevo_estado
	actualizar_animacion()

# Al reiniciar detiene la reproducción del video
func reiniciar():
	estado = "esperando"
	$SubViewport/VideoStreamPlayer.stop()

#Comprobar si se hizo click izquierdo, emite la señal "clickeado" y devuelve el valor del num_linea
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		emit_signal("clickeado", num_linea)
