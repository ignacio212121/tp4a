extends Node2D

@export var num_linea: int = 0 # número a modo de id, para identificar a qué número de llamada pertenece
@export var video_path: String

@export var color: Color = ("#ffffff")

# Señal a emitir cuando se hace click en la llamada
signal clickeado 


func actualizar_linea():
	$Linea.text = "LINEA " + str(num_linea)
	$SubViewport/VideoStreamPlayer.stream.set_file(video_path)
	#iniciar_video()

#Cambiar el color cuando el mouse entra en la zona del video
func _on_frame_mouse_entered():
	$Frame.modulate = color

#Volver a gris cuando el cursor sale de la zona
func _on_frame_mouse_exited():
	$Frame.modulate = Color("#666666")

func iniciar_video():
	$SubViewport/VideoStreamPlayer.play()

func detener_video():
	$SubViewport/VideoStreamPlayer.stop()

# Al reiniciar detiene la reproducción del video
func reiniciar():
	$SubViewport/VideoStreamPlayer.stop()
	$SubViewport/VideoStreamPlayer.stream = null

#Comprobar si se hizo click izquierdo, emite la señal "clickeado" y devuelve el valor del num_linea
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		emit_signal("clickeado", num_linea, self)
