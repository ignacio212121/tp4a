extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	aparezco()

func _on_arrastrable_posicionado() -> void:
	$Frames/Arrastrable.visible = false
	$FramesDestino/Destino.visible = false
	$Frames/FrameAnim1.visible = true
	$Frames/Titila1.visible = false
	aparezco()

func _on_arrastrable_2_posicionado() -> void:
	$Frames/Arrastrable2.visible = false
	$FramesDestino/Destino2.visible = false
	$Frames/FrameAnim2.visible = true
	$Frames/Titila2.visible = false
	aparezco()

func _on_arrastrable_3_posicionado() -> void:
	$Frames/Arrastrable3.visible = false
	$FramesDestino/Destino3.visible = false
	$Frames/FrameAnim3.visible = true
	$Frames/Titila3.visible = false
	aparezco()

func aparezco():
	if $Frames/FrameAnim1.visible == true && $Frames/FrameAnim2.visible == true && $Frames/FrameAnim3.visible == true:
		$Info.visible = true
		$BotonS.visible = true
		$Arrastrar.visible = false
		$Titila.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
