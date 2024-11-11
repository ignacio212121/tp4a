extends Node2D

@export var num_linea: int = 0 # número a modo de id, para identificar a qué número de llamada pertenece
@export var estado: String = "esperando" # Define que video se reproducirá, no tiene sentido en los miniatura porque siempre tienen el esperando, pero lo dejo igual
@export var descripcion: String = "..."

var color_linea: Color

# Señal a emitir cuando se hace click en la llamada
signal clickeado 

func _ready():
	#Concatenar el texto "LINEA" con el string del id de la llamada
	actualizar_linea()
	
	iniciar_video()

func actualizar_linea():
	$Linea.text = "LINEA " + str(num_linea)
	$Descripcion.text = descripcion
	actualizar_animacion()

	# Dependiendo del valor de num_linea selecciona el color que le correspondería
	match num_linea:
		1:
			$CallFrameL.modulate = Color("#13DD0F")
			$Descripcion.modulate = Color("#13DD0F")
		2:
			$CallFrameL.modulate = Color("#E8007D")
			$Descripcion.modulate = Color("#E8007D")
		3:
			$CallFrameL.modulate = Color("#0017EC")
			$Descripcion.modulate = Color("#0017EC")
		4:
			$CallFrameL.modulate = Color("#9D08E8")
			$Descripcion.modulate = Color("#9D08E8")
		5:
			$CallFrameL.modulate = Color("#FF3D00")
			$Descripcion.modulate = Color("#FF3D00")

func iniciar_video():
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
