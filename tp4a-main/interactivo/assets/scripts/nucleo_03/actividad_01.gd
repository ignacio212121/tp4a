extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_arrastrable_posicionado() -> void:
	$Frames/Arrastrable.visible = false
	$FramesDestino/Destino.visible = false
	$FramesDestino/FrameAnim1.visible = true
	$Frames/Titila1.visible = false
	aparezco()

func _on_arrastrable_2_posicionado() -> void:
	$Frames/Arrastrable2.visible = false
	$FramesDestino/Destino2.visible = false
	$FramesDestino/FrameAnim2.visible = true
	$Frames/Titila2.visible = false
	aparezco()

func _on_arrastrable_3_posicionado() -> void:
	$Frames/Arrastrable3.visible = false
	$FramesDestino/Destino3.visible = false
	$FramesDestino/FrameAnim3.visible = true
	$Frames/Titila3.visible = false
	aparezco()

func aparezco():
	if $FramesDestino/FrameAnim1.visible == true && $FramesDestino/FrameAnim2.visible == true && $FramesDestino/FrameAnim3.visible == true:
		$Info.visible = true
		$Arrastrar.visible = false
		$Sprite2D.visible = true
		$Frame1.visible = true
		$Frame2.visible = true
		$Frame3.visible = true
		$Timer.start()

func _on_timer_timeout() -> void:
	emit_signal("actividad_terminada")
