extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$Barra.play()
	$Parte2/Festival/AnimatedSprite2D.play()
	$Parte2/LaPlata/AnimatedSprite2D.play()
	$Parte2/Rock/AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_barra_frame_changed() -> void:
	if $Barra.frame == 30:
		$Arrastrable.visible = true
		$Destino.visible = true
		$Parte2/Festival/AnimatedSprite2D.visible = false
		$Titila2.visible = true
		$Titila5.visible = true
	if $Barra.frame == 60:
		$Arrastrable2.visible = true
		$Destino2.visible = true
		$Parte2/Rock/AnimatedSprite2D.visible = false
		$Titila3.visible = true
		$Titila6.visible = true
	if $Barra.frame == 90:
		$Arrastrable3.visible = true
		$Destino3.visible = true
		$Parte2/LaPlata/AnimatedSprite2D.visible = false
		$Barra.visible = false
		$Titila4.visible = true
		$Titila7.visible = true

func _on_arrastrable_3_posicionado() -> void:
	$Parte2/LaPlata.visible = false
	$Titila7.visible = false
	$Titila4.visible = false
	barra_aparece()

func _on_arrastrable_2_posicionado() -> void:
	$Parte2/Rock.visible = false
	$Titila6.visible = false
	$Titila3.visible = false
	barra_aparece()

func _on_arrastrable_posicionado() -> void:
	$Parte2/Festival.visible = false
	$Titila5.visible = false
	$Titila2.visible = false
	barra_aparece()

func barra_aparece():
	if $Parte2/LaPlata.visible == false && $Parte2/Rock.visible == false && $Parte2/Festival.visible == false:
		$Loading.play()
		$Loading.visible = true
		$Loading/Timer.start()
		$Parte2/Festival.visible = false
		$Parte2/LaPlata.visible = false
		$Parte2/Rock.visible = false
		$Destino.visible = false
		$Destino2.visible = false
		$Destino3.visible = false
		$Label.visible = false
		$Arrastrable.visible = false
		$Arrastrable2.visible = false
		$Arrastrable3.visible = false

func _on_timer_timeout() -> void:
	$ImagFinal.visible = true
	$Loading.visible = false
	$BotonS.visible = true
	$Titila.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
