extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play()
	$Arrastrar.modulate = ("#13dd0f")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_arrastrable_posicionado() -> void:
	$EncuestaUno.visible = true
	$CarpetaUnoBien.visible = true
	$Arrastrable.visible = false
	$Destino.visible = false
	boton()

func _on_arrastrable_2_posicionado() -> void:
	$EncuestaDos.visible = true
	$CarpetaDosBien.visible = true
	$Arrastrable2.visible = false
	$Destino2.visible = false
	boton()

func boton():
	if $CarpetaUnoBien.visible == true && $CarpetaDosBien.visible == true:
		$Arrastrar.visible = false
		$Tiempo.start()

func _on_tiempo_timeout() -> void:
	$Info.visible = true
	$BotonS.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
