extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Linea1.num_linea = 1
	$Linea1.actualizar_linea()
	$Linea1.cambiar_estado("esperando")
	
	$Linea2.num_linea = 2
	$Linea2.actualizar_linea()
	$Linea2.cambiar_estado("esperando")
	
	$Linea3.num_linea = 3
	$Linea3.actualizar_linea()
	$Linea3.cambiar_estado("esperando")
	
	$Linea4.num_linea = 4
	$Linea4.actualizar_linea()
	$Linea4.cambiar_estado("esperando")
	
	$Linea5.num_linea = 5
	$Linea5.actualizar_linea()
	$Linea5.cambiar_estado("esperando")
	
	$Linea1.iniciar_video()
	$Linea2.iniciar_video()
	$Linea3.iniciar_video()
	$Linea4.iniciar_video()
	$Linea5.iniciar_video()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
