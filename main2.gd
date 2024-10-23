extends Node2D

# Asegúrate de que la ruta sea correcta y que los nodos existan en la escena.
var _MainViewport: SubViewport
var _SubViewport1: SubViewport
var _SubViewport2: SubViewport

func _ready():
	_MainViewport = get_node("ContenedorPrincipal/MainViewport")
	_SubViewport1 = get_node("ContenedorSub1/SubViewport1")
	_SubViewport2 = get_node("ContenedorSub2/SubViewport2")

	# Compartir el mismo mundo 2D entre los SubViewports
	_SubViewport1.world_2d = _MainViewport.world_2d
	_SubViewport2.world_2d = _MainViewport.world_2d

	# Configurar el tamaño de los SubViewports
	_MainViewport.size = Vector2(200, 200)
	_SubViewport1.size = Vector2(1920, 1080)
	_SubViewport2.size = Vector2(1920, 1080)

	# Posicionar los SubViewports dentro del contenedor
	$ContenedorSub1.position = Vector2(0, 0)
	$ContenedorSub2.position = Vector2(1920, 0)
