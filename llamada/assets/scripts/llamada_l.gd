extends Node2D

@export var num_linea: int = 0 # número a modo de id, para identificar a qué número de llamada pertenece
@export var estado: String = "esperando" # Define que video se reproducirá, no tiene sentido en los miniatura porque siempre tienen el esperando, pero lo dejo igual
@export var descripcion: String = "..."

var color_linea: Color

func _ready():
	#Concatenar el texto "LINEA" con el string del id de la llamada
	actualizar_linea()
	
	iniciar_video()
	
	$RadioAnimation.play("radio")
	$RadioAnimation2.play("radio")

func actualizar_linea():
	$Linea.text = "LINEA " + str(num_linea)
	actualizar_animacion()

	# Dependiendo del valor de num_linea selecciona el color que le correspondería
	match num_linea:
		1:
			$CallFrameL.modulate = Color("#13DD0F")
			$RadioAnimation.self_modulate = Color("#13DD0F")
			$RadioAnimation.modulate = Color("#13DD0F")
			$RadioAnimation2.self_modulate = Color("#13DD0F")
			$RadioAnimation2.modulate = Color("#13DD0F")
			$Escribiendo.play("uno")
			$Chat.modulate = Color("#13DD0F")
		2:
			$CallFrameL.modulate = Color("#E8007D")
			$RadioAnimation.self_modulate = Color("#fe0089")
			$RadioAnimation.modulate = Color("#ffffff")
			$RadioAnimation2.self_modulate = Color("#fe0089")
			$RadioAnimation2.modulate = Color("#ffffff")
			$Escribiendo.play("dos")
			$Chat.modulate = Color("#E8007D")
		3:
			$CallFrameL.modulate = Color("#0017EC")
			$RadioAnimation.self_modulate = Color("#ffffff")
			$RadioAnimation.modulate = Color("#0018f1")
			$RadioAnimation2.self_modulate = Color("#ffffff")
			$RadioAnimation2.modulate = Color("#0018f1")
			$Escribiendo.play("tres")
			$Chat.modulate = Color("#0017EC")
		4:
			$CallFrameL.modulate = Color("#9D08E8")
			$RadioAnimation.self_modulate = Color("#ffffff")
			$RadioAnimation.modulate = Color("#ac0dfd")
			$RadioAnimation2.self_modulate = Color("#ffffff")
			$RadioAnimation2.modulate = Color("#ac0dfd")
			$Escribiendo.play("cuatro")
			$Chat.modulate = Color("#9D08E8")
		5:
			$CallFrameL.modulate = Color("#FF3D00")
			$RadioAnimation.self_modulate = Color("#ff3d00")
			$RadioAnimation.modulate = Color("#ff6644")
			$RadioAnimation2.self_modulate = Color("#ff3d00")
			$RadioAnimation2.modulate = Color("#ff6644")
			$Escribiendo.play("cinco")
			$Chat.modulate = Color("#FF3D00")

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
