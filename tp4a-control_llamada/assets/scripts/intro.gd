extends Node

var estado: String = "null"

signal linea_elegida

func _ready():
	actualizar_estado()

func _process(delta):
	if estado == "inicio":
		#Si se encunetra en el estado de inicio, muestra el tiempo restante para que empiece el video de intro
		$Frame/Label.text = str(round($TimerEmpezar.time_left))

func actualizar_estado():
	if estado == "inicio":
		$Frame.visible = true
		$Frame/Label.visible = true
		$TimerEmpezar.start()

# Con un timer en 3 segundos para dar tiempo de preparación, se podría reemplazar por un click
func _on_timer_empezar_timeout():
	estado = "introduccion"
	$Frame/Label.visible = false
	$Inicio1.visible = true
	$Inicio1/SubViewport/VideoStreamPlayer.play()

# Cuando termina de reproducirse el video de introducción, cambia el estado y oculta la primera pantalla
func _on_video_stream_player_finished():
	$Inicio1.visible = false
	$Inicio2.visible = true
	estado = "conectando_audio"

# Al apretar el botón de la segunda pantalla, no es la mejor manera de iniciar todo, pero la dejo por ahora
func _on_conectar_audio_pressed():
	$Frame.visible = false
	$Inicio2.visible = false
	$Inicio3.visible = true
	#for i in $Inicio3/Lineas.get_child_count():
		#$Inicio3/Lineas.get_children()[i].actualizar_animacion()
		#$Inicio3/Lineas.get_children()[i].iniciar_video()
	$Inicio3/Lineas/Linea1.actualizar_linea()
	$Inicio3/Lineas/Linea2.actualizar_linea()
	$Inicio3/Lineas/Linea3.actualizar_linea()
	$Inicio3/Lineas/Linea4.actualizar_linea()
	$Inicio3/Lineas/Linea5.actualizar_linea()
	$Inicio3/Lineas/Linea1.iniciar_video()
	$Inicio3/Lineas/Linea2.iniciar_video()
	$Inicio3/Lineas/Linea3.iniciar_video()
	$Inicio3/Lineas/Linea4.iniciar_video()
	$Inicio3/Lineas/Linea5.iniciar_video()
	estado = "seleccionar_llamada"

# Reinicio a lo bruto (temporal), detiene las animaciones, pone en invisible todo y reinicia su estado
func reiniciar():
	$Inicio1.visible = false
	$Inicio1/SubViewport/VideoStreamPlayer.stop()
	$Inicio2.visible = false
	$Inicio3.visible = false
	#for linea in $Inicio3/Lineas.get_children():
		#linea.reiniciar()
	$Inicio3/Lineas/Linea1.reiniciar()
	$Inicio3/Lineas/Linea2.reiniciar()
	$Inicio3/Lineas/Linea3.reiniciar()
	$Inicio3/Lineas/Linea4.reiniciar()
	$Inicio3/Lineas/Linea5.reiniciar()
	estado = "inicio"
	actualizar_estado()

#Al apretar las lineas estas devuelven su número
func _on_linea_clickeado(num_linea):
	emit_signal("linea_elegida", num_linea)

func detener_videos():
	#for linea in $Inicio3/Lineas.get_children():
		#linea.detener_video()
	$Inicio3/Lineas/Linea1.detener_video()
	$Inicio3/Lineas/Linea2.detener_video()
	$Inicio3/Lineas/Linea3.detener_video()
	$Inicio3/Lineas/Linea4.detener_video()
	$Inicio3/Lineas/Linea5.detener_video()
