extends Node

@export var estado: String = "intro"
@export var pantalla_llamadas: Array = [0, 0, 0, 0, 0]


# Al apretar la 'r' o 'R' se reiniciaría el interactivo
func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		pantalla_llamadas = [0, 0, 0, 0, 0]
		$Intro.reiniciar()
		$InterfazLlamadas.reiniciar()
		$InterfazLlamadas.visible = false
		$Intro.visible = true

func _ready():
	match estado:
		"intro":
			$Intro.visible = true
			$Intro.estado = "inicio"
			$Intro.actualizar_estado()


func _on_intro_linea_elegida(num_linea):
	$Intro.detener_videos()
	$Intro.visible = false
	actualizar_llamada_en_curso(num_linea)

func actualizar_llamada_en_curso(num_linea):
	$InterfazLlamadas.num_linea = num_linea
	$InterfazLlamadas.num_pantalla = pantalla_llamadas[num_linea - 1]
	match num_linea:
		1:
			$InterfazLlamadas.llamadas_espera = [2, 3, 4, 5]
		2:
			$InterfazLlamadas.llamadas_espera = [1, 3, 4, 5]
		3:
			$InterfazLlamadas.llamadas_espera = [1, 2, 4, 5]
		4:
			$InterfazLlamadas.llamadas_espera = [1, 2, 3, 5]
		5:
			$InterfazLlamadas.llamadas_espera = [1, 2, 3, 4]
	$InterfazLlamadas.actualizar_linea()
	$InterfazLlamadas.inciar_videos()
	$InterfazLlamadas.visible = true
